locals {
  ram_tags = {
      shared = "yes"
  }
}


module "tgw_tcds_tmna_share" {
    source = "git::git@github.com:someclouddude/scd-resource-manager/"
    share_name = "tgw_tcds_tmna_share"

    resource_arn = "${module.tcds_dmp-tmna_mq.tgw_id}"
    
    principal = "375886667331"

    tags = "${merge(var.tags, local.ram_tags)}"
}