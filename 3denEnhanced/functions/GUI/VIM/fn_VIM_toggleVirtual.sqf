/*
  Author: R3vo

  Date: 2021-06-22

  Description:
  Used by the ENH_VIM GUI. Used to change virtual state

  Parameter(s):
  1: BOOLEAN or NUMBER - -1 to invert current state, true to set to virtual, false to set to normal

  Returns:
  -
*/

#include "\3denEnhanced\ENH_defineCommon.hpp"

disableSerialization;
//params ["", "_isVirtual"];
params [["_isVirtual", [-1], [true, 0]]];

private _display = uiNamespace getVariable "ENH_Display_VIM";
private _ctrlInventory = CTRL(IDC_VIM_INVENTORYLIST);
private _rows = (lnbSize _ctrlInventory) # 0;

//Reverse state
if (_isVirtual isEqualTo -1) then
{
  _isVirtual = !(_display getVariable ["ENH_VIM_IsVirtual", false]);
};

if (_isVirtual) then
{
  for "_i" from 0 to _rows - 1 do
  {
    _ctrlInventory lnbSetText [[_i, 2], "∞"];
  };
}
else
{
  for "_i" from 0 to _rows - 1 do
  {
    _ctrlInventory lnbSetText [[_i, 2], str (_ctrlInventory lnbValue [_i, 1])];
  };
};

_display setVariable ["ENH_VIM_IsVirtual", _isVirtual];