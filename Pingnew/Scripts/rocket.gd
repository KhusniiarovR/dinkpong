extends Node2D
const speed = 100
const rotation_speed = 5
func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		self.position = get_global_mouse_position()
	var pos_a = Vector2($"../controlspacebg/galaxy_1".position.x,$"../controlspacebg/galaxy_1".position.y)
	var pos_b = Vector2(self.position.x, self.position.y)
	var delta_pos = pos_a - pos_b
	if delta_pos.length() <= 15:
		self.position = $"../controlspacebg/galaxy_2".position
	if self.position == $"../controlspacebg/galaxy_3".position:
		self.position = $"../controlspacebg/galaxy_4".position
	if self.position == $"../controlspacebg/galaxy_4".position:
		self.position = $"../controlspacebg/galaxy_3".position
	else:
		var target_angle = atan2(delta_pos.y, delta_pos.x)
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
		var velocity = Vector2(cos(rotation), sin(rotation)) * speed * delta
		position += velocity
