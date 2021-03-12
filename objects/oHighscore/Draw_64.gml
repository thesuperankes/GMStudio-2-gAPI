/// @description Draw highscore table
// You can write your code in this editor
var _y = y;

if(is_array(highscoreTable)){
	draw_text(x + 50,y - 20,"Show highscore");
	var size = array_length(highscoreTable);
	for(var i = 0; i < size; i++){
		_y += 15;
		var data = json_parse( string_replace(json_stringify(array_get(highscoreTable,i)), "score","_score"));
		
		draw_text(x,_y, "Name " + string(data.name) + " Score: " + string(data._score) )
	}
}