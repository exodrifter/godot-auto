# Transition by a fixed number of units per second. This will result in linear
# movement.
class_name LinearTransition

var speed: float

func _init(speed: float):
	self.speed = speed

func automate(current_value: float, desired_value: float, delta: float):
	if current_value < desired_value:
		var new_value = current_value + speed * delta
		return clamp(new_value, current_value, desired_value)

	elif current_value > desired_value:
		var new_value = current_value - speed * delta
		return clamp(new_value, desired_value, current_value)

	return desired_value
