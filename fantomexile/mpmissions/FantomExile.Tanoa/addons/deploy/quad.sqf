_flags = player nearObjects ["Exile_Construction_Flag_Static", 105];
if!(_flags isEqualTo [])exitWith
{
	["ErrorTitleAndText", ["Craft Vehicle", "You cannot do that near bases"]] call ExileClient_gui_toaster_addTemplateToast;
};

_traders = player nearObjects ["Exile_Sign_WasteDump", 250];
if!(_traders isEqualTo [])exitWith
{
	["ErrorTitleAndText", ["Craft Vehicle", "You cannot do that in traders"]] call ExileClient_gui_toaster_addTemplateToast;
};

if!(vehicle player isEqualTo player)exitWith
{
	["ErrorTitleAndText", ["Craft Vehicle", "You cannot do that from vehicles"]] call ExileClient_gui_toaster_addTemplateToast;
};

player playActionNow "Medic";
removeAllActions player;
_spawnPos = player modelToWorld [0,3,0];
_spawnDir = (getDir player) -90;
_overWater = !(position player isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo []);
SPAZ = [player, _spawnPos, _spawnDir, _overWater];
uiSleep 3;
publicVariableServer "SPAZ";
uiSleep 1;
['SuccessTitleAndText', ['Craft Vehicle', 'You crafted a temporary vehicle']] call ExileClient_gui_toaster_addTemplateToast;