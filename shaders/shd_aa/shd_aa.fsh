varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexelSize;
uniform vec2 u_vScale;

void main()
{
    vec2 pixelPos = v_vTexcoord / u_vTexelSize;
    vec2 finalTexCoord = floor(pixelPos) + 0.5 + 1.0 - clamp(u_vScale*(1.0 - fract(pixelPos)), 0.0, 1.0);
    gl_FragColor = v_vColour*texture2D(gm_BaseTexture, finalTexCoord*u_vTexelSize);
}
