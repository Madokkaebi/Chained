extends TextureButton

class_name Slot

export var index : int

var isOccupied : bool = false

var itemName : String = ""
var itemNum : int = -1
var itemDescription : String = ""
var file_name : String = ""

func clearSlot():
	self.itemName = ""
	self.itemDescription = ""
	self.isOccupied = false
	self.itemNum = -1
	self.file_name = ""
	self.set_normal_texture(null)

func inputSlot(name : String, description : String, fn : String, num : int):
	self.itemName = name
	self.itemDescription = description
	self.isOccupied = true
	self.itemNum = num
	self.file_name = fn
	self.set_normal_texture(load("res://assets/items/" + file_name + ".png"))
	TextBox.texts("You got " + itemName + "!")
	Player.itemGetPlay()
	
func getOccupied():
	return isOccupied
	
func getItemName():
	return itemName

func getItemNum():
	return itemNum

func getItemDescription():
	return itemDescription

func getFileName():
	return file_name
