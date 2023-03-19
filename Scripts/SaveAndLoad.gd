extends Node

onready var Player = get_node("/root/Player")
onready var HUD = get_node("/root/HUD")

onready var Slot1 = get_node("/root/HUD/InventoryButton/Inventory/Slot1")
onready var Slot2 = get_node("/root/HUD/InventoryButton/Inventory/Slot2")
onready var Slot3 = get_node("/root/HUD/InventoryButton/Inventory/Slot3")
onready var Slot4 = get_node("/root/HUD/InventoryButton/Inventory/Slot4")
onready var Slot5 = get_node("/root/HUD/InventoryButton/Inventory/Slot5")


var filenum : int = 1

var path = "user://SaveFile.dat"
var pathC = "user://SaveScenery.dat"
var pathS = "user://Settings.dat"

func _ready():
	loadSettings()

var default_data = {
	"player" : {
		"current_level" : 1,
		"PositionX" : 1450,
		"PositionY" : 1000,
		"nightmare_mode" : false,
		"stamina" : 100,
		"max_stamina" : 100,
		"fear" : 0,
		"ink" : 0,
		"current_Scene" : "res://Scenes/Charles_Room.tscn",
		"pose" : "IDLE_Front"
		},
	"inventory" : {
		"slot_1" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_2" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_3" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_4" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_5" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			}
		}
}


var data = {
	"player" : {
		"current_level" : 1,
		"PositionX" : 1450,
		"PositionY" : 1000,
		"nightmare_mode" : false,
		"stamina" : 100,
		"max_stamina" : 100,
		"fear" : 0,
		"ink" : 0,
		"current_Scene" : "res://Scenes/Charles_Room.tscn",
		"pose" : "IDLE_Front"
		},
	"inventory" : {
		"slot_1" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_2" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_3" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_4" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			},
		"slot_5" : {
			"isOccupied" : false,
			"itemNum" : -1,
			"file_name" : null,
			"itemDescription" : null,
			"itemName" : null
			}
		}
}

var default_scenesData = {
	"Charlie_Room" : {
		"key" : true,
		"ink" : true,
		"door" : true
	},
	"Corridor1" : {
		"safe" : true
	},
	"Bathroom1" : {
		"key" : true
	},
	"Kitchen" : {
		"knife_box" : true,
		"halfkey" : true,
		"door" : true
	},
	"Corridor2" : {
		"door" : true
	},
	"Bathroom2" : {
		"rope" : true
	},
	"Garden2" : {
		"crowbar" : true
	},
	"LivingRoom" : {
		"greendoor" : true
	},
	"Garden1" : {
		"rope" : true,
		"door" : true
	},
	"TVRoom" : {
		"door" : true
	},
	"DiningRoom" : {
		"door" : true
	},
	"Corridor3" : {
		"on" : true
	},
	"BrotherRoom" : {
		"knob" : true
	},
	"Bathroom3" : {
		"on" : true
	},
	"PaintingRoom" : {
		"knob" : true
	},
	"ParentsRoom" : {
		"key" : true
	},
	"Bathroom4" : {
		"on" : true
	},
	"Attic" : {
		"key" : true
	},
	"Bathroom5" : {
		"crank" : true
	},
	"Corridor4" : {
		"door" : true
	},
	"Library" : {
		"key" : true
	},
	"Balcony" : {
		"on" : true
	},
	"Pantry" : {
		"lock" : true,
		"key" : true
	},
	"Garage" : {
		"key" : true,
		"reddoor" : true,
		"ink" : true
	},
	"Corridor5" : {
		"door" : true
	},
	"Depot" : {
		"key" : true
	},
	"CleaningRoom" : {
		"key" : true
	},
	"StairsDown1FB1" : {
		"door" : true
	}
}

var scenesData = {
	"Charlie_Room" : {
		"key" : true,
		"ink" : true,
		"door" : true
	},
	"Corridor1" : {
		"safe" : true
	},
	"Bathroom1" : {
		"key" : true
	},
	"Kitchen" : {
		"knife_box" : true,
		"halfkey" : true,
		"door" : true
	},
	"Corridor2" : {
		"door" : true
	},
	"Bathroom2" : {
		"rope" : true
	},
	"Garden2" : {
		"crowbar" : true
	},
	"LivingRoom" : {
		"greendoor" : true
	},
	"Garden1" : {
		"rope" : true,
		"door" : true
	},
	"TVRoom" : {
		"door" : true
	},
	"DiningRoom" : {
		"door" : true
	},
	"Corridor3" : {
		"on" : true
	},
	"BrotherRoom" : {
		"knob" : true
	},
	"Bathroom3" : {
		"on" : true
	},
	"PaintingRoom" : {
		"knob" : true
	},
	"ParentsRoom" : {
		"key" : true
	},
	"Bathroom4" : {
		"on" : true
	},
	"Attic" : {
		"key" : true
	},
	"Bathroom5" : {
		"crank" : true
	},
	"Corridor4" : {
		"door" : true
	},
	"Library" : {
		"key" : true
	},
	"Balcony" : {
		"on" : true
	},
	"Pantry" : {
		"lock" : true,
		"key" : true
	},
	"Garage" : {
		"key" : true,
		"reddoor" : true
	},
	"Corridor5" : {
		"door" : true
	},
	"Depot" : {
		"key" : true
	},
	"CleaningRoom" : {
		"key" : true
	},
	"StairsDown1FB1" : {
		"door" : true
	}
}

