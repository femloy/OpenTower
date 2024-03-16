function cutscene_wait(frames)
{
	timer++;
	if timer >= frames
	{
		timer = 0;
		cutscene_end_action();
	}
}
