extends Node
signal DebugActivate

func _input(event):
	if event.is_action_pressed("toggle_console"):
		DebugActivate.emit()
func refresh_settings() -> void:
	print(ConfigHandler.load_audio_settings())
	print(ConfigHandler.load_video_settings())
	print(ConfigHandler.load_misc_settings())
func _ready() -> void:
	while true:
		await DebugActivate
		refresh_settings()
