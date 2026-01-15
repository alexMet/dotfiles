#!/bin/sh

BAT=$(cat /sys/class/power_supply/BAT0/capacity)
POWER_SUPPLY_CAPACITY=$(cat /sys/class/power_supply/%s/capacity)
POWER_SUPPLY_STATUS=$(cat /sys/class/power_supply/%s/status)
POWER_SUPPLY_CHARGE=$(cat /sys/class/power_supply/%s/charge_now)
POWER_SUPPLY_ENERGY=$(cat /sys/class/power_supply/%s/energy_now)
POWER_SUPPLY_CURRENT=$(cat /sys/class/power_supply/%s/current_now)
POWER_SUPPLY_POWER=$(cat /sys/class/power_supply/%s/power_now)

