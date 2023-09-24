extends Timer

var arin_scene = preload("res://Scenes/arin.tscn")

func _on_timeout():
	get_tree().change_scene_to_packed(arin_scene)
