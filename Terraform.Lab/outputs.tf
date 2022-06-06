output "public_ip_windows" {
  value = aws_instance.web01-riocard.public_ip
}

output "public_ip_ubuntu" {
  value = aws_instance.ubuntu-server.public_ip
}

#output "public_dns" {
#   value = aws_instance.web01-riocard.public_dns
#}