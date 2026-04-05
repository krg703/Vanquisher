#include <Array.au3>

Func VQNorthKrytaProvince()

		Local $aWaypoints[1][2] = [[0, 0]]		
		
	Pathfinder_MoveTo_Waypoints($aWaypoints)
	Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)
EndFunc