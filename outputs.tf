output "public_subnet" {
  value = aws_subnet.main.*.id
}
output "vpc_id" {
    value = aws_vpc.my-vpc.id
}