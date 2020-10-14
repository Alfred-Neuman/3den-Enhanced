/*
   Author: R3vo

   Date: 2020-07-03

   Description:
   Loops through all menu strip entries and checks if they are blacklisted. If true it removes the entry. It is executed everytime the editor is started.

   Parameter(s):
   -

   Returns:
   BOOLEAN: true
*/

#include "\userconfig\3denEnhanced_Optionals_MenuStrip.hpp"

private _ctrlMenuStrip = findDisplay 313 displayCtrl 120;
private _toDelete = _menuStripBlacklist apply {localize _x};

private _fnc_delete =
{
	if ((_ctrlMenuStrip menuText _this) in _toDelete) then
	{
		_ctrlMenuStrip menuDelete _this;
	};
};

for "_i" from (_ctrlMenuStrip menuSize []) to 0 step -1 do
{
	for "_j" from (_ctrlMenuStrip menuSize [_i]) to 0 step -1 do
	{
		for "_k" from (_ctrlMenuStrip menuSize [_i,_j]) to 0 step -1 do
		{
			[_i,_j,_k] call _fnc_delete;
		};
		[_i,_j] call _fnc_delete;
	};
	[_i] call _fnc_delete;
};

true