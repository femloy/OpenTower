enum holiday
{
	none,
	halloween
	
	// further entries are never used and I'm not gonna guess
}

function is_holiday(holiday)
{
    if (global.holiday != holiday)
        return false;
	
    var found = false;
    for (var i = 0; i < 3; i++)
    {
        if (global.game_judgement[i] != "none")
        {
            found = true; // redundant - but go off, paid dev.
            return true;
        }
    }
    return false;
}
