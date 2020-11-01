# create security group
resource "aws_security_group" "joohyun-app-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-app-sg"
 
    tags = {
        Name = "joohyun-app-sg"
    }
 
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
 
resource "aws_security_group" "joohyun-public-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-public-sg"
     
    tags = {
        Name = "joohyun-public-sg"
    }
   
    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
   
    ingress {
      description = "ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["61.34.245.204/32"]
    }
   
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }
 
 
resource "aws_security_group" "joohyun-bastion-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-bastion-sg"
 
    tags = {
        Name = "joohyun-bastion-sg"
    }
   
    ingress {
      description = "gsitm office 1"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["61.34.245.204/32"]
    }
   
    ingress {
      description = "gsitm office 2"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["58.124.137.165/32"]
    }
   
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }
 
   
resource "aws_security_group" "joohyun-db-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-db-sg"
 
    tags = {
        Name = "joohyun-db-sg"
    }
   
    ingress {
      description = "local"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["50.0.0.0/22"]
    }
   
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }
   
  resource "aws_security_group" "joohyun-efs-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-efs-sg"
 
    tags = {
        Name = "joohyun-efs-sg"
    }
   
    ingress {
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = ["50.0.0.0/22"]
    }
   
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }
 
 
  resource "aws_security_group" "joohyun-nlb-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-nlb-sg"
 
    tags = {
        Name = "joohyun-nlb-sg"
    }
   
    ingress {
      description = "stfp"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["61.34.245.204/32"]
    }
   
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }
 
  resource "aws_security_group" "joohyun-jenkins-sg" {
    vpc_id      = "${aws_vpc.joohyun-vpc.id}"
    name        = "joohyun-jenkins-sg"
 
    tags = {
        Name = "joohyun-jenkins-sg"
    }
   
    ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
   
    ingress {
      description = "gsitm-cicd-vpc"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = ["10.0.0.0/24"]
    }
   
    ingress {
      description = "office"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["61.34.245.204/32"]
    }
   
    ingress {
      description = "office"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["58.124.137.165/32"]
    }
   
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  }
 
#joohyun-app-sg
resource "aws_security_group_rule" "joohyun-app-sg-rule-1" {
  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = -1
  description = "dmz"
 
  security_group_id        = "${aws_security_group.joohyun-app-sg.id}"
  source_security_group_id = "${aws_security_group.joohyun-public-sg.id}"
 
  lifecycle { create_before_destroy = true }
}
 
resource "aws_security_group_rule" "joohyun-app-sg-rule-2" {
    type      = "ingress"
    from_port = 0
    to_port   = 0
    protocol  = -1
    description = "nlb"
   
    security_group_id        = "${aws_security_group.joohyun-app-sg.id}"
    source_security_group_id = "${aws_security_group.joohyun-nlb-sg.id}"
 
    lifecycle { create_before_destroy = true }
  }
 
resource "aws_security_group_rule" "joohyun-app-sg-rule-3" {
    type      = "ingress"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    description = "ssh for bastion"
   
    security_group_id        = "${aws_security_group.joohyun-app-sg.id}"
    source_security_group_id = "${aws_security_group.joohyun-bastion-sg.id}"
 
    lifecycle { create_before_destroy = true }
  }
 
 
#joohyun-public-sg
resource "aws_security_group_rule" "joohyun-public-sg-rule-1" {
    type      = "ingress"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    description = "bastion ssh"
 
    security_group_id        = "${aws_security_group.joohyun-public-sg.id}"
    source_security_group_id = "${aws_security_group.joohyun-bastion-sg.id}"
   
    lifecycle { create_before_destroy = true }
  }
   
 
#joohyun-db-sg
resource "aws_security_group_rule" "joohyun-db-sg-rule-1" {
    type      = "ingress"
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    description = "mariadb connection for app"
 
    security_group_id        = "${aws_security_group.joohyun-db-sg.id}"
    source_security_group_id = "${aws_security_group.joohyun-app-sg.id}"
   
    lifecycle { create_before_destroy = true }
  }
 
 
#joohyun-efs-sg
resource "aws_security_group_rule" "joohyun-efs-sg-rule-1" {
    type      = "ingress"
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
 
    security_group_id        = "${aws_security_group.joohyun-efs-sg.id}"
    source_security_group_id = "${aws_security_group.joohyun-app-sg.id}"
   
    lifecycle { create_before_destroy = true }
  }