resource "libvirt_volume" "win_disk" {
  name   = "${var.vm_name}.qcow2"
  pool   = var.pool
  source = var.base_image_path
  format = "qcow2"
}

locals {
  win_userdata = templatefile("${path.module}/cloudinit/user-data-windows.tpl", {
    hostname        = var.vm_name
    admin_password  = var.admin_password
  })
}

resource "libvirt_cloudinit_disk" "win_cidata" {
  name      = "${var.vm_name}-cloudinit.iso"
  pool      = var.pool
  user_data = local.win_userdata
}

resource "libvirt_domain" "win_vm" {
  name   = var.vm_name
  memory = var.memory_mb
  vcpu   = var.vcpu

  disk {
    volume_id = libvirt_volume.win_disk.id
  }

  disk {
    volume_id = libvirt_cloudinit_disk.win_cidata.id
    scsi = true
  }

  network_interface {
    network_name = "Deep"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}
