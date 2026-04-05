#include <Array.au3>

Func VQShadowsPassage()

		Local $aWaypoints[][] = [ [3396, 16639] _
		, [2094, 18885] _
		, [61, 18889] _
		, [-682, 13737] _
		, [-3699, 14519] _
		, [-4161, 17014] ]

	Pathfinder_MoveTo_Waypoints($aWaypoints)
	Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)

EndFunc

