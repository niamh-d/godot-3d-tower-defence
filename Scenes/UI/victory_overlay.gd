extends CanvasLayer

@onready var star_1: TextureRect = %Star1
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3
@onready var survived_label: Label = %SurvivedLabel
@onready var full_health_label: Label = %FullHealthLabel
@onready var gold_label: Label = %GoldLabel
@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")

func victory() -> void:
	visible = true
	if base.is_unscathed():
		star_2.modulate = Color.WHITE
		full_health_label.visible = true
	if bank.gold >= 500:
		star_3.modulate = Color.WHITE
		gold_label.visible = true

func _on_retry_btn_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_btn_pressed() -> void:
	get_tree().quit()
