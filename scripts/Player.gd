extends CharacterBody2D



const FRICTION_FACTOR = 0.89
var MOTION_SPEED = 30 # Pixels/second.
var time_attack = false

func _ready():
	$sword/SpriteAnim.visible = false
	
func _physics_process(_delta):
	var motion = Input.get_vector('ui_left', 'ui_right','ui_up',"ui_down")
	# Make diagonal movement fit isometric tiles.
	motion.y /= 2
	velocity += motion.normalized() * MOTION_SPEED
	# Apply friction.
	velocity *= FRICTION_FACTOR
	if Input.is_action_pressed("attack") and time_attack == false:
		$sword.look_at(get_global_mouse_position())
		$sword/AnimationPlayer.play("Attack")
		time_attack = true
		MOTION_SPEED = 10
	move_and_slide()

func _on_animation_player_animation_finished(anim_name):
	MOTION_SPEED = 30
	time_attack = false
