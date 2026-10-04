terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tf-future-2-0"
    region = "ru-central1"
    key    = "Task2Advanced/test.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  zone = "ru-central1-a"
}

data "yandex_compute_image" "my_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "boot_disk" {
  name     = "${var.vm_name}-boot"
  type     = "network-hdd"
  zone     = var.zone
  size     = 15
  image_id = data.yandex_compute_image.my_image.id
}

resource "yandex_compute_disk" "additional_disk" {
  name = "${var.vm_name}-additional"
  type = "network-hdd"
  zone = var.zone
  size = var.disk_size_gb
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  secondary_disk {
    disk_id = yandex_compute_disk.additional_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}
