class_name Slime
extends Entity

@export var entity_data : EntityData


func _ready():

	add_to_group("slimes")
	
	var trait_component = $Components/TraitComponent

	var traits = preload("res://resources/traits/trait_damage.tres")

	trait_component.add_trait(traits)
