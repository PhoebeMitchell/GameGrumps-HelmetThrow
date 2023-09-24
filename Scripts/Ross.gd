extends AnimatedSprite2D

class_name Ross

static var helmet_speed : float
var thrown : bool = false

@export var super_music : AudioStream

# Called when the node enters the scene tree for the first time.

var anime_scene = preload("res://Scenes/anime.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not thrown:
		var mouseX = get_viewport().get_mouse_position().x
		var frameCount = sprite_frames.get_frame_count("default") + 1
		var lerpedMouseX = int((mouseX / get_viewport_rect().size.x) * frameCount)
		frame = frameCount - lerpedMouseX
		
		helmet_speed = Input.get_last_mouse_velocity().x
		if helmet_speed < -5000:
			thrown = true
			play("throw")
			$AudioStreamPlayer2D.play()
			Music.play_audio(super_music)
			$Timer.start()

func _on_timer_timeout():
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_packed(anime_scene)
