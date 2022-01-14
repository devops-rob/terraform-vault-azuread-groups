output "azure_groups_map" {
  value       = local.azure_groups
  sensitive   = true
  description = "Map of Azure AD group names to Object IDs."
}