///scr_get_input
//Keyboard Controls
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord('X'));

// Get the axis for movement
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

//Check for gamepad input
if (gamepad_is_connected(0)) {
    //Controller deadzone can be changed here
    gamepad_set_axis_deadzone(0, .35);
    //Controller Controls
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check_pressed(0, gp_face1);
    attack_key = gamepad_button_check_pressed(0, gp_face3);
}
