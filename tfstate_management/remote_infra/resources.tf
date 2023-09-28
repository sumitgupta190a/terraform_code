resource "aws_s3_bucket" "my_s3_bucket" {
	bucket = "terraform-make-state-bucket"

}

resource "aws_dynamodb_table" "my_dynamodb_table" {
	name = "terraform-state-table"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "LockID"
	attribute {
	name = "LockID"
	type = "S"
	}
}
