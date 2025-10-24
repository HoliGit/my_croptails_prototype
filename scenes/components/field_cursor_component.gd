class_name FieldCursorComponent #cursor perchè seguiva il mouse - rivedere imputmap
extends Node

@export var grass_tilemap_layer : TileMapLayer
@export var tilled_soil_tilemap_layer : TileMapLayer
@export var terrain_set : int = 0
@export var terrain : int = 1

var player : Player


#var mouse_position : Vector2
var cell_position : Vector2i
var cell_source_id : int
var local_cell_position : Vector2
var distance : float
#var distance_from_player = Vector2(8, 0)

func _ready() -> void:
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_tilled"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_position()
			remove_tilled_soil_cell()
	elif event.is_action_pressed("hit"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_position()
			add_tilled_soil_cell()
			
			
func get_cell_position() -> void:
	#mouse_position = grass_tilemap_layer.get_local_mouse_position()
	cell_position = grass_tilemap_layer.local_to_map(player.global_position)
	cell_source_id = grass_tilemap_layer.get_cell_source_id(cell_position)
	local_cell_position = grass_tilemap_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(local_cell_position)


func add_tilled_soil_cell() -> void:
	if distance < 20.0 && cell_source_id != -1:
		tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_position], terrain_set, terrain, true)
	pass	
	
func remove_tilled_soil_cell() -> void:
	if distance < 20.0:
		tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_position], 0, -1, true)
	pass	
	
	
	
	
	
	
	
