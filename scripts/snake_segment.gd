extends Node2D

var is_head: bool = false
var body_color: Color = Color(0.2, 0.8, 0.2)
var head_color: Color = Color(0.4, 0.95, 0.4)
var outline_color: Color = Color(0.1, 0.5, 0.1)


func set_is_head(value: bool) -> void:
	is_head = value
	queue_redraw()


func _draw() -> void:
	var rect := Rect2(1, 1, Grid.CELL_SIZE - 2, Grid.CELL_SIZE - 2)
	var fill: Color = head_color if is_head else body_color
	draw_rect(rect, outline_color)
	draw_rect(Rect2(2, 2, Grid.CELL_SIZE - 4, Grid.CELL_SIZE - 4), fill)
