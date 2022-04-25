///scr_load_game()
//Open file, copy file to string, close file, decrypt 
var file = file_text_open_read(working_directory+"prototypegamesave.txt");
var save_string = file_text_read_string(file);
file_text_close(file);
save_string = base64_decode(save_string);
var save_data = json_decode(save_string);

//Get room from data, if the room the player is in is not the same room, swap to saved room location
var save_room = save_data[? "room"];
if (room != save_room) {
    room_goto(save_room);
}

//Check if cbt exists and make it, set it's position to the x and y from the save data
with (obj_cbt_stats) {
    cbt_xstart = save_data[? "x"];
    cbt_ystart = save_data[? "y"];
    if (instance_exists(obj_cbt)) {
        obj_cbt.x = cbt_xstart;
        obj_cbt.y = cbt_ystart;
        obj_cbt.phy_position_x = cbt_xstart;
        obj_cbt.phy_position_y = cbt_ystart;
    } else {
        instance_create(cbt_xstart, cbt_ystart, obj_cbt);
    }
    //Set all of the stats in cbt_stats to what is in the save data
    hp = save_data[? "hp"];
    maxhp = save_data[? "maxhp"];
    stamina = save_data[? "stamina"];
    maxstamina = save_data[? "maxhp"];
    expr = save_data[? "expr"];
    maxexpr = save_data[? "maxexpr"];
    level = save_data[? "level"];
    attack = save_data[? "attack"];
}

//Destroy the data afterwards :)
ds_map_destroy(save_data);
