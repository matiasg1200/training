resource "google_compute_firewall" "allow_http" {
  name        = "http"
  network     = google_compute_network.test-network.id
  description = "Allow HTTP traffic"

  allow {
    protocol = var.vpc_firewall_rules.protocol.http
    ports    = [var.vpc_firewall_rules.ports.http]
  }

  target_tags = ["web"]
}

resource "google_compute_firewall" "allow_ssh" {
  name        = "ssh"
  network     = google_compute_network.test-network.id
  description = "Allow SSH traffic"

  allow {
    protocol = var.vpc_firewall_rules.protocol.ssh
    ports    = [var.vpc_firewall_rules.ports.ssh]
  }

  target_tags = ["ssh"]
}

resource "google_compute_network" "test-network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "test-subnet" {
  name          = var.vpc_subnet_name
  ip_cidr_range = var.vpc_subnet_cidr
  network       = google_compute_network.test-network.id
}