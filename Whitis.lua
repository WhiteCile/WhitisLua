------------------
-- Auto Updater --
------------------

-- Auto Updater from https://github.com/hexarobi/stand-lua-auto-updater
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
        function(result, headers, status_code)
            local function parse_auto_update_result(result, headers, status_code)
                local error_prefix = "Error downloading auto-updater: "
                if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
            end
            auto_update_complete = parse_auto_update_result(result, headers, status_code)
        end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

local auto_update_config = {
    source_url="https://raw.githubusercontent.com/WhiteCile/WhitisLua/main/Whitis.lua",
    script_relpath=SCRIPT_RELPATH,
    verify_file_begins_with="--",
}

auto_updater.run_auto_update(auto_update_config)

-----------
-- Start --
-----------

util.keep_running()
util.require_natives("natives-1663599433")

util.toast("Yoooo Whadup")
util.log("Whitis Lua Started!")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------
-- Credits List --
------------------

local Credits = menu.list(menu.my_root(), "Credits", {""}, "")
---------------------------------------------------------------------------------
menu.divider(Credits, "Coders")
---------------------------------------------------------------------------------
menu.action(Credits, "WhiteCile", {}, "That's Me :O", function() end)
menu.action(Credits, "Asuka", {}, "Blacklist and Code Sharing :)", function() end)
---------------------------------------------------------------------------------
menu.divider(Credits, "Great Supporters <3")
---------------------------------------------------------------------------------
menu.action(Credits, "Everyone Using my Lua :3", {}, "Testing xd", function() end)
menu.action(Credits, "Lobby Crasher", {}, "Bec they Fill the Blacklist :)", function() end)
---------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------
-- Script Var Defining --
-------------------------

-----------------
-- Jinx Script --
-----------------
		
local DF_StopForCars							= 1,
local DF_StopForPeds							= 2,
local DF_SwerveAroundAllCars					= 4,
local DF_SteerAroundStationaryCars				= 8,
local DF_SteerAroundPeds						= 16,
local DF_SteerAroundObjects						= 32,
local DF_DontSteerAroundPlayerPed				= 64,
local DF_StopAtLights							= 128,
local DF_GoOffRoadWhenAvoiding					= 256,
local DF_DriveIntoOncomingTraffic				= 512,
local DF_DriveInReverse							= 1024,
local DF_UseWanderFallbackInsteadOfStraightLine = 2048,
local DF_AvoidRestrictedAreas					= 4096,
local DF_PreventBackgroundPathfinding			= 8192,
local DF_AdjustCruiseSpeedBasedOnRoadSpeed		= 16384,
local DF_UseShortCutLinks						= 262144,
local DF_ChangeLanesAroundObstructions			= 524288,
local DF_UseSwitchedOffNodes					= 2097152,
local DF_PreferNavmeshRoute						= 4194304, 
local DF_PlaneTaxiMode							= 8388608,
local DF_ForceStraightLine						= 16777216,
local DF_UseStringPullingAtJunctions			= 33554432,
local DF_AvoidHighways							= 536870912,
local DF_ForceJoinInRoadDirection				= 1073741824

local ECF_RESUME_IF_INTERRUPTED 				= 1,
local ECF_WARP_ENTRY_POINT 						= 2,
local ECF_JACK_ANYONE 							= 8,
local ECF_WARP_PED 								= 16,
local ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP 		= 64,
local ECF_DONT_CLOSE_DOOR						= 256,
local ECF_WARP_IF_DOOR_IS_BLOCKED 				= 512,
local ECF_JUMP_OUT 								= 4096,
local ECF_DONT_DEFAULT_WARP_IF_DOOR_BLOCKED 	= 65536,
local ECF_USE_LEFT_ENTRY 						= 131072,
local ECF_USE_RIGHT_ENTRY 						= 262144,
local ECF_JUST_PULL_PED_OUT 					= 524288,
local ECF_BLOCK_SEAT_SHUFFLING 					= 1048576,
local ECF_WARP_IF_SHUFFLE_LINK_IS_BLOCKED 		= 4194304,
local ECF_DONT_JACK_ANYONE 						= 8388608,
local ECF_WAIT_FOR_ENTRY_POINT_TO_BE_CLEAR 		= 16777216

local randomPeds = {
	util.joaat("a_f_y_topless_01"),
	util.joaat("s_m_m_movalien_01"),
	util.joaat("s_m_y_mime"), 
	util.joaat("u_m_y_militarybum"),
	util.joaat("a_m_y_indian_01"),
	util.joaat("s_m_y_clown_01"),
	util.joaat("u_m_y_burgerdrug_01")
}

local blacklistedScripts = {
	"freemode",
	"valentineRpReward2",
	"main_persistent",
	"cellphone_controller",
	"shop_controller",
	"stats_controller",
	"timershud",
	"am_npc_invites",
	"fm_maintain_cloud_header_data"
}

------------
-- Whitis --
------------

local all_weapons = {
"weapon_railgun",
"weapon_stungun",
"weapon_digiscanner",
"weapon_emplauncher",
"weapon_digiscanner",
"weapon_raypistol",
"weapon_firework",
"weapon_flare",
"WEAPON_KNIFE",
"WEAPON_NIGHTSTICK",
"weapon_bottle",
"weapon_unarmed",
"WEAPON_HAMMER",
"WEAPON_BAT",
"WEAPON_GOLFCLUB",
"WEAPON_CROWBAR",
"WEAPON_PISTOL",
"WEAPON_COMBATPISTOL",
"WEAPON_APPISTOL",
"WEAPON_PISTOL50",
"WEAPON_MICROSMG",
"WEAPON_SMG",
"WEAPON_ASSAULTSMG",
"WEAPON_ASSAULTRIFLE",
"weapon_hatchet",
"weapon_knuckle",
"weapon_machete",
"weapon_dagger",
"weapon_switchblade",
"weapon_wrench",
"weapon_battleaxe",
"weapon_poolcue",
"weapon_pistol_mk2",
"weapon_snspistol",
"weapon_snspistol_mk2",
"weapon_heavypistol",
"weapon_vintagepistol",
"weapon_flaregun",
"weapon_marksmanpistol",
"weapon_revolver",
"weapon_revolver_mk2",
"weapon_doubleaction",
"weapon_ceramicpistol",
"weapon_navyrevolver",
"weapon_smg_mk2",
"weapon_combatpdw",
"weapon_machinepistol",
"weapon_minismg",
"weapon_raycarbine",
"weapon_pumpshotgun",
"weapon_pumpshotgun_mk2",
"weapon_sawnoffshotgun",
"weapon_assaultshotgun",
"weapon_bullpupshotgun",
"weapon_musket",
"weapon_heavyshotgun",
"weapon_dbshotgun",
"weapon_autoshotgun",
"weapon_assaultrifle",
"weapon_assaultrifle_mk2",
"weapon_carbinerifle",
"weapon_carbinerifle_mk2",
"weapon_advancedrifle",
"weapon_specialcarbine",
"weapon_specialcarbine_mk2",
"weapon_bullpuprifle",
"weapon_bullpuprifle_mk2",
"weapon_compactrifle",
"weapon_mg",
"weapon_combatmg",
"weapon_combatmg_mk2",
"weapon_gusenberg",
"weapon_sniperrifle",
"weapon_heavysniper",
"weapon_heavysniper_mk2",
"weapon_marksmanrifle",
"weapon_marksmanrifle_mk2",
"weapon_rpg",
"weapon_grenadelauncher",
"weapon_grenadelauncher_smoke",
"weapon_minigun",
"weapon_hominglauncher",
"weapon_compactlauncher",
"weapon_rayminigun",
"weapon_grenade",
"weapon_bzgas",
"weapon_molotov",
"weapon_proxmine",
"weapon_snowball",
"weapon_pipebomb",
"weapon_ball",
"weapon_smokegrenade",
"weapon_stickybomb",
"weapon_petrolcan",
"weapon_parachute",
"weapon_fireextinguisher",
"weapon_hazardcan",
}

local wselbridge = filesystem.store_dir() .. "WSELBridge.txt" -- File for receiving commands from the AHK Script
local ahkrunsetting = filesystem.store_dir() .. "WSESetting.txt" -- Tell's my AHK Script your RunSettings
local isscriptbot = false -- Pre Define the AHK Runmode if it wasn't picked yet
local scriptshuttingdown = false -- Pre Define Script state (otherwise i would get nil value errors)
local lastcrashposition = ""
local BlackListedVehicles = {}
local BlackListedVehiclesDestroyOnly = {}
local PedJackFallback = false

