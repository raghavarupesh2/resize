resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  computer_name                   = var.vm_name
  size                            = local.adjusted_value
  disable_password_authentication = true
  license_type                    = "RHEL_BYOS"
  patch_mode                      = "ImageDefault"
  allow_extension_operations      = true
  disk_controller_type            = "NVMe"
  network_interface_ids           = var.network_interface_ids
  admin_username                  = var.admin_username


  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }
  boot_diagnostics {
    storage_account_uri = ""
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "94_gen2"
    version   = "latest"
  }

  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
}
