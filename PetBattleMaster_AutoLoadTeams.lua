AddonName = "PetBattleMaster_AutoLoadTeams"
PetBattleMaster_AutoLoadTeams = LibStub("AceAddon-3.0"):NewAddon(AddonName, "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(AddonName)

function PetBattleMaster_AutoLoadTeams:OnInitialize()
end

function PetBattleMaster_AutoLoadTeams:OnEnable()
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "SelectPetTeamByTargetName")
end

function PetBattleMaster_AutoLoadTeams:OnDisable()
end


function PetBattleMaster_AutoLoadTeams:SelectPetTeamByTargetName()
	if (UnitName("target") ~= nil and (not UnitPlayerControlled("target")) and UnitReaction("target", "player") > 3) then
	    local teams = petbm.PetTeamView.db.profile.teams
		for i=1,#teams do
			if (teams[i].name:lower() == GetUnitName("target"):lower()) then
			--	petbm.PetTeamView.PETBM_TEAM_SELECTED(petbm.PetTeamView, null, i)
				self:SendMessage("PETBM_TEAM_SELECTED", i)
				print("|cffffffffLoading |cff1eff00PetBattleMaster |cffffffffteam: ".."|cff0070dd"..GetUnitName("target").."|cffffffff.")
			return
		    end
	    end
	end
end