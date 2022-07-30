extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -250

var wall_slide_speed = 100
var wall_slide_gravity = 100 
var is_wall_sliding : bool = false 

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Idle")
	
	if not is_on_floor():
		$AnimatedSprite.play("Jump") 
	
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	if is_on_wall() and !is_on_floor():
		if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
			is_wall_sliding = true
		else:
			is_wall_sliding = false
	if (is_wall_sliding == true):
		velocity.y += (wall_slide_gravity * delta) 
		
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.1)
