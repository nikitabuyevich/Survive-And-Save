///scr_shooting();

 bulletsGun1[1] = 2; //give back bullets to idle shooting

image_speed = 0.15;
sprite_index = spr_player_idle_shooting;

if (!audio_is_playing(snd_firing)){
audio_emitter_pitch(audio_em_3, 1.7);
audio_emitter_gain(audio_em_3, 0.4);
audio_play_sound_on(audio_em_3, snd_firing, false, 8); 
}

if (bulletsGun1[0] > 0){
    bulletObject = instance_create(x+(image_xscale*10), y+7, obj_Bullet);
    bulletsGun1[0] -= 1;
    bulletObject.speed = 8;
    
    // Check direction
    if (image_xscale == 1)
        bulletObject.direction = 0;
    else
        bulletObject.direction = 180;

    bulletObject = instance_create(x+(image_xscale*10), y, obj_Bullet);
    bulletsGun1[0] -= 1;
    bulletObject.speed = 8;
    
    // Check direction
    if (image_xscale == 1)
        bulletObject.direction = 0;
    else
        bulletObject.direction = 180;
}
