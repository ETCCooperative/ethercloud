terraform {
    required_version = ">= 0.12"
    backend "remote" {
        # Check TF_CLI_CONFIG_FILE for credentials
        hostname = "app.terraform.io"
        organization = "ethercloud"
        workspaces {
            name = "workspace"
        }
    }
}
