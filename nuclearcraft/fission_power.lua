local component = require("component")
local term = require("term")

reactor = component.nc_fission_reactor


wait_time = 3
deactivate_at = 0.8
activate_at = 0.3


while true do
  energy_stored = reactor.getEnergyStored()
  max_energy = reactor.getMaxEnergyStored()
  energy = energy_stored / max_energy
  
  if deactivate_at < energy then
    reactor.deactivate()
  end
  if activate_at > energy then
    reactor.activate()
  end

  os.sleep(wait_time)
  term.clear()
end