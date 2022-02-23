# Transition by a fixed percent per second. This will result in movement which
# slows down as the current and desired values get closer together.
class_name PercentTransition

var percent: float

func _init(percent: float):
	self.percent = percent

func automate(current_value: float, desired_value: float, delta: float) -> float:
	if current_value < desired_value:
		var change = (desired_value - current_value) * percent * delta
		return clamp(current_value + change, current_value, desired_value)

	elif current_value > desired_value:
		var change = (current_value - desired_value) * percent * delta
		return clamp(current_value - change, desired_value, current_value)

	return desired_value
