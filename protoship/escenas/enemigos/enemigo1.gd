extends KinematicBody2D
var distance_to_player = 200
var playernode = preload("res://escenas/player1.tscn")
var pA = Vector2()
var Pb = Vector2()
var direccion = Vector2()
var distancia =[]


func _ready():
	var root = get_tree().get_root()
	set_process(true)
	set_fixed_process(true)
	

func _fixed_process(delta):
	#---------variables globales----------------
	#var nodoenemigo = get_node(".")
	#Globals.set("nodeenemy1",nodoenemigo)
	var nodebullet1 = Globals.get("bullet1")
	#--------var-------------------------------
	var speed = 500
	var enemigo1pos = get_pos()
	var ene = get_node(".").get_pos()
	#---------------Bullet shock--------------------
	if is_colliding():
       var collider = get_collider()
       if collider.is_in_group("nodebullet1"):
           collider.queue_free()
           return
 	#-------------Look at the player----------------------------
	var spriteenemy1 = get_node("Spritejugador")
	 
	var pp = Globals.get("posplayer")
	#print(pp)
	
	var spriteenemy1 = get_node(".")
	spriteenemy1.look_at(pp)
	
	#------Measure distance between the player and the enemy---------
	pA = get_node(".").get_pos()
	
	direccion = pA.distance_to(pp)
	distancia = direccion
	print(distancia,"posicion del enemigo a player")
	
	#-------------Stop enemy at some distance from the player--
	get_node("RayCast2D").set_cast_to((pp - ene).normalized() * distance_to_player)
	
	if get_node("RayCast2D").is_colliding():
		print("toque rayo")
      
	if direccion <= 300:
		speed= 0

	#--------Move the enemy towards the player---------
	move((pp - enemigo1pos).normalized() * speed * delta)

#-------- enemy attacks player ------------------

#-------- enemy health -------------------------
