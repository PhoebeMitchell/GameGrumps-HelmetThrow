extends AudioStreamPlayer2D

@export var music : Array[AudioStream]

func _ready():
	start()
	
	
func start():
	var rng = RandomNumberGenerator.new()
	stream = music[rng.randi_range(0, 1)];
	play()
	

func play_audio(audioStream : AudioStream):
	stream = audioStream
	play()
