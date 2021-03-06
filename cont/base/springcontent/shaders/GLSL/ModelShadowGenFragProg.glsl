uniform sampler2D alphaMaskTex;

uniform vec2 alphaParams;


in vec2 vTexCoord;

#if (SUPPORT_DEPTH_LAYOUT == 1)
// preserve early-z performance if possible
layout(depth_unchanged) out float gl_FragDepth;
#endif


void main() {
	if (texture(alphaMaskTex, vTexCoord).a <= alphaParams.x)
		discard;

	gl_FragDepth = gl_FragCoord.z;
}

