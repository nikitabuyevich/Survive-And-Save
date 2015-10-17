/// ledge_grab_state();
/*
Grabs onto a ledge, press up to jump or down to fall.
*/


if (down) {
    state = move_state;
}

if (up) {
    vSpd = initialJumpH*1.2;
    scr_move(obj_inherit_Solid); // make sure theres no collisions
    state = move_state;
}
