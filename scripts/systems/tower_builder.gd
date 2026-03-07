extends Node2D

@export var tower_scene: PackedScene


func _process(delta):

	if Input.is_action_just_pressed("click"):

		var pos = get_global_mouse_position()

		if can_build(pos):

			place_tower(pos)


func can_build(pos):

	var space = get_world_2d().direct_space_state

	var query = PhysicsPointQueryParameters2D.new()

	query.position = pos
	query.collide_with_bodies = true

	var result = space.intersect_point(query)

	return result.is_empty()


func place_tower(pos):

	var tower = tower_scene.instantiate()

	tower.position = pos

	get_parent().add_child(tower)
