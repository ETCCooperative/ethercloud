# Add ENV var called TF_VAR_aws_access_key_id
variable "aws_access_key_id" {}

# Add ENV var called TF_VAR_aws_secret_access_key
variable "aws_secret_access_key" {}

variable "region" {
    default = "us-east-1"
}
