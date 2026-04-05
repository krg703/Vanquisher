#include <Array.au3>

Func VQSaoshangTrail()

	    Local $aWaypoints[9][2] = [ [15519, 13409] _			
            , [14502, 13165] _
            , [12763, 12433] _
            , [9805, 10947] _
            , [8691, 11878] _
            , [8329, 12867] _
            , [7215, 13842] _
            , [6003, 13827] _
            , [3584, 10280] ]

	Pathfinder_MoveTo_Waypoints($aWaypoints)
	Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)

EndFunc

