provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-east1"
}
resource "local_file" "myfile" {
    filename  = var.filename
    content1   = var.content[name]
}