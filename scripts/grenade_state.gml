/// grenade_state

grenadeObject = instance_create(x+(image_xscale*10), y+5, obj_Grenade);
grenadeObject.speed = 3.5;

// Check direction
if (image_xscale == 1)
    grenadeObject.direction = 0;
else
    grenadeObject.direction = 180;
