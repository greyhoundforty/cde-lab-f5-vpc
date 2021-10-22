

module "vpc" {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Module.git"
  name           = var.project
  resource_group = data.ibm_resource_group.group.id
  tags           = concat(var.tags, ["project:${var.project}", "region:${var.region}"])
}

module "public_gateway" {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Public-Gateway-Module.git"
  name           = "${var.project}-public-gateway"
  zone           = data.ibm_is_zones.region.zones[0]
  vpc            = module.vpc.id
  resource_group = data.ibm_resource_group.group.id
  tags           = concat(var.tags, ["project:${var.project}", "region:${var.region}", "zone:${data.ibm_is_zones.region.zones[0]}"])
}

module "management_subnet" {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name           = "${var.project}-management-subnet"
  resource_group = data.ibm_resource_group.group.id
  network_acl    = module.vpc.default_network_acl
  address_count  = "32"
  vpc            = module.vpc.id
  zone           = data.ibm_is_zones.region.zones[0]
  public_gateway = module.public_gateway.id
  tags           = concat(var.tags, ["project:${var.project}", "region:${var.region}", "zone:${data.ibm_is_zones.region.zones[0]}"])
}

module "external_subnet" {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name           = "${var.project}-external-subnet"
  resource_group = data.ibm_resource_group.group.id
  network_acl    = module.vpc.default_network_acl
  address_count  = "32"
  vpc            = module.vpc.id
  zone           = data.ibm_is_zones.region.zones[0]
  public_gateway = module.public_gateway.id
  tags           = concat(var.tags, ["project:${var.project}", "region:${var.region}", "zone:${data.ibm_is_zones.region.zones[0]}"])
}

module "cluster_subnet" {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name           = "${var.project}-cluster-subnet"
  resource_group = data.ibm_resource_group.group.id
  network_acl    = module.vpc.default_network_acl
  address_count  = "32"
  vpc            = module.vpc.id
  zone           = data.ibm_is_zones.region.zones[0]
  tags           = concat(var.tags, ["project:${var.project}", "region:${var.region}", "zone:${data.ibm_is_zones.region.zones[0]}"])
}

module "internal_subnet" {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name           = "${var.project}-internal-subnet"
  resource_group = data.ibm_resource_group.group.id
  network_acl    = module.vpc.default_network_acl
  address_count  = "32"
  vpc            = module.vpc.id
  zone           = data.ibm_is_zones.region.zones[0]
  tags           = concat(var.tags, ["project:${var.project}", "region:${var.region}", "zone:${data.ibm_is_zones.region.zones[0]}"])
}