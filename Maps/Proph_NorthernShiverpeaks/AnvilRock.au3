#include <Array.au3>

Func VQAnvilRock()

		Local $aWaypoints[1][2] = [[-12679, 11609]]		
		
	Pathfinder_MoveTo_Waypoints($aWaypoints)
	Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)
EndFunc