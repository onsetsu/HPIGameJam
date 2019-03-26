extends Node

var sheep_scene = preload("res://Scenes/Sheep.tscn")

func _ready():
	var sh = sheep_scene.instance()
	sh.fur_color = sh.FUR_COLOR.blue
	_can_be_eaten(sh, "Erdnüsse")
	

func _can_be_eaten(sheep, ingredient):
	if ingredient == "Erdnüsse":
		if sheep.fur_color == sheep.FUR_COLOR.blue:
			return false
	else if ingredient == "Gluten":
		if sheep.fur_color = sheep.FUR_COLOR.blue and 
	else:
		return true

