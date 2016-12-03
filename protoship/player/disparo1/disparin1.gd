extends KinematicBody2D


const SPEEDbullet=-600
var dir = Vector2(0, 1)


func _fixed_process(delta):
#---------vriables globales-----------
	var bala1 = get_node(".").get_collider()
	Globals.set("bullet1",bala1)
	
#--------colisiones de la bala---------
	if is_colliding():
        queue_free()
        return
	
        #queue_free()
       # return
#--------movimiento de la bala--------------
 move(dir * SPEEDbullet * delta)

func _ready():
	set_fixed_process(true)
	pass


func _on_VisibilityNotifier2D_exit_screen():
	print("sali jaja")
	queue_free()
	pass # replace with function body
	
