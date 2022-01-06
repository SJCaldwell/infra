
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_key_pair" "pub_key" {
  key_name   = "mykey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJouxN/ZIswl4bHTuXwONIqDCbm/oKPnQpGgwnuo8aXYgC8qkDCF/ojIAfcKOpDNUXK+tcNl4bVucVsZLnqqsFTG4Hyr3wvXfH9/1WP0r/1II/XJiIe6/ydzkSHDMB2Eoc3NtuaLwGhW1VrnAAPNRqLWKAZYWNHbNsppcR8P+zi3FTpxLwRh4IIpNeB/1+s1Y2DFP4FjXaDlCCpOItB0ozJv25GHI5W3xU1g7Q+Zj0ScNv3hVFXiOonFICfpZh89ItUeHqPQafmiTyRVNHgr8+PfSoowWFOGbxsBfho6JSHAH+uBl2mGCeDdLQTeGIeX+JZTWR7ybnt/xIzVXfz2KzASLh+jhOobGFZlNzhRRrDBCtB0x1YUJipYPBGda6KzAIeWv1xk0n5oRifv7gxVYnT+WueTS9TRUzmjIM5i9RLbMxAs6M3+QZISFVcJrNXFcCpaOT8sWv4iiWwvo0G6HoCL18j0iHM27Ee247RZoZodnjxWiGj4mTt7l5LH/Bews= shane@Shanes-MacBook-Air.local"
}

resource "aws_instance" "hack_server" {
  ami           = "ami-0d12596b1b9089744"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.pub_key.key_name

  tags = {
    Name = "HackboxServerInstance"
  }
}

