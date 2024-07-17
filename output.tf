output "ec2_public_ip" {
  value = aws_instance.madeo01act3.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.madeo01act3.public_dns
}