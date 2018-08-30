extends Node

onready var Global = get_node('/root/Global')

onready var money = Global.money
onready var speed = Global.speed
onready var rapidity = Global.rapidity

func _ready():
	$Label1.text = String(money)
	$Label1.update()
	$SpeedLabel/Label.text = String(speed)
	$RapidityLabel/Label.text = String(rapidity)
	$ShieldLabel/Label.text = String(Global.ShieldD)
	if Global.LVL > 0:
		$LVL1Button2.disabled = false
	if Global.LVL > 1:
		$LVL1Button3.disabled = false


func _on_StartButton_pressed():
	Global.Live = Global.LiveD
	Global.Shield = Global.ShieldD
	Global.money = money
	Global.speed = speed
	Global.rapidity = rapidity
	get_tree().change_scene("res://Sceans/Game.tscn")


func _on_BuyButton_pressed():
	if money > 0:
		money = money - 1
		speed = speed + 1
		$SpeedLabel/Label.text = String(speed)
	
	$Label1.text = String(money)


func _on_SellButton_pressed():
	if speed > 0:
		money = money + 1
		speed = speed - 1
		$SpeedLabel/Label.text = String(speed)
	
	$Label1.text = String(money)


func _on_BuyButton2_pressed():
	if money > 0 && rapidity > 0.002:
		money = money - 1
		rapidity = rapidity - 0.002
		$RapidityLabel/Label.text = String(rapidity)
	
	$Label1.text = String(money)


func _on_SellButton2_pressed():
#	if rapidity > 0:
	money = money + 1
	rapidity = rapidity + 0.002
	$RapidityLabel/Label.text = String(rapidity)
	
	$Label1.text = String(money)


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_BuyButton3_pressed():
	if money > 99:
		money = money - 100
		Global.ShieldD = Global.ShieldD + 1
		$ShieldLabel/Label.text = String(Global.ShieldD)
	
	$Label1.text = String(money)


func _on_SellButton3_pressed():
	if Global.ShieldD > 0:
		money = money + 100
		Global.ShieldD = Global.ShieldD - 1
		$ShieldLabel/Label.text = String(Global.ShieldD)
	
	$Label1.text = String(money) 


func _on_Button200_pressed():
	if money > 999:
		money = money - 1000
		Global.Gun = 2
	
	$Label1.text = String(money) 


func _on_Button300_pressed():
	if money > 999:
		money = money - 1000
		Global.Gun = 3
	
	$Label1.text = String(money) 


func _on_SkinButton1_pressed():
	if money > 49 && Global.Skin != 1:
		Global.Skin = 1
		money -= 50
		$Label1.text = String(money) 


func _on_SkinButton2_pressed():
	if money > 99 && Global.Skin != 2:
		Global.Skin = 2
		money -= 100
		$Label1.text = String(money) 


func _on_SkinButton3_pressed():
	if money > 149 && Global.Skin != 3:
		Global.Skin = 3
		money -= 150
		$Label1.text = String(money) 


func _on_SkinButton4_pressed():
	if money > 299 && Global.Skin != 4:
		Global.Skin = 4
		money -= 300
		$Label1.text = String(money) 


func _on_LVL1Button_pressed():
	get_tree().change_scene("res://Sceans/LVL1.tscn")


func _on_LVL1Button2_pressed():
	get_tree().change_scene("res://Sceans/LVL1.tscn")


func _on_LVL1Button3_pressed():
	get_tree().change_scene("res://Sceans/LVL1.tscn")
