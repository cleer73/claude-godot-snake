extends Node2D

var line_color: Color = Color(0.15, 0.15, 0.2, 0.5)


func _draw() -> void:
	for x in range(Grid.COLS + 1):
		var x_pos: float = x * Grid.CELL_SIZE
		draw_line(Vector2(x_pos, 0), Vector2(x_pos, Grid.ROWS * Grid.CELL_SIZE), line_color)
	for y in range(Grid.ROWS + 1):
		var y_pos: float = y * Grid.CELL_SIZE
		draw_line(Vector2(0, y_pos), Vector2(Grid.COLS * Grid.CELL_SIZE, y_pos), line_color)
