extends Node2D


var next_scene = "" #editor or player

var list_opt = load("res://Meta_Objects/load_opt.tscn")

func _ready():
	
	print(next_scene)
	
	var dir = Directory.new()
	dir.open("user://saves")
	dir.list_dir_begin()
	
	var file = dir.get_next()
	
	while file != "":
		
		if file != "." and file != "..":
		
			var l = list_opt.instance()
			l.file_name = file
			l.get_node("Label").text = file
			$list.add_child(l)
			
		file = dir.get_next()

	
func _load(x):
	if next_scene == "edit":
		var n = load("res://Scenes/Editor.tscn").instance()
		n.session_name = x
		get_viewport().add_child(n)
		self.queue_free()
		
	if next_scene == "play":
		var n = load("res://Scenes/Player.tscn").instance()
		n.game_name = x
		get_viewport().add_child(n)
		self.queue_free()
		
	


func _on_make_new_pressed():
	self.queue_free()
	get_tree().change_scene("res://Scenes/Editor.tscn")
	
