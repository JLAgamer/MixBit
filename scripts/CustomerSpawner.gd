extends Node2D

@export var customer_scene: PackedScene

func _ready():
	spawn()
	$Timer.start()

func spawn():
	var customer = customer_scene.instantiate()
	customer.global_position = global_position
	add_sibling.call_deferred(customer)
	$Timer.wait_time = ScoreSystem.get_respawn_rate()


func _on_timer_timeout():
	if get_tree().get_nodes_in_group("Customer").size() < 5:
		spawn()
