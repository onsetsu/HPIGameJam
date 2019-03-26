extends Node

var sheep_scene = preload("res://Scenes/Sheep.tscn")

func _ready():
	pass
	

static func can_be_eaten(sheep, ingredient):
	var fc = sheep.fur_color
	var e_fc = sheep.FUR_COLOR
	var pt = sheep.pattern_type
	var e_pt = sheep.PATTERN
	var hc = sheep.head_color
	var e_hc = sheep.HEAD_COLOR
	if ingredient == "Erdnüsse":
		if fc==e_fc.blue:
			return false
	elif ingredient == "Gluten":
		if fc==e_fc.blue and (pt==e_pt.stripes or pt==e_pt.dots) and (not hc==e_hc.pink):
			return false
	elif ingredient == "Rindfleisch":
		if fc==e_fc.green and (pt==e_pt.dots or pt==e_pt.stripes):
			return false
	elif ingredient == "Schweinefleisch":
		if fc==e_fc.blue and ((pt==e_pt.checkers and hc==e_hc.pink) or pt==e_hc.dots):
			return false
	elif ingredient == "Fisch":
		if hc==e_hc.black and fc==e_fc.orange:
			return false
	elif ingredient == "Milch":
		if fc==e_fc.green and (pt==e_pt.checkers or pt==e_pt.none):
			return false
	elif ingredient == "Geflügel":
		if (not fc==e_fc.blue) and pt==e_pt.checkers:
			return false
	elif ingredient == "Rosenkohl":
		if (not hc==e_hc.pink):
			return false
	return true

