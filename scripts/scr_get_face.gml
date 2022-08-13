///scr_get_face(dir);
//Script does a simple calculation based on the direction the character was moving
//Will produce a number between 0 and 3
//See 'Sprite Adjustment' inside scr_move_state
var dir = argument0;
face = round(dir/90);

//If the character at an angle that would round the number to 4, set it to 0 instead
if (face == 4){
    face = 0;
}
