#include-once
Global $g_aChestID[24]
     $g_aChestID[0] = 65 ; "Krytan Chest"
     $g_aChestID[1] = 66 ; "Elonian Chest"
     $g_aChestID[2] = 67 ; "Maguuma Chest"
     $g_aChestID[3] = 68 ; "Phantom Chest"
     $g_aChestID[4] = 69 ; "Ascalonian Chest"
	 $g_aChestID[5] = 70 ; "Miners Chest"
     $g_aChestID[6] = 71 ; "Steel Chest"
     $g_aChestID[7] = 72 ; "Shiverpeak Chest"
     $g_aChestID[8] = 73 ; "Darkstone Chest"
	 $g_aChestID[9] = 74 ; "Obsidian Chest"
	 $g_aChestID[10] = 4576 ; "Forbidden Chest"
     $g_aChestID[11] = 4577 ; "Kurzick Chest"
	 $g_aChestID[12] = 4578 ; "Stoneroot Chest"
     $g_aChestID[13] = 4579 ; "Shing Jea Chest"
	 $g_aChestID[14] = 4580 ; "Luxon Chest"
	 $g_aChestID[15] = 4581 ; "Deep Jade Chest"
     $g_aChestID[16] = 4582 ; "Canthan Chest"
	 $g_aChestID[17] = 6061 ; "Ancient Elonian Chest"
     $g_aChestID[18] = 6062 ; "Istani Chest"
	 $g_aChestID[19] = 6063 ; "Vabbi Chest"
     $g_aChestID[20] = 6064 ; "Kournan Chest"
     $g_aChestID[21] = 6065 ; "Margonite Chest"
     $g_aChestID[22] = 7053 ; "Demonic Chest"
	 $g_aChestID[23] = 8141 ; "Locked Chest"

Func PickUpItemsAndOpenChest()
	Local $lChestOpenRange = 2500
	Local $lPickUpLootRange = 2500
	Local $lPickedSomething = False
	Local $openedChest = False
	Local $lDidSomething = False
	
	;check if pick up loot is checked
	IF GUICtrlRead($chkPickUpLoot) = $GUI_CHECKED Then $lPickedSomething = PickUpLoot($lPickUpLootRange)
	IF $lDidSomething Then Out("PickedSomething")
	;check if open chest is checked
	IF GUICtrlRead($chkOpenChest) = $GUI_CHECKED Then $openedChest = FindAndOpenChests($lChestOpenRange)
	IF $lDidSomething Then Out("OpenedChest")
	$lDidSomething = $lPickedSomething OR $openedChest
	Return $lDidSomething
EndFunc		;==> PickUpItemsAndOpenChest

