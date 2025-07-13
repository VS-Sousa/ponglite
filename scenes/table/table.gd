extends Sprite2D

var scores := [0,0]
var ball : Ball
var leftRacket : Racket
var rightRacket : Racket

func _ready() -> void:
	ball = $Ball
	leftRacket = $LeftPlayer
	rightRacket = $RightPlayer
	
	leftRacket.start(1)
	rightRacket.start(0)
	ball.new_ball()


func _on_ball_timer_timeout() -> void:
	ball.new_ball()


func _on_left_score_body_entered(body: Node2D) -> void:
	scores[1] += 1
	$HUD/RightScore.text = str(scores[1])
	$BallTimer.start()


func _on_right_score_body_entered(body: Node2D) -> void:
	scores[0] += 1
	$HUD/LeftScore.text = str(scores[0])
	$BallTimer.start()
