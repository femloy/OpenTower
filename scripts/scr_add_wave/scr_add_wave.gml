function scr_add_wave(wave, enemynumber, object, rand, spawnpoint)
{
	var _wave = wave;
	var _enemynumber = enemynumber;
	var _obj = object;
	var _random = rand;
	var _spawnpoint = spawnpoint;
	
	baddie_arr[_wave][_enemynumber] = _obj;
	baddie_random[_wave][_enemynumber] = _random;
	if (!_random)
		baddie_spawnpoint[_wave][_enemynumber] = _spawnpoint;
}
