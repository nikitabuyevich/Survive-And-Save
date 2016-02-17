/// scr_move(collision_object)
/*
Moves the player accordingly. If theres a wall, it will get
as close as possible towards it.
*/
var collision_object = argument0;

// Horizontal Collisions
if (place_meeting(x+hSpd, y, collision_object)){
    while (!place_meeting(x+sign(hSpd), y, collision_object)){
        x += sign(hSpd);
    }
    hSpd = 0;
}
x += hSpd;

// Vertical Collisions
if (place_meeting(x, y+vSpd, collision_object)){
    while (!place_meeting(x, y+sign(vSpd), collision_object)){
        y += sign(vSpd);
    }
    vSpd = 0;
}
y += vSpd;
