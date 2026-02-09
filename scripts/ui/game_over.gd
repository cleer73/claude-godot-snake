extends Control

signal restart_requested


func _ready() -> void:
	visible = false


func show_game_over() -> void:
	visible = true


func hide_game_over() -> void:
	visible = false


func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		get_viewport().set_input_as_handled()
		hide_game_over()
		restart_requested.emit()
