extends Node2D

export var _name = ''
export var _ingredients = []
export var _number = 0

func _init(name=null, ingredients = [], number = 0):
	_name = name
	_ingredients = ingredients
	_number = number

# Called when the node enters the scene tree for the first time.
func _ready():	
	pass # Replace with function body.

func _process(delta):
    $button.text = 'Essen ' + str(_number) + ': ' + _name
