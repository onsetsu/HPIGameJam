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
			print("Das Schaffell war " + str(fc) + ", es isst also keine " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Gluten":
		if fc==e_fc.blue and (pt==e_pt.stripes or pt==e_pt.dots) and (not hc==e_hc.pink):
			print("Das Schaffell war " + str(fc) + " und das Muster war " + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Rindfleisch":
		if fc==e_fc.green and (pt==e_pt.dots or pt==e_pt.stripes):
			print("Das Schaffell war " + str(fc) + " und das Muster war " + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Schweinefleisch":
		if fc==e_fc.blue and ((pt==e_pt.checkers and hc==e_hc.pink) or pt==e_hc.dots):
			print("Das Schaffell war " + str(fc) + " und das Muster war " + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Fisch":
		if hc==e_hc.black and fc==e_fc.orange:
			print("Das Schaffell war " + str(fc) + " und der Kopf war " + str(hc) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Milch":
		if fc==e_fc.green and (pt==e_pt.checkers or pt==e_pt.none):
			print("Das Schaffell war " + str(fc) + " und das Muster war " + str(pt) + ", es isst also keine " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Geflügel":
		if (not fc==e_fc.blue) and pt==e_pt.checkers:
			print("Das Schaffell war " + str(fc) + " und das Muster war " + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Rosenkohl":		
		if (not hc==e_hc.pink):
			print("Die Kopffarbe war " + str(hc) + ", es isst also keinen " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Curry":
		if pt==e_pt.dots and (not hc==e_hc.black):
			print("Das Muster war " + str(hc) + " und das Muster war " + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Ei":
		if (fc==e_fc.orange and hc==e_hc.black) or (pt==e_pt.stripes and hc==e_hc.white):
			print("Das Fell, Kopf, Muster: " + str(fc) + str(hc) + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Alkohol":
		if (not fc==e_fc.green) and (pt==e_pt.dots or pt==e_pt.stripes):
			print("Das Schaffell war " + str(fc) + " und das Muster war " + str(pt) + ", es isst also keinen " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Knoblauch":
		if hc==e_hc.pink and pt==e_pt.none:
			print("Die Kopffarbe war " + str(hc) + " und das Muster war " + str(pt) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Pilze":
		if fc==e_fc.blue and hc==e_hc.white:
			print("Das Schaffell war " + str(fc) + " und der Kopf war " + str(hc) + ", es isst also keine " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Senf":
		if pt==e_pt.stripes:
			print("Das Muster war " + str(pt) + ", es isst also keinen " + str(ingredient) + "!!!")
			return false
	elif ingredient == "Soja":
		if (not fc==e_fc.orange) and (not hc==e_hc.black):
			print("Das Schaffell war " + str(fc) + " und der Kopf war " + str(hc) + ", es isst also kein " + str(ingredient) + "!!!")
			return false
	else:
		print("ERROR! Zutat " + ingredient + " ist nicht definiert!")
		return null
	return true

