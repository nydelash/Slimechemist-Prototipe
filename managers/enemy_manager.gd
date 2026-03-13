class_name EnemyManager
extends Node

var enemies : Array = []


func register_enemy(enemy):

	enemies.append(enemy)


func unregister_enemy(enemy):

	enemies.erase(enemy)


func get_enemies():

	return enemies
