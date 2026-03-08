extends CharacterBody2D

var hp: int
var strength: int
var dexterity: int
var intelligence: int

@onready var current_speed: float = 0.0
@onready var current_evasion: float = 0.0

func _ready():
	setup_stats()

func setup_stats():
	var data = Global.CLASS_DATA[Global.selected_class]
	hp = data["hp"]
	strength = data["str"]
	dexterity = data["dex"]
	intelligence = data["int"]
	
	# 계산기 호출
	current_speed = CombatCalculator.calculate_movement_speed(dexterity)
	current_evasion = CombatCalculator.calculate_evasion(dexterity)
	
	print("클래스: ", Global.selected_class)
	print("이동속도: ", current_speed, " / 회피율: ", var_to_str(current_evasion * 100), "%")

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * current_speed
	move_and_slide()
