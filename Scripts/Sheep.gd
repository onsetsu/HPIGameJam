extends Node2D

onready var Mensa = get_tree().get_root().get_node('Mensa')

var assigned_dish

enum FUR_COLOR{
	green,
	blue,
	orange
}
var fur_color = FUR_COLOR.green

enum PATTERN{
	checkers,
	dots,
	stripes,
	none
}
var pattern_type

enum HEAD_COLOR{
	black,
	white,
	pink
}
var head_color

func _ready():
    pass

func randomize_appearance():
    var fur = FUR_COLOR.values()
    fur.shuffle()
    var head = HEAD_COLOR.values()
    head.shuffle()
    var pattern = PATTERN.values()
    pattern.shuffle()
    set_appearance(head[0], fur[0], pattern[0])

func set_appearance(head, fur, pattern):
    print()

    head_color = head
    fur_color = fur
    pattern_type = pattern
    
    $graphic.display(self)

func group_size(name):
    return get_tree().get_nodes_in_group(name).size()

func _process(delta):
	if assigned_dish: 
		if assigned_dish == 5:
			$dish_node/assigned_dish.text = 'U'
		else: 
			$dish_node/assigned_dish.text = str(assigned_dish)
	else:
		$dish_node/assigned_dish.text = '?'

func end_reached():
    Mensa.check(self)

func success_anim():
    $graphic.play_success(self)
func failure_anim():
    $graphic.play_failure(self)
func __anim_finished__(unused):
    queue_free()

func assign_dish(dish):
    assigned_dish = dish._number
