variable "vpc-cidr" {
  type    = string
  default = "192.168.0.0/16"
}
variable "pub-subnet-cidr" {
  type    = string
  default = "192.168.0.0/24"
}
variable "pvt-subnet-cidr" {
  type    = string
  default = "192.168.1.0/24"
}
variable "ami-id" {
  type    = string
  default = "ami-002068ed284fb165b"
}
variable "instance-type" {
  type    = string
  default = "t2.micro"
}
variable "instance-count" {
  type    = number
  default = 1

}

