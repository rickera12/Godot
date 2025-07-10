extends CharacterBody2D

var speed = 100
var player_state = "idle"
var last_direction = Vector2.DOWN  # Default direction

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")

	if direction != Vector2.ZERO: 
		player_state = "walking"
		last_direction = direction  # Remember direction only when moving
	else:
		player_state = "idle"

	velocity = direction * speed
	move_and_slide()
	play_anim()

func play_anim():
	var dir = last_direction.normalized()

	if player_state == "idle":
		if dir.y == -1:
			$AnimatedSprite2D.play("idle_up")
		elif dir.y == 1:
			$AnimatedSprite2D.play("idle_down")
		elif dir.x == -1:
			$AnimatedSprite2D.play("idle_left")
		elif dir.x == 1:
			$AnimatedSprite2D.play("idle_right")
		elif dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("idle_upright")
		elif dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("idle_downright")
		elif dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("idle_downleft")
		elif dir.x < -0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("idle_upleft")

	elif player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("walk_up")
		elif dir.y == 1:
			$AnimatedSprite2D.play("walk_down")
		elif dir.x == -1:
			$AnimatedSprite2D.play("walk_left")
		elif dir.x == 1:
			$AnimatedSprite2D.play("walk_right")
		elif dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("walk_upright")
		elif dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("walk_downright")
		elif dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("walk_downleft")
		elif dir.x < -0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("walk_upleft")

func player():
	pass
