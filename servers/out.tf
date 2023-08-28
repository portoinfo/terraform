output "ip_address" {
  value = "${aws_instance.web-east1[0].public_ip}"
}