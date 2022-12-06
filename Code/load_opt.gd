extends Control


var file_name = ""

#Load
func _on_Button_pressed():
	get_viewport().get_child(0)._load(file_name)
