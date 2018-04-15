---
-- Command Handler
---
AddEventHandler('chatMessage', function(source, name, message)
  local source = source
  
  -- Berechtigung einfügen
  
  if(startswith(message, "/")) then
    local args = stringsplit(message, " ")
    
    args[1] = string.gsub(args[1], "/", "")
    if(args[1] == "giveweapon") then
      local identifier = getPlayerID(source)
      
      if(args[2] == "weapon_pistol") then
        local ammoAmount = tonumber(args[3])
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_pistol"), ammoAmount, false)
      end
    end
  end
end)