provider "google" {
  project     = "indigo-nature-367714"
  region      = "us-east1"
  credentials = "key.json"
}

data "local_file" "name" {
    filename  = "index.txt" 
}
output "result"{
    value = data.local_file.name.content

}