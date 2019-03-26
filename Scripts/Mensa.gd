extends Node2D

var happy_sheeps = 0
var sad_sheeps = 0
const lives = 3

var hungry_sheep
var ingredients_scene = preload("res://Scripts/Ingredients.gd") 

func _ready():
    setup_dishes()
    hide_details()

func setup_dishes():
    var all_dishes = $more_dishes.get_children().duplicate()
    all_dishes.shuffle()
    
    var selected_dishes = [false, false, false, false]
    for dish in all_dishes:
        if not selected_dishes[dish._number - 1]:
            selected_dishes[dish._number - 1] = dish
            print('selected a dish')
    
    var ulf = $dishes.get_children()[0]
    $dishes.remove_child(ulf)

    var offset = Vector2(0, 50)
    var i = 0  
    for dish in selected_dishes:
        dish.get_parent().remove_child(dish)
        $dishes.add_child(dish)
        dish.position = offset * i
        i += 1

    $dishes.add_child(ulf)

func _process(delta): 
	$points/happy_sheeps.text = str(happy_sheeps) + ' Happy Sheeps' 
	$points/sad_sheeps.text = str(sad_sheeps) + ' Sad Sheeps'
	if $end_point/Queue.is_empty():
		get_tree().change_scene("res://Scenes/Success_End.tscn")

# sheep events
# ------------------------------------------------------------------------

func clicked_on_sheep(sheep):
	selected_sheep(sheep)

func hovering_over_sheep(sheep):
	pass

# show details
# -------------------------------------------------------------------------
func show_details(sheep):
    $details.show()
    $details.display_sheep(sheep)

func hide_details():
    $details.hide()

func selected_sheep(sheep):
    hungry_sheep = sheep
    show_details(sheep)

func unselected_sheep(sheep):
    if hungry_sheep == sheep:
        hungry_sheep = null
        hide_details()

# assign dish
# -------------------------------------------------------------------------
func select_dish(dish):
    if not hungry_sheep:
        return
    hungry_sheep.assign_dish(dish)

# queue end
# -------------------------------------------------------------------------
func reparent_finished_person(person):
    var former_parent = person.get_parent()
    if former_parent:
        former_parent.remove_child(person)
    $end_point/finished.add_child(person)
    person.position = Vector2(0, 0)

# check suitability
# -------------------------------------------------------------------------
func current_dishes():
    return $dishes.get_children()

func check(sheep):
    var dishes = current_dishes()
    if not sheep.assigned_dish:
        return failure(sheep)
    _check(sheep, dishes[sheep.assigned_dish - 1], dishes)
    
func _check(sheep, dish, all_dishes):
	if dish._number == 5:    # Ulf selected: check if any other dish suitable 
		for d in all_dishes:
			if d._number != 5:  
				if _dish_suitable(sheep, d):    # if yes: fail check
					failure(sheep)
					return
	else:    # normal dish selected: check ingredients normally
		if not _dish_suitable(sheep, dish):
			failure(sheep)
			return
	success(sheep)

func _dish_suitable(sheep, dish):
	for ingredient in dish._ingredients:
		if not ingredients_scene.can_be_eaten(sheep, ingredient):
			return false
	return true

func success(sheep):
    happy_sheeps += 1
    sheep.success_anim()
    print('What a happy sheep!')

func failure(sheep):
	sad_sheeps += 1
	sheep.failure_anim()
	print('Oh no! Your sheep died.')
	if sad_sheeps >= lives:
		get_tree().change_scene("res://Scenes/Failure_End.tscn")
