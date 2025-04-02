terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "mail" {
  name   = "mail-server"
  image  = "https://vagrantcloud.com/debian/bookworm64/boxes/debian/versions/12.0.0/providers/virtualbox.box"
  cpus   = 2
  memory = "4096"
  network_adapter {
    type = "bridged"
    host_interface = "enp0s3"
  }
}

resource "virtualbox_vm" "ad_dns" {
  name   = "ad-dns-server"
  image  = "https://vagrantcloud.com/debian/bookworm64/boxes/debian/versions/12.0.0/providers/virtualbox.box"
  cpus   = 2
  memory = "2048"
  network_adapter {
    type = "bridged"
    host_interface = "enp0s3"
  }
}

output "mail_ip" {
  value = virtualbox_vm.mail.network_adapter[0].ipv4_address
}

output "ad_dns_ip" {
  value = virtualbox_vm.ad_dns.network_adapter[0].ipv4_address
}