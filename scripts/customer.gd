extends Node2D
class_name Customer

@onready var player: Player = get_node("../Player")

var patience: float = ScoreSystem.get_patience()
var walk_speed: float = 2.0
var requested_drink: String
var assigned_table: Table
var desired_table: Table
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	requested_drink = DrinkManager.get_all_orderable_drinks().pick_random()
	$Desire.set_texture(DrinkManager.generate_drink_sprite(requested_drink))
	$AnimatedSprite2D.speed_scale = randf_range(0.5,2)
	find_table()
	timer.wait_time = patience
	desired_table.taken = true
#	for child in get_children():
#		if child is Table:
#			assigned_table = child
#			assigned_table.drink_recieved.connect(given_drink)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left != 0 and timer.time_left < patience/2:
		$AnimatedSprite2D.speed_scale = $AnimatedSprite2D.speed_scale + (1 * delta)

func given_drink(drink_given: String):
	if drink_given == requested_drink:
		leave()
		ScoreSystem.customer_served(requested_drink)
	else:
		player.take_damage(1)

func set_table():
	assigned_table = desired_table
	assigned_table.drink_recieved.connect(given_drink)
	timer.start()

func find_table():
	desired_table = get_tree().get_nodes_in_group("Table").filter(func(table: Table): return !table.taken).pick_random() #Grab random non taken table
	var tween = create_tween()
	tween.tween_property(self, "global_position", desired_table.marker.global_position, walk_speed)
	tween.tween_callback(set_table)

func leave():
	$Desire.visible = false
	assigned_table.taken = false
	assigned_table.drink_recieved.disconnect(given_drink)
	assigned_table = null
	var tween = create_tween()
	tween.tween_property(self, "global_position", get_node("../CustomerSpawner").global_position, walk_speed)
	tween.tween_callback(queue_free)


func _on_timer_timeout():
	leave()
	player.take_damage(1)
