class_name InputManager
extends Node


func _input(event):

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			handle_left_click(event.position)



func handle_left_click(mouse_position):

	var space = get_viewport().gui_get_hovered_control()

	if space != null:
		return

	var build_manager = get_tree().current_scene.get_node("Managers/BuildManager")

	build_manager.place_slime(mouse_position)
