extends Node2D

func load_from_file(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	return content
	
func load_json(path: String):
	#print(load_from_file("res://data/player data/playerchartemplatetest.json"))
	var json = JSON.new()
	var error = json.parse(load_from_file(path))
	if error == OK:
		print("successfully parsed json at",path)
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", path, " at line ", json.get_error_line())
	return json.data

func get_stats(chardat: Dictionary):
	return chardat["stats"]
	
func calc_ability_modifiers(chardat: Dictionary):
	var stats = get_stats(chardat)
	var bonuses = {}
	bonuses["strength"] = int(stats["strength"]/2) - 5
	bonuses["dexterity"] = int(stats["dexterity"]/2) - 5
	bonuses["constitution"] = int(stats["constitution"]/2) - 5
	bonuses["intelligence"] = int(stats["intelligence"]/2) - 5
	bonuses["wisdom"] = int(stats["wisdom"]/2) - 5
	bonuses["charisma"] = int(stats["charisma"]/2) - 5
	return bonuses

func roll_single_dice(lb: int, ub:int): #upper and lower bounds, inclusive
	return randi()%(ub-lb+1) + lb

#common dice macros
func d20():
	return roll_single_dice(1,20)
func d12():
	return roll_single_dice(1,12)
func d10():
	return roll_single_dice(1,10)
func d6():
	return roll_single_dice(1,6)
func d4():
	return roll_single_dice(1,4)
func d3():
	return roll_single_dice(1,3)

func roll_multiple_dice(dicestr: String):
	return 0

func _ready() -> void:
	randomize() # init randomizer
	#print(load_from_file("res://data/player data/playerchartemplatetest.json"))
	var chardat = load_json("res://data/player data/playerchartemplatetest.json")
	print(get_stats(chardat))
	var abm = calc_ability_modifiers(chardat)
	print(abm)
	print(d3())
	
