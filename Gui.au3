; Build hero list string for combos (needed before GUI creation)
Global $sHeroList = ""
Global $sSelectChar = "--- Select Your Character ---"
For $i = 1 To $GC_AM2_HERO_DATA[0][0]
	$sHeroList &= $GC_AM2_HERO_DATA[$i][1]
	If $i < $GC_AM2_HERO_DATA[0][0] Then $sHeroList &= "|"
Next

$gui = GUICreate("Vanquisher", 600, 800)
$tab = GUICtrlCreateTab(0, 0, 600, 599)

Global $console = GUICtrlCreateEdit("=================================================================================" & @CRLF & _
		"V A N Q U I S H E R" & @CRLF & _
		"Guild Wars - Ready!" & @CRLF & _
		"=================================================================================" & @CRLF, _
		0, 600, 600, 200, BitOR(0x0040, 0x00200000, 0x00800000, 0x0800, 0x0001))
GUICtrlSetFont($console, 9, 400, 0, "Arial")
GUICtrlSetBkColor($console, 0x000000)
GUICtrlSetColor($console, 0x0096FF)
GUICtrlSetCursor($console, 5)

; === Main tab ===
GUICtrlCreateTabItem("Main")
	Global Const $guiCharGroup = GUICtrlCreateGroup("Connection", 10, 25, 436, 60)
		Global $guiCharSelect = GUICtrlCreateCombo($sSelectChar, 24, 46, 250, 30, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
		GUICtrlSetData($guiCharSelect, Scanner_GetLoggedCharNames())

		Global $btnInit = GUICtrlCreateButton("Initialize", 278, 40, 75, 32)
		GUICtrlSetOnEvent($btnInit, "GuiMainTabButtonHandler")

		Global $btnStartVanquishMaps = GUICtrlCreateButton("Start", 353, 40, 75, 32)
		GUICtrlSetOnEvent($btnStartVanquishMaps, "GuiMainTabButtonHandler")
		GUICtrlSetState($btnStartVanquishMaps, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Global $tyrianCount = 0
	Global $canthanCount = 0
	Global $elonianCount = 0

	Global Const $guiTitlesGroup = GUICtrlCreateGroup("Titles Status", 10, 84, 436, 160)
		GUICtrlCreateLabel("Tyrian Vanquish Status", 24, 104, 246, 15)
		Global $lblTyrian = GUICtrlCreateLabel($tyrianCount & " / 54", 400, 104, 50, 15)
		Global $pbTyrian = GUICtrlCreateProgress(24, 119, 406, 20)

		GUICtrlCreateLabel("Canthan Vanquish Status", 24, 149, 246, 15)
		Global $lblCanthan = GUICtrlCreateLabel($canthanCount & " / 33", 400, 149, 50, 15)
		Global $pbCanthan = GUICtrlCreateProgress(24, 164, 406, 20)

		GUICtrlCreateLabel("Elonian Vanquish Status", 24, 194, 246, 15)
		Global $lblElonian = GUICtrlCreateLabel($elonianCount & " / 34", 400, 194, 50, 15)
		Global $pbElonian = GUICtrlCreateProgress(24, 209, 406, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Global Const $guiInformationGroup = GUICtrlCreateGroup("Map Information", 10, 243, 436, 90)
		Global $foesKilled = 0
		Global $foesToKill = 0
		Global $foesCount = $foesKilled + $foesToKill
		
		Global $lblCurrentMap = GUICtrlCreateLabel("Current Map: " & "", 24, 263, 246, 15)
		
		GUICtrlCreateLabel("Vanquish Status", 24, 283, 246, 15)
		Global $lblFoes = GUICtrlCreateLabel($foesKilled & " / " & $foesCount, 400, 283, 50, 15)
		Global $pbFoes = GUICtrlCreateProgress(24, 298, 406, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	
	Global Const $guiModeGroup = GUICtrlCreateGroup("Mode", 10, 333, 436, 50)
		Global $chkEndManually = GUICtrlCreateCheckbox("End Manually", 24, 353, 90, 20)
		GUICtrlSetOnEvent($chkEndManually, "GuiMainTabButtonHandler")
		GUICtrlSetState($chkEndManually, $GUI_UNCHECKED)
		GUICtrlSetTip($chkEndManually, "If not all opponents are found, the bot stops. The area can be ended manually. The bot must then be restarted.")
		Global $chkLoopMap = GUICtrlCreateCheckbox("Looping", 130, 353, 90, 20)
		GUICtrlSetOnEvent($chkLoopMap, "GuiMainTabButtonHandler")
		GUICtrlSetState($chkLoopMap, $GUI_UNCHECKED)
		GUICtrlSetTip($chkLoopMap, "The current map (the first one, if it hasn't started yet) is repeated in a loop")
		Global $chkCartography = GUICtrlCreateCheckbox("Cartography", 236, 353, 90, 20)
		GUICtrlSetOnEvent($chkCartography, "GuiMainTabButtonHandler")
		GUICtrlSetState($chkCartography, $GUI_UNCHECKED)
		GUICtrlSetTip($chkCartography, "Bot will stop after each map. The area can be cartographed. The bot must then be restarted.")

	
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global Const $guiOptionGroup = GUICtrlCreateGroup("Options", 10, 383, 436, 120)
		
		Global $chkUseConset = GUICtrlCreateCheckbox("Use Conset", 24, 408, 90, 20)
		GUICtrlSetOnEvent($chkUseConset, "GuiMainTabButtonHandler")
		GUICtrlSetState($chkUseConset, $GUI_UNCHECKED)
		Global Const $guiOptionConset = GUICtrlCreateGroup("Conset", 116, 393, 316, 40)	
		GUICtrlSetState($guiOptionConset, $GUI_HIDE)
			Global $chkUseEssence = GUICtrlCreateCheckbox("Essence", 130, 408, 70, 20)
			GUICtrlSetState($chkUseEssence, $GUI_CHECKED)
			GUICtrlSetState($chkUseEssence, $GUI_HIDE)
			Global $chkUseArmor = GUICtrlCreateCheckbox("Armor", 236, 408, 70, 20)
			GUICtrlSetState($chkUseArmor, $GUI_CHECKED)
			GUICtrlSetState($chkUseArmor, $GUI_HIDE)
			Global $chkUseGrail = GUICtrlCreateCheckbox("Grail", 342, 408, 70, 20)
			GUICtrlSetState($chkUseGrail, $GUI_CHECKED)
			GUICtrlSetState($chkUseGrail, $GUI_HIDE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		
		Global $chkPickUpLoot = GUICtrlCreateCheckbox("Pick Up Loot", 24, 438, 90, 20)
		GUICtrlSetState($chkPickUpLoot, $GUI_CHECKED)
		
		Global $chkOpenChest = GUICtrlCreateCheckbox("Open Chests", 24, 468, 90, 20)
		GUICtrlSetState($chkOpenChest, $GUI_CHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

; === Heroes tab ===
GUICtrlCreateTabItem("Heroes")
	GUICtrlCreateGroup("Heroes", 10, 25, 415, 305)
		GUICtrlCreateGroup("Team 4", 20, 44, 130, 115)
			Global $idComboTeam4[3]
			For $i = 0 To 2
				GUICtrlCreateLabel("H" & ($i + 1) & ":", 28, 64 + ($i * 28), 22, 18)
				$idComboTeam4[$i] = GUICtrlCreateCombo("", 50, 64 + ($i * 28), 92, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
				GUICtrlSetData($idComboTeam4[$i], $sHeroList)
			Next
		GUICtrlCreateGroup("", -99, -99, 1, 1)

		; Team 6 (5 heroes)
		GUICtrlCreateGroup("Team 6", 155, 44, 130, 170)
			Global $idComboTeam6[5]
			For $i = 0 To 4
				GUICtrlCreateLabel("H" & ($i + 1) & ":", 163, 64 + ($i * 28), 22, 18)
				$idComboTeam6[$i] = GUICtrlCreateCombo("", 185, 64 + ($i * 28), 92, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
				GUICtrlSetData($idComboTeam6[$i], $sHeroList)
			Next
		GUICtrlCreateGroup("", -99, -99, 1, 1)

		; Team 8 (7 heroes)
		GUICtrlCreateGroup("Team 8", 290, 44, 130, 225)
			Global $idComboTeam8[7]
			For $i = 0 To 6
				GUICtrlCreateLabel("H" & ($i + 1) & ":", 298, 64 + ($i * 28), 22, 18)
				$idComboTeam8[$i] = GUICtrlCreateCombo("", 320, 64 + ($i * 28), 92, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
				GUICtrlSetData($idComboTeam8[$i], $sHeroList)
			Next
		GUICtrlCreateGroup("", -99, -99, 1, 1)


		Global $btnSaveConfig = GUICtrlCreateButton("Save Config", 120, 295, 95, 28)
		GUICtrlSetOnEvent($btnSaveConfig, "SaveConfig")
		GUICtrlSetState($btnSaveConfig, $GUI_DISABLE)
		Global $btnLoadConfig = GUICtrlCreateButton("Load Config", 225, 295, 95, 28)
		GUICtrlSetOnEvent($btnLoadConfig, "LoadConfig")		
		GUICtrlSetState($btnLoadConfig, $GUI_DISABLE)
		

	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

; ; === Campaigns tabs ===
; Global $gui_tab_lootoptions = GUICtrlCreateTabItem('Inventory')
	; Global $gui_treeview_lootoptions = GUICtrlCreateTreeView(80, 45, 545, 400, BitOR($TVS_HASLINES, $TVS_LINESATROOT, $TVS_HASBUTTONS, $TVS_CHECKBOXES, $TVS_FULLROWSELECT))
	; BuildTreeViewFromCache($gui_treeview_lootoptions)
	
	; Global $gui_expandlootoptionsbutton = GUICtrlCreateButton('Expand all', 21, 124, 55, 21)
	; GUICtrlSetOnEvent($gui_expandlootoptionsbutton, 'GuiLootTabButtonHandler')
	
	; Global $gui_reducelootoptionsbutton = GUICtrlCreateButton('Reduce all', 21, 154, 55, 21)
	; GUICtrlSetOnEvent($gui_reducelootoptionsbutton, 'GuiLootTabButtonHandler')
	
	; Global $gui_loadlootoptionsbutton = GUICtrlCreateButton('Load', 21, 184, 55, 21)
	; GUICtrlSetOnEvent($gui_loadlootoptionsbutton, 'GuiLootTabButtonHandler')
	
	; Global $gui_savelootoptionsbutton = GUICtrlCreateButton('Save', 21, 214, 55, 21)
	; GUICtrlSetOnEvent($gui_savelootoptionsbutton, 'GuiLootTabButtonHandler')
	
	; Global $gui_label_lootoptionswarning = GUICtrlCreateLabel('Click apply to confirm your changes', 21, 244, 55, 84, $SS_CENTER)
	; Global $gui_applylootoptionsbutton = GUICtrlCreateButton(@LF & 'Apply' & @LF & 'changes', 21, 304, 55, 63, $BS_MULTILINE)
	; GUICtrlSetBkColor($gui_applylootoptionsbutton, $COLOR_YELLOW)
	; GUICtrlSetOnEvent($gui_applylootoptionsbutton, 'GuiLootTabButtonHandler')

; GUICtrlCreateTabItem('')

; === Campaigns tabs ===
Global $campaigns[4] = ["Prophecies", "Factions", "Nightfall", "Eye Of The North"]
Local $regionsProphecies[7] = ["Ascalon", "Northern Shiverpeaks", "Kryta", "Crystal Desert", "Maguuma Jungle", "Southern Shiverpeaks", "Ring of Fire Islands"]
Local $regionsFactions[4] = ["Shing Jea Island", "Kaineng City", "The Jade Sea", "Echovald Forest"]
Local $regionsNightfall[4] = ["Istan", "Kourna", "Vabbi", "The Desolation"]
Local $regionsEyeOfTheNorth[3] = ["Far Shiverpeaks", "Charr Homelands", "Tarnished Coast"]

Global $mapInfos[400][7]
Global $checkboxIDs[400]
Global $checkboxCount = 0

Global $aDisabledMaps[0]
	

For $p = 0 To UBound($campaigns) - 1
	GUICtrlCreateTabItem($campaigns[$p])
	Local $maps = _GetMaps($campaigns[$p])
	Local $currentY = 25

	If Not IsArray($maps) Then
		GUICtrlCreateLabel("No maps available1.", 20, $currentY, 200, 20)
		ContinueLoop
		ElseIf UBound($maps, 1) = 0 Then
				GUICtrlCreateLabel("No maps available2.", 20, $currentY, 200, 20)
		ContinueLoop
	EndIf
	

	For $g = 0 To 6
		Local $groupStart = -1, $groupEnd = -1
		For $i = 0 To UBound($maps) - 1
			IF $maps[$i][0] = $GC_I_MAP_CAMPAIGN_PROPHECIES AND $g <= UBound($regionsProphecies) - 1 Then
				If $maps[$i][1] = $regionsProphecies[$g] Then
					If $groupStart = -1 Then $groupStart = $i
					$groupEnd = $i
				EndIf
			ELSEIF $maps[$i][0] = $GC_I_MAP_CAMPAIGN_FACTIONS AND $g <= UBound($regionsFactions) - 1  Then
				If $maps[$i][1] = $regionsFactions[$g] Then
					If $groupStart = -1 Then $groupStart = $i
					$groupEnd = $i
				EndIf
			ELSEIF $maps[$i][0] = $GC_I_MAP_CAMPAIGN_NIGHTFALL AND $g <= UBound($regionsNightfall) - 1  Then
				If $maps[$i][1] = $regionsNightfall[$g] Then
					If $groupStart = -1 Then $groupStart = $i
					$groupEnd = $i
				EndIf
			ELSEIF $maps[$i][0] = $GC_I_MAP_CAMPAIGN_EOTN AND $g <= UBound($regionsEyeOfTheNorth) - 1  Then
				If $maps[$i][1] = $regionsEyeOfTheNorth[$g] Then
					If $groupStart = -1 Then $groupStart = $i
					$groupEnd = $i
				EndIf
			EndIf
		Next

		If $groupStart <> -1 Then
			Local $mapCount = $groupEnd - $groupStart + 1
			Local $rows = Ceiling($mapCount / 4)

			Local $groupHeight
			Switch $rows
				Case 1
					$groupHeight = 50
				Case 2
					$groupHeight = 70
				Case 3
					$groupHeight = 90
				Case 4
					$groupHeight = 110
				Case 5
					$groupHeight = 130
				Case 6
					$groupHeight = 150
				Case Else
					$groupHeight = 170
			EndSwitch
			
		For $i = 0 To UBound($maps) - 1
			IF $maps[$i][0] = $GC_I_MAP_CAMPAIGN_PROPHECIES Then
			GUICtrlCreateGroup($regionsProphecies[$g], 10, $currentY, 560, $groupHeight)
			ElseIf $maps[$i][0] = $GC_I_MAP_CAMPAIGN_FACTIONS Then
			GUICtrlCreateGroup($regionsFactions[$g], 10, $currentY, 560, $groupHeight)
			ElseIf $maps[$i][0] = $GC_I_MAP_CAMPAIGN_NIGHTFALL Then
			GUICtrlCreateGroup($regionsNightfall[$g], 10, $currentY, 560, $groupHeight)
			ElseIf $maps[$i][0] = $GC_I_MAP_CAMPAIGN_EOTN Then
			GUICtrlCreateGroup($regionsEyeOfTheNorth[$g], 10, $currentY, 560, $groupHeight)
			EndIf
		Next
			$mapCount = 0

			For $i = $groupStart To $groupEnd
				Local $row = Int($mapCount / 4)
				Local $col = Mod($mapCount, 4)
				Local $x = 20 + $col * 140
				Local $y = $currentY + 20 + $row * 20

				$checkboxIDs[$checkboxCount] = GUICtrlCreateCheckbox($maps[$i][3], $x, $y, 125, 20)

				Local $bDisable = False
				For $d = 0 To UBound($aDisabledMaps) - 1
					If $maps[$i][5] = $aDisabledMaps[$d] Then
						$bDisable = True
						ExitLoop
					EndIf
				Next

				If $bDisable Then
					GUICtrlSetState($checkboxIDs[$checkboxCount], $GUI_DISABLE)
				EndIf
				
				For $j = 0 To 5
					$mapInfos[$checkboxCount][$j] = $maps[$i][$j]
				Next
				
				$checkboxCount += 1
				$mapCount += 1
			Next

			GUICtrlCreateGroup("", -99, -99, 1, 1)
			$currentY += $groupHeight + 5
		EndIf
	Next
Next
GUICtrlCreateTabItem("")

GUISetOnEvent($GUI_EVENT_CLOSE, "GuiMainTabButtonHandler", $gui)
GUISetState(@SW_SHOW, $gui)

Func UpdateComboBox()
	Local $activeTabIndex = GUICtrlRead($tab)
	Local $activeTabName = _GUICtrlTab_GetItemText($tab, $activeTabIndex)

	Local $isRegionTab = False
	For $i = 0 To UBound($campaigns) - 1
		If $activeTabName = $campaigns[$i] Then
			$isRegionTab = True
			ExitLoop
		EndIf
	Next
	If Not $isRegionTab Then Return

	Local $maps = _GetMaps($activeTabName)
	If Not IsArray($maps) Then Return

	Local $mapList = ""
	For $i = 0 To UBound($maps) - 1
		If $i > 0 Then $mapList &= "|"
		$mapList &= $maps[$i][1]
	Next
EndFunc   ;==>UpdateComboBox

Func _GetMaps($regionName)
	Switch $regionName
		Case "Prophecies"
			Return $aPropheciesMaps
		Case "Factions"
			Return $aFactionsMaps
		Case "Nightfall"
			Return $aNightfallMaps
		Case "Eye Of The North"
			Return $aEyeOfTheNorthMaps
		Case Else
			Return 0
	EndSwitch
EndFunc   ;==>_GetMaps

Func AddMap(ByRef $aMaps, $campaignID, $regionName, $regionID, $mapName, $mapID, $cityID)
	Local $index = UBound($aMaps, 1)
	ReDim $aMaps[$index + 1][6]
	$aMaps[$index][0] = $campaignID
	$aMaps[$index][1] = $regionName
	$aMaps[$index][2] = $regionID
	$aMaps[$index][3] = $mapName
	$aMaps[$index][4] = $mapID
	$aMaps[$index][5] = $cityID
EndFunc   ;==>AddMap

GUIRegisterMsg($WM_NOTIFY, "OnTabChange")

Func OnTabChange($hWnd, $iMsg, $wParam, $lParam)
	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $nNotifyCode = DllStructGetData($tNMHDR, "Code")

	If $nNotifyCode = $TCN_SELCHANGE Then
		UpdateComboBox()

		Local $activeTabIndex = GUICtrlRead($tab)
		Local $activeTabName = _GUICtrlTab_GetItemText($tab, $activeTabIndex)

	EndIf

	Return $GUI_RUNDEFMSG
EndFunc   ;==>OnTabChange

;~ Description: Print to console with timestamp
Func Out($text)
	Static $firstCall = True

	If $firstCall Then
		GUICtrlSetStyle($console, BitOR($ES_READONLY, $ES_MULTILINE, $ES_AUTOVSCROLL, $WS_VSCROLL))
		$firstCall = False
	EndIf

	Local $textlen = StringLen($text)
	Local $consolelen = _GUICtrlEdit_GetTextLen($console)
	If $textlen + $consolelen > 30000 Then GUICtrlSetData($console, StringRight(_GUICtrlEdit_GetText($console), 30000 - $textlen - 1000))
	_GUICtrlEdit_AppendText($console, @CRLF & "[" & @HOUR & ":" & @MIN & ":" & @SEC & "] " & $text)
	_GUICtrlEdit_Scroll($console, 1)
EndFunc   ;==>Out

