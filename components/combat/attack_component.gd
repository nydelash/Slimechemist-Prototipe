class_name AttackComponent
extends Node


var entity_data : EntityData
var attack_data : AttackData

var target : Node = null

var attack_timer : float = 0.0


func _ready():

	entity_data = get_parent().get_parent().entity_data
	attack_data = entity_data.attack_data


func _physics_process(delta):

	attack_timer -= delta

	if not target or not is_instance_valid(target):
		target = find_target()

	if target and attack_timer <= 0:
		attack()


func find_target():

	var enemies = get_tree().get_nodes_in_group("enemies")

	var closest_enemy = null
	var closest_distance = entity_data.attack_range

	for enemy in enemies:

		if not is_instance_valid(enemy):
			continue

		var distance = get_parent().get_parent().global_position.distance_to(enemy.global_position)

		if distance < closest_distance:
			closest_enemy = enemy
			closest_distance = distance

	return closest_enemy


func attack():

	attack_timer = attack_data.cooldown

	if attack_data.projectile_scene:
		spawn_projectile()


func spawn_projectile():

	var projectile = attack_data.projectile_scene.instantiate()

	get_tree().current_scene.get_node("Projectiles").add_child(projectile)

	projectile.global_position = get_parent().get_parent().global_position

	projectile.set_target(target)
