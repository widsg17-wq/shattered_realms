extends Node
class_name CombatCalculator

# 1. 이동 속도 계산: 기본값을 높여 초반 격차를 줄임
# Warrior(10): 200 + 11.4 = 211
# Ranger(15): 200 + 13.9 = 213
# 시작 시점 차이를 1% 내외로 평준화
static func calculate_movement_speed(dex: int) -> float:
	var base_speed = 200.0
	var scaling_factor = 5.0 # 영향력을 낮춰서 초반 평준화 유도
	return base_speed + (log(1 + dex) * scaling_factor)

# 2. 회피율 계산: 0.8로 수렴하는 Soft Cap 공식
# 공식: 0.8 * (1 - e^(-k * dex))
# dex가 0이면 0, dex가 커질수록 0.8에 근접함
static func calculate_evasion(dex: int) -> float:
	var max_evasion = 0.8
	var k = 0.05 # 이 값이 클수록 0.8에 빨리 도달함
	return max_evasion * (1.0 - exp(-k * float(dex)))
