#data, usado para coletar dados de alguma estrutura, como por exemplo, uma ami.
data "aws_ami" "windows" {
  #imagem mais recente
  most_recent = true

  filter {
    #filtrar a ami por nome
    name = "name"
    #encontrado em amis, na console da AWS
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
  #campo orbigatório contendo o owner da ami
  owners = ["801119661308"]
}

#data, usado para coletar dados de alguma estrutura, como por exemplo, uma ami.
data "aws_ami" "ubuntu" {
  #imagem mais recente
  most_recent = true

  filter {
    #filtrar a ami por nome
    name = "name"
    #encontrado em amis, na console da AWS
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  #campo orbigatório contendo o owner da ami
  owners = ["099720109477"]
}

resource "aws_instance" "web01-riocard" {
  ami           = data.aws_ami.windows.id
  instance_type = var.instance_type

  tags = {
    Name        = var.name-windows
    Environment = var.env
    Provisioner = "Terraform"
  }
}

resource "aws_instance" "ubuntu-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name        = var.name-ubuntu
    Environment = var.env
    Provisioner = "Terraform"
  }
}