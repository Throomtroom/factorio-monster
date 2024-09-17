extends Node

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude =FastNoiseLite.new()

func _ready() -> void:
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
