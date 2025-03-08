local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude.VarTable();

local sorcerers_tonban = 'Src. Tonban +1'

local sets = {
    --Idle Set
    Idle = { 
        Main = 'Terra\'s Staff',               
    },     
    
    --Nuke Set
    Nuke = {               
    },	

    --TP Set
    Tp = {                
    },
    
    --Town Gear
	Town = { 		
    },
	
	Resting = { 
        Main = 'Pluto\'s Staff',        		
    },
	
	-- Precast
	Fastcast = {        
        Feet = 'Rostrum Pumps',        
	},
	
	--Mid Cast Sets
	Enhancing = {        
	},
	Cure = {        
	},
	Elemental = {        
	},
	Enfeebling = {                
	},
	Dark = {               
	},
	Stun = {        
	},
	Divine = {        
	},
	Haste = {        
	},
    Stoneskin = {
    },
    Enfeeb_Mind = {
    },
    Enfeeb_INT = {
    },
    Ele_DEBUFF = {
    },
    
	
	-- Lock Toggle Sets	
	MDT = {                
	},
	PDT = {        	
	},
	
	--Default Weaponskill
    Ws = {        
    },
    
};
profile.Sets = sets;

local ElementalStaff = {
    ['Fire'] = 'Vulcan\'s Staff',    
    ['Earth'] = 'Terra\'s Staff',
    ['Water'] = 'Neptune\'s Staff',
    ['Wind'] = 'Auster\'s Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Pluto\'s Staff'
};

local ElementalObi = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin Obi'    
};

local MndDebuffs = T{ 'Slow', 'Paralyze', 'Silence' };
local IntDebuffs = T{ 'Blind','Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind', 'Gravity', 'Dispel', 'Poison', 'Poison II' };
local ElementalDebuffs = T{ 'Burn', 'Choke', 'Shock', 'Rasp', 'Drown', 'Frost' };

local DayElementTable = {
    ['Firesday'] = 'Fire',
    ['Earthsday'] = 'Earth',
    ['Watersday'] = 'Water',
    ['Windsday'] = 'Wind',
    ['Iceday'] = 'Ice',
    ['Lightningday'] = 'Thunder',
    ['Lightsday'] = 'Light',
    ['Darksday'] = 'Dark'
};

function ObiCheck(spell)
    local element = spell.Element;
    local zone = gData.GetEnvironment();
    
    local badEle = {
        ['Fire'] = 'Water',
        ['Earth'] = 'Wind',
        ['Water'] = 'Thunder',
        ['Wind'] = 'Ice',
        ['Ice'] = 'Fire',
        ['Thunder'] = 'Earth',
        ['Light'] = 'Dark',
        ['Dark'] = 'Light'
    };
    
    local weight = 0;
    
    --Day Comparison
    if (DayElementTable[zone.Day] == element) then
        weight = weight + 1;
    elseif (DayElementTable[zone.Day] == badEle[element]) then
        weight = weight - 1;
    end
    
    --Weather Comparison
    if string.find(zone.Weather, element) then
        if string.find(zone.Weather, 'x2') then
            weight = weight + 2;
        else
            weight = weight + 1;
        end
    elseif string.find(zone.Weather, badEle[element]) then
        if string.find(zone.Weather, 'x2') then
            weight = weight - 2;
        else
            weight = weight - 1;
        end
    end    
    
    return weight;
end



profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	gcdisplay.CreateToggle('(F10) MDT', false);
	gcdisplay.CreateToggle('(F12) PDT', false);	
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /blm mdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /blm pdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /blm /lac fwd'); 
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 9');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
	gcdisplay.Initialize();
	gcinclude.SetAlias();
    profile.SetLockStyle();
end

profile.OnUnload = function()	
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /blm');
	gcdisplay.Destroy();
	gcinclude.ClearAlias();	
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);

    if (args[1] == 'mdttoggle') then
		gcdisplay.AdvanceToggle('(F10) MDT');
	end    
	if (args[1] == 'pdttoggle') then
		gcdisplay.AdvanceToggle('(F12) PDT');
    end	
end

profile.HandleDefault = function()	
    local player = gData.GetPlayer();
        gFunc.EquipSet(sets.Idle);           
    if (player.Status == 'Engaged') then		
		gFunc.EquipSet(sets.Tp);
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
    if (player.SubJob == 'WHM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 1", '',true)
    elseif (player.SubJob == 'RDM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 1", '',true)
    elseif (player.SubJob == 'NIN') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 1", '',true)
    end    
end

profile.HandlePrecast = function()
    local action = gData.GetAction();    
    
    gFunc.EquipSet(sets.Fastcast);
	if (action.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(action.Name)) then
			gFunc.EquipSet(sets.Fastcast);			
		end
	end    
end

profile.HandleMidcast = function()     
	local player = gData.GetPlayer();
    local environment = gData.GetEnvironment();	
    local action = gData.GetAction();
	
	if (action.Skill == 'Enfeebling Magic') then
        if	(MndDebuffs:contains(action.Name)) then
			gFunc.EquipSet(sets.Enfeeb_Mind);
			gFunc.Equip('main', ElementalStaff[action.Element]);			
        end

        if	(IntDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeeb_INT);
            gFunc.Equip('main', ElementalStaff[action.Element]);			
        end
		
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);
		end
	
	elseif (action.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(action.Name)) then			
			gFunc.EquipSet(sets.Ele_DEBUFF);
        else
            gFunc.EquipSet(sets.Nuke);
			gFunc.Equip('main', ElementalStaff[action.Element]);		
		end
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);            
		end
        if (action.Element == environment.DayElement) and sorcerers_tonban ~= '' and (player.MainJob == 'BLM') then
            gFunc.Equip('Legs', sorcerers_tonban)
        end
	elseif (action.Skill == 'Dark Magic') then
		gFunc.Equip('main', ElementalStaff[action.Element]);
		if (action.Name == 'Stun') then
			gFunc.EquipSet(sets.Stun);
		else
			gFunc.EquipSet(sets.Dark);
		end        		
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);
		end	
	elseif (action.Skill == 'Healing Magic') then
		gFunc.EquipSet(sets.Cure);
			if ObiCheck(action) >= 1 then
				gFunc.Equip('waist', ElementalObi[action.Element]);
			end		
	elseif (action.Skill == 'Enhancing Magic') then
		if (action.Name == 'Stoneskin') then
			gFunc.EquipSet(sets.Stoneskin);		
		elseif (action.Name == 'Phalanx') or string.match(action.Name, 'Bar') then
			gFunc.EquipSet(sets.Enhancing);
		else
			gFunc.EquipSet(sets.Haste);
		end
	end
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
			gFunc.EquipSet(sets.Ws);
		end
end

profile.HandleAbility = function()    
end

return profile;