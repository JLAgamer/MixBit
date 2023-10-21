extends Control

signal button_pressed

func _ready():
	for drink in DrinkManager.get_all_base_drinks():
		var button: Button = Button.new()
		button.text = StaticData.drink_data[drink]["display_name"]
		button.icon = DrinkManager.generate_drink_sprite(drink)
		button.pressed.connect(_on_button_pressed.bind(drink))
		$GridContainer.add_child(button)
		
func _on_button_pressed(drink: String):
	button_pressed.emit(drink)

