extends Area2D

var semente = 1
func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	$"../UI_layer/Semente_tomate".text = str("sementes de tomate: ",semente)

func _on_body_entered(body: Node2D) -> void:
	
	if semente <= 0:
		print("Sem sementes")
		return
	semente -= 1
	print(semente)
	show()
	$AnimatedSprite2D.frame = 0
	proccessPlantTomato()

func proccessPlantTomato() -> void:
	var timerP = 0.0
	for i in range(4):
		timerP += 3.0
		await get_tree().create_timer(timerP).timeout
		$AnimatedSprite2D.frame += 1
