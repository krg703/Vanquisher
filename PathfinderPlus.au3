; Movement state
Global $g_aPathfinder_CurrentPath[0][4]  ; x, y, layer, tp_type
Global $g_iPathfinder_CurrentPathIndex = 0
Global $g_hPathfinder_LastPathUpdateTime = 0

; Configuration
Global $g_iPathfinder_PathUpdateInterval = 1000      ; Interval before recalculating path (ms)
Global $g_iPathfinder_WaypointReachedDistance = 250 ; Distance to consider waypoint reached
Global $g_iPathfinder_SimplifyRange = 1250           ; Path simplification range
Global $g_iPathfinder_ObstacleUpdateInterval = 1000  ; Interval for dynamic obstacle updates (ms)
Global $g_iPathfinder_StuckCheckInterval = 500      ; Interval to check if stuck (ms)
Global $g_iPathfinder_StuckDistance = 100           ; If moved less than this, consider stuck
Global $g_iPathfinder_UnstuckDirectionIndex = 0     ; Current direction index for unstuck (0-7, cycles through 16 directions)
Global $g_sPathfinder_SwitchTeleportFunc = ""        ; Callback for switch-activated teleporters: MyFunc($x, $y)

; Move to a destination using pathfinding with obstacle avoidance
; $aDestX, $aDestY = Destination coordinates
; $aObstacles = Can be:
;   - 0: No obstacles (uses standard pathfinding)
;   - 2D array [[x, y, radius], ...]: Static obstacles
;   - String "FunctionName": Dynamic obstacles (function called periodically)
; $aAggroRange = Range to detect and fight enemies
; $aFightRangeOut = Range out for fighting
; $aFinisherMode = Finisher mode for UAI_Fight
; Returns: True if destination reached, False if interrupted
; 

