extends Camera2D


var player_1
var player_2


# Called when the node enters the scene tree for the first time.
func _ready():
	player_1 = get_node('../xabnab')
	player_2 = get_node('../penguin')
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(player_1.position.linear_interpolate(player_2.position, 0.5))
	
