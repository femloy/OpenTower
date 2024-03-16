if !parryable
	exit;
parry();
with other
{
	if !collisioned
		event_user(0);
}
