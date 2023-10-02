resource "aws_customer_gateway" "oakbrook" {
  bgp_asn                                       = 65000
  ip_address                                    = var.il_external
  type                                          = "ipsec.1"

  tags = {
    Name                                        = join("", [var.coid, "-", var.aws_region, "-CGW"])
  }
  }

resource "aws_vpn_connection" "Oakbrook" {
  transit_gateway_id                            = aws_ec2_transit_gateway.main_tgw.id
  customer_gateway_id                           = aws_customer_gateway.oakbrook.id
  type                                          = "ipsec.1"
  static_routes_only                            = true
  tags = {
    Name                                        = join("", [var.coid, "-", var.aws_region, "-ipsec"])
  }
}

data "aws_ec2_transit_gateway_vpn_attachment" "oak_attach" {
  depends_on                                    = [aws_vpn_connection.Oakbrook, aws_ec2_transit_gateway.main_tgw]
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  vpn_connection_id  = aws_vpn_connection.Oakbrook.id
  tags = {
   Name                                                 = join("", [var.coid, "-Oakbrook-VPN"])
  }
}
