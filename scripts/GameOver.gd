extends CanvasLayer

func game_over():
	get_tree().paused = true
	visible = true
	if ScoreSystem.score > ScoreSystem.high_score:
		ScoreSystem.high_score = ScoreSystem.score
		var save_file = FileAccess.open("user://save.data", FileAccess.WRITE)
		save_file.store_32(ScoreSystem.high_score)
	$Control/Label2.text = "HIGH SCORE: " + str(ScoreSystem.high_score)

func _on_button_pressed():
	get_tree().paused = false
	ScoreSystem.score = 0
	get_tree().reload_current_scene()
