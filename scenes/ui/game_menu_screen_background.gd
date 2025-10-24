extends Node2D
#ferma tutto
func _ready() -> void:
	call_deferred("set_scene_process_mode")
	
func set_scene_process_mode() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED	
