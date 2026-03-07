extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_time: float = 2.0

var timer: float = 0.0


func _process(delta):

	timer += delta

	if timer >= spawn_time:

		timer = 0
		spawn_enemy()


func spawn_enemy():

	var enemy = enemy_scene.instantiate()

	var path = get_parent().get_node("EnemyPath")

	var path_follow = PathFollow2D.new()
	
	path_follow.loop = false

	path.add_child(path_follow)

	path_follow.progress = 0

	path_follow.add_child(enemy)
