resource "aws_vpc" "myvpc" {
  cidr_block = var.vpccidr
  tags = {
    Name = "myvpc"
  }
}
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.myvpc.id}"
}
resource "aws_subnet" "subnets" {
  count = length(data.aws_availability_zones.azs.names)
  cidr_block = cidrsubnet(var.vpccidr,8,count.index)
  vpc_id = "${aws_vpc.myvpc.id}"
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  tags = {
    Name = "mysubnet-${count.index}"
  }
}