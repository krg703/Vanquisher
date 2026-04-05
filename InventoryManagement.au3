#Region Loot items
Func PickUpItemsAndOpenChest()
	Local $fightRange = 2500
	Local $pickUpLootRange = 2500
	;check if pick up loot is checked
	IF GUICtrlRead($chkPickUpLoot) = $GUI_CHECKED Then PickUpItems(Null, DefaultShouldPickItem, $pickUpLootRange)
	;check if open chest is checked
	IF GUICtrlRead($chkOpenChest) = $GUI_CHECKED Then FindAndOpenChests($chestOpenRange)
EndFunc		;==> PickUpItemsAndOpenChest


;~ Loot items around character
Func PickUpItems($defendFunction = Null, $shouldPickItem = DefaultShouldPickItem, $range = $RANGE_COMPASS)
	If $inventory_management_cache['@pickup.nothing'] Then Return

	Local $item
	Local $agentID
	Local $deadlock
	Local $agents = Agent_GetAgentArray($GC_I_AGENT_TYPE_ITEM)
	Local $me = Agent_GetMyID()
	For $agent In $agents
		If Agent_GetAgentInfo(-2, "IsDead") Then Return
		;If Not GetCanPickUp($agent) Then ContinueLoop
		If Not Agent_GetAgentInfo($agent, "CanPickUp") Then ContinueLoop
		;If GetDistance($me, $agent) > $range Then ContinueLoop
		If Agent_GetDistance($me, $agent) > $range Then ContinueLoop

		;$agentID = DllStructGetData($agent, 'ID')
		$agentID = Agent_GetAgentInfo($agent, "ID")
		
		;$item = GetItemByAgentID($agentID)
		$item = GetItemByAgentID($agentID)

		If ($shouldPickItem($item)) Then
			;If $defendFunction <> Null Then $defendFunction()
			If Not Agent_GetAgentPtr($agentID) Then ContinueLoop
			Item_PickUpItem($item)
			$deadlock = TimerInit()
			;While IsPLayerAlive() And GetAgentExists($agentID) And TimerDiff($deadlock) < 10000
			While NOT Agent_GetAgentInfo(-2, "IsDead") And Agent_GetAgentPtr($agentID) <> 0 And TimerDiff($deadlock) < 10000
				RandomSleep(100)
			WEnd
		EndIf
	Next

	If $bags_count == 5 And CountSlots(1, 3) == 0 Then
		MoveItemsToEquipmentBag()
	EndIf
EndFunc

;~ Find and open chests in the given range (earshot by default)
Func FindAndOpenChests($range = $RANGE_EARSHOT, $defendFunction = Null, $blockedFunction = Null)
	If FindInInventory($ID_LOCKPICK)[0] == 0 Then Return Null
	Local $gadgetID
	Local $agents = GetAgentArray($ID_AGENT_TYPE_STATIC)
	Local $openedChest = False
	For $agent In $agents
		$gadgetID = DllStructGetData($agent, 'GadgetID')
		If $MAP_CHESTS_IDS[$gadgetID] == Null Then ContinueLoop
		If GetDistance(GetMyAgent(), $agent) > $range Then ContinueLoop

		If $chests_map[DllStructGetData($agent, 'ID')] <> 2 Then
			;Final solution, caution, chest is considered as signpost by game client
			GoToSignpostWhileDefending($agent, $defendFunction, $blockedFunction)
			If IsPlayerDead() Then Return
			RandomSleep(200)
			OpenChest()
			RandomSleep(1000)
			If IsPlayerDead() Then Return
			$chests_map[DllStructGetData($agent, 'ID')] = 2
			PickUpItems()
			$openedChest = True
		EndIf
	Next
	Return $openedChest
EndFunc

;~ Load default loot configuration if it exists
Func LoadDefaultLootConfiguration()
	Local $filePath = @ScriptDir & '/conf/loot/' & $loot_configuration & '.json'
	If FileExists($filePath) Then
		LoadLootConfiguration($filePath)
	Else
		Error('No default loot configuration at ' & $filePath)
	EndIf
EndFunc

;~ Load loot configuration file if it exists
Func LoadLootConfiguration($filePath)
	$loot_configuration = $filePath
	$loot_configuration = StringTrimRight($loot_configuration, StringLen(@ScriptDir & '/conf/loot/'))
	; Removing .json
	$loot_configuration = StringTrimLeft($loot_configuration, 5)
	Local $jsonLootOptions = LoadLootOptions($filePath)
	FillInventoryCacheFromJSON($jsonLootOptions, '')
	BuildInventoryDerivedFlags()
	;RefreshValuableListsFromCache()
	Out('Loaded loot configuration at ' & $filePath)
