class_name GameManager
extends Node

var essence : int = 0
var slimes : int = 1   # cantidad inicial

var essence_label : Label
var slime_label : Label


func _ready():

	essence_label = get_tree().current_scene.get_node("UI/EssenceCounter")
	slime_label = get_tree().current_scene.get_node("UI/SlimeCounter")

	update_ui()


func add_essence(amount : int):

	essence += amount

	update_ui()


func spend_essence(amount : int) -> bool:

	if essence < amount:
		return false

	essence -= amount
	update_ui()
	return true


func add_slime():

	slimes += 1
	update_ui()


func use_slime() -> bool:

	if slimes <= 0:
		return false

	slimes -= 1
	update_ui()
	return true


func update_ui():

	if essence_label:
		essence_label.text = "Essence: " + str(essence)

	if slime_label:
		slime_label.text = "Slimes: " + str(slimes)
