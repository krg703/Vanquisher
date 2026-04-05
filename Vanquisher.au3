#RequireAdmin
#include "../../API/_GwAu3.au3"
#include "Maps.au3"
#include "..\..\API\Plugins\UtilityAI\_UtilityAI.au3"
#include "..\..\API\Plugins\Pathfinder\Pathfinder_Movements.au3"
#include "Teams.au3"
#include "Items.au3"
;#include "InventoryManagement.au3"
#include "JSON.au3"
#include "PathfinderPlus.au3"


Global Const $doLoadLoggedChars = True

Global Const $botName = "Vanqusiher"

Opt("GUIOnEventMode", True)
Opt("GUICloseOnESC", False)
Opt("ExpandVarStrings", 1)

Global $ProcessID = ""
Global $guiCharSelect

Global $BotRunning = False
Global $Bot_Core_Initialized = False
Global $prevTabIndex = 0
Global $g_sPendingAction = ""
Global $g_bActionRunning = False
Global $g_bAutoStart = False  ; Flag for auto-start
Global $WaipointTimeout = 300000 ; 5 minutes
Global $g_b_Event_SaveConfig = False
Global $g_b_Event_LoadConfig = False
Global $CharName = ""
Global $g_s_MainCharName = ""
Global $g_f_DestinationX = 0
Global $g_f_DestinationY = 0

Global $Armor_of_Salvation_item_effect = 2520
Global $Grail_of_Might_item_effect = 2521
Global $Essence_of_Celerity_item_effect = 2522


Global $inventory_management_cache[]
Global $loot_configuration = 'Default Loot Configuration'


#include "AddOns.au3"
#include "Gui.au3"

While True
	Sleep(50)
	Local $currentTabIndex = GUICtrlRead($tab)
	Local $currentTabName = _GUICtrlTab_GetItemText($tab, $currentTabIndex)

	If $currentTabIndex <> $prevTabIndex Then
		$prevTabIndex = $currentTabIndex
		UpdateComboBox()
	EndIf
	
	If  $g_sPendingAction <> "" Then
		Switch $g_sPendingAction
			Case "StartVanquishMaps"
				$g_bActionRunning = True
				Cache_SkillBar()
				AdlibRegister("UpdateVanquishStatus", 1000)
				AdlibRegister("CheckingConset", 5000)
				ProcessCheckedMaps()
				AdlibUnRegister("UpdateVanquishStatus")
				AdlibUnRegister("CheckingConset")
				GUICtrlSetData($btnStartVanquishMaps, "Start")
			Case "StopVanquishMaps"
				$g_sPendingAction = ""
				$g_bActionRunning = False
				GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
				Out("Bot stopped by user")
			Case "StopVanquishEndManually"
				$g_sPendingAction = ""
				$g_bActionRunning = False
				GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
				Out("Bot stopped - Vanquishing failed - end manually")
			Case "StopForCartographing"
				$g_sPendingAction = ""
				$g_bActionRunning = False
				GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
				Out("Cartography mode is active. Cartograph the map and then restart the bot.")
			Case "StopWithError"
				$g_sPendingAction = ""
				$g_bActionRunning = False
				GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
			Case "StopNoMapsSelected"
				$g_sPendingAction = ""
				$g_bActionRunning = False
				GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
				Out("No maps selected!")
		EndSwitch
		
		If $g_sPendingAction == "StartVanquishMaps" Then
			$g_bActionRunning = False
			GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
			$g_sPendingAction = ""
		EndIf
	EndIf
WEnd

