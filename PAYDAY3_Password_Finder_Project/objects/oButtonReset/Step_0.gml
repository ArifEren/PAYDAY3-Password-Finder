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
		game_restart() ;
	}
}
else if(mouse_ishere)
{
	mouse_ishere = false ;
	image_blend = c_white ;
	window_set_cursor(cr_arrow) ;
}