/// @description Insert description here
// You can write your code in this editor
if(showSprite){
	draw_text(x + 350,y - 20,"Show News");
	draw_sprite(spr,0,x + 200,y);
	draw_text(x + 520,y,newsTable.title);
	draw_text_ext(x + 520,y+40,newsTable.message,20,200);
}