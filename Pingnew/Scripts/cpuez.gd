extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int


func _ready():
	@warning_ignore("narrowing_conversion")
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

func _process(delta):
	ball_pos = $"../ball".position
	@warning_ignore("narrowing_conversion")
	dist = position.y - ball_pos.y
	if dist > get_parent().paddle_enemy_speed * delta:
		move_by = get_parent().paddle_enemy_speed * delta * (dist / abs(dist))
	else:
		move_by = dist
	position.y -= move_by
	@warning_ignore("integer_division")
	position.y = clamp(position.y, p_height/2, win_height - p_height/2)
