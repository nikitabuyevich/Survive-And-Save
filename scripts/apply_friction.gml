/// aapply_friction(amount)
/*
Used as friction physics to slow down movement if object
decides to stop moving.
*/
var amount = argument0;

if (hSpd != 0) {
    if (abs(hSpd)-amount > 0) {
        hSpd -= amount*image_xscale;
    } else {
        hSpd = 0;
    }
}
