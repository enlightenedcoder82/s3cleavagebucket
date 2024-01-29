resource "aws_s3_bucket" "romulus81" {
  bucket = "romulus81"

  tags = {
    Name        = "romulus81"
  }
}

resource "aws_s3_bucket_versioning" "versioning_romulus81" {
  bucket = aws_s3_bucket.romulus81.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "romulus81" {
  bucket = aws_s3_bucket.romulus81.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.romulus81.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "romulus81" {
  depends_on = [
    aws_s3_bucket_ownership_controls.romulus81,
    aws_s3_bucket_public_access_block.public_access_block
  ]

  bucket = aws_s3_bucket.romulus81.id
  acl    = "public-read"
}

resource "aws_s3_object" "text_file" {
  bucket = aws_s3_bucket.romulus81.id
  key    = "index.html"
  acl = "public-read"
  source = "/Users/Teddy/TerraformFolder/AWS/S3-bucket/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "cleavage1" {
  bucket = "romulus81"
  key    = "cleavage1.jpg"
  acl = "public-read"
  source = "/Users/Teddy/TerraformFolder/AWS/S3-bucket/s3_jacket/cleavage1.jpg"
  content_type = "image/jpg"
}

resource "aws_s3_object" "cleavage2" {
  bucket = "romulus81"
  key    = "cleavage2.jpg"
  acl = "public-read"
  source = "/Users/Teddy/TerraformFolder/AWS/S3-bucket/s3_jacket/cleavage2.jpg"
  content_type = "image/jpg"
}

resource "aws_s3_object" "cleavage3" {
  bucket = "romulus81"
  key    = "cleavage3.jpg"
  acl = "public-read"
  source = "/Users/Teddy/TerraformFolder/AWS/S3-bucket/s3_jacket/cleavage3.jpg"
  content_type = "image/jpg"
}

resource "aws_s3_object" "cleavage4" {
  bucket = "romulus81"
  key    = "cleavage4.jpg"
  acl = "public-read"
  source = "/Users/Teddy/TerraformFolder/AWS/S3-bucket/s3_jacket/cleavage4.jpg"
  content_type = "image/jpg"
}



resource "aws_s3_bucket_website_configuration" "romulus81" {
  bucket = aws_s3_bucket.romulus81.id
  index_document {
    suffix = "index.html"
  }
}

