/// move_state();

/*
Main part of the whole program. This is the state the players at most of the time. This is where
you should be checking things regularly.
*/

if (attack_key) {
    state = scr_attack_state;
}

if (shield_key) {
    state = scr_shield_state;
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
    state = scr_roll_state;
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

    if (hSpd > maxSpd)
        hSpd = maxSpd;
    
    if (hSpd < -maxSpd)
        hSpd = -maxSpd;
} else {
    apply_friction(accel);
}

if (hSpd != 0) {
    image_xscale = sign(hSpd);
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
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, 0.1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
