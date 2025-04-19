extends Node3D

var mod_list = []

func _ready():
	#load_mods("res://mods")
	# 1. Create a Lua state
	var lua = LuaState.new()
	# 2. Import Lua and Godot APIs into the state
	#    Optionally pass which libraries should be opened to the method
	lua.open_libraries()

	# 3. Run Lua code using `LuaState.do_string` or `LuaState.do_file`
	var result = lua.do_file("user://scripts/ModLoader.lua")
	# 4. Access results from Lua code directly in Godot
	#    When errors occur, instances of `LuaError` will be returned
	#if result is LuaError:
	   # printerr("Error in Lua code: ", result)
	#else:
	   # print(result)  # [LuaTable:0x556069ee50ab]
	   # print(result["this_is_a_table"])  # true
		#print(result["vector"])  # (1, 2)
	   # print(result["invalid key"])  # <null>

	# 5. Access the global _G table via `LuaState.globals` property
	assert(lua.globals is LuaTable)
	lua.globals["a_godot_callable"] = func(): print("Hello from GDScript!")
	lua.do_string("""
		a_godot_callable()  -- 'Hello from GDScript!'
	""")
	Global.currentlevel = "ireland"

func loadMods(path):
		pass
