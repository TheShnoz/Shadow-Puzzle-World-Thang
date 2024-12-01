#@tool
extends Node
class_name Map_Generator
@export var sceneroot : Node

@export_group('Map Settings')
@export var ground_texture : BaseMaterial3D
@export var map_size : Vector2

func generate_base():
	#generate plane mesh
	print('generatingplane')
	var map_plane = PlaneMesh.new()
	map_plane.size = map_size
	#generate meshinstance
	var mapbase = MeshInstance3D.new()
	mapbase.mesh = map_plane
	mapbase.set_surface_override_material(0, ground_texture)
	#create collision
	mapbase.create_convex_collision(true, false)
	sceneroot.add_child(mapbase)
