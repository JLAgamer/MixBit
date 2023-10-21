extends Node2D
class_name BottleSpawner

@export var bottle_scene: PackedScene

func spawn():
	add_child(bottle_scene.instantiate())

