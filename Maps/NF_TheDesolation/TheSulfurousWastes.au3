#include <Array.au3>

Func VQTheSulfurousWastes()

		Local $aWaypointsA[13][2] = [ [ 25522, -4436] _
		, [ 24325, -2826] _
		, [ 24948, 259] _
		, [ 22699, 2364] _
		, [ 22264, 3884] _
		, [ 21187, 4286] _
		, [ 22449, 324] _
		, [ 20662, -1404] _
		, [ 16996, -1145] _
		, [ 18136, -4457] _
		, [ 15832, -5071] _
		, [ 17250, -8849] _
		, [ 16039, -9571] ]
	
		Local $aWaypoints[13][2] = [ [ 25522, -4436] _
		, [ 24325, -2826] _
		, [ 24948, 259] _
		, [ 22699, 2364] _
		, [ 22264, 3884] _
		, [ 21187, 4286] _
		, [ 22449, 324] _
		, [ 20662, -1404] _
		, [ 16996, -1145] _
		, [ 18136, -4457] _
		, [ 15832, -5071] _
		, [ 17250, -8849] _
		, [ 16039, -9571] ]
		
		GoNearestNPCToCoords(24412, -10695)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		
		AggroMoveTo(23368, -6278)
		AggroMoveTo(21141, -5736)
		
		MoveTo(24080, -5864)
		RndSleep(5000)
		TargetNearestItem()
		RndSleep(750)
		GoSignpost(-1)
		RndSleep(750)
		
		MoveandAggroVQWurm($aWaypointsA)

		MoveAndAggroVQReverse($aWaypoints)

EndFunc