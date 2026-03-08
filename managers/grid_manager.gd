class_name GridManager
extends Node

var grid : Dictionary = {}

func world_to_cell(world_position: Vector2i, tilemap: TileMapLayer) -> Vector2i:
	return tilemap.local_to_map(world_position)

func is_cell_occupied(cell: Vector2i) -> bool:
	return grid.has(cell)

func occupy_cell(cell: Vector2i, entity: Node):
	grid[cell] = entity

func free_cell(cell: Vector2i):
	if grid.has(cell):
		grid.erase(cell)

func get_entity_at(cell: Vector2i) -> Node:
	if grid.has(cell):
		return grid[cell]
	return null
