resource "aws_instance" "web" {
  ami = "ami-021809d9177640a20" # amzn2-ami-hvm-2.0.20200207.1-x86_64-gp2
  instance_type = "t2.micro"
}
