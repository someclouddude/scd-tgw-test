locals {
  ram_tags = {
    is_shared = "yep"
  }
}

module "tgw_tcds_tmna_share" {
  source          = "git::git@github.com:someclouddude/scd-resource-manager"
  share_name      = "tgw_tcds_tmna_share"
  resource_arn    = "${module.tgw-tcds_dmp-tmna_mq.tgw_arn}"
  share_principal = "arn:aws:organizations::909295938269:ou/o-knu9g6q8sh/ou-ycsu-37m07fn3"
  tags            = "${merge(var.tags, local.ram_tags)}"
}
