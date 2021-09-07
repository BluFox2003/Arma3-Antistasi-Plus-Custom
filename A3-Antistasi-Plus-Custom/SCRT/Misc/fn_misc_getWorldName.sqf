if (isNil "storedWorldName") then {
	switch (toLower worldName) do {
		case "cup_chernarus_a3":
		{
			storedWorldName = "Chernarus";
		};
		case "panthera3": 
		{
			storedWorldName = "Panthera";
		};
		case "abramia": 
		{
			storedWorldName = "Abramia";
		};
		case "blud_vidda": 
		{
			storedWorldName = "Vidda";
		};
		default
		{
			storedWorldName = toUpper([worldName, 0, 0] call BIS_fnc_trimString) + ([worldName, 1, count worldName] call BIS_fnc_trimString);
		};
	};
};

storedWorldName