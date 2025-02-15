extends Control
signal LoadCards
func _ready() -> void:
	await LoadCards
	for i in Globals.Deck:
		$RichTextLabel.add_text(i["Name"] + " " + str(i["Attack"]) + " " + str(i["Block"]) + " " + str(i["Cost"]) + " " + str(i["Special"]))
		$RichTextLabel.newline()
