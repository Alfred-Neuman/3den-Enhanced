v6.1
*ADDED*
- Tool to quickly toggle the playable state of multiple units
- Vehicle Inventory Manager now has an option to export all items in format of ACE Arsenal. Just import the value into the ACE Arsenal attribute
- Added debugging mode for Dynamic Simulation during preview
- Added a tool which allows you to quickly show all markers in Eden Editor whose alpha value was set to 0. No more guessing where the markers are! (Shortcut: V)
- Updated Russian translation by Counserf
- Various translation tweaks
- Added tools to quickly select available addons for Zeus. See https://github.com/R3voA3/3den-Enhanced/wiki/Custom-GUIs#zeus-addons
- More ambient animations

*CHANGED*
- Found some missing semicolons and put them back in the correct place
- Fixed an issue with a missing texture. Blame Lou for reporting it ;)
- Fixed an issue with 3den Radio when mod name was too long
- Fixed an issue which would cause some special items not to be added to an inventory via the Vehicle Inventory Manager
- Debug options now have another category called "Map". Every option in there will draw information on the map
- Various improvements to the translations
- Fixed a bug with debug options
- 3DEN Radio will no longer list CBA or ACE3 as music addon
- Fixed issue with Menu Strip items not getting removed if set in the preferences (https://github.com/R3voA3/3den-Enhanced/issues/194)

*REMOVED*
- Removed shortcut from recompile all functions tool


---
v6.0
*CHANGED*
- Vehicle Inventory Manager (VIM)
  - Is now able to create a full arsenal with selected addon items
  - Is using HashMaps where possible now to improve performance when many items are available
  - Fixed the issue where the amount would not properly be saved if inventory was set to be virtual
  - Ok button was renamed to Save. Pressing this button is the only way to save the currently set up inventory
  - Removed the dialog when resetting the inventory to default
  - Various visual tweaks
- Timeline in 3DEN Radio is now working correctly
- Fixed an issue with Feature Type attribute sometimes not working on DS
- Fixed an issue with the briefing attribute
- Changed "Enable Captive Mode" tooltip to better descripe the behaviour

---
v5.9
*ADDED*
- Added an attribute to change sound volume of environment sounds
- Added GUI to quickly view all Eden Editor shortcuts (ALT + F1)

*CHANGED*
- ChineseImp translation was updated
- Unit icons are now drawn above the unit
- Debug waypoints improvements
  - Marker text will only show the waypoint ID if nothing else changed compared to the previous marker
  - Markers are now connected by poly lines
  - Groups with only one waypoint e.g., units placed in the editor are now ignored (These changes should reduce the clutter on the map)
- Fixed rpt spam caused by 3den Radio if a song was in playlist but not available in-game anymore
- Batch Replace GUI has now a list with all vehicles to choose from. Pasting class names is still possible
- Batch Replace values are no longer saved persistently. They will be reset when the game is closed
- Fixed undefined variable in SRP code
- Fixed the height of some header controls
- Debug Options function will no longer run if not at least one action is activated
- Removed warning about custom userconfig
- Fixed left and right panel would be hidden by default
- Vanilla Config Viewer
  - Updated the design
  - Properties list can now be scrolled horizontally to view long values
- Texture Finder has an updated preview
- Slight performance improvement of the Inventory Manager
- Inventory Manager now also lists Oldman specific objects


---
v5.8
- Added a tool to display vehicle hitpoints. Useful for the Advance Damage attribute
- Added missing translations for Advanced Damage attribute

*CHANGED*
- Markers for 3D Path debugging are not oriented correctly
- Debug Option "Show FPS" is now in the "Draw" category
- Remove a debug message which was still left in code
- Updated overview text in Expansion Menu
- Fixed .rpt spam caused by missing translations
- DLC icons are not limited to 100m
- Draw functions optimized
- Fixed and issue with "Generate Steam Mission Description" function. It now auto pastes the description into the "Publish Scenario Window".     Additionally, it now supports all DLCs (Was fixed by a hotfix)

---
v5.7

*ADDED*
- It is now possible to customize the available functionalities though an OPTIONAL userconfig. See https://github.com/R3voA3/3den-Enhanced/wiki/Customisation
- Added editor setting Dynamic View Distance. It removes the need to change view distance inside the editor by changing view distance depending on camera height
- Briefing attribute
- Added option to log var names of entities to clipboard
- Added some separators to the context menu
- Added another separator to the menu strip -> tools -> utilities folder
- Added more icons for the hold action attribute
- Added a debug options to draw trigger areas during preview
- Added new Advanced Damage attribute to replace the old system. The new attribute gets all available hit points dynamically and adds attribute controls for them

*CHANGED*
- Batch Rename tool can now also rename markers
- Credits were moved to the 3den Enhanced Wiki
- FAQ was moved to the 3den Enhanced Wiki
- Column positions in 3DEN Camera Pos GUI were tweaked
- Various translation improvements
- It's now possible to search in the CfgSentences Browser if filter is set to "ALL"
- Documentation on GitHub has been updated
- Some internal functions have been hidden
- Fixed rpt spam caused by RscTestControlTypes and RscTestControlStyles (BI fix please? ;)  )
- Toggle DLC Icons runs now much faster and will not cause lag anymore
- Improved the way of exporting GUI base classes
- New logoSmall, logo and logoOver
- All log functions were merged into one function
- Fixed that Display3DENCopy would not have the correct height when using Log Object's Info function (BI fix please? ;)  )

- Attributes
  - Debug Path attribute is now part of debug options in Editor preferences
  - Merged onButtonDown code of attribute controls into onAttributeLoad functions
  - Added support to most attributes for localized text
  - Added missing tooltips for side toolbox controls
  - Feature Type and Terrain detail attribute controls were simplyfied
  - Task Patrol attribute uses an edit box now again to give the scenario editor more freedom
  - AI Features and AI Skill as well as Allow Fleeing attributes were merged into category AI
  - Editor Preferences are now using get3DENMissionAttribute instead of profileNamespace vars
  - Editable Objects (Zeus) would have an incorrect property name which would conflict with Dynamic Group attribute
  - Implementation for Debug Options in Eden Editor was changed
  - Fixed a bug which would cause the "Disable and Reset" button for the group marker attribute not to work
  - Size of Hold Action description has been slightly reduced
  - Map Indicator settings are now in the Misc category
  - All attributes now have "scriptName" defined for debugging
  - Added a Debug Tool to log all active scripts and mission EHs to .rpt
  - Text for Map Indicator attribute was improved
  - Visual appearance of many attributes were improved
  - Fixed Dynamic AI Skill attribute default value

