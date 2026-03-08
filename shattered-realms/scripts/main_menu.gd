extends Control

@onready var start_button = $VBoxContainer/NewGameButton

func _ready():
	start_button.pressed.connect(_on_new_game_button_pressed)
	
func _on_new_game_button_pressed():
	print(">>> 뉴 게임 버튼 클릭됨! 캐릭터 선택창으로 이동합니다 <<<") 
	get_tree().change_scene_to_file("res://scenes/character_selection.tscn")
