@tool
extends AnimatedSprite2D

var eyebrow_colors: Array[Color]

func _ready():
	setup_colors()
	set_material(material.duplicate())
	material.set_shader_parameter("shirt_color", random_color())
	material.set_shader_parameter("eyebrows_color", random_eyebrow_color_weighted())
	

func setup_colors():
	eyebrow_colors.append(Color.BLACK)
	eyebrow_colors.append(Color.SADDLE_BROWN)
	eyebrow_colors.append(Color.GAINSBORO)
	eyebrow_colors.append(Color.GOLDENROD)
	eyebrow_colors.append(Color.FIREBRICK)
	
func random_color() -> Color:
	var color = Color(randf(),randf(),randf())
	return color

func random_eyebrow_color_weighted() -> Color:
	var i = randi_range(1,100)
	if i <= 50:
		return Color.BLACK
	elif i <= 80:
		return Color.SADDLE_BROWN
	elif i > 80 and i < 90:
		return Color.GAINSBORO
	else:
		return Color.FIREBRICK
