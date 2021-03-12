
if ds_map_find_value(async_load, "id") == global.getNews
{
   if ds_map_find_value(async_load, "status") == 0
      {
		var res = json_parse(json_encode(async_load));
		var data = json_parse(res.result);
		
		newsTable = data.data;
		
		if( is_struct(newsTable) ){
			var _url = newsTable.image;
			spr = sprite_add(_url, 0, false, false, 0, 0);
		}
		
      }
}