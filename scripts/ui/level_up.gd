extends Control

signal continue_pressed

var current_level: int = 1


func _ready() -> void:
	visible = false


func show_level_up(level: int) -> void:
	current_level = level
	$Panel/VBox/LevelLabel.text = "Level " + str(level) + "!"
	visible = true


func hide_level_up() -> void:
	visible = false


func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		get_viewport().set_input_as_handled()
		hide_level_up()
		continue_pressed.emit()