local Necessary_AHK_Settings_On = {
"Online>Transitions>Speed Up>Don't Wait For Data Broadcast",
"Online>Transitions>Speed Up>Don't Wait For Mission Launcher",
"Online>Transitions>Speed Up>Don't Ask For Permission To Spawn",
"Online>Transitions>Skip Swoop Down",
"Online>Transitions>Disable Spawn Activities",
"Online>Session>Player Leave Reasons>Write To Log File",
"Online>Session>Player Leave Notifications>Write To Log File",
"Online>Enhancements>Disable Idle/AFK Kick",
"Online>Enhancements>Block Background Script",
"Online>Protections>Block Join Karma>Block Join Karma",
"Online>Protections>Block Join Karma>Write To Log File",
"Online>Chat>Log Chat Messages>Log.txt",
"Online>Player Tags On Blips",
"Stand>Settings>Session Joining>Check If Join Will Succeed",
}

local Bot_AHK_Settings_On = {
"Self>Movement>Reduced Collision",
"Self>Immortality",
"Self>Gracefulness",
"Self>Lock Wanted Level",
"Vehicle>Collisions>No Collision With Other Vehicles",
"Vehicle>Indestructible",
"Vehicle>Can't Be Dragged Out",
"Online>Enhancements>Disable Death Barriers",
"Online>Protections>Block Bailing",
"Online>Protections>Block Blaming",
"Online>Protections>Block Entity Spam>Automatically Use Anti-Crash Cam",
"Online>Spoofing>Host Token Spoofing>Host Token Spoofing",
"Online>Spoofing>Host Token Spoofing>Kick Host When Joining As Next In Queue>Kick Host When Joining As Next In Queue",
"Online>Spoofing>Hide From Player List",
"Online>Off The Radar",
"World>Inhabitants>Clear Area>No Delay",
"Game>Disables>Straight To Voicemail",
"Game>Disables>Disable Recordings",
"Game>Rendering>Potato Mode",
"Game>Early Inject Enhancements>Set Game To High Priority",
"Stand>Settings>Warnings>Automatically Proceed On Warnings>Command Box",
"Stand>Settings>Warnings>Automatically Proceed On Warnings>Hotkey",
"Stand>Lua Scripts>Whitis",
"Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Enable AHK Controll",
"Stand>Lua Scripts>Whitis>World>Remove Object Collision",
"Online>Protections>Disable Turning Into Beast",
"Stand>Lua Scripts>Whitis>Protections>Block Clone Spawns",
"Stand>Lua Scripts>Whitis>Protections>Jinx | Block Mugger",
"Stand>Lua Scripts>Whitis>Detections>Modder Detections>Jinx | Orbital Cannon",
"Stand>Lua Scripts>Whitis>Protections>Admin Bail",
"Stand>Lua Scripts>Whitis>Detections>Modder Detections>Jinx | Teleport",
"Stand>Lua Scripts>Whitis>Detections>Modder Detections>Jinx | Modified Vehicle Speed",
"Stand>Lua Scripts>Whitis>Detections>Modder Detections>Jinx | Modded Script Host Migration",
"Stand>Lua Scripts>Whitis>Protections>Jinx | Non-Hostile Peds",
"Stand>Lua Scripts>Whitis>Online Stuff>Auto Accept>Jinx | Join Messages",
"Stand>Lua Scripts>Whitis>Online Stuff>Auto Accept>Jinx | Transaction Errors",
"Stand>Lua Scripts>Whitis>Protections>Jinx | Ghost Orbital Cannon",
}

local Necessary_AHK_Settings_Enabled = {
"Online>Protections>Events>Kick Event>Write To Log File",
"Online>Reactions>Player Join Reactions>Write To Log File",
"Online>Reactions>RID Join Reactions>Write To Log File",
"Online>Reactions>Host Change Reactions>Write To Log File",
}

local Bot_AHK_Settings_Enabled = {
"Online>Protections>Detections>Modded Explosion>Block",
"Online>Protections>Events>Apartment Invite>Block",
"Online>Protections>Events>Trigger Business Raid>Block",
"Online>Protections>Events>Teleport To Interior>Block",
"Online>Protections>Events>Give Collectible>Block",
"Online>Protections>Events>Cayo Perico Invite>Block",
"Online>Protections>Events>Kick From Vehicle>Block",
"Online>Protections>Events>Kick From Interior>Write To Log File",
"Online>Chat>Bypass Profanity Filter",
"Online>Chat>Bypass Character Filter",
"Online>Reactions>Love Letter Kick Reactions>Block",
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------
-- Script Functions --
----------------------

-----------------
-- Jinx Script --
-----------------


local function createRandomPed(pos) -- For Pedjack
	local mdlHash = randomPeds[math.random(#randomPeds)]
	util.request_model(mdlHash)
	return entities.create_ped(26, mdlHash, pos, 0)
end

local function getSeatPedIsIn(ped) -- For Pedjack
	local vehicle = (PED.GET_VEHICLE_PED_IS_USING(ped))
	if vehicle == 0 then
		return nil
	end
	local num_of_seats = (VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(ENTITY.GET_ENTITY_MODEL(vehicle)))
	for i = -1, num_of_seats - 1 do
		local ped_in_seat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, i)
		if ped_in_seat == ped then
			return i
		end
	end
end


------------
-- Whitis --
------------

local function BotCommandWriter(command)
	util.log("[BotCommand] " .. command)
	util.log("[AHKLogRepeatFix]")
	util.toast("BotCommandSent")
end

util.on_pre_stop(function ()
	scriptshuttingdown = true
end)

local function PedJack(pid, Log) -- PedJack By Prishum/JinxScript I only Changed it a bit
	if pid == players.user() then 
		util.toast("you cant Hijack Yourself")
		return
	end

	local timer = util.current_time_millis() + 2500
	local ped = (PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local pos = (ENTITY.GET_ENTITY_COORDS(ped))
	local vehicle = (PED.GET_VEHICLE_PED_IS_IN(ped))
	local veh_model = players.get_vehicle_model(pid)
	local veh_name = util.get_label_text(VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(veh_model))
	local driver = (NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)))
	local passenger = (NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -2)))
	local drivingStyle = DF_SwerveAroundAllCars | DF_AvoidRestrictedAreas | DF_GoOffRoadWhenAvoiding | DF_SteerAroundObjects | DF_UseShortCutLinks | DF_ChangeLanesAroundObstructions

	if vehicle == 0 then
		util.toast(PLAYER.GET_PLAYER_NAME(pid) .. " isn't in a Vehicle :/")
		return 
	end
	pos.z -= 50
	if not PED.IS_PED_A_PLAYER(VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)) then
		return 
	end
	local randomPed = createRandomPed(pos)
	ENTITY.SET_ENTITY_INVINCIBLE(randomPed, true)
	PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(randomPed, true)
	TASK.TASK_ENTER_VEHICLE(randomPed, vehicle, 1000, -1, 1.0, ECF_WARP_ENTRY_POINT | ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP | ECF_JACK_ANYONE | ECF_WARP_PED | ECF_WARP_IF_DOOR_IS_BLOCKED, 0, false)
	repeat
		if TASK.GET_IS_TASK_ACTIVE(ped, 2) then
			timer = util.current_time_millis() + 2500
		end
		if util.current_time_millis() > timer and PED.IS_PED_IN_ANY_VEHICLE(ped) and PedJackFallback and Log then
			if DECORATOR.DECOR_GET_INT(vehicle, "Player_Vehicle") != 0 then
				util.toast("Failed to Hijack their Vehicle... Using KillVehicle Instead")
				menu.trigger_commands("killveh" .. PLAYER.GET_PLAYER_NAME(pid) .. "")
			else 
				entities.delete(randomPed)
			end
			timer = util.current_time_millis() + 2500
			return 
		end
		util.yield()
	until not PED.IS_PED_IN_ANY_VEHICLE(ped)
	VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, pid, true)
	entities.give_control(randomPed, pid)
	if PED.IS_PED_IN_ANY_VEHICLE(ped) then
		repeat
			if TASK.GET_IS_TASK_ACTIVE(ped, 2) then
				timer = util.current_time_millis() + 2500
			end
			if util.current_time_millis() > timer and PED.IS_PED_IN_ANY_VEHICLE(ped) then
				entities.delete(randomPed)
				timer = util.current_time_millis() + 2500
				break 
			end
			util.yield()
		until not PED.IS_PED_IN_ANY_VEHICLE(ped)
	end
	if getSeatPedIsIn(randomPed) == -1 then
		TASK.TASK_VEHICLE_DRIVE_WANDER(randomPed, vehicle, 9999.0, drivingStyle) 
		util.toast("Hijacked " .. PLAYER.GET_PLAYER_NAME(pid) .. "'s Vehicle. (" .. veh_name .. ")")
		if Log then
			util.log(PLAYER.GET_PLAYER_NAME(pid) .. " triggered a detection: BlackListedVehUser")
		end
		if not VEHICLE.GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, pid) then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(vehicle, pid, true)
		end
	end
	util.yield(1000)
	local RepeatIndex = 0
	repeat
		RepeatIndex = RepeatIndex +1
		if not TASK.GET_IS_TASK_ACTIVE(randomPed, 38) or TASK.GET_IS_TASK_ACTIVE(randomPed, 199) then
			local infiniteloopblock = 0
			repeat
				if infiniteloopblock == 50 then
					entities.delete(randomPed)
					return
				end
				TASK.TASK_VEHICLE_DRIVE_WANDER(randomPed, vehicle, 9999.0, drivingStyle) -- giving task again cus doesnt work sometimes
				util.yield()
				infiniteloopblock = infiniteloopblock + 1
			until TASK.GET_IS_TASK_ACTIVE(randomPed, 38) or TASK.GET_IS_TASK_ACTIVE(randomPed, 199)
		end
		util.yield(200)
	until RepeatIndex == 5
	util.yield(5000)
	if randomPed != nil and not PED.IS_PED_IN_ANY_VEHICLE(randomPed, false) then -- 2nd check cus sometimes doesnt delete the first time
		entities.delete(randomPed)
	end
