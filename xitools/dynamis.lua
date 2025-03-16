require('common')
local bit = require('bit')
local imgui = require('imgui')
local ui = require('ui')
local packets = require('utils/packets')

local Scale = 1.0

local IsListening = { false }

local Colors = {
    KeyMissing    = { 0.80, 0.22, 0.00, 1.0 },
    KeyObtained   = { 0.60, 0.80, 0.20, 1.0 },
}

local Icons = {
    Times = '\xef\x81\x97',
    Check = '\xef\x81\x98',
}

local KeyItems = { 
    VialofShroudedSand      = { Id = 492, Name = "Vial of Shrouded Sand" },   
    DynamisSandy            = { Id = 486, Name = "San d'Oria" },
    DynamisWindy            = { Id = 488, Name = "Windurst" },
    DynamisBastok           = { Id = 487, Name = "Bastok" },
    DynamisJeuno            = { Id = 489, Name = "Jeuno" },
    DynamisBeaucedine       = { Id = 490, Name = "Beaucedine" },
    DynamisXarcabard        = { Id = 491, Name = "Xarcabard" },
    DynamisValkurm          = { Id = 739, Name = "Valkurm" }, 
    DynamisBuburimu         = { Id = 740, Name = "Buburimu" }, 
    DynamisQufim            = { Id = 741, Name = "Qufim" },    
    DynamisTavnazia         = { Id = 742, Name = "Tavnazia" },
}

local Weeklies = T{
    {
        POS = '  -',
        Name = 'Access',
        LName = 'Nation Rank 6+',
        KeyItem = KeyItems.VialofShroudedSand,
    },
    {
        POS = '(M-5)',
        Name = 'Original Dynamis',
        LName = 'Southern San d\'Oria',
        KeyItem = KeyItems.DynamisSandy,
    },
    {
        POS = '(C-12)',
        Name = 'Original Dynamis',
        LName = 'Windurst Walls',
        KeyItem = KeyItems.DynamisWindy,
    },
    {
        POS = '(K-8)',
        Name = 'Original Dynamis',
        LName = 'Bastok Mines',
        KeyItem = KeyItems.DynamisBastok,
    },
    {
        POS = '(I-9)',
        Name = 'Original Dynamis',
        LName = 'Ru\'Lude Gardens',
        KeyItem = KeyItems.DynamisJeuno,
    },
    {
        POS = '(F-11)',
        Name = 'Original Dynamis',
        LName = 'Beaucedine Glacier',
        KeyItem = KeyItems.DynamisBeaucedine,
    },
    {
        POS = '(J-9)',
        Name = 'Original Dynamis',
        LName = 'Xarcabard',
        KeyItem = KeyItems.DynamisXarcabard,
    },
    {
        POS = '(G-7)',
        Name = 'Dreamworld Dynamis',
        LName = 'Valkurm Dunes',
        KeyItem = KeyItems.DynamisValkurm,
    },
    {
        POS = '(I-9)',
        Name = 'Dreamworld Dynamis',
        LName = 'Buburimu Peninsula',
        KeyItem = KeyItems.DynamisBuburimu,
    },
    {
        POS = '(H-7)',
        Name = 'Dreamworld Dynamis',
        LName = 'Qufim Island',
        KeyItem = KeyItems.DynamisQufim,
    },
    {
        POS = '(H-9)',
        Name = 'Dreamworld Dynamis',
        LName = 'Tavnazian Safehold',
        KeyItem = KeyItems.DynamisTavnazia,
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
        Name = 'Activity',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Weeklies
                :map(function(w) return w.Name end)
                :append('Activity')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(activity, player, timers, now)
            imgui.Text(activity.Name)
        end,
    },
    {
        Name = 'Trail Markings',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Weeklies
                :map(function(w) return w.LName end)
                :append('Trail Markings')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(activity, player, timers, now)
            imgui.Text(activity.LName)
        end,
    },
    {
        Name = 'POS',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Weeklies
                :map(function(w) return w.POS end)
                :append('POS')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(activity, player, timers, now)
            imgui.Text(activity.POS)
        end,
    },
    {
        Name = 'Key Item',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Weeklies
                :map(function(w) return w.KeyItem.Name end)
                :append('Key Item')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(activity, player, timers, now)
            imgui.Text(activity.KeyItem.Name)
        end,
    },
    {
        Name = 'Have KI',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize('Have KI'),
        Draw = function(activity, player, timers, now)
            -- TODO: save this state somewhere instead of querying every frame
            local color = Colors.KeyMissing
            local icon = Icons.Times

            if player:HasKeyItem(activity.KeyItem.Id) then
                color = Colors.KeyObtained
                icon = Icons.Check
            end

            imgui.PushStyleColor(ImGuiCol_Text, color)
            imgui.Text(icon)
            imgui.PopStyleColor()
        end,
    },
}

