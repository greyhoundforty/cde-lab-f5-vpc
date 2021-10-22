output "management_subnet_id" {
  value = module.management_subnet.id
}

output "cluster_subnet_id" {
  value = module.cluster_subnet.id
}

output "internal_subnet_id" {
  value = module.internal_subnet.id
}

output "external_subnet_id" {
  value = module.external_subnet.id
}