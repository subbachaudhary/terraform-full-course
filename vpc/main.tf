provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-east1"
}
resource "google_compute_network" "my-vpc1" {
  project                 = "wesionaryteam-practice-account"
  name                    = "my-vpc1"
  #ip_cidr_range           = "172.16.0.0/16"
  auto_create_subnetworks = true
  mtu                     = 1460
}
resource "google_compute_subnetwork" "my-subnet1" {
  name          = "my-subnet"
  ip_cidr_range = "172.16.1.0/24"
  region        = "us-east4"
  network       = google_compute_network.my-vpc1.id
}
resource "google_compute_subnetwork" "my-subnet2" {
  name          = "my-subnet"
  ip_cidr_range = "172.16.2.0/24"
  region        = "us-east5"
  network       = google_compute_network.my-vpc1.id
}
resource "google_compute_firewall" "subba-test-firewall" {
  name    = "test-firewall"
  network = google_compute_network.my-vpc1.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  source_tags = ["web"]
}
