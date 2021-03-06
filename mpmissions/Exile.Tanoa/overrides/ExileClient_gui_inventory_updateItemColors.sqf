/**
 * ExileClient_gui_inventory_updateItemColors
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_display", "_timeWaited", "_exitLoop", "_listBoxIds", "_listBox", "_listBoxSize", "_i", "_itemDisplayName", "_itemClassName", "_configName", "_configSearch", "_quality", "_color"];
[] spawn 
{
	disableSerialization;
	_display = findDisplay 602;
	_timeWaited = 0;
	_exitLoop = false;
	_listBoxIds = 
	[
		619, 
		632, 
		633, 
		638, 
		640 
	];
	while {!_exitLoop} do
	{	
		{
			_listBox = _display displayCtrl _x;
			_listBoxSize = lbSize _listBox; 
			if (_listBoxSize > 0) then
			{
				for "_i" from 0 to (_listBoxSize - 1) do
				{
					_itemDisplayName = _listBox lbText _i;
					_itemClassName = _listBox lbData _i;
					_configName = "";
					if( _itemClassName == "" ) then
					{
						_configSearch = [_itemDisplayName] call ExileClient_util_gear_getConfigEntryByDisplayName;
						_itemClassName = _configSearch select 0;
						_configName = _configSearch select 1;
					}
					else 
					{
						_configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
					};
					if( _configName != "" ) then
					{
						_quality = getNumber(configFile >> _configName >> _itemClassName >> "quality");
						_color = [1, 1, 1, 1];
						switch (_quality) do
						{
							default		{ _color = [1, 1, 1, 1]; };				//White
							case 2: 	{ _color = [0.62, 0.87 ,0.23, 1]; };	//Green
							case 3:		{ _color = [1, 0.961, 0.392, 1]; };		//Yellow
							case 4:		{ _color = [0.91, 0.592 ,0.212, 1]; }; 	//Orange
							case 5:		{ _color = [1, 0.043 ,0, 1]; };			//Red
							case 6:		{ _color = [0.878, 0.545 ,0.91, 1]; }; 	//Pink
							case 7: 	{ _color = [0.875, 0.118, 0.91, 1]; };	//Purple
							case 8: 	{ _color = [0.392, 0.349, 0.91, 1]; };	//Blue
							case 9: 	{ _color = [0.063, 0.941 ,1, 1]; };		//Turquois
							case 10: 	{ _color = [0.318, 1 , 0.667, 1]; };	//Teal
						};
						_listBox lbSetColor [_i, _color];
					};
				};
				_exitLoop = true;
			};
		}
		forEach _listBoxIds;
		if (_timeWaited >= 0.5) then
		{
			_exitLoop = true;
		}
		else 
		{
			uiSleep 0.01;
			_timeWaited = _timeWaited + 0.01;
		};
	};
	systemChat "yay";
};
true