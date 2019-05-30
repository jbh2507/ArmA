	_passengerSize = _this#0;
	_pos1 = _this#1;
	_pos2 = _this#2;
	
	_taxi = 0;
	_caseNum = 0;
	
	// use max passenger value
	if(0 < _passengerSize&&_passengerSize <= 3)then{_caseNum = 1};
	if(3 < _passengerSize&&_passengerSize <= 16)then{_caseNum = 2};
	
		switch(_caseNum)do{
	case 1: { _taxi = "I_MRAP_03_F" createVehicle _pos1};				//max passenger 2+1(2 pass and 1 comm)
	case 2: { _taxi = "I_Truck_02_transport_F" createVehicle _pos1};	//max passenger 16
	default {hint "passengerCount is out of range"};
	};
	
	createVehicleCrew _taxi;
	
	_taxi addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];
	
		if(call BIS_fnc_listPlayers isEqualTo (crew _vehicle select {isplayer _x}))then{
		_vehicle doMove getPos taxiPos2;
		};
	}];