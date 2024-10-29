extends Node

var config = ConfigFile.new()
const settings_file_path = "user://save"

func _ready():
	if !FileAccess.file_exists(settings_file_path):
		config.set_value("audio", "dink",1.0)
		config.set_value("audio", "goal",1.0)
		
		config.set_value("video", "fullscreen", true)
		
		config.save(settings_file_path)
	else:
		config.load(settings_file_path)
		


func save_audio_settings(key: String, value):
	config.set_value("audio", key, value)
	config.save(settings_file_path)

func load_audio_settings():
	var audio_settings = {}
	for key in config.get_section_keys("audio"):
		audio_settings[key] = config.get_value("audio", key)
	return audio_settings

func save_video_settings(key: String, value):
	config.set_value("video", key, value)
	config.save(settings_file_path)

func load_video_settings():
	var video_settings = {}
	for key in config.get_section_keys("video"):
		video_settings[key] = config.get_value("video", key)
	return video_settings
