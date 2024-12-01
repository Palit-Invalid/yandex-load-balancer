terraform {
  required_version = ">= 1.9.0, < 2.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.133.0"
    }
  }
}

variable "token" {
  description = "Token for access to yandex cloud"
  type        = string
}

provider "yandex" {
  token     = var.token
  cloud_id  = "b1gh8ku4er1varbuc3m7"
  folder_id = "b1gf6nrao5r37u0l0j0u"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "skillfactory" {
  name = "skillfactory"
}

resource "yandex_vpc_subnet" "subnet1" {
  name           = "vm1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.skillfactory.id
  v4_cidr_blocks = ["10.6.0.0/24"]
}

resource "yandex_vpc_subnet" "subnet2" {
  name           = "vm2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.skillfactory.id
  v4_cidr_blocks = ["10.7.0.0/24"]
}

module "vm1" {
  source             = "git::ssh://git@github.com/Palit-Invalid/yandex-instance.git?ref=v0.0.1"
  zone               = "ru-central1-a"
  image              = "lemp"
  name               = "instance-lemp"
  enable_external_ip = true
  ssh_keys           = file("~/.ssh/id_rsa.pub")
  vpc_subnet_id      = yandex_vpc_subnet.subnet1.id
}

module "vm2" {
  source             = "git::ssh://git@github.com/Palit-Invalid/yandex-instance.git?ref=v0.0.1"
  zone               = "ru-central1-b"
  image              = "lamp"
  name               = "instance-lamp"
  enable_external_ip = true
  ssh_keys           = file("~/.ssh/id_rsa.pub")
  vpc_subnet_id      = yandex_vpc_subnet.subnet2.id
}

resource "yandex_lb_target_group" "foo" {
  name = "my-target-group"

  target {
    subnet_id = yandex_vpc_subnet.subnet1.id
    address   = module.vm1.internal_ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet2.id
    address   = module.vm2.internal_ip_address
  }
}

resource "yandex_lb_network_load_balancer" "foo" {
  name = "my-network-load-balancer"

  listener {
    name        = "my-listener"
    port        = 8080
    target_port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.foo.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
      }
    }
  }
}

output "internal_ip_address_vm1" {
  value = module.vm1.internal_ip_address
}

output "internal_ip_address_vm2" {
  value = module.vm2.internal_ip_address
}
