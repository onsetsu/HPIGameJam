extends Node2D

var hungry_sheep
var ingredients_scene = preload("res://Scripts/Ingredients.gd") 

func _ready():
    hide_details()

func _process(delta):
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
	for ingredient in dish._ingredients:
		if not ingredients_scene.can_be_eaten(sheep, ingredient):
			failure(sheep)
			return
	success(sheep)

func success(sheep):
    print('What a happy sheep!')

func failure(sheep):
    print('Oh no! Your sheep died.')
