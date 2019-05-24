provider "google" {
    project = "ethercluster"
    region = "us-central1"       
    zone = "us-central1-c"
}

resource "google_container_cluster" "primary" {
    name = "ether-cluster"
    
    remove_default_node_pool = true
    initial_node_count = 1

    master_auth {
        username = ""
        password = ""
    }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
    name = "my-node-pool"
    cluster = "${google_container_cluster.primary.name}"
    node_count = 3
    
    node_config {
        preemptible = true
        machine_type = "n1-standard-1"

        metadata = {
            disable-legacy-endpoints = "true"
        }

        oauth_scopes = [
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
        ]
    }
}

output "client_certificate" {
    value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
    value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
    value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

resource "google_compute_address" "ip_address" {
    name = "ethercluster-address"
}
