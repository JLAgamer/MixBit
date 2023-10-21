extends Node2D

@onready var player: Player = get_node("/root/Game/Player")

func interact():
	$CanvasLayer.visible = !$CanvasLayer.visible
	player.can_move = !player.can_move

func _on_mixer_ui_button_pressed(drink: String):
	print(drink)
	interact()
	if not player.get_held_item() is Bottle:
		return
	var held_bottle: Bottle =  player.get_held_item()
	held_bottle.mix(drink)
