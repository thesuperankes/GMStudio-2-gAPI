/// @description control service response
// You can write your code in this editor
var r_str = "null";
if(global.createScore != -1){
	if ds_map_find_value(async_load, "id") == global.createScore
	{
		if ds_map_find_value(async_load, "status") == 0
		{
			r_str = ds_map_find_value(async_load, "result");
		}
	}
}

if(global.scoreList != -1){
	if ds_map_find_value(async_load, "id") == global.scoreList
	{
	   if ds_map_find_value(async_load, "status") == 0
	      {
		  
			var res = json_parse(json_encode(async_load));
			var data = json_parse(res.result);
			highscoreTable = data.data
		  }
	}
}