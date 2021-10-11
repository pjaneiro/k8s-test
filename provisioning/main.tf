terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_project" "pjaneiro" {
  name        = "pjaneiro"
  environment = "Development"
  description = "Default project"
}

resource "digitalocean_ssh_key" "main" {
  name       = "Main"
  public_key = var.main_ssh_key
}

resource "digitalocean_kubernetes_cluster" "main" {
  name   = "k8s-test"
  region = "lon1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.21.3-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}
