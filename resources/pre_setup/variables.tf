variable "region" {
    description = "Region to spin VPC in"
    type        = string
    default     = "us-west-2"
}
variable "s3_bucket_name" {
    description = "Name of S3 bucket"
    type = string
}
variable "enable_versioning" {
    description = "Name of S3 bucket"
    type = bool
    default = false
}
variable "server_side_encryption_type" {
    description = ") The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
    type = string
    default = "AES256"
}
variable "s3_tags" {
    description = "Tags to associate with S3"
    type = map(string)
    default = {
        classification = "internal/sensitive"
    }
}