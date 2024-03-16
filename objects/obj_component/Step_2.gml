with inst
{
	if !selected
		instance_destroy(other)
}
if (!instance_exists(inst))
	instance_destroy()