EndFunc


;~ Load loot configuration file if it exists
Func LoadLootOptions($filePath)
	If FileExists($filePath) Then
		Local $lootOptionsFile = FileOpen($filePath, $FO_READ + $FO_UTF8)
		Local $jsonString = FileRead($lootOptionsFile)
		FileClose($lootOptionsFile)
		Return _JSON_Parse($jsonString)
	EndIf
	Return Null
EndFunc

;~ Build TreeView from flat map
Func BuildTreeViewFromCache($guiTreeviewHandle)
	_GUICtrlTreeView_DeleteAll($guiTreeviewHandle)
	Local $mapTreeViewIDs[]
	For $key In MapKeys($inventory_management_cache)
		; Parent item, no need to draw it
		If $key == '' Then ContinueLoop
		; Derived value, does not show in interface
		If StringLeft($key, 1) == '@' Then ContinueLoop

		Local $bananaSplit = StringSplit($key, '.')
		Local $current = Null
		Local $currentPath = ''
		For $i = 1 To $bananaSplit[0]
			Local $part = $bananaSplit[$i]
			$currentPath &= ($currentPath == '') ? $part : ('.' & $part)
			If $mapTreeViewIDs[$currentPath] <> Null Then
				; Already exists in map
				$current = $mapTreeViewIDs[$currentPath]
			Else
				; Does not exist yet, create and add to map
				$current = GUICtrlCreateTreeViewItem($part, $current <> Null ? $current : $guiTreeviewHandle)
				$mapTreeViewIDs[$currentPath] = $current
			EndIf
		Next
		_GUICtrlTreeView_SetChecked($guiTreeviewHandle, $current, $inventory_management_cache[$key])
	Next
EndFunc

;~ Creating a JSON node from a treeview
Func BuildJSONFromTreeView($treeViewHandle, $treeViewItem = Null, $currentPath = '')
	Local $jsonObject
	IterateOverTreeView($jsonObject, $treeViewHandle, $treeViewItem, $currentPath, AddLeavesToJSONObject)
	Return $jsonObject
EndFunc


;~ Utility function to add treeview elements to a JSON object
Func AddLeavesToJSONObject(ByRef $context, $treeViewHandle, $treeViewItem, $currentPath)
	; We are on a leaf
	If _GUICtrlTreeView_GetChildCount($treeViewHandle, $treeViewItem) <= 0 Then
		_JSON_addChangeDelete($context, $currentPath, _GUICtrlTreeView_GetChecked($treeViewHandle, $treeViewItem))
	EndIf
EndFunc

;~ Iterate over a treeview and make an operation on every node - can be called on root node (Null) or any other node
Func IterateOverTreeView(ByRef $context, $treeViewHandle, $treeViewItem = Null, $currentPath = '', $functionToApply = Null, $maxDepth = -1)
	If $treeViewItem == Null Then
		$treeViewItem = _GUICtrlTreeView_GetFirstItem($treeViewHandle)
		While $treeViewItem <> 0
			IterateOverTreeItem($context, $treeViewHandle, $treeViewItem, $currentPath, $functionToApply, 1, $maxDepth)
			$treeViewItem = _GUICtrlTreeView_GetNextSibling($treeViewHandle, $treeViewItem)
		WEnd
		Return
	EndIf
	IterateOverTreeItem($context, $treeViewHandle, $treeViewItem, $currentPath, $functionToApply, 1, $maxDepth)
EndFunc

;~ Iterate over a treeview item and make an operation on every node - cannot be called on root node (Null)
Func IterateOverTreeItem(ByRef $context, $treeViewHandle, $treeViewItem, $currentPath, $functionToApply, $currentDepth, $maxDepth)
	If $maxDepth <> -1 And $currentDepth > $maxDepth Then Return
	Local $treeViewItemName = _GUICtrlTreeView_GetText($treeViewHandle, $treeViewItem)
	Local $newPath = ($currentPath == '') ? $treeViewItemName : $currentPath & '.' & $treeViewItemName
	If $functionToApply <> Null Then $functionToApply($context, $treeViewHandle, $treeViewItem, $newPath)

	Local $child = _GUICtrlTreeView_GetFirstChild($treeViewHandle, $treeViewItem)
	While $child <> 0
		IterateOverTreeItem($context, $treeViewHandle, $child, $newPath, $functionToApply, $currentDepth + 1, $maxDepth)
		$child = _GUICtrlTreeView_GetNextSibling($treeViewHandle, $child)
	WEnd
