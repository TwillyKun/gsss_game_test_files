///scr_save_game()

//Check for a player object
if (!instance_exists(obj_cbt_stats)) { exit; }

//Create save data
var save_data = ds_map_create();

with (obj_cbt_stats) {
    save_data[? "room"] = last_room;
    save_data[? "x"] = cbt_xstart;
    save_data[? "y"] = cbt_ystart;
    save_data[? "hp"] = hp;
    save_data[? "maxhp"] = maxhp;
    save_data[? "stamina"] = stamina;
    save_data[? "maxstamina"] = maxstamina;
    save_data[? "expr"] = expr;
    save_data[? "maxexpr"] = maxexpr;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack; 
}

//Encode all data into a json and then apply base64 encryption
var save_string = json_encode(save_data);
ds_map_destroy(save_data);
save_string = base64_encode(save_string);

//Currently only works for 1 save
var file = file_text_open_write(working_directory + "prototypegamesave.txt");
file_text_write_string(file, save_string);
file_text_close(file);

//Debugging save confirmation window
show_message("Game saved")
