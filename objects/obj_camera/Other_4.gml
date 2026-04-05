x = obj_player.x;
y = obj_player.y;
Camera_width = room_width;
Camera_height = room_height;
Camera_xorigin = 0;
Camera_yorigin = 0;
cam_lzoom = 1;
cam_langle = 0;
var _region = noone;
if instance_exists(obj_cameraRegion)
{
	with (obj_cameraRegion) 
	{
		if (Region_active == true && activationCode()) {
			_region = id;
			with (other) {
				if _region.ClampRight {
					Camera_width = _region.x + _region.sprite_width;
				}
				if _region.ClampBottom {
					Camera_height = _region.y + _region.sprite_height;
				}
				if _region.ClampLeft {
					Camera_xorigin = _region.x;
				}
				if _region.ClampTop {
					Camera_yorigin = _region.y;
				}
				camzoom = _region.zoom;
				angle = -_region.image_angle;
			}
		}
	}
}
with (obj_camera)
{
	shake_mag = 0;
	shake_mag_acc = 0;
}