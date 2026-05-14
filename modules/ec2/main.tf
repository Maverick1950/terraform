resource "aws_instance" "public_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.public_sg_id]

  tags = {
    Name = "public-ec2"
  }
}

resource "aws_instance" "private_ec2_1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_1
  key_name               = var.key_name
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "private-ec2-1"
  }
}

resource "aws_instance" "private_ec2_2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_2
  key_name               = var.key_name
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "private-ec2-2"
  }
}