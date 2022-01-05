extends Area2D

export var speed_player_2 = 100

var screen_size 

signal make_a_score_2

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("down_player_2"):
		velocity.y += 1
	if Input.is_action_pressed("up_player_2"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed_player_2
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.y > 0:
		$AnimatedSprite.animation = "baixo"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "cima"

func _on_Player2_body_entered(body):
	if body.name == "win_line":
		emit_signal("make_a_score_2")
	else:
		$CollisionSound.play()
		
	back()
	
func back():
	position.x = 944
	position.y = 696
