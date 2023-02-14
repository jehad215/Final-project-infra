
resource "google_container_cluster" "priv-cluster" {
  name = "priv-cluster"
  location = "us-central1-c"
   
  remove_default_node_pool = true
  initial_node_count = 1
  network = google_compute_network.my-vpc.id
  subnetwork = google_compute_subnetwork.management_subnet.id
  
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.1.0/24"
      display_name = "managment-cidr-range"
    }
  }
    addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }

  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "jehad-iti.svc.id.goog"
  }
  ip_allocation_policy {
    cluster_secondary_range_name = "pod-range"
    services_secondary_range_name = "service-range"
  }

  private_cluster_config {
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = "172.16.0.0/28"
  }
  node_config {
  service_account = google_service_account.new-svc.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "nodepool" {
  name = "nodepool"
  location = "us-central1-a"
  cluster = google_container_cluster.priv-cluster.id
  node_count = 1
   management {
    auto_repair = true
    auto_upgrade = true
      }

  node_config {
    preemptible = true
    machine_type = "e2-medium"
    service_account = google_service_account.new-svc.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}