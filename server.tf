resource "hcloud_firewall" "main" {
  name = "homelab"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "6443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "udp"
    port      = "41641"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_ssh_key" "main" {
  name       = "homelab"
  public_key = var.ssh_public_key
}

resource "hcloud_server" "k3s_control" {
  name         = "k3s-control"
  image        = "debian-12"
  server_type  = "cx23"
  location     = "nbg1"
  ssh_keys     = [hcloud_ssh_key.main.id]
  firewall_ids = [hcloud_firewall.main.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
