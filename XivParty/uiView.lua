--[[
	Copyright © 2023, Tylas
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

		* Redistributions of source code must retain the above copyright
		  notice, this list of conditions and the following disclaimer.
		* Redistributions in binary form must reproduce the above copyright
		  notice, this list of conditions and the following disclaimer in the
		  documentation and/or other materials provided with the distribution.
		* Neither the name of XivParty nor the
		  names of its contributors may be used to endorse or promote products
		  derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

-- imports
local classes = require('classes')
local uiContainer = require('uiContainer')
local uiPartyList = require('uiPartyList')
local layoutDefaults = require('layout')
local const = require('const')
chat = require('chat');

-- create the class, derive from uiContainer
local uiView = classes.class(uiContainer)

-- private functions
local function getLayoutFileNames(layoutName)
	local layoutFile = const.layoutDir .. layoutName .. const.xmlExtension
	local layoutAllianceFile = const.layoutDir .. layoutName .. const.layoutAllianceSuffix .. const.xmlExtension

	return layoutFile, layoutAllianceFile
end

local function checkLayout(layoutName)
	local layoutFile = getLayoutFileNames(layoutName)

	if not ashita.fs.exists(addon.path .. layoutFile) then
		print('Layout \'' .. layoutName .. '\' not found. Reverting to default \'' .. const.defaultLayout .. '\'.')

		Settings.layout = const.defaultLayout
	end
end

function Error(text)
    local color = ('\30%c'):format(68);
    local highlighted = color .. string.gsub(text, '$H', '\30\01\30\02');
    highlighted = string.gsub(highlighted, '$R', '\30\01' .. color);
    print(chat.header(addon.name) .. highlighted .. '\30\01');
end

function LoadFile_s(filePath)

    if not ashita.fs.exists(filePath) then
        return nil;
    end

    local success, loadError = loadfile(filePath);
    if not success then
        Error(string.format('Failed to load resource file: $H%s', filePath));
        Error(loadError);
        return nil;
    end

    local result, output = pcall(success);
    if not result then
        Error(string.format('Failed to execute resource file: $H%s', filePath));
        Error(loadError);
        return nil;
    end

    return output;
end

local function loadLayout(layoutName)
	local layoutFile, layoutAllianceFile = getLayoutFileNames(layoutName)

	local layout = LoadFile_s(addon.path .. layoutFile);
	table.merge(layout, layoutDefaults, false);
	local layoutAlliance

	if ashita.fs.exists(addon.path .. layoutAllianceFile) then
		layoutAlliance = LoadFile_s(addon.path .. layoutAllianceFile);
		table.merge(layoutAlliance, layoutDefaults, false);
	else
		layoutAlliance = layout
	end

	return layout, layoutAlliance
end

function uiView:init(model, isUiLocked)
	if isUiLocked == nil then isUiLocked = true end

	if self.super:init() then
		self.model = model
		self.isUiLocked = isUiLocked

		self.partyLists = T{} -- UI elements for each party

		self:reload()
	end
end

function uiView:reload()
	self:clearChildren(true) -- destroy previously loaded UI

	self.lastPartyIndex = 2
	if Settings.hideAlliance then
		self.lastPartyIndex = 0
	end

	checkLayout(Settings.layout)
	self.layout, self.layoutAlliance = loadLayout(Settings.layout)

	for i = 0, self.lastPartyIndex do
		self.partyLists[i] = self:addChild(uiPartyList.new(
			i == 0 and self.layout.partyList or self.layoutAlliance.partyList, -- lua style ternary operator
			i,
			self.model,
			self.isUiLocked))
	end

	-- initialize UI, as there is no parent element to call these for us
	self:layoutElement()
	self:createPrimitives()
end

function uiView:setModel(model)
	if not self.isEnabled then return end

	self.model = model

	for i = 0, self.lastPartyIndex do
		self.partyLists[i]:setModel(model)
	end
end

function uiView:setUiLocked(isUiLocked)
	if not self.isEnabled then return end

	self.isUiLocked = isUiLocked

	for i = 0, self.lastPartyIndex do
		self.partyLists[i]:setUiLocked(isUiLocked)
	end
end

function uiView:drawDragConfig()
	for i = 0, self.lastPartyIndex do
		self.partyLists[i]:drawDragConfig();
	end
end

function uiView:debugSaveLayout()
	if not self.isEnabled then return end

	self.layout:save()
	self.layoutAlliance:save();

	print('Layout saved.')
end

function uiView:updatePartyScales()
	if not self.isEnabled then return end

	for i = 0, self.lastPartyIndex do
		self.partyLists[i]:scaleFromSettings()
	end
end

return uiView