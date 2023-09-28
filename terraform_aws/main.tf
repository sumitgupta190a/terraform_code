terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 4.16, < 5.0"
        }
    }
    required_version = ">= 1.2.0"  # This is the minimum Terraform version required
}


provider "aws" {
    region = "ap-south-1"
}

locals {
        instances = {"sumit":"ami-067c21fb1979f0b27", "amit":"ami-0f5ee92e2d63afc18"}
}
resource "aws_instance" "my_ec2_instance" {
        #count = 2
        for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
        #Name = "make-by-tf"	#when we have to give the same name of all the instance
        #Name = "make-by-tf- ${count.index}"	#when we have to give the different instance
        Name = each.key		#when we have to give the name and different ami from the local
 }
}

/*
#jab hume same ami ka instance banana ho jab hum iss type se code likhege
locals {
        instances = toset(["sumit" , "amit"])
}
resource "aws_instance" "my_ec2_instance" {
	#count = 2
	for_each = local.instances
	ami = "ami-0f5ee92e2d63afc18"
	instance_type = "t2.micro"
	tags = {
        #Name = "make-by-tf"
	#Name = "make-by-tf- ${count.index}"
	Name = each.key
 }
}
*/

resource "aws_s3_bucket" "my_s3_bucket" {
	bucket = "terraform-created-bucket-1"
	tags = {
	Name = "terraforn-created-bucket-1"
	Environment = "Dev"
}
}

/*
output "ec2_public_ips" {
	value = aws_instance.my_ec2_instance[*].public_ip	#humne square bracket isliye lagaye kyoki hum multiple instance create kr rhe hai tohh ip ab array me ayege
}
*/
