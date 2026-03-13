class_name BuildManager
extends Node

@export var slime_scene : PackedScene

var tilemap : TileMapLayer


func _ready():

	tilemap = get_tree().current_scene.get_node("World/Map/GroundLayer")


func _input(event):

	if event is InputEventMouseButton:

		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:

			place_slime(event.position)


func place_slime(world_position : Vector2):

	var game_manager = get_tree().current_scene.get_node("Managers/GameManager")

	if not game_manager.use_slime():
		return

	var grid_manager = get_tree().current_scene.get_node("Managers/GridManager")

	var ground = get_tree().current_scene.get_node("World/Map/GroundLayer")
	var build_layer = get_tree().current_scene.get_node("World/Map/BuildLayer")

	var cell = ground.local_to_map(world_position)

	# verificar si el tile permite construir
	if build_layer.get_cell_source_id(cell) == -1:
		return

	if grid_manager.is_cell_occupied(cell):
		return

	var slime = slime_scene.instantiate()

	get_tree().current_scene.get_node("Entities").add_child(slime)

	slime.global_position = ground.map_to_local(cell)

	grid_manager.occupy_cell(cell, slime)
