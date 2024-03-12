
resource "aws_s3_bucket" "terraform_S3" {
  bucket = var.bucket

}
resource "aws_s3_bucket_public_access_block" "public_acl" {
  count  = var.acl ? 0:1 
  bucket = aws_s3_bucket.terraform_S3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_ownership_controls" "ownership_example" {
  bucket = aws_s3_bucket.terraform_S3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.terraform_S3.id
    versioning_configuration {
      status = var.versioning ? "Enabled":"Disabled"
    } 
}
resource "aws_s3_bucket_acl" "private_acl" {
  bucket = aws_s3_bucket.terraform_S3.id
  acl="private"
  count  = var.acl ? 1:0
  depends_on = [aws_s3_bucket_ownership_controls.ownership_example]
}

resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.terraform_S3.id
  acl="public-read"
  count  = var.acl ? 0:1
  depends_on = [aws_s3_bucket_ownership_controls.ownership_example,aws_s3_bucket_public_access_block.public_acl]
}