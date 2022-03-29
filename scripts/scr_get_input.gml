///scr_get_input
//Keyboard Controls
right = vk_right;
left = vk_left;
up = vk_up;
down = vk_down;
button1 = ord('C');
button2 = ord('X');
button3 = ord('Z');
start = vk_escape;

//Player Controls
right_key = keyboard_check(right);
left_key = keyboard_check(left);
up_key = keyboard_check(up);
down_key = keyboard_check(down);
dash_key = keyboard_check_pressed(button1);
attack_key = keyboard_check_pressed(button2);

// Get the axis for player movement
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
