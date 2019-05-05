module "tgw-tcds_dmp-tmna_mq" {
  source = "git::git@github.com:someclouddude/scd-tgw//tgw"

  amazon_side_asn                 = ""                                                              # auto-gen
  auto_accept_shared_attachments  = "enable"                                                        # override module default
  default_route_table_association = "disable"                                                       # module default
  default_route_table_propagation = "disable"                                                       # module efault
  description                     = "Creating a test TGW using all default values from the module."
  dns_support                     = "enable"                                                        # module default
  vpn_ecmp_support                = "enable"                                                        # module default

  tags = "${merge(var.tags, var.local_tags)}"
}