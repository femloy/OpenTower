function Vector2(_x, _y) constructor
{
	/* STOLEN! https://www.youtube.com/watch?v=03I8z1rwsaQ
	or https://forum.gamemaker.io/index.php?threads/basic-vector-functions-in-2-3-proper-way.76549/
	*/
	
	static Update = function(_x, _y)
	{
		x = _x;
		y = _y;
	};
	static UpdateVector = function(_vector)
	{
		x = _vector.x;
		y = _vector.y;
	};
	static Add = function(_x, _y)
	{
		x += _x;
		y += _y;
	};
	static AddVector = function(_vector)
	{
		x += _vector.x;
		y += _vector.y;
	};
	static Multiply = function(_x, _y)
	{
		x *= _x;
		y *= _y;
	};
	static Divide = function(_x, _y)
	{
		x /= _x;
		y /= _y;
	};
	static MultiplyVector = function(_vector)
	{
		x *= _vector.x;
		y *= _vector.y;
	};
	static DivideVector = function(_vector)
	{
		x /= _vector.x;
		y /= _vector.y;
	};
	x = _x;
	y = _y;
}
function magnitude(a, b)
{
	return sqrt(abs(a) + abs(b));
}
function cycle(value, _min, _max)
{
	// STOLEN! https://forum.gamemaker.io/index.php?threads/smooth-camera-rotation.84059/
	var result, delta;
	delta = (_max - _min);
	result = (value - _min) % delta;
	if (result < 0) result += delta;
	return result + _min;
}
function angle_rotate(angle, target, speed)
{
	// STOLEN! https://forum.gamemaker.io/index.php?threads/smooth-camera-rotation.84059/
	var diff;
	diff = cycle(target - angle, -180, 180);
	if (diff < -speed) return angle - speed;
	if (diff > speed) return angle + speed;
	return target;
}
function get_velocity(a, b)
{
	return a / b;
}
function Wave(from, to, duration, offset, time = noone)
{
	// STOLEN! https://forum.gamemaker.io/index.php?threads/wave-script.62475/
	var a4 = (to - from) * 0.5;
	
	var t = current_time;
	if time != noone
		t = time;
	
	return from + a4 + (sin((((t * 0.001) + (duration * offset)) / duration) * (pi * 2)) * a4);
}
function distance_to_pos(x1, y1, x2, y2, threshold_x, threshold_y)
{
	return abs(x1 - x2) <= threshold_x && abs(y1 - y2) <= threshold_y;
}
function distance_between_points(x1, y1, x2, y2)
{
	return sqrt(sqr(x2 - x1) + sqr(y2 - y1));
}
function calculate_jump_velocity_alt(targetx, targety, spd, grav)
{
	var xx = targetx - x;
	var yy = targety - y;
	var g = grav;
	var tmp = power(spd, 4) - (g * ((g * power(xx, 2)) + (2 * yy * power(spd, 2))));
	if tmp > 0
	{
		if xx == 0
		{
			var a1 = pi / 2;
			if yy < 0
				var a2 = -pi / 2;
			else
				a2 = pi / 2;
		}
		else
		{
			a1 = arctan2(power(spd, 2) + sqrt(tmp), g * xx);
			a2 = arctan2(power(spd, 2) - sqrt(tmp), g * xx);
		}
		hsp = cos(a1) * spd * 1.2;
		vsp = cos(a2) * spd;
		if vsp > 0
			vsp *= -1;
		hsp = abs(hsp) * sign(xx);
	}
}
function calculate_jump_velocity(targetx, targety, s, g)
{
	var a = get_projectile_angle(x, y, targetx, targety, s, g);
	hsp = lengthdir_x(s, a);
	vsp = lengthdir_y(s, a);
}
function get_projectile_angle(x, y, targetx, targety, s, g)
{
	// STOLEN! https://www.reddit.com/r/gamemaker/comments/qfkzuf/projectile_trajectory_math/
	var xt = floor(targetx - x);
	var yt = -floor(targety - y);
	var root = power(s,4) - g*(g*sqr(xt) + 2*sqr(s)*yt);
	var angle = 0;
	
	if (root > 0) 
	{
		angle = radtodeg( arctan( (sqr(s) + sqrt( root ) ) / (g*xt) ));
		if (xt < 0) angle -= 180;
	}
	else 
	{
		if (xt > 0)	angle = 45;
		else angle = 135;
	}
	
	return angle;
}
