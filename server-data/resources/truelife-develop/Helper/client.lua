---
-- Client Funktion "Notify"
--
-- This function shows a note right above the minimap
--
-- No Return
---

RegisterNetEvent("Helper:Notify")
AddEventHandler("Helper:Notify", function(text)
    
    SetNotificationTextEntry("STRING");
    AddTextComponentString(text);
    DrawNotification(false, true);
end)