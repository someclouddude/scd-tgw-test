provider "vault" {
  address = "https://vault.someclouddude.com:8200"
}

data "vault_generic_secret" "aws_keys_scd" {
  path = "aws/kv/someclouddude"
}

provider "aws" {
  access_key = "${data.vault_generic_secret.aws_keys_scd.data["access_key_id"]}"
  secret_key = "${data.vault_generic_secret.aws_keys_scd.data["secret_access_key"]}"
  region     = "us-west-2"
}

module "tgw-test" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw"

  #amazon_side_asn = 64519
  description     = "Creating a test TGW using all default values from the module."
}

module "tgw_rt" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-route-table"
  tgw_id = "${module.tgw-test.tgw_id}"
}
