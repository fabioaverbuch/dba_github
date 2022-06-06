resource "aws_instance" "web01-riocard" {
  ami           = var.ami-windows
  instance_type = var.instance_type

  tags = {
    Name        = var.name-windows
    Environment = var.env
    Provisioner = "Terraform"
  }
}

resource "aws_instance" "ubuntu-server" {
  ami           = var.ami-ubuntu
  instance_type = var.instance_type

  tags = {
    Name        = var.name-ubuntu
    Environment = var.env
    Provisioner = "Terraform"
  }
}