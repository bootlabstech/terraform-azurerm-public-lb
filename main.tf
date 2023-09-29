# Load Balancer
resource "azurerm_public_ip" "public_ip" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_version          = var.ip_version
  sku                 = var.public_ip_sku
  sku_tier            = var.public_ip_sku_tier
  allocation_method   = var.allocation_method
}

resource "azurerm_lb" "lb" {
  name                = "${var.name}-lb"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.lb_sku
  sku_tier            = var.lb_sku_tier
  frontend_ip_configuration {
    name                 = "${var.name}-lb_front"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "${var.name}-backend_pool"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "address_pool_association" {
  network_interface_id    = var.backend_network_interface
  ip_configuration_name   = var.backend_nic_frontend_ip_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "https"
  port            = var.probe_ports
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "htpps"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "${var.name}-lb_front"
  probe_id                       = azurerm_lb_probe.lb_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
}
