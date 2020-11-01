# create public route table
resource "aws_route_table" "joohyun-public-route-table" {
  vpc_id = "${aws_vpc.joohyun-vpc.id}"
  tags = {
    Name = "joohyun-public-route-table"
  }
}
 
# associate subnets to public route tables
resource "aws_route_table_association" "joohyun-public-subnet1-association" {
  subnet_id = "${aws_subnet.joohyun-subnet-pub-2c-1.id}"
  route_table_id = "${aws_route_table.joohyun-public-route-table.id}"
}
 
resource "aws_route_table_association" "joohyun-public-subnet2-association" {
  subnet_id = "${aws_subnet.joohyun-subnet-pub-2a-1.id}"
  route_table_id = "${aws_route_table.joohyun-public-route-table.id}"
}
 
 
# create private route table
resource "aws_route_table" "joohyun-private-route-table" {
  vpc_id = "${aws_vpc.joohyun-vpc.id}"
  tags = {
    Name = "joohyun-private-route-table"
  }
}
 
# associate subnets to private route tables
resource "aws_route_table_association" "joohyun-private-subnet1-association" {
  subnet_id = "${aws_subnet.joohyun-subnet-db-2a-1.id}"
  route_table_id = "${aws_route_table.joohyun-private-route-table.id}"
}
 
resource "aws_route_table_association" "joohyun-private-subnet2-association" {
  subnet_id = "${aws_subnet.joohyun-subnet-pri-2a-1.id}"
  route_table_id = "${aws_route_table.joohyun-private-route-table.id}"
}
 
resource "aws_route_table_association" "joohyun-private-subnet3-association" {
  subnet_id = "${aws_subnet.joohyun-subnet-pri-2c-1.id}"
  route_table_id = "${aws_route_table.joohyun-private-route-table.id}"
}
 
resource "aws_route_table_association" "joohyun-private-subnet4-association" {
  subnet_id = "${aws_subnet.joohyun-subnet-db-2c-1.id}"
  route_table_id = "${aws_route_table.joohyun-private-route-table.id}"
}