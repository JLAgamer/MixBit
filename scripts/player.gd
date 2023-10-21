extends CharacterBody2D
class_name Player

var can_move: bool = true

const SPEED = 150


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if can_move:
		move_and_slide()
		
func get_held_item():
	return $GrabComponent.held_item

func take_damage(amount: int):
	$Health.take_damage(amount)
