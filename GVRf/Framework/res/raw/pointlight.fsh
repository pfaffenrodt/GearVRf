Radiance @LightType(Surface s, in Struct@LightType data)
{
	vec4 lightpos = u_view * vec4(data.world_position.xyz, 1.0);
	vec4 lightdir = lightpos - viewspace_position;
	// Attenuation
    float distance    = length(lightpos.xyz - viewspace_position);
    float attenuation = 1.0 / (data.attenuation_constant + data.attenuation_linear * distance + 
    					data.attenuation_quadratic * (distance * distance));  
	
	return Radiance(clamp(data.ambient_intensity.xyz,0.0,1.0),
				    clamp(data.diffuse_intensity.xyz,0.0,1.0),
				    clamp(data.specular_intensity.xyz,0.0,1.0),
				    normalize(lightdir.xyz),
					attenuation);

}
