class_name StatsComponent
extends Node

var entity_data : EntityData

var max_health : float
var current_health : float

var damage : float
var attack_speed : float
var range : float


func _ready():

	entity_data = get_parent().get_parent().entity_data

	max_health = entity_data.max_health
	current_health = max_health

	damage = entity_data.damage
	attack_speed = entity_data.attack_speed
	range = entity_data.attack_range


func take_damage(amount : float):

	current_health -= amount

	if current_health <= 0:
		die()


func die():

	var entity = get_parent().get_parent()

	if entity.is_in_group("enemies"):

		drop_loot()

		var wave_manager = get_tree().current_scene.get_node("Managers/WaveManager")
		wave_manager.enemy_died()

		var enemy_manager = get_tree().current_scene.get_node("Managers/EnemyManager")
		enemy_manager.unregister_enemy(entity)

	entity.queue_free()


func drop_loot():

	var loot_manager = get_tree().current_scene.get_node("Managers/LootManager")

	var drop_amount = randi_range(1,3)

	loot_manager.spawn_essence(
		get_parent().get_parent().global_position,
		drop_amount
	)
