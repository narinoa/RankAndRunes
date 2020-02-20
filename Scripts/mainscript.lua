local AvatarPlate = stateMainForm:GetChildChecked("Plates", false):GetChildChecked("Avatar", false)
local TargetPlate = stateMainForm:GetChildChecked("Plates", false):GetChildChecked("Target", false)
local TargetsTargetPlate = stateMainForm:GetChildChecked("Plates", false):GetChildChecked("TargetsTarget", false)
local AHaloSign = AvatarPlate:GetChildChecked("HaloSign", false)
local THaloSign = TargetPlate:GetChildChecked("HaloSign", false)
local Ico = mainForm:GetChildChecked( "IconPanel", false ) 
local RankAvatar = mainForm:CreateWidgetByDesc(Ico:GetWidgetDesc())
AvatarPlate:AddChild(RankAvatar)
local RankTarget = mainForm:CreateWidgetByDesc(Ico:GetWidgetDesc())
TargetPlate:AddChild(RankTarget)
local RankTargetsTarget = mainForm:CreateWidgetByDesc(Ico:GetWidgetDesc())
TargetsTargetPlate:AddChild(RankTargetsTarget)
local AvatarFrame = AvatarPlate:GetChildChecked("Frame", false):GetChildChecked("UnitQuality", false)
local TargetFrame = TargetPlate:GetChildChecked("Frame", false):GetChildChecked("UnitQuality", false)
local TargetsTargetFrame = TargetsTargetPlate:GetChildChecked("Frame", false):GetChildChecked("UnitQuality", false)
local Texture 

local p = AHaloSign:GetPlacementPlain()
	p.sizeX = Size  
	p.sizeY = Size 
    AHaloSign:SetPlacementPlain(p)
local p = THaloSign:GetPlacementPlain()
	p.sizeX = Size  
	p.sizeY = Size 
    THaloSign:SetPlacementPlain(p)
local p = RankAvatar:GetPlacementPlain()
	p.posX = 60 
	p.posY = 75 
    RankAvatar:SetPlacementPlain(p) 
local p = RankTarget:GetPlacementPlain()
	p.posX = 260 
	p.posY = 75 
    RankTarget:SetPlacementPlain(p) 
local p = RankTargetsTarget:GetPlacementPlain()
	p.posX = 30 
	p.posY = 50 
	p.sizeX = 20 
	p.sizeY = 20 
    RankTargetsTarget:SetPlacementPlain(p) 

--BARS
--Avatar
local AHealtBar = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("Health", false):GetChildChecked("Gauge", false)
local AHealtBarGlare = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("Health", false):GetChildChecked("Glare", false)
AHealtBarGlare:Show(false)
local AMana = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("Mana", false):GetChildChecked("Gauge", false)
local AManaGlare = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("Mana", false):GetChildChecked("Glare", false)
AManaGlare:Show(false)
local ARage = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("Rage", false):GetChildChecked("Gauge", false)
local ARageGlare = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("Rage", false):GetChildChecked("Glare", false)
ARageGlare:Show(false)
local AWarlockRage = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("WarlockRage", false):GetChildChecked("Gauge", false)
local AWarlockGlare = AvatarPlate:GetChildChecked("Bars", false):GetChildChecked("WarlockRage", false):GetChildChecked("Glare", false)
AWarlockGlare:Show(false)
--Target
local THealtBar = TargetPlate:GetChildChecked("Bars", false):GetChildChecked("Health", false):GetChildChecked("Gauge", false)
local THealtBarGlare = TargetPlate:GetChildChecked("Bars", false):GetChildChecked("Health", false):GetChildChecked("Glare", false)
THealtBarGlare:Show(false)
local TMana = TargetPlate:GetChildChecked("Bars", false):GetChildChecked("Mana", false):GetChildChecked("Gauge", false)
local TManaGlare = TargetPlate:GetChildChecked("Bars", false):GetChildChecked("Mana", false):GetChildChecked("Glare", false)
TManaGlare:Show(false)
--TargetsTarget
local TTHealtBar = TargetsTargetPlate:GetChildChecked("Bars", false):GetChildChecked("Health", false):GetChildChecked("Gauge", false)
local TTHealtBarGlare = TargetsTargetPlate:GetChildChecked("Bars", false):GetChildChecked("Health", false):GetChildChecked("Glare", false)
TTHealtBarGlare:Show(false)
local TTPetBar = TargetsTargetPlate:GetChildChecked("PetBar", false):GetChildChecked("Gauge", false)
	
