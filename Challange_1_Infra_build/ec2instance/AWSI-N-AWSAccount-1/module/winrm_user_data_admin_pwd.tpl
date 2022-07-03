<script>
  winrm quickconfig -q & winrm set winrm/config/winrs @{MaxMemoryPerShellMB="1024"} & winrm set winrm/config @{MaxTimeoutms="1800000"} & winrm set winrm/config/service @{AllowUnencrypted="true"} & winrm set winrm/config/service/auth @{Basic="true"} & winrm/config @{MaxEnvelopeSizekb="8000kb"}
</script>
<powershell>
  netsh advfirewall set allprofiles state off
  $admin = [ADSI]("WinNT://./${instance_admin_account}, user")
  $admin.SetPassword("${tmp_admin_password}")
</powershell>