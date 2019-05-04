provider "vault" {
  address = "https://vault.someclouddude.com:8200"
}

data "vault_generic_secret" "aws_keys_scd" {
  path = "scd/aws/creds/tfe_scd_assume"
}

provider "aws" {
  access_key = "${data.vault_generic_secret.aws_keys_scd.data["access_key"]}"
  secret_key = "${data.vault_generic_secret.aws_keys_scd.data["secret_key"]}"
  token      = "${data.vault_generic_secret.aws_keys_scd.data["security_token"]}"
  region     = "us-west-2"
}
