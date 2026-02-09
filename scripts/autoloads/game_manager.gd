extends Node

signal score_changed(new_score: int)
signal level_changed(new_level: int)

var score: int = 0
var level: int = 1

const POINTS_PER_FOOD: int = 10
const POINTS_PER_LEVEL: int = 50
const BASE_TICK_SPEED: float = 0.15
const SPEED_SCALE: float = 0.95
const MIN_TICK_SPEED: float = 0.05


func reset() -> void:
	score = 0
	level = 1
	score_changed.emit(score)
	level_changed.emit(level)


func add_score() -> void:
	score += POINTS_PER_FOOD
	score_changed.emit(score)
	var new_level: int = (score / POINTS_PER_LEVEL) + 1
	if new_level > level:
		level = new_level
		level_changed.emit(level)


func get_tick_speed() -> float:
	var speed: float = BASE_TICK_SPEED * pow(SPEED_SCALE, level - 1)
	return maxf(speed, MIN_TICK_SPEED)
