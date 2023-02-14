resource "google_compute_firewall" "allow" {
  name = "allow"
  network = google_compute_network.my-vpc.id
  allow {
    protocol = "tcp"
    ports = ["22","80"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}