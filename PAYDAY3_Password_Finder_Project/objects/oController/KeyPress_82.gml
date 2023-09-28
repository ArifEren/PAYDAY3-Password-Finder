if(keyboard_check(vk_shift))
{
	var _file = "PAYDAY3_PF.save" ;
	if(file_exists(_file))
	{
		file_delete(_file) ;
		game_end() ;
	}
}