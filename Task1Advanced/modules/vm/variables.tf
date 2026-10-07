variable "vm_name" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "disk_size_gb" {
  type = number
}

variable "subnet_id" {
  type = string
}

variable "ssh_key" {
  type = string
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}
