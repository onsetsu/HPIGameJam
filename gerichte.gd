enum INGREDIENTS{
Erdnuesse,
Gluten,
Rindfleisch,
Schweinefleisch,
Fisch,
Milch,
Gefluegel,
Rosenkohl,
Curry,
Ei,
Alkohol,
Knoblauch,
Pilze,
Senf,	
Soja
}

class Meal:
	var _name
	var _ingredients
	var _number
	
	func _init(name=null, ingredients = [], number = 0):
		_name = name
		_ingredients = ingredients
		_number = number

# Called when the node enters the scene tree for the first time.
func _ready():
	var meals = []
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
