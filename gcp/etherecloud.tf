resource "google_container_cluster" "primary" {
    name = "ethercloud"
    region = "us-central1"

    remove_default_node_pool = true
    initial_node_count = 1

    # Setting an empty username and password explicitly disables basic auth
    master_auth {
        username = ""
        password = ""
    }

    node_config {
        oauth_scopes = [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
        ]

        labels = {
            foo = "bar"
        }

        tags = ["foo", "bar"]
    }
}
