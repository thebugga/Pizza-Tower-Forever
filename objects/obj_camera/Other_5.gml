// reset cam 

cam_width = Approach(cam_width, room_width, 0.15);
cam_height = Approach(cam_height, room_height, 0.15);
camera_zoom(1, 0.15);
angle = Approach(angle, 0, 0.15);