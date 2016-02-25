/*  -----------------------
    Platformer Movement System
    ------
    Create
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
        Initializes important variables required for the system to work.
        
        The script should be called from the create event of the player object.
        
        -------
        example
        -------
        //Create Event
        
        scr_pms_create(obj_solid);
        -------
        
    #######################*/

SolidObject = argument0;
    
SpeedX = 0; //Horizontal Speed
SpeedY = 0; //Vertical Speed
CurrentJumps = 0; //How many jumps this player has done since becoming airborne (used for double / triple jumps etc)
