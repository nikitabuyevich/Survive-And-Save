/// scr_shoot_state


image_speed = 0.05;
sprite_index = spr_player_shooting;


if (bullets > 1 && image_index > 0){
    b = instance_create(x+(image_xscale*10), y+5, obj_Bullet);
    bullets -= 1;
    b.speed = 1;
    
    // Check direction
    if (image_xscale == 1)
        b.direction = 0;
    else
        b.direction = 180;
} else if (bullets > 0 && image_index > 2){
    b = instance_create(x+(image_xscale*10), y, obj_Bullet);
    bullets -= 1;
    b.speed = 1;
    
    // Check direction
    if (image_xscale == 1)
        b.direction = 0;
    else
        b.direction = 180;
}


    

