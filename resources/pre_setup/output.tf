output "s3_arn" {
    description = "Arn of S3 bucket"
    value = aws_s3_bucket.s3.arn
}
output "s3_id" {
    description = "ID of S3 bucket"
    value = aws_s3_bucket.s3.id 
}
