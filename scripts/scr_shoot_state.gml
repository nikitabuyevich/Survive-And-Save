/// scr_shoot_state


image_speed = 0.1;
sprite_index = spr_player_shooting;

if (!audio_is_playing(snd_firing)){
audio_emitter_pitch(audio_em, 1.1);
audio_emitter_gain(audio_em, 0.7);
audio_play_sound_on(audio_em, snd_firing, false, 8); 
}

if (bullets > 1 && image_index > 0){
    bulletObject = instance_create(x+(image_xscale*10), y+5, obj_Bullet);
    bullets -= 1;
    bulletObject.speed = 8;
    
    // Check direction
    if (image_xscale == 1)
        bulletObject.direction = 0;
    else
        bulletObject.direction = 180;
} else if (bullets > 0 && image_index > 1){
    bulletObject = instance_create(x+(image_xscale*10), y, obj_Bullet);
    bullets -= 1;
    bulletObject.speed = 8;
    
    // Check direction
    if (image_xscale == 1)
        bulletObject.direction = 0;
    else
        bulletObject.direction = 180;
}

if (!place_meeting(x, y+1, obj_inherit_Solid)){
vSpd += grav; //make sure theres gravity
}
    
scr_landing_sound(); //play landing sound

scr_move(obj_inherit_Solid); // make sure theres no collisions


    

