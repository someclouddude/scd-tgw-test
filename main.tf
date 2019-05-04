provider "vault" {
  address = "https://vault.someclouddude.com:8200"
}

data "vault_generic_secret" "aws_keys_scd" {
  path = "scd/aws/creds/tfe_scd_assume"
}

provider "aws" {
  access_key = "${data.vault_generic_secret.aws_keys_scd.data["access_key"]}"
  secret_key = "${data.vault_generic_secret.aws_keys_scd.data["secret_key"]}"
  token = "${data.vault_generic_secret.aws_keys_scd.data["security_token"]}"
  region     = "us-west-2"
}

output "shit" {
    value = "${data.vault_generic_secret.aws_keys_scd.data}"
}

module "tgw-test" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw"

  amazon_side_asn                 = ""                                                              # auto-gen
  auto_accept_shared_attachments  = "enable"                                                        # not module default
  default_route_table_association = "disable"                                                       # module default
  default_route_table_propagation = "disable"                                                       # module efault
  description                     = "Creating a test TGW using all default values from the module."
  dns_support                     = "enable"                                                        # module default
  vpn_ecmp_support                = "enable"                                                        # module default
}

module "tgw_rt" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-route-table"
  tgw_id = "${module.tgw-test.tgw_id}"
}
