#include "\x\enh\addons\main\script_component.hpp"

/*
    Author: R3vo

    Date: 2020-02-22

    Description:
    Used by the advanced damage attribute. Called when attribute is loaded. It automatically create a set of controls for every
    available hitpoint and resizes the controls group accordingly. The IDCs have to be that large to make sure they are not in conflict with other controls created
    by Eden Editor.

    Parameter(s):
    0: CONTROL - Controls group
    1: ARRAY - Attribute value

    Returns:
    -
*/

params ["_ctrlGroup", "_value"];
parseSimpleArray _value params ["_hitpoints", "_damage"];

private _display = ctrlParent _ctrlGroup;

// Adjust group positions
_ctrlGroup ctrlSetPositionY (2.5 * CTRL_DEFAULT_H); // For description
_ctrlGroup ctrlSetPositionH ((count _hitpoints max 1) * (CTRL_DEFAULT_H + 5 * pixelH));
_ctrlGroup ctrlCommit 0;

// Some objects such as B_static_AA_F have not hitpoints. In that case display a message
if (_hitpoints isEqualTo []) exitWith
{
    private _ctrlHintNoHitPoints = _display ctrlCreate ["ctrlStructuredText", -1, _ctrlGroup];
    _ctrlHintNoHitPoints ctrlSetPosition [5 * GRID_W, 0, (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - 5) * GRID_W, CTRL_DEFAULT_H];
    _ctrlHintNoHitPoints ctrlCommit 0;
    _ctrlHintNoHitPoints ctrlSetBackgroundColor [1, 1, 1, 0.05];
    private _txt = text localize "STR_ENH_MAIN_ADVANCEDDAMAGE_NOHITPOINTS";
    _txt setAttributes ["align", "center", "size", "1.2"];
    _ctrlHintNoHitPoints ctrlSetStructuredText composeText [_txt];
};

private _counter = 0;

