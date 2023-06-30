provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # This is an example Amazon Linux 2 AMI ID; replace it with the appropriate AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance-01"
  }
}