EndFunc

;~ Fill inventory cache from JSON
Func FillInventoryCacheFromJSON($jsonNode, $currentPath)
	If IsMap($jsonNode) Then
		Local $checked = True
		For $key In MapKeys($jsonNode)
			If Not FillInventoryCacheFromJSON($jsonNode[$key], ($currentPath == '') ? $key : ($currentPath & '.' & $key)) Then $checked = False
		Next
		$inventory_management_cache[$currentPath] = $checked
		Return $checked
	Else
		$inventory_management_cache[$currentPath] = $jsonNode
		Return $jsonNode
	EndIf
EndFunc

;~ Fill the inventory cache with the treeview data
Func FillInventoryCacheFromTreeView($treeViewHandle)
	IterateOverTreeView(Null, $treeViewHandle, Null, '', AddToInventoryCache)
EndFunc

;~ Return if any option at provided path or lower in the tree is checked
Func IsAnyChecked($path)
	Local $pathLength = StringLen($path) + 1
	For $key In MapKeys($inventory_management_cache)
		If Not $inventory_management_cache[$key] Then ContinueLoop
		If $key == $path Then Return True
		If StringLen($key) <= $pathLength Then ContinueLoop
		If StringLeft($key, $pathLength) == ($path & '.') Then Return True
	Next
	Return False
EndFunc		;==>IsAnyChecked

Func BuildInventoryDerivedFlags()
	; -------- Pickup --------
	Local $pickupSomething = IsAnyChecked('Pick up items')
	$inventory_management_cache['@pickup.something'] = $pickupSomething
	$inventory_management_cache['@pickup.nothing'] = Not $pickupSomething
	Local $pickupSomeWeapons = IsAnyChecked('Pick up items.Weapons and offhands')
	$inventory_management_cache['@pickup.weapons.something'] = $pickupSomeWeapons
	$inventory_management_cache['@pickup.weapons.nothing'] = Not $pickupSomeWeapons

	; -------- Identify --------
	Local $identifySomething = IsAnyChecked('Identify items')
	$inventory_management_cache['@identify.something'] = $identifySomething
	$inventory_management_cache['@identify.nothing'] = Not $identifySomething

	; -------- Salvage --------
	Local $salvageSomething = IsAnyChecked('Salvage items')
	$inventory_management_cache['@salvage.something'] = $salvageSomething
	$inventory_management_cache['@salvage.nothing'] = Not $salvageSomething
	Local $salvageSomeWeapons = IsAnyChecked('Salvage items.Weapons and offhands')
	$inventory_management_cache['@salvage.weapons.something'] = $salvageSomeWeapons
	$inventory_management_cache['@salvage.weapons.nothing'] = Not $salvageSomeWeapons
	Local $salvageSomeSalvageables = IsAnyChecked('Salvage items.Armor salvageables')
	$inventory_management_cache['@salvage.salvageables.something'] = $salvageSomeSalvageables
	$inventory_management_cache['@salvage.salvageables.nothing'] = Not $salvageSomeSalvageables
	Local $salvageSomeTrophies = IsAnyChecked('Salvage items.Trophies')
	$inventory_management_cache['@salvage.trophies.something'] = $salvageSomeTrophies
	$inventory_management_cache['@salvage.trophies.nothing'] = Not $salvageSomeTrophies
	Local $salvageSomeMaterials = IsAnyChecked('Salvage items.Rare Materials')
	$inventory_management_cache['@salvage.materials.something'] = $salvageSomeMaterials
	$inventory_management_cache['@salvage.materials.nothing'] = Not $salvageSomeMaterials

	; -------- Sell --------
	Local $sellSomething = IsAnyChecked('Sell items')
	$inventory_management_cache['@sell.something'] = $sellSomething
	$inventory_management_cache['@sell.nothing'] = Not $sellSomething
	Local $sellSomeWeapons = IsAnyChecked('Sell items.Weapons and offhands')
	$inventory_management_cache['@sell.weapons.something'] = $sellSomeWeapons
	$inventory_management_cache['@sell.weapons.nothing'] = Not $sellSomeWeapons

	Local $sellSomeBasicMaterials = IsAnyChecked('Sell items.Basic Materials')
	$inventory_management_cache['@sell.materials.basic.something'] = $sellSomeBasicMaterials
	$inventory_management_cache['@sell.materials.basic.nothing'] = Not $sellSomeBasicMaterials
	Local $sellSomeRareMaterials = IsAnyChecked('Sell items.Rare Materials')
	$inventory_management_cache['@sell.materials.rare.something'] = $sellSomeRareMaterials
	$inventory_management_cache['@sell.materials.rare.nothing'] = Not $sellSomeRareMaterials
	Local $sellSomeMaterials = $sellSomeBasicMaterials Or $sellSomeRareMaterials
	$inventory_management_cache['@sell.materials.something'] = $sellSomeMaterials
	$inventory_management_cache['@sell.materials.nothing'] = Not $sellSomeMaterials

	; -------- Buy --------
	Local $buySomething = IsAnyChecked('Buy items')
	$inventory_management_cache['@buy.something'] = $buySomething
	$inventory_management_cache['@buy.nothing'] = Not $buySomething

	Local $buySomeBasicMaterials = IsAnyChecked('Buy items.Basic Materials')
	$inventory_management_cache['@buy.materials.basic.something'] = $buySomeBasicMaterials
	$inventory_management_cache['@buy.materials.basic.nothing'] = Not $buySomeBasicMaterials
	Local $buySomeRareMaterials = IsAnyChecked('Buy items.Rare Materials')
	$inventory_management_cache['@buy.materials.rare.something'] = $buySomeRareMaterials
	$inventory_management_cache['@buy.materials.rare.nothing'] = Not $buySomeRareMaterials
	Local $buySomeMaterials = $buySomeBasicMaterials Or $buySomeRareMaterials
	$inventory_management_cache['@buy.materials.something'] = $buySomeMaterials
	$inventory_management_cache['@buy.materials.nothing'] = Not $buySomeMaterials

	; -------- Store --------
	Local $storeSomething = IsAnyChecked('Store items')
	$inventory_management_cache['@store.something'] = $storeSomething
	$inventory_management_cache['@store.nothing'] = Not $storeSomething
	Local $storeSomeWeapons = IsAnyChecked('Store items.Weapons and offhands')
	$inventory_management_cache['@store.weapons.something'] = $storeSomeWeapons
	$inventory_management_cache['@store.weapons.nothing'] = Not $storeSomeWeapons
