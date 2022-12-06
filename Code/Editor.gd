extends Node2D


var session_name = ""

onready var question = load("res://Meta_Objects/editable_question.tscn")


func _ready():
	

	
	for val in range(6): #X positin
		
		var cat = TextEdit.new()
		cat.rect_size = Vector2(130, 20)
		cat.rect_position = Vector2(75 + (val*150) ,15)
		$lables.add_child(cat)
		
		
		for row in range(5): # y positin
			
			var q = question.instance()
			q.get_node("value").text = str((row+1) * 200)
			q.position = Vector2(val*150, row * 100)
			$questions.add_child(q)


	if session_name != "":
		session_name = session_name.substr(0,session_name.length() - 4)
		_load(session_name)
			

func _on_save_pressed():
	
	if session_name != "":
		save(session_name)
		return
	
	if check_save():
		$save_dialouge.popup_centered()


func check_save():
	
	var error = ""
	
	for l in $lables.get_children():
		if l.text == "":
			error += "Warning: Missing one or more Catagory Labels"
			break
			
	for q in $questions.get_children():
		if q.get_node("text").text == "":
			error += "\n Warning: Missing one or more Questions, dumbass"
			break
			
	if error == "":
		return true
	else:
		error += "\n Do you wish to save even with missing pieces, O Everwise Human?"
		$error_display/text.text = error
		$error_display.popup_centered()
		return false
			
			
			
func save(file_name):
	
	session_name = file_name
	
	var save = File.new()
	save.open("user://saves/"+file_name+".txt", File.WRITE)
	
	for label in $lables.get_child_count():
		save.store_line($lables.get_child(label).text)
		
	for question in $questions.get_children():
		save.store_line(question.get_node("text").text)
		
	
	save.close()


func _on_quit_pressed():
	
	if session_name == "":
		$quit_confrim.popup()
	else:
		return_to_main()

func _on_quit_confrim_confirmed(): #Change this to return to main menu
	return_to_main()




func _on_save_confirm_pressed():
	save($save_dialouge/TextEdit.text)
	$save_dialouge.hide()
	
func return_to_main():
	get_viewport().get_child(0).queue_free()
	get_tree().change_scene("res://Scenes/Main.tscn")
	
	
func _load(file_name):
	

	var file = File.new();
	file.open("user://saves/"+file_name+".txt",File.READ)
	
	for l in $lables.get_children():
		l.text = file.get_line()
		
	for c in $questions.get_children():
		c.get_node("text").text = file.get_line()
		
	
	file.close()

#Dummy Load variable for 
func _on_load_pressed():
	_load("test")

#Shows if game is missing elements
func _on_forgor_pressed():
	$error_display.hide()

#save anyway, even if game is missing prompsts
func _on_save_anyway_pressed():
	$save_dialouge.popup_centered()
	$error_display.hide()
