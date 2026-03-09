class_name Projectile
extends Area2D

var target : Node2D
var damage : float

var speed : float = 400.0


func setup(new_target: Node2D, new_damage: float):

	target = new_target
	damage = new_damage


func _physics_process(delta):

	if target == null or not is_instance_valid(target):
		queue_free()
		return

	var direction = (target.global_position - global_position).normalized()

	global_position += direction * speed * delta


func _on_body_entered(body: Node2D):

	print("HIT:", body.name)

	if body.is_in_group("enemies"):

		var stats = body.get_node_or_null("Components/StatsComponent")

		if stats != null:
			stats.take_damage(damage)

		queue_free()
