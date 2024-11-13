local gcinclude = T{};

local LockableEquipment = {
    ['Main'] = T{'Warp Cudgel', 'Rep. Signet Staff', 'Kgd. Signet Staff', 'Fed. Signet Staff', 'Treat Staff II', 'Trick Staff II'},
    ['Sub'] = T{},
    ['Range'] = T{},
    ['Ammo'] = T{},
    ['Head'] = T{'Reraise Hairpin', 'Dream Hat +1'},
    ['Neck'] = T{'Opo-opo Necklace'},
    ['Ear1'] = T{'Reraise Earring'},
    ['Ear2'] = T{'Reraise Earring'},
    ['Body'] = T{'Custom Gilet +1', 'Custom Top +1', 'Magna Gilet +1', 'Magna Top +1', 'Savage Top +1', 'Elder Gilet +1', 'Wonder Maillot +1', 'Wonder Top +1', 'Mandra. Suit'},
    ['Hands'] = T{},
    ['Ring1'] = T{'Anniversary Ring', 'Emperor Band', 'Chariot Band', 'Empress Band', 'Homing Ring', 'Tavnazian Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Altep Ring', 'Yhoat Ring'},
    ['Ring2'] = T{'Anniversary Ring', 'Emperor Band', 'Chariot Band', 'Empress Band', 'Homing Ring', 'Tavnazian Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Altep Ring', 'Yhoat Ring'},
    ['Back'] = T{},
    ['Waist'] = T{},
    ['Legs'] = T{},
    ['Feet'] = T{'Powder Boots'}
}

gcinclude.settings = {	
	WScheck = true; --set to false if you dont want to use the WSdistance safety check
	WSdistance = 4.7; --default max distance (yalms) to allow non-ranged WS to go off at if the above WScheck is true  was
};

gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');

gcinclude.AliasList = T{'wsdistance'};
--gcinclude.SandyTowns = T{'Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille'};
gcinclude.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden'};
gcinclude.DistanceWS = T{'Flaming Arrow','Piercing Arrow','Dulling Arrow','Sidewinder','Blast Arrow','Arching Arrow','Empyreal Arrow','Refulgent Arrow','Apex Arrow','Namas Arrow','Jishnu\'s Randiance','Hot Shot','Split Shot','Sniper Shot','Slug Shot','Blast Shot','Heavy Shot','Detonator','Numbing Shot','Last Stand','Coronach','Wildfire','Trueflight','Leaden Salute','Myrkr','Dagan','Moonlight','Starlight'};
gcinclude.NinNukes = T{'Katon: Ichi', 'Katon: Ni', 'Hyoton: Ichi', 'Hyoton: Ni', 'Huton: Ichi', 'Huton: Ni', 'Doton: Ichi', 'Doton: Ni', 'Raiton: Ichi', 'Raiton: Ni', 'Suiton: Ichi', 'Suiton: Ni'};
gcinclude.DontThrow = T{'Nokizaru Shuriken', 'Atter Satchet', 'Bomb Core'};
gcinclude.EnmityAbilities = T{'Provoke', 'Warcry', 'Souleater', 'Last Resort', 'Sentinel', 'Rampart'};
gcinclude.MndEnfeebs = T{'Slow', 'Slow II', 'Silence', 'Paralyze', 'Dia', 'Dia II'};
gcinclude.EleDebuffs = T{'Rasp', 'Drown', 'Choke', 'Burn', 'Frost', 'Shock'};
gcinclude.SpikeSpells = T{'Blaze Spikes', 'Ice Spikes', 'Shock Spikes', };
gcinclude.SmnMacroList = T{'Carbuncle', 'Garuda', 'Ifrit', 'Leviathan', 'Titan', 'Shiva', 'Ramuh', 'Fenrir', 'Diabolos'};
--added all this smn stuff, do i need it? not sure yet
gcinclude.SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing'};
gcinclude.SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'};
gcinclude.SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'};
gcinclude.SmnHybrid = T{'Flaming Crush','Burning Strike'};
gcinclude.SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'};
gcinclude.HealingBreaths = T{'Healing Breath I', 'Healing Breath II', 'Healing Breath III', 'Healing Breath VI'};
gcinclude.WindInstruments = T{'Flute','Flute +1','Flute +2','Cornette','Cornette +1','Cornette +2','Piccolo','Piccolo +1','Mary\'s Horn','Gemshorn','Gemshorn +1','Royal Spearman\'s Horn','Siren Flute','Kingdom Horn','San d\'Orian Horn','Traversiere','Traversiere +1','Traversiere +2','Faerie Piccolo','Horn','Horn +1','Oliphant Rare','Angel\'s Flute','Angel Flute +1','Storm Fife','Crumhorn','Crumhorn +1','Crumhorn +2','Hamelin Flute','Iron Ram Horn','Frenzy Fife','Hellish Bugle','Hellish Bugle +1','Shofar','Shofar +1','Harlequin\'s','Cradle Horn','Requiem Flute','Relic Horn','Pyrrhic Horn','Dynamis Horn','Millennium','Gjallarhorn'};
gcinclude.StringInstruments = T{'Maple Harp','Maple Harp +1','Harp','Harp +1','Military Harp','Rose Harp','Rose Harp +1','Lamia Harp','Ebony Harp','Ebony Harp +1','Ebony Harp +2','Nursemaid\'s Harp','Mythic Harp','Mythic Harp +1','Sorrowful Harp','Angel Lyre','Cythara Anglica','Cythara Anglica +1'};


