local profile = {SubJob = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob()};
local gaudy_harness = false
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
gcinclude.VarTable();
-- Which ever you have, change Town body to true in the gcinclude.lua

local sets = {
    Idle_Default = {  
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Alumine Moufles',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle',        
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Alumine Sollerets',      
    },
    --Idle Sets for Level Sync 20, 30, 40, 50, 60 to change type: /bst idle
    Idle_L20 = {                
    },
    Idle_L30 = { 
        Head = 'Beetle Mask +1',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Beetle Harness +1',
        Hands = 'Beetle Mittens +1',
        Ring1 = 'Balance Ring',
        Ring2 = 'Balance Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Brave Belt',
        Legs = 'Beetle Subligar +1',
        Feet = 'Btl. Leggings +1',                     
    },
    Idle_L40 = { 
        Head = 'Dobson Bandana',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Woodsman Ring',
        Ring2 = 'Woodsman Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Tilt Belt',
        Legs = 'Savage loincloth',
        Feet = 'Savage Gaiters',          
    },
    Idle_L50 = { 
        Head = 'Voyager Sallet',
        Neck = 'Justice Badge',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Alumine Moufles',
        Ring1 = 'Solace Ring',
        Ring2 = 'Kshama ring no.9',
        Back = 'Traveler\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Alumine Sollerets',                      
    },
    Idle_L60 = { 
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Alumine Moufles',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',        
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Alumine Sollerets',
    },    
    Tp_Default = {        
    },
	Tp_HighAcc = {                
    },
    --TP Sets for Level Sync 20, 30, 40, 50, 60 to change type: /bst tp
    Tp_L20 = {                
    },
    Tp_L30 = { 
        Head = 'Beetle Mask +1',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Beetle Harness +1',
        Hands = 'Beetle Mittens +1',
        Ring1 = 'Balance Ring',
        Ring2 = 'Balance Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Brave Belt',
        Legs = 'Beetle Subligar +1',
        Feet = 'Btl. Leggings +1',                       
    },
    Tp_L40 = {  
        Head = 'Dobson Bandana',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Balance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Tilt Belt',
        Legs = 'Savage loincloth',
        Feet = 'Savage Gaiters',                    
    },
    Tp_L50 = { 
        Head = 'Alumine Salade',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Alumine Moufles',
        Ring1 = 'Woodsman Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Alumine Sollerets',                      
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
        Back = 'Traveler\'s Mantle',        
        Waist = 'Swift Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Alumine Sollerets',                
    },	
    Town = { 
                       
	}, 	
	Resting = {		
    },
	Precast = {        
	},
    Utsu = {        
	},
    -- Toggle lock MP set with F9
    MP = {	
        Legs = 'Savage loincloth',	
	},
    -- Toggle lock MDT set with F10
	MDT = {                
	},
    -- Toggle lock PDT set with F12
	PDT = {        	
	},
	Charm = {        		
	},
    Reward = {
        Neck = 'Justice Badge',        
        Ring1 = 'Solace Ring',
        Ring2 = 'Kshama Ring No.9',
        Waist = 'R.K. Belt +1',
    },
	Tame = {
        Head = 'Beast Helm',		
	},
	Ready = {        		
	},	
    -- WS Default, use on all weapon skills 
    Ws_Default = {
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
        Legs = 'Alumine Brayettes',
        Feet = 'Savage Gaiters',        
    },
    Ws_HighAcc = {                
    },
    -- WS Sets for Level Sync 20, 30, 40, 50, 60 to change type: /bst ws
    Ws_L20 = {        
    },
    Ws_L30 = { 
        Head = 'Beetle Mask +1',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Courage Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Brave Belt',
        Legs = 'Savage loincloth',
        Feet = 'Savage Gaiters',       
    },
    Ws_L40 = { 
        Head = 'Beetle Mask +1',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Brave Belt',
        Legs = 'Savage loincloth',
        Feet = 'Savage Gaiters',             
    },
    Ws_L50 = { 
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Savage Separates',
        Hands = 'Alumine Moufles',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Brave Belt',
        Legs = 'Alumine Brayettes',
        Feet = 'Savage Gaiters',             
    },
    Ws_L60 = {
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Alumine Moufles',
        Ring1 = 'Puissance Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Traveler\'s Mantle',        
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
    gcdisplay.CreateCycle('/bst idle ', { [1] = 'Default', [2] = 'L20', [3] = 'L30', [4] = 'L40', [5] = 'L50', [6] = 'L60', [7] = 'ALT' });     --/bst idle
	gcdisplay.CreateCycle('/bst tp ', { [1] = 'Default', [2] = 'L20', [3] = 'L30', [4] = 'L40', [5] = 'L50', [6] = 'L60', [7] = 'HighAcc' });   --/bst tp
    gcdisplay.CreateCycle('/bst ws ', { [1] = 'Default', [2] = 'L20', [3] = 'L30', [4] = 'L40', [5] = 'L50', [6] = 'L60', [7] = 'HighAcc' });   --/bst ws
    gcdisplay.CreateCycle('/bst pet ', { [1] = 'Any Pet', [2] = 'Sheep', [3] = 'Lizard', [4] = 'Crab', [5] = 'Tiger', [6] = 'Rabbit', [7] = 'Mandy', [8] = 'Flytrap' }); --/bst pet
    gcdisplay.CreateCycle('/bst food ', { [1] = 'Beta-24+', [2] = 'Gamma-36+', [3] = 'Delta-48+', [4] = 'Epsilon-60+', [5] = 'Zeta-72+' });     --/bst food
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /bst mptoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /bst mdttoggle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /bst pdttoggle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind END /exec logout');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bst /lac fwd'); 
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');     
    gcinclude.SetAlias();
	gcdisplay.Initialize(); 
    profile.SetLockStyle();       
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind END');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bst');
    gcinclude.ClearAlias();
	gcdisplay.Destroy();    
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
    if (args[1] == 'idle') then gcdisplay.AdvanceCycle('/bst idle ') end
	if (args[1] == 'tp') then gcdisplay.AdvanceCycle('/bst tp ') end	
    if (args[1] == 'ws') then gcdisplay.AdvanceCycle('/bst ws ') end	
    if (args[1] == 'mdttoggle') then gcdisplay.AdvanceToggle('(F10) MDT') end	
	if (args[1] == 'pdttoggle') then gcdisplay.AdvanceToggle('(F12) PDT') end    
	if (args[1] == 'mptoggle') then gcdisplay.AdvanceToggle('(F9) MP') end    
    if (args[1] == 'pet') then gcdisplay.AdvanceCycle('/bst pet ') end	
    if (args[1] == 'food') then gcdisplay.AdvanceCycle('/bst food ') end    
