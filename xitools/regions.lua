require('common')
local bit = require('bit')
local imgui = require('imgui')
local ui = require('ui')

local Scale = 1.0

local Outposts = T{
    {
        Jeuno = '10',
        HomeNation = '20',
        Region = 'Gustaburg',
        Area = 'North Gustaburg',
        Connection = 'Bastok',
    },
    {
        Jeuno = '10',
        HomeNation = '20',
        Region = 'Ronfaure',
        Area = 'West Ronfaure',
        Connection = 'San d\'Oria',
    },
    {
        Jeuno = '10',
        HomeNation = '20',
        Region = 'Sarutabaruta',
        Area = 'West Sarutabaruta',
        Connection = 'Windurst',
    },
    {
        Jeuno = '10',
        HomeNation = '20',
        Region = 'Zulkheim',
        Area = 'Valkurm Dunes',
        Connection = 'Selbina',
    },
    {
        Jeuno = '10',
        HomeNation = '20',
        Region = 'Kolshushu',
        Area = 'Buburimu Peninsula',
        Connection = 'Mhaura',
    },
    {
        Jeuno = '15',
        HomeNation = '25',
        Region = 'Aragoneu',
        Area = 'Meriphataud Mountains',
        Connection = 'Castle Oztroja',
    },
    {
        Jeuno = '15',
        HomeNation = '25',
        Region = 'Derfland',
        Area = 'Pashhow Marshlands',
        Connection = 'Beadeaux',
    },
    {
        Jeuno = '15',
        HomeNation = '25',
        Region = 'Norvallen',
        Area = 'Jugner Forest',
        Connection = 'Davoi',
    },
    {
        Jeuno = '15',
        HomeNation = '25',
        Region = 'Qufim',
        Area = 'Qufim Island',
        Connection = 'Lower Delkfutt Tower',
    },
    {
        Jeuno = '30',
        HomeNation = '30',
        Region = 'Tavnazian Archipelago',
        Area = 'Lufaise Meadows',
        Connection = 'Tavnazian Safehold',
    },
    {
        Jeuno = '25',
        HomeNation = '35',
        Region = 'Elshimo Lowlands',
        Area = 'Yuhtunga Jungle',
        Connection = 'Sea Serpent Grotto',
    },
    {
        Jeuno = '35',
        HomeNation = '35',
        Region = 'Fauregandi',
        Area = 'Beaucedine Glacier',
        Connection = 'Fei\'Yin',
    },
    {
        Jeuno = '25',
        HomeNation = '35',
        Region = 'Li\'Telor',
        Area = 'The Sanctuary of Zi\'Tah',
        Connection = 'Ro\'Maeve',
    },
    {
        Jeuno = '30',
        HomeNation = '40',
        Region = 'Kuzotz',
        Area = 'Eastern Altepa Desert',
        Connection = 'Quicksand Caves',
    },
    {
        Jeuno = '40',
        HomeNation = '40',
        Region = 'Valdeaunia',
        Area = 'Xarcabard',
        Connection = 'Castle Zvahl Baileys', 
    },
    {
        Jeuno = '35',
        HomeNation = '45',
        Region = 'Elshimo Uplands',
        Area = 'Yhoator Jungle',
        Connection = 'Temple of Uggalepih',
    },
    {
        Jeuno = '50',
        HomeNation = '65',
        Region = 'Vollbow',
        Area = 'Cape Teriggan',
        Connection = 'Kuftal Tunnel',
    },
              
}

local function SortByLength(l, r)
    if #l == #r then
        return l > r
    else
        return #l > #r
    end
end

local TableFlags = bit.bor(ImGuiTableFlags_RowBg, ImGuiTableFlags_Borders, ImGuiTableFlags_NoBordersInBody)
local TableDef = {
    {
        Name = 'HN',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Outposts
                :map(function(w) return w.HomeNation end)
                :append('HN')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(outpost, places) -- player,
            imgui.Text(outpost.HomeNation)
        end,
    },
    {
        Name = 'Jeuno',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Outposts
                :map(function(w) return w.Jeuno end)
                :append('Jeuno')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(outpost, places) -- player,
            imgui.Text(outpost.Jeuno)
        end,
    },
    {
        Name = 'Region',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Outposts
                :map(function(w) return w.Region end)
                :append('Region')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(outpost, places) -- player,
            imgui.Text(outpost.Region)
        end,
    },
    {
        Name = 'Area',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Outposts
                :map(function(w) return w.Area end)
                :append('Area')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(outpost, places) -- player,
            imgui.Text(outpost.Area)
        end,
    },
    
    {
        Name = 'Connection',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Outposts
                :map(function(w) return w.Connection end)
                :append('Connection')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(outpost, places) -- player,
            imgui.Text(outpost.Connection)
        end,
    },    
}

local function DrawPlace(places)
    imgui.PushStyleVar(ImGuiStyleVar_CellPadding, { 10, 3 })
    if imgui.BeginTable('xitools.regions.summary', #TableDef, TableFlags) then
        imgui.TableSetupScrollFreeze(0, 1)
        for _, col in ipairs(TableDef) do
            imgui.TableSetupColumn(col.Name, col.Flags, col.Width)
        end
        imgui.TableHeadersRow()

        for _, outpost in ipairs(Outposts) do
            imgui.TableNextRow()

            for _, col in ipairs(TableDef) do
                imgui.TableNextColumn()
                col.Draw(outpost, places) -- player,
            end
        end

        imgui.EndTable()
    end
    imgui.PopStyleVar()
end

---@type xitool
local regions = {
    Name = 'regions',
    Aliases = T{ 'opw', 'op', 'reg', 'all' },
    DefaultSettings = T{
        isEnabled = T{ false },
        isVisible = T{ true },
        name = 'xitools.regions',
        size = T{ -1, -1 },
        --size = T{ 800, -1 },
        pos = T{ 100, 100 },
        flags = bit.bor(ImGuiWindowFlags_NoResize),
        timers = T{ },
    },
    HandleCommand = function(args, options)
        if #args == 0 then
            options.isVisible[1] = not options.isVisible[1]
        end
    end,    
    DrawConfig = function(options, gOptions)
        if imgui.BeginTabItem('regions') then
            imgui.Checkbox('Enabled', options.isEnabled)
            imgui.Checkbox('Visible', options.isVisible)
            if imgui.InputInt2('Position', options.pos) then
                imgui.SetWindowPos(options.name, options.pos)
            end
            imgui.EndTabItem()
        end
    end,
    DrawMain = function(options, gOptions)
        Scale = gOptions.uiScale[1]

        ui.DrawNormalWindow(options, gOptions, function()
            imgui.SetWindowFontScale(Scale)
            DrawPlace(options.places)
        end)
    end,
}

return regions
