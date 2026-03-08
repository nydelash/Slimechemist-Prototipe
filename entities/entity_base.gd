class_name Entity
extends CharacterBody2D

var components : Dictionary = {}


func _ready() -> void:
	register_components()


func register_components() -> void:
	for child in $Components.get_children():
		components[child.get_class()] = child


func get_component(component_name : String):
	if components.has(component_name):
		return components[component_name]
	return null


func has_component(component_name : String) -> bool:
	return components.has(component_name)
