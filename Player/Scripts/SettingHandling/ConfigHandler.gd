extends Node
var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "user://Settings.cfg"
# Marker
func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		print("Config File Does Not Exist. Creating...")
		config.set_value("video", "Fullscreen", "ToBeAdded")
		config.set_value("video", "screen_shake", "ToBeAdded")

		config.set_value("audio", "master_volume", 1.0)
		config.set_value("audio", "sfx_volume", 1.0)
		config.set_value("audio", "voice_volume", 1.0)

		config.set_value("misc", "EmbraceChaos?", false)
		config.set_value("misc", "IsDev?", true)

		config.save(SETTINGS_FILE_PATH)
	else:
		print("Config Exists. Loading...")
		config.load(SETTINGS_FILE_PATH)


func save_video_settings(key: String, value):
	config.set_value("video", key, value)
	config.save(SETTINGS_FILE_PATH)
	
func load_video_settings():
	var video_settings = {}
	for key in config.get_section_keys("video"):
		video_settings[key] = config.get_value("video", key)
	return video_settings


func save_audio_settings(key: String, value):
	config.set_value("audio", key, value)
	config.save(SETTINGS_FILE_PATH)
	
func load_audio_settings():
	var audio_settings = {}
	for key in config.get_section_keys("audio"):
		audio_settings[key] = config.get_value("audio", key)
	return audio_settings
	
func save_misc_settings(key: String, value):
	config.set_value("misc", key, value)
	config.save(SETTINGS_FILE_PATH)

func load_misc_settings():
	var misc_settings = {}
	for key in config.get_section_keys("misc"):
		misc_settings[key] = config.get_value("misc", key)
	return misc_settings
