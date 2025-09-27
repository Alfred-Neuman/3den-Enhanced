#include "\x\enh\addons\main\script_component.hpp"

/*
    Author: R3vo

    Description:
    Used by the ENH_ModuleInformation GUI. Called onLoad.

    Parameter(s):
    0: DISPLAY - Module Information GUI

    Returns:
    NOTHING
*/

disableSerialization;

params ["_display"];

private _module = get3DENSelected "Logic" param [0, objNull];

if (isNull _module) exitWith {};

private _ctrlStructuredText = CTRL(IDC_MODULEINFORMATION_DESCRIPTION);

private _moduleInformation = [[configOf _module] call ENH_fnc_MI_getInformationData] call ENH_fnc_MI_formatInformationData;

_ctrlStructuredText ctrlSetStructuredText _moduleInformation;

// Resize control but only as small as controls group
_ctrlStructuredText ctrlSetPositionH ((ctrlTextHeight _ctrlStructuredText) max (ctrlPosition (ctrlParentControlsGroup _ctrlStructuredText) # 3));
_ctrlStructuredText ctrlCommit 0;

[_display, typeOf _module] call ENH_fnc_MI_createSyncPreview;

nil;
