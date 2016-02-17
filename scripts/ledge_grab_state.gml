/// ledge_grab_state();
/*
Grabs onto a ledge, press up to jump or down to fall.
*/


if (down) {
    state = move_state;
}

if (shoot_key){
   
    
    image_speed = 0.1;
    sprite_index = spr_player_ledge_grab_shooting;
    
    if (!audio_is_playing(snd_firing)){
    audio_emitter_pitch(audio_em_3, 1.1);
    audio_emitter_gain(audio_em_3, 0.4);
    audio_play_sound_on(audio_em_3, snd_firing, false, 8); 
    }
    
    if (bulletsGun1[2] > 0){
        bulletObject = instance_create(x+(image_xscale*10), y+3, obj_Bullet);
        bulletsGun1[2] -= 1;
        bulletObject.speed = 8;
        
        // Check direction
        if (image_xscale == 1)
            bulletObject.direction = 180;
        else
            bulletObject.direction = 0;
    }
}

if (up) {
    vSpd = initialJumpH*1.2;
    scr_move(obj_inherit_Solid); // make sure theres no collisions
    state = move_state;
}
