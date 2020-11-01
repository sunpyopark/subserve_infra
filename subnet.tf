resource "aws_subnet" "joohyun-subnet-pri-2a-1" {
  vpc_id                  = aws_vpc.joohyun-vpc.id
  cidr_block              = "50.0.1.0/25"
  map_public_ip_on_launch = false
  availability_zone       = "us-west-1b"
  tags = {
   Name = "joohyun-subnet-pri-2a-1"
  }
}
 
resource "aws_subnet" "joohyun-subnet-pub-2a-1" {
  vpc_id                  = aws_vpc.joohyun-vpc.id
  cidr_block              = "50.0.0.0/25"
  map_public_ip_on_launch = false
  availability_zone       = "us-west-1b"
  tags = {
   Name = "joohyun-subnet-pub-2a-1"
  }
}
 
resource "aws_subnet" "joohyun-subnet-pub-2c-1" {
  vpc_id                  = aws_vpc.joohyun-vpc.id
  cidr_block              = "50.0.0.128/25"
  map_public_ip_on_launch = false
  availability_zone       = "aus-west-1b"
  tags = {
   Name = "joohyun-subnet-pub-2c-1"
  }
}
 
resource "aws_subnet" "joohyun-subnet-pri-2c-1" {
  vpc_id                  = aws_vpc.joohyun-vpc.id
  cidr_block              = "50.0.1.128/25"
  map_public_ip_on_launch = false
  availability_zone       = "us-west-1b"
  tags = {
   Name = "joohyun-subnet-pri-2c-1"
  }
}
 
resource "aws_subnet" "joohyun-subnet-db-2a-1" {
  vpc_id                  = aws_vpc.joohyun-vpc.id
  cidr_block              = "50.0.2.0/25"
  map_public_ip_on_launch = false
  availability_zone       = "us-west-1b"
  tags = {
   Name = "joohyun-subnet-db-2a-1"
  }
}
 
resource "aws_subnet" "joohyun-subnet-db-2c-1" {
  vpc_id                  = aws_vpc.joohyun-vpc.id
  cidr_block              = "50.0.2.128/25"
  map_public_ip_on_launch = false
  availability_zone       = "us-west-1b"
  tags = {
   Name = "joohyun-subnet-db-2c-1"
  }
}