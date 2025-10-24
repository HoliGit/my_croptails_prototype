extends NodeState

@export var player : Player
@export var animated_sprite_2D : AnimatedSprite2D

@export var tilling_sound : AudioStream

@onready var player_sfx: AudioStreamPlayer2D = $"../../PlayerSFX"


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2D.is_playing():
		transition.emit("Idle")
	pass


func _on_enter() -> void:
	player_sfx.stream = tilling_sound
	player_sfx.play()
	if player.player_direction == Vector2.UP:
		animated_sprite_2D.play("tilling_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2D.play("tilling_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2D.play("tilling_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2D.play("tilling_left")
	else:
		animated_sprite_2D.play("tilling_front")
	


func _on_exit() -> void:
	animated_sprite_2D.stop()
	pass
