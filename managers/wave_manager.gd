class_name WaveManager
extends Node


var stage : int = 1
var wave_type : int = 0

var enemies_to_spawn : int = 0
var enemies_alive : int = 0

var spawn_delay : float = 1.0
var spawn_timer : float = 0.0


func _ready():
	start_wave()


func _physics_process(delta):

	if enemies_to_spawn > 0:
		spawn_timer -= delta

		if spawn_timer <= 0:
			spawn_enemy()
			spawn_timer = spawn_delay

	if enemies_to_spawn == 0 and enemies_alive == 0:
		next_wave()


func start_wave():

	match wave_type:

		0:
			enemies_to_spawn = 5 * stage

		1:
			enemies_to_spawn = 10 * stage

		2:
			enemies_to_spawn = 1

	enemies_alive = enemies_to_spawn


func spawn_enemy():

	var spawner = get_tree().current_scene.get_node("Managers/EnemySpawner")

	var spawn_point = get_tree().current_scene.get_node("World/Spawners").get_children().pick_random()

	spawner.spawn_enemy(spawn_point.global_position)

	enemies_to_spawn -= 1


func enemy_died():

	enemies_alive -= 1


func next_wave():

	wave_type += 1

	if wave_type > 2:
		wave_type = 0
		stage += 1

	start_wave()
