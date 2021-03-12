/// @description Create score and get table
// You can write your code in this editor

var _name = get_string("Name?","");
var _score = random_range(100,5000)
createScore(global.gameId,_name,_score);
getHighScores(global.gameId,"10");