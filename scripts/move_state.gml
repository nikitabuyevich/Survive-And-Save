/// move_state();

/*
Main part of the whole program. This is the state the players at most of the time. This is where
you should be checking things regularly.
*/

if (shoot_key) {
    state = shoot_state;
}

// Implementing gravity
if (!place_meeting(x, y+1, obj_inherit_Solid)){
    vSpd += grav;
    
    // Player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = (vSpd > 0);
    
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
    
    // Jumping
    if (up) {
        vSpd = maxJumpH;    
        audio_play_sound(snd_jump, 5, false);
    }
    
    // Player on the ground
    if (hSpd == 0){
        image_speed = 0.1;
        sprite_index = spr_player_idle;
        
        
    }
    else {
        image_speed = 0.2;
        sprite_index = spr_player_walk;
    }
}   


// Move character based on keyboard arrows
// and check for walls
if (right || left) {
    hSpd += (right-left)*accel;
    
    // left side wall jump
    if (place_meeting(x-1, y, obj_inherit_Solid) && !place_meeting(x, y+1, obj_inherit_Solid) ){
        sprite_index = spr_player_ledge_grab;
        if (vSpd < 0)
            vSpd += 0.25; 
        else
            vSpd = 1.35;
        if (!left && !down)
            vSpd = initialJumpH;
    }
    
    // right side wall jump
    if (place_meeting(x+1, y, obj_inherit_Solid) && !place_meeting(x, y+1, obj_inherit_Solid) ){
        sprite_index = spr_player_ledge_grab;
        if (vSpd < 0)
            vSpd += 0.25; 
        else
            vSpd = 1.35;
        if (!right && !down)
            vSpd = initialJumpH;
    }
    
    if (hSpd > maxSpd)
        hSpd = maxSpd;
    
    if (hSpd < -maxSpd)
        hSpd = -maxSpd;
} else {
    apply_friction(accel);
}

//flip character depending which was he's facing
if (hSpd != 0 && (right-left) != 0) {
    image_xscale = sign(right-left);
}

scr_landing_sound(); //play landing sound

scr_move(obj_inherit_Solid); // make sure theres no collisions

// Check for ledge grab state
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, obj_inherit_Solid);
var is_wall = position_meeting(x+17*image_xscale, y, obj_inherit_Solid);

if (falling && wasnt_wall && is_wall) {
    hSpd = 0;
    vSpd = 0;
    
    // Move against the ledge
    while (!place_meeting(x+image_xscale, y, obj_inherit_Solid)){
        x += image_xscale;
    }
    
    // Make sure we are the right height
    while (position_meeting(x+17*image_xscale, y-1, obj_inherit_Solid)){
        y -= 1;
    }
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
    
    // Play the ledge grab sound
    audio_emitter_pitch(audio_em_2, 1.5);
    audio_emitter_gain(audio_em_2, 0.1);
    audio_play_sound_on(audio_em_2, snd_step, false, 6);
}
