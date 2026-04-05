#include-once

Func GetHeroID($sHeroName)
	If $sHeroName = "" Then Return 0

	For $i = 1 To $GC_AM2_HERO_DATA[0][0]
		If $GC_AM2_HERO_DATA[$i][1] = $sHeroName Then
			Return $GC_AM2_HERO_DATA[$i][0]
		EndIf
	Next
	Return 0
EndFunc

Func SetupTeamForOutpost($iMaxPartySize)
	Party_LeaveGroup()
	Sleep(250)

	; Determine which team configuration to use
	Local $aComboIDs
	Local $numHeroes = 0

	Switch $iMaxPartySize
		Case 4
			$numHeroes = 3
			$aComboIDs = $idComboTeam4
		Case 6
			$numHeroes = 5
			$aComboIDs = $idComboTeam6
		Case 8
			$numHeroes = 7
			$aComboIDs = $idComboTeam8
		Case Else
			$numHeroes = 7
			$aComboIDs = $idComboTeam8
	EndSwitch

	; Add heroes from GUI combo selections
	For $i = 0 To $numHeroes - 1
		Local $heroName = GUICtrlRead($aComboIDs[$i])
		If $heroName <> "" Then
			Local $heroID = GetHeroID($heroName)
			If $heroID > 0 Then
				Party_AddHero($heroID)
				Out("Adding hero: " & $heroName)
				Sleep(250)
			EndIf
		EndIf
	Next

	Out("Team setup complete for party size " & $iMaxPartySize)
EndFunc
