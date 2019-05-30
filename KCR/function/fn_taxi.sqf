	_air = false;
	
	_passengerSize = _this#0;
	_pos1 = _this#1;
	_pos2 = _this#2;
	_side = _this#3;
	_air = _this#4;
	
	// if(_air == true)then{[] call airTaxi;}
	
	if(_side == BLUFOR)then{[_passengerSize, _pos1, _pos2] execVM "KCR\function\fn_callTaxiB.sqf";};
	if(_side == OPFOR)then{[_passengerSize, _pos1, _pos2] execVM "KCR\function\fn_callTaxiB.sqf";};
	if(_side == Independent)then{[_passengerSize, _pos1, _pos2] execVM "KCR\function\fn_call callTaxiB.sqf";};