// These are listed here to prevent HEMTT from
// saying these were unused in stringtable.xml
// TODO: Remove in case HEMTT ever gets an option to add excludes 2025-04-07 R3vo
private _keysNotUsed =
[
    "$STR_ENH_MAIN_DAMAGE_#CAM_GUNNER",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_1_LIGHT_1_HIT",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_1_LIGHT_2_HIT",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_2_LIGHT_1_HIT",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_2_LIGHT_2_HIT",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_3_LIGHT_1_HIT",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_3_LIGHT_2_HIT",
    "$STR_ENH_MAIN_DAMAGE_#GEAR_F_LIGHTS",
    "$STR_ENH_MAIN_DAMAGE_#GLASS11",
    "$STR_ENH_MAIN_DAMAGE_#HITLIGHT1",
    "$STR_ENH_MAIN_DAMAGE_#HITLIGHT2",
    "$STR_ENH_MAIN_DAMAGE_#HITLIGHT3",
    "$STR_ENH_MAIN_DAMAGE_#L SVETLO",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_1_HIT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_1_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_1",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_2_HIT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_2_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_2",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_3_HIT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_3_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_4_HIT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_4_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_L_FLARE",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_L_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_L",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_L2_FLARE",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_L2",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_R_FLARE",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_R_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_R",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_R2_FLARE",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_R2",
    "$STR_ENH_MAIN_DAMAGE_#LIGHT_SPOTLIGHT_HIT",
    "$STR_ENH_MAIN_DAMAGE_#P SVETLO",
    "$STR_ENH_MAIN_DAMAGE_#POS_GEAR_FRONT_LIGHT",
    "$STR_ENH_MAIN_DAMAGE_#WING_LEFT_LIGHT",
    "$STR_ENH_MAIN_DAMAGE_#WING_RIGHT_LIGHT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_1_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_2_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_3_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_4_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_5_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_6_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_7_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_8_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_9_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_10_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_11_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_12_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_13_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_14_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_15_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_16_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_17_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_18_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_19_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_20_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_21_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_22_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_23_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_24_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_25_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_26_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_27_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_28_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_29_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_30_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_31_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_32_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_33_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_34_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_35_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_36_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_37_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_38_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_39_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_40_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_41_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_42_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_43_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_44_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_45_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_46_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_47_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_48_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_49_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_50_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_51_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_52_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_53_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_54_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_55_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_56_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_57_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_58_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_59_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_60_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_61_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_GLASS_62_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_HAND_L",
    "$STR_ENH_MAIN_DAMAGE_HAND_R",
    "$STR_ENH_MAIN_DAMAGE_HIT_LIGHT_1_FLARE",
    "$STR_ENH_MAIN_DAMAGE_HIT_LIGHT_1",
    "$STR_ENH_MAIN_DAMAGE_HIT_LIGHT_2",
    "$STR_ENH_MAIN_DAMAGE_HIT_LIGHT_3",
    "$STR_ENH_MAIN_DAMAGE_HIT_LIGHT_4",
    "$STR_ENH_MAIN_DAMAGE_HITABDOMEN",
    "$STR_ENH_MAIN_DAMAGE_HITAMMO",
    "$STR_ENH_MAIN_DAMAGE_HITARMS",
    "$STR_ENH_MAIN_DAMAGE_HITAVIONICS",
    "$STR_ENH_MAIN_DAMAGE_HITBATTERY_L",
    "$STR_ENH_MAIN_DAMAGE_HITBATTERY_R",
    "$STR_ENH_MAIN_DAMAGE_HITBODY",
    "$STR_ENH_MAIN_DAMAGE_HITCHEST",
    "$STR_ENH_MAIN_DAMAGE_HITCOMGUN",
    "$STR_ENH_MAIN_DAMAGE_HITCOMTURRET",
    "$STR_ENH_MAIN_DAMAGE_HITDIAPHRAGM",
    "$STR_ENH_MAIN_DAMAGE_HITENGINE",
    "$STR_ENH_MAIN_DAMAGE_HITENGINE1",
    "$STR_ENH_MAIN_DAMAGE_HITENGINE2",
    "$STR_ENH_MAIN_DAMAGE_HITENGINE3",
    "$STR_ENH_MAIN_DAMAGE_HITENGINE4",
    "$STR_ENH_MAIN_DAMAGE_HITERA_BACK",
    "$STR_ENH_MAIN_DAMAGE_HITERA_FRONT",
    "$STR_ENH_MAIN_DAMAGE_HITERA_LEFT_1",
    "$STR_ENH_MAIN_DAMAGE_HITERA_LEFT_2",
    "$STR_ENH_MAIN_DAMAGE_HITERA_LEFT_3",
    "$STR_ENH_MAIN_DAMAGE_HITERA_LEFT_4",
    "$STR_ENH_MAIN_DAMAGE_HITERA_LEFT",
    "$STR_ENH_MAIN_DAMAGE_HITERA_RIGHT_1",
    "$STR_ENH_MAIN_DAMAGE_HITERA_RIGHT_2",
    "$STR_ENH_MAIN_DAMAGE_HITERA_RIGHT_3",
    "$STR_ENH_MAIN_DAMAGE_HITERA_RIGHT_4",
    "$STR_ENH_MAIN_DAMAGE_HITERA_RIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_FRONT",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_LEFT_1",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_LEFT_2",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_LEFT",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_RIGHT_1",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_RIGHT_2",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP_RIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITERA_TOP",
    "$STR_ENH_MAIN_DAMAGE_HITFACE",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL_LEAD_LEFT",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL_LEAD_RIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL_LEFT",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL_RIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL1",
    "$STR_ENH_MAIN_DAMAGE_HITFUEL2",
    "$STR_ENH_MAIN_DAMAGE_HITFUELL",
    "$STR_ENH_MAIN_DAMAGE_HITFUELR",
    "$STR_ENH_MAIN_DAMAGE_HITFUELTANK",
    "$STR_ENH_MAIN_DAMAGE_HITGEAR",
    "$STR_ENH_MAIN_DAMAGE_HITGEARLIGHTS",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS1",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS1A",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS1B",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS2",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS3",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS4",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS5",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS6",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS7",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS8",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS9",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS10",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS11",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS12",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS13",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS14",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS15",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS16",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS17",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS18",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS19",
    "$STR_ENH_MAIN_DAMAGE_HITGLASS20",
    "$STR_ENH_MAIN_DAMAGE_HITGLASSL",
    "$STR_ENH_MAIN_DAMAGE_HITGLASSR",
    "$STR_ENH_MAIN_DAMAGE_HITGUN",
    "$STR_ENH_MAIN_DAMAGE_HITHANDS",
    "$STR_ENH_MAIN_DAMAGE_HITHEAD",
    "$STR_ENH_MAIN_DAMAGE_HITHROTOR",
    "$STR_ENH_MAIN_DAMAGE_HITHSTABILIZERL1",
    "$STR_ENH_MAIN_DAMAGE_HITHSTABILIZERR1",
    "$STR_ENH_MAIN_DAMAGE_HITHULL",
    "$STR_ENH_MAIN_DAMAGE_HITHYDRAULICS",
    "$STR_ENH_MAIN_DAMAGE_HITLAILERON_LINK",
    "$STR_ENH_MAIN_DAMAGE_HITLAILERON",
    "$STR_ENH_MAIN_DAMAGE_HITLBWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITLCELEVATOR",
    "$STR_ENH_MAIN_DAMAGE_HITLCRUDDER",
    "$STR_ENH_MAIN_DAMAGE_HITLEGS",
    "$STR_ENH_MAIN_DAMAGE_HITLF2WHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITLFWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITLGLASS",
    "$STR_ENH_MAIN_DAMAGE_HITLIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITLIGHTBACK",
    "$STR_ENH_MAIN_DAMAGE_HITLIGHTFRONT",
    "$STR_ENH_MAIN_DAMAGE_HITLIGHTL",
    "$STR_ENH_MAIN_DAMAGE_HITLIGHTR",
    "$STR_ENH_MAIN_DAMAGE_HITLMWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITLTRACK",
    "$STR_ENH_MAIN_DAMAGE_HITMISSILES",
    "$STR_ENH_MAIN_DAMAGE_HITNECK",
    "$STR_ENH_MAIN_DAMAGE_HITOPTIC",
    "$STR_ENH_MAIN_DAMAGE_HITOPTICS",
    "$STR_ENH_MAIN_DAMAGE_HITPELVIS",
    "$STR_ENH_MAIN_DAMAGE_HITPITOTTUBE",
    "$STR_ENH_MAIN_DAMAGE_HITRAILERON_LINK",
    "$STR_ENH_MAIN_DAMAGE_HITRAILERON",
    "$STR_ENH_MAIN_DAMAGE_HITRBWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITRELEVATOR",
    "$STR_ENH_MAIN_DAMAGE_HITRESERVEWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITRF2WHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITRFWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITRGLASS",
    "$STR_ENH_MAIN_DAMAGE_HITRMWHEEL",
    "$STR_ENH_MAIN_DAMAGE_HITROTOR",
    "$STR_ENH_MAIN_DAMAGE_HITROTORVIRTUAL",
    "$STR_ENH_MAIN_DAMAGE_HITRRUDDER",
    "$STR_ENH_MAIN_DAMAGE_HITRTRACK",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_BACK",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_FRONT",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_LEFT_1",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_LEFT_2",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_LEFT_3",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_LEFT",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_RIGHT_1",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_RIGHT_2",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_RIGHT_3",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_RIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_TOP_BACK",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_TOP_LEFT",
    "$STR_ENH_MAIN_DAMAGE_HITSLAT_TOP_RIGHT",
    "$STR_ENH_MAIN_DAMAGE_HITSTARTER1",
    "$STR_ENH_MAIN_DAMAGE_HITSTARTER2",
    "$STR_ENH_MAIN_DAMAGE_HITSTARTER3",
    "$STR_ENH_MAIN_DAMAGE_HITSTATICPORT",
    "$STR_ENH_MAIN_DAMAGE_HITTAIL",
    "$STR_ENH_MAIN_DAMAGE_HITTRANSMISSION",
    "$STR_ENH_MAIN_DAMAGE_HITTURRET",
    "$STR_ENH_MAIN_DAMAGE_HITVROTOR",
    "$STR_ENH_MAIN_DAMAGE_HITVSTABILIZER1",
    "$STR_ENH_MAIN_DAMAGE_HITWINCH",
    "$STR_ENH_MAIN_DAMAGE_HITZONE_1_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_HITZONE_2_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_HITZONE_3_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_HITZONE_4_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_INCAPACITATED",
    "$STR_ENH_MAIN_DAMAGE_LEG_L",
    "$STR_ENH_MAIN_DAMAGE_LEG_R",
    "$STR_ENH_MAIN_DAMAGE_LIGHT_1_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_LIGHT_2_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_LIGHT_3_HITPOINT",
    "$STR_ENH_MAIN_DAMAGE_LIGHT_4_HITPOINT"
];

