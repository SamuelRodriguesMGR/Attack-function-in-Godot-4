extends CharacterBody2D

@export var speed = 50
@onready var navigation_agent_2d = $NavigationAgent2D
@onready var player = $"../Player"

func _physics_process(delta: float) -> void:
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	
func follow():
	navigation_agent_2d.target_position = player.global_position
	


func _on_timer_timeout():
	follow()
