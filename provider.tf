terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      # version = "0.x.y"  # opzionale, se vuoi forzare la versione
    }
  }
  required_version = ">= 1.0.0"
}

provider "libvirt" {
  uri = var.libvirt_uri
}
