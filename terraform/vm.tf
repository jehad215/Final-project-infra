resource "google_compute_instance" "my-vm" {
  name = "my-vm"
  machine_type = "e2-medium"
  zone = "us-east4-c"

  depends_on = [
    google_container_cluster.cluster-pv
   , google_container_node_pool.node
  ]
  
  metadata_startup_script = "${file("./installations.sh")}"

  service_account {
    email = google_service_account.new-svc.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform" ]
  }
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 50
    }
  }
 
  network_interface {
    network = google_compute_network.my-vpc.id
    subnetwork = google_compute_subnetwork.management_subnet.id
    access_config {
      nat_ip = google_compute_address.external_ip.address
    }
  }
}

resource "google_compute_address" "external_ip" {
  name = "external-ip"
}