Func GuiMainTabButtonHandler()
	Switch @GUI_CtrlId
		Case $btnInit
				Out("Initializing")
				GUICtrlSetData($btnInit, "Initializing...")
				GUICtrlSetState($btnInit, $GUI_DISABLE)
				$CharName = GUICtrlRead($guiCharSelect)
				If $CharName = "" Or $CharName = "--- Select Your Character ---"Then
					Out("Please select a character first!")
					GUICtrlSetState($btnInit, $GUI_ENABLE)
					GUICtrlSetData($btnInit, "Initialize")
					Return
				EndIf
				
				Out("Connecting to character " & $CharName)
				$g_s_MainCharName = $CharName
				
				Local $result = 0
				If $ProcessID Then
					Local $proc_id_int = Number($ProcessID, 2)
					$result = Core_Initialize($proc_id_int, True)
				Else
					$result = Core_Initialize($CharName, True)
				EndIf

				If $result = 0 Then
					Out("Failed to initialize GwAu3 Core!")
					GUICtrlSetState($btnInit, $GUI_ENABLE)
					GUICtrlSetData($btnInit, "Initialize")
					Return
				EndIf

				$BotRunning = True
				$Bot_Core_Initialized = True
				;load hero configuration and enable load/save buttons
				LoadConfig()
				GUICtrlSetState($btnLoadConfig, $GUI_ENABLE)
				GUICtrlSetState($btnSaveConfig, $GUI_ENABLE)
				; LoadDefaultLootConfiguration()
				; BuildTreeViewFromCache($gui_treeview_lootoptions)
				
				GUICtrlSetData($btnInit, "Initialized")
				GUICtrlSetState($btnInit, $GUI_DISABLE)
				
				; Enable Start button after initialization
				GUICtrlSetState($btnStartVanquishMaps, $GUI_ENABLE)
				GUICtrlSetState($guiCharSelect, $GUI_DISABLE)
				Out("Account initialized for " & $CharName)
				UpdateAllTitlesProgress()
		Case $btnStartVanquishMaps
			If $g_bActionRunning Then 
				$g_sPendingAction = "StopVanquishMaps"
				Out("Stopping vanquishing after current map")
				GUICtrlSetData($btnStartVanquishMaps, "Stopping")
				GUICtrlSetState($btnStartVanquishMaps, $GUI_DISABLE)
			Else
				$g_sPendingAction = "StartVanquishMaps"
				Out("Starting vanquishing selected maps")
				GUICtrlSetData($btnStartVanquishMaps, "Stop")
			EndIf	
		Case $chkUseConset
			If GUICtrlRead($chkUseConset) = $GUI_CHECKED Then
				GUICtrlSetState($guiOptionConset, $GUI_SHOW)
				GUICtrlSetState($chkUseEssence, $GUI_SHOW)
				GUICtrlSetState($chkUseArmor, $GUI_SHOW)
				GUICtrlSetState($chkUseGrail, $GUI_SHOW)
			Else
				GUICtrlSetState($guiOptionConset, $GUI_HIDE)
				GUICtrlSetState($chkUseEssence, $GUI_HIDE)
				GUICtrlSetState($chkUseArmor, $GUI_HIDE)
				GUICtrlSetState($chkUseGrail, $GUI_HIDE)
			EndIf
		Case $chkEndManually
			If GUICtrlRead($chkEndManually) = $GUI_CHECKED Then
				GUICtrlSetState($chkLoopMap, $GUI_UNCHECKED)
			EndIf
		Case $chkLoopMap
			If GUICtrlRead($chkLoopMap) = $GUI_CHECKED Then
				GUICtrlSetState($chkEndManually, $GUI_UNCHECKED)
				GUICtrlSetState($chkCartography, $GUI_UNCHECKED)
			EndIf
		Case $chkCartography
			If GUICtrlRead($chkCartography) = $GUI_CHECKED Then
				GUICtrlSetState($chkLoopMap, $GUI_UNCHECKED)
			EndIf
		Case $GUI_EVENT_CLOSE
			AdlibUnRegister("UpdateVanquishStatus")
			AdlibUnRegister("CheckingConset")
			Exit
		Case Else
			MsgBox(0, 'Error', 'This button is not coded yet.')
	EndSwitch
EndFunc   ;==>GuiMainTabButtonHandler

