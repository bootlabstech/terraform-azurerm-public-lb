# public ip 
variable "name" {
  type        = string
  description = "Specifies the name of the Public IP."
}
variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the Public IP should exist"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where this Public IP should exist."
}
variable "ip_version" {
  type        = string
  description = "The IP Version to use"
  default     = "IPv4"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
  default     = "Standard"
}

variable "public_ip_sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global, NOTE ---- When sku_tier is set to Global, sku must be set to Standard"
  type        = string
  default     = "Regional"
}

variable "allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  default     = "Static"
}
# lb
variable "lb_sku" {
  type        = string
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. "
  default     = "Standard"
}

variable "lb_sku_tier" {
  type        = string
  description = "The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional. "
  default     = "Regional"
}

# backend
variable "backend_network_interface" {
  type        = string
  description = "The ID of the Network Interface."
}

variable "backend_nic_frontend_ip_name" {
  type        = string
  description = "The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. "
}

variable "probe_ports" {
  type        = number
  description = "(optional) describe your variable"
  default     = "443"
}
variable "disable_outbound_snat" {
  type = bool
  default = false
}

variable "backend_network_interface1" {
  type        = string
  description = "The ID of the Network Interface."
}

variable "backend_nic_frontend_ip_name1" {
  type        = string
  description = "The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. "
}