extends Node3D


func modeLoader():
	print("CATTLEFORGE V1.0 \n LOADING MODS...")
	pass


func _ready():
	print("CATTLEFORGE V1.0 \n LOADING MODS...")
	# Path to the external script folder (assuming 'scripts' is next to the executable)
	var script_folder = "user://scripts/"  # 'user://' allows access to files outside the project
	var script_path = script_folder + "ModLoader.py"
	
	var dir = Dictionary()
	
	if dir.get(script_folder) == OK:
		var output = []
		var executor = OS.execute("python3", script_path,output,true) 
		if executor == 0:
			print("Python Script Output:")
			print(output)
		else:
			print("Error executing Python script.")
	else:
		print("Script folder not found.")
	Global.currentlevel = "ireland"
	
