provider "google" {
  project     = "indigo-nature-367714"
  region      = "us-east1"
  version     = "~> 4.0.0"
}

resource "random_string" "name" {
    length = 300
    lifecycle {
    ignore_changes = [length]
  }
}