extends AnimatedSprite

var CurrentLetter = "A"
var currentColor = "orange"

var keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var colors = ["orange", "blue", "green"]

onready var soundPlayer = 	get_node("AudioStreamPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	Reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = CurrentLetter
	
	var n = get_node(".")
	n.position = n.position.move_toward(Vector2(n.position.x, -120), delta * 120)

	# if out of bounds
	if n.position.y <= -120:
		#if soundPlayer.playing == false:
		soundPlayer.play()
		Reset()

func Reset():
#	if soundPlayer.playing == true:
#		soundPlayer.stop()

	var n = get_node(".")
	n.stop()
	n.frame = 0
		
	n.position = Vector2(rand_range(89, 391), 727)
	n.animation = currentColor

	CurrentLetter = keys[rand_range(1, 26)]
	currentColor = colors[rand_range(1,3)]	

func _input(event):
	if event is InputEventKey and event.pressed:
		if char(event.scancode) == CurrentLetter:
			get_node(".").play(currentColor)
			soundPlayer.play(0)
			# TODO:
			# reset, explode
			#Reset()

func _on_PlayerBalloon_animation_finished():
	Reset()
