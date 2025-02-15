extends RichTextLabel
var LocalVoiceVolumeText
func _ready() -> void:
	LocalVoiceVolumeText = str($"../Volume".value)
	$".".set_text(LocalVoiceVolumeText)
func _on_volume_value_changed(value: float) -> void:
	LocalVoiceVolumeText = str($"../Volume".value)
	$".".set_text(LocalVoiceVolumeText)
	