var temporary_scenesData = {
	"Charlie_Room" : {
		"key" : true,
		"ink" : true,
		"door" : true
	},
	"Corridor1" : {
		"safe" : true
	},
	"Bathroom1" : {
		"key" : true
	},
	"Kitchen" : {
		"knife_box" : true,
		"halfkey" : true,
		"door" : true
	},
	"Corridor2" : {
		"door" : true
	},
	"Bathroom2" : {
		"rope" : true
	},
	"Garden2" : {
		"crowbar" : true
	},
	"LivingRoom" : {
		"greendoor" : true
	},
	"Garden1" : {
		"rope" : true,
		"door" : true
	},
	"TVRoom" : {
		"door" : true
	},
	"DiningRoom" : {
		"door" : true
	},
	"Corridor3" : {
		"on" : true
	},
	"BrotherRoom" : {
		"knob" : true
	},
	"Bathroom3" : {
		"on" : true
	},
	"PaintingRoom" : {
		"knob" : true
	},
	"ParentsRoom" : {
		"key" : true
	},
	"Bathroom4" : {
		"on" : true
	},
	"Attic" : {
		"key" : true
	},
	"Bathroom5" : {
		"crank" : true
	},
	"Corridor4" : {
		"door" : true
	},
	"Library" : {
		"key" : true
	},
	"Balcony" : {
		"on" : true
	},
	"Pantry" : {
		"lock" : true,
		"key" : true
	},
	"Garage" : {
		"key" : true,
		"reddoor" : true
	},
	"Corridor5" : {
		"door" : true
	},
	"Depot" : {
		"key" : true
	},
	"CleaningRoom" : {
		"key" : true
	},
	"StairsDown1FB1" : {
		"door" : true
	}
}

var default_settings = {
	"volume" : 0,
	"vsync" : false,
	"fullscreen" : false
}

var settings = {
	"volume" : 0,
	"vsync" : false,
	"fullscreen" : false
}

func load_game():
	var file = File.new()
	var file2 = File.new()
	
	if not file.file_exists(path):
		reset_data()
		return
		
	if not file2.file_exists(pathC):
		reset_data()
		return
		
	file.open_encrypted_with_pass(path, file.READ, "senha")
	data = file.get_var()
	
	Player.currentMap = data.player.current_level
	Player.stamina = data.player.stamina
	Player.maxstamina = data.player.max_stamina
	Player.ink = data.player.ink
	Player.fear = data.player.fear
	Player.position.x = data.player.PositionX
	Player.position.y = data.player.PositionY
	Player.play(data.player.pose)
	
	if(data.inventory.slot_1.isOccupied == true):
		Slot1.inputSlot(data.inventory.slot_1.itemName, data.inventory.slot_1.itemDescription, data.inventory.slot_1.file_name, data.inventory.slot_1.itemNum)
	else:
		Slot1.clearSlot()
	if(data.inventory.slot_2.isOccupied == true):
		Slot2.inputSlot(data.inventory.slot_2.itemName, data.inventory.slot_2.itemDescription, data.inventory.slot_2.file_name, data.inventory.slot_2.itemNum)
	else:
		Slot2.clearSlot()	
	if(data.inventory.slot_3.isOccupied == true):
		Slot3.inputSlot(data.inventory.slot_3.itemName, data.inventory.slot_3.itemDescription, data.inventory.slot_3.file_name, data.inventory.slot_3.itemNum)
	else:
		Slot3.clearSlot()	
	if(data.inventory.slot_4.isOccupied == true):
		Slot4.inputSlot(data.inventory.slot_4.itemName, data.inventory.slot_4.itemDescription, data.inventory.slot_4.file_name, data.inventory.slot_4.itemNum)
	else:
		Slot4.clearSlot()
	if(data.inventory.slot_5.isOccupied == true):
		Slot5.inputSlot(data.inventory.slot_5.itemName, data.inventory.slot_5.itemDescription, data.inventory.slot_5.file_name, data.inventory.slot_5.itemNum)
	else:
		Slot5.clearSlot()	
		
	file.close()
	
	file2.open_encrypted_with_pass(pathC, file.READ, "senha123")
	scenesData = file2.get_var()
	temporary_scenesData = scenesData
	
	file2.close()


