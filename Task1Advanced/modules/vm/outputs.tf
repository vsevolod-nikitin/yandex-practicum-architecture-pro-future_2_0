output "vm_id" {
  value = yandex_compute_instance.vm.id
}

output "vm_name" {
  value = yandex_compute_instance.vm.name
}

output "internal_ip" {
  value = yandex_compute_instance.vm.network_interface.0.ip_address
}

output "external_ip" {
  value = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}

output "additional_disk_id" {
  value = yandex_compute_disk.additional_disk.id
}
