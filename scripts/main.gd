extends Node

@onready var game: Node2D = $Game
@onready var game_over_screen: Control = $UILayer/GameOver
@onready var level_up_screen: Control = $UILayer/LevelUp


func _ready() -> void:
	game_over_screen.restart_requested.connect(_on_restart)
	level_up_screen.continue_pressed.connect(_on_level_continue)
	game.snake.collision_detected.connect(_on_game_over)
	GameManager.level_changed.connect(_on_level_changed)
	game.start_game()


func _on_game_over() -> void:
	game.stop_game()
	game_over_screen.show_game_over()


func _on_restart() -> void:
	game_over_screen.hide_game_over()
	level_up_screen.hide_level_up()
	game.start_game()


func _on_level_changed(new_level: int) -> void:
	if new_level > 1:
		level_up_screen.show_level_up(new_level)


func _on_level_continue() -> void:
	game.resume_game()
