provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "my-first-bucket-for-devops-academy"
}

resource "aws_s3_bucket_public_access_block" "my_acces_block" {
  bucket = aws_s3_bucket.my_first_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "my_first_policy" {
  bucket = aws_s3_bucket.my_first_bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
             "Principal": {
                "AWS": ["arn:aws:iam::134275203866:root",
                "arn:aws:iam::810242175086:root",
                ]
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::my-first-bucket-for-devops-academy/*"
        }
    ]
})
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.my_first_bucket.id
  index_document {
    suffix = "index.html"
  }
}
