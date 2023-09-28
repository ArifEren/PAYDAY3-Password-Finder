if(instance_exists(button_number))
{
	counter = 0 ;
	
	with(button_number)
	{
		if(active)
		{
			other.counter++ ;
		}
	}

	if(counter_previous != counter)
	{
		counter_previous = counter ;
		number_array = array_create(0) ;
	
		with(button_number)
		{
			if(active)
			{
				array_push(other.number_array, number) ;
			}
		}
	
		if((counter >= 2) and (counter <= 4))
		{
			if(!active)
			{
				active = true ;
				image_blend = c_white ;
			}
		}
		else if(active)
		{
			active = false ;
			image_blend = c_dkgray ;
		}
	}

	if(active)
	{
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
				window_set_cursor(cr_arrow) ;
			
				with(controller)
				{
					active = true ;
					number_array = other.number_array ;
				}
				
				if(global.sound_active)
				{
					var _sound_unique = audio_play_sound(sound, 0, false) ;
					audio_sound_pitch(_sound_unique, 0.75) ;
				}
			
				instance_destroy(button_number) ;
				instance_destroy(id) ;
			}
		}
		else if(mouse_ishere)
		{
			mouse_ishere = false ;
			window_set_cursor(cr_arrow) ;
			image_blend = c_white ;
		}
	}
}
