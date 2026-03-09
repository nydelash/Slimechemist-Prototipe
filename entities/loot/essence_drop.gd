class_name EssenceDrop
extends Area2D


var value : int = 1


func _input_event(viewport, event, shape_idx):

	if event.is_action_pressed("click"):

		collect()


func collect():

	var game_manager = get_tree().current_scene.get_node("Managers/GameManager")

	game_manager.add_essence(value)

	queue_free()
