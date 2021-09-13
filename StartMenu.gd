extends CenterContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var a = get_node("AudioStreamPlayer")
	a.stream = preload("res://audio/menu.ogg")
	a.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btnPlay_pressed():
	get_tree().change_scene("res://InGame.tscn")
