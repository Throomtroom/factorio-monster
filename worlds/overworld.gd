extends Node2D

#exportation de chunk
@export var chunk: PackedScene


#taille de la map
var heigh = 124
var width = 124

#création d'un tableau de valeurs de bruit
var noise : Noise
var noise_val_array = []

#création d'une vaarible pour chaque layer de tilemap +position
var water_int =0
var water_array = []
var water_terrain = 0

var ground_1_int =1
var ground_1_array = []
var ground_1_array_type = []
var ground_1_tiles = [Vector2i(0,0),Vector2i(1,0),Vector2i(0,1),Vector2i(1,1)]

var mountain_int =2
var mountain_array = []
var mountain_terrain = 1

#appel au bruit du noued general
func _ready() -> void:
	noise = $"/root/General".heigh_perlin.noise
	_map()
	print($"/root/General".heigh_perlin.noise.seed)

#pose de chque tilset 
func _map() :
	#si je veux faire /2 le nompbre de chunk, je multiplie par 2 le 16 des for, le 1024 et le -8  
	for x in range (0,width/16):
		for y in range (0,heigh/16):
			var chunk_h = -heigh*16+(1024*y)-((heigh/4)-8)*64
			var chunk_w = -width*16+(1024*x)-((heigh/4)-8)*64
			var Chunk = chunk.instantiate()
			Chunk.position =Vector2(chunk_w,chunk_h)
			add_child(Chunk)
			
			
	for x in range (-width/2,width/2,):
		for y in range (-heigh/2,heigh/2) :
			var noise_val = noise.get_noise_2d(x,y)
			noise_val_array.append(noise_val)
			if noise_val < 1000:
				water_array.append(Vector2(x,y))
			elif noise_val >1000 :
				mountain_array.append(Vector2(x,y))
			else :
				ground_1_array.append(Vector2(x,y))
				ground_1_array_type.append(ground_1_tiles.pick_random())


func _gen(hauteur,pos) : 
	for x in range (-hauteur,hauteur):
		for y in range (-hauteur,hauteur) :
			$tilemap.set_cells_terrain_connect(water_int,water_array,water_terrain,0)
			$tilemap.set_cells_terrain_connect(mountain_int,mountain_array,mountain_terrain,0)
			$tilemap.set_cell(ground_1_int,Vector2(pos.x*x,pos.y*y),0,ground_1_tiles.pick_random())
			#$tilemap._tree()
