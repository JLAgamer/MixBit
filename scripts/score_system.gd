extends Node
var score: int = 0
var high_score: int = 0

func _ready():
	var save_file = FileAccess.open("user://save.data",FileAccess.READ)
	if save_file != null:
		high_score = save_file.get_32()

func customer_served(requested_drink):
	if StaticData.drink_data[requested_drink]["mixed"]:
		score += 200
	else:
		score += 100
		
func get_patience():
	if score > 6000:
		return 10
	if score > 4500:
		return 15
	if score > 3000:
		return 20
	if score > 1500:
		return 30
	return 40

func get_respawn_rate():
	if score > 4500:
		return 2
	if score > 2000:
		return 2.5
	if score > 1000:
		return 3
	return 4
