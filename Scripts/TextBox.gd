extends Sprite2D

class_name TextBox

func print_text():
		$Label.text = "Congratulations! You threw the helmet at " + str(Ross.helmet_speed) + " miles per hour!" 
