resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-${var.name}"
  }
}
# resource "aws_subnet" "main" {          //=============//
#   for_each = toset(var.public_subnets)  //ishtedi ushul//
#   vpc_id     = aws_vpc.my-vpc.id        //=============//
#   cidr_block = each.key
#   name= "${var.name}-sub"
# }
resource "aws_subnet" "main" {
    count = length(var.public_subnets)
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = element(var.public_subnets, count.index)
  availability_zone = var.zones[count.index]
tags = {
 Name =  "${var.name}-sub" 
}
}






resource "aws_internet_gateway" "internet" {
    vpc_id = aws_vpc.my-vpc.id
    tags     = {
        "Name" = "igw-${var.name}"  
    }
}
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }
}