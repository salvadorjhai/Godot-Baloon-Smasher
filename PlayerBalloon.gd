extends AnimatedSprite

var CurrentLetter = "A"
var currentColor = "orange"

var keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var colors = ["orange", "blue", "green", "red"]

onready var soundPlayer = 	get_node("AudioStreamPlayer")

onready var rnd = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rnd.randomize()
	Reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = CurrentLetter
	
	var n = get_node(".")
	n.position = n.position.move_toward(Vector2(n.position.x, -120), delta * 120)

	# if out of bounds
	if n.position.y <= 40:
		islocked = true
		soundPlayer.play(0)
		get_node(".").play()
#		soundPlayer.play()
#		Reset()

func Reset():
	var n = get_node(".")
	n.stop()
	n.frame = 0
		
	n.position = Vector2(rnd.randf_range(8, 712), 568)
	n.animation = currentColor

	CurrentLetter = keys[rnd.randi_range(1, 26) - 1]
	currentColor = colors[rnd.randi_range(1, 4) - 1]	

var islocked = false
func _input(event):
	if event is InputEventKey and event.pressed and islocked == false:
		if char(event.scancode) == CurrentLetter:
			islocked = true
			get_parent().SCORE = get_parent().SCORE + 1
			get_node(".").play()
			soundPlayer.play(0)

func _on_PlayerBalloon_animation_finished():
	Reset()
	islocked = false
