extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Makes the Saves Directory if it's the first time running
	var dir = Directory.new()
	dir.open("user://")
	dir.make_dir("saves")
	


func _on_Quit_pressed():
	get_tree().quit()


func _on_Edit_pressed():
	open_loader("edit")


func _on_Play_pressed():
	open_loader("play")
	

func open_loader(t):
	var _load = load("res://Scenes/Loader.tscn").instance()
	_load.next_scene = t
	get_viewport().add_child(_load)
	get_viewport().get_child(0).queue_free()