EndFunc

;~ Return True if the item should be picked up - default to False
Func DefaultShouldPickItem($item)
	; Clarity rename
	Local $cache = $inventory_management_cache
	If $cache['@pickup.nothing'] Then Return False
	If $cache['@pickup.everything'] Then Return True

	;Local $itemID = DllStructGetData(($item), 'ModelID')
	Local $itemID = Item_GetItemInfoByPtr($item, "ModelID")
	;Local $rarity = GetRarity($item)
	Local $rarity = Item_GetItemInfoByPtr($item, "Rarity")

	; ---------------------------------------- Money ----------------------------------------
	If (($itemID == $GC_I_MODELID_GOLD_COIN) And (GetGoldCharacter() < 99000)) Then
		Return $cache['Pick up items.Gold']
	; --------------------------------------- Weapons ---------------------------------------
	ElseIf IsWeapon($item) Then
		If $rarity <> $RARITY_WHITE And IsLowReqMaxDamage($item) Then Return True
		Return CheckPickupWeapon($item)
	; --------------------------------- Armor salvageables ---------------------------------
	ElseIf isArmorSalvageItem($item) Then
		Local $rarityName = $RARITY_NAMES_FROM_IDS[$rarity]
		Return $cache['Pick up items.Armor salvageables.' & $rarityName]
	; --------------------------- Consumables, Alcohols & Festives ---------------------------
	ElseIf IsConsumable($itemID) Then
		Return $cache['Pick up items.Consumables']
	ElseIf IsAlcohol($itemID) Then
		Return $cache['Pick up items.Alcohols']
	ElseIf IsSpecialDrop($itemID) Then
		Local $festivalDropName = $SPECIAL_DROP_NAMES_FROM_IDS[$itemID]
		Return $cache['Pick up items.Festival Items.' & $festivalDropName]
	; --------------------------------------- Trophies ---------------------------------------
	ElseIf IsTrophy($itemID) Then
		If $MAP_FARMED_TROPHIES[$itemID] <> Null Then Return $cache['Pick up items.Trophies.' & $FARMED_TROPHIES_NAMES_FROM_ID[$itemID]]
		Return $cache['Pick up items.Trophies.Other trophies']
	; -------------------------------------- Materials --------------------------------------
	ElseIf IsBasicMaterial($item) Then
		Local $materialName = $BASIC_MATERIAL_NAMES_FROM_IDS[$itemID]
		Return $cache['Pick up items.Basic Materials.' & $materialName]
	ElseIf IsRareMaterial($item) Then
		Local $materialName = $RARE_MATERIAL_NAMES_FROM_IDS[$itemID]
		Return $cache['Pick up items.Rare Materials.' & $materialName]
	; ---------------------------------------- Tomes ----------------------------------------
	ElseIf IsRegularTome($itemID) Then
		Local $tomeName = $REGULAR_TOME_NAMES_FROM_IDS[$itemID]
		Return $cache['Pick up items.Tomes.Normal.' & $tomeName]
	ElseIf IsEliteTome($itemID) Then
		Local $tomeName = $ELITE_TOME_NAMES_FROM_IDS[$itemID]
		Return $cache['Pick up items.Tomes.Elite.' & $tomeName]
	; --------------------------------------- Scrolls ---------------------------------------
	ElseIf IsGoldScroll($itemID) Then
		Local $scrollName = $GOLD_SCROLL_NAMES_FROM_IDS[$itemID]
		Local $pickup = $cache['Pick up items.Scrolls.Gold.' & $scrollName]
		If $pickup <> Null Then Return $pickup
		Return $cache['Pick up items.Scrolls.Gold.Other gold scrolls']
	ElseIf IsBlueScroll($itemID) Then
		Return $cache['Pick up items.Scrolls.Blue']
	; ----------------------------------------- Keys -----------------------------------------
	ElseIf IsKey($itemID) Then
		Return $cache['Pick up items.Keys']
	ElseIf ($itemID == $ID_LOCKPICK) Then
		Return True
	; ----------------------------------------- Dyes -----------------------------------------
	ElseIf ($itemID == $ID_DYES) Then
		Local $dyeColorID = DllStructGetData($item, 'DyeColor')
		Local $dyeColorName = $DYE_NAMES_FROM_IDS[$dyeColorID]
		Return $cache['Pick up items.Dyes.' & $dyeColorName]
	; --------------------------------- Gizmos & Quest items ---------------------------------
	ElseIf ($itemID == $ID_JAR_OF_INVIGORATION) Then
		Return False
	ElseIf IsMapPiece($itemID) Then
		Return $cache['Pick up items.Quest items.Map pieces']
	; ----------------------------------- Other stackables -----------------------------------
	ElseIf IsStackable($item) Then
		Return True
	EndIf
	Return False