;~ Handle loot tab buttons
Func GuiLootTabButtonHandler()
	Switch @GUI_CtrlId
		Case $gui_expandlootoptionsbutton
			_GUICtrlTreeView_Expand(GUICtrlGetHandle($gui_treeview_lootoptions), 0, True)
		Case $gui_reducelootoptionsbutton
			_GUICtrlTreeView_Expand(GUICtrlGetHandle($gui_treeview_lootoptions), 0, False)
		Case $gui_loadlootoptionsbutton
			Local $filePath = FileOpenDialog('Please select a valid loot options file', @ScriptDir & '\conf\loot', '(*.json)')
			If @error <> 0 Then
				Out('Failed to read JSON loot options configuration.')
				IF $filePath = "" Then
					Out('Loading the loot configuration was canceled by User.')
				EndIf
			Else
				LoadLootConfiguration($filePath)
				BuildTreeViewFromCache($gui_treeview_lootoptions)
			EndIf
		Case $gui_savelootoptionsbutton
			Local $jsonObject = BuildJSONFromTreeView($gui_treeview_lootoptions)
			Local $jsonString = _JSON_Generate($jsonObject)
			Local $filePath = FileSaveDialog('', @ScriptDir & '\conf\loot', '(*.json)')
			If @error <> 0 Then
				Out('Failed to write JSON loot options configuration.')
				IF $filePath = "" Then
					Out('Saving the loot configuration was canceled by User.')
				EndIf
			Else
				Local $configFile = FileOpen($filePath, $FO_OVERWRITE + $FO_CREATEPATH + $FO_UTF8)
				FileWrite($configFile, $jsonString)
				FileClose($configFile)
				Out('Saved loot options configuration ' & $configFile)
			EndIf
		Case $gui_applylootoptionsbutton
			FillInventoryCacheFromTreeView($gui_treeview_lootoptions)
			BuildInventoryDerivedFlags()
			;RefreshValuableListsFromCache()
			Out('Refreshed inventory management options')
		Case Else
			MsgBox(0, 'Error', 'This button is not coded yet.')
	EndSwitch
EndFunc		;==>GuiLootTabButtonHandler

Func UpdateAllTitlesProgress()
	Local $tyrianCount = Title_GetTitleInfo($GC_E_TITLEID_VANQUISHER_TYRIA, "CurrentPoints")
	Local $canthanCount = Title_GetTitleInfo($GC_E_TITLEID_VANQUISHER_CANTHA, "CurrentPoints")
	Local $elonianCount = Title_GetTitleInfo($GC_E_TITLEID_VANQUISHER_ELONA, "CurrentPoints")

	GUICtrlSetData($pbTyrian, ($tyrianCount / 54) * 100)
	GUICtrlSetData($pbCanthan, ($canthanCount / 33) * 100)
	GUICtrlSetData($pbElonian, ($elonianCount / 34) * 100)

	GUICtrlSetData($lblTyrian, $tyrianCount & " / 54")
	GUICtrlSetData($lblCanthan, $canthanCount & " / 33")
	GUICtrlSetData($lblElonian, $elonianCount & " / 34")
EndFunc   ;==>UpdateAllTitlesProgress

Func UpdateVanquishStatus()
	$foesKilled = World_GetWorldInfo("FoesKilled")
	$foesToKill = World_GetWorldInfo("FoesToKill")
	$foesCount = $foesKilled + $foesToKill
	
	GUICtrlSetData($pbFoes, ($foesKilled / $foesCount) * 100)
	GUICtrlSetData($lblFoes, $foesKilled & " / " & $foesCount)
EndFunc   ;==>UpdateVanquishStatus

Func CheckingConset()
	IF GUICtrlRead($chkUseConset) = $GUI_CHECKED AND Map_GetInstanceInfo("IsExplorable") AND NOT Agent_GetAgentInfo(-2, "isDead") AND World_GetWorldInfo("FoesToKill") <> 0 Then
	Local $result
		IF GUICtrlRead($chkUseEssence) = $GUI_CHECKED AND Agent_GetAgentEffectInfo(-2, $Essence_of_Celerity_item_effect, "TimeRemaining") < 20000 Then 
			$result = UseItem($GC_I_MODELID_ESSENCE_OF_CELERITY) 
			If $result == True Then Out('Essence of celerity used successfully')
			;If $result == False Then Out('Could not find essence of celerity in inventory')
		EndIf
		IF GUICtrlRead($chkUseArmor) = $GUI_CHECKED AND Agent_GetAgentEffectInfo(-2, $Armor_of_Salvation_item_effect, "TimeRemaining") < 20000 Then 
			$result = UseItem($GC_I_MODELID_ARMOR_OF_SALVATION) 
			If $result == True Then Out('Armor of salvation used successfully')
			;If $result == False Then Out('Could not find armor of salvation in inventory')
		EndIf
		IF GUICtrlRead($chkUseGrail) = $GUI_CHECKED AND Agent_GetAgentEffectInfo(-2, $Grail_of_Might_item_effect, "TimeRemaining") < 20000 Then 
			$result = UseItem($GC_I_MODELID_GRAIL_OF_MIGHT)
			If $result == True Then Out('Grail of might used successfully')
			;If $result == False Then Out('Could not find grail of might in inventory')
		EndIf
	EndIf
