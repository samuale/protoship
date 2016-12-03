extends KinematicBody2D

# This is a simple collision demo showing how
# the kinematic controller works.
# move() will allow to move the node, and will
# always move it to a non-colliding spot, 
# as long as it starts from a non-colliding spot too.

# variables de mover
const MOTION_SPEED = 350 # Pixels/seconds


var puntodisparo

#---------Variable trigger----------
var pre_shot=false 
var bullet = preload("res://player/disparo1/disparin1.tscn")
#var pp = null
var dir = Vector2(0, -1)

func _ready():
	set_fixed_process(true)
	#pp = get_node("puntodisparo")
	
	
func _fixed_process(delta):
	
	var positionplayer = get_node(".").get_pos()
	Globals.set("posplayer",positionplayer)
	 
	
	var motion = Vector2()
	
	if (Input.is_action_pressed("move_up")):
		motion += Vector2(0, -1)
	if (Input.is_action_pressed("move_down")):
		motion += Vector2(0, 1)
	if (Input.is_action_pressed("move_left")):
		motion += Vector2(-1, 0)
	if (Input.is_action_pressed("move_right")):
		motion += Vector2(1, 0)
	
	motion = motion.normalized()*MOTION_SPEED*delta
	motion = move(motion)
	
	# Make character slide nicely through the world
	var slide_attempts = 4
	while(is_colliding() and slide_attempts > 0):
		motion = get_collision_normal().slide(motion)
		motion = move(motion)
		slide_attempts -= 1
		
	#--------shooting up-----------------------
	#var puntodisparop1 = get_node("puntodisparo").get_pos()
	
	
	var shot = Input.is_action_pressed("shot")

	if (shot and not pre_shot):
		var pp = get_node("puntodisparo")
		var new_bullet = bullet.instance()
		get_parent().add_child(new_bullet)
		new_bullet.set_global_pos(pp.get_global_pos())
		
		# --------- bullet movement ------------
		new_bullet.dir = (Vector2(0,0) - pp.get_global_pos()).normalized()
	
	# -------- player rotates and looks broken at the course of the mouse------------
	var mouse_pos = get_global_mouse_pos()
	#var posbullet= get_node(".").get_pos()
	var sprite = get_node(".")
	sprite.look_at(mouse_pos)
	
	
	
