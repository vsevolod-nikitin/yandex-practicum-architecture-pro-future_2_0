locals {
  ssh_key = var.ssh_key != "" ? var.ssh_key : file("~/.ssh/id_ed25519.pub")
}

module "vm" {
  source = "../../modules/vm"

  vm_name      = var.vm_name
  cores        = var.cores
  memory       = var.memory
  disk_size_gb = var.disk_size_gb
  subnet_id    = var.subnet_id
  ssh_key      = local.ssh_key
}

output "vm_id" {
  value = module.vm.vm_id
}

output "vm_external_ip" {
  value = module.vm.external_ip
}

output "vm_internal_ip" {
  value = module.vm.internal_ip
}

output "vm_name" {
  value = module.vm.vm_name
}

output "vm_disk_id" {
  value = module.vm.additional_disk_id
}

