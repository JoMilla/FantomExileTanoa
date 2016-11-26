uiSleep 1;
_playerUID = getPlayerUID player;
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if (_playerUID in _buildRights) then
	{
	_nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
	_name = _flag getVariable ["ExileTerritoryName", ""];
	_dueDate = format 
	[
		"%3/%2/%1",
		_nextDueDate select 0,
		_nextDueDate select 1,
		_nextDueDate select 2
	];
	if !((getPlayerUID player) in forumsupporter) then
	{
		_dueDate = "XX-XX-XXXX"
	};
	 ["DueDate",[format["<t color='#DD2626'>%2</t> territory payment due: <t color='#3FD4FC'>%1</t>",_dueDate,_name]]] call BIS_fnc_showNotification;
	};
}
forEach (allMissionObjects "Exile_Construction_Flag_Static");
true