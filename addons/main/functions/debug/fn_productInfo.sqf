/*
    Author: R3vo

    Date: 2019-08-20

    Description:
    Retrieves data of currently used Arma 3 version and formats this information so it can directly be used in bug reports or similar.

    Parameter(s):
    -

    Returns:
    -
*/

#include "\x\enh\addons\main\script_component.hpp"

private _modList = "";

_configClasses = ("true" configClasses (configFile >> "CfgMods")) + ("true" configClasses (configFile >> "CfgPatches"));
{
    _name = getText (_x >> "name");
    if ((_name find "Arma 3" == -1) && !(_name isEqualTo "")) then
    {
        _modList = _modList + _name + endl;
    };
    true
} count _configClasses;

private _text = format
[
    "Game: %1" + endl + "Version: %2" + endl + "Build: %3" + endl + "Branch: %4" + endl + "Mods enabled: %5" + endl + "Operating System: %6" + endl + "Architecture: %10" + endl + endl + "Resolution:" + endl + "Width: %7" + endl + "Height: %8" + endl + "UI Scale: %9" + endl + endl + "Mod List:" + endl + "%11", //Do not localize
    productVersion # 0,
    (productVersion # 2) / 100,
    productVersion # 3,
    productVersion # 4,
    productVersion # 5,
    productVersion # 6,
    getResolution # 0,
    getResolution # 1,
    getResolution # 5,
    productVersion # 7,
    _modList
];

uiNamespace setVariable ["display3DENCopy_data", ["", _text]];
findDisplay IDD_DISPLAY3DEN createDisplay "display3denCopy";