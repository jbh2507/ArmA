	_passengerSize = _this#0;
	_pos1 = _this#1;
	_pos2 = _this#2;
	
	_taxi = 0;
	_caseNum = 0;
	
	// use max passenger value
	if(0 < _passengerSize&&_passengerSize <= 3)then{_caseNum = 1};
	if(3 < _passengerSize&&_passengerSize <= 6)then{_caseNum = 2};
	if(6 < _passengerSize&&_passengerSize <= 17)then{_caseNum = 3};
	
	switch(_caseNum)do{
	case 1: { _taxi = "B_MRAP_01_F" createVehicle _pos1}; 				//max passenger 3
	case 2: { _taxi = "B_LSV_01_unarmed_F" createVehicle _pos1};		//max passenger 6
	case 3: { _taxi = "B_Truck_01_transport_F" createVehicle _pos1};	//max passenger 17
	default {hint "passengerCount is out of range"};
	};
	
	createVehicleCrew _taxi;
	
	_taxi addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];
	
		if(call BIS_fnc_listPlayers isEqualTo (crew _vehicle select {isplayer _x}))then{
		_vehicle doMove getPos taxiPos2;
		};
	}];