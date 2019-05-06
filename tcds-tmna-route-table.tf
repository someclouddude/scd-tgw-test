locals {
  tgw_rt_tags = {
    local_test = "yes"
  }
}

module "tcds_dmp-tmna_mq" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw-route-table"
  tgw_id = "${module.tgw-tcds_dmp-tmna_mq.tgw_id}"

  tags = "${merge(var.tags, local.tgw_rt_tags)}"
}


# Route, route table association and propagation for scd_dev
module "route_table_association_for_scd_dev" {
  source        = "git::git@github.com:someclouddude/scd-tgw//tgw-rt-assoc"
  tgw_attach_id = "tgw-attach-00ebca0e814511f9e"
  tgw_rt_id     = "${module.tcds_dmp-tmna_mq.tgw_rt_id}"
}

module "route_table_propagation_for_scd_dev" {
  source        = "git::git@github.com:someclouddude/scd-tgw//tgw-rt-prop"
  tgw_attach_id = "tgw-attach-00ebca0e814511f9e"
  tgw_rt_id     = "${module.tcds_dmp-tmna_mq.tgw_rt_id}"
}

module "to_scd_dev" {
  source          = "git::git@github.com:someclouddude/scd-tgw//tgw-rt-route"
  dest_cidr_block = "192.168.101.0/24"
  tgw_attach_id   = "tgw-attach-00ebca0e814511f9e"
  tgw_rt_id       = "${module.tcds_dmp-tmna_mq.tgw_rt_id}"
}

# Route, route table association and propagation for scd_prd
module "route_table_association_for_scd_prd" {
  source        = "git::git@github.com:someclouddude/scd-tgw//tgw-rt-assoc"
  tgw_attach_id = "tgw-attach-005275a474f461d36"
  tgw_rt_id     = "${module.tcds_dmp-tmna_mq.tgw_rt_id}"
}

module "route_table_propagation_for_scd_prd" {
  source        = "git::git@github.com:someclouddude/scd-tgw//tgw-rt-prop"
  tgw_attach_id = "tgw-attach-005275a474f461d36"
  tgw_rt_id     = "${module.tcds_dmp-tmna_mq.tgw_rt_id}"
}

module "to_scd_prd" {
  source          = "git::git@github.com:someclouddude/scd-tgw//tgw-rt-route"
  dest_cidr_block = "192.168.201.0/24"
  tgw_attach_id   = "tgw-attach-005275a474f461d36"
  tgw_rt_id       = "${module.tcds_dmp-tmna_mq.tgw_rt_id}"
}