///scr_chance(percentage)
//Use this for calculating drop chance of items when enemies die

//Argument: 0 - 1
var percent = argument[0];
percent = clamp(percent, 0, 1);
return (random(1) < percent);
