if(point_in_rectangle(mouse_x, mouse_y, x-(sprite_width/2), y-(sprite_height/2), x+(sprite_width/2), y+(sprite_height/2)))
{
	if(window_get_cursor() != cr_handpoint)
	{
		window_set_cursor(cr_handpoint) ;
	}
	
	if(!mouse_ishere)
	{
		mouse_ishere = true ;
		image_blend = c_yellow ;
	}
	
	if(mouse_check_button_pressed(mb_left))
	{
		if(!active)
		{
			image_index = 1 ;
			active = true ;
			global.color_active = true ;
		}
		else
		{
			image_index = 0 ;
			active = false ;
			global.color_active = false ;
		}
		
		if(global.sound_active)
		{
			var _sound_unique = audio_play_sound(sound, 0, false) ;
			audio_sound_pitch(_sound_unique, 1.25) ;
		}
	}
}
else if(mouse_ishere)
{
	mouse_ishere = false ;
	window_set_cursor(cr_arrow) ;
	image_blend = c_white ;
}