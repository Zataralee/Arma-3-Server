// bAdmin Exile by Daz & Biabock

#define DEBUG false

[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";

// bAdmin

if (!isDedicated) then
{
	if (hasInterface) then // Normal player
	{
		execVM "badmin\client\init.sqf";
	}
};

if (isServer) then
{
	diag_log "bAdmin - Initializing";
	[] execVM "badmin\server\init.sqf";
};

OPEN_bADMIN_FNC = {
	switch (_this) do {
		//Key U
		case 22: {
			nul = [] execVM "badmin\client\systems\adminPanel\checkAdmin.sqf";
		};
	};
};

waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call OPEN_bADMIN_FNC;false;"];

// Enigma Revive
[] execVM "Custom\EnigmaRevive\init.sqf";

[] execVM "R3F_LOG\init.sqf"; //Add this to your init.sqf

[] execVM "ClaimVehicles_Client\ClaimVehicles_Client_init.sqf";