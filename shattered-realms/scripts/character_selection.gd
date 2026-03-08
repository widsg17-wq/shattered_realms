extends Control

# 1. UI 노드 변수 연결
@onready var warrior_btn = $MainLayout/Content/CardContainer/WarriorCard/Button
@onready var ranger_btn = $MainLayout/Content/CardContainer/RangerCard/Button
@onready var wizard_btn = $MainLayout/Content/CardContainer/WizardCard/Button

func _ready():
	# 2. 버튼 클릭 신호 연결
	warrior_btn.pressed.connect(_on_warrior_button_pressed)
	ranger_btn.pressed.connect(_on_ranger_button_pressed)
	wizard_btn.pressed.connect(_on_wizard_button_pressed)
	
	# (참고: pivot_offset 설정은 이제 animated_button.gd에서 알아서 하므로 여기서 지웠습니다!)

# --- 각 버튼을 눌렀을 때 실행될 함수들 ---
func _on_warrior_button_pressed():
	select_character("Warrior")

func _on_ranger_button_pressed():
	select_character("Ranger")

func _on_wizard_button_pressed():
	select_character("Wizard")

# --- 공통 실행 로직 (직업 저장) ---
func select_character(chosen_class: String):
	# Global 스크립트에 선택한 직업 저장
	Global.set_class(chosen_class)
	print(">>> 영웅 선택 완료! 직업: ", chosen_class, " <<<")
	
	# TODO: 여기에 실제 게임 씬(Level 1)으로 넘어가는 코드를 작성할 예정!
