active = false ;
number_array = array_create(0) ;
calculated = false ;
button_reset = oButtonReset ;
password_size = 4 ;
result_list = ds_list_create() ;
result_text = "Every possible\ncombination\nfor PAYDAY 3:" ;
global.color_active = 1 ;
global.sound_active = 1 ;

var _file = "PAYDAY3_PF.save" ;
if(!file_exists(_file))
{
	_file = file_text_open_write(_file) ;
	file_text_write_real(_file, global.color_active) ;
	file_text_write_real(_file, global.sound_active) ;
	file_text_close(_file) ;
}
else
{
	_file = file_text_open_read(_file) ;
	global.color_active = file_text_read_real(_file) ;
	global.sound_active = file_text_read_real(_file) ;
	file_text_close(_file) ;
}

draw_set_font(fDefault) ;
draw_set_halign(fa_center) ;
draw_set_valign(fa_middle) ;
draw_set_color(c_white) ;

function heapPermutation(_number_array, _size, _n)
{
	if(_size != 1)
	{
		for(var _i = 0; _i < _size; _i++)
		{
			_number_array = heapPermutation(_number_array, _size-1, _n) ;
						
			var _swapper ;
				
			if((_size%2) == 1)
			{
				_swapper = _number_array[0] ;
				_number_array[0] = _number_array[_size-1] ;
				_number_array[_size-1] = _swapper ;
			}
			else
			{
				_swapper = _number_array[_i] ;
				_number_array[_i] = _number_array[_size-1] ;
				_number_array[_size-1] = _swapper ;
			}
		}
	}
	else
	{
		var _text = "",
			_c = 0 ;
		
		for(; _c < array_length(_number_array); _c++)
		{
			_text += string(_number_array[_c]) ;
		}
		
		if(ds_list_find_index(result_list, _text) == -1)
		{
			ds_list_add(result_list, _text) ;
		}
	}

	return _number_array ;
}
