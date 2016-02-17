///scr_take_damage();
// Take damage
/*
Player's been damaged by something so the events play out
*/
    if (state != hurt_state) {
    
        if (!audio_is_playing(snd_ouch)){
        audio_emitter_pitch(audio_em_1, 1.6);
        audio_emitter_gain(audio_em_1, 0.8);
        audio_play_sound_on(audio_em_1, snd_ouch, false, 8);  
        }  
    
        //image_blend = make_colour_rgb(220, 150, 150);
        hSpd += (sign(x-other.x)*8);
        
        scr_move(obj_inherit_Solid);
        
        
        if (instance_exists(obj_PlayerStats)) {
            obj_PlayerStats.hp -= obj_PlayerStats.zombieDamage;
        }
        
    }
