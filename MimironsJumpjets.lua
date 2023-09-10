-------------------------------------------------------------------------------
-- AdiBags - jumpjet of Azeroth By Crackpot (US, Illidan)
-------------------------------------------------------------------------------
local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local tonumber = _G.tonumber
local L = addon.L

local jumpjetFilter = AdiBags:RegisterFilter("Mimiron's Jumpjets", 98, "ABEvent-1.0")
jumpjetFilter.uiName = L["Mimiron's Jumpjets"]
jumpjetFilter.uiDesc = L["AdiBags filter for the items required to craft the Mimiron's Jumpjets mount."]

function jumpjetFilter:OnInitialize()
    self.items = {
        [208984] = true, -- First Booster Part
        [209055] = true, -- Third Booster Part
        [209781] = true, -- Second Booster Part
        [210022] = true, -- Mimiron's Jumpjets
    }
end

function jumpjetFilter:Update()
    self:SendMessage("AdiBags_FiltersChanged")
end

function jumpjetFilter:OnEnable()
    AdiBags:UpdateFilters()
end

function jumpjetFilter:OnDisable()
    AdiBags:UpdateFilters()
end

function jumpjetFilter:Filter(slotData)
    if self.items[tonumber(slotData.itemId)] then
        return L["Mimiron's Jumpjets"]
    end
end