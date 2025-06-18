# Ensure that 'get_time.py' exists in the working directory and is executable.
data "external" "current_hour" {
  program = ["python", "get_time.py"]
}

locals {
  hour = tonumber(data.external.current_hour.result["hour"])
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs"
  type        = list(string)
}

variable "os_disk_caching" {
  description = "The caching mode for the OS disk"
  type        = string
}
variable "admin_ssh_public_key" {
  description = "The public SSH key for the VM admin user"
  type        = string
}
variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
}

variable "os_disk_disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = number
}

variable "source_image_publisher" {
  description = "The publisher of the source image"
  type        = string
}

variable "source_image_offer" {
  description = "The offer of the source image"
  type        = string
}

variable "source_image_sku" {
  description = "The SKU of the source image"
  type        = string
}

variable "source_image_version" {
  description = "The version of the source image"
  type        = string
}

# Business logic: Use a different VM size during business hours (default 7 to 18).
variable "business_hour_start" {
  description = "Start hour (24h format) for business hours"
  type        = number
  default     = 7
}

variable "business_hour_end" {
  description = "End hour (24h format) for business hours"
  type        = number
  default     = 18
}

locals {
  adjusted_value = local.hour >= var.business_hour_start && local.hour <= var.business_hour_end ? "Standard_D2ads_v6" : "Standard_D2as_v6"
}
