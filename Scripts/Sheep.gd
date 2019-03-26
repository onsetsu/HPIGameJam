extends Node2D

onready var Mensa = get_tree().get_root().get_node('Mensa')

var assigned_dish
var released = false

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
	$body.color = Color(1,0,0)

	if assigned_dish: 
		if assigned_dish == 5:
			$dish_node/assigned_dish.text = 'U'
		else: 
			$dish_node/assigned_dish.text = str(assigned_dish)
	else:
		$dish_node/assigned_dish.text = '?'
    
	if not released:
		interact()

func interact():
    if is_in_group('hovered'):
        $body.color = Color(0,0,1)
    if is_in_group('selected'):
        $body.color = Color(0,1,0)

    var hovered = is_hovered()
    var num_hovered = group_size("hovered")
    if hovered && (num_hovered == 0 || (num_hovered == 1) && is_in_group('hovered')):
        add_to_group('hovered')
    else:
        if is_in_group('hovered'):
            remove_from_group('hovered')
    
    if is_in_group('hovered') && Input.is_action_just_pressed('click'):
        clear_select()
        add_to_group('selected')
        select()
    
func select():
    Mensa.selected_sheep(self)

func clear_select():
    for sheep in get_tree().get_nodes_in_group('selected'):
        sheep.unselect()

func unselect():
    if is_in_group('selected'):
        remove_from_group('selected')
    Mensa.unselected_sheep(self)

func is_hovered():
    var mouse_pos = get_global_mouse_position()
    var pos = get_global_transform().xform(Vector2(0,0))
    return pos.distance_to(mouse_pos) <= 150

func end_reached():
    released = true
    remove_from_group('hovered')
    remove_from_group('selected')

    unselect()
    Mensa.check(self)

func success_anim():
    $graphic.play_success(self)
func failure_anim():
    $graphic.play_failure(self)
func __anim_finished__(unused):
    queue_free()

func assign_dish(dish):
    assigned_dish = dish._number