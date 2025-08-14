#cloud-config
write_files:
  - path: C:\Windows\Temp\set-admin-password.ps1
    content: |
      net user Administrator "${admin_password}"
runcmd:
  - cmd.exe /C C:\Windows\Temp\set-admin-password.ps1
  - cmd.exe /C del C:\Windows\Temp\set-admin-password.ps1
final_message: "Windows VM ${hostname} provisionata con Cloudbase-Init"
