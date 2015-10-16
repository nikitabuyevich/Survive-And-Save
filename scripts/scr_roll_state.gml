/// scr_roll_state();

/*
Rolls the player at a fast speed and gives the player movement speed
and gravity.
*/
image_speed = 0.3;
sprite_index = spr_player_rolling;


//flip character depending which was he's facing
if (hSpd != 0 && (right-left) != 0 && !obj_Player.rolledOnce) {
    image_xscale = sign(right-left);
    obj_Player.rolledOnce = true;
}

hSpd = image_xscale*obj_Player.rollDist; //roll at the desired speed
if (!place_meeting(x, y+1, obj_inherit_Solid)){
vSpd += grav; //make sure theres gravity
}



scr_move(obj_inherit_Solid); // make sure theres no collisions
    


