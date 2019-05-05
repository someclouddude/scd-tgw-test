locals {
  ram_tags = {
    is_shared = "yep"
  }
}

module "tgw_tcds_tmna_share" {
  source          = "git::git@github.com:someclouddude/scd-resource-manager"
  share_name      = "tgw_tcds_tmna_share"
  resource_arn    = "${module.tgw-tcds_dmp-tmna_mq.tgw_id}"
  share_principal = "375886667331"
  tags            = "${merge(var.tags, local.ram_tags)}"
}
