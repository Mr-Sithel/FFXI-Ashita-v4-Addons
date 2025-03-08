local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude.VarTable();

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Fortitude Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Noble\'s Tunic',
        Hands = 'Blessed Mitts',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Scouter\'s Rope',
        Legs = 'Cleric\'s Pantaln.',
        Feet = 'Rostrum Pumps',
    },       
    Tp_Default = { 
        Ammo = 'Tiphia Sting',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Brutal Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Blessed Mitts',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'White Cape +1',
        Waist = 'Swift Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Errant Pigaches',        
    },
	Tp_HighAcc = {                        
    },    
	Town = {         		
    },	
	Resting = { 
        Main = 'Pluto\'s Staff',
        Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Checkered Scarf',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Errant Hpl.',
        Hands = 'Blessed Mitts',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Cleric\'s Belt',
        Legs = 'Baron\'s Slops',
        Feet = 'Rostrum Pumps', 		
    },
	Precast = { 
        Main = 'Rucke\'s Rung',
        Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Checkered Scarf',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Blessed Mitts',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Rostrum Pumps',       
	},
    Cure_Precast = {
        Ear1 = 'Mendi. Earring',
        Feet = 'Vanya Clogs',
    },
    -- Haste Gear for Utusemi: Ichi or Ni
    Utsu = { 
        Main = 'Terra\'s Staff',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Bloodbead Amulet',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Sha\'ir Manteel',
        Hands = 'Dusk Gloves',
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Swift belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Rostrum Pumps',         
    },    
    Regen = {
        Main = 'Rucke\'s Rung',
        Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Blessed Mitts',
        Ring1 = 'Sapphire Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Blessed Trousers',
        Feet = 'Errant Pigaches',
    },
	Cure = {
        Main = 'Apollo\'s Staff',
        Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Noble\'s Tunic',
        Hands = 'Blessed Mitts',
        Ring1 = 'Sapphire Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Blessed Trousers',
        Feet = 'Errant Pigaches',        
	},
	Enhancing = {
        Main = 'Rucke\'s Rung',
        Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Blessed Mitts',
        Ring1 = 'Sapphire Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Cleric\'s Pantaln.',
        Feet = 'Errant Pigaches',
	},
	Divine = {
		Ammo = 'Fortune Egg',
        Head = 'Cleric\'s Cap',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Noble\'s Tunic',
        Hands = 'Blessed Mitts',
        Ring1 = 'Sapphire Ring',
        Ring2 = 'Sapphire Ring',
        Back = 'White Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Blessed Trousers',
        Feet = 'Errant Pigaches',		
    },
    Enfeebling = {
		Neck = 'Enfeebling Torque',
    },
    Stoneskin = {
		Neck = 'Enhancing Torque',
    },
    Phalanx = {  
		Neck = 'Enhancing Torque',
    },
    Nuke = {         
    },
    Cursna = {         
    },    
    Drain_Aspir = {         
    },     
    Refresh = { 
        Head = 'ignore',
        Body = 'Royal Cloak',       		
	},
	MDT = { 
        Main = 'Terra\'s Staff',		               
	},
	PDT = { 
        Main = 'Terra\'s Staff',		      	
	},	
    Ws_Default = {
        Ammo = 'Tiphia Sting',
        Head = 'Voyager Sallet',
        Neck = 'Breeze Gorget',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Brutal Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Blessed Mitts',
        Ring1 = 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'White Cape +1',
        Waist = 'Swift Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Errant Pigaches',        
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
	gcdisplay.CreateToggle('(F9) Refresh', false);    
	gcdisplay.CreateCycle('/whm tp ', { [1] = 'Default', [2] = 'HighAcc' }); --/whm tp      
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /whm refreshtoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /whm mdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /whm pdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /whm /lac fwd'); 
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');	
	gcdisplay.Initialize();
	gcinclude.SetAlias();
    profile.SetLockStyle();
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /whm');
	gcdisplay.Destroy();
	gcinclude.ClearAlias();	
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);    
    
	if (args[1] == 'tp') then    
		gcdisplay.AdvanceCycle('/whm tp ');
	end    
    if (args[1] == 'mdttoggle') then
		gcdisplay.AdvanceToggle('(F10) MDT');
	end
	if (args[1] == 'pdttoggle') then
		gcdisplay.AdvanceToggle('(F12) PDT');
    end
	if (args[1] == 'refreshtoggle') then
		gcdisplay.AdvanceToggle('(F9) Refresh');
    end
end

profile.HandleDefault = function() 	
    local player = gData.GetPlayer(); 
     
    if (player.Status == 'Idle') then
        gFunc.EquipSet(sets.Idle);       
    elseif (player.Status == 'Engaged') then		
		gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/whm tp '));
	elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);		
	end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

	if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
	if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
	if (gcdisplay.GetToggle('(F9) Refresh') == true) then gFunc.EquipSet(sets.Refresh) end	
	
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
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'BLM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'RDM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    elseif (player.SubJob == 'SMN') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');  -- Stylist Plugin Needed
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 4", '',true)
    end    
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();	
	
    gFunc.EquipSet(sets.Precast);
    
    if (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end
	
	if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
	if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
	if (gcdisplay.GetToggle('(F9) Refresh') == true) then gFunc.EquipSet(sets.Refresh) end    
end

profile.HandleMidcast = function()    
    local spell = gData.GetAction();       
    local action = gData.GetAction(); 
    local target = gData.GetActionTarget();    

    gFunc.Equip('main', ElementalStaffTable[spell.Element]);
		
    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        if string.match(spell.Name, 'Phalanx') then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, 'Sneak') then
            gFunc.Equip('Feet', 'Dream Boots +1');
        elseif string.contains(spell.Name, 'Invisible') then
            gFunc.Equip('Hands', 'Dream Mittens +1');        
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);        
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);        
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
	elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Divine);
        if string.match(spell.Name, 'Holy') or string.match(spell.Name, 'Banish')then
            gFunc.EquipSet(sets.Holy_Banish);        
        end
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Enfeebling); -- mostly macc anyways
        if (string.contains(spell.Name, 'Drain') or string.contains(spell.Name, 'Aspir')) then
            gFunc.EquipSet(sets.Drain_Aspir);
        end
    elseif (action.Skill == 'Ninjutsu') then    
            gFunc.EquipSet(sets.Utsu); 
    end 

	if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
	if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
	if (gcdisplay.GetToggle('(F9) Refresh') == true) then gFunc.EquipSet(sets.Refresh) end
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
	if (gcdisplay.GetToggle('(F9) Refresh') == true) then gFunc.EquipSet(sets.Refresh) end
end

profile.HandleAbility = function()
    local action = gData.GetAction();    
end

return profile;