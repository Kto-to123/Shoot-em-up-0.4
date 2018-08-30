extends CanvasLayer

onready var Global = get_node("/root/Global")

func _process(delta):
	$Label.text = String(Global.money)
	$Label2.text = String(Global.Shield)
	$Label3.text = String(Global.BossTime)


func _on_Button_pressed():
	get_tree().change_scene("res://Sceans/Menu.tscn")
