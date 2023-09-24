extends Sprite2D

class_name TextBox

func print_text():
		$Label.text = "Congratulations! You threw the helmet at " + str(int(Ross.helmet_speed / -40)) + " miles per hour!" 
