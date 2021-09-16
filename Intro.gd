extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var pop = preload("res://audio/boom.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("New Anim");

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	var nd = $PanelContainer/baloon_orangefw
	nd.play("")
	
	$AudioStreamPlayer.play()
	
	#var nd2 = get_node("AnimationPlayer/AnimatedSpriteBaloon")
	#nd2.loadOrange()
	#nd2.transform = nd.transform

	#nd.visible = false
	
	#var a = get_node("AudioStreamPlayer")
	#get_node("AudioStreamPlayer").play()

	#nd2.play("explode")
	pass

func _on_AnimatedSpriteBaloon_animation_finished():
	pass # Replace with function body.


func _on_baloon_orangefw_animation_finished():
	get_tree().change_scene("res://StartMenu.tscn")
	pass # Replace with function body.
