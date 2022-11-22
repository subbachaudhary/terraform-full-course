provider "google" {
  project     = "indigo-nature-367714"
  region      = "us-east1"
}
resource "local_file" "test" {
    content   = "subba"
    filename  = "hello.txt"
}
resource "random_string" "name" {
    length = 20
}