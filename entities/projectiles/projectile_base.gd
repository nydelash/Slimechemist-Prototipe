class_name Projectile
extends Area2D


var speed : float = 300

var target : Node

var damage : float = 1

var pierce : int = 0

var bounce : int = 0


func set_target(t):
	target = t


func _physics_process(delta):

	if not target or not is_instance_valid(target):
		queue_free()
		return

	var direction = (target.global_position - global_position).normalized()

	global_position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:

	if body.is_in_group("enemies"):

		var stats = body.get_component("StatsComponent")

		if stats:
			stats.take_damage(damage)

		if pierce > 0:
			pierce -= 1
		else:
			queue_free()
