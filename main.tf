provider "aws" {
    region = "us-west-2"
}

module "tgw-test" {
    source = "git::git@github.com:someclouddude/scd-tgw//tgw"

    amazon_side_asn = "64591"
    }