{
    _counter = _counter + 1;
    private _ctrlLabel = _display ctrlCreate ["ENH_3DEN_Attribute_Control_AttributeTitle", 20000 + _forEachIndex, _ctrlGroup];

    // String is build like this to prevent error when checking for missing localization keys
    private _name = format ["%1_%2_%3_%4_%5", "STR", "ENH", "MAIN", "DAMAGE", toUpper _x];

    _ctrlLabel ctrlSetText (if (isLocalized _name) then {localize _name} else {_x});
    _ctrlLabel ctrlSetTooltip _x;
    _ctrlLabel ctrlSetPosition [0, CTRL_DEFAULT_H * _forEachIndex + 5 * pixelH * _forEachIndex, ATTRIBUTE_TITLE_W * GRID_W, CTRL_DEFAULT_H];
    _ctrlLabel ctrlCommit 0;

    private _ctrlSlider = _display ctrlCreate ["ctrlXSliderH", 30000 + _forEachIndex, _ctrlGroup];
    _ctrlSlider ctrlSetPosition [ATTRIBUTE_TITLE_W * GRID_W, CTRL_DEFAULT_H * _forEachIndex + 5 * pixelH * _forEachIndex, (ATTRIBUTE_CONTENT_W - EDIT_W) * GRID_W, CTRL_DEFAULT_H];
    _ctrlSlider ctrlCommit 0;

    private _ctrlEdit = _display ctrlCreate ["ctrlEdit", 40000 + _forEachIndex, _ctrlGroup];
    _ctrlEdit ctrlSetPosition [(ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - EDIT_W) * GRID_W, CTRL_DEFAULT_H * _forEachIndex + 5 * pixelH * _forEachIndex, EDIT_W * GRID_W, CTRL_DEFAULT_H];
    _ctrlEdit ctrlCommit 0;

    [_ctrlSlider, _ctrlEdit] call BIS_fnc_initSliderValue;
    [_ctrlSlider, _ctrlEdit, "%", _damage # _forEachIndex] call BIS_fnc_initSliderValue;
} forEach _hitpoints;

_ctrlGroup setVariable ["ENH_controlsCount", _counter];
