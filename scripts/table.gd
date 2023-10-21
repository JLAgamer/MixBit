extends Node2D
class_name Table

@onready var marker = $Marker2D
var taken = false
signal drink_recieved(drink)

func _on_area_2d_body_entered(body):
	if body is Bottle:
		drink_recieved.emit(body.current_drink)

