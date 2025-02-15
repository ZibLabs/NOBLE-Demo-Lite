extends Node2D
var ButtonState
var VolumeConfig = ConfigHandler.load_audio_settings()
func _on_leave_save_pressed() -> void:
	ConfigHandler.save_audio_settings("master_volume", $TabContainer/Audio/Master/Volume.value/100)
	ConfigHandler.save_audio_settings("sfx_volume", $TabContainer/Audio/SFX/Volume.value/100)
	ConfigHandler.save_audio_settings("voice_volume", $TabContainer/Audio/Voice/Volume.value/100)
	if ButtonState == null:
		ConfigHandler.save_misc_settings("EmbraceChaos?",false)
	else:
		ConfigHandler.save_misc_settings("EmbraceChaos?", ButtonState)
	Fade.fade_out(0.5)
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menu/MainMenu.tscn") # Replace with function body.
	Fade.fade_in(0.5)

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		ButtonState = true
	elif toggled_on == false:
		ButtonState = false

func _ready() -> void:
	$"TabContainer/D̸̪̋̀O̴̢̟͗̄̆N̸̨̘͉̘̏̑T̴̝̀̆ ̶̰̣͍̽̌͒͜͝T̵̤̯͂̉̃̊O̶̫̣͉͔͐̀͊Û̷̺̰Ċ̷̤̞̯H̶̨̜̥̐/ChaosMode/CheckButton".button_pressed = ConfigHandler.load_misc_settings().get("EmbraceChaos?")
	$TabContainer/Audio/Master/Volume.value = VolumeConfig.master_volume*100
	$TabContainer/Audio/SFX/Volume.value = VolumeConfig.sfx_volume*100
	$TabContainer/Audio/Voice/Volume.value = VolumeConfig.voice_volume*100
