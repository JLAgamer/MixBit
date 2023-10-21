extends Node

var drink_data:= {}
var mix_data:= {}

var drink_data_path = "res://data/DrinkData.json"
var mix_data_path = "res://data/MixData.json"

func _init():
	drink_data = import_json_file(drink_data_path)
	mix_data = import_json_file(mix_data_path)
	
func import_json_file(filePath: String):
	if FileAccess.file_exists(filePath):
		var data_file = FileAccess.open(filePath,FileAccess.READ)
		var parsed_result = JSON.parse_string(data_file.get_as_text())
		if parsed_result is Dictionary:
			return parsed_result
		else:
			print("Error reading " + filePath)
	else:
		print(filePath + " does not exist")
