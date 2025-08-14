variable "base_image_path" {
  description = "Percorso dell’immagine Windows preparata con Cloudbase-Init."
  type        = string
  default     = "/vstorage/IMG/windows-base/windows-template.sysprepped.qcow2"
}

variable "vm_name" { type = string, default = "autowin" }
variable "pool"    { type = string, default = "windows-base" }
variable "memory_mb" { type = number, default = 4096 }
variable "vcpu" { type = number, default = 2 }
variable "admin_password" { type = string, default = "Tu4n0nn4!" }
variable "libvirt_uri" { type = string, default = "quemu:///system"}# da personalizzare