Func Pathfinder_MoveTo_Plus($aDestX, $aDestY, $aDestLayer = -1, $aObstacles = 0, $aAggroRange = 1320, $aFightRangeOut = 3500, $aFinisherMode = 0, $aCallFunc = "")
    Local $lMyOldMap = Map_GetMapID()
    Local $lMapLoadingOld = Map_GetInstanceInfo("Type")
    Local $lMyX = Agent_GetAgentInfo(-2, "X")
    Local $lMyY = Agent_GetAgentInfo(-2, "Y")
	Local $lAgentLayer = Agent_GetAgentInfo(-2, "Plane")
	Local $lWaypointLayer = $lAgentLayer
	Local $lNeedPathUpdate = False
	Local $lMyXOld 
    Local $lMyYOld
    Local $lAgentLayerOld
	Local $lDidSomething = False


	; Map was not full loaded
	If $lMyX = 0 Or $lMyY = 0 Or $lMyOldMap = 0 Or $lMapLoadingOld = $GC_I_MAP_TYPE_LOADING Then
		Do
			Sleep(16)
		Until Map_GetMapID() <> 0 And (Agent_GetAgentInfo(-2, "X") <> 0 Or Agent_GetAgentInfo(-2, "Y") <> 0)

		Other_WaitPingStabilized(1500)

		$lMyOldMap = Map_GetMapID()
		$lMapLoadingOld = Map_GetInstanceInfo("Type")
		$lMyX = Agent_GetAgentInfo(-2, "X")
		$lMyY = Agent_GetAgentInfo(-2, "Y")
		$lAgentLayer = Agent_GetAgentInfo(-2, "Plane")
		$lWaypointLayer = $lAgentLayer
	EndIf

	; Initialize DLL if not already loaded
    If $g_hPathfinderDLL = 0 Or $g_hPathfinderDLL = -1 Then
        Local $lInitResult = Pathfinder_Initialize()
        If $lInitResult = 0 Then
            ; DLL failed to load - fallback to direct movement
            Out("[Pathfinder] ERROR: Failed to initialize DLL")
            If Map_GetMapID() = $lMyOldMap Then
				Map_MoveLayer($aDestX, $aDestY, $lAgentLayer)
			Else
				Agent_CancelAction()
			EndIf
            Return False
        ElseIf $lInitResult = 2 Then
            Out("[Pathfinder] WARNING: maps.rar and maps/ folder not found - pathfinding may not work")
        EndIf
    EndIf

	; Return false if party is defeated
    If Party_GetPartyContextInfo("IsDefeated") Then
	Out("Testo: Shutdown dll")
        Pathfinder_Shutdown()
        Return False
    EndIf

    ; Determine obstacle mode
    Local $lIsDynamicObstacles = IsString($aObstacles) And $aObstacles <> "" And $aObstacles <> "0"
    Local $lCurrentObstacles = 0

    If $lIsDynamicObstacles Then
        $lCurrentObstacles = Call($aObstacles)
    ElseIf IsArray($aObstacles) Then
        $lCurrentObstacles = $aObstacles
    EndIf

    Local $lPath = _Pathfinder_GetPath($lMyX, $lMyY, $lAgentLayer, $aDestX, $aDestY, $aDestLayer, $lCurrentObstacles)
    If Not IsArray($lPath) Or UBound($lPath) = 0 Then
        ; Path calculation failed - use empty path and rely on direct movement
        Local $lEmptyPath[0][4]
        $lPath = $lEmptyPath
		If Map_GetMapID() = $lMyOldMap Then
			Map_MoveLayer($aDestX, $aDestY, $lAgentLayer)
		Else
			Agent_CancelAction()
		EndIf
    EndIf

    ; Initialize path tracking
    $g_aPathfinder_CurrentPath = $lPath
    $g_iPathfinder_CurrentPathIndex = 0
    $g_hPathfinder_LastPathUpdateTime = TimerInit()

    Local $lLastObstacleUpdate = TimerInit()
    Local $lLastStuckCheckTime = TimerInit()
    Local $lLastStuckCheckX = $lMyX
    Local $lLastStuckCheckY = $lMyY
    Local $lStuckCount = 0

    ; Main movement loop
    Do
        ; Check for map change
        If (Map_GetMapID() <> $lMyOldMap And Not Game_GetGameInfo("IsCinematic")) Or Map_GetInstanceInfo("Type") <> $lMapLoadingOld Then
            Out("Testo: Shutdown dll")
			Pathfinder_Shutdown()
            Return False
        EndIf

		; Need to return to outpost
        If Party_GetPartyContextInfo("IsDefeated") Then
            Out("Testo: Shutdown dll")
			Pathfinder_Shutdown()
            Return False
        EndIf

		; wait until rez
		If Agent_GetAgentInfo(-2, "IsDead") Then
			Do
				Sleep(100)
			Until Not Agent_GetAgentInfo(-2, "IsDead")
			
			Do
				Sleep(100)
			Until Agent_GetAgentInfo(-2, "X") <> 0 And Agent_GetAgentInfo(-2, "Y") <> 0
			
			Other_WaitPingStabilized(500)
			
			Local $lEmptyPath[0][4]
            $g_aPathfinder_CurrentPath = $lEmptyPath
            $g_iPathfinder_CurrentPathIndex = 0
			$lNeedPathUpdate = True
			Out("NeedPathUpdateRez" & $lNeedPathUpdate)
			ContinueLoop
		EndIf

        $lMyX = Agent_GetAgentInfo(-2, "X")
        $lMyY = Agent_GetAgentInfo(-2, "Y")
		$lAgentLayer = Agent_GetAgentInfo(-2, "Plane")

        ; Update obstacles (dynamic mode only)
        If $lIsDynamicObstacles And TimerDiff($lLastObstacleUpdate) > $g_iPathfinder_ObstacleUpdateInterval Then
            $lCurrentObstacles = Call($aObstacles)
            $lLastObstacleUpdate = TimerInit()
            $lNeedPathUpdate = True
        EndIf

        ; Stuck detection
        If TimerDiff($lLastStuckCheckTime) > $g_iPathfinder_StuckCheckInterval Then
            Local $lMovedDistance = _Pathfinder_Distance($lMyX, $lMyY, $lLastStuckCheckX, $lLastStuckCheckY)
            If $lMovedDistance < $g_iPathfinder_StuckDistance Then
                $lStuckCount += 1
                If $lStuckCount >= 2 Then
                    ; Directions in opposite pairs: N, S, E, W, NE, SW, NW, SE
                    Local $lUnstuckAngles[8] = [1.5707963, 4.7123890, 0.0, 3.1415927, 0.7853982, 3.9269908, 2.3561945, 5.4977871]
                    Local $lAngle = $lUnstuckAngles[$g_iPathfinder_UnstuckDirectionIndex]
                    If Map_GetMapID() = $lMyOldMap Then
						Map_MoveLayer($lMyX + Cos($lAngle) * 500, $lMyY + Sin($lAngle) * 500, $lAgentLayer)
					Else
						Agent_CancelAction()
					EndIf
                    Sleep(750)
                    $g_iPathfinder_UnstuckDirectionIndex = Mod($g_iPathfinder_UnstuckDirectionIndex + 1, 8)
                    $lStuckCount = 0
					$lNeedPathUpdate = True
                EndIf
            Else
                $lStuckCount = 0
            EndIf
            $lLastStuckCheckX = $lMyX
            $lLastStuckCheckY = $lMyY
            $lLastStuckCheckTime = TimerInit()
        EndIf

        ; Recalculate path at every interval (always from current position)
        If TimerDiff($g_hPathfinder_LastPathUpdateTime) > $g_iPathfinder_PathUpdateInterval Or $lNeedPathUpdate Then
            $lPath = _Pathfinder_GetPath($lMyX, $lMyY, $lAgentLayer, $aDestX, $aDestY, $aDestLayer, $lCurrentObstacles)
            If IsArray($lPath) And UBound($lPath) > 0 Then
                $g_aPathfinder_CurrentPath = $lPath
                $g_iPathfinder_CurrentPathIndex = 0
            Else
				Out("Testo: direct movement")
                ; Path calculation failed - clear path so we use direct movement
                Local $lEmptyPath[0][4]
                $g_aPathfinder_CurrentPath = $lEmptyPath
                $g_iPathfinder_CurrentPathIndex = 0
            EndIf
            $g_hPathfinder_LastPathUpdateTime = TimerInit()
			$lNeedPathUpdate = False
        EndIf

        ; Move to current waypoint
        If $g_iPathfinder_CurrentPathIndex >= UBound($g_aPathfinder_CurrentPath) Then
            If Map_GetMapID() = $lMyOldMap Then
				Map_MoveLayer($aDestX, $aDestY, $lAgentLayer)
			Else
				Agent_CancelAction()
			EndIf
        Else
            Local $lWaypointX = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][0]
            Local $lWaypointY = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][1]
            $lWaypointLayer = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][2]

            If _Pathfinder_Distance($lMyX, $lMyY, $lWaypointX, $lWaypointY) < $g_iPathfinder_WaypointReachedDistance Then
                ; Check if reached waypoint is a switch-activated teleporter (tp_type == 3)
                Local $lTpType = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][3]
                If $lTpType = 3 And $g_sPathfinder_SwitchTeleportFunc <> "" Then
                    _Pathfinder_Log("Switch teleporter reached at (" & Round($lWaypointX, 1) & ", " & Round($lWaypointY, 1) & ") - calling activation callback")
                    Call($g_sPathfinder_SwitchTeleportFunc, $lWaypointX, $lWaypointY)
                EndIf

                $g_iPathfinder_CurrentPathIndex += 1
                If $g_iPathfinder_CurrentPathIndex < UBound($g_aPathfinder_CurrentPath) Then
                    $lWaypointX = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][0]
                    $lWaypointY = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][1]
                    $lWaypointLayer = $g_aPathfinder_CurrentPath[$g_iPathfinder_CurrentPathIndex][2]
                Else
                    $lWaypointX = $aDestX
                    $lWaypointY = $aDestY
                    $lWaypointLayer = $lAgentLayer
                EndIf
            EndIf

            ; Use Map_MoveLayer to move to the correct layer (important for bridges)
            If Map_GetMapID() = $lMyOldMap Then
				Map_MoveLayer($lWaypointX, $lWaypointY, $lWaypointLayer)
			Else
				Agent_CancelAction()
			EndIf
        EndIf

        ; Fight if needed
        If Map_GetInstanceInfo("Type") = $GC_I_MAP_TYPE_EXPLORABLE Then
			UAI_Fight($lMyX, $lMyY, $aAggroRange, $aFightRangeOut, $aFinisherMode)

			; Wait heroes if they are too far
			If _Pathfinder_ShouldWaitForParty(2000, 1320) Then
				Local $lWaitTimer = TimerInit()
				Do
					Agent_CancelAction()
					Sleep(250)
				Until _Pathfinder_PartyWithinRange(1320) Or TimerDiff($lWaitTimer) > 30000
			EndIf

			; Wait for resurrection if needed
            If _Pathfinder_ShouldWaitForResurrection() Then
                _Pathfinder_WaitForResurrection()
            EndIf
		EndIf

		Sleep(32)
		$lMyXOld = Agent_GetAgentInfo(-2, "X")
		$lMyYOld = Agent_GetAgentInfo(-2, "Y")
		$lAgentLayerOld = Agent_GetAgentInfo(-2, "Plane")

		If $aCallFunc <> "" Then 
			$lDidSomething = Call($aCallFunc)
			IF $lDidSomething Then
			Out("$lDidSomething")
				; Nach externem Callback Position/Layer neu einlesen
				$lMyX = Agent_GetAgentInfo(-2, "X")
				$lMyY = Agent_GetAgentInfo(-2, "Y")
				$lAgentLayer = Agent_GetAgentInfo(-2, "Plane")
			
				; aktuellen Pfad verwerfen und in der nächsten Runde neu berechnen
				Local $lEmptyPath[0][4]
				$g_aPathfinder_CurrentPath = $lEmptyPath
				$g_iPathfinder_CurrentPathIndex = 0
				$lNeedPathUpdate = True
				$lDidSomething = False
				Out("einmal neu")
				ContinueLoop
			EndIf
		EndIf

		If Game_GetGameInfo("IsCinematic") Then Other_WaitPingStabilized(2000)

    Until Agent_GetDistanceToXY($aDestX, $aDestY) < 125

	Agent_CancelAction()
	Out("Testo: Shutdown dll")
    ; Shutdown DLL and free memory
    Pathfinder_Shutdown()

    Return True
EndFunc
