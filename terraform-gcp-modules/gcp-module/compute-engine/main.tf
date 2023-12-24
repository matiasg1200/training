resource "google_compute_instance" "web-server" {
  name = var.instance_name
  machine_type = var.instance_machine_type

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    network    = var.instance_vpc
    subnetwork = var.instance_subnet
  }

  tags = ["web", "ssh"]
  effective_labels = var.instance_labels
  metadata_startup_script = file("scripts/webserver.sh")

}
