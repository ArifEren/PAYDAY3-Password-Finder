if(calculated)
{
	draw_set_font(fResult) ;
	draw_set_halign(fa_left) ;
	draw_set_valign(fa_top) ;
	
	draw_text(10, 10, string_copy(result_text, 1, 40)) ;
	
	var _c = 0 ;
	while((27+((_c+1)*27)) <= string_length(result_text))
	{
		if(global.color_active)
		{
			draw_set_color(make_color_hsv((_c*20)%255, 255, 255)) ;
		}
		
		draw_text(10, 64+((_c+1)*28), string_copy(result_text, 40+((_c*27)+1), 27)) ;
		
		_c++ ;
	}
	
	draw_set_color(c_white) ;
	draw_set_font(fDefault) ;
	draw_set_halign(fa_center) ;
	draw_set_valign(fa_middle) ;
}