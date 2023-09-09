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
        -- Clue 1: The Preservationist
        [208054] = true, -- A Mystery Box
        [208055] = true, -- Golden Chalice
        [208056] = true, -- A Clue: The Golden Chalice

        -- Clue 2: Ceremonial Spear
        [207105] = true, -- Tuskarr Ceremonial Spear
        [207580] = true, -- Shomko's Unyielding Spear
        [208190] = true, -- The Elder's Drawing

        -- Clue 3: Thinking Cap
        [198441] = true, -- Thunderspine Tenders
        [201419] = true, -- Apexis Asiago
        [205693] = true, -- Latticed Stinkhorn
        [206696] = true, -- Tricked-Out Thinking Cap
        [206944] = true, -- A Clue: The Thinking Cap
        [207802] = true, -- Thinking Cap Notes
        [207812] = true, -- Fresh Tyranha
        [207813] = true, -- Downy Helmet Liner
        [207814] = true, -- Thought Calculating Apparatus
        [207816] = true, -- Crystal Ocular Lenses
        [207956] = true, -- Thunderspine Nest
        
        -- Clue 4: Inside Job
        [208128] = true, -- Fangli's Note
        [208129] = true, -- Copied Artifact Storage Key
        [208130] = true, -- Maruuk Burial Banner

        -- Clue 5: Torch of Pyrreth
        [208092] = true, -- Torch of Pyrreth
        [208107] = true, -- Kathos' Field Glasses
        [208131] = true, -- Preservationist's Dispatch

        -- Clue 6: A Chilling Ascent
        [208137] = true, -- The Clerk's Notes
        [208143] = true, -- Unveiled Tablet Rubbing

        -- Clue 7: The Idol of Ohn'ahra
        [207730] = true, -- Idol of Ohn'ahra (Toy)
        [208144] = true, -- Preservationist's Dispatch Two
        [208145] = true, -- Idol of Ohn'ahra (Quest Item)

        -- Clue 8: Shifting Sands
        [206948] = true, -- A Clue: The Shifting Sands
        [208146] = true, -- Incomplete Tablet
        [208191] = true, -- Time-Lost Fragment

        -- Clue 9: What's in a Mold?
        [208486] = true, -- The Blacksmith and the Apprenticeb
        [208827] = true, -- Titan Key Mold

        -- Clue 10: Forging is Key
        [208829] = true, -- Titan Key Materials List
        [208830] = true, -- Reforged Titan Key
        [208835] = true, -- Rose Gold Dust
        [208836] = true, -- Igneous Flux

        -- Community Satchels
        [208142] = true, -- Buried Satchel

        -- Rewards
        [208149] = true, -- Brown Tweed Cap
        [208150] = true, -- Blue Tweed Cap
        [208152] = true, -- Pattie's Cap
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