end

local function IsTokenSpooferInLobby(Sessions) --Check if someone inside the Lobby is Spoofing Host token to get Host (Their Token must begin with "00") to be detected
	for menu.get_children(Sessions) as PlayerList do
		util.yield()
		if menu.is_ref_valid(PlayerList) then --Check if CMDRef is still Valid Bec some RID's might be Changed into the Actual name of the Player
			local PlayerInfo = menu.get_help_text(PlayerList)
			if PlayerInfo != "" and string.sub(string.sub(PlayerInfo, (string.find(PlayerInfo,"\n",7)+13)), 0, 2) == "00" then	-- Detect if the Current Player we're Looping through is a HostToken Spoofer
				util.toast("TokenSpoofer :O")
				return true
			end
		end
	end
	return false
end

local function IsPlayerListLoaded(Sessions) --Wait for PlayerList to Load
	local PlayerListTimeout = 0
	local PlayerListLoaded = false
	repeat
		PlayerListTimeout = PlayerListTimeout +1
		if PlayerListTimeout == 30 then
			util.toast("Can't join this Lobby")
		end
		for menu.get_children(Sessions) as PlayerList do
			if menu.is_ref_valid(PlayerList) and string.match(lang.get_string(menu.get_menu_name(PlayerList)), "/32") then
				util.yield(600)
				return true
			end
		util.yield()
		end
	util.yield()
	until PlayerListLoaded
end

local function CheckSessionPlayerList(Sessions) --Check the PlayerList
	local ValidCMDRefTimeOut = 0
	repeat
		ValidCMDRefTimeOut = ValidCMDRefTimeOut +1
		if menu.is_ref_valid(Sessions) then --Bec the "Session" CommandRef get's invalid for a short period of time (maybe 1ms) we have to ask if the CommandRef is Valid. Otherwise we would get an Error
			if IsPlayerListLoaded(Sessions) and not IsTokenSpooferInLobby(Sessions) then --Lobby is Detected as Clean
				util.toast("This Lobby is HostToken-Spoofing Free :)") --Script is done bec it found a good Session (Can be automated to join the Session)
				return true
			end
			return false
		end		
	until ValidCMDRefTimeOut == 100 --Asking for this Just in Case the CommandRef get's Invalid (Some weird Stuff must be going on if this get's triggered lol)
	return false
end

local function CheckSession(Sessions) --Check if the Session we're Looping through is Good
	util.yield()
	menu.trigger_command(Sessions) --Open Session SubList
	local SesTimeoutIndex = 0
	local SessionSubMenuLoaded = false
	repeat
		SesTimeoutIndex = SesTimeoutIndex +1
		if SesTimeoutIndex == 100 then
			util.toast("Took too long to Load Session Submenu") --Unlikely to happen but possible when code Shits itself
			return false
		end		
		for menu.get_children(Sessions) as SessionSubList do --Read Through The SubList a Session has
			if lang.get_string(menu.get_menu_name(SessionSubList)) == "Request Member List" then
				menu.trigger_command(SessionSubList) --Trigger the "Request Member List" Command to Load the PlayerList in the Lobby
				util.yield()
				if CheckSessionPlayerList(Sessions) then
					return true
				end
				return false
			end						
			util.yield()
		end
		util.yield()
	until SessionSubMenuLoaded	
end

local function CrashInit(pid) -- Some Crashes Don't Work without being close (Physics/Render Distance Issue) this will Fix the Issue (Call CrashWrapUp() after)
	for players.list_except(true) as allplayers do
		menu.trigger_commands("desync " .. players.get_name(allplayers) .. " on")
    end
	menu.trigger_commands("desync " .. players.get_name(pid) .. " off")
	menu.trigger_commands("invisibility remote")
	menu.trigger_commands("godmode on")
	menu.trigger_commands("vehgodmode on")
	lastcrashposition = (ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())))
	local crashtargetposition = (ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
	players.teleport_3d(players.user(), crashtargetposition.x, crashtargetposition.y, crashtargetposition.z)
	util.yield()
end

local function CrashWrapUp() -- Return to Normal afer Crash is Done :)
	util.yield(1000)
	players.teleport_3d(players.user(), lastcrashposition.x, lastcrashposition.y, lastcrashposition.z)
	menu.trigger_commands("invisibility off")
	menu.trigger_commands("godmode off")
	menu.trigger_commands("vehgodmode off")
	for players.list_except(true) as allplayers do
		menu.trigger_commands("desync " .. players.get_name(allplayers) .. " off")
    end
end

local function dogcrash(pid) -- Yep A dog with a Homing Launcher being killed will cause Crash Events ^^. Added a Fragment Crash bec it was just 2 Lines of Codes to add :D
	local spawnedentities = {}
	local mdl = util.joaat('a_c_poodle')
	local hash = util.joaat("buzzard")
	util.request_model(hash, 5000)
	util.request_model(mdl, 5000)
	
	local i = 0
	repeat
		i = i + 1
		local ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
		local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
		WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)

	
		local obj
		repeat
			obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
		until( obj ~= 0 )
	
		local playerped = (PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local heading = (ENTITY.GET_ENTITY_HEADING(playerped))
		local offset1 = (ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerped, 0.0, 3.0, 1.0))
		local veh1 = entities.create_vehicle(hash, offset1, heading, true)
		local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), offset1)
		PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped1, true)
		TASK.TASK_ENTER_VEHICLE(ped1, veh1, 1000, -3, 1.0, ECF_WARP_ENTRY_POINT | ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP | ECF_JACK_ANYONE | ECF_WARP_PED | ECF_WARP_IF_DOOR_IS_BLOCKED, 0, false)

		table.insert(spawnedentities, veh1)
		table.insert(spawnedentities, object)
		table.insert(spawnedentities, ped1)
		if i == 3 then
			util.yield(300)
			MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(coords.x, coords.y + 0.1, coords.z + 10.0, coords.x, coords.y, coords.z, 100, true, 	1672152130, ped1, false, FastNet, -1, veh, true)
			util.yield(300)
			for spawnedentities as spawnedentity do
				entities.delete_by_handle(spawnedentity)
			end
		end	
	until( i == 3 )
end

local function HandleBlackListedVehList(VehicleHandle, on_toggle, DestroyOnly) -- Handle's the VehBlacklist (Which to Destroy and Which to PedJack)
	if not DestroyOnly then
		if on_toggle then
			for BlackListedVehicles as CheckList do
				if CheckList == VehicleHandle then return end
				util.yield()
			end
			table.insert(BlackListedVehicles, VehicleHandle)
			return
		end
		if not on_toggle then
			for i, CheckList in ipairs(BlackListedVehicles) do
				if CheckList == VehicleHandle then
					table.remove(BlackListedVehicles, i)
					return
				end
			end
		end
	end
	if on_toggle then
		for BlackListedVehiclesDestroyOnly as CheckList do
			if CheckList == VehicleHandle then return end
			util.yield()
		end
		table.insert(BlackListedVehiclesDestroyOnly, VehicleHandle)
		return
	end
	if not on_toggle then
		for i, CheckList in ipairs(BlackListedVehiclesDestroyOnly) do
			if CheckList == VehicleHandle then
				table.remove(BlackListedVehiclesDestroyOnly, i)
				return
			end
		end
	end	
