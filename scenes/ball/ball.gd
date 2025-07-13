class_name Ball
extends CharacterBody2D

const START_SPEED : int = 500
const ACCELERATION : int = 50

const MAX_BOUNCE_FROM_RACKET : float = 0.6
var window_size : Vector2
var speed : int
var direction : Vector2


func _ready():
	window_size = get_viewport_rect().size


func new_ball():
	position.x = window_size.x / 2
	position.y = randi_range(200, window_size.y - 200)
	speed = START_SPEED
	direction = random_direction()


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		var collider = collision.get_collider()
		
		if collider is Racket:
			speed += ACCELERATION
			direction = bounce_from_racket(collider)
		elif collider.get("name") == "Ricochet":
			direction = direction.bounce(collision.get_normal())


func random_direction():
	var new_direction := Vector2()
	new_direction.x = [1,-1].pick_random()
	new_direction.y = randf_range(1,-1)
	return new_direction.normalized() 
	
	
func bounce_from_racket(collider: Racket):
	var ball_y = position.y
	var racket_y = collider.position.y
	var distance = ball_y - racket_y
	var new_direction := Vector2()
	
	new_direction.x = -1 if direction.x > 0 else 1
	new_direction.y = (distance / (collider.racket_height / 2)) * MAX_BOUNCE_FROM_RACKET
	return new_direction.normalized()
