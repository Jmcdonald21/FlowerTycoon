extends CharacterBody2D

@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		$Character/AnimationPlayer.play("WalkLeft")
	if Input.is_action_pressed("right"):
		$Character/AnimationPlayer.play("WalkRight")
	if Input.is_action_pressed("up"):
		$Character/AnimationPlayer.play("WalkUp")
	if Input.is_action_pressed("down"):
		$Character/AnimationPlayer.play("WalkDown")
	
	if !Input.is_anything_pressed():
		$Character/AnimationPlayer.stop()
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