end

local function LuaRemote_OnOFF(toggled, CmdRef) -- Remotes the CMDRef On or Off -> Depending on the toggled state (True/False)
	if toggled then
		menu.set_state(menu.ref_by_path(CmdRef), "On")
		return
	end
	menu.set_state(menu.ref_by_path(CmdRef), "Off")
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------
-- On Start Execution --
------------------------

------------------------
-- Remove Old Bridges --
------------------------
os.remove(wselbridge) -- to Prevent triggering old Commands

-------------------------------
-- Create Header and Divider --
-------------------------------

-- Script Header --
menu.divider(menu.my_root(), "Whitis Lua :3")

-- AHK Controller --
ScriptControll_Menu = menu.list(menu.my_root(), "Script Controller", {}, "", function() end)
ScriptSettings_Menu = menu.list(ScriptControll_Menu, "Script Settings", {""}, "You can change the AHK Script Behaviour")

-- Online Submenu --
Online_Menu = menu.list(menu.my_root(), "Online Stuff", {}, "", function() end)
menu.divider(Online_Menu, "Online")
BlacklistVehicle_Menu = menu.list(Online_Menu, "Player Vehicle Blacklist", {""}, "A List of Vehicles you can Block Players from using")
BlacklistProjectile_Menu = menu.list(Online_Menu, "Projectile Blacklist", {""}, "A List of Projectile's you can Destroy (Modder Can't Detect this)")
AutoAccept_Menu = menu.list(Online_Menu, "Auto Accept", {""}, "")

-- World Submenu --
World_Menu = menu.list(menu.my_root(), "World", {}, "", function() end)
menu.divider(World_Menu, "World")

-- Enhancements Submenu --
Enhancements_Menu = menu.list(menu.my_root(), "Enhancements", {}, "", function() end)
menu.divider(Enhancements_Menu, "Enhancements")

-- Protections Submenu --
Protex = menu.list(menu.my_root(), "Protections", {}, "", function() end)
menu.divider(Protex, "Protections")

-- Detections -- 
Detections = menu.list(menu.my_root(), "Detections", {}, "", function() end)
menu.divider(Detections, "Detections")
Normal_Detection_Menu = menu.list(Detections, "Normal Detections", {""}, "A List of Detections to detect Random Stuff")
Modder_Detection_Menu = menu.list(Detections, "Modder Detections", {""}, "A List of Detections to detect Modded Stuff")

-- Random Stuff --
RandomStuff = menu.list(menu.my_root(), "Random Stuff", {}, "", function() end)
menu.divider(RandomStuff, "Random Stuff")

-- Shadow Roots --
local function AHKControllShadowRoot()
	BotTpRef = menu.action(menu.shadow_root(), "Bot Tp to me", {"BotTP"}, "Teleports the Bot to you", function()
		BotCommandWriter("TpToGuardedTarget")
	end)

	GetBotRef = menu.action(menu.shadow_root(), "Get Bot", {"GetBot"}, "Sends the Bot the Command to Join you", function()
		BotCommandWriter("JoinGuardedPlayer " .. players.get_name(players.user()))
	end)

	RestartBotRef = menu.action(menu.shadow_root(), "Restart Bot", {"RestartBot"}, "Restarts the Bot's Game and Call it into your Session again", function()
		BotCommandWriter("CCBotShutdown")
		util.yield(1000)
		BotCommandWriter("RemoteActivateGuardBots")
		util.yield(1000)
		BotCommandWriter("JoinGuardedPlayer " .. players.get_name(players.user()))
	end)

	StartBotRef = menu.action(menu.shadow_root(), "Start Bot", {"StartBot"}, "Starts the Bot if it Runs in Standby on Desktop", function()
		BotCommandWriter("RemoteActivateGuardBots")
	end)

	StopBotRef = menu.action(menu.shadow_root(), "Stop Bot", {"StopBot"}, "Shut down the Bot's Game and return the Bot into Standby", function()
		BotCommandWriter("CCBotShutdown")
	end)

	AddBanRef = menu.text_input(menu.shadow_root(), "Add to BanList [RID]", {"addtobanlist"}, "Input a RID to add the Player to the Banlist", function(InputString) --Automatic Command Bridge (Read Info From AHK Script)
		if InputString != "" then
			BotCommandWriter("BanListAdd " .. InputString .. "")
			menu.apply_default_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Add to BanList [RID]")) --Doing this bec i don't want the Last RID inside the Commandbox just to remove it by hand ^^ 
		end
	end)
end




--[[ Yeah idk why but it bugged my Session Browser when attaching it after "More Filters" in Session Browser ... maybe fix this so i can add an Action into the session Browser ^^
local FindNewSessionRef = menu.action(menu.shadow_root(), "Whitis | Find Session to Host", {"CCLobby"}, "Find a New Session Without someome Spoofing their Host Token \nNote: Close Menu to Stop searching :)", function()
	
----Getting RegionFilter to make string.match possible (Doing this so we can Filter the Sessions out, so we're not detecting anything else but the sessions... for example = Going through the get_children list, will list even the Settings, so we Filter them out)
	local RegionSearch = menu.get_state(menu.ref_by_path("Online>Session Browser>Region")) .. "; "

----Check if RegionFilter is Valid
	if string.match(RegionSearch, "Don't") then
		util.toast("Pick a Region Filter First")
		return
	end

----Refresh Session List
	menu.focus(menu.ref_by_path("Online>Session Browser>Refresh")) -- Using Focus bec the Session Browser Doesn't Update without being in the List
	menu.trigger_command(menu.ref_by_path("Online>Session Browser>Refresh"))
	
----Wait until Session List is Cleared (Doing this so the List we're getting through isn't Outdated)
	local SessionsLoaded = true
	local WaitingIndex = 0
	util.toast("Reloading your Browser List, this could take a few sec...")
	repeat
		WaitingIndex = WaitingIndex +1
		SessionsLoaded = false
		for menu.get_children(menu.ref_by_path("Online>Session Browser")) as Sessions do
			if menu.is_ref_valid(Sessions) then
				if string.match(menu.get_menu_name(Sessions), RegionSearch) then --Every Session Label will have "Region; " in it so were just searching those Labels. For Example = "Europe; 27 Players"
					SessionsLoaded = true										 --																	   This is the Region Filter ---> ^^^^^^ <---
					break
				end
			end
			util.yield()
		end
		util.yield()
	until not SessionsLoaded or WaitingIndex == 100
	if SessionsLoaded then
		util.toast("Waited too long for List to Clear")
		return
	end
		
----Wait for new Sessions to appear in the list 
	SessionsLoaded = false
	WaitingIndex = 0
	repeat
		WaitingIndex = WaitingIndex +1
		for menu.get_children(menu.ref_by_path("Online>Session Browser")) as Sessions do
			if string.match(menu.get_menu_name(Sessions), RegionSearch) then --Every Session Label will have "Region; " in it so were just searching those Labels. For Example = "Europe; 27 Players"
				SessionsLoaded = true										 --																	   This is the Region Filter ---> ^^^^^^ <---
				break
			end
			util.yield()
		end
		util.yield()
	until SessionsLoaded or WaitingIndex == 1000
	if not SessionsLoaded then
		util.toast("Session Load Timeout")
		return
	end
	util.toast("Sessions Loaded, checking for a good Lobby :)")

----Searching for a Session Without a Spoofed Host Token
	local SessionFound = false
	local SessionIndex = 0
	repeat
		for i, Sessions in ipairs(menu.get_children(menu.ref_by_path("Online>Session Browser"))) do
			if not menu.is_open() then
				local LoopingSessions = false
				util.toast("User Stopped Searching :O")
				return
			end
			if (SessionIndex < i) then
				--util.toast("S=" .. SessionIndex .. " i=" .. i .. "") -- Debug
				SessionIndex = SessionIndex +1
				if string.match(menu.get_menu_name(Sessions), RegionSearch) and menu.is_ref_valid(Sessions) then --Every Session Label will have "Region; " in it so we're just searching those Labels. For Example = "Europe; 27 Players"
					if CheckSession(Sessions) then
						return
					end
					
				end
			end
			util.yield()
		end
		menu.focus(menu.ref_by_path("Online>Session Browser>Refresh")) --Using Focus Again to Load More Sessions to Scan
		util.toast("Waiting for more Sessions to Load...")
		util.yield(100)
	until SessionFound
end)
menu.attach_after(menu.ref_by_path("Online>Session Browser>More Filters"), FindNewSessionRef)
--]]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------
-- AHK Settings --
------------------

local ScriptMode = "Friend" --Pre Define Script RunMode
local ScriptModes = {
"Friend",
"CoLoadAHK",
"Bot"
}

menu.list_select(ScriptSettings_Menu, "Script RunMode", {}, "Note: >CoLoadAHK< and >Bot< Mode will Change some Menu Settings\n\nFriend -> You have BotControll when bot is in the same Session :O\n\nCoLoadAHK -> Enable Features my AHK Script has (Useless without my AHK Script ^^)\n\nBot -> My AHK Script will run in BotMode (Useless without my AHK Script ^^)", ScriptModes, 1, function(val)
ScriptMode = ScriptModes[val]

if ScriptModes[val] == "Friend" then
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Enable AHK Controll"), "Off")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Be a Bot"), "Off")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Apply Client Settings"), "Off")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Apply Bot Settings"), "Off")
	
	if menu.is_ref_valid(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Add to BanList [RID]")) then
		menu.delete(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Bot Tp to me"))
		menu.delete(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Get Bot"))
		menu.delete(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Restart Bot"))
		menu.delete(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Start Bot"))
		menu.delete(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Stop Bot"))
		menu.delete(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Add to BanList [RID]"))
	end
end

if ScriptModes[val] == "CoLoadAHK" then
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Enable AHK Controll"), "On")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Be a Bot"), "Off")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Apply Client Settings"), "On")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Apply Bot Settings"), "Off")
	
	AHKControllShadowRoot()
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), BotTpRef)
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), GetBotRef)
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), RestartBotRef)
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), StartBotRef)
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), StopBotRef)
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), AddBanRef)
end

