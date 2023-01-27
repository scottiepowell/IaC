output "public_ip"  {
    value = aws_instance.instance.public_ip
    description = "The public IP address of the web server"
}
output "subnet_id" {
  value = aws_instance.instance.subnet_id
}