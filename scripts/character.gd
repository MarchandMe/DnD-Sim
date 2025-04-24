extends Node2D


@onready var grid = $AbilityContainer
@onready var value = $AmountContainer
var chardat = Global.load_json(Global.curchar)
var ability_names = ["Str", "Dex", "Con", "Int", "Wis", "Cha"]
var ability_scores = Global.get_stats(chardat).values()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid.columns = 1
	grid.add_theme_constant_override("h_separation",10)
	grid.add_theme_constant_override("v_separation",16)
	value.columns = 1
	value.add_theme_constant_override("h_separation",10)
	value.add_theme_constant_override("v_separation",7)
	generate_grid_item()
	generate_value_item()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_go_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func generate_value_item():
	for child in value.get_children():
		child.queue_free()
	for i in range(6):
		var item = LineEdit.new()
		item.add_theme_color_override("font_color",Color("black"))
		item.add_theme_stylebox_override("normal",StyleBoxFlat.new())
		item.get_theme_stylebox("normal").bg_color = Color.TRANSPARENT
		item.text = str(int(ability_scores[i]))
		value.add_child(item)

func generate_grid_item():
	for child in grid.get_children():
		child.queue_free()
	for i in range(6):
		var item = Label.new()
		item.add_theme_color_override("font_color",Color("CC6600"))
		item.add_theme_font_size_override("font_size",16)
		item.text = ability_names[i]
		grid.add_child(item)
	
	
	
