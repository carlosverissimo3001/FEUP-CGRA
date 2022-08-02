
attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
attribute vec2 aTextureCoord;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;
uniform mat4 uNMatrix;
uniform float timeFactor;
uniform float scaleFactor;

varying vec2 vTextureCoord;
uniform sampler2D uSampler2;

uniform float normScale;

void main() {
	 vec3 offset=vec3(0.0,0.0,0.0); 
	vec3 offset1=vec3(0.0,0.0,0.0);
	
	vTextureCoord = aTextureCoord;

	if (texture2D(uSampler2, vec2(0.0,0.1)+vTextureCoord).b > 0.5)
		offset=aVertexNormal*normScale*0.3*sin(timeFactor);  

	offset1.x=normScale*0.3*sin(timeFactor); 

	/*gl_Position = uPMatrix * uMVMatrix * vec4(aVertexPosition+offset, 1.0 )*/;
	gl_Position = uPMatrix * uMVMatrix * vec4(aVertexPosition  + offset1, 1.0);
}

