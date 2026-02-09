extends Node2D

var food_scene: PackedScene = preload("res://scenes/entities/food.tscn")
var food_node: Node2D = null
var food_pos: Vector2i = Vector2i(-1, -1)


func spawn(occupied: Array[Vector2i]) -> void:
	var available: Array[Vector2i] = []
	for x in range(Grid.COLS):
		for y in range(Grid.ROWS):
			var cell := Vector2i(x, y)
			if cell not in occupied:
				available.append(cell)

	if available.is_empty():
		return

	food_pos = available[randi() % available.size()]

	if food_node:
		food_node.queue_free()

	food_node = food_scene.instantiate()
	food_node.position = Grid.grid_to_screen(food_pos)
	add_child(food_node)


func get_food_pos() -> Vector2i:
	return food_pos


func clear() -> void:
	if food_node:
		food_node.queue_free()
		food_node = null
	food_pos = Vector2i(-1, -1)
