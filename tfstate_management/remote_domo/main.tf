provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "my_ec2_instance" {
	count = 2
	ami = "ami-067c21fb1979f0b27"
	instance_type = "t2.micro"
	tags = {
	Name = "terraform instance"
}
}
