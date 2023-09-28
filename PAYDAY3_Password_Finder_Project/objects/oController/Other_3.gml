if(ds_exists(result_list, ds_type_list))
{
	ds_list_destroy(result_list) ;
}

var _file = "PAYDAY3_PF.save" ;
if(file_exists(_file))
{
	_file = file_text_open_write(_file) ;
	file_text_write_real(_file, global.color_active) ;
	file_text_write_real(_file, global.sound_active) ;
	file_text_close(_file) ;
}
