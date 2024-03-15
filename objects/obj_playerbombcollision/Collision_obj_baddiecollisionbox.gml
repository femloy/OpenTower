var baddie = other.baddieID
if (!instance_exists(baddie))
    exit;

if (baddie.object_index == obj_gustavograbbable)
    exit;
if (baddie.object_index == obj_fakepepboss && baddie.state == states.deformed)
    exit;
if (baddie.object_index == obj_vigilanteboss && (baddie.state == states.hit || (baddie.state == states.mach2 && (!baddie.kick)) || baddie.flickertime > 0 || baddie.reposition))
    exit;

if (baddie.object_index == obj_noiseboss && (baddie.state == states.walk || baddie.state == states.droptrap) && baddie.droptrap)
{
    with (bombID)
        deadbuffer--;
    exit;
}
if (baddie.object_index == obj_pizzafaceboss && baddie.state == states.pizzaface_ram && baddie.substate == states.land && baddie.elitehit == 1)
{
    with (bombID)
    {
        deadbuffer = 100;
        array_push(baddie_arr, [baddie.id, obj_baddie]);
        instance_destroy();
    }
    exit;
}
if ((!baddie.invincible) || baddie.object_index == obj_vigilanteboss || baddie.object_index == obj_fakepepboss || baddie.object_index == obj_pizzafaceboss_p2)
{
    with (bombID)
    {
        deadbuffer = 100;
        array_push(baddie_arr, [baddie.id, obj_baddie]);
        instance_destroy();
    }
}
else if ((baddie.object_index != obj_pizzafaceboss || ((baddie.state != states.pizzaface_ram || baddie.substate != states.jump) && baddie.state != states.walk)) && (baddie.object_index != obj_pepperman || baddie.state != states.mini))
{
    with (bombID)
        deadbuffer--;
}
