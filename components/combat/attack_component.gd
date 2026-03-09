class_name AttackComponent
extends Node

@export var attack_data : AttackData

var attack_timer : float = 0.0
var target : Node2D = null


func _physics_process(delta):

	if attack_data == null:
		return

	attack_timer -= delta

	if target == null:
		find_target()
		return

	if not is_instance_valid(target):
		target = null
		return

	var owner = get_parent().get_parent()

	var distance = owner.global_position.distance_to(target.global_position)

	if distance > attack_data.range:
		target = null
		return

	if attack_timer <= 0:
		attack()
		attack_timer = 1.0 / attack_data.attack_speed


func find_target():

	var owner = get_parent().get_parent()

	var enemies = get_tree().get_nodes_in_group("enemies")

	var closest = null
	var closest_distance = INF

	for enemy in enemies:

		var distance = owner.global_position.distance_to(enemy.global_position)

		if distance < closest_distance and distance <= attack_data.range:

			closest = enemy
			closest_distance = distance

	target = closest


func attack():

	if attack_data.projectile_scene == null:
		return

	var owner = get_parent().get_parent()

	var projectile = attack_data.projectile_scene.instantiate()

	get_tree().current_scene.get_node("Projectiles").add_child(projectile)

	projectile.global_position = owner.global_position

	projectile.setup(target, attack_data.damage)
