# ---------------------------------------------------------------------------------------------------------------------
# AWS Transit Firenet
# ---------------------------------------------------------------------------------------------------------------------
module "transit_firenet_1" {
  source  = "terraform-aviatrix-modules/aws-transit-firenet/aviatrix"
  version = "5.0.0"
  name = "firenet"
  cidr           = cidrsubnet(var.supernet, 7, 0)
  region         = var.aws_region
  account        = var.aws_account
  firewall_image = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
  ha_gw         = var.ha_gw
  fw_instance_size = var.fw_instance_size
  use_gwlb = var.enable_gwlb
  prefix = false
  suffix = false
  bootstrap_bucket_name_1 = module.pan_bootstrap.aws_s3_bucket.bucket
  depends_on            = [module.pan_bootstrap, time_sleep.wait_bootstrap]
}

# Spoke1 FireNet Policy
resource "aviatrix_transit_firenet_policy" "spoke1_firenet_policy" {
  transit_firenet_gateway_name = module.transit_firenet_1.transit_gateway.gw_name
  inspected_resource_name      = "SPOKE:${module.spoke1.spoke_gateway.gw_name}"
}

# Spoke2 FireNet Policy
resource "aviatrix_transit_firenet_policy" "spoke2_firenet_policy" {
  transit_firenet_gateway_name = module.transit_firenet_1.transit_gateway.gw_name
  inspected_resource_name      = "SPOKE:${module.spoke2.spoke_gateway.gw_name}"
}