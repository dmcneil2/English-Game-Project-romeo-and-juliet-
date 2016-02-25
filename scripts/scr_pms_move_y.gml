/*  -----------------------
    Platformer Movement System
    ------
    Move Y
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
        Moves the player vertically and allows the user to jump to a specified height.
        
        NOTE:   This system uses the collision system from Shaun Spalding's
                Platformer Tutorial found at: https://www.youtube.com/watch?v=IysShLIaosk
        
        The script should be called from the step event of the player object AFTER scr_pms_move_x.
        
        -------
        example
        -------
        //Create Event
        
        var jump_key = keyboard_check_pressed(vk_space);
        var grav = 0.2;
        var jump_height = 32;
        var number_of_jumps = 2;
        
        scr_pms_move_y(jump_key, grav, jump_height, number_of_jumps);
        -------
        
    #######################*/

var j_key = argument0; //Jump key
var g = argument1; //Gravity
var h = argument2; //Jump height
var n_jumps = argument3; //How many jumps the player can do

if(j_key && CurrentJumps < n_jumps)
{
    SpeedY = -sqrt(2 * h * g); //This little formula calculates the speed required in order to reach the jump height
    CurrentJumps++; //Lastly we increment the current number of jumps so we know when to stop allowing jumps
}
else
    SpeedY += g; //We don't want to apply gravity immediately after setting the jump speed or else we won't reach the height
   
//Shaun Spalding's collision system
//###
if(place_meeting(x, y + SpeedY, SolidObject))
{
    while(!place_meeting(x, y + sign(SpeedY), SolidObject))
        y += sign(SpeedY); //Basically moves to contact
        
    if(SpeedY > 0)
        CurrentJumps = 0; //Reset the current number of jumps if we were falling (ie, don't reset if we hit our head)
        
    SpeedY = 0; //Stop movement
}
//###

y += SpeedY; //Translate position
