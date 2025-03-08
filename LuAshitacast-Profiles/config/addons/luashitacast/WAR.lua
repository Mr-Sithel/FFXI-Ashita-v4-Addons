local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude.VarTable();

local sets = {
    Idle_Default = {
        Ammo = 'Bomb Core',
        Head = 'Panther Mask',
        Neck = 'Spike Necklace',
        Ear1 = 'Attila\'s Earring',
        Ear2 = 'Bushinomimi',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Fighter\'s Calligae',
    },
    Idle_ALT = {
    },
    Idle_L60 = {
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Fighter\'s Calligae',
    },
    Tp_Default = {
        Ammo = 'Bomb Core',
        Head = 'Panther Mask',
        Neck = 'Spike Necklace',
        Ear1 = 'Attila\'s Earring',
        Ear2 = 'Bushinomimi',           -- Ear2 = 'Brutal Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Alumine Brayettes',     -- Legs = 'Byakko\'s Haidate',
        Feet = 'Fighter\'s Calligae',   -- Feet = 'Dusk Ledelsens',
    },
    Tp_HighAcc = {
        Ammo = 'Bomb Core',
        Head = 'Alumine Salade',        -- Head = 'Optical Hat',
        Neck = 'Spike Necklace',        -- Neck = 'Fortitude Torque',
        Ear1 = 'Attila\'s Earring',
        Ear2 = 'Bushinomimi',           -- Ear2 = 'Brutal Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Alumine Brayettes',     -- Legs = 'Byakko\'s Haidate',
        Feet = 'Fighter\'s Calligae',   -- Feet = 'Dusk Ledelsens',
    },
    Tp_L60 = {
        Head = 'Alumine Salade',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Alumine Moufles',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle',
        Waist = 'Swift Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Fighter\'s Calligae',
    }, 
    Town = {
    },
    MP = {
        Legs = 'Savage loincloth',
    },
    Resting = {
    },
    Precast = {
    },
    Utsu = {
    },
    MDT = {
    },
    PDT = {
    },
    Berserk = {
        Feet = 'Warrior\'s Calligae',
    },
    Warcry = {
        Head = 'Warrior\'s Mask',
    },
    Aggressor = {
        Body = 'Warrior\'s Lorica',
    },
    -- Enimity gear for provoke
    Provoke = { 
        Head = 'Fighter\'s Mask',
        Body = 'Fighter\'s Lorica',
        Hands = 'Fighter\'s Mufflers',
        Waist = 'Warwolf Belt',
        Legs = 'Fighter\'s Cuisses',
        Feet = 'Fighter\'s Calligae',
    },
    Ws_Default = {
        Ammo = 'Bomb Core',
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',        -- Steel Cyclone - Breeze Gorget
        Ear1 = 'Spike Earring',         -- 'Brutal Earring',
        Ear2 = 'Spike Earring',         -- 'Bushinomimi',
        Body = 'Haubergeon',            -- 'Kirin\'s Osode',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Puissance Ring',       -- 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',     -- 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',         -- 'Warwolf Belt',
        Legs = 'Ryl.Kgt. Breeches',     -- 'Warrior\'s Cuisses',
        Feet = 'Savage Gaiters',
    },
    Ws_HighAcc = {
    },    
    Ws_L60 = {
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle',
        Waist = 'R.K. Belt +1',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Savage Gaiters',
    },    	
    RagingRush = {
        Ammo = 'Bomb Core',
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',        -- Steel Cyclone and R.R. - Aqua Gorget, Snow Gorget
        Ear1 = 'Spike Earring',
        Ear2 = 'Bushinomimi',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Savage Gaiters',
    },
    SteelCyclone = {
        Ammo = 'Bomb Core',
        Head = 'Voyager Sallet',        -- 'Genbu\'s Kabuto',
        Neck = 'Spike Necklace',        -- Steel Cyclone - Breeze Gorget - Aqua Gorget
        Ear1 = 'Spike Earring',         -- 'Brutal Earring',
        Ear2 = 'Bushinomimi',           -- 'Bushinomimi',
        Body = 'Haubergeon',            -- 'Kirin\'s Osode',
        Hands = 'Pallas\'s Bracelets',  -- 'Hecatomb Mittens',
        Ring1 = 'Puissance Ring',       -- 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Ryl.Kgt. Breeches',     -- 'Warrior\'s Cuisses',
        Feet = 'Savage Gaiters',        -- 'Hct. Leggings', - 'Rutter Sabatons',
    },
    Rampage = {
        Ammo = 'Bomb Core',
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Fighter\'s Mufflers',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle',
        Waist = 'R.K. Belt +1',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Savage Gaiters',
    },
};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcdisplay.CreateToggle('(F10) MDT', false);
    gcdisplay.CreateToggle('(F12) PDT', false);
    gcdisplay.CreateToggle('(F9) MP', false);
    gcdisplay.CreateCycle('/war idle ', { [1] = 'Default', [2] = 'ALT', [3] = 'L60' });     --/war idle
    gcdisplay.CreateCycle('/war tp ', { [1] = 'Default', [2] = 'HighAcc', [3] = 'L60' });   --/war tp
    gcdisplay.CreateCycle('/war ws ', { [1] = 'Default', [2] = 'HighAcc', [3] = 'L60' });   --/war ws
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /war mptoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /war mdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /war pdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /war /lac fwd');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /lss /lockstyleset 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    --AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    gcdisplay.Initialize();
    gcinclude.SetAlias();
    profile.SetLockStyle();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /war');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /lss');
    gcdisplay.Destroy();
    gcinclude.ClearAlias();	
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    if (args[1] == 'idle') then
        gcdisplay.AdvanceCycle('/war idle ');
    end
    if (args[1] == 'tp') then
        gcdisplay.AdvanceCycle('/war tp ');
    end
    if (args[1] == 'ws') then
        gcdisplay.AdvanceCycle('/war ws ');
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

    if (player.Status == 'Idle') then
        gFunc.EquipSet('IDLE_' .. gcdisplay.GetCycle('/war idle '));
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/war tp '));
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
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'THF') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 3');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
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
    local spell = gData.GetAction();

    if (spell.Skill == 'Ninjutsu') then
        if string.contains(spell.Name, 'Utsusemi') then
            gFunc.EquipSet(sets.Utsu);
        end
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
            gFunc.EquipSet('WS_' .. gcdisplay.GetCycle('/war ws '));
        if (action.Name == 'Raging Rush') then
            gFunc.EquipSet(sets.RagingRush);
        elseif (action.Name == 'Steel Cyclone') then
            gFunc.EquipSet(sets.SteelCyclone);
        elseif (action.Name == 'Rampage') then
            gFunc.EquipSet(sets.Rampage);
        end
    end
        
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
    if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Berserk') then
        gFunc.EquipSet(sets.Berserk)
    elseif (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Aggressor') then
        gFunc.EquipSet(sets.Aggressor)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
    end
end

return profile;