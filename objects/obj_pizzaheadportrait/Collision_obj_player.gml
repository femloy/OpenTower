if other.state != states.handstandjump && !hasgrabbed
{
	if other.state != states.knightpep && other.state != states.knightpepbump
		scr_hurtplayer(other);
}
else if !move
	event_inherited();
