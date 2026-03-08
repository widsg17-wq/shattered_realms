extends Button

var base_font_size: int

func _ready():
	# 게임이 시작될 때 원래 설정된 폰트 크기를 기억해 둡니다.
	base_font_size = get_theme_font_size("font_size")
	
	# (안전장치) 혹시 테마 폰트 크기를 못 불러오면 24로 고정합니다.
	if base_font_size <= 0:
		base_font_size = 24

	mouse_entered.connect(_on_hover)
	mouse_exited.connect(_on_normal)
	button_down.connect(_on_down)
	button_up.connect(_on_up)

func _on_hover():
	var tween = create_tween()
	# Scale 대신 폰트 사이즈 자체를 1.2배로 키웁니다!
	tween.tween_property(self, "theme_override_font_sizes/font_size", int(base_font_size * 1.2), 0.1)

func _on_normal():
	var tween = create_tween()
	# 마우스가 나가면 원래 폰트 사이즈로 스르륵 복구
	tween.tween_property(self, "theme_override_font_sizes/font_size", base_font_size, 0.1)

func _on_down():
	var tween = create_tween()
	# 클릭하는 순간 글씨가 찌그러지듯 살짝 작아짐
	tween.tween_property(self, "theme_override_font_sizes/font_size", int(base_font_size * 0.95), 0.05)

func _on_up():
	var tween = create_tween()
	# 클릭을 떼면 다시 호버 상태 크기로 복구
	tween.tween_property(self, "theme_override_font_sizes/font_size", int(base_font_size * 1.2), 0.05)
