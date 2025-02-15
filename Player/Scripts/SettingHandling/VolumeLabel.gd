extends RichTextLabel
var LocalVolumeText
func _ready() -> void:
	LocalVolumeText = str($"../Volume".value)
	$".".set_text(LocalVolumeText)
func _on_volume_value_changed(value: float) -> void:
	LocalVolumeText = str($"../Volume".value)
	$".".set_text(LocalVolumeText)
