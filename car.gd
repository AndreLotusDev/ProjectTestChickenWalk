extends RigidBody2D


func _ready():
	var color_of_car = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = color_of_car[randi() % color_of_car.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
