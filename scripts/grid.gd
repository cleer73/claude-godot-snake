class_name Grid

const COLS: int = 30
const ROWS: int = 20
const CELL_SIZE: int = 20


static func grid_to_screen(grid_pos: Vector2i) -> Vector2:
	return Vector2(grid_pos.x * CELL_SIZE, grid_pos.y * CELL_SIZE)


static func is_within_bounds(grid_pos: Vector2i) -> bool:
	return grid_pos.x >= 0 and grid_pos.x < COLS and grid_pos.y >= 0 and grid_pos.y < ROWS
