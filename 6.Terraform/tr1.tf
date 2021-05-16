provider "aws" {
    shared_credentials_file = "/home/sergey/.aws/credentials"
    profile                 = "default"
    region                  = "us-west-2"
}

resource "aws_vpc" "My_terraform_VPC" {
    cidr_block           = "10.0.0.0/16"
    instance_tenancy     = "default"
    enable_dns_support   = true
    enable_dns_hostnames = false

    tags = {
        Name = "VPC"
    }
}

resource "aws_subnet" "Public_Subnet_A" {
    vpc_id                  = aws_vpc.My_terraform_VPC.id
    cidr_block              = "10.0.10.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-west-2a"
    tags = {
        Name = "Public-Subnet-A"
    }
}

resource "aws_subnet" "Public_Subnet_B" {
    vpc_id                  = aws_vpc.My_terraform_VPC.id
    cidr_block              = "10.0.20.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-west-2b"
    tags = {
        Name = "Public-Subnet-B"
    }
}

resource "aws_subnet" "Private_Subnet" {
    vpc_id                  = aws_vpc.My_terraform_VPC.id
    cidr_block              = "10.0.11.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-west-2a"
    tags = {
        Name = "Private-Subnet"
    }
}

resource "aws_security_group" "web-sg-tf" {
    vpc_id       = aws_vpc.My_terraform_VPC.id
    name         = "web-sg-tf"
    description  = "My VPC Security Group"

    # allow ingress of SSH
    ingress {
        cidr_blocks = ["37.214.32.242/32"]
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
    }

    # allow ingress of HTTP/HTTPS
    ingress {
        cidr_blocks = ["37.214.32.242/32"]
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
    }

    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    # allow egress of all ports
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "web-sg-tf"
    }
}
resource "aws_instance" "ubuntu1" {
  ami                    = "ami-0cf6f5c8a62fa5da6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web-sg-tf.id}"]
  subnet_id     = "${aws_subnet.Public_Subnet_A.id}"
}
resource "aws_instance" "ubuntu2" {
  ami                    = "ami-0cf6f5c8a62fa5da6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web-sg-tf.id}"]
  subnet_id     = "${aws_subnet.Public_Subnet_A.id}"
}

resource "aws_network_acl" "My_Public_ACL" {
    vpc_id = aws_vpc.My_terraform_VPC.id
    subnet_ids = [ aws_subnet.Public_Subnet_A.id, aws_subnet.Public_Subnet_B.id ]

    ingress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    egress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    tags = {
        Name = "My Public ACL"
    }
}

resource "aws_network_acl" "My_Private_ACL" {
    vpc_id = aws_vpc.My_terraform_VPC.id
    subnet_ids = [ aws_subnet.Private_Subnet.id ]

    ingress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 0
        to_port    = 0
    }

    egress {
        protocol   = "tcp"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    tags = {
        Name = "My Private ACL"
    }
}

resource "aws_internet_gateway" "My_VPC_GW" {
    vpc_id = aws_vpc.My_terraform_VPC.id

    tags = {
        Name = "My VPC Internet Gateway"
    }
}

resource "aws_route_table" "My_Public_RT" {
    vpc_id = aws_vpc.My_terraform_VPC.id
    tags = {
        Name = "My Public Route Table"
    }
}

resource "aws_route_table" "My_Private_RT" {
    vpc_id = aws_vpc.My_terraform_VPC.id
    tags = {
        Name = "My Private Route Table"
    }
}

resource "aws_route" "My_terraform_VPC_internet_access" {
    route_table_id         = aws_route_table.My_Public_RT.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.My_VPC_GW.id
}

resource "aws_route_table_association" "My_Public_association_A" {
    subnet_id      = aws_subnet.Public_Subnet_A.id
    route_table_id = aws_route_table.My_Public_RT.id
}

resource "aws_route_table_association" "My_Public_association_B" {
    subnet_id      = aws_subnet.Public_Subnet_B.id
    route_table_id = aws_route_table.My_Public_RT.id
}

resource "aws_route_table_association" "My_Private_association" {
    subnet_id      = aws_subnet.Private_Subnet.id
    route_table_id = aws_route_table.My_Private_RT.id
}
