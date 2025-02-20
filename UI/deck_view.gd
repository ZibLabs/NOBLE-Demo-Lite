extends Control
signal LoadCards
func _ready() -> void:
	await LoadCards
	for i in Globals.Deck:
		if "Description" in i:
			$RichTextLabel.add_text("~[" + i["Name"] + "]~" + i["Description"])
		else:
			$RichTextLabel.add_text(i["Name"] + " Description: No description available.")
		$RichTextLabel.newline()
