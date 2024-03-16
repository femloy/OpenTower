if global.panic == true && room != freezer_secret1
	instance_destroy();
if (!instance_exists(obj_randomsecret) && room == freezer_secret1 && global.noisejetpack && (obj_player1.ispeppino || obj_player1.noisepizzapepper))
	instance_destroy();
