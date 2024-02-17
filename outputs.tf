output "web_server_ips" {
  description = "Public IP addresses of the web servers"
  value       = aws_instance.web.*.public_ip
}