local function DrawWeek(timers)
    local now = os.time()
    local player = AshitaCore:GetMemoryManager():GetPlayer()

    if IsListening[1] then
        imgui.PushStyleColor(ImGuiCol_Text, Colors.KeyObtained)
        imgui.Checkbox('Listening for key item updates', IsListening)
        imgui.PopStyleColor()
    else
        imgui.PushStyleColor(ImGuiCol_Text, Colors.KeyMissing)
        imgui.Checkbox('Ignoring key item updates', IsListening)
        imgui.PopStyleColor()
    end

    imgui.Separator()

    imgui.PushStyleVar(ImGuiStyleVar_CellPadding, { 10, 3 })
    if imgui.BeginTable('xitools.dynamis.summary', #TableDef, TableFlags) then
        imgui.TableSetupScrollFreeze(0, 1)
        for _, col in ipairs(TableDef) do
            imgui.TableSetupColumn(col.Name, col.Flags, col.Width)
        end
        imgui.TableHeadersRow()

        for _, activity in ipairs(Weeklies) do
            imgui.TableNextRow()

            for _, col in ipairs(TableDef) do
                imgui.TableNextColumn()
                col.Draw(activity, player, timers, now)
            end
        end

        imgui.EndTable()
    end
    imgui.PopStyleVar()
end

---@type xitool
local dynamis = {
    Name = 'dynamis',
    Aliases = T{ 'dyn', 'all' },
    DefaultSettings = T{
        isEnabled = T{ false },
        isVisible = T{ true },
        name = 'xitools.dynamis',
        size = T{ -1, -1 },
        pos = T{ 100, 100 },
        flags = bit.bor(ImGuiWindowFlags_NoResize),
        timers = T{ },
    },
    HandleCommand = function(args, options)
        if #args == 0 then
            options.isVisible[1] = not options.isVisible[1]
        end
    end,
    HandlePacket = function(e, options)

        if e.id == 0x0A or e.id == 0x0B then
            IsListening[1] = false
        elseif e.id == 0x41 then
            IsListening[1] = true
        elseif IsListening[1] and e.id == packets.inbound.keyItems.id then
            local now = os.time()
            local player = AshitaCore:GetMemoryManager():GetPlayer()
            local keyItems = packets.inbound.keyItems.parse(e.data_raw)

            for _, weekly in pairs(Weeklies) do
                if not player:HasKeyItem(weekly.KeyItem.Id)
                and keyItems.heldList[weekly.KeyItem.Id] then
                    --local timestamp = now + weekly.Cooldown
                    local timestamp = now 
                    options.timers[weekly.Name] = {
                        time = timestamp,
                        desc = os.date('%a, %b %d at %X', timestamp)
                    }
                end
            end
        end
    end,
    DrawConfig = function(options, gOptions)
        if imgui.BeginTabItem('dynamis') then
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
            DrawWeek(options.timers)
        end)
    end,
}

return dynamis
