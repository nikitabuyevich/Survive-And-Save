/// ledge_grab_state();
/*
Grabs onto a ledge, press up to jump or down to fall.
*/


if (down) {
    state = move_state;
}

if (up) {
    state = move_state;
    vSpd = initialJumpH;
}
