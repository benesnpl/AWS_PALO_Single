variable "aws_region" {
	default = "us-west-2"
}

#MAKE SURE TO UPDATE REGION BASED ON ABOVE SELECTION
variable "azs" {
	default = "us-west-2a"
}

#CIDR FOR HUB ACCOUNT
variable "vpc_cidr" {
	default = "10.160.205.0/24"
}

variable "coid" {
	default = "FERR"
}

#m5.xlarge for VM-100 and VM-300
#m5.2xlarge for VM-500
variable "instance_type" {
	default = "m5.xlarge"
}

variable "rules_inbound_public_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "rules_outbound_public_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "rules_inbound_private_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12","100.70.0.0/15"]
    }
    ]
}

variable "rules_outbound_private_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "rules_inbound_mgmt_sg" {
  default = [
  
    {
      port = 0
      proto = "-1"
      cidr_block = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12","100.70.0.0/15","52.147.201.44/32","207.223.34.132/32"]
    }
    ]
}

variable "rules_outbound_mgmt_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "subnets_cidr_public" {
	default = "10.160.205.128/25"
}

variable "subnets_cidr_private" {
	default = "10.160.205.16/28"
}

variable "subnets_cidr_mng" {
	default = "10.160.205.0/28"
}

variable "subnets_cidr_tgw" {
	default = "10.160.205.32/28"
}

variable "subnets_cidr_ha" {
	default = "10.160.205.48/28"
}

variable "mgm_ip_address1" {
	default = "10.160.205.5"
}

#FLOAT IP FOR EXTERNAL INTERFACE
variable "public_eni_1" {
	default = "10.160.205.132"
}

#FLOAT IP FOR INTERNAL INTERFACE
variable "private_eni_1" {
	default = "10.160.205.20"
}

variable "ha_eni_1" {
	default = "10.160.205.52"
}

variable "aws_access_key_id" {
	default = ""
}

variable "aws_secret_access_key" {
	default = ""
}

#OAKBROOK VPN TUNNEL IP
variable "il_external" {
	default = "207.223.34.132"
}

variable "ssh_key_name" {
	default = "firewall"
}
