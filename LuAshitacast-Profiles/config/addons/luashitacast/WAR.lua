local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude.VarTable();
-- Which ever you have, change Town body to true in the gcinclude.lua

local sets = {
    Idle_Default = {
        
    },
    --Idle Sets for Level Sync 20, 30, 40, 50, 60 to change type: /war idle
    Idle_L20 = {                
    },
    Idle_L30 = {                       
    },
    Idle_L40 = {          
    },
    Idle_L50 = {                      
    },
    Idle_L60 = {          
    },    
    Tp_Default = {        
    },
	Tp_HighAcc = {             
    },
    --TP Sets for Level Sync 20, 30, 40, 50, 60 to change type: /war tp
    Tp_L20 = {                
    },
    Tp_L30 = {                       
    },
    Tp_L40 = {                     
    },
    Tp_L50 = {                     
    },
    Tp_L60 = {                       
    }, 
	Town = { 		
    },
	MP = {		
	},
	Resting = { 
		Head = 'Fighter\'s Mask +1',
		Legs = 'Fighter\'s Cuisses +1',
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
	},
    Ws_Default = {        
    },
    --WS Sets for Level Sync 20, 30, 40, 50, 60 to change type: /war ws
    Ws_L20 = {        
    },
    Ws_L30 = {        
    },
    Ws_L40 = {            
    },
    Ws_L50 = {             
    },
    Ws_L60 = {       
    },
    Sturmwind = {        
    },	
	RagingRush = {        
    },
    PentaThrust = {        
    },
	Rampage = {        
    },
};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	gcdisplay.CreateToggle('(F10) MDT', false);
	gcdisplay.CreateToggle('(F12) PDT', false);
	gcdisplay.CreateToggle('(F9) MP', false);
    gcdisplay.CreateCycle('/war idle ', { [1] = 'Default', [2] = 'L20', [3] = 'L30', [4] = 'L40', [5] = 'L50', [6] = 'L60' }); --/war idle
	gcdisplay.CreateCycle('/war tp ', { [1] = 'Default', [2] = 'HighAcc', [3] = 'L20', [4] = 'L30', [5] = 'L40', [6] = 'L50', [7] = 'L60' }); --/war tp
    gcdisplay.CreateCycle('/war ws ', { [1] = 'Default', [2] = 'L20', [3] = 'L30', [4] = 'L40', [5] = 'L50', [6] = 'L60' }); --/war ws
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /war mptoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /war mdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /war pdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /war /lac fwd'); 
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
	gcdisplay.Initialize();
	gcinclude.SetAlias();
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /war');
	gcdisplay.Destroy();
	gcinclude.ClearAlias();	
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    if (args[1] == 'idle') then gcdisplay.AdvanceCycle('/war idle ') end
	if (args[1] == 'tp') then gcdisplay.AdvanceCycle('/war tp ') end	
    if (args[1] == 'ws') then gcdisplay.AdvanceCycle('/war ws ') end	
    if (args[1] == 'mdttoggle') then gcdisplay.AdvanceToggle('(F10) MDT') end	
	if (args[1] == 'pdttoggle') then gcdisplay.AdvanceToggle('(F12) PDT') end    
	if (args[1] == 'mptoggle') then gcdisplay.AdvanceToggle('(F9) MP') end     	    
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
	if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT)	end
	if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
	
	gcinclude.TownGear();
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();    
    
    gFunc.EquipSet(sets.Precast);
    
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();    

    if (spell.Skill == 'Ninjutsu') then
        if string.contains(spell.Name, 'Utsusemi') then
            gFunc.EquipSet(sets.Utsu);        
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
    
        if (action.Name == 'Sturmwind') then            
            gFunc.EquipSet(sets.Sturmwind);
        elseif (action.Name == 'Raging Rush') then            
            gFunc.EquipSet(sets.RagingRush);
        elseif (action.Name == 'Penta Thrust') then
            gFunc.EquipSet(sets.PentaThrust);
        elseif (action.Name == 'Rampage') then            
            gFunc.EquipSet(sets.Rampage);
        else            
            gFunc.EquipSet('WS_' .. gcdisplay.GetCycle('/war ws '));
        end
    end
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