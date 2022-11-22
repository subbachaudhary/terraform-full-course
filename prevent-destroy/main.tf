provider "google" {
  project     = "indigo-nature-367714"
  region      = "us-east1"
}
resource "random_string" "name" {
    length = 3000
    lifecycle {
    prevent_destroy = true
  }
}