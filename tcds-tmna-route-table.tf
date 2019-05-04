module "tcds_dmp-tmna_mq" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-route-table"
  tgw_id = "${module.tgw-tcds_dmp-tmna_mq.tgw_id}"
}