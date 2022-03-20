output "fw_instance_public_ip" {
  value = aviatrix_firewall_instance.fw_instance.public_ip
}

output "fw_instance_firewall_name" {
  value = aviatrix_firewall_instance.fw_instance.firewall_name
}

output "spoke1_instance_private_ip" {
  value = aws_instance.spoke1_instance.private_ip
}

output "spoke2_instance_private_ip" {
  value = aws_instance.spoke2_instance.private_ip
}