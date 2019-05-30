	_passengerSize = _this#0;
	_pos1 = _this#1;
	_pos2 = _this#2;
	
	_taxi = 0;
	_caseNum = 0;
	
	// use max passenger value
	if(0 < _passengerSize&&_passengerSize <= 4)then{_caseNum = 1};
	if(4 < _passengerSize&&_passengerSize <= 6)then{_caseNum = 2};
	if(6 < _passengerSize&&_passengerSize <= 13)then{_caseNum = 3};
	if(13 < _passengerSize&&_passengerSize <= 16)then{_caseNum = 4};
	
		switch(_caseNum)do{
	case 1: { _taxi = "O_MRAP_02_F" createVehicle _pos1};				//max passenger 4
	case 2: { _taxi = "O_LSV_02_unarmed_F" createVehicle _pos1};		//max passenger 6
	case 3: { _taxi = "O_Truck_03_transport_F" createVehicle _pos1};	//max passenger 13
	case 4: { _taxi = "O_Truck_02_transport_F" createVehicle _pos1};	//max passenger 16
	default {hint "passengerCount is out of range"};
	};
	
	createVehicleCrew _taxi;
	
	_taxi addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];
	
		if(call BIS_fnc_listPlayers isEqualTo (crew _vehicle select {isplayer _x}))then{
		_vehicle doMove getPos taxiPos2;
		};
	}];