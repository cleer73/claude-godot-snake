extends Node2D

var food_color: Color = Color(0.9, 0.2, 0.2)
var outline_color: Color = Color(0.6, 0.1, 0.1)


func _draw() -> void:
	var rect := Rect2(1, 1, Grid.CELL_SIZE - 2, Grid.CELL_SIZE - 2)
	draw_rect(rect, outline_color)
	draw_rect(Rect2(2, 2, Grid.CELL_SIZE - 4, Grid.CELL_SIZE - 4), food_color)
