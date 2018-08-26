extends Node2D

var Enemy = preload("res://Sceans/enemy.tscn")
var Enemy2 = preload("res://Sceans/enemy2.tscn")
var Enemy3 = preload("res://Sceans/enemy3.tscn")
var PowerShield = preload("res://Sceans/powerShield.tscn")
onready var Global = get_node("/root/Global")
onready var money = Global.money


func spawn_enemy():
	var enem = Enemy.instance()
	enem.position = position + Vector2(randi()%1000, -10)
	get_node('../').add_child(enem)


func spawn_enemy2():
	var enem2 = Enemy2.instance()
	enem2.position = position + Vector2(randi()%1000, -10)
	get_node('../').add_child(enem2)


func spawn_enemy3():
	var enem3 = Enemy3.instance()
	enem3.position = position + Vector2(randi()%1000, -10)
	get_node('../').add_child(enem3)


func spawn_PowerShield():
	var powerShield = PowerShield.instance()
	powerShield.position = position + Vector2(randi()%1000, -10)
	get_node('../').add_child(powerShield)


func _ready():
	randomize()
	$Timer2.wait_time = Global.rapidity


func _process(delta):
	if Global.Shield > 0 && Global.Live > 0:
		$Shield.position = $player.position
	
	if Global.Live <= 0:		
		$player.position = Vector2(-100, -100)
#		$player.queue_free()
	
	if Global.Shield <= 0:
		$Shield.position = Vector2(-100, -100)
#		$Shield.queue_free()
	
	$CanvasLayer/Label.text = String(Global.money)
	$CanvasLayer/Label2.text = String(Global.Shield)


func _on_Timer_timeout():
	spawn_enemy()


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Sceans/Menu.tscn")


func _on_PowerTimer_timeout():
	spawn_PowerShield()


func _on_player_area_entered(area):
	pass # replace with function body


func _on_EnemyTimer2_timeout():
	spawn_enemy2()


func _on_EnemyTImet3_timeout():
	spawn_enemy3()
