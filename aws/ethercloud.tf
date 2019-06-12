provider "aws" {
    region     = "us-east-1"
}

resource "aws_instance" "ethercloud" {
    # Ubuntu 16.10 AMI
    ami = "ami-b374d5a5"
    instance_type = "t2.micro"
    depends_on = [aws_s3_bucket.ethercloud_bucket]
}

resource "aws_eip" "ip" {
    instance = aws_instance.ethercloud.id
}

resource "aws_s3_bucket" "ethercloud_bucket" {
    bucket = "ethercloud-bucket-name"
    acl = "private"
}
