data "aws_ami" "ubuntu-east1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web-east1" {
  count 		= var.servers
  #ami           = data.aws_ami.ubuntu-east1.id
  ami           = var.image_id //ami-01cbb63e05938987e
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
