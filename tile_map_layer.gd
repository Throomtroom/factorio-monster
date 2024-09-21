extends TileMap

@export var tree: PackedScene





func _tree():
	var t1_tilemap = get_used_cells_by_id(1,0,Vector2i(1,0))
	var nbentity = len(t1_tilemap)
	for i in range (0,nbentity):
		var t1tilemapos = map_to_local(t1_tilemap[i])
		var Treee = tree.instantiate()
		Treee.position =t1tilemapos
		add_child(Treee)
		set_cell(1,t1_tilemap[i],0,Vector2i(1,1))
