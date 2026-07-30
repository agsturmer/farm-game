shader_type canvas_item;

uniform float shake_intensity = 0;
uniform float shake_speed = 20.0;


void vertex() {
	
	float height = 1.0 - UV.y;
    
	float curve = pow(height, 2.0); 

	vec2 shake = vec2(0.0);
	shake.x = sin(TIME * shake_speed) * shake_intensity * curve;

	VERTEX.xy += shake;
}