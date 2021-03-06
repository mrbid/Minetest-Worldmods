smartshop.settings = {}

smartshop.settings.has_mesecon = minetest.global_exists("mesecon")
smartshop.settings.has_currency = minetest.get_modpath("currency")

local settings = minetest.settings

smartshop.settings.max_wifi_distance = tonumber(settings:get("smartshop.max_wifi_distance")) or 30
smartshop.settings.wifi_link_time = tonumber(settings:get("smartshop.wifi_link_time")) or 30
smartshop.settings.change_currency = settings:get_bool("smartshop.change_currency", true)
smartshop.settings.enable_refund = settings:get_bool("smartshop.enable_refund", true)

smartshop.settings.admin_shop_priv = settings:get("smartshop.admin_shop_priv") or "smartshop_admin"
