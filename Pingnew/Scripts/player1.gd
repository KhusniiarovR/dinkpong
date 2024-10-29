extends StaticBody2D
var win_height : float
var p_height : float
var paddle_speed = 100

func _ready():
	win_height = get_viewport_rect().size.x
	var difficulty_settings = Difficulty.load_difficulty_settings()
	paddle_speed = difficulty_settings.player_speed
	scale.x = difficulty_settings.player_size
	p_height = $ColorRect.get_size().x * scale.x

func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= paddle_speed* delta
	elif Input.is_action_pressed("right"):
		position.x += paddle_speed * delta

	position.x = clamp(position.x, p_height/2, win_height - p_height/2)
