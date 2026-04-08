var _is_region_active = false;
var _region = noone;
if instance_exists(obj_cameraRegion)
{
	with (obj_cameraRegion) 
	{
		if (Region_active == true && activationCode()) {
			_region = id;
			with (other) {
				if _region.ClampRight {
					cam_width = Approach(cam_width, _region.x + _region.sprite_width, 0.1);
				} else {
					cam_width = Approach(cam_width, room_width, 0.1);				
				}
				if _region.ClampBottom {
					cam_height = Approach(cam_height, _region.y + _region.sprite_height, 0.1);
				} else {
					cam_height = Approach(cam_height, room_height, 0.1);
				}
				camera_zoom(_region.zoom, 0.1);
				angle = Approach(angle, -_region.image_angle, 0.1);
				_is_region_active = true;
			}
		}
		else 
		{
			_is_region_active = true
			cam_width = Approach(cam_width, room_width, 0.15);
			cam_height = Approach(cam_height, room_height, 0.15);
			camera_zoom(1, 0.15);
			angle = Approach(angle, 0, 0.15);
		}
	}
}