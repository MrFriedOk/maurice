#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(binding = 1) uniform sampler2D source;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec2 size;     // item size in pixels
    float cell;    // dot spacing in pixels
    float angle;   // radians
};

void main() {
    vec2 px = qt_TexCoord0 * size;
    mat2 rot = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
    vec2 g = rot * px / cell;
    vec2 id = floor(g) + 0.5;                       // cell center (rotated space)
    vec2 centerPx = transpose(rot) * (id * cell);   // back to image space
    vec3 col = texture(source, clamp(centerPx / size, 0.0, 1.0)).rgb;

    float darkness = 1.0 - dot(col, vec3(0.299, 0.587, 0.114));
    float r = 0.7071 * sqrt(darkness);              // radius in cell units
    float d = length(g - id);
    float aa = fwidth(d);
    float ink = 1.0 - smoothstep(r - aa, r + aa, d);

    fragColor = vec4(vec3(1.0 - ink), 1.0) * qt_Opacity;   // black dots on white
}
