/// hurt_state();

/*
This runs when player gets damaged.
*/

// set the sprite
sprite_index = spr_player_hurt;

if (hSpd != 0)
    image_xscale = sign(hSpd);
    
// Apply gravity
if (!place_meeting(x, y+1, obj_inherit_Solid)) {
    vSpd += grav;
} else {
    vSpd = 0;
    
    //use friction
    apply_friction(accel);
}

direction_move_bounce(obj_inherit_Solid);

// Change back to move state
if (alarm[0] == room_speed) { // if 1 second passed, give movement
    image_blend = c_white;
    
    if (PlayerStats.hp <= 0) {
        PlayerStats.sapphires = floor(PlayerStats.sapphires/2);
        PlayerStats.hp = PlayerStats.maxhp;
        if (audio_is_playing(snd_boss_music))
            audio_stop_sound(snd_boss_music);
        if (audio_is_playing(snd_victory))
            audio_stop_sound(snd_victory);
        if (audio_is_playing(snd_pre_boss))
            audio_stop_sound(snd_pre_boss);
        room_restart();
    }
    state = move_state;
}


