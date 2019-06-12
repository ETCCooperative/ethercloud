provider "aws" {
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
    region     = var.region    
}

resource "aws_instance" "ethercloud" {
    # Ubuntu 16.10 AMI
    ami = "ami-b374d5a5"
    instance_type = "t2.micro"
    depends_on = [aws_s3_bucket.ethercloud_bucket]

    provisioner "local-exec" {
        command = "echo ${aws_instance.ethercloud.public_ip} > ip_address.txt"
    }
}

resource "aws_eip" "ip" {
    instance = aws_instance.ethercloud.id
}

resource "aws_s3_bucket" "ethercloud_bucket" {
    bucket = "ethercloud-bucket-name"
    acl = "private"
}
