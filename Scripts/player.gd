extends Area2D
export var ball_dir = 1

onready var Global = get_node('/root/Global')

onready var MOVE_SPEED = Global.speed

var Bullet = preload('res://Sceans/bullet.tscn')

func push(): 
	if Global.Gun == 1:
		var bul = Bullet.instance()
		bul.position = position + Vector2(0, -10)
		get_node('../').add_child(bul)
	
	if Global.Gun == 2:
		var bul = Bullet.instance()
		bul.position = position + Vector2(0, -10)
		get_node('../').add_child(bul)
		
		var bulI = Bullet.instance()
		bulI.position = position + Vector2(-6, -7)
		get_node('../').add_child(bulI)
		
		var bulY = Bullet.instance()
		bulY.position = position + Vector2(6, -7)
		get_node('../').add_child(bulY)
	
	if Global.Gun == 3:
		var bul = Bullet.instance()
		bul.position = position + Vector2(0, -10)
		get_node('../').add_child(bul)
		
		var bulI = Bullet.instance()
		bulI.position = position + Vector2(-6, -7)
		get_node('../').add_child(bulI)
		bulI.rotation_degrees = -10
		
		var bulY = Bullet.instance()
		bulY.position = position + Vector2(6, -7)
		get_node('../').add_child(bulY)
		bulY.rotation_degrees = 10


func _ready():
	if Global.Skin == 1:
		$AnimatedSprite.frame = 0
	
	if Global.Skin == 2:
		$AnimatedSprite.frame = 1
	
	if Global.Skin == 3:
		$AnimatedSprite.frame = 2
	
	if Global.Skin == 4:
		$AnimatedSprite.frame = 3


func _process(delta):
	var which = get_name()
	
#	if Input.is_action_pressed(which+"_move_left") and position.x > 0:
#		position.x -= MOVE_SPEED * delta
#	if Input.is_action_pressed(which+"_move_rght") and position.x < get_viewport_rect().size.x:
#		position.x += MOVE_SPEED * delta
	
	if Input.is_action_pressed("_move_left") and position.x > 0:
		position.x -= MOVE_SPEED * delta
	if Input.is_action_pressed("_move_rght") and position.x < get_viewport_rect().size.x:
		position.x += MOVE_SPEED * delta
	if Input.is_action_pressed("_move_up") and position.y > 0:
		position.y -= MOVE_SPEED * delta
	if Input.is_action_pressed("_move_down") and position.y < get_viewport_rect().size.y:
		position.y += MOVE_SPEED * delta
	
	if Input.is_action_pressed('_Esc'):
		get_tree().change_scene("res://Sceans/Menu.tscn")
	


func _on_Timer_timeout():
	pass


func _on_Timer2_timeout():
	if Input.is_action_pressed('_LMB'):
		push()

#func _on_player_area_entered(area):
#	if area.is_in_group("EnBullet"):
#		Global.Live -= 1
#		area.queue_free()
