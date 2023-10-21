extends Node

@onready var game = get_node("/root/Game")
var bottle_spawners: Array[BottleSpawner]

func _ready():
	for child in game.get_children():
		if child is BottleSpawner:
			bottle_spawners.append(child)
	spawn_all()

func spawn_all():
	for spawner in bottle_spawners:
		spawner.spawn()
		
#func _process(delta):
#	if get_tree().get_nodes_in_group("Bottles"):
#		spawn_all()

func all_spawners_empty():
	var ans = true
	for spawner in bottle_spawners:
		if spawner.get_child_count() > 0:
			ans = false
	return ans

func _process(delta):
	if all_spawners_empty():
		spawn_all()
