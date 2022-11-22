provider "google" {
  project     = "indigo-nature-367714"
  region      = "us-east1"
}
resource "local_file" "test" {
    content   = "subba"
    filename  = "hello.txt ${random_string.name.id}"
}
resource "random_string" "name" {
    length = 20
}