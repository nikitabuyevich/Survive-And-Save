/// exit_state 
/*
This runs when continuing onto the next stage
*/
if (image_alpha > 0) {
    image_alpha -= 0.25;
} else {
    if (PlayerStats.victory == false) {
        room_goto_next();    
    } else {        
        game_restart();
    }
}