function gcinclude.SetAlias()
	for _, v in ipairs(gcinclude.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function gcinclude.ClearAlias()
	for _, v in ipairs(gcinclude.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function gcinclude.HandleCommands(args)
    if not gcinclude.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();    
	if (args[1] == 'wsdistance') then
		if (tonumber(args[2])) then 
			gcinclude.settings.WScheck = true;
			gcinclude.settings.WSdistance = tonumber(args[2]);			
            print(chat.header('WSdistance'):append(chat.color1(70, 'WS Distance is ON and set to: ')):append(chat.color1(79, gcinclude.settings.WSdistance)));
		else
			gcinclude.settings.WScheck = not gcinclude.settings.WScheck;
            print(chat.header('WSdistance'):append(chat.color1(70, 'WS distance check is now: ')):append(chat.color1(79, gcinclude.settings.WScheck)));			
            print(chat.header('WSdistance'):append(chat.color1(70, 'Change WS distance by typing: ')):append(chat.color1(79, '/wsdistance ##')));			
		end
    end
end

function gcinclude.SetTownGear()
	local zone = gData.GetEnvironment();
    if (zone.Area ~= nil) and (gcinclude.Towns:contains(zone.Area)) then gFunc.EquipSet('Town') end
	--if (zone.Area ~= nil) and (gcinclude.SandyTowns:contains(zone.Area)) then gFunc.EquipSet('SandyTown') end
end

function gcinclude.SetVariables()
	local player = gData.GetPlayer();     
end

function gcinclude.CheckDefault()
	gcinclude.SetTownGear();	
end

function gcinclude.CheckWsBailout()
	local player = gData.GetPlayer();
	local ws = gData.GetAction();
	local target = gData.GetActionTarget();
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');
	local charm = gData.GetBuffCount('Charm');

	if gcinclude.settings.WScheck and not gcinclude.DistanceWS:contains(ws.Name) and (tonumber(target.Distance) > gcinclude.settings.WSdistance) then		  
        print(chat.header('WSdistance'):append(chat.color1(76, 'Distance to mob is too far! ')):append(chat.color1(70, 'Move closer or increase WS distance')));        
        print(chat.header('WSdistance'):append(chat.color1(70, 'Distance set to: ')):append(chat.color1(79, gcinclude.settings.WSdistance)));		
		return false;
	elseif (player.TP <= 999) or (sleep+petrify+stun+terror+amnesia+charm >= 1) then
		return false;
	end
		
	return true;
end

function gcinclude.VarTable()
	local IdleVariantTable = {
    [1] = 'Default',
    [2] = 'L20', 
    [3] = 'L30',
    [4] = 'L40', 
    [5] = 'L50',
    [6] = 'L60',   
};
local TpVariantTable = {
    [1] = 'Default',
    [2] = 'HighAcc',
    [3] = 'L20', 
    [4] = 'L30',
    [5] = 'L40', 
    [6] = 'L50',
    [7] = 'L60',    
};
local WsVariantTable = {
    [1] = 'Default',
    [2] = 'L20', 
    [3] = 'L30',
    [4] = 'L40', 
    [5] = 'L50',
    [6] = 'L60',   
};
local Settings = {   
    IdleVariant = 1, 
    TpVariant = 1,
    WsVariant = 1,
};
end

function gcinclude.DoItem()
    local item = gData.GetAction()

    if (item.Name == 'Silent Oil') then
        if (dream_boots) then
            gFunc.Equip('Feet', 'Dream Boots +1')
        end
        if (skulkers_cape) then
            gFunc.Equip('Back', 'Skulker\'s Cape')
        end
    elseif (item.Name == 'Prism Powder') then
        if (dream_mittens) then
            gFunc.Equip('Hands', 'Dream Mittens +1')
        end
        if (skulkers_cape) then
            gFunc.Equip('Back', 'Skulker\'s Cape')
        end
    end
end

function gcinclude.BuildLockableSet(equipment)
    local lockableSet = {}

    for slot, item in pairs(equipment) do
        if (LockableEquipment[slot]:contains(item.Name)) then
            lockableSet[slot] = item
            if (item.Name == 'Custom Gilet +1' or item.Name == 'Custom Top +1' or item.Name == 'Magna Gilet +1' or item.Name == 'Magna Top +1' or item.Name == 'Savage Top +1' or item.Name == 'Elder Gilet +1' or item.Name == 'Wonder Maillot +1' or item.Name == 'Wonder Top +1') then
                lockableSet['Hands'] = 'Displaced'
            elseif (item.Name == 'Mandra. Suit') then
                lockableSet['Legs'] = 'Displaced'
            elseif (slot == 'Main') then
                lockableSet['Sub'] = 'Displaced'
            end
        end
    end

    return lockableSet
end

function gcinclude.Unload()
	gcinclude.ClearAlias();
	gcdisplay.Unload();
end

function gcinclude.Initialize()
	gcdisplay.Initialize:once(2);
	gcinclude.SetVariables:once(2);
	gcinclude.SetAlias:once(2);
end

return gcinclude;