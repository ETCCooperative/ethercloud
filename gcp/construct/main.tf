provider "google" {
    project = "ethercluster"
    region = "us-central1"       
    zone = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
    name = "ether-instance"
    machine_type = "n1-standard-1"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    network_interface {
        network = "${google_compute_network.vpc_network.self_link}"
        access_config {
            
        }
    }
}

resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
    auto_create_subnetworks = "true"
}
