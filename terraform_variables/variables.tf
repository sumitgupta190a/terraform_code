variable "filename" {
	default = "/home/ubuntu/terraform_code/terraform_variables/devops_automated.tf"
}

variable "content" {
	default = "this is auto generated from the variables"
}

variable "devops_op_trainer" {}

variable "content_map" {
type = map
default = {
"content1" = "this is content 1 form the map"
"content2" = "this is content 2 form the map"
}
}

variable "file_list" {
type = list
default = ["/home/ubuntu/terraform_code/terraform_variables/file_1.txt" , "/home/ubuntu/terraform_code/terraform_variables/file_2.txt"]
}

variable "aws_ec2_object" {
  type = object({
    name = string
    instances = number
    key = list(string)
    ami = string
  })

  default = {
    name = "test-ec2-instance"
    instances = 2
    key = ["key_1.pem", "key_2.pem"]
    ami = "ami-12345678"  # Replace with a valid AMI ID
  }
}

variable "no_of_students" {}
