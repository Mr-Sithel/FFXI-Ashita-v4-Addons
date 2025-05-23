local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude.VarTable();

-- Whatever Town Movement speed body(s) you have or don't, change lines 4-7 to True or False in the gcinclude.lua
-- /wsdistance or /wsdistance ##  (to change ws cancel range)
-- /brd tp to change Tp sets from Default/HighAcc
-- F9 Toggles locking a HP set
-- F10 Toggles locking a MDT set
-- F12 Toggles locking a PDT set
-- Check below for /lockstyleset (4 is being used by default)

local minstrels_earring = false
local minstrels_earring_slot = 'Ear2'

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
    },
    Tp_Default = {
    },
    Tp_HighAcc = {
    },
    Town = {
    },
    Resting = {
        Main = 'Pluto\'s Staff',
    },
    Precast = {
        Main = 'Terra\'s Staff',
    },
    Precast_Songs = {
        Ear2 = 'Loquac. Earring',
        Body = 'Sha\'ir Manteel',
        Ring2 = 'Minstrel\'s Ring',
        Feet = 'Rostrum Pumps',
	},
    Precast_Songs_HPDown = {
        Head = 'Genbu\'s Kabuto',
        Neck = 'Bloodbead Amulet',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Legs = 'Bard\'s Cannions',
        Feet = 'Rostrum Pumps',
    },
    -- Haste Gear for Utusemi: Ichi or Ni
    Utsu = { 
        Main = 'Terra\'s Staff',
    },    
    Cure = { 
        Main = 'Apollo\'s Staff',
    },
    Stoneskin = {
    },
    Enhancing = {
    };    
    Sing_Default = {
        Head = 'Bard\'s Roundlet',
    },
    Sing_Buff = {
        Main = 'Chanter\'s Staff',
    },
    Sing_Debuff = {
        Body = 'Kirin\'s Osode',
    },
    HP = {
        Main = 'Terra\'s Staff',
    },
    MDT = { 
        Main = 'Terra\'s Staff',
    },
    PDT = {
        Main = 'Terra\'s Staff',
    },
    Ws_Default = {
    },
};
profile.Sets = sets;

local ElementalStaffTable = {
    ['Fire'] = 'Vulcan\'s Staff',       -- 'Fire Staff'
    ['Earth'] = 'Terra\'s Staff',       -- 'Earth Staff'
    ['Water'] = 'Neptune\'s Staff',     -- 'Water Staff'
    ['Wind'] = 'Auster\'s Staff',       -- 'Wind Staff'
    ['Ice'] = 'Aquilo\'s Staff',        -- 'Ice Staff'
    ['Thunder'] = 'Jupiter\'s Staff',   -- 'Thunder Staff'
    ['Light'] = 'Apollo\'s Staff',      -- 'Light Staff'
    ['Dark'] = 'Pluto\'s Staff',        -- 'Dark Staff'
};


profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcdisplay.CreateToggle('(F10) MDT', false);
    gcdisplay.CreateToggle('(F12) PDT', false);
    gcdisplay.CreateToggle('(F9) HP-Down', true);
    gcdisplay.CreateCycle('/brd tp ', { [1] = 'Default', [2] = 'HighAcc' }); --/brd tp
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /brd hpdowntoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /brd mdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /brd pdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /brd /lac fwd'); 
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 5');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    gcdisplay.Initialize();
    gcinclude.SetAlias();
    profile.SetLockStyle();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /brd');
    gcdisplay.Destroy();
    gcinclude.ClearAlias();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    
    if (args[1] == 'tp') then
    gcdisplay.AdvanceCycle('/brd tp ');
    end
    if (args[1] == 'mdttoggle') then
    gcdisplay.AdvanceToggle('(F10) MDT');
    end
    if (args[1] == 'pdttoggle') then
    gcdisplay.AdvanceToggle('(F12) PDT');
    end
    if (args[1] == 'hpdowntoggle') then
    gcdisplay.AdvanceToggle('(F9) HP-Down');
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
     
    if (minstrels_earring and player.HPP <= 25) then
        gFunc.Equip(minstrels_earring_slot, 'Minstrel\'s Earring')
    end  
    if (player.Status == 'Idle') then
        gFunc.EquipSet(sets.Idle);
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/brd tp '));
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end

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
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on'); -- Stylist plugin is needed for this to work
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'WHM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on'); -- Stylist plugin is needed for this to work
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    end
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') and (gcdisplay.GetToggle('(F9) HP-Down') == true) then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet(sets.Precast_Songs)
    else
        gFunc.EquipSet(sets.Precast)
    end
    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
	if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction(); 
    local equipment = gData.GetEquipment();
    local action = gData.GetAction();

    gFunc.Equip('main', ElementalStaffTable[spell.Element]);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        if string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Sneak') then
            gFunc.Equip('Feet', 'Dream Boots +1');
        elseif string.contains(spell.Name, 'Invisible') then
            gFunc.Equip('Hands', 'Dream Mittens +1');
        elseif (spell.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure);
        end
    elseif (spell.Skill == 'Singing') then
            gFunc.EquipSet(sets.Sing_Default)
        if (string.contains(spell.Name, 'Horde Lullaby')) then
            gFunc.Equip('Range', 'Mary\'s horn')
            gFunc.EquipSet(sets.Sing_Debuff)
        elseif (string.contains(spell.Name, 'Foe Lullaby')) then
            gFunc.Equip('Range', 'Mary\'s horn')
            gFunc.EquipSet(sets.Sing_Debuff)
        elseif (string.contains(spell.Name, 'March')) then
            gFunc.Equip('Range', 'Faerie Piccolo')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Carol')) then
            gFunc.Equip('Range', 'Crumhorn +1')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Madrigal')) then
            gFunc.Equip('Range', 'Traversiere +1')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Paeon')) then
            gFunc.Equip('Range', 'Ebony Harp +1')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Ballad')) then
            gFunc.Equip('Range', 'Balladeer\'s Harp')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Minuet')) then
            gFunc.Equip('Range', 'Cornette +1')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Elegy')) then
            gFunc.Equip('Range', 'Horn +1')
            gFunc.EquipSet(sets.Sing_Debuff)
        elseif (string.contains(spell.Name, 'Requiem')) then
            gFunc.Equip('Range', 'Flute +1')
            gFunc.EquipSet(sets.Sing_Debuff)
        elseif (string.contains(spell.Name, 'Threnody')) then
            gFunc.Equip('Range', 'Piccolo +1')
            gFunc.EquipSet(sets.Sing_Debuff)
        elseif (string.contains(spell.Name, 'Minne')) then
            gFunc.Equip('Range', '')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Mambo')) then
            gFunc.Equip('Range', 'Gemshorn +1')
            gFunc.EquipSet(sets.Sing_Buff)
        elseif (string.contains(spell.Name, 'Mazurka')) then
            gFunc.Equip('Range', 'Harlequin\'s horn')
            gFunc.EquipSet(sets.Sing_Buff)
        end
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Utsu); 
    end

    if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end
    if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
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
end

profile.HandleAbility = function()
    local action = gData.GetAction();
end

return profile;