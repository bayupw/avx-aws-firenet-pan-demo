module "pan_bootstrap" {
  source = "./modules/bootstrap"
}

# wait for 5 mins after s3 bootstrap files are uploaded, before launching a firewall instance
resource "time_sleep" "wait_bootstrap" {
  create_duration = var.wait_bootstrap
  depends_on      = [module.pan_bootstrap]
}

# wait for after firewall instance is launched, before running vendor integration
resource "time_sleep" "wait_fw_instance" {
  create_duration = var.wait_fw_instance
  depends_on      = [aviatrix_firewall_instance.fw_instance]
}

# wait for firewall instance to be created
module "vendor_integration" {
  source = "./modules/vendor-integration"
  fw_instance_vpc_id        = aviatrix_firewall_instance.fw_instance.vpc_id
  fw_instance_instance_id   = aviatrix_firewall_instance.fw_instance.instance_id
  fw_instance_public_ip     = aviatrix_firewall_instance.fw_instance.public_ip
  fw_instance_firewall_name = aviatrix_firewall_instance.fw_instance.firewall_name
  depends_on = [time_sleep.wait_fw_instance]
}