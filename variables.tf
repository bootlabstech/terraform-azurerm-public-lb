//load_balancer 

variable "ip_version" {
    type = string
    description = "The IP Version to use"
    default = "IPv4"
}

variable "public_ip_sku" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global"
  type        = string
  default = "Standard"
}

variable "public_ip_sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global, NOTE ---- When sku_tier is set to Global, sku must be set to Standard"
  type        = string
  default = "Regional"
}

variable "allocation_method" {
    type = string
    description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
    default = "Static"
}

variable "lb_sku" {
    type = string
    description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic"
    default = "Standard"
}

variable "lb_sku_tier" {
    type = string
    description = "The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional"
    default = "Regional"
}

# virtual_machine
variable "name" {
  type        = string
  description = "Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "network_interface" {
    type = string
    description = "(optional) describe your variable"
}
