variable "release_identifier" {
  type = string
}

resource "random_pet" "default" {
    keepers = {
        release_id: var.release_identifier
    }
}

output "pet" {
  value = random_pet.default.id
}
