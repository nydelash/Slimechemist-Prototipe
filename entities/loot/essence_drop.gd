class_name EssenceDrop
extends Area2D

var value : int = 1


func _input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton:

		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:

			collect()


func collect():

	var game_manager = get_tree().current_scene.get_node("Managers/GameManager")

	game_manager.add_essence(value)

	queue_free()
