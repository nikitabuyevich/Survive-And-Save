/// scr_shoot_state

if (shoot_key){
if (!place_meeting(x, y+1, obj_inherit_Solid)){
    vSpd += grav; //make sure theres gravity

    if (hSpd == 0){ // player is standing still and shooting
               
        scr_shooting_idling(); //spawn bullets
 
    } else {
        scr_shooting_walking();
    }
    
    // Control the jump height
    if (up_release && vSpd < initialJumpH) {
        vSpd = initialJumpH;
    }
} else {
    vSpd = 0;
    
    // go to roll state
    if (roll_key) {
        state = roll_state;
    }
    
    // Jumping and shooting
    if (up) {
        vSpd = maxJumpH;    
        audio_play_sound(snd_jump, 5, false);
    }
    
    
    if (hSpd == 0){ // player is standing still and shooting
               
        scr_shooting_idling(); //spawn bullets

        
    }
     //player is walking and shooting
       
     scr_shooting_walking();
    
} 

//flip character depending which was he's facing
if (hSpd != 0 && (right-left) != 0) {
    image_xscale = sign(right-left);
}

scr_landing_sound(); //play landing sound



scr_move(obj_inherit_Solid); // make sure theres no collisions

} else
    state = move_state;

