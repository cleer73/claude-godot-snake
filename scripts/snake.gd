extends Node2D

signal collision_detected

var segments: Array[Vector2i] = []
var direction: Vector2i = Vector2i.RIGHT
var queued_direction: Vector2i = Vector2i.RIGHT
var grow_pending: int = 0

var segment_scene: PackedScene = preload("res://scenes/entities/snake_segment.tscn")
var segment_nodes: Array[Node2D] = []


func initialize(start_pos: Vector2i, length: int = 3) -> void:
	segments.clear()
	for node in segment_nodes:
		node.queue_free()
	segment_nodes.clear()

	direction = Vector2i.RIGHT
	queued_direction = Vector2i.RIGHT
	grow_pending = 0

	for i in range(length):
		segments.append(Vector2i(start_pos.x - i, start_pos.y))

	_sync_visuals()


func queue_direction(new_dir: Vector2i) -> void:
	# Prevent 180-degree turns
	if new_dir + direction != Vector2i.ZERO:
		queued_direction = new_dir


func move() -> void:
	direction = queued_direction
	var new_head: Vector2i = segments[0] + direction

	# Check wall collision
	if not Grid.is_within_bounds(new_head):
		collision_detected.emit()
		return

	# Check self collision
	if new_head in segments:
		collision_detected.emit()
		return

	segments.insert(0, new_head)

	if grow_pending > 0:
		grow_pending -= 1
	else:
		segments.pop_back()

	_sync_visuals()


func grow() -> void:
	grow_pending += 1


func get_head() -> Vector2i:
	return segments[0]


func get_occupied_cells() -> Array[Vector2i]:
	return segments


func _sync_visuals() -> void:
	# Add nodes if needed
	while segment_nodes.size() < segments.size():
		var node: Node2D = segment_scene.instantiate()
		add_child(node)
		segment_nodes.append(node)

	# Remove nodes if needed
	while segment_nodes.size() > segments.size():
		var node: Node2D = segment_nodes.pop_back()
		node.queue_free()

	# Update positions and head coloring
	for i in range(segments.size()):
		segment_nodes[i].position = Grid.grid_to_screen(segments[i])
		if segment_nodes[i].has_method("set_is_head"):
			segment_nodes[i].set_is_head(i == 0)
