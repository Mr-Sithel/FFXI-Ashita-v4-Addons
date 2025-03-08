local Cycles = {};
local Toggles = {};

local gcdisplay = {
	Toggles = {},
	Values = {}
};

local fontSettings = T{
	visible = true,
	font_family = 'Ink Free Regular',
	font_height = 11,
	color = 0xFFFFFFFF,
	position_x = 800,
	position_y = 0,
	background = T{
		visible = false,
		color = 0x80000000,
		--color = 0xFF000000,
		--opacity = 0.5,
	}
};

local fonts = require('fonts');

gcdisplay.AdvanceCycle = function(name)
	local ctable = Cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = ctable.Index + 1;
	if (ctable.Index > #ctable.Array) then
		ctable.Index = 1;
	end
end

gcdisplay.AdvanceToggle = function(name)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	elseif Toggles[name] then
		Toggles[name] = false;
	else
		Toggles[name] = true;
	end
end

--name must be a valid lua variable name in string format.
--default must be a boolean
gcdisplay.CreateToggle = function(name, default)
	Toggles[name] = default;
end

--name must be a valid lua variable name in string format.
--values must be an array style table containing only strings mapped to sequential indices.
--first value in table will be default.
gcdisplay.CreateCycle = function(name, values)
	local newCycle = {
		Index = 1,
		Array = values
	};
	Cycles[name] = newCycle;
end

gcdisplay.GetCycle = function(name)
	local ctable = Cycles[name];
	if (type(ctable) == 'table') then
		return ctable.Array[ctable.Index];
	else
		return 'Unknown';
	end
end

gcdisplay.GetToggle = function(name)
	if (Toggles[name] ~= nil) then
		return Toggles[name];
	else
		return false;
	end
end

gcdisplay.Destroy = function()
	if (gcdisplay.FontObject ~= nil) then
		gcdisplay.FontObject:destroy();
	end
	ashita.events.unregister('d3d_present', 'gcdisplay_present_cb');
end

gcdisplay.Initialize = function()
	gcdisplay.FontObject = fonts.new(fontSettings);
		ashita.events.register('d3d_present', 'gcdisplay_present_cb', function ()
		local display = '';
		for k, v in pairs(Toggles) do
			display = display .. '   ';
			if (v == true) then
				display = display .. '|cFF00FF00|' .. k .. '|r';
			else
				display = display .. '|cFFFF0000|' .. k .. '|r';
			end
		end
		for key, value in pairs(Cycles) do
			display = display .. '  ' .. key .. ': ' .. '|cFF00FF00|' .. value.Array[value.Index] .. '|r';
		end
		gcdisplay.FontObject.text = display;
	end);
end

return gcdisplay;