extends Node2D

@onready var ball = %Ball
@onready var paddle = %Paddle
@onready var timer = $Killzone/Timer

var ball_attached = true
var block_count = 6

func _physics_process(delta):
	if ball_attached:
		ball.global_position.x = paddle.global_position.x
	if block_count == 0:
		get_tree().change_scene_to_file("res://Scenes/demo_end.tscn")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		ball_attached = false
		ball.speed = 450

func _on_killzone_body_entered(body):
	body.queue_free()
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

