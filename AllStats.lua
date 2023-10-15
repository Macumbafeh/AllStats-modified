local frame, texture
local frame2, texture2
local frame3, texture3
local frame4, texture4
local frame5, texture5

function AllStats_OnLoad()
	CharacterAttributesFrame:Hide();
	CharacterModelFrame:SetHeight(300);
	PaperDollFrame_UpdateStats = NewPaperDollFrame_UpdateStats;
end

function NewPaperDollFrame_UpdateStats()
	PrintStats();
end
local isExtended = true
-- Create Button
local MyButton = CreateFrame("Button", nil, PaperDollFrame)
MyButton:SetSize(32, 32)
MyButton:SetPoint("BOTTOMRIGHT", PaperDollFrame, "BOTTOMRIGHT", -40, 80)
MyButton:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
MyButton:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
MyButton:SetHighlightTexture("Interface\\BUTTONS\\UI-Common-MouseHilight")

-- Create Tooltip Function
local function showTooltip(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    local tooltipText = isExtended and "Hide Character Stats" or "Show Character Stats"
    GameTooltip:SetText(tooltipText, 1, 1, 1)
    GameTooltip:Show()
end

MyButton:SetScript("OnEnter", showTooltip)
MyButton:SetScript("OnLeave", function() GameTooltip:Hide() end)

-- Button OnClick Function
MyButton:SetScript("OnClick", function(self)
    isExtended = not isExtended
    if isExtended then
        AllStatsFrame:Show()
		 MyFrame:Show()
		 texture:Show()
		texture2:Show()
		texture3:Show()
		texture4:Show()
		texture5:Show()
        self:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
		self:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
    else
        AllStatsFrame:Hide()
		 MyFrame:Hide()
		 texture:Hide()
		texture2:Hide()
		texture3:Hide()
		texture4:Hide()
		texture5:Hide()
        self:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Up")
		self:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Down")
    end
    showTooltip(self) -- Update the tooltip
end)

-- Create Additional Frame (Replace this with your ScrollFrame if needed)
	local currentScale = CharacterFrame:GetScale()
    local currentWidth = CharacterFrame:GetWidth()
    local currentHeight = CharacterFrame:GetHeight()
	

local MyFrame = CreateFrame("Frame", "MyFrame", CharacterFrame)
MyFrame:ClearAllPoints()
MyFrame:SetSize(currentWidth / (1.9 * currentScale), currentHeight / (1 * currentScale))
MyFrame:SetPoint("TOPLEFT", "CharacterFrame", "TOPRIGHT", -34, -26)
MyFrame:SetFrameStrata("BACKGROUND")
-- MyFrame:Hide() -- Hide initially

-- Create Scroll Frame
local scrollFrame = CreateFrame("ScrollFrame", "scrollFrame", MyFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetSize(currentWidth / (1.9 * currentScale), 411)
scrollFrame:SetPoint("TOPLEFT", MyFrame, "TOPLEFT", -70, 5)
scrollFrame:SetFrameStrata("BACKGROUND")

local ContentFrame = CreateFrame("Frame", "ContentFrameID", scrollFrame)
ContentFrame:SetSize(currentWidth / (1.2 * currentScale), currentHeight / (1.2 * currentScale))

-- Attach MyFrame to Scroll Frame
scrollFrame:SetParent(MyFrame)
scrollFrame:SetScrollChild(ContentFrame)


-- Hook to dynamically show/hide the scrollbar
scrollFrame:HookScript("OnScrollRangeChanged", function(self, xrange, yrange)
    if floor(yrange) ~= 0 then
        self.ScrollBar:Show()
    else
        self.ScrollBar:Hide()
    end
end)

-- Create Scroll Bar Styling
local scrollbarName = scrollFrame:GetName()
_G[scrollbarName.."ScrollBar"]:SetBackdrop({
  bgFile = "Interface/Tooltips/UI-Tooltip-Background",
  edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
  tile = true,
  tileSize = 16,
  edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})

-- Create the texture for this frame
local tframe = MyFrame:CreateTexture(nil, "ARTWORK")
tframe:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomRight")
tframe:SetPoint("BOTTOM", MyFrame, "BOTTOM", 28, 24)

local tframe2 = MyFrame:CreateTexture(nil, "ARTWORK")
tframe2:SetTexture("Interface\\AddOns\\AllStats\\UI-Character-General-BottomRight.blp")
tframe2:SetPoint("TOP", MyFrame, "TOP", 28, 87)

local tframe3 = MyFrame:CreateTexture(nil, "ARTWORK")
tframe3:SetTexture("Interface\\AddOns\\AllStats\\UI-Character-General-BottomRight1.blp")
tframe3:SetPoint("TOP", MyFrame, "TOP", 28, 20)

local tframe4 = MyFrame:CreateTexture(nil, "ARTWORK")
tframe4:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomLeft")
tframe4:SetPoint("BOTTOM", MyFrame, "BOTTOM", -100, 24)

local tframe5 = MyFrame:CreateTexture(nil, "ARTWORK")
tframe5:SetTexture("Interface\\AddOns\\AllStats\\UI-Character-General-middleLeft.blp")
tframe5:SetPoint("BOTTOM", MyFrame, "BOTTOM", -50, 250)

local tframe6 = MyFrame:CreateTexture(nil, "ARTWORK")
tframe6:SetTexture("Interface\\AddOns\\AllStats\\UI-Character-General-BottomRight2.blp")
tframe6:SetPoint("BOTTOM", MyFrame, "BOTTOM", -50, 343)



function PrintStats()
	local str = AllStatsFrameStat1;
	local agi = AllStatsFrameStat2;
	local sta = AllStatsFrameStat3;
	local int = AllStatsFrameStat4;
	local spi = AllStatsFrameStat5;

	local md = AllStatsFrameStatMeleeDamage;
	local ms = AllStatsFrameStatMeleeSpeed;
	local mp = AllStatsFrameStatMeleePower;
	local mh = AllStatsFrameStatMeleeHit;
	local mc = AllStatsFrameStatMeleeCrit;
	local me = AllStatsFrameStatMeleeExpert;

	local rd = AllStatsFrameStatRangeDamage;
	local rs = AllStatsFrameStatRangeSpeed;
	local rp = AllStatsFrameStatRangePower;
	local rh = AllStatsFrameStatRangeHit;
	local rc = AllStatsFrameStatRangeCrit;

	local sd = AllStatsFrameStatSpellDamage;
	local she = AllStatsFrameStatSpellHeal;
	local shi = AllStatsFrameStatSpellHit;
	local sc = AllStatsFrameStatSpellCrit;
	local sha = AllStatsFrameStatSpellHaste;
	local sr = AllStatsFrameStatSpellRegen;

	local armor = AllStatsFrameStatArmor;
	local def = AllStatsFrameStatDefense;
	local dodge = AllStatsFrameStatDodge;
	local parry = AllStatsFrameStatParry;
	local block = AllStatsFrameStatBlock;
	local res = AllStatsFrameStatResil;


	PaperDollFrame_SetStat(str, 1);
	PaperDollFrame_SetStat(agi, 2);
	PaperDollFrame_SetStat(sta, 3);
	PaperDollFrame_SetStat(int, 4);
	PaperDollFrame_SetStat(spi, 5);

	PaperDollFrame_SetDamage(md);
	md:SetScript("OnEnter", CharacterDamageFrame_OnEnter);
	PaperDollFrame_SetAttackSpeed(ms);
	PaperDollFrame_SetAttackPower(mp);
	PaperDollFrame_SetRating(mh, CR_HIT_MELEE);
	PaperDollFrame_SetMeleeCritChance(mc);
	PaperDollFrame_SetExpertise(me);

	PaperDollFrame_SetRangedDamage(rd);
	rd:SetScript("OnEnter", CharacterRangedDamageFrame_OnEnter);
	PaperDollFrame_SetRangedAttackSpeed(rs);
	PaperDollFrame_SetRangedAttackPower(rp);
	PaperDollFrame_SetRating(rh, CR_HIT_RANGED);
	PaperDollFrame_SetRangedCritChance(rc);

	PaperDollFrame_SetSpellBonusDamage(sd);
	sd:SetScript("OnEnter", CharacterSpellBonusDamage_OnEnter);
	PaperDollFrame_SetSpellBonusHealing(she);
	PaperDollFrame_SetRating(shi, CR_HIT_SPELL);
	PaperDollFrame_SetSpellCritChance(sc);
	sc:SetScript("OnEnter", CharacterSpellCritChance_OnEnter);
	PaperDollFrame_SetSpellHaste(sha);
	PaperDollFrame_SetManaRegen(sr);

	PaperDollFrame_SetArmor(armor);
	PaperDollFrame_SetDefense(def);
	PaperDollFrame_SetDodge(dodge);
	PaperDollFrame_SetParry(parry);
	PaperDollFrame_SetBlock(block);
	PaperDollFrame_SetResilience(res);
end

local AllStatsShowFrame = true;

function AllStatsButtonShowFrame_OnClick()
	AllStatsShowFrame = not AllStatsShowFrame;
	if AllStatsShowFrame then
		AllStatsFrame:Show();
	else
		AllStatsFrame:Hide();
	end
end



local BaseStat = MyFrame:CreateTexture(nil, "OVERLAY")
BaseStat:SetSize(140, 22)
BaseStat:SetTexture("Interface\\AddOns\\AllStats\\PaperDollInfoPart1.blp")
BaseStat:SetPoint("TOPLEFT", MyFrame, "TOPLEFT", 0, 0)
BaseStat:SetTexCoord(0, 0.7734375, 0.453125, 0.6015625)

local Melee = MyFrame:CreateTexture(nil, "OVERLAY")
Melee:SetSize(140, 22)
Melee:SetTexture("Interface\\AddOns\\AllStats\\PaperDollInfoPart1.blp")
Melee:SetPoint("TOPLEFT", MyFrame, "TOPLEFT", 0, -97)
Melee:SetTexCoord(0, 0.7734375, 0.453125, 0.6015625)

local Ranged = MyFrame:CreateTexture(nil, "OVERLAY")
Ranged:SetSize(140, 22)
Ranged:SetTexture("Interface\\AddOns\\AllStats\\PaperDollInfoPart1.blp")
Ranged:SetPoint("TOPLEFT", MyFrame, "TOPLEFT", 0, -207)
Ranged:SetTexCoord(0, 0.7734375, 0.453125, 0.6015625)

local Spell = MyFrame:CreateTexture(nil, "OVERLAY")
Spell:SetSize(140, 22)
Spell:SetTexture("Interface\\AddOns\\AllStats\\PaperDollInfoPart1.blp")
Spell:SetPoint("TOPLEFT", MyFrame, "TOPLEFT", 0, -302)
Spell:SetTexCoord(0, 0.7734375, 0.453125, 0.6015625)

local Defenses = MyFrame:CreateTexture(nil, "OVERLAY")
Defenses:SetSize(140, 22)
Defenses:SetTexture("Interface\\AddOns\\AllStats\\PaperDollInfoPart1.blp")
Defenses:SetPoint("TOPLEFT", MyFrame, "TOPLEFT", 0, -410)
Defenses:SetTexCoord(0, 0.7734375, 0.453125, 0.6015625)

local function ShowOrHideTexture()
    if PaperDollFrame:IsVisible() then
        texture:Show()
		texture2:Show()
		texture3:Show()
		texture4:Show()
		texture5:Show()
		BaseStat:Show()
		Melee:Show()
		Ranged:Show()
		Spell:Show()
		Defenses:Show()
		tframe:Show()
		tframe2:Show()
		tframe3:Show()
		tframe4:Show()
		tframe5:Show()
		tframe6:Show()
    else
        texture:Hide()
		texture2:Hide()
		texture3:Hide()
		texture4:Hide()
		texture5:Hide()
		BaseStat:Hide()
		Melee:Hide()
		Ranged:Hide()
		Spell:Hide()
		Defenses:Hide()
		tframe:Hide()
		tframe2:Hide()
		tframe3:Hide()
		tframe4:Hide()
		tframe5:Hide()
		tframe6:Hide()
    end
end


local function UpdateTexture(texture)
    local className, classFilename, classId = UnitClass("player")

    -- Your mapping from class and spec to texture
    local textureMap = {
        WARRIOR = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorArms-TopLeft.blp",
        SHAMAN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanRestoration-TopLeft.blp",
		PALADIN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\PaladinProtection-TopLeft.blp",
        HUNTER = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterBeastMastery-TopLeft.blp",
		ROGUE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\RogueSubtlety-TopLeft.blp",
        MAGE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\MageArcane-TopLeft.blp",
		WARLOCK = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarlockSummoning-TopLeft.blp",
        PRIEST = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\PriestDiscipline-TopLeft.blp",
		DRUID = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\DruidBalance-TopLeft.blp",
        -- etc.
    }

    -- Update the texture
    if textureMap[classFilename] then
        texture:SetTexture(textureMap[classFilename])
		texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    else
        -- Default texture if class is not found in the map
        texture:SetTexture("Interface\\AddOns\\AllStats\\nightelf_1.blp")
    end
end

local function UpdateTexture2(texture2)
    local className, classFilename, classId = UnitClass("player")

    -- Your mapping from class and spec to texture
    local textureMap2 = {
        WARRIOR = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorFury-TopLeft.blp",
        SHAMAN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanElementalCombat-TopLeft.blp",
		PALADIN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\PaladinCombat-TopLeft.blp",
        HUNTER = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterSurvival-TopLeft.blp",
		ROGUE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\RogueAssassination-TopLeft.blp",
        MAGE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\MageFire-TopLeft.blp",
		WARLOCK = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarlockCurses-TopLeft.blp",
        PRIEST = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\PriestHoly-TopLeft.blp",
		DRUID = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\DruidFeralCombat-TopLeft.blp",
    }


    -- Update the texture
    if textureMap2[classFilename] then
        texture2:SetTexture(textureMap2[classFilename])
		texture2:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    else
        -- Default texture if class is not found in the map
        texture2:SetTexture("Interface\\AddOns\\AllStats\\nightelf_1.blp")
    end
end

local function UpdateTexture3(texture3)
    local className, classFilename, classId = UnitClass("player")

    -- Your mapping from class and spec to texture
    local textureMap3 = {
        WARRIOR = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
        SHAMAN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
		PALADIN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
		HUNTER = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
		ROGUE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
        MAGE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
		WARLOCK = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
        PRIEST = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
		DRUID = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
    }

    -- Update the texture
    if textureMap3[classFilename] then
        texture3:SetTexture(textureMap3[classFilename])
		texture3:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    else
        -- Default texture if class is not found in the map
        texture3:SetTexture("Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp")
    end
end

local function UpdateTexture4(texture4)
    local className, classFilename, classId = UnitClass("player")

    -- Your mapping from class and spec to texture
    local textureMap4 = {
        WARRIOR = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp",
        SHAMAN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp",
		PALADIN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp",
        HUNTER = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp",
		ROGUE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp",
        MAGE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\MageFrost-TopLeft.blp",
		WARLOCK = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarlockDestruction-TopLeft.blp",
        PRIEST = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\PriestShadow-TopLeft.blp",
		DRUID = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\DruidRestoration-TopLeft.blp",
    }


    -- Update the texture
    if textureMap4[classFilename] then
        texture4:SetTexture(textureMap4[classFilename])
		texture4:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    else
        -- Default texture if class is not found in the map
        texture4:SetTexture("Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp")
    end
end

local function UpdateTexture5(texture5)
    local className, classFilename, classId = UnitClass("player")

    -- Your mapping from class and spec to texture
    local textureMap5 = {
        WARRIOR = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
        SHAMAN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
		PALADIN = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
		HUNTER = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
		ROGUE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
        MAGE = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
		WARLOCK = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
        PRIEST = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
		DRUID = "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
    }

    -- Update the texture
    if textureMap5[classFilename] then
        texture5:SetTexture(textureMap5[classFilename])
		texture5:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    else
        -- Default texture if class is not found in the map
        texture5:SetTexture("Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp")
		-- ranged "Interface\\AddOns\\Fizzle\\Textures\\Talent\\HunterMarksmanship-TopLeft.blp",
		-- spell "Interface\\AddOns\\Fizzle\\Textures\\Talent\\ShamanEnhancement-TopLeft.blp",
		-- Defenses "Interface\\AddOns\\Fizzle\\Textures\\Talent\\WarriorProtection-TopLeft.blp",
    end
end

local function OnEvent(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "AllStats" then
        if AllStatsFrame then
            frame1 = CreateFrame("Frame", "MyNewFrame", UIParent)
            frame1:SetSize(135, 100)
            frame1:SetPoint("TOPLEFT", AllStatsFrameTop, "BOTTOMLEFT", 25, 3)

            texture = frame1:CreateTexture(nil, "BACKGROUND")
            texture:SetAllPoints(frame1)
            texture:Hide()  -- Hide it by default
            
			frame2 = CreateFrame("Frame", "MyNewFrame2", UIParent)
            frame2:SetSize(135, 115)
            frame2:SetPoint("TOPLEFT", AllStatsFrameTop, "BOTTOMLEFT", 25, -125)
			
			texture2 = frame2:CreateTexture(nil, "BACKGROUND")
            texture2:SetAllPoints(frame2)
            texture2:Hide()
			
			frame3 = CreateFrame("Frame", "MyNewFrame3", UIParent)
            frame3:SetSize(135, 100)
            frame3:SetPoint("TOPLEFT", AllStatsFrameTop, "BOTTOMLEFT", 25, -264)
			
			texture3 = frame3:CreateTexture(nil, "BACKGROUND")
            texture3:SetAllPoints(frame3)
            texture3:Hide()
			
			frame4 = CreateFrame("Frame", "MyNewFrame4", UIParent)
            frame4:SetSize(135, 115)
            frame4:SetPoint("TOPLEFT", AllStatsFrameTop, "BOTTOMLEFT", 25, -388)
			
			texture4 = frame4:CreateTexture(nil, "BACKGROUND")
            texture4:SetAllPoints(frame4)
            texture4:Hide()
			
			frame5 = CreateFrame("Frame", "MyNewFrame5", UIParent)
            frame5:SetSize(135, 115)
            frame5:SetPoint("TOPLEFT", AllStatsFrameTop, "BOTTOMLEFT", 25, -530)
			
			texture5 = frame5:CreateTexture(nil, "BACKGROUND")
            texture5:SetAllPoints(frame5)
            texture5:Hide()
			
            -- Hook CharacterFrame's methods to show/hide texture
            hooksecurefunc(PaperDollFrame, "Show", ShowOrHideTexture)
            hooksecurefunc(PaperDollFrame, "Hide", ShowOrHideTexture)
			hooksecurefunc(CharacterFrame, "Show", ShowOrHideTexture)
            hooksecurefunc(CharacterFrame, "Hide", ShowOrHideTexture)
            
            -- Initial state
            ShowOrHideTexture()
			UpdateTexture(texture)
			UpdateTexture2(texture2)
			UpdateTexture3(texture3)
			UpdateTexture4(texture4)
			UpdateTexture5(texture5)
		elseif event == "PLAYER_SPECIALIZATION_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
			UpdateTexture(texture)
			UpdateTexture2(texture2)
			UpdateTexture3(texture3)
			UpdateTexture4(texture4)
			UpdateTexture5(texture5)
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent('PLAYER_LOGIN')
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", OnEvent)


		
-- Todo MacroFrame and PlayerTalentFrame to move when character frame is open