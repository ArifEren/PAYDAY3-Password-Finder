if(point_in_rectangle(mouse_x, mouse_y, x-(sprite_width/2), y-(sprite_height/2), x+(sprite_width/2), y+(sprite_height/2)))
{
	if(window_get_cursor() != cr_handpoint)
	{
		window_set_cursor(cr_handpoint) ;
	}
	
	if(!mouse_ishere)
	{
		mouse_ishere = true ;
		
		if(image_blend != c_lime)
		{
			image_blend = c_yellow ;
		}
	}
	
	if(mouse_check_button_pressed(mb_left))
	{
		if(!active)
		{
			image_blend = c_lime ;
			active = true ;
		}
		else
		{
			image_blend = c_yellow ;
			active = false ;
		}
		
		if(global.sound_active)
		{
			audio_play_sound(sound, 0, false) ;
		}
	}
}
else if(mouse_ishere)
{
	mouse_ishere = false ;
	window_set_cursor(cr_arrow) ;
	
	if(image_blend != c_lime)
	{
		image_blend = c_white ;
	}
}