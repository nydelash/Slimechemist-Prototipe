class_name TraitComponent
extends Node

var traits : Array[TraitData] = []

var stats_component


func _ready():
	stats_component = get_parent().get_parent().get_component("StatsComponent")


func add_trait(trait_data : TraitData):

	traits.append(trait_data)

	apply_trait_stats(trait_data)

	if trait_data.special_component:
		var component = trait_data.special_component.instantiate()
		get_parent().add_child(component)


func remove_trait(trait_data : TraitData):

	if trait_data in traits:
		traits.erase(trait_data)
		remove_trait_stats(trait_data)


func apply_trait_stats(trait_data : TraitData):

	stats_component.max_health += trait_data.health_modifier
	stats_component.damage += trait_data.damage_modifier
	stats_component.attack_speed += trait_data.attack_speed_modifier
	stats_component.range += trait_data.range_modifier


func remove_trait_stats(trait_data : TraitData):

	stats_component.max_health -= trait_data.health_modifier
	stats_component.damage -= trait_data.damage_modifier
	stats_component.attack_speed -= trait_data.attack_speed_modifier
	stats_component.range -= trait_data.range_modifier
