# TGW Test

There is an order and will require some coordination if not managed by a single group. 
***Hosts*** are the accounts or TC group hosting the gateway. 
***Consumers*** are the entities that attach and may be a different group.
1. ***Host*** -- The transit gateway must exist first and can be the only resource. A route table could be included in the config. A route table will be required to add routes to. -- transit_gateway.tf
2. ***Host*** -- If the Transit Gateway will be used with other accounts the gateway can be shared with the account number, organization **ID** (terraform doc bug) or the Organization OU **ID** and will need to be added as a share principal. -- resource_shares.tf
3. ***Consumer*** -- If the **Consumer** is in a different account the share will need to be accepted. -- **No terraform, currently manual.**
4. ***Consumer*** -- Attachments to include in the routes and propagation. -- per account configured as required.
5. Wait for 3 & 4 to be completed by the **Consumer**.
6. ***Host*** -- Routes should be added next. They will be need for route table association.
7. ***Host*** -- Route table association.
8. ***Host*** -- Route propagation.


####**Note**
Steps 6, 7 & 8 can be done at the same time but the attachment and share must be complete. This is usually only a concern for a new route table.