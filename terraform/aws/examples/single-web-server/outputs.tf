output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

output "url" {
  value = "http://${aws_instance.example.public_ip}:8080"
  description = "URL of the web server"
}