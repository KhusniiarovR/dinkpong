extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : float
var p_height : int
var paddle_speed = 150

func _ready():
	win_height = get_viewport_rect().size.x
	var difficulty_settings = Difficulty.load_difficulty_settings()
	paddle_speed = difficulty_settings.bot_speed
	scale.x = difficulty_settings.bot_size
	p_height = $ColorRect.get_size().x * scale.x

func _process(delta):
	ball_pos = $"../ball".position
	@warning_ignore("narrowing_conversion")
	dist = position.x - ball_pos.x
	if dist > paddle_speed * delta:
		move_by = paddle_speed * delta * (dist / abs(dist))
	elif dist <= 10:
		move_by = dist
	else:
		#dist <= paddle_speed * delta #and dist != 0:
		move_by = paddle_speed * delta * (dist / abs(dist))
	position.x -= move_by
	@warning_ignore("integer_division")
	position.x = clamp(position.x, p_height/2, win_height - p_height/2)
