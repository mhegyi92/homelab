terraform {
  cloud {
    organization = "mhegyi92"
    workspaces {
      name = "hetzner"
    }
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {

}
