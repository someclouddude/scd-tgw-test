module "tcds_dmp-tmna_mq" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-vpc-att"

  subnet_ids         = ["subnet-07563b004f45fa24d"]
  transit_gateway_id = "${module.tgw-tcds_dmp-tmna_mq.tgw_id}"
  vpc_id             = "vpc-0ed6cfda9ee3c3a0d"
  dns_supprt         = "enable"
  ipv6_support       = "disable"
}
