#include <Array.au3>

Func VQEasternFrontier()

		Local $aWaypoints[1][2]		
		
	Pathfinder_MoveTo_Waypoints($aWaypoints)
	Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)
EndFunc