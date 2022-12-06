extends Node2D


var question = ""
var price = 100

var can_click = false

func _ready():
	
	$price.text = "$" + str(price)
	
	
func _process(delta):
	
	if can_click and Input.is_action_just_pressed("left_mouse"):
		print("click")
		
		print(self.position)
		
		$price.hide()
		$ColorRect/question.show()
		
		#Grows the box
		$Tween.interpolate_property($ColorRect, "margin_right",96, 1024-self.position.x,2,Tween.TRANS_ELASTIC)
		$Tween.interpolate_property($ColorRect, "margin_bottom",56, 600-self.position.y,2,Tween.TRANS_ELASTIC)
		$Tween.interpolate_property($ColorRect, "margin_left",$ColorRect.margin_left, -self.position.x,2,Tween.TRANS_ELASTIC)
		$Tween.interpolate_property($ColorRect, "margin_top",  $ColorRect.margin_top, -self.position.y,2,Tween.TRANS_ELASTIC)
		
		#Text
		$Tween.interpolate_property($ColorRect/question, "margin_top",  $ColorRect/question.margin_top, 200,2,Tween.TRANS_ELASTIC)
		$Tween.interpolate_property($ColorRect/question, "margin_left",  $ColorRect/question.margin_left, 300,2,Tween.TRANS_ELASTIC)
		$Tween.interpolate_property($ColorRect/question, "margin_right",  $ColorRect/question.margin_right, 700,2,Tween.TRANS_ELASTIC)
		$Tween.interpolate_property($ColorRect/question, "margin_bottom",  $ColorRect/question.margin_bottom, 400,2,Tween.TRANS_ELASTIC)
		
		$Tween.interpolate_property($ColorRect/question, "rect_scale", $ColorRect/question.rect_scale,Vector2(1,1),3,Tween.TRANS_CUBIC )
		
		
		$Tween.start()

func _on_clickable_mouse_entered():
	can_click = true


func _on_clickable_mouse_exited():
	can_click = false
