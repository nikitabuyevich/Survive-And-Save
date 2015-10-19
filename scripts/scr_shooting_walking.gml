///scr_shooting_walking();


if ((right || left) ) { //move left or right
hSpd += (right-left)*accel;


if (hSpd > maxSpd)
    hSpd = maxSpd;

if (hSpd < -maxSpd)
    hSpd = -maxSpd;
image_speed = 0.1;
sprite_index = spr_player_walk_shooting;

if (!audio_is_playing(snd_firing)){
audio_emitter_pitch(audio_em_3, 1.2);
audio_emitter_gain(audio_em_3, 0.4);
audio_play_sound_on(audio_em_3, snd_firing, false, 8); 
}

if (bulletsGun1[1] > 1 && image_index > 0){
    bulletObject = instance_create(x+(image_xscale*10), y+5, obj_Bullet);
    bulletsGun1[1] -= 1;
    bulletObject.speed = 8;
    
    // Check direction
    if (image_xscale == 1)
        bulletObject.direction = 0;
    else
        bulletObject.direction = 180;
} else if (bulletsGun1[1] > 0 && image_index > 2){
    bulletObject = instance_create(x+(image_xscale*10), y, obj_Bullet);
    bulletsGun1[1] -= 1;
    bulletObject.speed = 8;
    
    // Check direction
    if (image_xscale == 1)
        bulletObject.direction = 0;
    else
        bulletObject.direction = 180;
  }

} else //if not attempting moving, apply friction
    apply_friction(accel);
    

