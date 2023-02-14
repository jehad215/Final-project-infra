resource "google_compute_router" "router" {
  name = "router"
  region = "us-east4"
  network = google_compute_network.my-vpc.id
}