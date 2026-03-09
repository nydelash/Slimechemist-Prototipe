class_name Enemy
extends Entity

var speed : float = 50

var target_position : Vector2


func _ready():

	add_to_group("enemies")

	target_position = get_tree().current_scene.get_node("World/LaboratoryTarget").global_position


func _physics_process(delta):

	var direction = (target_position - global_position).normalized()

	velocity = direction * speed

	move_and_slide()
