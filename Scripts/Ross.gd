extends AnimatedSprite2D

class_name Ross

static var helmet_speed : int
var thrown : bool = false

@export var super_music : AudioStream

# Called when the node enters the scene tree for the first time.

var anime_scene = preload("res://Scenes/anime.tscn")
var arin_scene = preload("res://Scenes/arin.tscn")

var next_scene : PackedScene = arin_scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not thrown:
		var mouseX = get_viewport().get_mouse_position().x
		var frameCount = sprite_frames.get_frame_count("default") + 1
		var lerpedMouseX = int((mouseX / get_viewport_rect().size.x) * frameCount)
		frame = frameCount - lerpedMouseX
		
		helmet_speed = int(Input.get_last_mouse_velocity().x / -40)
		if helmet_speed > 150:
			thrown = true
			play("throw")
			$AudioStreamPlayer2D.play()
			$Timer.start()
			Music.stop()
			
			if helmet_speed > 200:
				Music.play_audio(super_music)
				next_scene = anime_scene


func _on_timer_timeout():
	get_tree().change_scene_to_packed(next_scene)
