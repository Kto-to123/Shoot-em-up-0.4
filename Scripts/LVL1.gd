extends Node

var Enemy = preload("res://Sceans/enemy.tscn")
var Enemy2 = preload("res://Sceans/enemy2.tscn")
var Enemy3 = preload("res://Sceans/enemy3.tscn")
var PowerShield = preload("res://Sceans/powerShield.tscn")
onready var Global = get_node("/root/Global")

var Enemy2Start = false
var Enemy3Start = false


func _ready():
	randomize()


func spawn_enemy():
	var enem = Enemy.instance()
	enem.position = Vector2(randi()%1000, -10)
	get_node('../').add_child(enem)


func spawn_enemy2():
	var enem2 = Enemy2.instance()
	enem2.position = Vector2(randi()%1000, -10)
	get_node('../').add_child(enem2)


func spawn_enemy3():
	var enem3 = Enemy3.instance()
	enem3.position =  Vector2(randi()%1000, -10)
	get_node('../').add_child(enem3)


func spawn_PowerShield():
	var powerShield = PowerShield.instance()
	powerShield.position =  Vector2(randi()%1000, -10)
	get_node('../').add_child(powerShield)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Enemy1Timer_timeout():
	spawn_enemy()


func _on_Enemy2Timer_timeout():
	if Enemy2Start:
		spawn_enemy2()


func _on_Enemy3Timer_timeout():
	if Enemy3Start:
		spawn_enemy3()


func _on_PowerSpawnTimer_timeout():
	spawn_PowerShield()


func _on_Enemy2StartTimer_timeout():
	Enemy2Start = true


func _on_Enemy3StartTimer_timeout():
	Enemy3Start = true


func _on_BossTimer_timeout():
	get_tree().change_scene("res://Sceans/BossScene.tscn")
