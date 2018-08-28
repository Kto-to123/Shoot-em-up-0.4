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
	$CanvasLayer/Label3.text = String(Global.BossTime)
	
	if $Offer.scale.x <= 20:
		$Offer.scale.x += delta * 10
		$Offer.scale.y += delta * 10
		$Offer.modulate.a -= delta / 1.4
	
	
	if $Offer.scale.x > 20:
		$Offer.position = Vector2(-500, -500)
		$Offer.scale.x = 1
		$Offer.scale.y = 1
	
	if Global.BossTime > 9:
		$Portal.visible = true
	
	if Global.BossTime > 9 && $player.position.x > get_viewport_rect().size.x + 5:
		get_tree().change_scene("res://Sceans/BossScene.tscn")


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Sceans/Menu.tscn")


func _on_PowerTimer_timeout():
	spawn_PowerShield()



func _on_EnemyTimer2_timeout():
	spawn_enemy2()


func _on_EnemyTImet3_timeout():
	spawn_enemy3()


func _on_PlayerSpawnTimer_timeout():
	$player.position = Vector2(539, 518)

func _on_EnemyTimer_timeout():
	spawn_enemy()
