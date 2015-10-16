/// scr_roll_state();

/*
Rolls the player at a fast speed and gives the player movement speed
and gravity.
*/
image_speed = 0.3;
sprite_index = spr_player_rolling;

if (hSpd != 0) { //make sure player rolls in correct direction
    image_xscale = sign(hSpd);
}

hSpd = image_xscale*obj_Player.rollDist; //roll at the desired speed
if (!place_meeting(x, y+1, obj_inherit_Solid)){
vSpd += grav; //make sure theres gravity
}
    
scr_landing_sound(); //play landing sound

scr_move(obj_inherit_Solid); // make sure theres no collisions
    


