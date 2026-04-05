#RequireAdmin

Func VQTheRupturedHeart()

	Local $aWaypointsA[0][2] = [ [0, 0] ]

	Local $aWaypointsB[0][2] = [ [0, 0] ]

	Local $aWaypointsC[0][2] = [ [0, 0] ]

	Local $aWaypoints = $aWaypointsA
	_ArrayAdd($aWaypoints, $aWaypointsB)
	_ArrayAdd($aWaypoints, $aWaypointsC)
	_ArrayAdd($aWaypoints, $aWaypointsC)
	
	GetBlessing(0, 0)
	Pathfinder_MoveTo_Waypoints($aWaypointsA)

	GetBlessing(0, 0)
	Pathfinder_MoveTo_Waypoints($aWaypointsB)

	GetBlessing(0, 0)
	Pathfinder_MoveTo_Waypoints($aWaypointsC)

	GetBlessing(0, 0)
	Pathfinder_MoveTo_Waypoints($aWaypointsD)

	Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)
	
EndFunc