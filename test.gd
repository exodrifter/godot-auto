extends Node2D

var foobar = Auto.new(1, LinearTransition.new(0.5))

func _process(delta):
	foobar._process(delta)
	print(foobar.current_value)
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		foobar.desired_value += 1
	if event.is_action_pressed("ui_cancel"):
		foobar.desired_value -= 1
