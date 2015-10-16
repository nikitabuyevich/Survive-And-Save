///scr_take_damage();
// Take damage
/*
Player's been damaged by something so the events play out
*/
    if (state != hurt_state) {
    
        audio_emitter_pitch(audio_em, 1.6);
        audio_emitter_gain(audio_em, 1.4);
        audio_play_sound_on(audio_em, snd_ouch, false, 8);    
    
        image_blend = make_colour_rgb(220, 150, 150);
        vSpd += 6*sign(vSpd);
        
        scr_move(obj_inherit_Solid);
        
        
        if (instance_exists(obj_PlayerStats)) {
            obj_PlayerStats.hp -= 1;
        }
    }
