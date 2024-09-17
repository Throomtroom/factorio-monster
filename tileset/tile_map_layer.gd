extends TileMapLayer

@export var tree: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var trees1 = map_to_local(Vector2i(7,0))
	var trees2 = get_used_cells_by_id(1,Vector2i(7,3)) 
	var nbentity = len(trees1)
	for i in range (1,nbentity):
		print(tree)
		#var Treee = tree.instantiate()
		#Treee.position = 1#
		
