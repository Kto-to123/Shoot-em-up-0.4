extends ParallaxBackground

var Speed = 2
var Size = 762

func _physics_process(delta):
	$ParallaxLayer.position.y += Speed
	$ParallaxLayer2.position.y += Speed
	
	if $ParallaxLayer.position.y > Size:
		$ParallaxLayer.position.y = -Size
	
	if $ParallaxLayer2.position.y > Size:
		$ParallaxLayer2.position.y = -Size
