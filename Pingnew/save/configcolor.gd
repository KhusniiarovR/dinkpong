extends Node

var config = ConfigFile.new()
const settings_file_path = "user://save_color"

func _ready():
	if !FileAccess.file_exists(settings_file_path):
		config.set_value("color", "color1", Color(1,1,1,1))
		config.set_value("color", "color2", Color(1,1,1,1))
		config.set_value("color", "color3", Color(1,1,1,1))
		config.set_value("color", "color4", Color(1,0,0,1))
		config.save(settings_file_path)
	else:
		config.load(settings_file_path)

func save_color_settings(key: String, value):
	config.set_value("color", key, value)
	config.save(settings_file_path)
	
func load_color_settings():
	var color_settings = {}
	for key in config.get_section_keys("color"):
		color_settings[key] = config.get_value("color", key)
	return color_settings
