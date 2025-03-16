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
    TimerReady    = { 0.23, 0.67, 0.91, 1.0 },
    TimerNotReady = { 1.00, 1.00, 1.00, 1.0 },
    TimerUnknown  = { 1.00, 0.96, 0.56, 1.0 },
}

local Icons = {
    Times = '\xef\x81\x97',
    Check = '\xef\x81\x98',
}

local KeyItems = {    
    TuningForkOfFire         = { Id = 328, Name = "Tuning fork of Fire" },
    TuningForkOfEarth        = { Id = 329, Name = "Tuning fork of Earth" },
    TuningForkOfWater        = { Id = 330, Name = "Tuning fork of Water" },
    TuningForkOfWind         = { Id = 331, Name = "Tuning fork of Wind" },
    TuningForkOfIce          = { Id = 332, Name = "Tuning fork of Ice" },
    TuningForkOfLightning    = { Id = 333, Name = "Tuning fork of Lightning" },
    VialOfDreamIncense       = { Id = 335, Name = "Vial of Dream Incense" }, --Diablos 1of2
    WhisperOfDreams          = { Id = 327, Name = "Whisper of Dreams" }, --Diablos 2of2
    WhisperOfFlames          = { Id = 320, Name = "Whisper of Flames" },    
    WhisperOfTremors         = { Id = 321, Name = "Whisper of Tremors" },
    WhisperOfTides           = { Id = 322, Name = "Whisper of Tides" },
    WhisperOfGales           = { Id = 323, Name = "Whisper of Gales" },
    WhisperOfFrost           = { Id = 324, Name = "Whisper of Frost" },
    WhisperOfStorms          = { Id = 325, Name = "Whisper of Storms" },
    MoonBauble               = { Id = 334, Name = "Moon Bauble" },    
}

local Weeklies = T{
    {
        POS = '(J-9)',
        Location = 'Kazham (Ronta-Onta)',
        Name = 'Trial by Fire',
        AName = 'Ifrit',        
        KeyItem = KeyItems.TuningForkOfFire,
    },
    {
        POS = '(I-8)',
        Location = 'Port Bastok (Juroro)',
        Name = 'Trial by Earth',
        AName = 'Titan',
        KeyItem = KeyItems.TuningForkOfEarth,
    },
    {
        POS = '(H-9)',
        Location = 'Norg (Edal-Tahdal)',
        Name = 'Trial by Water',
        AName = 'Leviathan',
        KeyItem = KeyItems.TuningForkOfWater,
    },
    {
        POS = '(G-9)',
        Location = 'Rabao (Agado-Pugado)',
        Name = 'Trial by Wind',
        AName = 'Garuda',
        KeyItem = KeyItems.TuningForkOfWind,
    },
    {
        POS = '(E-7)',
        Location = 'North Sandy (Gulmama)',
        Name = 'Trial by Ice',
        AName = 'Shiva',
        KeyItem = KeyItems.TuningForkOfIce,
    },
    {
        POS = '(I-9)',
        Location = 'Mhaura (Ripapa)',
        Name = 'Trial by Lightning',
        AName = 'Ramuh',
        KeyItem = KeyItems.TuningForkOfLightning,
    },
    {
        POS = '(J-8)',
        Location = 'Windy Waters (s) (Kerutoto)',
        Name = 'Waking Dreams',
        AName = 'Diablos',
        KeyItem = KeyItems.VialOfDreamIncense,
    },
    {
        POS = '(J-8)',
        Location = 'Windy Waters (s) (Kerutoto)',
        Name = 'Waking Dreams',
        AName = 'Diablos',
        KeyItem = KeyItems.WhisperOfDreams,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Ifrit',
        KeyItem = KeyItems.WhisperOfFlames,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Titan',
        KeyItem = KeyItems.WhisperOfTremors,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Leviathan',
        KeyItem = KeyItems.WhisperOfTides,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Garuda',
        KeyItem = KeyItems.WhisperOfGales,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Shiva',
        KeyItem = KeyItems.WhisperOfFrost,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Ramuh',
        KeyItem = KeyItems.WhisperOfStorms,
    },
    {
        POS = '(J-9)',
        Location = 'Windy Waters (s) (Leepe-Hoppe)',
        Name = 'The Moonlit Path',
        AName = 'Fenrir',
        KeyItem = KeyItems.MoonBauble,
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
        Name = 'Avatar',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Weeklies
                :map(function(w) return w.AName end)
                :append('Avatar')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(activity, player, timers, now)
            imgui.Text(activity.AName)
        end,
    },
    {
        Name = 'Location',
        Flags = ImGuiTableColumnFlags_None,
        Width = imgui.CalcTextSize(
            Weeklies
                :map(function(w) return w.Location end)
                :append('Location')
                :sort(SortByLength)
                :first()
            ),
        Draw = function(activity, player, timers, now)
            imgui.Text(activity.Location)
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
    if imgui.BeginTable('xitools.summon.summary', #TableDef, TableFlags) then
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
local summon = {
    Name = 'summon',
    Aliases = T{ 'smn', 'all' },
    DefaultSettings = T{
        isEnabled = T{ false },
        isVisible = T{ true },
        name = 'xitools.summon',
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
        -- we get a key item update on every zone change, and the client
        -- will have already dumped its knowledge of held key items. to
        -- ensure we're not getting false positives from this scenario,
        -- we stop listening for key item updates until we receive the "stop
        -- downloading" packet, by which time we're sure to have all of our
        -- basic syncing out of the way.

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
        if imgui.BeginTabItem('summon') then
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

return summon
