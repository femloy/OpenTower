scale += 0.05
image_alpha = Approach(image_alpha, 0, 0.05)
if image_alpha <= 0
	instance_destroy()
