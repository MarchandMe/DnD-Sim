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
	

func _ready() -> void:
	#print(load_from_file("res://data/player data/playerchartemplatetest.json"))
	var chardat = load_json("res://data/player data/playerchartemplatetest.json")
	print(get_stats(chardat))
