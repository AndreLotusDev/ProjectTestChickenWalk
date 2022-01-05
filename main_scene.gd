extends Node

const new_car = preload("res://scenes/Car.tscn")

var slow_track_in_y = [600,544,438, 324,384,216,160]

var quick_track_in_y = [488,272,104]

var score_player_1 = 0
var score_player_2 = 0

func _ready():
	$main_theme.play()
	randomize()

func _on_timer_for_slow_car_timeout():
	var slow_car = new_car.instance()
	add_child(slow_car)
	slow_car.position.x = -10
	slow_car.position.y = slow_track_in_y[randi() % slow_track_in_y.size()]
	slow_car.linear_velocity = Vector2(rand_range(700, 710),0)

func _on_timer_for_quick_car_timeout():
	var fast_car = new_car.instance()
	add_child(fast_car)
	fast_car.position.x = -10
	fast_car.position.y = quick_track_in_y[randi() % quick_track_in_y.size()]
	fast_car.linear_velocity = Vector2(rand_range(300, 310),0)

func _on_Player_make_a_score():
	
	if score_player_1 < 10:
		score_player_1 += 1
		$point.play()
		$label_player_1.text = str(score_player_1)
		
	if score_player_1 >= 10:
		$main_theme.stop()
		$label_generic.text = "player 1 win!"
		$win.play()
		$restart_game.show()
		$timer_for_quick_car.stop()
		$timer_for_slow_car.stop()

func _on_Player2_make_a_score_2():
	
	if score_player_2 < 10:
		score_player_2 += 1
		$point.play()
		$label_player_2.text = str(score_player_2)
		
	if score_player_2 >= 10:
		$main_theme.stop()
		$label_generic.text = "player 2 win!"
		$win.play()
		$restart_game.show()
		$timer_for_quick_car.stop()
		$timer_for_slow_car.stop()

func _on_restart_game_pressed():
	$restart_game.hide()
	score_player_1 = 0
	score_player_2 = 0
	$label_player_1.text = "0"
	$label_player_2.text = "0"
	$label_generic.text = ""
	$timer_for_quick_car.start()
	$timer_for_slow_car.start()
	$Player.back()
	$Player2.back()
	$main_theme.play()
	
