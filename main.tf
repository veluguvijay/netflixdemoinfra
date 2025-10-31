provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0bbdd8c17ed981ef9"
  instance_type          = "t2.medium"
  key_name               = "bedroomkey"
  vpc_security_group_ids = ["sg-0ead21b7862e54f9a"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
