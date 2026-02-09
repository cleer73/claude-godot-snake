extends Control

@onready var score_label: Label = $ScoreLabel
@onready var level_label: Label = $LevelLabel


func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	GameManager.level_changed.connect(_on_level_changed)
	_on_score_changed(0)
	_on_level_changed(1)


func _on_score_changed(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)


func _on_level_changed(new_level: int) -> void:
	level_label.text = "Level: " + str(new_level)
