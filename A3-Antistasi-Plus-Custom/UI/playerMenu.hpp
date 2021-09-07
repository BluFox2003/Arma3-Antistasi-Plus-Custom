class playerMenu 
{
	idd = 70000;
	movingenable = false;
	onLoad = "['on'] call SCRT_fnc_ui_toggleMenuBlur";
	onUnload = "isMenuOpen = false; closeDialog 0; ['off'] call SCRT_fnc_ui_toggleMenuBlur; [] spawn SCRT_fnc_ui_dispose;";
	
	class Controls 
	{
		class menuTitle: TextBase
		{
			idc = 1050;
			text = "Commander Menu";
			x = "safezoneX + (1 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (4 * pixelGridNoUIScale * pixelH)";	
			w = "24 * pixelGridNoUIScale * pixelW";
			h = "4 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2.5) * 0.5";
			shadow = 2;
		};	

		class background: TextBase 
		{
			idc = 1051;
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "24 * pixelGridNoUIScale * pixelW";
			h = "safezoneH - (18 * pixelGridNoUIScale * pixelH)";
			colorBackground[] = { 0.1, 0.1, 0.1, 0.6 };
			text = "";
		};

		class messageBoxTitle: TextBase {
			idc = 1055;	
			x = "safezoneX + (25 * pixelGridNoUIScale * pixelW)";
			y = "(safezoneY + safezoneH) - (10 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW - (32 * pixelGridNoUIScale * pixelW)";	
			h = "2 * pixelGridNoUIScale * pixelH";
			text = "";
			size = "((pixelH * (pixelGridNoUIScale) * 2) * 3) * 0.5";
		};

		class messageBoxText: TextBase
		{
			idc = 1056;
			type = CT_STRUCTURED_TEXT;
			font = "PuristaLight";
			text = "";
			x = "safezoneX + (25 * pixelGridNoUIScale * pixelW)";
			y = "(safezoneY + safezoneH) - (8 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW - (32 * pixelGridNoUIScale * pixelW)";	
			h = "6 * pixelGridNoUIScale * pixelH";
			size = "((pixelH * (pixelGridNoUIScale) * 2) * 1.5) * 0.5";
		};

		class mapContainer: RscMapControl
		{			
			idc = 1000;			
			x = "safezoneX + (24 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW";
			h = "safezoneH - (18 * pixelGridNoUIScale * pixelH)";
		};	

		class tabSelectorTitle: headerBase
		{
			idc = 1101;			
			style = ST_CENTER;
			text = "SUPPORT"; //--- ToDo: Localize;						
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "24 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";			
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.5) * 0.5";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
		};		
		
		class tabSelectorLeftButton: ButtonBase
		{			
			idc = 1150;
			text = "<";
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";
			action = "[70000,'LEFT'] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;";
		};

		class tabSelectorRightButton: ButtonBase
		{			
			idc = 1151;
			text = ">";
			x = "safezoneX + (21.5 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";	
			action = "[70000,'RIGHT'] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;";
		};					
		
		// Game Options (Client)
		class OptionsLiteTab: RscControlsGroup 
		{
			idc = 1140;			
			x = safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";

			class Controls 
			{
				class clientOptionsDescriptionTitle: TextBase
				{
					idc = 5020;
					text = "Client-Side Options";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class clientOptionsDescriptionText: TextBaseMT
				{
					idc = 5021;			
					text = "Options below are client-side only.";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class musicSwitchButton: RscControlsGroupNoScrollbarsMain 
				{
					idc = 5100;
					y = "4 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = 5101;
							text = "\A3\ui_f\data\igui\cfg\simpleTasks\types\listen_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = 5102;	
							text = "MUSIC";
						};
						class SwitchText: switchButtonSelect
						{			
							idc = 5103;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = 5104;
							action = "['MAIN', 5100, true, 'MUSIC'] call SCRT_fnc_ui_switchButton";
							tooltip = "Disables/Enable situational music.";
						};
					};		
				};

				class rocketCameraSwitchButton: RscControlsGroupNoScrollbarsMain 
				{
					idc = 5200;
					y = "7.5 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = 5201;
							text = "\A3\ui_f\data\igui\cfg\simpleTasks\types\scout_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = 5202;	
							text = "PROJECTILE CAMERA";
						};
						class SwitchText: switchButtonSelect
						{			
							idc = 5203;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = 5204;
							action = "['MAIN', 5200, true, 'CAMERA'] call SCRT_fnc_ui_switchButton";
							tooltip = "Enables/Disables camera that follows any projectile that has been launched from missile/rocket launchers or weapon with high magnification scope (more than 8x). Use Tab key to exit camera. Experimental.";
						};
					};		
				};

				class paradropButton: RscControlsGroupNoScrollbarsMain 
				{
					idc = 5400;
					y = "11 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = 5401;
							text = "\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = 5402;	
							text = "PARADROP";
						};
						class SwitchText: switchButtonSelect
						{			
							idc = 5403;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = 5404;
							action = "['MAIN', 5400, true, 'PARADROP'] call SCRT_fnc_ui_switchButton";
							tooltip = "Disables/Enable paradrop attendance.";
						};
					};		
				};

				class paradropDescriptionText: TextBaseMT
				{
					idc = 6521;			
					text = "To attend in paradrop, you must be at rebel HQ and turn on switch button above to be able to be transfered to aircraft.";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "14.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "4 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class saveGameButton: ButtonBase
				{		
					idc = 5300;
					text = "PERSONAL SAVE";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;			
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
					tooltip = "Use this option to save your current game. It does save the most important data in a ""Grand Theft Auto"" way. This option allows good MP save and independent saves of any version update. Vanilla saves are disabled because of lack of several features";
					action = "closeDialog 0; closeDialog 0; [] spawn A3A_fnc_persistentSave;";				
				};
			};
		};

		// INFO
		class GameInfoTab: RscControlsGroup 
		{
			idc = 2000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class gameInfoDescriptionTitle: TextBase
				{
					idc = 2010;
					text = "Game Info";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class gameInfoDescriptionText: TextBaseMT
				{
					idc = 2011;			
					text = "";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "6 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};
			};
		};
	};
};