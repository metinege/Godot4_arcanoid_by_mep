extends RigidBody2D

@onready var paddle = %Paddle
@onready var level_one = $".."
@onready var block_break_sfx = $block_break_sfx
@onready var paddle_bounce_sfx = $paddle_bounce_sfx

@export var speed = 0
var direction : Vector2 = Vector2(0.1,-1)#(randf_range(-100,100), -1)

func _physics_process(delta):
		var velocity = direction.normalized() * speed * delta
		var collision = move_and_collide(velocity)
		
		if collision:
			var collider = collision.get_collider()
			var normal = collision.get_normal()
			direction = direction.bounce(normal)
			if collider.is_in_group("paddle"):
				paddle_bounce_sfx.play()
				if paddle.direction * velocity.x < 0:
					if direction.x > 0:
						direction = Vector2(randf_range(-1, -0.1), -1)
					elif direction.x < 0:
						direction = Vector2(randf_range(1, 0.1), -1)
			elif collider.is_in_group("blocks"):
				block_break_sfx.play()
				collider.queue_free()
				level_one.block_count -= 1
