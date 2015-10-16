/// horizontal_move_bounce(collision_object)
/*
Get bounced only horizontaly. Can be used for knockback.
*/
var collision_object = argument0;


// Horizontal Collisions
if (place_meeting(x+hSpd, y, collision_object)){
    while (!place_meeting(x+sign(hSpd), y, collision_object)){
        x += sign(hSpd);
    }
    hSpd = -(hSpd/2);
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
