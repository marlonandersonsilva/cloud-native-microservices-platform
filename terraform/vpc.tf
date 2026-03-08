resource "aws_vpc" "main_vpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloud-native-vpc"
  }

}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main_vpc.id

}

resource "aws_subnet" "subnet_a" {

  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

}

resource "aws_subnet" "subnet_b" {

  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  map_public_ip_on_launch = true

}

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main_vpc.id

}

resource "aws_route" "internet_access" {

  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id

}

resource "aws_route_table_association" "subnet_a_assoc" {

  subnet_id = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.public_rt.id

}

resource "aws_route_table_association" "subnet_b_assoc" {

  subnet_id = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.public_rt.id

}
