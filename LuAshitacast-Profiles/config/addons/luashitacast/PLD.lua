local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude.VarTable();

-- Whatever Town Movement speed body(s) you have or don't, change lines 4-7 to True or False in the gcinclude.lua
-- /wsdistance or /wsdistance ##  (to change ws cancel range)
-- /pld tp to change Tp sets from Default/HighAcc
-- F9 Toggles locking a MP set
-- F10 Toggles locking a MDT set
-- F12 Toggles locking a PDT set
-- Check below for /lockstyleset (4 is being used by default)

local parade_gorget = true
local hercules_ring = true
local hercules_ring_slot = 'Ring2' 

local sets = {
    Idle_Default = {
        Head = 'Koenig Schaller',
        Neck = 'Shield Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Glt. Surcoat +1',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Valor Cape',
        Waist = 'Steppe Sash',
        Legs = 'Blood Cuisses',
        Feet = 'Glt. Leggings +1',
    },       
    Tp_Default = {
        Head = 'Homam Zucchetto',
        Neck = 'Fortitude Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Tp_HighAcc = {
    },
    Town = {
    },
    MP = {
    },
    Resting = {
    },
    Precast = {
        Head = 'Koenig Schaller',
        Neck = 'Shield Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Glt. Surcoat +1',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Valor Cape',
        Waist = 'Steppe Sash',
        Legs = 'Blood Cuisses',
        Feet = 'Glt. Leggings +1',
    },
    -- Haste Gear for Utusemi: Ichi or Ni
    Utsu = {
        Head = 'Homam Zucchetto',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolas',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Jelly Ring',
        Back = 'Valor Cape',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    -- Enimity gear for Hate
    Flash = {
        Head = 'Aegishjalmr',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Valor Surcoat',
        Hands = 'Hydra Moufles',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Hercules\' Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Hydra Brayettes',
        Feet = 'Valor Leggings',
    },
    Cure = {
        Head = 'Aegishjalmr',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Valor Surcoat',
        Hands = 'Hydra Moufles',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Hercules\' Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Hydra Brayettes',
        Feet = 'Valor Leggings',
    },
    Haste = {
        Head = 'Homam Zucchetto',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolas',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Jelly Ring',
        Back = 'Valor Cape',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    MDT = {
        Head = 'Koenig Schaller',
        Neck = 'Shield Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Glt. Surcoat +1',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Valor Cape',
        Waist = 'Steppe Sash',
        Legs = 'Blood Cuisses',
        Feet = 'Glt. Leggings +1',
    },
    PDT = {
        Head = 'Koenig Schaller',
        Neck = 'Shield Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Glt. Surcoat +1',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Valor Cape',
        Waist = 'Steppe Sash',
        Legs = 'Blood Cuisses',
        Feet = 'Glt. Leggings +1',
    },
    -- Enimity gear for provoke
    Provoke = {
        Head = 'Aegishjalmr',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Hydra Haubert',
        Hands = 'Hydra Moufles',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Hercules\' Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Hydra Brayettes',
        Feet = 'Valor Leggings',
    },
    Cover = {
        Head = 'Gallant Coronet',
        Body = 'Valor Surcoat',
    },
    Rampart = {
        Head = 'Valor Coronet',
    },
    Sentinel = {
        Feet = 'Valor Leggings',
    },
    Shield_Bash = {
    },
    Ws_Default = {
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Haubergeon',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Hct. Leggings',
    },
};
profile.Sets = sets;

local function EquipHpBasedGear(player)
    if (hercules_ring == true and (player.HPP < 50)) then
        gFunc.Equip(hercules_ring_slot, 'Hercules\' Ring')
    end
    if (parade_gorget == true and (player.HPP > 85)) then
        gFunc.Equip('Neck', 'Parade Gorget');
    end
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcdisplay.CreateToggle('(F10) MDT', false);
    gcdisplay.CreateToggle('(F12) PDT', false);
    gcdisplay.CreateToggle('(F9) MP', false);
    gcdisplay.CreateCycle('/pld tp ', { [1] = 'Default', [2] = 'HighAcc' }); --/pld tp
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /pld mptoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /pld mdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /pld pdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pld /lac fwd'); 
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');	
    gcdisplay.Initialize();
    gcinclude.SetAlias();
    profile.SetLockStyle();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pld');
    gcdisplay.Destroy();
    gcinclude.ClearAlias();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    
    if (args[1] == 'tp') then
        gcdisplay.AdvanceCycle('/pld tp ');
    end
    if (args[1] == 'mdttoggle') then
        gcdisplay.AdvanceToggle('(F10) MDT');
    end
    if (args[1] == 'pdttoggle') then
        gcdisplay.AdvanceToggle('(F12) PDT');
    end
    if (args[1] == 'mptoggle') then
        gcdisplay.AdvanceToggle('(F9) MP');
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    EquipHpBasedGear(player);
    if (player.Status == 'Idle') then
        gFunc.EquipSet(sets.Idle_Default);
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/pld tp '));
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
        
    gcinclude.TownGear();
    gcinclude.CheckCommonDebuffs();

    local subjob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob();
    if (profile.SubJob ~= subjob) and (profile.SubJob ~= 0) and (subjob ~= 0) then
        profile.SubJob = subjob
        profile.SetLockStyle();
    end
end

profile.SetLockStyle = function ()
    local player = gData.GetPlayer();
    if (player.SubJob == 'NIN') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'WAR') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'WHM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    end    
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    
    gFunc.EquipSet(sets.Precast);
        
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
end

profile.HandleMidcast = function()
    local target = gData.GetActionTarget();
    local spell = gData.GetAction();
    local action = gData.GetAction();
    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Haste);
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Utsu);
    elseif (action.Name == 'Flash') then
        gFunc.EquipSet(sets.Flash);
    elseif (action.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure);
    end 

    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
end

profile.HandleItem = function()
    gcinclude.DoItem();
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
        if (canWS == false) then gFunc.CancelAction() return;
        else
            local action = gData.GetAction();
            gFunc.EquipSet(sets.Ws_Default);
    end
        
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    
    if (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
    elseif (action.Name == 'Cover') then
        gFunc.EquipSet(sets.Cover)
    elseif (action.Name == 'Rampart') then
        gFunc.EquipSet(sets.Rampart)
    elseif (action.Name == 'Sentinel') then
        gFunc.EquipSet(sets.Sentinel)
    elseif (action.Name == 'Shield Bash') then
        gFunc.EquipSet(sets.Shield_Bash)
    end
end

return profile;