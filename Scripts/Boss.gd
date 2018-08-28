extends Area2D

onready var Global = get_node("/root/Global")

var Live = 100
var Bullet = preload("res://Sceans/EnBullet.tscn")
const MOVE_SPEED = 100
var direction = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if direction:
		position.x += MOVE_SPEED * delta
	else:
		position.x -= MOVE_SPEED * delta
	
	if Live < 1:
		position.y -= MOVE_SPEED * delta
		if $Timer3.is_stopped():
			$Timer3.start()
	
	$Label.text = String(Live)


func Short():
	var bul = Bullet.instance()
	bul.position = position + Vector2(0, 20)
	get_node('../').add_child(bul)

func _on_Timer_timeout():
	direction = !direction


func _on_Timer2_timeout():
	Short()


func _on_Boss_area_entered(area):
	if area.is_in_group("Bullet"):
		Global.money = Global.money + 5
		Live -= 1
		area.queue_free()


func _on_Timer3_timeout():
	get_tree().change_scene("res://Sceans/Game.tscn")
