#include "\x\enh\addons\main\script_component.hpp"

/*
    Author: R3vo

    Date: 2025-09-25

    Description:
    Creates the sync preview in the Module Information GUI.

    Parameter(s):
    0: DISPLAY - Module Information GUI
    1: STRING - Module class

    Returns:
    NOTHING
*/

#define R1 8
#define R2 (2 * R1)
#define R3 (2 * R1)
#define SIZE 4

if (!is3DEN) exitWith {};

disableSerialization;

params ["_displayModuleInformation", "_logicClass"];

private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgModuleMain = _cfgVehicles >> _logicClass;
private _cfgModuleDescription = _cfgModuleMain >> "moduleDescription";

private _syncClasses = getArray (_cfgModuleDescription >> "sync");
if (_syncClasses isEqualTo []) exitWith {};

private _fnc_calculatePosition =
{
    params ["_angle", "_r", "_centerX", "_centerY"];
    [_centerX + sin _angle * _r * GRID_W, _centerY + cos _angle * _r * GRID_H];
};

private _fnc_getTooltip =
{
    params ["_class"];

    [_cfgVehicles >> _class, "displayName", _class] call BIS_fnc_returnConfigEntry;
};

private _onMouseEnter =
{
    params ["_ctrl"];

    private _display = ctrlParent _ctrl;

    ctrlPosition _ctrl params ["", "", "_sizeW", "_sizeH"];

    _ctrl setVariable ["Size", [_sizeW, _sizeH]];

    _ctrl ctrlSetPositionW (_sizeW * 1.05);
    _ctrl ctrlSetPositionH (_sizeH * 1.05);
    _ctrl ctrlCommit 0.2;

    private _cfgModule = _ctrl getVariable "config";

    private _ctrlStructuredText = CTRL(IDC_MODULEINFORMATION_DESCRIPTION);
    private _moduleInformation = [[_cfgModule] call ENH_fnc_MI_getInformationData] call ENH_fnc_MI_formatInformationData;
    _ctrlStructuredText ctrlSetStructuredText _moduleInformation;
    // Resize control but only as small as controls group
    _ctrlStructuredText ctrlSetPositionH ((ctrlTextHeight _ctrlStructuredText) max (ctrlPosition (ctrlParentControlsGroup _ctrlStructuredText) # 3));
    _ctrlStructuredText ctrlCommit 0;
};

private _onMouseExit =
{
    params ["_ctrl"];

    _ctrl getVariable "Size" params ["_sizeW", "_sizeH"];

    _ctrl ctrlSetPositionW _sizeW;
    _ctrl ctrlSetPositionH _sizeH;
    _ctrl ctrlCommit 0.2;
};

private _fnc_drawLine =
{
    params ["_displayModuleInformation", "_xPosStart", "_yPosStart", "_xPosEnd", "_yPosEnd"];

    private _ctrlLine = _displayModuleInformation ctrlCreate ["ctrlStaticLine", -1];

    private _angle = [_xPosStart, _yPosStart] getDir [_xPosEnd, _yPosEnd];

    private _width = 0;
    private _height = 0;

    // Quadrant 1
    if (_angle >= 0 && _angle <= 90) then
    {
        _width = _xPosEnd - _xPosStart;
        _height = _yPosEnd - _yPosStart;
    };

    // Quadrant 2
    if (_angle > 90 && _angle <= 180) then
    {
        _width = _xPosEnd - _xPosStart;
        _height = _yPosEnd - _yPosStart;
    };

    // Quadrant 3
    if (_angle > 180 && _angle <= 270) then
    {
        _width = _xPosEnd - _xPosStart;
        _height = _yPosEnd - _yPosStart;
    };

    // Quadrant 4
    if (_angle > 270 && _angle <= 360) then
    {
        _width = _xPosEnd - _xPosStart;
        _height = _yPosEnd - _yPosStart;
    };

    private _offsetX = 0.5 * SIZE * GRID_W;
    private _offsetY = 0.5 * SIZE * GRID_H;

    _ctrlLine ctrlSetPosition
    [
        _xPosStart + _offsetX,
        _yPosStart + _offsetY,
        _width,
        _height
    ];

    _ctrlLine ctrlSetTextColor [0.7, 0.7, 0.7, 0.7];
};

private _fnc_createModuleIcon =
{
    params ["_cfgModule", "_centerX", "_centerY", "_onMouseEnter", "_onMouseExit"];

    private _ctrlModule = _displayModuleInformation ctrlCreate ["ctrlActivePictureKeepAspect", -1];
    _ctrlModule ctrlSetText ([_cfgModule] call ENH_fnc_MI_getModuleIcon);
    _ctrlModule ctrlSetTooltip ([configName _cfgModule] call _fnc_getTooltip);
    _ctrlModule setVariable ["Config", _cfgModule];

    _ctrlModule ctrlAddEventHandler ["MouseEnter", _onMouseEnter];
    _ctrlModule ctrlAddEventHandler ["MouseExit", _onMouseExit];

    _ctrlModule ctrlSetPosition [_centerX, _centerY, SIZE * GRID_W, SIZE * GRID_H];
};

private _ctrlBackgroundSyncPreview = _displayModuleInformation displayCtrl IDC_MODULEINFORMATION_SYNC_BACKGROUND;

ctrlPosition _ctrlBackgroundSyncPreview params ["_centerX", "_centerY", "_w", "_h"];

private _centerX = _centerX + 0.5 * _w - 0.5 * SIZE * GRID_W;
private _centerY = _centerY + 0.5 * _h - 0.5 * SIZE * GRID_H;

[_cfgModuleMain, _centerX, _centerY, _onMouseEnter, _onMouseExit] call _fnc_createModuleIcon;

private _angleStep = 360 / (count _syncClasses max 1);
{
    private _cfgModule = _cfgModuleMain >> "ModuleDescription" >> _x;

    if (isNull _cfgModule) then
    {
        _cfgModule = configFile >> "CfgVehicles" >> _x;
    };

    [_forEachIndex * _angleStep + 180, R1, _centerX, _centerY] call _fnc_calculatePosition params ["_xPos", "_yPos"];
    [_cfgModule, _xPos, _yPos, _onMouseEnter, _onMouseExit] call _fnc_createModuleIcon;
    [_displayModuleInformation, _centerX, _centerY, _xPos, _yPos] call _fnc_drawLine;

    private _subSync = getArray (_cfgModuleDescription >> _x >> "sync");
    private _indexSubItem = _forEachIndex;

    // private _angleStep = 360 / (count _subSync max 1);

    {
        private _cfgModule = _cfgModuleMain >> "ModuleDescription" >> _x;

        if (isNull _cfgModule) then
        {
            _cfgModule = configFile >> "CfgVehicles" >> _x;
        };

        [_indexSubItem * _angleStep + 180, R2, _xPos, _yPos] call _fnc_calculatePosition params ["_xPosSub", "_yPosSub"];
        [_cfgModule, _xPosSub, _yPosSub, _onMouseEnter, _onMouseExit] call _fnc_createModuleIcon;
        [_displayModuleInformation, _xPos, _yPos, _xPosSub, _yPosSub] call _fnc_drawLine;

        private _subSubSync = getArray (_cfgModuleDescription >> _x >> "sync");
        private _indexSubSubItem = _indexSubItem;

        // systemChat str _subSubSync;

        // private _angleStep = 360 / (count _subSubSync max 1);

        {
            private _cfgModule = _cfgModuleMain >> "ModuleDescription" >> _x;

            if (isNull _cfgModule) then
            {
                _cfgModule = configFile >> "CfgVehicles" >> _x;
            };
            systemChat _x;
            [_indexSubSubItem * _angleStep + 180, R3, _xPosSub, _yPosSub] call _fnc_calculatePosition params ["_xPosSubSub", "_yPosSubSub"];
            [_cfgModule, _xPosSubSub, _yPosSubSub, _onMouseEnter, _onMouseExit] call _fnc_createModuleIcon;
            [_displayModuleInformation, _xPosSub, _yPosSub, _xPosSubSub, _yPosSubSub] call _fnc_drawLine;
        } forEach _subSubSync;
    } forEach _subSync;
} forEach _syncClasses;

allControls _displayModuleInformation apply {_x ctrlCommit 0};

nil
