resource "hcloud_ssh_key" "main" {
  name       = "homelab"
  public_key = var.ssh_public_key
}

resource "hcloud_server" "k3s_control" {
  name        = "k3s-control"
  image       = "debian-12"
  server_type = "cx23"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.main.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
