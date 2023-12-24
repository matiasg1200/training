data "google_compute_image" "web-server_image" {
  family  = "debian-12"
  project = "debian-cloud"
}
