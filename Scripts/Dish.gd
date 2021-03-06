extends Node2D

export var _name = ''
export var _ingredients = []
export var _number = 0

onready var Mensa = get_tree().get_root().get_node('Mensa')

func _init(name=null, ingredients = [], number = 0):
	_name = name
	_ingredients = ingredients
	_number = number

# Called when the node enters the scene tree for the first time.
func _ready():	
	if _number == 5: 
		$ingredients.hide()

func _process(delta):
	if _number == 5: 
		$button.text = _name 
	else:
		$button.text = 'Essen ' + str(_number) + ': ' + _name

func _on_button_pressed():
    Mensa.select_dish(self)

func print_ingredients():
	
	for ingredient in _ingredients:
		var l = Label.new()
		l.text = ingredient
		$ingredients/VBoxContainer.add_child(l)
	