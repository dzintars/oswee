terraform {
  required_version = ">= 1.3.1"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.6.4"
    }
  }
}
