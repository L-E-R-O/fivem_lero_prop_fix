-- Liste aller relevanten Ped Bones
local pedBones = {
    0x0, -- Root
    0xE0FD, -- Head
    0x796e, -- Neck
    0x60F0, -- Right Hand
    0x49D9, -- Left Hand
    0xEB95, -- Right Foot
    0x3779, -- Left Foot
    0x192A, -- Right Thigh
    0x9000, -- Left Thigh
    0x6E5C, -- Right Calf
    0xF9BB, -- Left Calf
    0xCA72, -- Spine
    0x9995, -- Pelvis
}

-- Funktion zum Entfernen aller angehängten Props
local function RemoveAllAttachedProps()
    local playerPed = PlayerPedId()
    local propsRemoved = 0
    
    -- Entferne alle angehängten Objekte
    local allObjects = GetGamePool('CObject')
    for _, object in ipairs(allObjects) do 
        if DoesEntityExist(object) and IsEntityAttachedToEntity(object, playerPed) then 
            DetachEntity(object, true, true) 
            DeleteObject(object)
            DeleteEntity(object)
            propsRemoved = propsRemoved + 1
        end
    end
    
    -- Clear Tasks
    ClearPedSecondaryTask(playerPed)
    ClearPedTasksImmediately(playerPed)

    print('^2[PropFix]^7 was used by ' .. playerPed)
    
end

-- Registriere den Command
RegisterCommand('propfix', function()
    RemoveAllAttachedProps()
end, false)

-- Info beim Resource Start
CreateThread(function()
    Wait(1000)
    print('^2[PropFix]^7 Script geladen. Benutze ^5/propfix^7 um festklebende Objekte zu entfernen.')
end)
