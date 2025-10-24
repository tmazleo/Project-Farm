extends Area2D

var plantar = true
var emTerra = false

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	initializePlanting()
func _on_body_entered(body: Node2D) -> void:
	emTerra = true
func proccessPlantTomato() -> void:
	plantar = false
	$AnimatedSprite2D.frame = 0
	Data.sementes -= 1
	var timerP = 0.0
	for i in range(4):
		timerP += 3.0
		await get_tree().create_timer(timerP).timeout
		$AnimatedSprite2D.frame += 1
	if $AnimatedSprite2D.frame == 4:
		plantar = true

func initializePlanting() -> void:
	if !emTerra:
		return
	if Input.is_action_just_released("ui_accept"):
		if Data.sementes <= 0:
			print("Sem sementes")
			return
		if plantar == true:
			show()
			proccessPlantTomato()