Func PickUpLoot($iMaxDist = 2500)
	Local $lPickedSomething = False
    ; Do not pick up loot if we are in an outpost/town
    If Map_GetInstanceInfo("IsOutpost") Then Return

    Local $lAgentArray = Item_GetItemArray()
    If Not IsArray($lAgentArray) Then Return

    Local $maxitems = $lAgentArray[0]
    If $maxitems = 0 Then Return

    ; Get current player coordinates
    Local $lMyX = Agent_GetAgentInfo(-2, "X")
    Local $lMyY = Agent_GetAgentInfo(-2, "Y")

    ; Array to store valid items: [ItemPtr, AgentID, DistanceToPlayer]
    Local $lItemsWithDist[$maxitems + 1][3]
    Local $lValidCount = 0

    ; Filter items based on range and pickup rules
    For $i = 1 To $maxitems
        Local $aItemPtr = $lAgentArray[$i]
        If $aItemPtr = 0 Then ContinueLoop
        
        Local $aItemAgentID = Item_GetItemInfoByPtr($aItemPtr, "AgentID")
        If $aItemAgentID = 0 Then ContinueLoop
        
        ; Check if the item matches our rarity/type filters
        If CanPickUp($aItemPtr) = False Then ContinueLoop

        Local $lItemX = Agent_GetAgentInfo($aItemAgentID, "X")
        Local $lItemY = Agent_GetAgentInfo($aItemAgentID, "Y")
        
        ; Use pathfinding cost to determine real walking distance (ignores items behind walls)
        Local $lRealDist = _GetPathfindingDistanceToItem($lMyX, $lMyY, $lItemX, $lItemY)

        ; Skip if item is further than our defined max distance or unreachable
        If $lRealDist > $iMaxDist Then ContinueLoop

        $lItemsWithDist[$lValidCount][0] = $aItemPtr
        $lItemsWithDist[$lValidCount][1] = $aItemAgentID
        $lItemsWithDist[$lValidCount][2] = $lRealDist ; Store distance to PLAYER for path optimization
        $lValidCount += 1
    Next

    If $lValidCount = 0 Then Return
	Out("$lValidCount " & $lValidCount)
    ; SORTING: Shortest path optimization (Bubble Sort)
    ; Arranges items from closest to farthest relative to the player's current position
    For $i = 0 To $lValidCount - 2
        For $j = $i + 1 To $lValidCount - 1
            ; Swap if item at $j is closer than item at $i
            If $lItemsWithDist[$j][2] < $lItemsWithDist[$i][2] Then 
                Local $lTempPtr = $lItemsWithDist[$i][0]
                Local $lTempID = $lItemsWithDist[$i][1]
                Local $lTempDist = $lItemsWithDist[$i][2]
                
                $lItemsWithDist[$i][0] = $lItemsWithDist[$j][0]
                $lItemsWithDist[$i][1] = $lItemsWithDist[$j][1]
                $lItemsWithDist[$i][2] = $lItemsWithDist[$j][2]
                
                $lItemsWithDist[$j][0] = $lTempPtr
                $lItemsWithDist[$j][1] = $lTempID
                $lItemsWithDist[$j][2] = $lTempDist
            EndIf
        Next
    Next

    ; EXECUTION: Move to and pick up items in order
    For $i = 0 To $lValidCount - 1
        ; Stop looting immediately if the player dies
        If Agent_GetAgentInfo(-2, "isDead") Then ExitLoop

        Local $aItemAgentID = $lItemsWithDist[$i][1]
        
        ; Safety check: verify the item still exists (e.g., wasn't taken by another player)
        If Not GetItemAgentExists($aItemAgentID) Then ContinueLoop

        ; Command the pathfinder to move to the item's location
		Local $x = Agent_GetAgentInfo($aItemAgentID, "X")
		Local $y = Agent_GetAgentInfo($aItemAgentID, "Y")
		Local $l = Agent_GetAgentInfo($aItemAgentID, "Plane")
		Local $lDeadlock = TimerInit()
		Do
			If Agent_GetAgentInfo(-2, "isDead") Then Return
			If TimerDiff($lDeadlock) > 5000 Then ExitLoop
			Out("pickup...x:" & $x & " y:" & $y & " L:" & $l)
			Map_MoveLayer($x, $y, $l)
			Sleep(Other_GetPing() + 500)
		Until Agent_GetDistanceToXY($x, $y) < 50 OR NOT GetItemAgentExists($aItemAgentID)
        Item_PickUpItem($aItemAgentID)
		Sleep(Other_GetPing() + 300)
		$lPickedSomething = True
    Next
	Return $lPickedSomething
EndFunc		;==>PickUpLoot

Func _GetPathfindingDistanceToItem($aStartX, $aStartY, $aDestX, $aDestY)
	Local $lEuclideanDist = Sqrt(($aDestX - $aStartX)^2 + ($aDestY - $aStartY)^2)

	If $g_hPathfinderDLL = 0 Or $g_hPathfinderDLL = -1 Then Return $lEuclideanDist

	Local $lLayer = Agent_GetAgentInfo(-2, "Plane")
	Local $lMapID = Map_GetMapID()
	Local $lNoObstacles = 0

	Local $l_p_Result = Pathfinder_FindPathRaw($lMapID, $aStartX, $aStartY, $lLayer, $aDestX, $aDestY, $lNoObstacles, 100)
	If $l_p_Result = 0 Then Return $lEuclideanDist

	Local $l_t_Result = DllStructCreate($tagPathResult, $l_p_Result)
	Local $l_i_ErrorCode = DllStructGetData($l_t_Result, "error_code")

	If $l_i_ErrorCode <> 0 Then
		Pathfinder_FreePathResult($l_p_Result)
		Return $lEuclideanDist
	EndIf

	Local $l_f_TotalCost = DllStructGetData($l_t_Result, "total_cost")
	Pathfinder_FreePathResult($l_p_Result)

	If $l_f_TotalCost <= 0 Then Return $lEuclideanDist

	Return $l_f_TotalCost
EndFunc

Func CanPickUp($aItem)
    Local $aItemAgentID = Item_GetItemInfoByPtr($aItem, "AgentID")
    Local $lRarity = Item_GetItemInfoByPtr($aItem, "Rarity")
    Local $lType = Item_GetItemInfoByPtr($aItem, "ItemType")
    Local $lModelID = Item_GetItemInfoByPtr($aItem, "ModelID")
    Local $lExtraID = Item_GetItemInfoByPtr($aItem, "ExtraID")

    ; Basic check if the engine allows interaction
    If Not Agent_GetAgentInfo($aItemAgentID, "CanPickUp") Then Return False
    
    ; 1. High Priority: Always pick up Green (Unique) and Gold (Rare) items
    If $lRarity = $GC_I_RARITY_GREEN Or $lRarity = $GC_I_RARITY_GOLD Then Return True

    ; 2. Model ID Checks: Specific items like Gold Coins or Materials
    Switch $lModelID
        Case $GC_I_MODELID_GOLD_COIN
            ; Only pick up gold if character is not at the gold cap (99k-100k)
            Return Item_GetInventoryInfo("GoldCharacter") < 99000
            
        Case 2605, 2606, 501 To 503, 2566, 2607, 6102, 6104, 6531, 15564, 15565, 15867, 15869 To 15871, 17054, 17055, _
             17075, 22781, 22782, 25410, 25413, 25416, 24628, 24582
            Return True
            
        Case 472, 474, 476, 522
            Return True
            
        Case 21786 To 21805
            Return True
    EndSwitch

    ; 3. Item Type Checks: Utility items, keys, and event items
    Switch $lType
        Case $GC_I_TYPE_BUNDLE, $GC_I_TYPE_USABLE, $GC_I_TYPE_MATERIAL_AND_ZCOINS, $GC_I_TYPE_CELESTIAL_SIGIL, _
             $GC_I_TYPE_KEY, $GC_I_TYPE_GOLD_COINS, $GC_I_TYPE_QUEST_ITEM, $GC_I_TYPE_KIT, $GC_I_TYPE_SCROLL, $GC_I_TYPE_PRESENT, _
             $GC_I_TYPE_MINIPET, $GC_I_TYPE_BOOKS, $GC_I_TYPE_COSTUME_BODY, $GC_I_TYPE_COSTUME_HEADPIC
            
            ; Map-specific exclusion (Example: avoid clutter in Fort Ranik)
            If Map_GetMapID() = $GC_I_MAP_ID_FORT_RANIK_OUTPOST Then Return False
            Return True
            
        Case $GC_I_TYPE_DYE
            ; Only pick up high-value dyes (Black/White)
            Return ($lExtraID = $GC_I_EXTRAID_DYE_BLACK Or $lExtraID = $GC_I_EXTRAID_DYE_WHITE)
    EndSwitch

    ; Default: Do not pick up the item
    Return False
EndFunc		;==>CanPickUp

Func GetItemAgentExists($aItemAgentID)
	Return (Agent_GetAgentPtr($aItemAgentID) > 0 And $aItemAgentID < Item_GetMaxItems())
EndFunc	;==>GetItemAgentExists

;~ Find and open chests in the given range (earshot by default)
Func FindAndOpenChests($range = 2500)
	If GetAmountOfInventoryItemByID($GC_I_MODELID_LOCKPICK) == 0 Then Return Null
	Local $gadgetID
	Local $agents = Agent_GetAgentArray($GC_I_AGENT_TYPE_GADGET)
	Local $lMyX
	Local $lMyY
	Local $openedChest = False
	For $agent = 1 to $agents[0]
		Local $agentPtr = $agents[$agent]
		$lAgentID = Agent_GetAgentInfo($agentPtr, "ID")
		;check if chest already opend (ID should be unique across the entire map.)
		If _ArraySearch($opendChests, $lAgentID) = -1 Then
			If ChestFilter($lAgentID) == False Then ContinueLoop
			If Agent_GetDistance($agentPtr) > $range Then ContinueLoop
			Local $x = Agent_GetAgentInfo($agentPtr, "X")
			Local $y = Agent_GetAgentInfo($agentPtr, "Y")
			Local $l = Agent_GetAgentInfo($agentPtr, "Plane")
			Local $lDeadlock = TimerInit()
			Do
				$lMyX = Agent_GetAgentInfo(-2, "X")
				$lMyY = Agent_GetAgentInfo(-2, "Y")
				If Agent_GetAgentInfo(-2, "isDead") Then Return
				If TimerDiff($lDeadlock) > 5000 Then ExitLoop
				Out("pickup...x:" & $x & " y:" & $y & " L:" & $l)
				Map_MoveLayer($x, $y, $l)
				; Fight if needed
				UAI_Fight($lMyX, $lMyY)
				Sleep(100)
			Until Agent_GetDistanceToXY($x, $y) < 50
			Agent_GoSignpost($lAgentID)
			Sleep(Other_GetPing() + 300)
			Out("opening chest ID: " & $lAgentID)
			Ui_OpenChest()
			Sleep(Other_GetPing() + 300)
			If Agent_GetAgentInfo(-2, "isDead") Then Return
			PickUpLoot()
			Sleep(Other_GetPing() + 300)
			
			;Enter the chest ID into an array to mark it as opened.
			Local $iCurrentSize = UBound($opendChests)
			ReDim $opendChests[$iCurrentSize + 1]
			$opendChests[$iCurrentSize] = $lAgentID
			$openedChest = True
		EndIf
	Next
	Return $openedChest
EndFunc

Func GetAmountOfInventoryItemByID($SearchingItemModelID)
	Local $Amount = 0
	Local $ItemModelID
	Local $Quantity

	For $i = 1 To 4
		For $j = 1 To Item_GetBagInfo(Item_GetBagPtr($i), 'Slots')
			$lItemPtr = Item_GetItemBySlot($i, $j)
			If Item_GetItemInfoByPtr($lItemPtr, "ItemID") = 0 Then ContinueLoop
			$ItemModelID = Item_GetItemInfoByPtr($lItemPtr, "ModelID")
			If $ItemModelID = $SearchingItemModelID Then
				$Quantity = Item_GetItemInfoByPtr($lItemPtr, "Quantity")
				Sleep(16)
				$Amount += $Quantity
			EndIf
		Next
	Next

	Return $Amount
EndFunc	   ;==>GetAmountOfInventoryItemByID

Func ChestFilter($aAgentPtr)
	If Agent_GetAgentInfo($aAgentPtr, 'Type') <> 512 Then Return False
	Local $l_gadgetID = Agent_GetAgentInfo($aAgentPtr, 'GadgetID')
	For $i = 0 to UBound($g_aChestID) - 1
		If $l_gadgetID = $g_aChestID[$i] Then Return True
	Next
	Return False
EndFunc		;==>ChestFilter

Func CanPickUpNew($aItem)
    Local $aItemAgentID = Item_GetItemInfoByPtr($aItem, "AgentID")
    Local $lRarity = Item_GetItemInfoByPtr($aItem, "Rarity")
    Local $lType = Item_GetItemInfoByPtr($aItem, "ItemType")
    Local $lModelID = Item_GetItemInfoByPtr($aItem, "ModelID")
    Local $lExtraID = Item_GetItemInfoByPtr($aItem, "ExtraID")
    Local $cache = $inventory_management_cache

    ; Basic check if the engine allows interaction
    If Not Agent_GetAgentInfo($aItemAgentID, "CanPickUp") Then Return False

    ; Nichts aufheben wenn komplett deaktiviert
    If $cache['@pickup.nothing'] Then Return False

    ; Gold
    If $lModelID = $GC_I_MODELID_GOLD_COIN Then
        If Item_GetInventoryInfo("GoldCharacter") >= 99000 Then Return False
        Return $cache['Pick up items.Gold']
    EndIf

    ; Waffen und Offhands
    If IsWeapon($aItem) Then
        If $lRarity <> $RARITY_WHITE And IsLowReqMaxDamage($aItem) Then Return True
        Return CheckPickupWeapon($aItem)
    EndIf

    ; Rüstungs-Salvageables
    If isArmorSalvageItem($aItem) Then
        Local $rarityName = $RARITY_NAMES_FROM_IDS[$lRarity]
        Return $cache['Pick up items.Armor salvageables.' & $rarityName]
    EndIf

    ; Consumables
    If IsConsumable($lModelID) Then
        Return $cache['Pick up items.Consumables']
    EndIf

    ; Alkohol
    If IsAlcohol($lModelID) Then
        Return $cache['Pick up items.Alcohols']
    EndIf

    ; Festival Items
    If IsSpecialDrop($lModelID) Then
        Local $festivalDropName = $SPECIAL_DROP_NAMES_FROM_IDS[$lModelID]
        Return $cache['Pick up items.Festival Items.' & $festivalDropName]
    EndIf

    ; Trophäen
    If IsTrophy($lModelID) Then
        If $MAP_FARMED_TROPHIES[$lModelID] <> Null Then
            Return $cache['Pick up items.Trophies.' & $FARMED_TROPHIES_NAMES_FROM_ID[$lModelID]]
        EndIf
        Return $cache['Pick up items.Trophies.Other trophies']
    EndIf

    ; Basic Materials
    If IsBasicMaterial($aItem) Then
        Local $materialName = $BASIC_MATERIAL_NAMES_FROM_IDS[$lModelID]
        Return $cache['Pick up items.Basic Materials.' & $materialName]
    EndIf

    ; Rare Materials
    If IsRareMaterial($aItem) Then
        Local $materialName = $RARE_MATERIAL_NAMES_FROM_IDS[$lModelID]
        Return $cache['Pick up items.Rare Materials.' & $materialName]
    EndIf

    ; Normale Tomes
    If IsRegularTome($lModelID) Then
        Local $tomeName = $REGULAR_TOME_NAMES_FROM_IDS[$lModelID]
        Return $cache['Pick up items.Tomes.Normal.' & $tomeName]
    EndIf

    ; Elite Tomes
    If IsEliteTome($lModelID) Then
        Local $tomeName = $ELITE_TOME_NAMES_FROM_IDS[$lModelID]
        Return $cache['Pick up items.Tomes.Elite.' & $tomeName]
    EndIf

    ; Gold Scrolls
    If IsGoldScroll($lModelID) Then
        Local $scrollName = $GOLD_SCROLL_NAMES_FROM_IDS[$lModelID]
        Local $pickup = $cache['Pick up items.Scrolls.Gold.' & $scrollName]
        If $pickup <> Null Then Return $pickup
        Return $cache['Pick up items.Scrolls.Gold.Other gold scrolls']
    EndIf

    ; Blue Scrolls
    If IsBlueScroll($lModelID) Then
        Return $cache['Pick up items.Scrolls.Blue']
    EndIf

    ; Lockpicks
    If $lModelID = $ID_LOCKPICK Then
        Return $cache['Pick up items.Lockpicks']
    EndIf

    ; Keys
    If IsKey($lModelID) Then
        Return $cache['Pick up items.Keys']
    EndIf

    ; Farben/Dyes
    If $lModelID = $ID_DYES Then
        Local $dyeColorName = $DYE_NAMES_FROM_IDS[$lExtraID]
        Return $cache['Pick up items.Dyes.' & $dyeColorName]
    EndIf

    ; Map pieces
    If IsMapPiece($lModelID) Then
        Return $cache['Pick up items.Quest items.Map pieces']
    EndIf

    Return False
EndFunc
