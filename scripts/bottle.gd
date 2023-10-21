extends RigidBody2D
class_name Bottle

var current_drink: String = "empty"
var splash_color: Color

func swap_drink(drink: String):
	current_drink = drink
	splash_color = Color(StaticData.drink_data[drink]["splash_color"])
	$Sprite.set_texture(DrinkManager.generate_drink_sprite(drink))
	$CPUParticles2D.color = splash_color

func throw(throw_force):
	reparent(get_node("/root/Game"))
	apply_impulse(Vector2.UP * throw_force)
	apply_torque_impulse(100)
	print(str(self) + ": thrown")

func mix(drink: String):
	if current_drink == "empty":
		swap_drink(drink)
	elif !StaticData.drink_data[current_drink]["mixed"] and StaticData.mix_data[current_drink][drink] != null:
		print(StaticData.mix_data[current_drink][drink])
		swap_drink(StaticData.mix_data[current_drink][drink])
		

func _on_area_2d_area_entered(area): #on impact with table
	linear_velocity = Vector2.ZERO
	$Sprite.visible = false
	var particles = $CPUParticles2D
	particles.emitting = true
	await get_tree().create_timer(0.3).timeout
	queue_free()
