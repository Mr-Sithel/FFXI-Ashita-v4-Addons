local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
gcinclude.VarTable();

-- Whatever Town Movement speed body(s) you have or don't, change lines 4-7 to True or False in the gcinclude.lua
-- /wsdistance or /wsdistance ##  (to change ws cancel range)
-- /thf idle to change Idle sets from Default/ALT
-- /thf tp to change Tp sets from Default/HighAcc
-- /thf ws to change Ws sets from Default/HighAcc (Evisceration, Shark Bite, Mercy Stroke have their own set)
-- F9 Toggles locking a TH set (True by default)
-- F10 Toggles locking a MDT set
-- F12 Toggles locking a EVA set
-- Check below for /lockstyleset (4 is being used by default)

local ta_rogue_armlets = true

--Idle Sets, to change type: /thf idle
local sets = {
    Idle_Default = {
    },
    Idle_ALT = {
    },
    --TP Sets, to change type: /thf tp 
    Tp_Default = {
    },
    Tp_HighAcc = {
    },
    Town = {
    },
    Precast = {
    },
    Utsu = {
    },
    -- Toggle TH set with F9
    TH = {
        Neck = 'Nanaa\'s Lucky Charm',
        Hands = 'Assassin\'s Armlets +1',
    },
    -- Toggle lock MDT set with F10
    MDT = {
    },
    -- Toggle lock EVA set with F12
    EVA = {
    },

    SA = {
    },
    TA = {
        Hands = 'Rogue\'s Armlets +1',
    },
    SATA = { 
        Hands = 'Rogue\'s Armlets +1',
    },


    Flee = {
        Feet = 'Rogue\'s Poulaines +1',
    },
    Hide = {
        Body = 'Rogue\'s Vest +1',
    },
    Steal = {
        Head = 'Rogue\'s Bonnet +1',
        Legs = 'Assassin\'s Culottes +1',
        Feet = 'Rogue\'s Poulaines +1',
    },
    Mug = {
        Head = 'Assassin\'s Bonnet +1',
    },

    Ranged = {
    },

    -- Used for Bloody Bolts
    Ranged_INT = {
    },
        
    -- WS Sets, to change type: /thf ws
    Ws_Default = {
    },
    Ws_HighAcc = {
    },
    
    -- WS Specfic Sets
    Evisceration = {
    },
    Shark_Bite = {
    },
    Mercy_Stroke = {
    },
};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcdisplay.CreateToggle('(F10) MDT', false);
    gcdisplay.CreateToggle('(F12) EVA', false);
    gcdisplay.CreateToggle('(F9) TH', false);
    gcdisplay.CreateCycle('/thf idle ', { [1] = 'Default', [2] = 'ALT' });      --/thf idle
    gcdisplay.CreateCycle('/thf tp ', { [1] = 'Default', [2] = 'HighAcc' });    --/thf tp
    gcdisplay.CreateCycle('/thf ws ', { [1] = 'Default', [2] = 'HighAcc' });    --/thf ws
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /thf thtoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /thf mdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /thf evatoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /thf /lac fwd');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    gcinclude.SetAlias();
    gcdisplay.Initialize();
    profile.SetLockStyle();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /thf');
    gcinclude.ClearAlias();
    gcdisplay.Destroy();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    if (args[1] == 'idle') then gcdisplay.AdvanceCycle('/thf idle ') end
    if (args[1] == 'tp') then gcdisplay.AdvanceCycle('/thf tp ') end	
    if (args[1] == 'ws') then gcdisplay.AdvanceCycle('/thf ws ') end	
    if (args[1] == 'mdttoggle') then gcdisplay.AdvanceToggle('(F10) MDT') end
    if (args[1] == 'evatoggle') then gcdisplay.AdvanceToggle('(F12) EVA') end
    if (args[1] == 'thtoggle') then gcdisplay.AdvanceToggle('(F9) TH') end
end

profile.HandleDefault = function()
    gFunc.EquipSet('IDLE_' .. gcdisplay.GetCycle('/thf idle '));
    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    local player = gData.GetPlayer();
        if (player.Status == 'Engaged') then
            gFunc.EquipSet(sets.Tp_Default)
            if (gcdisplay.GetCycle('/thf tp ') ~= 'Default') then
                gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/thf tp ')) end
            if (gcdisplay.GetToggle('(F9) TH') == true) then gFunc.EquipSet(sets.TH) end
        end
        if (sa == 1) and (ta == 1) then
            gFunc.EquipSet('SATA');
        elseif (sa == 1) then
            gFunc.EquipSet('SA');
        elseif (ta == 1) then
            gFunc.EquipSet('TA');
        end
        
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
        
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) EVA') == true) then gFunc.EquipSet(sets.EVA) end

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
    end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    
    gFunc.EquipSet(sets.Precast);
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) EVA') == true) then gFunc.EquipSet(sets.EVA) end
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    if (gcdisplay.GetToggle('(F9) TH') == true) then gFunc.EquipSet(sets.TH) end
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
    if (gcdisplay.GetToggle('(F12) EVA') == true) then gFunc.EquipSet(sets.EVA) end
end

profile.HandleItem = function()
    gcinclude.DoItem(); 
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);

    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) EVA') == true) then gFunc.EquipSet(sets.EVA) end
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)
    local equipment = gData.GetEquipment()
    if equipment.Ammo ~= nil then
        return equipment.Ammo.Name;
    else
        return 'Empty';
    end
    
    local ammo = ((gData.GetEquipment())['Ammo'])['Name']
    if (ammo == 'Bloody Bolt') then
        gFunc.EquipSet(sets.Ranged_INT)
    end

    if (gcdisplay.GetToggle('(F9) TH') == true) then gFunc.EquipSet(sets.TH) end
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) EVA') == true) then gFunc.EquipSet(sets.EVA) end
end

profile.HandleWeaponskill = function()
    -- /wsdistance or /wsdistance ##  (to change ws cancel)
    local canWS = gcinclude.CheckWsBailout();
        if (canWS == false) then gFunc.CancelAction() return;
        else
            local action = gData.GetAction();
    
        if (action.Name == 'Evisceration') then
            gFunc.EquipSet(sets.Evisceration);
        elseif (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.Shark_Bite);
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.Mercy_Stroke);
        else
            gFunc.EquipSet('WS_' .. gcdisplay.GetCycle('/thf ws '));
        end
    end
    
    local ta = gData.GetBuffCount('Trick Attack') 
    if (ta == 1) then
        if (ta_rogue_armlets) then 
            gFunc.Equip('Hands', 'Rogue\'s Armlets +1')
        end
    end

    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) EVA') == true) then gFunc.EquipSet(sets.EVA) end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    end

    if (gcdisplay.GetToggle('(F9) TH')) then gFunc.EquipSet(sets.TH) end
end

return profile;