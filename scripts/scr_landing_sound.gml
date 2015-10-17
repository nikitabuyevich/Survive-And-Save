/// Play the landing sound
if (place_meeting(x, y+vSpd+1, obj_inherit_Solid) && vSpd > 0) {
    audio_emitter_pitch(audio_em_2, random_range(0.8, 1.2));
    audio_emitter_gain(audio_em_2, 0.2);
    audio_play_sound_on(audio_em_2, snd_step, false, 6);
}