if ScriptModes[val] == "Bot" then
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Enable AHK Controll"), "On")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Be a Bot"), "On")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Apply Client Settings"), "Off")
	menu.set_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller>Script Settings>Apply Bot Settings"), "On")
	
	AHKControllShadowRoot()
	menu.attach(menu.ref_by_path("Stand>Lua Scripts>Whitis>Script Controller"), AddBanRef)
end

end)
menu.divider(ScriptSettings_Menu, "Don't Touch settings below ^^")

menu.toggle_loop(ScriptSettings_Menu, "Enable AHK Controll", {""}, "Let my AHK Script Run Commands in Stand", function() --Automatic Command Bridge (Read Info From AHK Script)
	if not filesystem.exists(wselbridge) then --Check if WSELBridge File even exists
		util.yield(300)
		return
	end
	util.yield(100)	-- This Yield has to be here in case a Big Operation is cooking in the AHK Script, bec if we open the file while its still being modified can cause bad Script Timings with the AHK Controller
	local wsecommands = io.open(wselbridge, "r") -- Open File WSELBridge.txt
	if not string.find(wsecommands:read "*a", "EndOfTable") then -- Check for "EndOfTable" to check if the file build isn't corrupt (can happen when the FileAppend function (from AHK Controller) wasn't used right)
		if players.get_name(players.user()) == "WhitisGTAGuard2" then --														^^^^(EndOfTable is being used to make sure the AHK Controller was done with the File)
			menu.trigger_commands("say System Warn: Caught an Exception: Bad Controll Script Timings in WSEBridge (Ignore Command)") -- Write Exeption in chat when you're the bot (Hardcoded rn for WhitisGTAGuard2)
		end
		util.toast("Caught an Exception: Bad Controll Script Timings in WSEBridge (Ignore Command)") -- Toast Modmenu Info about the Exeption
		io.close(wsecommands)
		os.remove(wsecommands) -- Removes the File since it's useless and using it can cause problems
		return
	end
	io.close(wsecommands)							 --\ Close and Reopen file bec Lua hates me (Bruh)
	local wsecommands = io.open(wselbridge, "r") 	 --/ Can't Read an entire File and then read it line by line after 
	for lines in wsecommands:lines("l") do
		if string.find(lines, "EndOfTable") then -- Check if index line is end of File
			io.close(wsecommands)
			os.remove(wsecommands) -- If end of File was reached = Delete File and Return
			util.yield(300)
			return
		end
		if string.find(lines, "LUACMD") then
			menu.trigger_commands(string.sub(lines, 7))
		end
	end
	util.yield(300)
end)


menu.toggle(ScriptSettings_Menu, "Be a Bot", {""}, "Tells my AHK Script that you are a Bot. You'll need to restart my AHK Script for this to take Action", function(on_toggle)

	if scriptshuttingdown then -- Asking if Script is Shutting Down, otherwise it would change the Settings File to "Client" even if it's not used as "Client"
		return
	end
	
	repeat
		util.yield(100)
	until not (players.get_name(players.user()) == "InvalidPlayer")
	
	if on_toggle then
		local changerunmode = io.open(ahkrunsetting, "w") 
		changerunmode:write("RunMode Bot\nUsername " .. players.get_name(players.user()) .. "")
		io.close(changerunmode)
		isscriptbot = true
	end

	if not on_toggle then
		local changerunmode = io.open(ahkrunsetting, "w")
		changerunmode:write("RunMode Client\nUsername " .. players.get_name(players.user()) .. "")
		io.close(changerunmode)
		isscriptbot = false
	end
end)

if not isscriptbot then
	local changerunmode = io.open(ahkrunsetting, "w") -- Override/Generate File in case there wasn't a Mode Picked
	changerunmode:write("RunMode Client\nUsername " .. players.get_name(players.user()) .. "")
	io.close(changerunmode)
end

menu.toggle(ScriptSettings_Menu, "Apply Client Settings", {""}, "This will Change some Settings of your Profile to make it Work with my AHK Script", function(on_toggle)
	if on_toggle then
		for Necessary_AHK_Settings_On as setting do
			menu.set_state(menu.ref_by_path(setting), "On") -- Set State to "On" The Fucking "O" has the be in Caps (Im mad)
		end
	
		for Necessary_AHK_Settings_Enabled as setting do
			menu.set_state(menu.ref_by_path(setting), "Enabled") -- Set State to "Enabled" The Fucking "E" has the be in Caps (Im mad)
		end
		menu.set_state(menu.ref_by_path("Online>Protections>Detections>Classifications>Modder>Write To Log File"), "Strangers")
		menu.set_state(menu.ref_by_path("Online>Reactions>Script Host Change Reactions>Write To Log File"), "Strangers")
		menu.set_state(menu.ref_by_path("Online>Transitions>Join Group Override"), "Spectator")
	end
end)

