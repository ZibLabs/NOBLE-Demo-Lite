extends Node2D

var direction = "down"
var EY = 0

@export_enum("Common", "Uncommon", "Rare", "Legendary") var Rarity

var playerNode : Node = null

func _ready() -> void:
	# Global search for the player node across the entire scene tree
	playerNode = get_tree().root.get_node("Beginning/PlatformerController2D")  # Adjust the path accordingly

	# Wait until the player node is found
	while not playerNode:
		await get_tree().create_timer(0.1).timeout  # Wait before checking again
		print("Attempting to find player node...")  # Debug message
		playerNode = get_tree().root.get_node("Beginning/PlatformerController2D")  # Global search again
	
	# Once the player node is found, proceed with the rest of the logic
	if playerNode:
		print("Player node found at: " + str(playerNode.get_path()))  # Debugging path
	else:
		print("Player node still not found.")
		return
	
	var chestLocation = global_transform.origin
	while true:
		var playerLocation = playerNode.global_transform.origin
		var distance = playerLocation.distance_to(chestLocation)
		await get_tree().create_timer(0.01).timeout
		
		# Handle the appearance of the E key based on the distance
		if distance < 50:
			if $KeyboardE.modulate.a8 >= 0:
				$KeyboardE.modulate.a8 += 20
		else:
			$KeyboardE.modulate.a8 -= 20
		
		# If the player is close enough and activates the chest, open it
		if distance < 50 and Input.is_action_pressed("Activate"):
			$AnimatedSprite2D.play("OpenChest", 1)
			$KeyboardE.visible = false
			await get_tree().create_timer(0.8).timeout
			break
		
		# Change direction for the "E" key animation
		if EY < -3:
			direction = "up"
		if EY > 3:
			direction = "down"
		
		# Move the E key up or down
		if direction == "up":
			$KeyboardE.move_local_y(0.1)
			EY += 0.1
		if direction == "down":
			$KeyboardE.move_local_y(-0.1)
			EY -= 0.1
	
	$GPUParticles2D.emitting = true
	print("Loop Broken")
