#include "\x\enh\addons\main\script_component.hpp"

/*
    Author: R3vo

    Date: 2025-09-30

    Description:
    Creates a tree view displaying how the module should be synced in the
    Module Information UI.

    Parameter(s):
    0: DISPLAY - ENH_ModuleInformation
    1: STRING - Class name of the main module from CfgVehicles

    Return Value:
    NOTHING
*/

if (!is3DEN) exitWith {};

disableSerialization;

params ["_displayModuleInformation", "_logicClass"];

private _ctrlBackgroundSyncPreview = _displayModuleInformation displayCtrl IDC_MODULEINFORMATION_SYNC_BACKGROUND;

private _ctrlTree = ctrlParent _ctrlBackgroundSyncPreview ctrlCreate ["ctrlTree", -1];
_ctrlTree ctrlSetPosition (ctrlPosition _ctrlBackgroundSyncPreview);
_ctrlTree ctrlCommit 0;

private _fnc_createSyncChildren =
{
    params ["_parentPath", "_parentConfig", "_ctrlTV", "_cfgModuleMain"];

    if (isNull _parentConfig) exitWith
    {
        [format ["Config for module (%1) was null.", _cfgModuleMain]] call BIS_fnc_3DENNotification;
        nil;
    };

    private _newParentPath = [];
    private _newParentConfig = configNull;

    private _informationHashMap = [_parentConfig] call ENH_fnc_MI_getInformationData;
    private _informationStructText = [_informationHashMap] call ENH_fnc_MI_formatInformationData;

    private _index = _ctrlTV tvAdd
    [
        _parentPath,
        format
        [
            "%1 (%2)",
            _informationHashMap get "displayName",
            _informationHashMap get "configName"
        ]
    ];

    _newParentPath = _parentPath + [_index];

    _ctrlTree tvSetPicture [_newParentPath, _informationHashMap get "icon"];

    // Store date for selection changed event
    private _informationCache = _ctrlTree getVariable ["InformationCache", createHashMap];
    _informationCache set [_newParentPath, _informationStructText];
    _ctrlTree setVariable ["InformationCache", _informationCache];

    // Get all children
    private _children = [];

    if (isClass (_parentConfig >> "ModuleDescription")) then
    {
        _children = getArray(_parentConfig >> "ModuleDescription" >> "sync");
    }
    else
    {
        _children = getArray(_parentConfig >> "sync");
    };

    {
        private _newParentConfig = _cfgModuleMain >> "ModuleDescription" >> _x;
        [_newParentPath, _newParentConfig, _ctrlTV, _cfgModuleMain] call _fnc_createSyncChildren;
    } forEach _children;
};

_ctrlTree ctrlAddEventHandler ["TreeSelChanged",
{
    params ["_ctrlTree", "_path"];

    private _informationStructText = (_ctrlTree getVariable "InformationCache") get _path;
    private _ctrlStructuredText = ctrlParent _ctrlTree displayCtrl IDC_MODULEINFORMATION_DESCRIPTION;

    _ctrlStructuredText ctrlSetStructuredText _informationStructText;
    _ctrlStructuredText call ENH_fnc_MI_resizeInformationControl;
}];

private _cfgModuleMain = configFile >> "CfgVehicles" >> _logicClass;

[[], _cfgModuleMain, _ctrlTree, _cfgModuleMain] call _fnc_createSyncChildren;

tvExpandAll _ctrlTree;

nil;
