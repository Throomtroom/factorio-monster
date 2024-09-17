extends TileMapLayer
var heigh = 10
var width = 10
@export var tree: PackedScene
@onready var player = get_parent().get_node("hero")

func _process(_delta) -> void:
	_generation(player.position)



func _generation(pos) :
	var tile_pos = local_to_map(pos)
	#print (tile_pos)
	for x in range (width):
		for y in range (heigh) :
			var moist = $"/root/General".moisture.get_noise_2d(tile_pos.x-width/2 +x,tile_pos.y-heigh/2 +y)*4
			var alt =$"/root/General".altitude.get_noise_2d(tile_pos.x-width/2 +x,tile_pos.y-heigh/2 +y )
			var temp = $"/root/General".temperature.get_noise_2d(tile_pos.x-width/2,tile_pos.y-heigh/2)*10
			set_cell(Vector2i(tile_pos.x-width/2 +x,tile_pos.y-heigh/2 +y),0,Vector2(round(moist+4/2),round(temp+10/5)))
	#var t1_tilemap = get_used_cells_by_id(0,Vector2i(1,0))
	#var nbentity = len(t1tilemap)
	#for i in range (0,nbentity):
		#var t1tilemapos = map_to_local(t1tilemap[i])
		#var Treee = tree.instantiate()
		#Treee.position =t1tilemapos
		#add_child(Treee)
		#set_cell(t1_tilemap[i],0,Vector2i(1,1))
