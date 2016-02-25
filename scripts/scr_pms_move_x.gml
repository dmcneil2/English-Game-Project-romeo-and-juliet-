/*  -----------------------
    Platformer Movement System
    ------
    Move X
    -----------------------
    #########################
    #PLEASE KEEP THIS HEADER#
    #########################
    Author  Jordan Robinson
    Created 29/09/2015
    Version 1.1.0
    
    Changes
        29/09/2015
            -   Added SolidObject variable to allow user to define what object
                they want the charatcer to collide with
    
    Details
        Moves the player horizontally and allows for acceleration to the maximum speed.
        
        NOTE:   This system uses the collision system from Shaun Spalding's
                Platformer Tutorial found at: https://www.youtube.com/watch?v=IysShLIaosk
        
        The script should be called from the create event of the player object BEFORE scr_pms_move_y.
        
        -------
        example
        -------
        //Create Event
        
        var left_key = keyboard_check(vk_left);
        var right_key = keyboard_check(vk_right);
        var acceleration = 0.2;
        var max_speed = 2;
        
        scr_pms_move_x(left_key, right_key, acceleration, max_speed);
        -------
        
    #######################*/

var l_key = argument0; //Left key
var r_key = argument1; //Right key
var accel = argument2; //Acceleration
var m_speed = argument3; //Max speed

var w_speed = 0; //This is our wanted speed, and it would be set depending on which key is pressed. We set it to zero here in case no keys are pressed

if(l_key)
    w_speed -= m_speed; //Wanted speed is to the left, so negative. Since the wanted speed is 0 at the beginning of each step, we can subtract the max speed.
                        //By doing this, if the user is pressing both keys the values will cancel out and give 0.
if(r_key)
    w_speed += m_speed; //Moving right, so adding max speed now
    
SpeedX += (w_speed - SpeedX) * accel; //This will smoothly add to our movement speed each step until we reach the wanted speed

//Shaun Spalding's collision system
//###
if(place_meeting(x + SpeedX, y, SolidObject))
{
    while(!place_meeting(x + sign(SpeedX), y, SolidObject))
        x += sign(SpeedX); //Basically move to contact
        
    SpeedX = 0; //Stop movement
}
//###

x += SpeedX; //Translate position
