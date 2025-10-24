extends Node2D

var background_music : AudioStream = preload("res://assets/audio/music/on_the_farm.ogg")

@onready var on_the_farm_music: AudioStreamPlayer2D = $OnTheFarmMusic

func _ready() -> void:
	on_the_farm_music.stream = background_music
	on_the_farm_music.play()
	pass
