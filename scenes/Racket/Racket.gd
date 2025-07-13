class_name Racket
extends StaticBody2D

const RACKET_SPEED : int = 500

var window_height : int
var racket_height : int
var control_strategy : RacketControl


func start(player: int):
	
	if player > 0:
		control_strategy = PlayerRacketControl.new()
	else:
		control_strategy = CpuRacketControl.new()


func _ready() -> void:
	window_height = get_viewport_rect().size.y
	racket_height = $ColorRect.get_size().y


func _process(delta: float) -> void:
	var new_position = control_strategy.handle(position, get_parent().ball.position, RACKET_SPEED, delta)
	
	position.y = clamp(new_position.y, racket_height / 2, window_height - racket_height / 2)