- Inventory Manager
  - Fixed .rpt spam caused by the Inventory Manager
  - Fixed ACE items would not be properly sorted (Thanks to [KP] veteran29)
  - Fixed DLC icons would be incorrect if certain mods are loaded
  - Fixed item list box would sometimes not show items because it was scrolled down too far when selecting a different filter
  - Mines category was renamed to Explosives
  - Added localisation

- Texture Finder
  - Texture Finder is now faster. From 137 s down to 85 s to load all textures (Thanks to ConnorAU)
  - Another attempt to remove duplicated entries from Texture Finder (Thanks again to ConnorAU)
  - Texture Finder will now also scan arrays, thus find more textures (Thanks ConnorAU)
  - Texture Finder will now store textures in uiNamespace. That way it only has to search once
  - Progress text is now better formatted
  - Texture Finder now uses a CT_TREE with engine search
  - CTRL + F now focuses the search edit

- Functions Viewer
  - Functions Viewer is now the default functions viewer in the Debug Console (Will not overwrite button if Connor's Functions Viewer is loaded)
  - Functions Viewer can now view .inc and .hpp files as well as scripts used in missions and GUIs
  - Function list in Functions Viewer can now also be searched if functions are displayed as list
  - Behaviour of the "View on Biki" button in the Functions Viewer was improved
  - Functions counter in Functions Viewer works properly now also for campaign config and mission config
  - Open on Biki button in Functions Viewer is now actually a button instead of active text
  - Fixed a bug which would cause tree view control to be updated twice
  - It is now possible to toggle the left panel to increase space for code
  - Updated and added shortcuts
  - Last viewed file is now stored in profileNamespace. Restoring last viewed file is now reliable
  - Removed root entry (configFile, missionConfigFile and campaignConfigFile) from tree view
  - Mod icons are back due to recent optimisations
  - Fixed an issue with functions not being displayed if path definition was defined a bit differently (╯°□°）╯︵ ┻━┻)
  - Functions TAG is now always upper case

- 3DEN Radio
  - GUI was reworked
  - Search is now much faster
  - It is now possible to sort list by mods
  - List now also shows mod names
  - Added a timeline to the GUI
  - Some variables were moved from profileNamespace to uiNamespace
  - Help tooltip is now properly displayed
  - Music will now fade in slowly

- Variable Viewer
  - Columns of Variable Viewer can now be sorted
  - Loading the list is now ~four times faster
  - Fixed rpt 'spam 10:35:01 Bad conversion: bool' when opening the GUI (Thanks to Leopard20)
  - Fixed Variable Viewer not deselecting row on variable delete (Thanks to ConnorAU)

- Briefing Editor
  - Fixed missing localisation key

*REMOVED*
- Credits GUI and all related functions
- Unused functions and config entries

---
v5.6

*ADDED*
- Vehicle Inventory Manager
- Added support for 3den Enhanced - Optionals. It will allow users to hide attributes and menu strip entries. Thanks to Freddo3000 (https://github.com/Freddo3000) for the idea and the help
- It's now possible to search a function in the Functions Viewer for a specific keyword
- Added CfgSentences Browser

*CHANGED*
- Texture Finder will no longer list some textures multiple times
- Debug path attributes now uses is3DENPreview command to make sure it only runs in the editor
- Debug Options use is3DENPreview now
- Remove 3rdPartyTools folder from menu strip. Instead there is now a link to a Steam collection in the Help folder
- Removed obsolete stuff from configs
- Fixed missing string in 3den Radio
- 3DEN Cam Positions will now also show the time and date when the position was saved
- Fixed an issue in 3DEN Cam Positions which would show an error message when selecting a position
- German translation has recieved some fixes thanks to Mr-Melker
- Fixed a wrong condition in context menu causing some .rpt entries
- Fixed an issue which caused CTRL + X shortcut in the Functions Viewer to cause a script error
- Custom GUIs will no longer hide Eden Interface- Fixed a bug which would cause Grid Pattern to not work
- Increased max number of columns in Grid Pattern from 20 to 50
- Polish translation was updated by Krzyciu
- 3DEN Cam Positions will now properly display the tooltip for each entry
- Debug path attribute will only show for AI and player units now
- SPR Tickets attribute will only show for objectBrain
- Menu Strip was tidied up a bit

---
v5.5
*CHANGED*
- Italian translation was updated by zagor64bz
- Fixed a bug which caused Hold Action attribute to be always created in mission.sqm

---
v5.4

*CHANGED*
- Many translation tweaks, thanks to Poslovitch
- Fixed an issue with randomize directon tool

---
v5.3

*ADDED*

*CHANGED*
- ENH_fnc_setOrientation can now reverse and randomise directions
- "Show Radio Message" would be cut off in the extraction GUI
- Updated Spanish translation (Thanks to arv187)
- Tweaked some functions
- Several fixes for Single Player respawn
*REMOVED*
- remove obsolete functions

---
v5.2

*ADDED*
- Tool to export loadouts in config format (Prior this change it would export in format of CfgRespawnInventory)
- Added tool to quickly export mission parameters (https://community.bistudio.com/wiki/Arma_3_Mission_Parameters)

*CHANGED*
- It's no longer possible to switch to a unit which is about to respawn (Single Player Revive)
- Optimized Make Hostage attribute condition
- Handling of location list was changed
- Measure distance function now used ENH_fnc_floatToTime function
- Removed black in / black out effect when Eden Camera is set to custom position
- Renamed former "Export Loadout (Config)" to "Export Loadout (CfgRespawnInventory)
- Left and right arrows of custom slider controls now properly change the slider value
- Tweaked several attribute controls
- Improved localisations
- Added a delay before resetting captive mode on respawn (Single Player Respawn), to prevent the unit to be shot instantly again on respawn before they exit the animation
- Fixed some RPT spam
- Increase GUI height of Placement Tools

*REMOVED*
- removed some old, obsolete functions

---
v5.1

*ADDED*
- Added Single Player Respawn
- Added debug option to skip time
- Added debug option to change time multiplier
- Added Variable Browser to debug options

*CHANGED*
- Debug options are now using BIS_fnc_holdAction
- Updated icon for debug options and tweaked several values
- Lenght of "laser beams" indicating view and aiming direction was shortened
- Mission ending attribute control was using EDIT_W_WIDE instead of EDIT_W resulting in slightly incorrect positioning
- Disabled ENH_DoStop in multiplayer https://github.com/R3voA3/3den-Enhanced/issues/85
- Changed attribute conditions from condition && condition to condition && code for best performance
- Fixed an issue where Hold Action attribute settings would not be saved
- Fixed an issue which caused Ambient Flyby and Airdrop attribute to be added to the mission.sqm unintentionally
- Debug option Teleport now teleports the player to the position at the center of the action icon
- Mission Ending attribute was only counting units killed by a player

---
v5.0

*ADDED*
- Context menu tool to move camera into first person view of selected entity
- Added shortcuts to GUIs to preview controls styles and types (menu strip)
- Added Debug Option to draw icons of nearby units and vehicles together with some basic information
- Added Debug Option to show waypoints of all group on the map
- Added Debug Option to enable unlimited ammo
- Added Debug Option to disable reload time
- Added Debug Option to draw view and aiming pos of AI
- Added Debug Option to teleport in 3D space
- Added Debug Option to disable weapon recoil
- Added Debug Option to disable weapon sway
- Added option to collapse asset browser (right panel) on startup
- Added option to collapse entity list (left panel) on startup
- Added option to hide left and rigt panel on startup

*CHANGED*
- 3DEN Camera Positions UI now properly checks for incorrect description
- Icons updated
- Texture Finder
  - Will now search ~200.000 classes instead of ~30.000 for textures and images
  - Added search to Texture Finder tool
  - Optimized Texture Finder functions to be more performant (Thanks to shukari)
  - Search is now automatically started when UI is opened
  - Improved filter, now all none textures/images should be removed
  - Added progress bar to show listbox status
  - Update list button is now disable while list is updating
- Small improvements of the 3den Radio GUI
- Some general cleanup
- Fixed some typos in translation
- Batch Replace GUI will now properly display German localisation
- Added missing German Translations
- Hold Action and Ambient Animation attribute will no longer be written to mission.sqm for every entity which results in greatly reduced file sizes. Keep in mind that if the attribute was set once, it will remain in the mission.sqm even when reset to default values
- The menu for 3rd party tools was overhauled
- The airdrop attribute had a missplaced control
- The On Mission Debug attribute was overhauled
- German translation is now again 100% completed
- German translation was greatly polished and made consistent
- Description of Mission Ending attribute is now fully displayed when German localisation is shown
- Input description of Classname_1 Classname_2 Classname_3 Classname_n is now consistent throughout all controls
- Fixed Patrol tooltip. (Was showing -1 to disable instead of 0)
- Debug option Disable Stamina and Invincibility are now activated for all units in player's group
- Kill cursorObject is now only showing if cursorObject is not null
- Briefing Editor showed the wrong message when pressing the export button
- Module Information GUI got tweaked so that the description doesn't extent over the bottom of the control
- Fill Area tools max area was increased from 500x500 to 10.000 by 10.000

---
v4.9

*ADDED*
- menu strip entry for additional 3rd party tools
- a UI to save 3den Camera positions in. You can use it to save interesting places

---
v4.8
*CHANGED*
- updated Spanish translation by arv187

---
v4.7

*ADDED*
- an attribute to disable AIs radio protocol

*CHANGED*
- fixed mission semicolons in some configs
- units using ambient animation will now reliably exit their animation if enemies are nearby

---
v4.6
*CHANGED*
- fixed incorrect labeling of Dynamic Skill controls
- added check to prevent player from exiting hostage state

---
v4.5
*CHANGED*
- animations will now be exited when unit enters combat mode

---
v4.4
*CHANGED*
- fixed Log position 3D tool
- fixed Log classes as string tool
- improved performance of functions viewer

---
v4.3

*ADDED*
- Scenario Attributes Manager
- Link to Mission Optimisation Biki page
- DisableAI "radioprotocol"
- Attribute to end mission after certain number of units of given side were killed (e.g. civilian casualties)
- Added Editor Attribute to toggle Entity Counter in status bar- Added a tool to quickly toggle simulation of selected objects
- Added a tool to quickly setup a simple extraction
- Script Commands Viewer to menu strip -> tools -> utilities
- A function to convert floats to time format minutes:seconds

*CHANGED*
- Combo Box controls were replaced with Toolbox controls if possible
- Code cleanup
- Debug console now uses CTRL+D as shortcut (Same as CBA)
- Tweaked visuals of custom GUIs (Sliders, Background)
- Awareness attribute now uses hintSilent instead of custom display
- Some attributes showed wrong tooltips
- Functions Viewer can now be accessed by pressing ALT + F (Same as CBA)
- Config viewer can now be opened by pressing ALT + C
- GUIs use Eden Editor controls now
- 3den Radio got a new design
- Fixed some issues with 3den Radio sometimes not playing music
- Texture finder won't display a texture on start up
- Module Information GUI got some visual tweaks
- Texture Finder has now a filter option
- Batch Replace GUI would not save last used value correctly
- Tweaked layout of Batch Replace GUI
- Tweaked layout for Texture Finder
- Almost all GUIs use Pixel Grid System now and scale correctly
- Layouts of various GUIs were improved
- Functions of various GUIs were improved
- Updated Russian translation thanks to lexx__1
- Improved height of attribute control groups and positioning of controls
- Group Marker attribute has got a new attribute control and more options
- Moved code for attribute controls into functions library
- Establishing Shot attribute was overhauled and optimized
- Ambient Flyby attribute was overhauled and optimized
- Intro Text attribute was overhauled and optimized
- Airdrop Shot attribute was overhauled and optimized
- Some attributes have now a button to reset and disable them- All substantial attributes have now got their own attribute control, therefore no unnecessary missionNamespace variables are declared- All mission attribute are now collapsed by default
- Fixed various missing semicolons
- Fixed an issue where Preview Debug options would not apply to player when option "Play the Character" was used to preview the scenario
- Changed 3den notification for ENH_fnc_loadoutTools
- Added various new internal macros
- All substantial attributes now have a proper description of what they do, and links to further information if available- Rearanged some scenario attributes
- Intro text attribute now supports BIS_fnc_infoText
- Intro text attribute has a new control with images to select the  intro type
- Values of Dynamic skill attributes are now handled by attribute control and not writting into mission namespace variables
- FunctionsViewer
  - Functions Viewer features now several different modes for sorting functions
  - Functions were rewritten
  - Shows number of available functions
  - Added button which leads to corresponding Biki page of the function (Keep in mind that not all functions might be documented there)
  - Functions viewer is now available in the debug console, together with the vanilla one. See the "fx" icon in the top right corner
    This also solves the issue where 3den Enhanced was incompatible with Extended Debug Console by Connor
  - Every function now shows the logo of the mod it was introduced with
  - Functions Viewer now uses pixel grid system
  - Fixed an issue where recompiling selected function wasn't possible
  - Removed X button and replaced it with the close button in the lower right corner to be consitent with all other UIs in Eden Editor
  - Functions Viewer shows mod icons again
  - Functions Viewer now displays line numbers

- Updated and revised Czech translation thanks to XerXesCZ
- Most functions which interact with eden entities will now exit and show a notification if no entities are selected
- Merged serveral functions into one
- Removed ENH_fnc_logMissionAttributes
- Placement Tools GUI now also supports setting of object orientation
- Added fine control to Placement Tools GUI
- Batch Replace GUI is now only opened when objects are selected
- Center of Placement Tools will now stay the same until reset- Replaced waitUntil {time > x} with sleep x to prevent inconsistencies in multiplier- Old garrison UI is back
- Added hold action attribute (WIP)
- Fixed feature type attribute would use incorrect data type
- Ambient Animation attribute uses Listbox control instead of Combobox control
- Ambient Animation attribute was overhauled, it now works in multiplayer
- Fixed an issue where Intro Text would be displayed immediately on dedicated server (delay was ignored)
- Added more ambient animations
- Ambient animations are now properly initialized when a new terrain or mission is loaded
- Time Multiplier will no longer be executed when value is 1
- Updated credits
- Task Patrol attribute now uses a slider control
- Logging of multiple map grid positions is now possible. Only unique value will be logged
- Faction are now logged to clipboard without [ ]
- Added context menu enty to log classes in format "class1", "class2",..- Added new folder to menu strip
- Added option to garrision tool to change stance of units
- Fixed missing shortcuts for some tools
- Fixed Switch Time would not properly set overcast, rain and fog to 0. Change is forced now- Song duration in 3den Radio is no displayed in format minutes:seconds (00:00)

*REMOVED*
- Import/Export scenario attributes. Scenario Attribute Manager takes care of that now
- Removed on Event Code Attributes (Too complex for a simple attribute)
- Colour Picker was removed. Use https://forums.bohemia.net/forums/topic/222104-color-picker/ instead
- Removed weapon sway and recoil attribute due to issues on dedicated server



---
v4.2

*ADDED*

*CHANGED*
- updated credits
- Briefing Editor: If marker has no name, the variable name is displayed instead
- Condition for Airdrop attribute is now checked every second. Instead of every frame
- Updated polish translation
- Exporting inventory to config is now possible with GUI
- Shortcut for Remove Vest tool was removed because it was blocking a default Eden action
- Functions Viewer performs better now
- Debug Console now uses the Eden Enhanced Functions Viewer
- ENH_fnc_FunctionsViewer was split into multiple function files

*REMOVED*
- Export Inventory to Config GUI->Wasn't needed any longer
- Removed obsolete Icons

*known Issues*
- Event Code Attribute does not work on dedicated servers
- Stay on Position attribute sometimes fails on dedicated server

---
v4.1

*ADDED*
- tools to remove heargear, googles and weapons from characters
- tool to generate mission description for the Steam page (Steam formatting is not supported because A3 does not support it)
- Move to To-do List attribute for comments
- Link to ARMAnet Eden Editor tutorial to the help section
- Brand new Placement Tools GUI

*CHANGED*
- Debug Path attribute now also draws map markers
- Log Mission Attributes was moved from the context menu to the menu strip
- some localisation tweaks
- Dynamic AI Skill attribute now uses Sliders instead of edit boxes
- Distance in between marker of the Debug Path attribute was increased from 5 m to 20 m
- default value for the Establishing Shot attribute
- In the menu strip, the vanilla Functions Viewer was replaced by the 3den Enhanced Functions Viewer
- It's now possible to add markers in the Briefing Editor by double clicking on the marker list
- Briefing editor listboxes now have tooltips, explaining the controls
- The height set in the Airdrop attribute has now a small variance to prevent all units to touch the ground at the same time
- Optimized attribute controls
- Updated link to Scripting for Beginners help. (The old one was from 2013)
- fixed a bug which caused dynamic AI skill to not work if default values were used
- Ambient Flyby does now use a vanilla control to set the speed
- Ambient Flyby attribute now has default values to fall back to
- It's now possible to export scenarios to sqf which were build with 3den Enhanced
- Visibility attribute is now unlocked for all entities
- Arsenal attribute is now unlocked for all entities
- Complete Overhaul of the Placement Tools GUI
- Garrison Buildings was removed from Context Menu and integrated into the new Placement Tools GUI
- many GUI related function tweaks
- ... from translation have been removed. Entries use opensNewWindowAttribute now
- remove ... from folders. They do not open a new window
- Function used for the Location List was completely overhauled
- Ambient Flyby attribute was overhauled, it can no be disabled by a missionNamespace variable, see tooltip



*REMOVED*

*known Issues*
- Event Code Attribute does not work on dedicated servers
- Stay on Position attribute sometimes fails on dedicated server


---
v4.0

*ADDED*

*CHANGED*
- Feature Type attribute would sometimes cause issues because of wrong datatype. Type STRING and NUMBER can now be handled for backwards compatibility
- Readded Stay on Position attribute

*REMOVED*

*known Issues*
- Event Code Attribute does not work on dedicated servers
- Stay on Position attribute sometime fails on dedicated server

---
v3.9

*ADDED*
- diableAI "NVG" attribute
- disable AI "LIGHTS" attribute

*CHANGED*
- updated translation, thanks to IllidanS4

*REMOVED*
- Stay on Position attribute. It was not behaving as expected
*known Issues*
- Event Code Attribute does not work on dedicated servers

---
v3.8

*ADDED*
- Polish translation by Kofeina101

*CHANGED*
- reduced distance from which a hostage can be freed from 15m to 2m
- if the hostage is dead, it cannot be freed anymore
- some localisation fixes
- Changed shortcut CTRL+Q to CTRL+P to prevent issues with another mod
- Credits have they own UI now because CfgORBAT wouldn't work sometimes
- it's now possible to measure distance between two entities

---
v3.7

*ADDED*
- translation of credits

*CHANGED*
- expanded French translation thanks to pokertour
- Updated some French, Czech and Chinesesimple thanks to TaktischerSpeck
- name of the pbo changed from 3den Enhanced to 3den_enhanced to prevent a crash on linux server (Thanks to Dedmen)

---
v3.6

*ADDED*
- added new function ENH_fnc_all3DENSelected
- a control to the statusbar which shows number of selected entities
- a tool to export and import mission attributes
- an airdrop mission attribute
- many missing translations
- new function ENH_fnc_exportWithLB

*CHANGED*
- some shortcuts were changed for pattern tools
- improved translation of some context menu entries
- order of some context menu entries was changed
- log 3DEN Entity IDs now logs ids of all selected objects
- tool in menu strip are now sorted alphabetically
- new tool folder "GUI Tools"
- updated credits
- updates translation
- Spanish translation was updated by "TaktischerSpeck"
- updated all log functions
- 3den Enhanced function viewer now correctly restores last viewed function

*REMOVED*
- removed obsolete functions
- show mission stats tool. It's now in the statusbar

---
v3.5
*CHANGED*
- added "A3_Data_F_Sams_Loadorder" to CfgPatches to prevent overwriting of config entries

*ADDED*
- added link to 3den Enhanced Youtube videos (Menu Strip -> About 3den Enhanced)
- added Action Creator GUI
- Added Path Debugging attribute

---
v3.4
*CHANGED*
- added missing semicolon
- chinese translation was added by Jason Bert
- updated credits
- on preview debug attribute state was not shared between different missions

*ADDED*
- loadout tool to remove NVGs from several units at once
- loadout tool to remove vests from several units at once
- added link to 3den Enhanced Youtube videos (Menu Strip -> About 3den Enhanced)
- added Action Creator GUI
- Added Path Debugging attribute

---
v3.3
*CHANGED*
- some shortcuts were interfering with vanilla shortcuts

---
v3.2
*CHANGED*
- fixed some issues with new shortcuts

---
v3.1

*ADDED*
- added missing attribute to disable map indicators
- respawn tickets for civilian side
- 3den Radio has got an incremental seach now
- 3den Enhanced is now using the CBA versioning system (Only if CBA is used)
- new functions viewer with incremental search, new design, tree view etc
*CHANGED*
- Log object info tool has been overhauled and uses display3denCopy now
- pattern tools can now be used multiple times without reloading the GUI
- serveral logic errors in pattern tools GUI and its functions
- the export loadout to config tool has got a GUI now- some minor function improvements
- 3den Radio functionalities were mostly rewritten to solve serveral issues and make code more efficient
- readded server key
- All GUIs are now using the BackgroundDisable and BackgroundDisableTiles controls
- Select Image GUI when publishing a mission to steam has been widened to allow the ctrlTree to expand further
- Some general GUI overhauls
- Many shortcuts have been updated. Check the Menu Strip for the new shortcuts
    - briefing editor shortcut was changed from CTRL + B to ALT + B
    - Texture Finder can now be opened by pretting ALT + T
    - Grid, Line, Grid & Circular Pattern tools can now be opened by a shortcut    - Clear chat can now be performed by pressing ALT + CTRL + C
    - all debug tools have got a shortcut now
    - Loadout tools can now be accessed by CTRL + SHIFT shortcuts
    - Many shortcuts have been updated. Check the Menu Strip for the new shortcuts
- Added search icon next to search edit control in 3den Radio
- 3den Radio will now loop through playlist again one enabled

*REMOVED*
- disable team switch attribute, it's already available in the multiplayer attribute section
- obsolete functions

*TRANSLATION*
- removed obsolete translations
- changed German translation of respawn tickets
- improved german translation of task patrol tooltip
- many stringtable entries have been renamed to make them more consistent
- fixed some translations
- a few missing translations in the menu strip
- missing 3den Radio translation

---
v3.0.01
- added new logo (Steam)

---
v3.0

*ADDED*
- credits (Menu Strip -> About 3den Enhanced -> Credits...) Shows all contributors. If I forgot about someone please let me know- added tool to log map grid position to clipboard

*CHANGED*
- some base defines clean up
- Right-clicking on a group icon will now also show "Garrison Buildings..."
- Log 3den Entity ID is now available for all Eden entities
- Conditions for context menu entries were improved e.g, "Log Positions (3D) won't show for markers"
- improved save loadout attribute (code) //Needs testing!
- improved code (save loadout)
- improved code (introText)
- improved code (visual settings)
- improved code (establishing shot)
- updated localisation
- new mod logo/icon
- DebugOptions - Player was not able to edit objects in Zeus interface

*REMOVED*
- obsolete function


---
v2.9

*ADDED*
- link to FAQ

---
v2.8
*CHANGED*
- fixed error message caused by the visibility attribute
- improved disableAI attribute expression, thanks to shukari
- fixed issue with Eden removing Zeus in multiplayer
- some improvements to translation
- functions overview shows now functions sorted by functionality
- replaced icons in menu strip to indicate folders better
- session timer was not working after preview ended

*ADDED*
- menu strip tool to quickly toggle simple object state
- context menu tool to log 2D positions of selected entites to clipboard
- added help entry for description.ext
- "About 3den++" menu strip category

*REMOVED*
- removed "Export Arsenal Templates" was not ment to be released
- tool to grab compositions (Was not working reliably)
- removed changelog UI
- Youtube links. Most content was outdated. If you have suggestions for good up-to-date video tutorials let me know!
- removed assets overview from help menu. It's quicker to just search for object directly within the Eden interface
- obsolete function call via Eden EH

---
v2.7

*ADDED*
- it's now possible to either export GUI base classes of Eden, default or all
- added missing translation
- tool to quickly clear chat. Very handy when debugging via systemChat in the Editor
- tool to quickly delete all empty layers
- added grid pattern tool
- added tool to export all Arsenal loadout templates for backup
- On preview debug (Those settings will only work during mission preview and won't influence the published scenario)
  - show all units on map
  - disable damage
  - toggle captive mode
  - enable bullet tracing
  - enable Virtual Garage
  - enable Virtual Arsenal
  - disable stamina
  - enable Zeus
  - show awareness of all sides
  - options to quickly kill all units of given side during scenario preview

*CHANGED*
- removed obsolete function call from ENH_Changelog GUI
- Changed/removed some icons from menu strip
- reordered menu strip tools for easier access
- fixed alot of missing/incorrect translations(German)
- The debug tool "Log Game Info" will now also copy the list of mods used
- some improvements to the location list
- increased size of Module Description GUI to improve legibility
- GUI of pattern tools was improved. Unused controls are now 50% faded and disabled. Used controls are now focused when GUI is opened for quicker usage- some config cleanup
- translation cleanup
- translation improvements

*REMOVED*
- export/import camera parameters (Functionality is available through the vanilla "Splendid Camera")
- obsolete translations
- FPS gauge in Eden (It's available now during preview)
- removed debug triggers (They are available now during preview, see "Preferences")

---
v2.6

*ADDED*
- tool to export selected Eden objects to sqf format(Thanks to Theassassinzz for sharing)
- context menu function to show Eden entity ID
- attribute to remove entity from garbage collector
- the location list has been expanded and now shows more points of interest


*CHANGED*
- AI will now exit animations when damaged or in combat mode
- fixed issue with garrison function not detecting building positions in some cases (Thanks to http://steamcommunity.com/id/Aestheticwww)
- several translation improvements
- fixed FPS Gauge and session timer would not work when a scenario was loaded or created
- improved appearance of combo box control types
- some config cleanup
- measure distance functionality was rewritten and improved:
  If distance is measured in 3D view, then a line is drawn from point A to B showing the direct path
  If map is opened, then markers are drawn from point A to B showing the direct path
- several menu entriess were missing "..." to indicate they are opening a new window

---
v2.5

*ADDED*
- attribute which adds all alive entities to allCurators regulary during a mission
- colour picker. Can be found in the debug tools category
- attribute to disable team switch
- attribute to disable mine detection for AI units
- attribute to disable weapon aim for AI units
- attribute to add a flag to vehicles, units and flag poles
- attribute to prevent AI from moving into position at the beginning on missions
- context menu entry to quickly group selected entities to the player unit
- translation for debug triggers

*CHANGED*
- some default attribute values
- pattern tools feature has got its own GUI now
- some attributes are now hidden where not appropriate
- fixed misleading translation
- all functions were sorted into proper categories
- some performance improvements of the 3den Radio code
- improved some translations
- improved reveal code (debug trigger)
- updated Czech translation, thanks to XerXesCZ

*REMOVED*
- pattern tool settings from preferences menu
- some functions became obsolete with the new pattern tool GUI
- removed "Stay on road" attribute (The command seems to not have the desired effect and causes more issues)
- hide terrain objects trigger (There is a vanilla module for this)

---
v2.4
*CHANGED*
- "Arsenal" and "Add Gun Light" attributes were missing there default values

---
v2.3

*CHANGED*
- "Arsenal" and "Add Gun Light" attribute should not be activated by default


---
v2.2

*ADDED*
- tool to log positions of multiple objects

*CHANGED*
- garrison function feature now a custom UI
- ENH_fnc_garrisonNearest.sqf has been improved
- one wasn't able to play a song from the playlist via double click
- "Measure Distance" tool now also works when the map is opened
- "Establishing Shot" attribute has been overhauled and should now be less performance hungry and more reliable

*REMOVED*
- garrison settings were removed from the preferences menu
- removed obsolete controls
- removed "Remove x items" attributes. Conflict with Eden editor behaviour

---
v2.1
*CHANGED*
- replaced 3den Radio defines with variables to improve performance
- changelog can now be viewed in game (Menu Strip -> Help -> 3den Enhanced Changelog)
- added shortcut for opening 3den Radio (ALT-R)
- removed some obsolete config definitions
- removed some ugly or unused icons
- config clean up
- logoSmall.paa and logo.paa are now packed
- "batch naming" features now a GUI, making the naming of large quantities of entities much quicker
- new mod logo & picture

*REMOVED*
- removed batch naming from preferences


v2
*CHANGED*
- updated Spanish translation (kudos to arv187)
- fixed some log entries
- volume of 3den Radio can no be controlled more precisely via the arrows
- overhauled the intro text mission attribute
- 3den Radio overhaul
- complete overhaul of the briefing editor, added expression, image width and heigth. Fixed scaling issues, improved code & layout
- all custom UIs are now using the same defines in order to make them consistent
- various translation tweaks

*REMOVED*


---
v1.9

*ADDED*
- attribute to set weapon sway coef
- tool to quickly name multiple entities
- debug trigger for healing and repairing
- attribute to set the feature type
- ambient animations. They only work in single player now and can be found in the "State" category- added Arma 3 Utilities (Thanks to KK for those awesome tools)
- added attribute to set weapon recoil coef
- addes spanish translation (kudos to arv187)



*CHANGED*
- debug trigger "Toggle Invulnerability" is now using isDamageAllowed and also applies to player vehicle
- fixed error when debug trigger "Reveal Units" was activated twice within short time
- briefing editor can now be securily be closed by pressing Ctrl + B or ESC
- A new template can now be loaded by double clicking on the template list, preventing unwanted loading and overwriting
- improved code behind time multiplier control

*REMOVED*



---
v1.8

*ADDED*
- scripting examples by Foxhound International (Help section)
- readded the UAV intro (establishing shot), hopefully working more reliably than before
- the intro text attribute now supports a new type of intro text used in the Apex Protocol campaign
- readded the "hide terrain objects" context menu entry
- added tool to export GUI base classes (debug tool)
- added tool to view default GUI Grids (debug tool)
- added tool to delete vehicle crews quickly
- added link to Gunter Severloh's Ai Compilation List
- added Czech translation  thanks to XerXesCZ
- added French translation thanks to Artenis
- new tool to create "debug triggers" to make testing missions easier for beginners

*CHANGED*
- fixed issue with invisible logic creation causing low FPS in missions with many players
- improved random patrol function
- sound volume and random music attribute will no longer run on headless clients
- various tooltip improvements
- the log faction names tool was moved from the menu strip to the context menu
- tools in the menu strip are now better sorted
- some tool icons were improved/changed
- improved measure-distance function
- fixed the reverse direction tool
- serveral small improvements to the briefing editor functions
- line pattern tool will no longer change the rotation
- value of the FPS gauge is now rounded
- FPS gauge is now updated every second instead of every 1/2 second
- default value of the 3DEN Radio volume was changed from 100% to 25%
- preference menu was overhauled
- default values for the tools were tweaked to make more sense
- fill area tools will now use screen center as origin
- garrison radius attribute is now using a edit control
- multiple improvements of tooltips and display names
- most placement tools can now be accessed via CTRL + numpad
- circular pattern tool uses now center of the screen as initial position
- improved session timer code
- custom status bar controls have now the same visual style as the vanilla controls
- mission stats tool now displays the number of simple objects
- context menu entries are now only shown when necessary
- improved tooltip for the "on event" attributes
- game info tool now also logs architecture (x64, x86)
- fixed missing localisation when using the garrison function
- removed obsolete variable from fn_getModuleDescription.sqf
- toggle Map IDs would only work when the map was opened manually beforehand
- 3den Radio was overhauled and can now be controlled via a custom GUI
- improved position of session timer (Should not overlap with other controls anymore)
- improved German translation (thanks to KiritoKun223)
- units traits attribute is now using a new control type
- garrison radius is now using a new control type
- random patrol was renamed to Task Patrol and moved to the group attributes
- task patrol is now using BIS_fnc_taskPatrol
- updated stringtable.xml

*REMOVED*
- tutorials
- preload arsenal settings
- warning messages
- set z = 0 tool (It's available in the context menu -> transform)
- log class name tool (Functionality already exists)
- ambient animations (Too many issues in multiplayer and general incompatibility with Eden)

---
v1.7

*ADDED*
- tool to display module description
- save gear on respawn (readded)

*CHANGED*
- fixed issue with toggle grass function
- fixed the dynamic group attribute
- a few new help links

---
v1.6 HOTFIX

*CHANGED*
- warning messages would not be displayed properly
- added missing server key

---
v1.6
*CHANGED*
- fixed position of song name display
- display for name of currently played song is now integrated into the EDEN statusbar, should  now properly scale with different resolutions and display sizes
- improved delay attribute for intro text
- some config clean-up
- improved behaviour and speed mode control of random patrol
- improved speed mode control for ambient flyby
- improved some tooltips
- fixed bug caused by event att- fixed some inconsistencies in the configs
- various improvements to the Random Patrol code with the goal to improve reliability
- replaced some of my own translations with ones from BIS
- improved code of remove NVG attribute
- various function improvements
- improve unit traits attribute (Attribute needs to be saved once, to apply the new values)
- advanced skill was missing its Enh TAG
- fixed issue where the garrison function would sometimes recieve a wrong data type
- added tutorial for the garrison functionality
- added ... to all menu strip entry which open a subfolder or new page. Mainly to be on par with the BIS design guidelines
- new icon for the tools folder
- Free Hostage action is now using the vanilla hold action system
- unit which has the "Make Hostage" att. enabled, will now automatically change its animation in Eden
- ambient animation should now work in mp again as expected (fingers crossed)
- sorted all tools into new folders
- improved shortcuts for tools and context menu entries
- some more stringtable cleanup
- some more function improvements
- waypoints of the random patrol attribute are not visibel anymore
- The Log Game Info tool now also exports information about the resolution and UI scale
- all translations are now tagged with "ENH" to make them unique
- serveral localisation tweaks
- serveral tweaks to the random patrol function (random patrol attribute)
- fixed an issue with grass not being visible
- the code for all mission attribute was overhauled. It should now properly execute for each JIP player without effecting players which were ingame already

*ADDED*
- added tool to set all selected entities to ATL/ASL 0
- select new song button for the 3den Radio (Implemented into the status bar)
- one can now set the combat mode and formation of a random patrol
- current song name played by 3DEN Radio is now display as a tooltip in the status bar
- added disableAI "Path"
- added tutorial for the garrison function
- added tutorial for 3den Radio
- added shortcuts for various tools and context menu entries
- added help entry redirecting to youtube tutorials
- a warning message is now shown when patrol radius is smaller than 51 m to prevent unexpected behaviour- session timer
- a tool to show amount of objects placed in a mission
- a new tool which retrieves all product information and formats it so it can directly be used inside a bug report etc- added help link to KK's Blog
- added Briefing Editor
- added loadout tool. Select one or multiple units and use the "Copy Loadout" tool. Then select the units you want the loadout to apply to. If multiply loadouts were saved. A random one will be selected for each unit
- warning message when new scenario is opened (If accepted it won't appear again)
- added tool to measure distance2D, 3D and travel time between two points
- added tool to quickly place units in a line
- added tool to quickly reverse direction of selected units
- added circular pattern tool
- add tool to quickly change mission time to daylight for editing, using the tool again, will reset the time back to where it was. Does not effect the original time set via the intel attribute
- added tools to change orientation of selected objects to exactly north, east, west or south
- added help entry which links to the Mission Presentation Wiki page
- context menu entry to set player as trigger owner of selected trigger/s
- added help entry which links to kylania's scripting examples
- moved help entries into seperated folders
- attribute to force unit to walk
- tool to quickly export inventory of selected units in a config format used for CfgRespawnInventory
- added version attribute to CfgPatches for internal use
- improve the way the dev branch warning is displayed
- added tool to display FPS while in Eden
- added a tool to export and import eden camera params, like position, direction and pitch/bank. Mainly for debug purpose, but be creative  The output can also be pasted into BIS' Splendid Camera
- added tool to quickly toggle Grass on/off (This will not effect the mission in any way)

*REMOVED*
- removed suppression level att- removed fatigue level att- removed obsolete entries from the stringtable.xml
- removed side attribute from ambient fly by (Will always be civilian anyway)
- removed rainbow att. (Functionality was not 100% clear to the user)
- removed "hide map object" context menu entry (The code is not properly optimised and reliable yet)
- clear vehicle cargo att. A vanilla solution got introduced
- removed unit insignia attribute. A vanilla solution got introduced
- removed advanced fog settings. A vanilla solution got introduced
- remove stance att. A vanilla solution got introduced
- advanced ending attribute (Needs further testing)
- unit marker attribute (Not reliable)
- establishing shot attribute (Not mp compatible, most likely not fixable)
- removed save gear multiplayer attribute (on respawn the gear set in Eden is not automatically reapplied)
- duplicated entry in stringtable.xml
- removed some none-working animations


---
v1.5

*CHANGED*
- CfgPatches was changed to the up-to-date format
- 3den Enhanced tools now have their own folder
- Default insignia is an empty string now
- Some code improvements for the insignia control
- Overhauled most control configs
- Fixed script error which would appear when 3den preferences were not confirmed and the garrison function was used
- Replaced garrisonRadius combobox with slider control
- Fixed aspec ratio of loiter attribute
- Reduced size of insignia attribute (Please report any issues, controls might overlap)
- Moved most of the code from control configs to global functions
- Preferences are now applied when a preview ends, or a new scenario is created- Ambient animation attribute is now easier to use:
  - 	To change the type of animation, simply select the new one and press Ok. The new animation is instantly applied    In older versions, one had to deactivate the animation first- Activate checkbox from ambient animation att. removed, is now handled by the animation type checkbox (Above changes also apply to ambient combat animation att.)
NOTE: There are still quite a few bugs with the ambient anims. However, those I most likely will never be able to solve. We simply need a better BIS function- Improved code execution for multiplayer missions (Thanks to KK for his note on the remoteExec wiki page)
- Respawn tickets are now not always set to 0 when untouched
- Corrected some localisations
- Blacklisted another music track in the playMusic fnc
- Improved advanced fog attribute
- Replaced custom control for view distance att. with a edit box
- Improved view distance code
- All class names are not using the Enh TAG- Removed activate checkbox from intro text attribute. It can not be disable by leaving the delay undefined(empty)
- Changed config name of save gear attribute
- Improved code for hide terrain object trigger
- improve ENH_fnc_playMusic, it now filters out classes which have no soundtrack defined and it's slightly faster
- Insignias are now also read from the local missionConfigfile

*ADDED*
- Tool to recompile functions
- Five animations
- Several new functions for internal use
- Attribute to deactivate thermal optics for given vehicle
- Attribute to deactivate night vision optics for given vehicle
- Added tool to quickly export faction names
- Added icon for "log" context menu folder
- Added icon for "3den Enhanced" tool folder
- Added attribute for OnKilledEvent
- Added attribute for OnRespawnEvent
- Added attribute for OnDamagedEvent
- Added attribute to set the fleeing value for a unit
- Added unit marker attribute
- Flyby mission attribute
- Added setMass attribute
- Added advanced briefing att
---
v1.4

*CHANGED*
- fixed position of time multiplier attribute
- time multiplier edit box is now properly formatted
- fixed position of song name display
- fixed position of view distance setting attribute
- removed some obsolete code from control configs

*ADDED*
- added attribute for rainbow probability
- added insignia attribute
- added preference attribute to enable preloading of the Arsenal -> Preferences-> Misc

*TRANSLATION*
- added translation for rainbow attribute
- added translation for insignia attribute
- corrected camouCoef & audibleCoef tooltip

---
v1.3.1

*CHANGED*
- fixed a bug which would reset the unit traits controls

---
v1.3

*ADDED*
- one can now define a delay for the intro text attribute
- attribute for unit traits

- added hostage attribute:
  A unit can now be taken hostage. Every player including JIP will have an action to free the Hostage  Mission designers can check whether the unit is hostage or not by retrieving the following variable:
  _unit getVariable "ENH_isHostage"; (true, is hostage/false, isn't hostage)

*CHANGED*
- UAV intro center position attribute tooltip was using a wrong string
- removed the tooltip from Advanced Damage Attributes
- UAV intro loiter direction is now using a better control

*TRANSLATION*
- added German translation for "Hide Map Objects" context menu entry
- added German translation for unit traits attribute
- added German translation for intro text delay
- updated French translation (thanks to solentis)

---
v1.2.1
- completely overhauled the garrison function
1. Select the units/objects you want to place in houses and place them near the buildings
2. Open the Context menu (right click on one of the selected units) -> select Edit -> Garrison Buildings
3. Objects/Units will now be automatically be placed inside buildings, you'll recieve a msg in case some units/objects could no be placed
4. The size and coverage of the area can be changed in the preferences menu of Eden

---
v1.2

*ADDED*
- function to quickly garrison placed building. Settings can be changed in the preferences
- attribute to toggle map object IDs on/off
- attribute to turn off/on vehicles engines
- English, German and Italian (partially) translation
- attribute to disable BIS revive for specific units
- attribute to remove all FAKs from a unit
- mission attribute to initialise BIS Dynamic Groups
- mission attribute to create an establishing shot
- mission attribute for display text on mission start
- currently played song of the playMusic preference attribute is now displayed at the bottom of the screen
- attribute to play random music at the beginning of the mission -> Scenario Attributs -> Music, Sound & Radiosettings
- attribute to set respawn tickets for all sides
- version check. Player will now recieve a warning if game version is greater than required version and dev branch is used
- version check function
- french translation

*CHANGED*
- added check to prevent vanilla fog to be overwritten by advanced fog
- music loop is not restarted every time the preference settings are confirmed
- some attributes were executed where not needed
- completely overhauled the task patrol attribute, one can now set the number of waypoints, radius of the area, behaviour of unit/group, and speed of unit/group
- removed an unwanted radio sound from playMusic function
- all functions, variables and attribute properties are now using the same tag (ENH_)
- various function improvements
- some categories where renamed
- tooltips where improved
- save gear on respawn attribute was moved to mission settings -> respawn and will now be applied to all playable units automatically
- changes logo which is display in the expansion menu
- improved fn_logClassName.sqf
- added improved control for view distance setting
- time multiplier settings uses a custom control with slider and edit box
- removed toggleMapIDs attribute from Preferences and moved it to the Menu Strip -> Tools
- added ID icon for ToggleMapIDs tool
- new server key
- log classname function would not return classname of logics and modules

*REMOVED*
- custom compositions

---
v1.1

*ADDED*
- time multiplier to environment attribute
- advanced fog settings to environment attributes- remove map attribute
- remove GPS attribute
- ambient combat animation
- view distance and disable grass option to environment mission attribute (Will be executed globally and for JIP playes)
- attribute to create a small mission intro containing three lines (See scenario attribute -> general)
- quick links for:(Can be found in the menu strip -> help)
  - Arma 3 Assets
  - Arma 3 Function Overview
  - 3den Enhanced Forum thread
- ability to quickly copy class name of selected unit to clipboard
- ability to quickly set random rotation for all selected entities
- attribute to force walk
- attribute to disallow sprinting
- rearranged attributes into different classes
- mission attribute for radio, music and sound volume
- suppression attribute
- fatigue level attribute
- attribute to enable headlights of empty vehicles

*CHANGED*
- renamed some attributes
- save gear now also works on dedicated, not only on hosted server (Thanks to larrow!)
- crew in immobile is now only shown for vehicle entities
- fixed typo in ambient animation tooltip
- ambient anim attribute is now using combo boxes
- allowCrewImmobile attribute has been tweaked
- shortened ambient anim init time
- removed some ambient animation that would not work, e.g sit and treat_injured

*REMOVED*
- removed composition tool
- removed custom triggers (If used, remove those from your mission, otherwise it won't run without 3den Enhanced mod, sorry for the inconvinience that caused)