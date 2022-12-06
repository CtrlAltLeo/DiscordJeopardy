extends Node2D


var game_name = "test"

func _ready():
	
	game_name = game_name.substr(0,game_name.length()-4)
	
	_load(game_name)


func _load(file_name):
	
	var file = File.new();
	file.open("user://saves/"+file_name+".txt",File.READ)
	
	for l in $labels.get_children():
		l.text = file.get_line()
		
#	for c in $questions.get_children():
#		c.get_node("text").text = file.get_line()
