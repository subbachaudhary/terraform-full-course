provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-central1"
}
resource "google_bigtable_instance" "production-instance" {
  name = "tf-instance"

  cluster {
    cluster_id   = "tf-instance-cluster"
    num_nodes    = 1
    storage_type = "SSD"
    zone         = "us-central1-c"
  }

  labels = {
    my-label = "prod-label"
  }
}
resource "google_bigtable_table" "table" {
  name          = "tf-table"
  instance_name = google_bigtable_instance.production-instance.name
  split_keys    = ["a", "b", "c"]

  lifecycle {
    prevent_destroy = true
  }
}
resource "google_bigtable_app_profile" "ap" {
  instance       = google_bigtable_instance.production-instance.name
  app_profile_id = "bt-profile"

  // Requests will be routed to any of the 3 clusters.
  multi_cluster_routing_use_any = true

  ignore_warnings               = true
}