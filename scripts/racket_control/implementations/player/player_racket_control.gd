class_name PlayerRacketControl
extends RacketControl


func handle(racket_position: Vector2, ball_position: Vector2, racket_speed: int, delta) -> Vector2:
	if Input.is_action_pressed("ui_up"):
		racket_position.y -= racket_speed * delta
	elif Input.is_action_pressed("ui_down"):
		racket_position.y += racket_speed * delta
	
	return racket_position
