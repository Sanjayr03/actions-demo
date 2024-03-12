output "bucket_Dn" {
    value=aws_s3_bucket.terraform_S3.bucket_domain_name
    description= "The Domain of bucket "
}
output "Bucketid" {
    value= aws_s3_bucket.terraform_S3.id
    description="The Bucket id"
}
output "bucket_arn" {
  value = aws_s3_bucket.terraform_S3.arn
  description = "The bucket arn "
}