menu.toggle(ScriptSettings_Menu, "Apply Bot Settings", {""}, "This will Change some Settings of your Profile to make the Bot work at all", function(on_toggle)
	if on_toggle then
		for Bot_AHK_Settings_On as setting do
			menu.set_state(menu.ref_by_path(setting), "On") -- Set State to "On" The Fucking "O" has the be in Caps (Im mad)
		end
	
		for Bot_AHK_Settings_Enabled as setting do
			menu.set_state(menu.ref_by_path(setting), "Enabled") -- Set State to "Enabled" The Fucking "E" has the be in Caps (Im mad)
		end
		
		menu.set_state(menu.ref_by_path("Online>Protections>Detections>Classifications>Modder>Write To Log File"), "Strangers")
		menu.set_state(menu.ref_by_path("Online>Protections>Events>Vehicle Takeover>Block"), "Strangers")
		menu.set_state(menu.ref_by_path("Online>Protections>Host-Controlled Kicks>Love Letter Lube"), "Aggressive")
		menu.set_state(menu.ref_by_path("Online>Transitions>Join Group Override"), "Spectator")
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------
-- Online Menu --
-----------------

menu.divider(BlacklistVehicle_Menu, "Settings")

menu.toggle_loop(BlacklistVehicle_Menu, "Enable VehicleBlackList", {""}, "Enable The VehicleBlackList", function()
	local PlayersList = players.list(false, false, true) --puts all players inside the array, Including (Self = false, Friends = false, Strangers = true)
	for i, pid in ipairs(PlayersList) do
		local playerped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local playervehicle = PED.GET_VEHICLE_PED_IS_IN(playerped, false)
		if playervehicle then
			for BlackListedVehicles as BlackListedVehicle do			
				if VEHICLE.IS_VEHICLE_MODEL(playervehicle, util.joaat(BlackListedVehicle)) then
					PedJack(pid, true)
					PED.RESET_PED_LAST_VEHICLE(playerped)
					break
				end
				util.yield()
			end
			for BlackListedVehiclesDestroyOnly as BlackListedVehicle do			
				if VEHICLE.IS_VEHICLE_MODEL(playervehicle, util.joaat(BlackListedVehicle)) then
					menu.trigger_commands("killveh" .. PLAYER.GET_PLAYER_NAME(pid))
					PED.RESET_PED_LAST_VEHICLE(playerped)
					break
				end
				util.yield()
			end
		end
		util.yield()
	end
	util.yield(500)
end)

menu.toggle(BlacklistVehicle_Menu, "Use KillVeh on PedJackFail", {""}, "It uses the Killveh Command when Pedjack isn't Possible due to Vehicle Settings", function(on_toggle)
	if on_toggle then
		PedJackFallback = true
		return
	end
	PedJackFallback = false
end)

menu.divider(BlacklistVehicle_Menu, "List")

menu.toggle(BlacklistVehicle_Menu, "Block     | Oppressor MK1", {""}, "", function(on_toggle)
	local VehicleHandle = "oppressor"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Block     | Oppressor MK2", {""}, "", function(on_toggle)
	local VehicleHandle = "oppressor2"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Block     | Khanjali", {""}, "", function(on_toggle)
	local VehicleHandle = "khanjali"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Block     | Deluxo", {""}, "", function(on_toggle)
	local VehicleHandle = "deluxo"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Block     | Toreador", {""}, "", function(on_toggle)
	local VehicleHandle = "toreador"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Block     | Stromberg", {""}, "", function(on_toggle)
	local VehicleHandle = "stromberg"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Block     | ScramJet", {""}, "", function(on_toggle)
	local VehicleHandle = "scramJet"
	HandleBlackListedVehList(VehicleHandle, on_toggle, false)
end)

menu.toggle(BlacklistVehicle_Menu, "Destroy | RC Minitank", {""}, "", function(on_toggle)
	local VehicleHandle = "minitank"
	HandleBlackListedVehList(VehicleHandle, on_toggle, true)
end)

menu.toggle(BlacklistVehicle_Menu, "Destroy | RC Bandito", {""}, "", function(on_toggle)
	local VehicleHandle = "rcbandito"
	HandleBlackListedVehList(VehicleHandle, on_toggle, true)
end)



menu.toggle(AutoAccept_Menu, "Jinx | Join Messages", {}, "Auto Accept Join Screens", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Online>Auto Accept>Join Messages")
end)

menu.toggle(AutoAccept_Menu, "Jinx | Transaction Errors", {}, "Auto Accept Occurring Error Screens", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Online>Auto Accept>Transaction Errors")
end)

menu.toggle(Online_Menu, "Become non Existent for others", {"ccghost"}, "You're Invisible in every way Possible for everyone, only Modder can detect you", function(ghoststate)

	if ghoststate then
		menu.trigger_commands("otr on")
		menu.trigger_commands("invisibility remote")
		menu.trigger_commands("vehinvisibility remote")
		menu.trigger_commands("godmode on")
		menu.trigger_commands("vehgodmode on")
		menu.trigger_commands("grace on")
		menu.trigger_commands("mint on")
		menu.trigger_commands("noblame on")
		menu.trigger_commands("hidefromplayerlist on")
		menu.trigger_commands("ghostvehicles on")
	end
	
	if not ghoststate then
		menu.trigger_commands("otr off")
		menu.trigger_commands("invisibility off")
		menu.trigger_commands("vehinvisibility off")
		menu.trigger_commands("godmode off")
		menu.trigger_commands("vehgodmode off")
		menu.trigger_commands("grace off")
		menu.trigger_commands("mint off")
		menu.trigger_commands("noblame off")
		menu.trigger_commands("hidefromplayerlist off")
		menu.trigger_commands("ghostvehicles off")
	end
	
end)


menu.action(Online_Menu, "FindNewSession", {"CCLobby"}, "Find a New Session \nNote: Close Menu to Stop searching :)", function()
	
----Getting RegionFilter to make string.match possible (Doing this so we can Filter the Sessions out, so we're not detecting anything else but the sessions... for example = Going through the get_children list, will list even the Settings, so we Filter them out)
	local RegionSearch = menu.get_state(menu.ref_by_path("Online>Session Browser>Region")) .. "; "

----Check if RegionFilter is Valid
	if string.match(RegionSearch, "Don't") then
		util.toast("Pick a Region Filter First")
		return
	end

----Refresh Session List
	menu.focus(menu.ref_by_path("Online>Session Browser>Refresh")) -- Using Focus bec the Session Browser Doesn't Update without being in the List
	menu.trigger_command(menu.ref_by_path("Online>Session Browser>Refresh"))
	
----Wait until Session List is Cleared (Doing this so the List we're getting through isn't Outdated)
	local SessionsLoaded = true
	local WaitingIndex = 0
	util.toast("Reloading your Browser List, this could take a few sec...")
	repeat
		WaitingIndex = WaitingIndex +1
		SessionsLoaded = false
		for menu.get_children(menu.ref_by_path("Online>Session Browser")) as Sessions do
			if menu.is_ref_valid(Sessions) then
				if string.match(menu.get_menu_name(Sessions), RegionSearch) then --Every Session Label will have "Region; " in it so were just searching those Labels. For Example = "Europe; 27 Players"
					SessionsLoaded = true										 --																	   This is the Region Filter ---> ^^^^^^ <---
					break
				end
			end
			util.yield()
		end
		util.yield()
	until not SessionsLoaded or WaitingIndex == 100
	if SessionsLoaded then
		util.toast("Waited too long for List to Clear")
		return
	end
		
----Wait for new Sessions to appear in the list 
	SessionsLoaded = false
	WaitingIndex = 0
	repeat
		WaitingIndex = WaitingIndex +1
		for menu.get_children(menu.ref_by_path("Online>Session Browser")) as Sessions do
			if string.match(menu.get_menu_name(Sessions), RegionSearch) then --Every Session Label will have "Region; " in it so were just searching those Labels. For Example = "Europe; 27 Players"
				SessionsLoaded = true										 --																	   This is the Region Filter ---> ^^^^^^ <---
				break
			end
			util.yield()
		end
		util.yield()
	until SessionsLoaded or WaitingIndex == 1000
	if not SessionsLoaded then
		util.toast("Session Load Timeout")
		return
	end
	util.toast("Sessions Loaded, checking for a good Lobby :)")

----Searching for a Session Without a Spoofed Host Token
	local SessionFound = false
	local SessionIndex = 0
	repeat
		for i, Sessions in ipairs(menu.get_children(menu.ref_by_path("Online>Session Browser"))) do
			if not menu.is_open() then
				local LoopingSessions = false
				util.toast("User Stopped Searching :O")
				return
			end
			if (SessionIndex < i) then
				--util.toast("S=" .. SessionIndex .. " i=" .. i .. "") -- Debug
				SessionIndex = SessionIndex +1
				if string.match(menu.get_menu_name(Sessions), RegionSearch) and menu.is_ref_valid(Sessions) then --Every Session Label will have "Region; " in it so we're just searching those Labels. For Example = "Europe; 27 Players"
					if CheckSession(Sessions) then
						return
					end
					
				end
			end
			util.yield()
		end
		menu.focus(menu.ref_by_path("Online>Session Browser>Refresh")) --Using Focus Again to Load More Sessions to Scan
		util.toast("Waiting for more Sessions to Load...")
		util.yield(100)
	until SessionFound
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----------------
-- World Menu --
----------------

local ProjectileArray = {741814745, -1420407917, -1169823560, -1813897027} -- Array for Projectile Remover
menu.toggle_loop(BlacklistProjectile_Menu, "Explode Mines/Bombs", {""}, "Instantly Destroy Mines/Bombs by Exploding them", function()
	for i, projectile in ipairs(ProjectileArray) do -- Loop through ProjectileArray
		WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(projectile, true) -- Explodes the Projectile Hash (From ProjectileArray)
		util.yield()
	end
	util.yield()
end)

local LauncherProjectileArray = {1672152130, -1312131151,} -- Array for Launcher Remover
menu.toggle_loop(BlacklistProjectile_Menu, "Explode RPG/Homing Launcher", {""}, "Idk Why but it Blows the Launcher up (Kills everyone Holding a Launcher uhh)", function()
	for i, projectile in ipairs(LauncherProjectileArray) do -- Loop through LauncherProjectileArray
		WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(projectile, true) -- Explodes the Projectile Hash (From LauncherProjectileArray)
		util.yield()
	end
	util.yield()
end)

local GrenadeProjectileArray = {-1568386805, 125959754, 0xDB26713A} -- Array for Grenades Stuff Remover
menu.toggle_loop(BlacklistProjectile_Menu, "Explode Grenade/EMP Launcher", {""}, "Explode Grenade/EMP Launcher Projectiles", function() -- Remove Bombs (Explodes them)
	for i, projectile in ipairs(GrenadeProjectileArray) do -- Loop through GrenadeProjectileArray
		WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(projectile, true) -- Explodes the Projectile Hash (From GrenadeProjectileArray)
		util.yield()
	end
	util.yield()
end)

menu.toggle_loop(World_Menu, "Remove Object Collision", {""}, "Disable collisions with objects.", function()
    local user = players.user_ped()
    local veh = PED.GET_VEHICLE_PED_IS_USING(user)
    local my_ents = {user, veh}
    for i, obj_ptr in ipairs(entities.get_all_objects_as_pointers()) do
        local net_obj = memory.read_long(obj_ptr + 0xd0)
        local obj_handle = entities.pointer_to_handle(obj_ptr)
        ENTITY.SET_ENTITY_ALPHA(obj_handle, 255, false)
        CAM.SET_GAMEPLAY_CAM_IGNORE_ENTITY_COLLISION_THIS_UPDATE(obj_handle)
        for i, data in ipairs(my_ents) do
            ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj_handle, data, false)
            ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(data, obj_handle, false)  
        end
        SHAPETEST.RELEASE_SCRIPT_GUID_FROM_ENTITY(obj_handle)
    end
	util.yield(500)
end)

menu.toggle(World_Menu, "Jinx | Disable Vehicle Horn On Ped Death", {}, "Disables the horn that sometimes goes off when a ped dies in their car.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Audio>Disable Vehicle Horn On Ped Death")
end)

menu.toggle(World_Menu, "Jinx | Disable Distant Sirens", {}, "Disables the distant siren sounds you hear in freemode.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Audio>Disable Distant Sirens")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

-----------------------
-- Enhancements Menu --
-----------------------

menu.toggle(Enhancements_Menu, "Jinx | Skip Hotwire", {}, "", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Vehicles>Skip Hotwire")
end)


menu.toggle(Enhancements_Menu, "Jinx | Access Locked Vehicles", {}, "Allows you to access players vehicles that have their vehicle access set to no-one.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Online>Access Locked Vehicles")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----------------------
-- Protections Menu --
----------------------

menu.toggle(Protex, "Jinx | Block Mugger", {}, "Prevents you from being mugged.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Protections>Block Muggers>Myself")
end)

