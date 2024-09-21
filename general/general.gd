extends Node

@export var heigh_perlin : NoiseTexture2D

func _ready() -> void:
	heigh_perlin.noise.seed = randi()
