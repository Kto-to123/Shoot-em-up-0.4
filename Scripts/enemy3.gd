extends Area2D
onready var Global = get_node("/root/Global")

const MOVE_SPEED = 100
var Bullet = preload("res://Sceans/EnBullet.tscn")

func _process(delta):
	var which = get_name()

	if position.y > get_viewport_rect().size.y + 20:
		queue_free()
	position.y += MOVE_SPEED * delta


func _ready():
	push()


func push(): 
#	if Global.Gun == 1:
	var bul = Bullet.instance()
	bul.position = position + Vector2(0, 20)
	get_node('../').add_child(bul)
	
	var bul2 = Bullet.instance()
	bul2.position = position + Vector2(-5, 18)
	get_node('../').add_child(bul2)
	bul2.rotation_degrees = 10
	
	var bul3 = Bullet.instance()
	bul3.position = position + Vector2(5, 18)
	get_node('../').add_child(bul3)
	bul3.rotation_degrees = -10


func _on_enemy_area_entered(area):
	if area.is_in_group("Bullet"):
		Global.money = Global.money + 5
		area.queue_free()
		queue_free()
	
	if area.is_in_group("Player"):
		Global.Live = Global.Live - 1
		queue_free()
	
	if area.is_in_group("Shield"):
		Global.Shield = Global.Shield - 1
		queue_free()
	
	if area.is_in_group("Offer"):
		queue_free()

func _on_Timer_timeout():
	push()
