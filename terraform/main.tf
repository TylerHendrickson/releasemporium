variable "release_identifier" {
  type = string
}

resource "random_pet" "default" {
    keepers = {
        release_id: var.release_identifier
    }
}

data "external" "build_command" {
  program = ["${path.module}/script.bash"]
}

data "archive_file" "local_zip" {
  type             = "zip"
  source_file      = "${path.module}/../bin/ohai"
  output_path      = "${path.module}/builds/ohai-${random_pet.default.id}.zip"
  output_file_mode = "0644"

  depends_on = [data.external.build_command]
}

output "pet" {
  value = random_pet.default.id
}
