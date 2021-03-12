// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getHighScores(game){
	var table = "gameId="+ game;
	global.scoreList = http_post_string("https://gapi-zhopio.herokuapp.com/score/getScoreByValue",table);
}

function createScore(game,name,score){
	var data = "gameId=" + game + "&name=" + name + "&score=" + getEncode(score);
	global.createScore = http_post_string("https://gapi-zhopio.herokuapp.com/score/createScoreByURL", data);
}

function getNews(gameId){
	var data = "gameId=" + gameId;
	global.getNews = http_post_string("https://gapi-zhopio.herokuapp.com/news/getLastNew", data);
	show_debug_message(global.getNews);
}

function getEncode(data){
	var _b_s = _f_bs(base64_encode(data));
	
	var _e_x = _t_x(_b_s);
	
	var _b_y_n = _b_b(_e_x);
	
	var base = base64_encode(_b_y_n);
	
	var signature = md5_string_utf8(_b_s + _e_x + _b_y_n + base);
	
	return base + "/" + signature;
}

function _t_x(data){
	var str, _e_x, h, l, p, byte;
    str = data;
    _e_x = "";
    h = "0123456789ABCDEF";
    l = string_length(str);
    for (p=1; p<=l; p+=1) {
        byte = ord(string_copy(str, p, 1));
        _e_x += string_copy(h,byte div 16 + 1, 1);
        _e_x += string_copy(h,byte mod 16 + 1, 1);
    }
    return _e_x;
}

function _f_bs(data){
	var b64, len, pad, tab, str, i, bin;
    b64 = data;
    len = string_length(b64);
    pad = "=";
    tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    str = "";
    while (string_length(b64) mod 4) b64 += pad;
    for(i=0; i<len; i+=4) {
        bin[0] = string_pos(string_char_at(b64,i+1),tab)-1;
        bin[1] = string_pos(string_char_at(b64,i+2),tab)-1;
        bin[2] = string_pos(string_char_at(b64,i+3),tab)-1;
        bin[3] = string_pos(string_char_at(b64,i+4),tab)-1;
        str += chr(255&(bin[0]<<2)|(bin[1]>>4));
        if (bin[2] >= 0) str += chr(255&(bin[1]<<4)|(bin[2]>>2));
        if (bin[3] >= 0) str += chr(255&(bin[2]<<6)|(bin[3]));
    }
    return str;
}
	
function _b_b(data){
	var str, bin, p, byte;
    str = data;
    bin = "";
    p = string_length(str);
    repeat (p) {
        byte = ord(string_char_at(str,p));
        repeat (8) {
            if (byte & 1) bin = "1" + bin else bin = "0" + bin;
            byte = byte >> 1;
        }
        p -= 1;
    }
    return bin;
}
	