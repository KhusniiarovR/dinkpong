extends CharacterBody2D

var win_size : Vector2
const start_speed : int = 500
const accel : int = 120
var speed : int
var dir : Vector2
const MAX_Y : float = 0.6

func _ready():
	win_size = get_viewport_rect().size
func new_ball():
	position.y = win_size.y/2
	position.x = randi_range(150, win_size.x-150)
	speed = start_speed
	dir = random_direction()

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		$"../audio/dink".play()
		collider = collision.get_collider()
		if collider == $"../player1" :
			speed += accel
			dir = new_direction(collider)
		elif collider == %player2:
			speed += accel
			dir = new_direction(collider)
		else:
			dir = dir.bounce(collision.get_normal())

func random_direction():
	var new_dir := Vector2()
	new_dir.y = [1,-1].pick_random()
	new_dir.x = randf_range(-1,1)
	return new_dir.normalized()

func new_direction(collider):
	var ball_x = position.x
	var pad_x = collider.position.x
	var dist = ball_x - pad_x
	var new_dir := Vector2()
	if dir.y > 0:
		new_dir.y = -1
	else:
		new_dir.y = 1
	new_dir.x = (dist / (collider.p_height / 2)) * MAX_Y
	return new_dir.normalized()
