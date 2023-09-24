extends AnimatedSprite2D

var text_box : TextBox = preload("res://Prefabs/dialogue_text_box.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")


func _on_animation_finished():
	play("sweaty")
	get_parent().add_child(text_box)
	text_box.print_text()


func _on_thud_timer_timeout():
	$AudioStreamPlayer2D.play()
	

func _input(event):
	if Input.is_action_just_pressed("Left Mouse Button"):
		Music.start()
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
