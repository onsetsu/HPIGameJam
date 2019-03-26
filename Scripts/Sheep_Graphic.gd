extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func display(sheep):
    # FUR
    if sheep.fur_color != sheep.FUR_COLOR.green:
        $fur/green.hide()
    else:
        $fur/green.show()
    if sheep.fur_color != sheep.FUR_COLOR.blue:
        $fur/blue.hide()
    else:
        $fur/blue.show()
    if sheep.fur_color != sheep.FUR_COLOR.orange:
        $fur/orange.hide()
    else:
        $fur/orange.show()

    # HEAD
    if sheep.head_color != sheep.HEAD_COLOR.white:
        $head/white.hide()
    else:
        $head/white.show()
    if sheep.head_color != sheep.HEAD_COLOR.black:
        $head/black.hide()
    else:
        $head/black.show()
    if sheep.head_color != sheep.HEAD_COLOR.pink:
        $head/pink.hide()
    else:
        $head/pink.show()

    # PATTERN
    if sheep.pattern_type != sheep.PATTERN.checkers:
        $pattern/checkers.hide()
    else:
        $pattern/checkers.show()
    if sheep.pattern_type != sheep.PATTERN.dots:
        $pattern/dots.hide()
    else:
        $pattern/dots.show()
    if sheep.pattern_type != sheep.PATTERN.stripes:
        $pattern/stripes.hide()
    else:
        $pattern/stripes.show()
    if sheep.pattern_type != sheep.PATTERN.none:
        $pattern/none.hide()
    else:
        $pattern/none.show()
