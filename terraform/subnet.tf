resource "google_compute_subnetwork" "management_subnet" {
  name = "management-subnet"
  ip_cidr_range = "10.0.5.0/24"
  region = "us-east4"
  network = google_compute_network.my-vpc.id
  private_ip_google_access = true
  secondary_ip_range {
     range_name = "pod-range"
    ip_cidr_range = "10.0.7.0/24"
  }
  secondary_ip_range {
     range_name = "service-range"
    ip_cidr_range = "10.0.9.0/24"
  }
}