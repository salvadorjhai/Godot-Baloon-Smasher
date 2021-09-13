extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var blue = preload("res://img/baloon_blue.fw.png");
var green = preload("res://img/baloon_green.fw.png");
var orange = preload("res://img/baloon_orange.fw.png");

func loadOrange():
	self.play("orange")

func loadGreen():
	self.play("green")

func loadBlue():
	self.play("blue")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
