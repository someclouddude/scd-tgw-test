# Include vault variables in TFE config
# VAULT_TOKEN = 
# VAULT_ADDR = https://vault.toyotaconnected.net
# VAULT_NAMESPACE = if in use



provider "aws" {
    access_key = "${data.vault_generic_secret.aws_keys_scd.data["access_key_id"]}"
    secret_key = "${data.vault_generic_secret.aws_keys_scd.data["secret_access_key"]}"
    region = "us-west-2"
}

provider "vault" {
    address = "https://vault.someclouddude.com:8200"
}

data "vault_generic_secret" "aws_keys_scd"{
    path = "aws/kv/someclouddude"
}

module "tgw-test" {
    source = "git::git@github.com:someclouddude/scd-tgw//tgw"
    amazon_side_asn = "64591"
}

module "tgw_rt" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-route-table"
  tgw_id = "module.tgw-test.tgw_id"
}
