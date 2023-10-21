extends Node2D

var max_health: int = 3
var cur_health: int

@export var heart: PackedScene

func _ready():
	for i in range(max_health):
		var new_heart = heart.instantiate()
		new_heart.position = Vector2(2+(i*10) ,0)
		$CanvasLayer.add_child(new_heart)
	cur_health = max_health

func take_damage(amount: int):
	if cur_health == 0:
		return
	cur_health -= amount
	update_ui()
	if cur_health <= 0:
		cur_health = 0
		get_node("/root/Game/GameOver").game_over()

func update_ui():
	var last_heart = get_current_heart()
	last_heart.set_meta("empty", true)
	last_heart.get_child(0).play("take_damage")

func get_current_heart():
	var all_hearts = $CanvasLayer.get_children()
	var all_full_hearts = all_hearts.filter(func(heart): return !heart.has_meta("empty"))
	return all_full_hearts.back()
	

func set_max_health(new_max_health: int):
	if cur_health == max_health:
		max_health = new_max_health
		cur_health = max_health
	max_health = new_max_health