function LoadBars()
if Bars then
	AHealtBar:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	AMana:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	AWarlockRage:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	ARage:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	THealtBar:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	TMana:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	TTHealtBar:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	TTPetBar:SetBackgroundTexture( common.GetAddonRelatedTexture("BAR"))
	end
end

function GetAvatarIcon()
local avatarinfo = unit.GetVeteranRank( avatar.GetId() )
if avatarinfo then
RankAvatar:Show(true)
RankAvatar:SetBackgroundTexture( avatarinfo.image )
else 
RankAvatar:Show(false)
	end
if FrameAvatar then
local isGreat = unit.IsGreat( avatar.GetId() )
if isGreat then
	AvatarFrame:SetBackgroundTexture( common.GetAddonRelatedTexture(IconAvatar))
	AvatarFrame:Show(true)
	else
	AvatarFrame:Show(false)
		end
	end
end 

function GetTargetIcon()
local targetId = avatar.GetTarget()
if targetId and unit.IsPlayer( targetId ) and object.IsExist(targetId) then
local targetinfo = unit.GetVeteranRank( avatar.GetTarget() )
	if targetinfo then
	RankTarget:SetBackgroundTexture( targetinfo.image )
	RankTarget:Show(true)
	else
	RankTarget:Show(false)
	end
else RankTarget:SetBackgroundTexture( Texture )
	RankTarget:Show(false)
	end
if FrameTarget then
if targetId and unit.IsPlayer( targetId ) and object.IsExist(targetId) then
local isGreat = unit.IsGreat( targetId )
local Type
if isGreat then
	if targetId == avatar.GetId() then
	Type = IconAvatar
	else
	Type = IconTarget
	end
	TargetFrame:SetBackgroundTexture( common.GetAddonRelatedTexture(Type))
	else
	TargetFrame:Show(false)
			end
		end
	end
end

function GetTargetsTargetIcon()
local targetId = avatar.GetTarget()
local Type
	if targetId and unit.IsPlayer( targetId ) and object.IsExist(targetId) then
	local TartetsTarget = unit.GetPrimaryTarget( targetId )
		if TartetsTarget and unit.IsPlayer( TartetsTarget ) then
		local isGreat = unit.IsGreat( TartetsTarget )
		local targetstargetinfo = unit.GetVeteranRank( TartetsTarget )
		if targetstargetinfo then
			RankTargetsTarget:SetBackgroundTexture( targetstargetinfo.image )
				RankTargetsTarget:Show(true)
			else
				RankTargetsTarget:Show(false)
		end
	if FrameTarget then
		if isGreat then
			if TartetsTarget == avatar.GetId() then
			Type = IconAvatar
			else
			Type = IconTarget
			end
		TargetsTargetFrame:SetBackgroundTexture( common.GetAddonRelatedTexture(Type))
		else
		TargetsTargetFrame:Show(false)
				end
			end
		end
	end
end

function Init()
--LoadBars()
common.RegisterEventHandler(GetTargetIcon, "EVENT_AVATAR_TARGET_CHANGED")
common.RegisterEventHandler(GetTargetsTargetIcon, "EVENT_AVATAR_TARGET_TARGET_CHANGED")
common.RegisterEventHandler(GetTargetsTargetIcon, "EVENT_AVATAR_TARGET_CHANGED")
common.RegisterEventHandler(GetAvatarIcon, "EVENT_SECOND_TIMER")
end

if (avatar.IsExist()) then Init()
else common.RegisterEventHandler(Init, "EVENT_AVATAR_CREATED")	
end