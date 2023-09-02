-------------------------------------------------------------------------------
-- AdiBags - Secrets of Azeroth By Crackpot (US, Illidan)
-------------------------------------------------------------------------------
local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local tonumber = _G.tonumber
local L = addon.L

local secretsFilter = AdiBags:RegisterFilter("Secrets of Azeroth", 98, "ABEvent-1.0")
secretsFilter.uiName = L["Secrets of Azeroth"]
secretsFilter.uiDesc = L["AdiBags filter for items from the Secrets of Azeroth event in World of Warcraft."]

function secretsFilter:OnInitialize()
    self.secrets = {
        [198441] = true, -- Thunderspine Tenders
        [201419] = true, -- Apexis Asiago
        [205693] = true, -- Latticed Stinkhorn
        [206696] = true, -- Tricked-Out Thinking Cap
        [206944] = true, -- A Clue: The Thinking Cap
        [207105] = true, -- Tuskarr Ceremonial Spear
        [207580] = true, -- Shomko's Unyielding Spear
        [207802] = true, -- Thinking Cap Notes
        [207812] = true, -- Fresh Tyranha
        [207813] = true, -- Downy Helmet Liner
        [207814] = true, -- Thought Calculating Apparatus
        [207816] = true, -- Crystal Ocular Lenses
        [207956] = true, -- Thunderspine Nest
        [208054] = true, -- A Mystery Box
        [208055] = true, -- Golden Chalice
        [208149] = true, -- Brown Tweed Cap
        [208150] = true, -- Blue Tweed Cap
        [208152] = true, -- Pattie's Cap
        [208190] = true, -- The Elder's Drawing
        [208416] = true, -- Thunderspine Nest Shopping List
    }
end

function secretsFilter:Update()
    self:SendMessage("AdiBags_FiltersChanged")
end

function secretsFilter:OnEnable()
    AdiBags:UpdateFilters()
end

function secretsFilter:OnDisable()
    AdiBags:UpdateFilters()
end

function secretsFilter:Filter(slotData)
    if self.secrets[tonumber(slotData.itemId)] then
        return L["Secrets of Azeroth"]
    end
end