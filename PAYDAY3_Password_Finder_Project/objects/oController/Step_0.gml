if((active) and (!calculated))
{	
	var _number_array,
		_number_array_size = array_length(number_array),
		_i = 0 ;
	
	for(; ((_number_array_size == 4) and (_i == 0)) or ((_number_array_size <= 3) and (_i < _number_array_size)); _i++)
	{
		_number_array = array_create(0) ;
		array_copy(_number_array, 0, number_array, 0, _number_array_size) ;
		
		repeat(password_size-_number_array_size)
		{
			array_push(_number_array, number_array[_i]) ;
		}
		
		heapPermutation(_number_array, array_length(_number_array), array_length(_number_array)) ;
	}

	var _introtext,
		_c = 0 ;
	
	for(; _c < ds_list_size(result_list); _c++)
	{
		_introtext = (chr(((65+_c) <= 90) ? (65+_c) : (71+_c)))+") " ;
		
		if((_c%3) == 0)
		{
			result_text += _introtext+result_list[| _c] ;
		}
		else if((_c%3) == 1)
		{
			result_text += " | "+_introtext+result_list[| _c] ;
		}
		else
		{
			result_text += " | "+_introtext+result_list[| _c] ;
		}
	}
	
	with(instance_create_depth(280, 40, depth+1, button_reset))
	{
		image_xscale = 2 ;
		image_yscale = 2 ;
	}
	
	calculated = true ;
}
