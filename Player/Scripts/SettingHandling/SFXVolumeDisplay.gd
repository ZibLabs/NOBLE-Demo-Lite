extends RichTextLabel
var LocalSfxVolumeText
func _ready() -> void:
	LocalSfxVolumeText = str($"../Volume".value)
	$".".set_text(LocalSfxVolumeText)
func _on_volume_value_changed(value: float) -> void:
	LocalSfxVolumeText = str($"../Volume".value)
	$".".set_text(LocalSfxVolumeText)
	
