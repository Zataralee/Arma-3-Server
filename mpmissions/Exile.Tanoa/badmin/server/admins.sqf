// *****************************************************************************************
// * This script is licensed under the GNU Lesser GPL v3. Copyright © 2015 A3Wasteland.com *
// *****************************************************************************************
//	@file Name: server\admins.sqf
// bAdmin Exile by Biabock

if (!isServer) exitWith {};

if (loadFile (externalConfigFolder + "\admins.sqf") != "") then
{
	call compile preprocessFileLineNumbers (externalConfigFolder + "\admins.sqf");
	diag_log "bAdmin - External admins.sqf loaded";
}
else
{
	// Admin menu (U key) access levels

	/*******************************************************
	 Player UID examples :

		"1234567887654321", // Meatwad
		"8765432112345678", // Master Shake
		"1234876543211234", // Frylock
		"1337133713371337"  // Carl

	 Important: The player UID must always be placed between
	            double quotes (") and all lines need to have
	            a comma (,) except the last one.
	********************************************************/

	// Low Administrators: manage & spectate players, remove hacked vehicles
	lowAdmins = compileFinal str
	[
		// Put player UIDs here
	];

	// High Administrators: manage & spectate players, remove hacked vehicles, show player tags
	highAdmins = compileFinal str
	[
		// Put player UIDs here
	];

	// Server Owners: access to everything, including god mode, money, guns, and vehicles
	serverOwners = compileFinal str
	[
	"76561197994641119" // Zataralee
	];

	/********************************************************/
	diag_log "bAdmin - ERROR! \bAdmin_settings\admins.sqf not found!";
	diag_log "bAdmin - This folder must be in the server directory";
};

if (typeName lowAdmins == "ARRAY") then { lowAdmins = compileFinal str lowAdmins };
if (typeName highAdmins == "ARRAY") then { highAdmins = compileFinal str highAdmins };
if (typeName serverOwners == "ARRAY") then { serverOwners = compileFinal str serverOwners };

publicVariable "lowAdmins";
publicVariable "highAdmins";
publicVariable "serverOwners";
