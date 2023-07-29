local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
local ESX = nil
local timer = 0
local blipsCops               = {}
HasAlreadyEnteredMarker = false




TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citzen.CreateThread(function()
    Holograms()
    KeyControl()
end)






function alireza()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Pos, 1 do
            if GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, false) < 2 then
                return true
            end
        end
    end
    return false
end

function contains(table, val)
    for i = 1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

function Holograms()
    while true do
        Citzen.Wait(5)
        for k,v in pairs(Config.Zones) do
            for i=1, #v.Pos, 1 do
                if GetDistanceBetweenCoords( v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, GetEntityCoords(GetPlayerPed(-1)), false) < 20.0 then
                    local alireza11 = 6
                    local sizealireza1 = { x = 1.2, y = 1.2, z = 1.2 }
                    local coloralireza2 = { r = 0, g = 0, b = 500 }
                    DrawMarker(alireza11, v.Posm[i].x, v.Posm[i].y, v.Posm[i].z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, sizealireza1.x, sizealireza1.y, sizealireza1.z, coloralireza2.r, coloralireza2.g, coloralireza2.b, 100, false, true, 2, false, false, false, false)
                    ShowFloatingHelpNotification('~b~[E] -~w~ To Open Rentall', v.Posm[i])
                    DrawMarker(36, v.Posm[i].x, v.Posm[i].y, v.Posm[i].z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, coloralireza2.r, coloralireza2.g, coloralireza2.b, 100, false, true, 2, false, false, false, false)
                end	             
            end
        end
	end
end





function ShowFloatingHelpNotification(msg, coords)
    SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(2, false, true, 0)
end


AddEventHandler('onKeyUP', function(control)
    if alireza() then
        if control == 'e' then
            autofix()
        end
        if control == 'back' then
            ESX.UI.Menu.CloseAll()
        end
    end
end)




local can = true
function autofix()
    local elements = { 
        {label = '<b><span style="color:yellow;">Spawn Bf400</span></b>',    value = 'solo'},
    }

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Rentall_Menu',
        {
          title    = ('Car Rentall'),
          align    = 'center',
          elements = elements,
        },

        function(data, menu)
            if data.current.value == 'solo' then
                if can then
                  TriggerEvent('ess:spawnMaxVehicle', 'bf400')
                  can = false
                else
                    exports['okokNotify']:Alert("ERROR", "Shoma Yek Motor Spawn Karde ied", 5000, 'error')
                end
            end
            ESX.UI.Menu.CloseAll()
        end)
end





