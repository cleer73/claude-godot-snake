extends Node2D

@onready var snake: Node2D = $SnakeContainer/Snake
@onready var food_spawner: Node2D = $FoodContainer/FoodSpawner
@onready var game_timer: Timer = $GameTimer
@onready var grid_lines: Node2D = $GridLines

var running: bool = false


func _ready() -> void:
	game_timer.timeout.connect(_on_tick)
	snake.collision_detected.connect(_on_collision)
	GameManager.level_changed.connect(_on_level_changed)


func start_game() -> void:
	GameManager.reset()
	snake.initialize(Vector2i(5, 10))
	food_spawner.clear()
	food_spawner.spawn(snake.get_occupied_cells())
	running = true
	game_timer.wait_time = GameManager.get_tick_speed()
	game_timer.start()


func stop_game() -> void:
	running = false
	game_timer.stop()


func resume_game() -> void:
	running = true
	game_timer.wait_time = GameManager.get_tick_speed()
	game_timer.start()


func _unhandled_input(event: InputEvent) -> void:
	if not running:
		return
	if event.is_action_pressed("move_up"):
		snake.queue_direction(Vector2i.UP)
	elif event.is_action_pressed("move_down"):
		snake.queue_direction(Vector2i.DOWN)
	elif event.is_action_pressed("move_left"):
		snake.queue_direction(Vector2i.LEFT)
	elif event.is_action_pressed("move_right"):
		snake.queue_direction(Vector2i.RIGHT)


func _on_tick() -> void:
	snake.move()
	if not running:
		return

	if snake.get_head() == food_spawner.get_food_pos():
		snake.grow()
		GameManager.add_score()
		food_spawner.spawn(snake.get_occupied_cells())


func _on_collision() -> void:
	stop_game()
	# Signal handled by main scene


func _on_level_changed(_new_level: int) -> void:
	if _new_level > 1:
		stop_game()
