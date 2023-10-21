extends Node

var all_drink_types: Array[String]
var all_base_drinks: Array[String]
var all_orderable_drinks: Array[String]
var all_mixed_drinks: Array[String]

func _ready():
	all_drink_types.append_array(StaticData.drink_data.keys())
	for drink in StaticData.drink_data:
		var current_drink_dict = StaticData.drink_data.get(drink)
		if current_drink_dict.get("mixed") == false:
			all_base_drinks.append(drink)
		if current_drink_dict.get("can_order"):
			all_orderable_drinks.append(drink)

func get_all_drinks() -> Array[String]:
	return all_drink_types
	
func get_all_base_drinks() -> Array[String]:
	return all_base_drinks
	
func get_all_orderable_drinks() -> Array[String]:
	return all_orderable_drinks
	
func generate_drink_sprite(drink: String) -> Texture2D:
	var path = "res://aseprite/drinks/%s.aseprite"
	var texture = load(path % drink)
	return texture
