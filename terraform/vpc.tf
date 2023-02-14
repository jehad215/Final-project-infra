resource "google_compute_network" "my-vpc" {
  name = "my-vpc"
  project = "jehad-iti"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}