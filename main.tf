resource "aws_security_group" "madeo01act3_sg" {
  name   = "madeo01act3-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    terraform = true
  }

}

data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "madeo01act3" {
  ami                         = data.aws_ami.amazon.id
  instance_type               = var.instance_type
  user_data                   = file("post-configuration.sh")
  subnet_id                   = local.public1_subnet_id
  vpc_security_group_ids      = [aws_security_group.madeo01act3_sg.id]
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true

  }

  tags = {
    terraform = true
  }

}