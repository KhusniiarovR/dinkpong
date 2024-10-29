extends Node2D

var galaxy_count = 60
func _ready():
	$galaxy_1.position.x = randi_range(80,618)
	$galaxy_1.position.y = randi_range(80,1072)
	$galaxy_2.position.x = randi_range(80,618)
	$galaxy_2.position.y = randi_range(80,1072)
	$galaxy_3.position.x = randi_range(80,618)
	$galaxy_3.position.y = randi_range(80,1072)
	$galaxy_4.position.x = randi_range(80,618)
	$galaxy_4.position.y = randi_range(80,1072)
func _process(delta):
	$galaxy_1.rotation += 1.3 * delta
	$galaxy_2.rotation += 1.3 * delta
	$galaxy_3.rotation += 1.3 * delta
	$galaxy_4.rotation += 1.3 * delta