func save_game(map):
	var file
	var file2
	
	file = File.new()
	
	file.open_encrypted_with_pass(path, file.WRITE, "senha")
	
	data.player.current_level = Player.currentMap
	data.player.stamina = Player.stamina
	data.player.max_stamina = Player.maxstamina
	data.player.fear = Player.fear
	data.player.ink = Player.ink
	data.player.PositionX = Player.position.x
	data.player.PositionY = Player.position.y
	data.player.current_Scene = map
	if(Player.get_animation() == "Walk_Left"):
		data.player.pose = "Idle_Left"
	elif(Player.get_animation() == "Walk_Right"):
		data.player.pose = "Idle_Right"
	elif(Player.get_animation() == "Walk_Front"):
		data.player.pose = "Idle_Front"
	elif(Player.get_animation() == "Walk_Back"):
		data.player.pose = "Idle_Back"
	elif(Player.get_animation() == "_Hide"):
		data.player.pose = "Idle_Front"
	else:
		data.player.pose = Player.get_animation()
	
	if(Slot1.isOccupied == true):
		data.inventory.slot_1.isOccupied = true
		data.inventory.slot_1.itemDescription = Slot1.getItemDescription()
		data.inventory.slot_1.itemNum = Slot1.getItemNum()
		data.inventory.slot_1.itemName = Slot1.getItemName()
		data.inventory.slot_1.file_name = Slot1.getFileName()
	else:
		data.inventory.slot_1.isOccupied = false
		data.inventory.slot_1.itemDescription = null
		data.inventory.slot_1.itemNum = -1
		data.inventory.slot_1.itemName = null
		data.inventory.slot_1.file_name = null
	if(Slot2.isOccupied == true):
		data.inventory.slot_2.isOccupied = true
		data.inventory.slot_2.itemDescription = Slot2.getItemDescription()
		data.inventory.slot_2.itemNum = Slot2.getItemNum()
		data.inventory.slot_2.itemName = Slot2.getItemName()
		data.inventory.slot_2.file_name = Slot2.getFileName()
	else:
		data.inventory.slot_2.isOccupied = false
		data.inventory.slot_2.itemDescription = null
		data.inventory.slot_2.itemNum = -1
		data.inventory.slot_2.itemName = null
		data.inventory.slot_2.file_name = null
	if(Slot3.isOccupied == true):
		data.inventory.slot_3.isOccupied = true
		data.inventory.slot_3.itemDescription = Slot3.getItemDescription()
		data.inventory.slot_3.itemNum = Slot3.getItemNum()
		data.inventory.slot_3.itemName = Slot3.getItemName()
		data.inventory.slot_3.file_name = Slot3.getFileName()
	else:
		data.inventory.slot_3.isOccupied = false
		data.inventory.slot_3.itemDescription = null
		data.inventory.slot_3.itemNum = -1
		data.inventory.slot_3.itemName = null
		data.inventory.slot_3.file_name = null
	if(Slot4.isOccupied == true):
		data.inventory.slot_4.isOccupied = true
		data.inventory.slot_4.itemDescription = Slot4.getItemDescription()
		data.inventory.slot_4.itemNum = Slot4.getItemNum()
		data.inventory.slot_4.itemName = Slot4.getItemName()
		data.inventory.slot_4.file_name = Slot4.getFileName()
	else:
		data.inventory.slot_4.isOccupied = false
		data.inventory.slot_4.itemDescription = null
		data.inventory.slot_4.itemNum = -1
		data.inventory.slot_4.itemName = null
		data.inventory.slot_4.file_name = null
	if(Slot5.isOccupied == true):
		data.inventory.slot_5.isOccupied = true
		data.inventory.slot_5.itemDescription = Slot5.getItemDescription()
		data.inventory.slot_5.itemNum = Slot5.getItemNum()
		data.inventory.slot_5.itemName = Slot5.getItemName()
		data.inventory.slot_5.file_name = Slot5.getFileName()
	else:
		
		data.inventory.slot_5.isOccupied = false
		data.inventory.slot_5.itemDescription = null
		data.inventory.slot_5.itemNum = -1
		data.inventory.slot_5.itemName = null
		data.inventory.slot_5.file_name = null
		
	file.store_var(data)
	file.close()
	
	file2 = File.new()
	file2.open_encrypted_with_pass(pathC, file.WRITE, "senha123")
	scenesData = temporary_scenesData
	file2.store_var(scenesData)
	file2.close()


func reset_data():
	Slot1.clearSlot()
	Slot2.clearSlot()
	Slot3.clearSlot()
	Slot4.clearSlot()
	Slot5.clearSlot()
	data = default_data.duplicate(true)
	scenesData = default_scenesData.duplicate(true)
	temporary_scenesData = default_scenesData.duplicate(true)

func saveSettings():
	var fileS
	
	fileS = File.new()
	fileS.open_encrypted_with_pass(pathS, fileS.WRITE, "senha")
	fileS.store_var(settings)
	fileS.close()

func loadSettings():
	var fileS = File.new()
	var error = !fileS.file_exists(pathS)
	if(error == false):
		fileS = File.new()
		fileS.open_encrypted_with_pass(pathS, fileS.READ, "senha")
		settings = fileS.get_var()
		fileS.close()
	else:
		fileS = File.new()
		fileS.open_encrypted_with_pass(pathS, fileS.WRITE, "senha")
		fileS.store_var(default_settings)
		fileS.close()
		settings = default_settings.duplicate(true)
