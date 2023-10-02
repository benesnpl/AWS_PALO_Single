#Create VPC

resource "aws_vpc" "main_vpc" {
  cidr_block       					            = var.vpc_cidr
  tags = {
    Name                                        =  join("", [var.coid, "-", var.aws_region, "-vpc00-fw"])
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnets_cidr_public
  availability_zone = var.azs
  map_public_ip_on_launch = true
  tags = {
        Name                                        = join("", [var.coid, "-", var.aws_region, "-Public", "-AZ1"])
  }
}

resource "aws_subnet" "Private" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnets_cidr_private
  availability_zone = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name                                        = join("", [var.coid, "-", var.aws_region, "-Private", "-AZ1"])
  }
}

resource "aws_subnet" "MNG" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnets_cidr_mng
  availability_zone = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name                                        = join("", [var.coid, "-", var.aws_region, "-Management", "-AZ1"])
  }
}

resource "aws_subnet" "TGW" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnets_cidr_tgw
  availability_zone = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name                                        = join("", [var.coid, "-", var.aws_region, "-TGW", "-AZ1"])
  }
}

resource "aws_subnet" "ha" {
  vpc_id                                        = aws_vpc.main_vpc.id
  cidr_block                                    = var.subnets_cidr_ha
  availability_zone                             = var.azs
  map_public_ip_on_launch                       = false
  tags = {
    Name                                        = join("", [var.coid, "-", var.aws_region, "-HA"])
  }
}
