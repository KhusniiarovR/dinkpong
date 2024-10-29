extends ParallaxBackground

var speed = 20

func _process(delta):
	scroll_offset.x -= delta * speed
	scroll_offset.y -= delta * speed * 0.5
