extends CollisionShape2D

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
