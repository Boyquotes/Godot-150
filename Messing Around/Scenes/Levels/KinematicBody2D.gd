extends KinematicBody2D

export (float) var gravity := 3000.0
export (int) var walk_speed = 1
export (int) var jump_speed = 2000

var velocity := Vector2.ZERO

func get_input():
	pass
	
func _physics_process(delta):
	get_input()
	velocity.y = gravity * delta
	move_and_slide(velocity)
	print(velocity.x)