EndFunc 	;==>CheckingConset

Func UseItem($Item)
	Local $lItemPtr
		For $i = 1 To 4
			For $j = 1 To Item_GetBagInfo(Item_GetBagPtr($i), 'Slots')
			$lItemPtr = Item_GetItemBySlot($i, $j)
				If Item_GetItemInfoByPtr($lItemPtr, "ModelID") == $Item Then
				Item_UseItem($lItemPtr)
				Return True
				EndIf
			Next
		Next
	Return False 
EndFunc		;==>UseItem

#Region Config Functions
Func SaveConfig()
	Local $l_sSelectedChar = GUICtrlRead($guiCharSelect)
	Local $configFile = @ScriptDir & "\conf\hero_config_" & $l_sSelectedChar & ".ini"

	; Save Team 4
	For $i = 0 To 2
		Local $heroName = GUICtrlRead($idComboTeam4[$i])
		IniWrite($configFile, "Team4", "Hero" & ($i + 1), $heroName)
	Next

	; Save Team 6
	For $i = 0 To 4
		Local $heroName = GUICtrlRead($idComboTeam6[$i])
		IniWrite($configFile, "Team6", "Hero" & ($i + 1), $heroName)
	Next

	; Save Team 8
	For $i = 0 To 6
		Local $heroName = GUICtrlRead($idComboTeam8[$i])
		IniWrite($configFile, "Team8", "Hero" & ($i + 1), $heroName)
	Next

	; Save selected character
	IniWrite($configFile, "General", "Character", $CharName)

	Out("Configuration saved for character " & $l_sSelectedChar)
EndFunc

Func LoadConfig()
	Local $l_sSelectedChar = GUICtrlRead($guiCharSelect)
	Local $configFile = @ScriptDir & "\conf\hero_config_" & $l_sSelectedChar & ".ini"

	If Not FileExists($configFile) Then
		Out("No configuration file found. Default configuration loaded. Adjust and save hero configuration for your character.")
		$configFile = @ScriptDir & "\conf\hero_config_Default.ini"
	Else
		Out("Loaded Hero Configuration for character " & $l_sSelectedChar)
	EndIf

	; Load Team 4
	For $i = 0 To 2
		Local $heroVal = IniRead($configFile, "Team4", "Hero" & ($i + 1), "")
		If $heroVal <> "" Then
			Local $heroName = _ResolveHeroName($heroVal)
			If $heroName <> "" Then GUICtrlSetData($idComboTeam4[$i], "|" & $sHeroList, $heroName)
		EndIf
	Next

	; Load Team 6
	For $i = 0 To 4
		Local $heroVal = IniRead($configFile, "Team6", "Hero" & ($i + 1), "")
		If $heroVal <> "" Then
			Local $heroName = _ResolveHeroName($heroVal)
			If $heroName <> "" Then GUICtrlSetData($idComboTeam6[$i], "|" & $sHeroList, $heroName)
		EndIf
	Next

	; Load Team 8
	For $i = 0 To 6
		Local $heroVal = IniRead($configFile, "Team8", "Hero" & ($i + 1), "")
		If $heroVal <> "" Then
			Local $heroName = _ResolveHeroName($heroVal)
			If $heroName <> "" Then GUICtrlSetData($idComboTeam8[$i], "|" & $sHeroList, $heroName)
		EndIf
	Next
EndFunc

Func _ResolveHeroName($sValue)
	; If it's a number (old config format), convert index to hero name
	If StringIsInt($sValue) Then
		Local $iIndex = Number($sValue)
		If $iIndex > 0 And $iIndex <= $GC_AM2_HERO_DATA[0][0] Then
			Return $GC_AM2_HERO_DATA[$iIndex][1]
		EndIf
		Return ""
	EndIf
	; Otherwise it's already a hero name
	Return $sValue
EndFunc

Func Debug($parameter)
	Return MsgBox(1, "Debug", $parameter)
EndFunc   ;==>Debug




