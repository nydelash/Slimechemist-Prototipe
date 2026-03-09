class_name Enemy
extends Entity

@export var entity_data : EntityData

var speed : float = 60.0
var target : Node2D


func _ready():

	add_to_group("enemies")

	target = get_tree().current_scene.get_node("World/LaboratoryTarget")


func _physics_process(delta):

	if target == null:
		return

	var direction = (target.global_position - global_position).normalized()

	velocity = direction * speed

	move_and_slide()
