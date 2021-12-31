locals {
  comman-tags = {
    project        = "elililly"
    environment    = "dev"
    service        = "web"
    cost-center-id = "62645"
    product-owner  = "mr.xxxx"
    Technial-owner = "me.xxx"
  }
}
resource "aws_vpc" "dev-sruvpc" {
  cidr_block = var.vpc-cidr
  tags       = local.comman-tags
}
resource "aws_subnet" "public" {
  cidr_block = var.pub-subnet-cidr
  vpc_id     = aws_vpc.dev-sruvpc.id
  tags = {
    Name = "terraform-public"
  }
}
resource "aws_subnet" "private" {
  cidr_block = var.pvt-subnet-cidr
  vpc_id     = aws_vpc.dev-sruvpc.id
  tags = {
    Name = "terraform-private"
  }
}
resource "aws_internet_gateway" "tfgw" {
  vpc_id = aws_vpc.dev-sruvpc.id
  tags = {
    Name = "terraform-igw"
  }
}
resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.dev-sruvpc.id
  tags = {
    Name = "terraform-public-route"
  }
}
resource "aws_route" "igw-route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.public-route.id
  gateway_id             = aws_internet_gateway.tfgw.id
}
resource "aws_route_table_association" "public-igw-assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-route.id
}
resource "aws_instance" "sample-vm" {
  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = aws_subnet.public.id
  count         = var.instance-count
  user_data     = file("httpd.sh")
  tags          = local.comman-tags
  }
resource "aws_s3_bucket" "sruthibucket" {
  bucket="sru-bucket-44"
  force_destroy = true
}
resource "aws_s3_bucket" "newbucket" {
  # (resource arguments)
}

  