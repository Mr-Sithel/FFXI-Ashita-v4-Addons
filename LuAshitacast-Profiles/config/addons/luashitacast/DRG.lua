local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
gcinclude.VarTable();
-- Which ever you have, change Town body to true in the gcinclude.lua

local ethereal_earring = true
local ethereal_earring_slot = 'Ear2'

--Idle Sets, to change type: /drg idle
local sets = {
    Idle_Default = {
        Ammo = 'Tiphia Sting',
        Head = 'Darksteel Cap +1',
        Neck = 'Fortitude Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Steppe Sash',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1',
    },
    Idle_ALT = {
    },
    --TP Sets, to change type: /drg tp 
    Tp_Default = {
        Ammo = 'Tiphia Sting',
        Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Tp_HighAcc = {
    },
    Town = {
    },
    Resting = {
    },
    Utsu = {
        Head = 'Homam Zucchetto',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Ethereal Earring',
        Body = '',
        Hands = 'Homam Manopolas',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Jelly Ring',
        Back = '',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    -- Toggle lock MP set with F9
    MP = {
    },
    -- Toggle lock MDT set with F10
    MDT = {
    },
    -- Toggle lock PDT set with F12
    PDT = {
        Ammo = 'Tiphia Sting',
        Head = 'Darksteel Cap +1',
        Neck = 'Fortitude Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Steppe Sash',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1',
    },
    HPThreshold = {
        Ammo = 'Happy Egg',
        Head = 'Drachen Armet',
        Neck = 'Shield Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Light Ring',
        Back = 'Gigant Mantle',
        Waist = 'Steppe Sash',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Breath_Bonus = {
        Head = 'Wym. Armet',
        Body = 'Wyvern Mail',
        Hands = 'Homam Manopolas',
        Legs = 'Drachen Brais',
        Feet = 'Homam Gambieras',
    }, 
    Call_Wyvern = {
        Body = 'Wyrm Mail',
    },
        
    Spirit_Link = {
        Head = 'Drachen Armet',
        Body = 'Wyvern Mail',
        Hands = 'Homam Manopolas',
        Legs = 'Drachen Brais',
        Feet = 'Homam Gambieras',
    },
    Jump_All = {
        Ammo = 'Tiphia Sting',
        Head = 'Optical Hat',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Drachen Greaves',
    },
    -- WS Sets, to change type: /drg ws
    Ws_Default = {
        Ammo = 'Tiphia Sting',
        Head = 'Voyager Sallet',
        Neck = 'Breeze Gorget',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Brutal Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Hct. Leggings',
    },
    Ws_HighAcc = {
    },
};
profile.Sets = sets;

local MageSubs = T{
    'WHM',
    'RDM'
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcdisplay.CreateToggle('(F10) MDT', false);
    gcdisplay.CreateToggle('(F12) PDT', false);
    gcdisplay.CreateToggle('(F9) MP', false);
    gcdisplay.CreateCycle('/drg idle ', { [1] = 'Default', [2] = 'ALT' });      --/drg idle
    gcdisplay.CreateCycle('/drg tp ', { [1] = 'Default', [2] = 'HighAcc' });    --/drg tp
    gcdisplay.CreateCycle('/drg ws ', { [1] = 'Default', [2] = 'HighAcc' });    --/drg ws
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /drg mptoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /drg mdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /drg pdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /drg /lac fwd');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    gcinclude.SetAlias();
    gcdisplay.Initialize();
    profile.SetLockStyle();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /drg');
    gcinclude.ClearAlias();
    gcdisplay.Destroy();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    if (args[1] == 'idle') then gcdisplay.AdvanceCycle('/drg idle ') end
    if (args[1] == 'tp') then gcdisplay.AdvanceCycle('/drg tp ') end
    if (args[1] == 'ws') then gcdisplay.AdvanceCycle('/drg ws ') end
    if (args[1] == 'mdttoggle') then gcdisplay.AdvanceToggle('(F10) MDT') end
    if (args[1] == 'pdttoggle') then gcdisplay.AdvanceToggle('(F12) PDT') end
    if (args[1] == 'mptoggle') then gcdisplay.AdvanceToggle('(F9) MP') end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local petAction = gData.GetPetAction();

    if (ethereal_earring == true and MageSubs:contains(player.SubJob)) then
        gFunc.Equip(ethereal_earring_slot, 'Ethereal Earring')
    end
    if (petAction ~= nil and MageSubs:contains(player.SubJob)) then
        gFunc.EquipSet(sets.Breath_Bonus);
        return;
    end
    if (player.Status == 'Idle') then
        gFunc.EquipSet('IDLE_' .. gcdisplay.GetCycle('/drg idle '));
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/drg tp '));
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
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'SAM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'WHM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'RDM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    
    gFunc.EquipSet(sets.HPThreshold);
        
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
    
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.HPThreshold);
    if (spell.Skill == 'Ninjutsu') then
        if string.contains(spell.Name, 'Utsusemi') then
            gFunc.EquipSet(sets.Utsu);
        end
    end 
    if string.contains(spell.Name, 'Sneak') then
        gFunc.Equip('Feet', 'Dream Boots +1');
    elseif string.contains(spell.Name, 'Invisible') then
        gFunc.Equip('Hands', 'Dream Mittens +1');
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
    -- /wsdistance or /wsdistance ##  (to change ws cancel)
    local canWS = gcinclude.CheckWsBailout();
        if (canWS == false) then gFunc.CancelAction() return;
        else
            local action = gData.GetAction();
            gFunc.EquipSet('WS_' .. gcdisplay.GetCycle('/drg ws '));
    end
        
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Jump') or (action.Name == 'High Jump') or (action.Name == 'Super Jump') then
        gFunc.EquipSet(sets.Jump_All)
    elseif (action.Name == 'Call Wyvern') then
        gFunc.EquipSet(sets.Call_Wyvern)
    elseif (action.Name == 'Spirit Link') then
        gFunc.EquipSet(sets.Spirit_Link)
    elseif (action.Name == "Steady Wing") then
        gFunc.EquipSet(sets.Breath_Bonus);
        return;
    end
end

return profile;