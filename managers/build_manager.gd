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


func place_slime(mouse_position: Vector2):

	var cell = tilemap.local_to_map(tilemap.to_local(mouse_position))

	var grid_manager = get_tree().current_scene.get_node("Managers/GridManager")

	if grid_manager.is_cell_occupied(cell):
		return


	var slime = slime_scene.instantiate()

	get_tree().current_scene.get_node("Entities").add_child(slime)

	slime.global_position = tilemap.map_to_local(cell)

	grid_manager.occupy_cell(cell, slime)