menu.toggle(Protex, "Jinx | Non-Hostile Peds", {}, "Makes NPCs unable to target you.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>World>Non-Hostile Peds")
end)

menu.toggle(Protex, "Jinx | Ghost Orbital Cannon", {}, "Blocks clones of your peds that are likely spawned by modders.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Lobby>Orbital Cannon>Ghost Orbital Cannon Users>Always")
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Lobby>Orbital Cannon>Ghost Modded Orbital Cannons")
end)

menu.toggle_loop(Protex, "Block Clone Spawns", {""}, "Blocks clones of your peds that are likely spawned by modders.", function() -- Skided Fron Jinx... I removed the Notifications bec they had a lot of false positives... 
	for entities.get_all_peds_as_handles() as ped do
		if (ENTITY.GET_ENTITY_MODEL(ped) == util.joaat("mp_f_freemode_01") or ENTITY.GET_ENTITY_MODEL(ped) == util.joaat("mp_m_freemode_01")) and table.contains(blacklistedScripts, script) and not PED.IS_PED_A_PLAYER(ped) then
			entities.delete(ped)
		end
	end
end)


menu.toggle_loop(Protex, "Admin Bail", {}, "Instantly Bail and Join Invite only\nIf R* Admin Detected\n\nThis was Coded by Asuka/Lea_666", function() --Made by Asuka aka. Lea__666
    for players.list_except(true) as pid do
        if players.is_marked_as_admin(pid) or players.is_marked_as_modder_or_admin(pid) then
            menu.trigger_commands("quickbail")
            util.toast("Admin Detected, We get you out of Here!")
            util.yield(666)
            menu.trigger_commands("unstuck")
            util.yield(666)
            menu.trigger_commands("go inviteonly")
        end
    end
    util.yield()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

-----------------------
-- Normal Detections --
-----------------------

menu.toggle_loop(Normal_Detection_Menu, "Aim Detection", {}, "Detects if someone is aiming a weapon at you.", function()
	for _, pid in ipairs(players.list(false, true, true)) do
		local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		for i, hash in ipairs(all_weapons) do
			local weapon_hash = util.joaat(hash)
			if PLAYER.IS_PLAYER_FREE_AIMING(pid, ped, weapon_hash) and PLAYER.IS_PLAYER_TARGETTING_ENTITY(pid, ped, weapon_hash) then
				util.draw_debug_text(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
			else
			util.yield(100)
			end
			util.yield()
		end
		util.yield()
	end
	util.yield()
end)

menu.toggle(Normal_Detection_Menu, "Jinx | Orbital Cannon", {}, "Detects if someone is using an orbital cannon.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Normal Detections>Orbital Cannon")
end)

menu.toggle(Normal_Detection_Menu, "Jinx | Bullshark Testosterone", {}, "Notifies you if a player has collected BST.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Normal Detections>Bullshark Testosterone")
end)

menu.toggle(Normal_Detection_Menu, "Jinx | Waypoint", {}, "Detects if someone places their waypoint on you.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Normal Detections>Waypoint")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------
-- Modder Detections --
-----------------------

menu.toggle(Modder_Detection_Menu, "Jinx | Spawned Vehicle", {}, "Detects if someone use driving a spawned vehicle.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Spawned Vehicle")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Modded License Plate", {}, "Detects people with a modded license plate.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Modded License Plate")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Teleport", {}, "Detects if a player teleports onto you.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Teleport")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Orbital Cannon", {}, "Detects if someone is using a modded orbital cannon.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Orbital Cannon")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Super Drive", {}, "Detects if someone is using super drive or modded vehicle speed.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Super Drive")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Anti-Lockon", {}, "Detects players using anti-lockon.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Anti-Lockon")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Modified Vehicle Speed", {}, "Detects people who have modified their engine power or top speed.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Modified Vehicle Speed")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Modded Vehicle Upgrade", {}, "Detects players who have modded their own or someone elses vehicles outside of a shop.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Modded Vehicle Upgrade")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Modded Vehicle Repair", {}, "", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Modded Vehicle Repair")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Modded Script Host Migration", {}, "Detects people who give script host to another player or took script host while still in a transition.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Modded Script Host Migration")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | 2Take1 User", {}, "Detects people using 2Take1. (Note: player must be in a vehicle spawned by them)", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>2Take1 User")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | YimMenu User", {}, "Detects people using YimMenu's \"Force Session Host\". This will also detect menus that have skidded from YimMenu such as Ethereal.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>YimMenu User")
end)

menu.toggle(Modder_Detection_Menu, "Jinx | Damage Modifier", {}, "Detects menus with bad damage multiplier anti-detections that are not detected by stand.", function(toggled)
	LuaRemote_OnOFF(toggled, "Stand>Lua Scripts>JinxScript>Detections>Modder Detections>Damage Modifier")
end)

