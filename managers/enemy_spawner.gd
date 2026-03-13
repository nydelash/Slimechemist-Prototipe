class_name EnemySpawner
extends Node

@export var enemy_scene : PackedScene


func spawn_enemy(position: Vector2):

	var enemy = enemy_scene.instantiate()

	get_tree().current_scene.get_node("Entities").add_child(enemy)

	enemy.global_position = position


func _ready():

	var spawner = get_tree().current_scene.get_node("Managers/EnemySpawner")

	var spawn = get_tree().current_scene.get_node("World/Spawners/Spawn_1")

	spawner.spawn_enemy(spawn.global_position)



func _on_buy_slime_button_pressed():

	var game_manager = get_tree().current_scene.get_node("Managers/GameManager")

	if game_manager.spend_essence(5):
		game_manager.add_slime()
