locals {
  attachment_tags = {
    local_test = "yes"
  }
}


module "tcds_dmp-usw2-1" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-vpc-att"

  subnet_ids         = ["subnet-07563b004f45fa24d"]
  transit_gateway_id = "${module.tgw-tcds_dmp-tmna_mq.tgw_id}"
  vpc_id             = "vpc-0ed6cfda9ee3c3a0d"
  dns_support        = "enable"
  ipv6_support       = "disable"
  tags = "${merge(var.tags, local.attachment_tags)}"
}
