extends Node2D
class_name GrabComponent

var held_item: RigidBody2D

@export var grab_speed: float = 1
var throw_force: float
var can_pick_up: bool

func _ready():
	held_item = null #set no held item
	throw_force = 200
	can_pick_up = true

func pickup_check(item) -> bool:
	if not can_pick_up:
		return false
	if item.is_in_group("Pickups"):
		return true
	return false

func pickup_action(item: Node2D):
	can_pick_up = false
	print(str(item) + ": picking up")
	item.reparent(self)
	var tween = get_tree().create_tween()
	tween.tween_property(item,"position",Vector2.ZERO,0.2 * 1/grab_speed) #move item to be held 
	tween.tween_property(item,"rotation",18,0.25 * 1/grab_speed) #rotate for visuals
	tween.tween_callback(func(): held_item = item)

func _input(event):
	if event.is_action_pressed("interact"):
		interact()
	if event.is_action_pressed("throw") and held_item:
		throw()

func throw():
	if held_item.has_method("throw"): #if can be thrown
		held_item.throw(throw_force)
		held_item = null #remove held item
		can_pick_up = true 

func interact():
	var item
	if $Area2D.has_overlapping_bodies():  #check if item is in range
		item = $Area2D.get_overlapping_bodies()[0] #ref current item
	if $Area2D.has_overlapping_areas():
		item = $Area2D.get_overlapping_areas()[0].get_parent()
	if not item == null:
		if pickup_check(item): #check if pickup
			pickup_action(item) #pick up function
		if item.has_method("interact"):
			item.interact()
