# An auto is responsible for changing a value to some desired one autonomously.
# Given a desired value, it changes its current value to match based on the
# requested transition behaviour. This design, unlike tweens, focuses on
# providing a consistent state which cannot be represented in an invalid way.
class_name Auto

# The current value of the auto.
var current_value: float

# The desired value of the auto.
var desired_value: float

# Defines how to transition from the current value to the desired value.
var automater

func _init(initial_value: float, transition: Object):
	assert(transition.has_method("automate"))
	self.current_value = initial_value
	self.desired_value = initial_value
	self.automater = transition

func _process(delta: float) -> void:
	current_value = automater.automate(current_value, desired_value, delta)