menu.toggle_loop(Modder_Detection_Menu, "Remote OTR", {}, "Tells you who's giving you OTR", function()
	local data = memory.alloc(56 * 8)
	for queue = 0, 2 do
		for index = 0, SCRIPT.GET_NUMBER_OF_EVENTS(queue) - 1 do
			local event = (SCRIPT.GET_EVENT_AT_INDEX(queue, index))
			if event == EVENT_NETWORK_SCRIPT_EVENT then
				if not SCRIPT.GET_EVENT_DATA(queue, index, data, 54) then 
					break 
				end
				if memory.read_int(data) == -57493695 then --57493695 is the event that triggers when someone is setting you OTR -> See Log : Off The Radar from Djo_tkr: Script Event: {0: 57493695, 1: 4, 2: 512, 3: 2147483647, 4: 2147483647, 5: 1, 6: 1, 7: 136829452}
					local playerID = memory.read_int(data + 1 * 8)																													--	      ^^^ This Event
					util.toast($"{players.get_name(playerID)} Is giving you OTR.")
				end
			end
			util.yield()
		end
		util.yield()
	end
	util.yield()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------
-- Random Stuff --
------------------

menu.text_input(RandomStuff, "Add Detection", {"AddDetection"}, "Adds a Detection to the Player \n(This is Used by my AHK Script) \nFormat: PlayerName Detection\nExample:\nadddetection WhiteCile3 Stinky\n\nNote: Will wait 10Sec before Adding the Detection", function(InputString)
	if InputString != "" then --Asking if String is Empty bec we get Error Messages (Especially when Shutting the Script down)
		util.yield(10000) --Wait 10Sec before Adding a Detection bec my bot detects and sends it faster than the Player is synced with our List
		local FormatDevider = string.find(InputString,"%s", 1)
		local PlayerName = string.sub(InputString, 1, FormatDevider -1)
		for players.list() as pid do
			if players.get_name(pid) == PlayerName then
				players.add_detection(pid, string.sub(InputString, FormatDevider +1), TOAST_ALL, 100)
				menu.apply_default_state(menu.ref_by_path("Stand>Lua Scripts>Whitis>Random Stuff>Add Detection")) --Remove the Input String so we don't have to remove the last thing we wrote inside the commandbox ^^
			end
		end
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

menu.action(menu.my_root(), "Restart Script", {"restartwhitis"}, "Restarts the script.", function ()
    util.restart_script()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------
-- Player Actions --
--------------------

players.on_join(function(pid)
	menu.divider(menu.player_root(pid), "Whitis Lua")
	
	--------------------------------------
	-- Player Actions | Header Defining --
	--------------------------------------
	
	local Trolling = menu.list(menu.player_root(pid), "Trolling", {"", ""})
	local Crashing = menu.list(menu.player_root(pid), "Crashing", {""}, "")
	local BotControll = menu.list(menu.player_root(pid), "Bot Commands", {"botcmd"},"Remote Commands for the Bot")
	
	-------------------------------
	-- Player Actions | Trolling --
	-------------------------------
	
	menu.divider(Trolling, "Trolling")
	
	menu.action(Trolling, "Vehicle Hijack", {"PedJack"}, "Hijack and Lock The Player's Vehicle, puts an NPC inside the Vehicle and it will drive away lol", function()
		PedJack(pid, false)	
	end)
	
	-------------------------------
	-- Player Actions | Crashing --
	-------------------------------
	
	menu.divider(Crashing, "Crashing")
	
	menu.action(Crashing, "Smart Crash", {"Smash"}, "Tries it best to Crash your Target :O", function()
		CrashInit(pid)
		dogcrash(pid)
		CrashWrapUp()
		local playername = players.get_name(pid)
		menu.trigger_commands("steamroll" .. playername .. "")
		menu.trigger_commands("crash" .. playername .. "")
	end)
	
	menu.action(Crashing, "Dog and Fragment Crash", {"XCrash"}, "Triggers (XJ, X8, X9)", function()
		CrashInit(pid)
		dogcrash(pid)
		CrashWrapUp()	
	end)
	
	menu.action(Crashing, "FragCrash", {"Frag"}, "Uses a fragtest object to crash them, Crash Event (XJ) they won't know who triggered it unless they're smart", function() --spawns a prop_fragtest_cnst_04 Object on target and destroys it, resulting in Crash Event (XJ)
		local playerped = (PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --Gets Playerped
		local playercords = (ENTITY.GET_ENTITY_COORDS(playerped)) --Gets Playerped Cords
		local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), playercords) --Spawn object for fragcrash
		util.yield(300)
		MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(playercords.x, playercords.y - 1, playercords.z + 0.5, playercords.x, playercords.y, playercords.z, 0, true, 177293209, players.user_ped(), false, FastNet, -1, veh, true) --Spawn Bullet to destroy Frag object (Resulting in Fragcrash (XJ))
		util.yield(10)--Wait for crash to work (10ms)
		entities.delete_by_handle(object) --Delete the object for the fragcrash (stops your game from syncing this object any further to others)
	
		--Redoing it (to make sure it doesn't fail)
		util.yield(300)
	
		local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), playercords) --Spawn object for fragcrash
		MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(playercords.x, playercords.y - 1, playercords.z + 0.5, playercords.x, playercords.y, playercords.z, 0, true, 177293209, players.user_ped(), false, FastNet, -1, veh, true) --Spawn Bullet to destroy Frag object (Resulting in Fragcrash (XJ))
		util.yield(300)
		util.yield(10)--Wait for crash to work (10ms)
		entities.delete_by_handle(object) --Delete the object for the fragcrash (stops your game from syncing this object any further to others)
	end)
	
	-----------------------------------
	-- Player Actions | Bot Commands --
	-----------------------------------
	
	menu.divider(BotControll, "BotCommands")
	
	local BotKick = menu.action(BotControll, "Kick", {"BotKick"}, "Kicks them and adds them to the TempBan List", function()	
		if ScriptMode == "Friend" then
			if players.get_name(players.get_host()) == "WhitisGTAGuard2" then
				menu.trigger_commands("sendpmWhitisGTAGuard2 LK9087 " .. players.get_name(pid) .. "")
				return
			end
			for players.list() as Player do
				if players.get_name(Player) == "WhitisGTAGuard2" then
					util.toast("Bot isn't Host [Command is Blocked] :(")
					return
				end
			end
			util.toast("There is no Bot in your Session :O")
			return
		end	
		if ScriptMode == "CoLoadAHK" then
			BotCommandWriter("CCKick " .. players.get_name(pid))
		end
	end)
	
	local BotBan = menu.action(BotControll, "Ban", {"BotBan"}, "Bans them permanently inside Lobbys that have someone running my AHK Script", function()
		if ScriptMode == "Friend" then
			if players.get_name(players.get_host()) == "WhitisGTAGuard2" then
				menu.trigger_commands("sendpmWhitisGTAGuard2 LK3245 " .. players.get_name(pid) .. "")
				return
			end
			for players.list() as Player do
				if players.get_name(Player) == "WhitisGTAGuard2" then
					util.toast("Bot isn't Host [Command is Blocked] :(")
					return
				end
			end
			util.toast("There is no Bot in your Session :O")
			return
		end	
	
		if ScriptMode == "CoLoadAHK" then
			BotCommandWriter("BanListAdd " .. players.get_rockstar_id(pid) .. "")
			BotCommandWriter("CCKick " .. players.get_name(pid))
		end
	end)
	
	local BotAnnoy = menu.action(BotControll, "Annoy", {"BotAnnoy"}, "Makes them unable to do Shit and yeets them around, works on most Modder (Some Modder can desync the Bot but still get their Menu Spamming them)", function()
		if ScriptMode == "Friend" then
			if players.get_name(players.get_host()) == "WhitisGTAGuard2" then
				menu.trigger_commands("sendpmWhitisGTAGuard2 LK8790 " .. players.get_name(pid) .. "")
				menu.trigger_commands("desync " .. players.get_name(pid) .. " on")
				return
			end
			for players.list() as Player do
				if players.get_name(Player) == "WhitisGTAGuard2" then
					util.toast("Bot isn't Host [Command is Blocked] :(")
					return
				end
			end
			util.toast("There is no Bot in your Session :O")
			return
		end	
		if ScriptMode == "CoLoadAHK" then
			BotCommandWriter("Disturb " .. players.get_name(pid))
			menu.trigger_commands("desync " .. players.get_name(pid) .. " on")
		end
	end)
	
	local BotStopAnnoy = menu.action(BotControll, "StopAnnoyAll", {"BotStopAnnoy"}, "Stops the Annoy Command for everyone", function()
		if ScriptMode == "Friend" then
			if players.get_name(players.get_host()) == "WhitisGTAGuard2" then
				menu.trigger_commands("sendpmWhitisGTAGuard2 LK6437")
				return
			end
			for players.list() as Player do
				if players.get_name(Player) == "WhitisGTAGuard2" then
					util.toast("Bot isn't Host [Command is Blocked] :(")
					return
				end
			end
			util.toast("There is no Bot in your Session :O")
			return
		end	
		if ScriptMode == "CoLoadAHK" then
			BotCommandWriter("LoadGuardProfile")
		end
	end)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
players.dispatch_on_join() --keep this