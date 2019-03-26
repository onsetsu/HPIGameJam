extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func display(sheep):
    # FUR
    if sheep.fur_color != sheep.FUR_COLOR.green:
        $body/fur/green.hide()
    else:
        $body/fur/green.show()
    if sheep.fur_color != sheep.FUR_COLOR.blue:
        $body/fur/blue.hide()
    else:
        $body/fur/blue.show()
    if sheep.fur_color != sheep.FUR_COLOR.orange:
        $body/fur/orange.hide()
    else:
        $body/fur/orange.show()

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
        $body/pattern/checkers.hide()
    else:
        $body/pattern/checkers.show()
    if sheep.pattern_type != sheep.PATTERN.dots:
        $body/pattern/dots.hide()
    else:
        $body/pattern/dots.show()
    if sheep.pattern_type != sheep.PATTERN.stripes:
        $body/pattern/stripes.hide()
    else:
        $body/pattern/stripes.show()
    if sheep.pattern_type != sheep.PATTERN.none:
        $body/pattern/none.hide()
    else:
        $body/pattern/none.show()

func play_success(sheep):
    $anim_player.play("success")
    $anim_player.connect("animation_finished", sheep, "__anim_finished__")

func play_failure(sheep):
    $anim_player.play("failure")
    $anim_player.connect("animation_finished", sheep, "__anim_finished__")
