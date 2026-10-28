output "k3s_control_ip" {
  value = hcloud_server.k3s_control.ipv4_address
}