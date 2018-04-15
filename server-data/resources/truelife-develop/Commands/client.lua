---
-- Client: Command Handler
---

RegisterNetEvent("CommandHandler:GiveWeapon")
AddEventHandler("CommandHandler:GiveWeapon", function(playerPedId, weaponHash, ammoAmount)
		GiveWeaponToPed(playerPedId, GetHashKey(weaponHash), ammoAmount, false)
    TriggerEvent("Helper:Notify", "Du erhälst ~g~ " + weaponHash + "~w~ und ~g~" + ammoAmount + "Schuss.")
	end)
end)