end

profile.HandleDefault = function()  	
    local player = gData.GetPlayer();
    if (player.Status == 'Idle') then
        gFunc.EquipSet('IDLE_' .. gcdisplay.GetCycle('/bst idle '));
        if (player.MP < 50 and (player.SubJob == 'WHM' or player.SubJob == 'BLM' or player.SubJob == 'RDM')) then
            if (gaudy_harness) then
                gFunc.Equip('Body', 'Gaudy Harness')
            end
        end       
    elseif (player.Status == 'Engaged') then		
		gFunc.EquipSet('TP_' .. gcdisplay.GetCycle('/bst tp '));
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
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 3", '',true)
    elseif (player.SubJob == 'SAM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 3", '',true)
    elseif (player.SubJob == 'THF') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
        --AshitaCore:GetChatManager():QueueCommand(1, '/sl others on');
        AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset 3", '',true)
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
    -- /wsdistance or /wsdistance ##  (to change ws cancel)
    local canWS = gcinclude.CheckWsBailout();
        if (canWS == false) then gFunc.CancelAction() return;
        else
            local action = gData.GetAction();     
        gFunc.EquipSet('WS_' .. gcdisplay.GetCycle('/bst ws '));
    end
	
	if (gcdisplay.GetToggle('(F10) MDT') == true) then gFunc.EquipSet(sets.MDT) end	
	if (gcdisplay.GetToggle('(F12) PDT') == true) then gFunc.EquipSet(sets.PDT) end
	if (gcdisplay.GetToggle('(F9) MP') == true) then gFunc.EquipSet(sets.MP) end
end

profile.HandleAbility = function()
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    if (action.Name == 'Charm') then
        gFunc.EquipSet(sets.Charm)
    elseif (action.Name == 'Tame') then
            gFunc.EquipSet(sets.Tame)
    elseif (action.Name == 'Reward') then
        gFunc.EquipSet(sets.Reward)
        local food = gcdisplay.GetCycle('/bst food ') --new food cycle
        if (food == 'Beta-24+') then
            gFunc.Equip('Ammo', 'Pet Food Beta')                   
        elseif (food == 'Gamma-36+') then
            gFunc.Equip('Ammo', 'Pet Fd. Gamma')
        elseif (food == 'Delta-48+') then
            gFunc.Equip('Ammo', 'Pet Food Delta')
        elseif (food == 'Epsilon-60+') then
            gFunc.Equip('Ammo', 'Pet Fd. Epsilon')
        elseif (food == 'Zeta-72+') then
            gFunc.Equip('Ammo', 'Pet Food Zeta')            
        end        
    elseif (action.Name == 'Call Beast') then
        gFunc.EquipSet(sets.Call_Beast)
        local pet = gcdisplay.GetCycle('/bst pet ')
        if (pet == 'Any Pet') then
            if (player.MainJobSync >= 23) then            
                print(chat.header('Ashitacast'):append(chat.color1(81, '*** Equip Any Jug Pet and use Call Beast ***')));
            end        
        elseif (pet == 'Sheep') then
            if (player.MainJobSync >= 43) then
                gFunc.Equip('Ammo', 'S. Herbal Broth')
            elseif (player.MainJobSync >= 23) then
                gFunc.Equip('Ammo', 'Herbal Broth')
            else
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end
        elseif (pet == 'Lizard') then
            if (player.MainJobSync >= 53) then
                gFunc.Equip('Ammo', 'C. Carrion Broth')
            elseif (player.MainJobSync >= 33) then
                gFunc.Equip('Ammo', 'Carrion Broth')
            else                
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end
        elseif (pet == 'Crab') then
            if (player.MainJobSync >= 23) then
                gFunc.Equip('Ammo', 'Fish Oil Broth')
            else
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end
        elseif (pet == 'Tiger') then
            if (player.MainJobSync >= 51) then
                gFunc.Equip('Ammo', 'W. Meat Broth')
            elseif (player.MainJobSync >= 28) then
                gFunc.Equip('Ammo', 'Meat Broth')
            else
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end
        elseif (pet == 'Rabbit') then
            if (player.MainJobSync >= 43) then
                gFunc.Equip('Ammo', 'F. Carrot Broth')
            else
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end
        elseif (pet == 'Mandy') then
            if (player.MainJobSync >= 23) then
                gFunc.Equip('Ammo', 'Alchemist Water')
            else
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end
        elseif (pet == 'Flytrap') then
            if (player.MainJobSync >= 53) then
                gFunc.Equip('Ammo', 'N. Grass. Broth')
            elseif (player.MainJobSync >= 28) then
                gFunc.Equip('Ammo', 'Grasshopper Broth')
            else
                print(chat.header('Ashitacast'):append(chat.color1(76, '*** Can\'t call that pet, level too low... ***')));
            end                            
        end
    end
end

return profile;