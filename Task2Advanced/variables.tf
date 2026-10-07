variable "vm_name" { default = "test-vm" }
variable "cores" { default = 2 }
variable "memory" { default = 4 }
variable "disk_size_gb" { default = 15 }
variable "ssh_key" { default = "" }
variable "subnet_id" {}
variable "zone" {
  type    = string
  default = "ru-central1-a"
}
