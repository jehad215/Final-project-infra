resource "google_compute_instance" "private-vm" {
  name = "private-vm"
  machine_type = "e2-medium"
  zone = "us-central1-c"

  depends_on = [
    google_container_cluster.priv-cluster
   , google_container_node_pool.nodepool
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
      nat_ip = google_compute_address.instance_external_ip.address
    }
  }
}


resource "google_compute_address" "instance_external_ip" {
  name = "instance-external-ip"
}
