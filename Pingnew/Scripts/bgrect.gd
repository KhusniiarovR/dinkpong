extends ColorRect

# Размеры фона
const WIDTH = 648
const HEIGHT = 1152

# Цвет для звезд и галактик
@export var star_color : Color = Color(1.0, 1.0, 1.0)  # Белый цвет для звезд
@export var galaxy_color : Color = Color(1.0, 1.0, 1.0)  # Белый цвет для галактик

func _ready():
	var image = Image.new()
	image.create(WIDTH, HEIGHT, false, Image.FORMAT_RGB8)
	image.fill(Color(0, 0, 0))  # Черный фон

	generate_background(image)
	
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	
	# Устанавливаем текстуру в ColorRect
	#self.texture = texture

# Функция для генерации фона
func generate_background(image: Image) -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# Добавляем звезды
	var num_stars = 100
	for i in range(num_stars):
		var x = rng.randf_range(0.1, WIDTH)
		var y = rng.randf_range(0.1, HEIGHT)
		var radius = rng.randi_range(1, 4)
		draw_star(image, x, y, radius)
	
	# Добавляем спиральные галактики
	var num_galaxies = 3
	for i in range(num_galaxies):
		var x_center = rng.randf_range(0, WIDTH)
		var y_center = rng.randf_range(0, HEIGHT)
		var radius = rng.randi_range(80, 150)
		add_spiral_galaxy(image, x_center, y_center, radius)

# Функция для рисования звезды
func draw_star(image: Image, x: float, y: float, radius: int) -> void:
	for dx in range(-radius, radius + 1):
		for dy in range(-radius, radius + 1):
			if dx * dx + dy * dy <= radius * radius:
				var px = int(x + dx)
				var py = int(y + dy)
				if px >= 0 and px < WIDTH and py >= 0 and py < HEIGHT:
					image.set_pixel(px, py, star_color)

# Функция для добавления спиральной галактики
func add_spiral_galaxy(image: Image, x_center: float, y_center: float, radius: float) -> void:
	var num_points = 1000
	for theta in range(0, num_points):
		var t = float(theta) / num_points * 12 * PI
		var r = radius * (t / (12 * PI))
		var x = int(x_center + r * cos(t))
		var y = int(y_center + r * sin(t))
		if x >= 0 and x < WIDTH and y >= 0 and y < HEIGHT:
			var intensity = 1.0 - (r / radius)
			image.set_pixel(x, y, galaxy_color * intensity)