EndFunc

#Region Loot items
; ;~ Loot items around character
; Func PickUpItems($defendFunction = Null, $shouldPickItem = DefaultShouldPickItem, $range = $RANGE_COMPASS)
	; If $inventory_management_cache['@pickup.nothing'] Then Return

	; Local $item
	; Local $agentID
	; Local $deadlock
	; Local $agents = GetAgentArray($ID_AGENT_TYPE_ITEM)
	; Local $me = GetMyAgent()
	; For $agent In $agents
		; If IsPlayerDead() Then Return
		; If Not GetCanPickUp($agent) Then ContinueLoop
		; If GetDistance($me, $agent) > $range Then ContinueLoop

		; $agentID = DllStructGetData($agent, 'ID')
		; $item = GetItemByAgentID($agentID)

		; If ($shouldPickItem($item)) Then
			; If $defendFunction <> Null Then $defendFunction()
			; If Not GetAgentExists($agentID) Then ContinueLoop
			; PickUpItem($item)
			; $deadlock = TimerInit()
			; While IsPLayerAlive() And GetAgentExists($agentID) And TimerDiff($deadlock) < 10000
				; RandomSleep(100)
			; WEnd
		; EndIf
	; Next

	; If $bags_count == 5 And CountSlots(1, 3) == 0 Then
		; MoveItemsToEquipmentBag()
	; EndIf
; EndFunc


; ;~ Tests if an item is assigned to you.
; Func GetAssignedToMe($agent)
	; Return DllStructGetData($agent, 'Owner') == GetMyID()
; EndFunc


; ;~ Tests if you can pick up an item.
; Func GetCanPickUp($agent)
	; Return GetAssignedToMe($agent) Or DllStructGetData($agent, 'Owner') = 0
; EndFunc
; #EndRegion Loot items