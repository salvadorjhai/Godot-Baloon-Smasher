extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bg_music_on = preload("res://img/music_on.fw.png")
var bg_music_off = preload("res://img/music_off.fw.png")
var is_on = true
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("musicPlayer").play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://StartMenu.tscn")

func _on_btnMusicOnOff_pressed():
	if is_on == true:
		is_on = false
		get_node("musicPlayer").stop()
		get_node("CenterContainer/bgMusicOnOff").texture = bg_music_off
	else:
		is_on = true
		get_node("musicPlayer").play()
		get_node("CenterContainer/bgMusicOnOff").texture = bg_music_on
