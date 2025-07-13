class_name CpuRacketControl
extends RacketControl


func handle(racket_position: Vector2, ball_position: Vector2, racket_speed: int, delta) -> Vector2:
	var distance = racket_position.y - ball_position.y
	var move_by : int = distance
	var movement = racket_speed * delta
	
	if abs(distance) > movement:
		move_by = movement * (distance / abs(distance))
		
	racket_position.y -= move_by
	
	return racket_position
