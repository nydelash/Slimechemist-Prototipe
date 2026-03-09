class_name LootManager
extends Node

@export var essence_scene : PackedScene


func spawn_essence(position: Vector2, amount: int):

	for i in range(amount):

		var essence = essence_scene.instantiate()

		get_tree().current_scene.get_node("Entities").add_child(essence)

		essence.global_position = position
