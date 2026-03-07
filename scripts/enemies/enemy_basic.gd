extends CharacterBody2D

@export var speed: float = 100

var path_follow: PathFollow2D


func _ready():
	path_follow = get_parent()


func _process(delta):

	path_follow.progress += speed * delta

	if path_follow.progress_ratio >= 1.0:
		queue_free()
