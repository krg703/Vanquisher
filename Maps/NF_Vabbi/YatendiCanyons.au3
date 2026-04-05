#include <Array.au3>

Func VQYatendiCanyons()

		Local $aWaypointsA[][] = [ [20291, 477] _
		, [19922, -396] _
		, [17825, -607] _
		, [16384, -4880] _
		, [18106, -8354] _
		, [19513, -10994] _
		, [17522, -13023] _
		, [16726, -18074] _
		, [16907, -18980] _
		, [15102, -17128] _
		, [11307, -19059] _
		, [7142, -16674] _
		, [8972, -13722] _
		, [9981, -11332] _
		, [11795, -10457] ]

		Local $aWaypointsB[][] = [ [13664, -17589] _
		, [6508, -16853] _
		, [605, -16238] ]

		Local $aWaypointsC[][] = [ [-2970, -14463] _
		, [-6166, -11651] _
		, [-5954, -8503] _
		, [-8937, -10417] _
		, [-11155, -11101] ]
		
		Local $aWaypointsD[][] = [ [-15595, -13564] _
		, [-18466.30, -12050.60] _
		, [-16031, -14150] _
		, [-17012, -17188] _
		, [-17898, -18981] _
		, [-15770, -17227] _
		, [-15320, -19497] _
		, [-13944, -17383] _
		, [-13360, -17791] _
		, [-10510, -20639] _
		, [-8547, -18278] _
		, [-10902, -20161] _
		, [-14155, -16732] _
		, [-15995, -15010] _
		, [-17189, -11735] _
		, [-12755, -12657] _
		, [-10358, -8597] _
		, [-6582, -7868] _
		, [-3020, -7279] _
		, [1802, -5682] _
		, [3191, -4697] _
		, [3815, -2015] _
		, [4234, -851] _
		, [5387, 570] _
		, [7182, 2195] _
		, [8319, 2112] _
		, [7864, 5265] _ 
		, [8005, 7598] _
		, [6743, 9059] _
		, [10224, 9013] ]
		
		Local $aWaypointsE[][] = [ [10384, 13095] _
		, [6827, 12399] _
		, [5771, 12851] _
		, [7116, 15469] _
		, [7212, 16543] _
		, [11678, 13738] _
		, [12679, 16394] _
		, [9762, 17903] _
		, [16135, 19529] _
		, [11313, 16440] _
		, [7856, 11848] _
		, [6949, 9197] _
		, [5311, 6715] _
		, [3825, 5671] _
		, [3249, 5057] _
		, [1640, 3399] _
		, [-1373, -621] _
		, [-1354, -3942] _
		, [1180, -6005] ]
		
		Local $aWaypoints = $aWaypointsA
		_ArrayAdd($aWaypoints, $aWaypointsB)
		_ArrayAdd($aWaypoints, $aWaypointsC)
		_ArrayAdd($aWaypoints, $aWaypointsD)
		_ArrayAdd($aWaypoints, $aWaypointsE)

		GetBlessing(17575, -6019)
		Pathfinder_MoveTo_Waypoints($aWaypointsA)

		GetBlessing(12247, -12688)
		Pathfinder_MoveTo_Waypoints($aWaypointsB)
		
		GetBlessing(-2736, -16359)
		Pathfinder_MoveTo_Waypoints($aWaypointsC)
		
		GetBlessing(-14088, -14200)
		Pathfinder_MoveTo_Waypoints($aWaypointsD)
		
		GetBlessing(10624, 9662)
		Pathfinder_MoveTo_Waypoints($aWaypointsE)
		
		Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)
EndFunc