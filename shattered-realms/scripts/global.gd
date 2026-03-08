extends Node

# 선택된 클래스를 저장 (게임 전반에서 참조)
var selected_class: String = "Warrior"

# 클래스별 초기 스탯 정의
const CLASS_DATA = {
	"Warrior": {
		"hp": 100,
		"str": 15,
		"dex": 10,
		"int": 5,
		"description": "높은 체력과 강력한 근접 공격"
	},
	"Ranger": {
		"hp": 100,
		"str": 8,
		"dex": 15,
		"int": 7,
		"description": "빠른 속도와 치명적인 원거리 공격"
	},
	"Wizard": {
		"hp": 100,
		"str": 5,
		"dex": 5,
		"int": 20,
		"description": "강력한 마법과 광역 데미지"
	}
}

# 파라미터 이름을 class_name 에서 chosen_class 로 변경했습니다!
func set_class(chosen_class: String):
	if CLASS_DATA.has(chosen_class):
		selected_class = chosen_class
		print("클래스 선택 완료: ", selected_class)
