//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRDefault" {
Properties {
_MainTex ("Atlas", 2D) = "white" { }
_FontTex ("Font", 2D) = "black" { }
_CustomTex ("Custom", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilCompFront ("__scf", Float) = 3
_StencilPassFront ("__spf", Float) = 0
_StencilZFailFront ("__szf", Float) = 1
_StencilFailFront ("__sff", Float) = 0
_StencilCompBack ("__scb", Float) = 8
_StencilPassBack ("__spb", Float) = 0
_StencilZFailBack ("__szb", Float) = 2
_StencilFailBack ("__sfb", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 24877
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 330
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform  sampler2D _ShaderInfoTex;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
in  vec4 in_TEXCOORD3;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD0;
flat out vec4 vs_TEXCOORD1;
flat out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
flat out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat10;
vec2 u_xlat11;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat10.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat10.xy = u_xlat10.xy * vec2(0.03125, 0.03125);
    u_xlat10.x = in_TEXCOORD1.y * 2040.0 + u_xlat10.x;
    u_xlat11.y = in_TEXCOORD3.y * 2040.0 + u_xlat10.y;
    u_xlat1.y = u_xlat10.x * 3.0;
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat11.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat0.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    u_xlat1.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat11.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat13.x = dot(u_xlat3, in_POSITION0);
    u_xlat11.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat13.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat11.xy * _1PixelClipInvView.zw;
    u_xlat12.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = roundEven(u_xlat2.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat12.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat11.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb16 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb16 = u_xlatb4.z || u_xlatb16;
    u_xlat3.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb16) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat13.xy;
    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat4;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat4;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat0.zw, 0.0);
    u_xlat1.xyz = in_COLOR0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = in_COLOR0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    vs_COLOR0 = u_xlat1 * in_COLOR0;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat1.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat17 = (u_xlatb2.w) ? -1.0 : -0.0;
    vs_TEXCOORD1.y = u_xlat17 + u_xlat2.y;
    u_xlat7 = u_xlat2.z + u_xlat2.y;
    u_xlatb12 = u_xlat7==1.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb12)) ? u_xlat11.xy : u_xlat1.xy;
    u_xlatb1.x = in_TEXCOORD2.w==0.00392156886;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat6.x = u_xlat7 + u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat1.x;
    u_xlat1.x = u_xlat2.x + u_xlat6.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    u_xlat1.x = u_xlat3.x + u_xlat1.x;
    u_xlat1.x = u_xlat3.y + u_xlat1.x;
    vs_TEXCOORD2.xy = u_xlat3.xy;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    vs_TEXCOORD1.w = (-u_xlat1.x) + 1.0;
    vs_TEXCOORD2.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    u_xlat1.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
    u_xlatb6 = u_xlat1.y>=(-u_xlat1.y);
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat1.x = u_xlat6.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.x = in_TEXCOORD2.y * 255.0 + (-u_xlat1.x);
    u_xlat2.x = in_TEXCOORD1.z * 8160.0 + u_xlat1.x;
    u_xlat1.x = in_TEXCOORD1.w * 2040.0;
    u_xlat2.y = u_xlat6.x * 0.03125 + u_xlat1.x;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD4 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 330
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform  sampler2D _FontTex;
UNITY_LOCATION(1) uniform  sampler2D _CustomTex;
UNITY_LOCATION(2) uniform  sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec4 vs_TEXCOORD0;
flat in  vec4 vs_TEXCOORD1;
flat in  vec3 vs_TEXCOORD2;
flat in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
vec2 u_xlat11;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat14;
float u_xlat15;
int u_xlati15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD4.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD4.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb12.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat12.x = u_xlatb12.x ? float(1.0) : 0.0;
    u_xlat12.y = u_xlatb12.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat12.xy + u_xlat0.xy;
    u_xlatb12.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat12.x = u_xlatb12.x ? float(1.0) : 0.0;
    u_xlat12.y = u_xlatb12.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat12.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = (-vs_TEXCOORD1.y);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6 = vs_TEXCOORD1.y;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 * u_xlat0.xxxx + vs_TEXCOORD1.wwww;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat2 * vec4(u_xlat6) + u_xlat1;
    u_xlat1 = texture(_FontTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dFdx(u_xlat1.w);
    u_xlat7 = dFdy(u_xlat1.w);
    u_xlat1.x = abs(u_xlat7) + abs(u_xlat1.x);
    u_xlat7 = (-u_xlat1.x) + 0.5;
    u_xlat1.x = u_xlat1.x + 0.5;
    u_xlat1.x = (-u_xlat7) + u_xlat1.x;
    u_xlat7 = (-u_xlat7) + u_xlat1.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.w = u_xlat1.x * u_xlat7;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(1.0);
    u_xlat1.z = float(1.0);
    u_xlat0 = u_xlat1 * vs_TEXCOORD1.xxxx + u_xlat0;
    u_xlat1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * vs_TEXCOORD1.zzzz + u_xlat0;
    u_xlatb1.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1 = (u_xlatb1.y) ? _CustomTex_TexelSize.xyxy : _MainTex_TexelSize.xyxy;
        u_xlat2.x = float(0.5);
        u_xlat14.y = float(0.0);
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat4 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlatb15 = 0.0<u_xlat4.x;
        u_xlat4.xz = u_xlat4.zw + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz + u_xlat4.xz;
        u_xlat5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + (-u_xlat4.xz);
        u_xlat21 = dot(u_xlat5.xy, u_xlat5.xy);
        u_xlat21 = inversesqrt(u_xlat21);
        u_xlat17.xy = vec2(u_xlat21) * u_xlat5.xy;
        u_xlat21 = dot((-u_xlat4.xz), u_xlat17.xy);
        u_xlat4.x = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat4.x = (-u_xlat21) * u_xlat21 + u_xlat4.x;
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat4.x = sqrt(u_xlat4.x);
        u_xlat16 = u_xlat21 + (-u_xlat4.x);
        u_xlat21 = u_xlat21 + u_xlat4.x;
        u_xlat4.x = min(u_xlat21, u_xlat16);
        u_xlatb22 = u_xlat4.x<0.0;
        u_xlat21 = max(u_xlat21, u_xlat16);
        u_xlat21 = (u_xlatb22) ? u_xlat21 : u_xlat4.x;
        u_xlat4.xz = vec2(u_xlat21) * u_xlat17.xy;
        u_xlatb21 = 9.99999975e-05>=abs(u_xlat4.x);
        u_xlatb22 = 9.99999975e-05<abs(u_xlat4.z);
        u_xlat4.xz = u_xlat5.xy / u_xlat4.xz;
        u_xlat16 = u_xlatb22 ? u_xlat4.z : float(0.0);
        u_xlat11.x = (u_xlatb21) ? u_xlat16 : u_xlat4.x;
        u_xlat11.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb15)) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat15 = u_xlat4.y * 255.0;
        u_xlati15 = int(u_xlat15);
        u_xlatb21 = u_xlat5.y>=(-u_xlat5.y);
        u_xlat4.x = fract(abs(u_xlat5.y));
        u_xlat21 = (u_xlatb21) ? u_xlat4.x : (-u_xlat4.x);
        u_xlat21 = (u_xlati15 != 0) ? u_xlat5.y : u_xlat21;
        u_xlatb4.xy = equal(ivec4(u_xlati15), ivec4(1, 2, 0, 0)).xy;
        u_xlat15 = u_xlat21;
        u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
        u_xlat15 = (u_xlatb4.x) ? u_xlat15 : u_xlat21;
        u_xlat21 = u_xlat15 * 0.5;
        u_xlatb4.x = u_xlat21>=(-u_xlat21);
        u_xlat21 = fract(abs(u_xlat21));
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : (-u_xlat21);
        u_xlat4.x = u_xlat21 + u_xlat21;
        u_xlatb21 = 0.5<u_xlat21;
        u_xlatb16 = u_xlat4.x>=(-u_xlat4.x);
        u_xlat22 = fract(abs(u_xlat4.x));
        u_xlat16 = (u_xlatb16) ? u_xlat22 : (-u_xlat22);
        u_xlat16 = (-u_xlat16) + 1.0;
        u_xlat21 = (u_xlatb21) ? u_xlat16 : u_xlat4.x;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat21 : u_xlat15;
        u_xlat14.x = _GradientSettingsTex_TexelSize.x;
        u_xlat2.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat14.xy;
        u_xlat4 = texture(_GradientSettingsTex, u_xlat2.xy);
        u_xlat4 = u_xlat4.ywxz * vec4(255.0, 255.0, 65025.0, 65025.0);
        u_xlat2.xy = u_xlat4.xy + u_xlat4.zw;
        u_xlat4.xy = u_xlat2.xy + vec2(0.5, 0.5);
        u_xlat2.xy = u_xlat14.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat2 = texture(_GradientSettingsTex, u_xlat2.xy);
        u_xlat2 = u_xlat2.ywxz * vec4(255.0, 255.0, 65025.0, 65025.0);
        u_xlat4.zw = u_xlat2.xy + u_xlat2.zw;
        u_xlat1 = u_xlat1 * u_xlat4;
        u_xlat1.xy = u_xlat5.xz * u_xlat1.zw + u_xlat1.xy;
        u_xlat2 = texture(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat2 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat1 = texture(_CustomTex, u_xlat1.xy);
        u_xlat0 = u_xlat1 * vs_TEXCOORD2.yyyy + u_xlat2;
    }
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 689
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %89 %100 %186 %211 %389 %428 %445 %448 %516 %581 %675 %677 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %136 ArrayStride 136 
                                                      OpDecorate %137 ArrayStride 137 
                                                      OpMemberDecorate %138 0 Offset 138 
                                                      OpMemberDecorate %138 1 Offset 138 
                                                      OpMemberDecorate %138 2 Offset 138 
                                                      OpMemberDecorate %138 3 Offset 138 
                                                      OpMemberDecorate %138 4 Offset 138 
                                                      OpMemberDecorate %138 5 Offset 138 
                                                      OpDecorate %138 Block 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %211 Location 211 
                                                      OpDecorate vs_TEXCOORD0 Location 389 
                                                      OpMemberDecorate %426 0 BuiltIn 426 
                                                      OpMemberDecorate %426 1 BuiltIn 426 
                                                      OpMemberDecorate %426 2 BuiltIn 426 
                                                      OpDecorate %426 Block 
                                                      OpDecorate %445 Location 445 
                                                      OpDecorate %448 Location 448 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 516 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 581 
                                                      OpDecorate vs_TEXCOORD3 Location 675 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 677 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                        f32_4 %16 = OpConstantComposite %14 %15 %14 %15 
                                              %18 = OpTypeBool 
                                              %19 = OpTypeVector %18 4 
                                              %20 = OpTypePointer Private %19 
                              Private bool_4* %21 = OpVariable Private 
                               Private f32_4* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %18 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                              %37 = OpTypePointer Private %6 
                                          u32 %39 = OpConstant 1 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          u32 %46 = OpConstant 2 
                                          u32 %51 = OpConstant 3 
                                              %56 = OpTypeVector %6 2 
                                              %76 = OpTypePointer Private %56 
                               Private f32_2* %77 = OpVariable Private 
                                        f32_2 %80 = OpConstantComposite %14 %14 
                                        f32_2 %87 = OpConstantComposite %42 %42 
                                 Input f32_4* %89 = OpVariable Input 
                                              %90 = OpTypePointer Input %6 
                                          f32 %93 = OpConstant 3.674022E-40 
                               Private f32_2* %99 = OpVariable Private 
                                Input f32_4* %100 = OpVariable Input 
                                         f32 %110 = OpConstant 3.674022E-40 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_2 %129 = OpConstantComposite %128 %128 
                                         u32 %135 = OpConstant 4 
                                             %136 = OpTypeArray %7 %135 
                                             %137 = OpTypeArray %7 %135 
                                             %138 = OpTypeStruct %136 %137 %7 %7 %7 %7 
                                             %139 = OpTypePointer Uniform %138 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %140 = OpVariable Uniform 
                                             %141 = OpTypeInt 32 1 
                                         i32 %142 = OpConstant 4 
                                             %143 = OpTypePointer Uniform %7 
                              Private f32_4* %150 = OpVariable Private 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_4 %154 = OpConstantComposite %128 %128 %128 %153 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_2 %159 = OpConstantComposite %128 %158 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                                         f32 %183 = OpConstant 3.674022E-40 
                                Input f32_4* %186 = OpVariable Input 
                              Private f32_4* %195 = OpVariable Private 
                                             %210 = OpTypePointer Input %56 
                                Input f32_2* %211 = OpVariable Input 
                              Private f32_2* %215 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_2* %237 = OpVariable Private 
                                         f32 %241 = OpConstant 3.674022E-40 
                                       f32_2 %242 = OpConstantComposite %241 %241 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %247 
                             Private bool_4* %264 = OpVariable Private 
                                         f32 %267 = OpConstant 3.674022E-40 
                                         f32 %268 = OpConstant 3.674022E-40 
                                         f32 %269 = OpConstant 3.674022E-40 
                                         f32 %270 = OpConstant 3.674022E-40 
                                       f32_4 %271 = OpConstantComposite %267 %268 %269 %270 
                                             %273 = OpTypePointer Function %7 
                                             %278 = OpTypePointer Function %6 
                                         f32 %310 = OpConstant 3.674022E-40 
                                       f32_2 %311 = OpConstantComposite %310 %310 
                                         f32 %317 = OpConstant 3.674022E-40 
                                       f32_2 %318 = OpConstantComposite %317 %317 
                                         f32 %324 = OpConstant 3.674022E-40 
                                       f32_2 %325 = OpConstantComposite %324 %324 
                              Private f32_2* %329 = OpVariable Private 
                             Private bool_4* %334 = OpVariable Private 
                                         f32 %337 = OpConstant 3.674022E-40 
                                         f32 %338 = OpConstant 3.674022E-40 
                                         f32 %339 = OpConstant 3.674022E-40 
                                         f32 %340 = OpConstant 3.674022E-40 
                                       f32_4 %341 = OpConstantComposite %337 %338 %339 %340 
                               Private bool* %343 = OpVariable Private 
                                             %362 = OpTypePointer Function %56 
                                       f32_2 %368 = OpConstantComposite %183 %183 
                              Private f32_4* %373 = OpVariable Private 
                                         i32 %376 = OpConstant 0 
                                         i32 %377 = OpConstant 1 
                                             %388 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         i32 %393 = OpConstant 2 
                                         i32 %402 = OpConstant 3 
                                             %425 = OpTypeArray %6 %39 
                                             %426 = OpTypeStruct %7 %6 %425 
                                             %427 = OpTypePointer Output %426 
        Output struct {f32_4; f32; f32[1];}* %428 = OpVariable Output 
                               Output f32_4* %445 = OpVariable Output 
                                Input f32_4* %448 = OpVariable Input 
                                             %452 = OpTypePointer Output %6 
                                             %454 = OpTypeVector %6 3 
                                         f32 %457 = OpConstant 3.674022E-40 
                                       f32_3 %458 = OpConstantComposite %457 %457 %457 
                                         f32 %460 = OpConstant 3.674022E-40 
                                       f32_3 %461 = OpConstantComposite %460 %460 %460 
                                         f32 %470 = OpConstant 3.674022E-40 
                                       f32_3 %471 = OpConstantComposite %470 %470 %470 
                                Private f32* %511 = OpVariable Private 
                                         f32 %514 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                Private f32* %522 = OpVariable Private 
                               Private bool* %528 = OpVariable Private 
                                         f32 %544 = OpConstant 3.674022E-40 
                                             %580 = OpTypePointer Output %454 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                         f32 %597 = OpConstant 3.674022E-40 
                                       f32_2 %598 = OpConstantComposite %597 %14 
                                       f32_2 %603 = OpConstantComposite %14 %15 
                               Private bool* %607 = OpVariable Private 
                                       f32_2 %615 = OpConstantComposite %34 %42 
                                       f32_2 %616 = OpConstantComposite %35 %43 
                                             %617 = OpTypeVector %18 2 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %274 = OpVariable Function 
                               Function f32* %279 = OpVariable Function 
                               Function f32* %291 = OpVariable Function 
                             Function f32_2* %363 = OpVariable Function 
                             Function f32_2* %532 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 0 0 2 2 
                                        f32_4 %17 = OpFMul %13 %16 
                                                      OpStore %9 %17 
                                        f32_4 %22 = OpLoad %9 
                                        f32_4 %23 = OpVectorShuffle %22 %22 1 1 3 3 
                                        f32_4 %24 = OpLoad %9 
                                        f32_4 %25 = OpVectorShuffle %24 %24 1 1 3 3 
                                        f32_4 %26 = OpFNegate %25 
                                       bool_4 %27 = OpFOrdGreaterThanEqual %23 %26 
                                                      OpStore %21 %27 
                                Private bool* %32 = OpAccessChain %21 %30 
                                         bool %33 = OpLoad %32 
                                          f32 %36 = OpSelect %33 %34 %35 
                                 Private f32* %38 = OpAccessChain %28 %30 
                                                      OpStore %38 %36 
                                Private bool* %40 = OpAccessChain %21 %39 
                                         bool %41 = OpLoad %40 
                                          f32 %44 = OpSelect %41 %42 %43 
                                 Private f32* %45 = OpAccessChain %28 %39 
                                                      OpStore %45 %44 
                                Private bool* %47 = OpAccessChain %21 %46 
                                         bool %48 = OpLoad %47 
                                          f32 %49 = OpSelect %48 %34 %35 
                                 Private f32* %50 = OpAccessChain %28 %46 
                                                      OpStore %50 %49 
                                Private bool* %52 = OpAccessChain %21 %51 
                                         bool %53 = OpLoad %52 
                                          f32 %54 = OpSelect %53 %42 %43 
                                 Private f32* %55 = OpAccessChain %28 %51 
                                                      OpStore %55 %54 
                                        f32_4 %57 = OpLoad %9 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 2 
                                        f32_4 %59 = OpLoad %28 
                                        f32_2 %60 = OpVectorShuffle %59 %59 1 3 
                                        f32_2 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                      OpStore %9 %63 
                                        f32_4 %64 = OpLoad %9 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32_2 %66 = OpExtInst %1 10 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 2 3 
                                                      OpStore %9 %68 
                                        f32_4 %69 = OpLoad %9 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_4 %71 = OpLoad %28 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                                        f32_2 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 3 
                                                      OpStore %9 %75 
                                        f32_4 %78 = OpLoad %11 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 2 
                                        f32_2 %81 = OpFMul %79 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_2 %84 = OpFNegate %83 
                                        f32_2 %85 = OpFAdd %81 %84 
                                                      OpStore %77 %85 
                                        f32_2 %86 = OpLoad %77 
                                        f32_2 %88 = OpFMul %86 %87 
                                                      OpStore %77 %88 
                                   Input f32* %91 = OpAccessChain %89 %39 
                                          f32 %92 = OpLoad %91 
                                          f32 %94 = OpFMul %92 %93 
                                 Private f32* %95 = OpAccessChain %77 %30 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFAdd %94 %96 
                                 Private f32* %98 = OpAccessChain %77 %30 
                                                      OpStore %98 %97 
                                  Input f32* %101 = OpAccessChain %100 %39 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %102 %93 
                                Private f32* %104 = OpAccessChain %77 %39 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %103 %105 
                                Private f32* %107 = OpAccessChain %99 %39 
                                                      OpStore %107 %106 
                                Private f32* %108 = OpAccessChain %77 %30 
                                         f32 %109 = OpLoad %108 
                                         f32 %111 = OpFMul %109 %110 
                                Private f32* %112 = OpAccessChain %28 %39 
                                                      OpStore %112 %111 
                                  Input f32* %113 = OpAccessChain %89 %30 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %114 %15 
                                Private f32* %116 = OpAccessChain %9 %30 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %28 %30 
                                                      OpStore %119 %118 
                                  Input f32* %120 = OpAccessChain %100 %30 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFMul %121 %15 
                                Private f32* %123 = OpAccessChain %9 %39 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFAdd %122 %124 
                                Private f32* %126 = OpAccessChain %99 %30 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %99 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                              Uniform f32_4* %144 = OpAccessChain %140 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %134 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 0 1 4 5 
                                                      OpStore %9 %149 
                                       f32_4 %151 = OpLoad %28 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 1 0 1 
                                       f32_4 %155 = OpFAdd %152 %154 
                                                      OpStore %150 %155 
                                       f32_4 %156 = OpLoad %28 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %28 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %28 %162 
                                       f32_4 %163 = OpLoad %28 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                              Uniform f32_4* %165 = OpAccessChain %140 %142 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %164 %167 
                                       f32_4 %169 = OpLoad %28 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %28 %170 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad %28 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %184 = OpImageSampleExplicitLod %180 %182 Lod %7 
                                                      OpStore %28 %184 
                                       f32_4 %185 = OpLoad %28 
                                       f32_4 %187 = OpLoad %186 
                                         f32 %188 = OpDot %185 %187 
                                Private f32* %189 = OpAccessChain %28 %30 
                                                      OpStore %189 %188 
                                       f32_4 %190 = OpLoad %150 
                              Uniform f32_4* %191 = OpAccessChain %140 %142 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 1 0 1 
                                       f32_4 %194 = OpFMul %190 %193 
                                                      OpStore %150 %194 
                         read_only Texture2D %196 = OpLoad %173 
                                     sampler %197 = OpLoad %177 
                  read_only Texture2DSampled %198 = OpSampledImage %196 %197 
                                       f32_4 %199 = OpLoad %150 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                       f32_4 %201 = OpImageSampleExplicitLod %198 %200 Lod %7 
                                                      OpStore %195 %201 
                         read_only Texture2D %202 = OpLoad %173 
                                     sampler %203 = OpLoad %177 
                  read_only Texture2DSampled %204 = OpSampledImage %202 %203 
                                       f32_4 %205 = OpLoad %150 
                                       f32_2 %206 = OpVectorShuffle %205 %205 2 3 
                                       f32_4 %207 = OpImageSampleExplicitLod %204 %206 Lod %7 
                                                      OpStore %150 %207 
                                       f32_4 %208 = OpLoad %195 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpLoad %211 
                                         f32 %213 = OpDot %209 %212 
                                Private f32* %214 = OpAccessChain %99 %30 
                                                      OpStore %214 %213 
                                       f32_4 %216 = OpLoad %195 
                                       f32_4 %217 = OpLoad %186 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %215 %30 
                                                      OpStore %219 %218 
                                       f32_4 %220 = OpLoad %150 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpLoad %211 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %99 %39 
                                                      OpStore %224 %223 
                                       f32_4 %225 = OpLoad %150 
                                       f32_4 %226 = OpLoad %186 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %215 %39 
                                                      OpStore %228 %227 
                                       f32_2 %229 = OpLoad %99 
                              Uniform f32_4* %231 = OpAccessChain %140 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
                                       f32_2 %234 = OpFMul %229 %233 
                                       f32_4 %235 = OpLoad %150 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
                                                      OpStore %150 %236 
                                       f32_4 %238 = OpLoad %150 
                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
                                       f32_2 %240 = OpExtInst %1 4 %239 
                                       f32_2 %243 = OpFAdd %240 %242 
                                                      OpStore %237 %243 
                                       f32_4 %244 = OpLoad %150 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpExtInst %1 4 %245 
                                       f32_2 %249 = OpExtInst %1 40 %246 %248 
                                       f32_4 %250 = OpLoad %150 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %150 %251 
                                       f32_4 %252 = OpLoad %150 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpExtInst %1 2 %253 
                                       f32_4 %255 = OpLoad %195 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                                      OpStore %195 %256 
                                       f32_4 %257 = OpLoad %150 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_4 %259 = OpLoad %195 
                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
                                       f32_2 %261 = OpExtInst %1 40 %258 %260 
                                       f32_4 %262 = OpLoad %150 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                      OpStore %150 %263 
                                       f32_4 %265 = OpLoad %11 
                                       f32_4 %266 = OpVectorShuffle %265 %265 3 3 3 3 
                                      bool_4 %272 = OpFOrdEqual %266 %271 
                                                      OpStore %264 %272 
                                       f32_4 %275 = OpLoad %150 
                                                      OpStore %274 %275 
                               Private bool* %276 = OpAccessChain %264 %51 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %277 %280 %284 
                                             %280 = OpLabel 
                                Private f32* %282 = OpAccessChain %150 %30 
                                         f32 %283 = OpLoad %282 
                                                      OpStore %279 %283 
                                                      OpBranch %281 
                                             %284 = OpLabel 
                                Private f32* %285 = OpAccessChain %195 %30 
                                         f32 %286 = OpLoad %285 
                                                      OpStore %279 %286 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                         f32 %287 = OpLoad %279 
                               Function f32* %288 = OpAccessChain %274 %30 
                                                      OpStore %288 %287 
                               Private bool* %289 = OpAccessChain %264 %46 
                                        bool %290 = OpLoad %289 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %290 %292 %296 
                                             %292 = OpLabel 
                                Private f32* %294 = OpAccessChain %150 %39 
                                         f32 %295 = OpLoad %294 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                Private f32* %297 = OpAccessChain %195 %39 
                                         f32 %298 = OpLoad %297 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                         f32 %299 = OpLoad %291 
                               Function f32* %300 = OpAccessChain %274 %39 
                                                      OpStore %300 %299 
                                       f32_4 %301 = OpLoad %274 
                                                      OpStore %150 %301 
                                       f32_4 %302 = OpLoad %150 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_2 %304 = OpLoad %237 
                                       f32_2 %305 = OpFDiv %303 %304 
                                       f32_4 %306 = OpLoad %150 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 2 3 
                                                      OpStore %150 %307 
                                       f32_4 %308 = OpLoad %150 
                                       f32_2 %309 = OpVectorShuffle %308 %308 0 1 
                                       f32_2 %312 = OpExtInst %1 40 %309 %311 
                                       f32_4 %313 = OpLoad %150 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 2 3 
                                                      OpStore %150 %314 
                                       f32_4 %315 = OpLoad %150 
                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
                                       f32_2 %319 = OpExtInst %1 37 %316 %318 
                                       f32_4 %320 = OpLoad %150 
                                       f32_4 %321 = OpVectorShuffle %320 %319 4 5 2 3 
                                                      OpStore %150 %321 
                                       f32_4 %322 = OpLoad %150 
                                       f32_2 %323 = OpVectorShuffle %322 %322 0 1 
                                       f32_2 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %150 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %150 %328 
                                       f32_2 %330 = OpLoad %99 
                                       f32_4 %331 = OpLoad %150 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %333 = OpFMul %330 %332 
                                                      OpStore %329 %333 
                                       f32_4 %335 = OpLoad %11 
                                       f32_4 %336 = OpVectorShuffle %335 %335 3 3 3 3 
                                      bool_4 %342 = OpFOrdEqual %336 %341 
                                                      OpStore %334 %342 
                               Private bool* %344 = OpAccessChain %264 %51 
                                        bool %345 = OpLoad %344 
                               Private bool* %346 = OpAccessChain %334 %30 
                                        bool %347 = OpLoad %346 
                                        bool %348 = OpLogicalOr %345 %347 
                                                      OpStore %343 %348 
                               Private bool* %349 = OpAccessChain %264 %46 
                                        bool %350 = OpLoad %349 
                                        bool %351 = OpLoad %343 
                                        bool %352 = OpLogicalOr %350 %351 
                                                      OpStore %343 %352 
                               Private bool* %353 = OpAccessChain %264 %39 
                                        bool %354 = OpLoad %353 
                                         f32 %355 = OpSelect %354 %247 %183 
                                Private f32* %356 = OpAccessChain %195 %30 
                                                      OpStore %356 %355 
                               Private bool* %357 = OpAccessChain %264 %30 
                                        bool %358 = OpLoad %357 
                                         f32 %359 = OpSelect %358 %247 %183 
                                Private f32* %360 = OpAccessChain %195 %39 
                                                      OpStore %360 %359 
                                        bool %361 = OpLoad %343 
                                                      OpSelectionMerge %365 None 
                                                      OpBranchConditional %361 %364 %367 
                                             %364 = OpLabel 
                                       f32_2 %366 = OpLoad %329 
                                                      OpStore %363 %366 
                                                      OpBranch %365 
                                             %367 = OpLabel 
                                                      OpStore %363 %368 
                                                      OpBranch %365 
                                             %365 = OpLabel 
                                       f32_2 %369 = OpLoad %363 
                                                      OpStore %329 %369 
                                       f32_2 %370 = OpLoad %329 
                                       f32_2 %371 = OpLoad %215 
                                       f32_2 %372 = OpFAdd %370 %371 
                                                      OpStore %329 %372 
                                       f32_2 %374 = OpLoad %329 
                                       f32_4 %375 = OpVectorShuffle %374 %374 1 1 1 1 
                              Uniform f32_4* %378 = OpAccessChain %140 %376 %377 
                                       f32_4 %379 = OpLoad %378 
                                       f32_4 %380 = OpFMul %375 %379 
                                                      OpStore %373 %380 
                              Uniform f32_4* %381 = OpAccessChain %140 %376 %376 
                                       f32_4 %382 = OpLoad %381 
                                       f32_2 %383 = OpLoad %329 
                                       f32_4 %384 = OpVectorShuffle %383 %383 0 0 0 0 
                                       f32_4 %385 = OpFMul %382 %384 
                                       f32_4 %386 = OpLoad %373 
                                       f32_4 %387 = OpFAdd %385 %386 
                                                      OpStore %373 %387 
                                       f32_2 %390 = OpLoad %329 
                                       f32_4 %391 = OpLoad vs_TEXCOORD0 
                                       f32_4 %392 = OpVectorShuffle %391 %390 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %392 
                              Uniform f32_4* %394 = OpAccessChain %140 %376 %393 
                                       f32_4 %395 = OpLoad %394 
                                       f32_4 %396 = OpLoad %28 
                                       f32_4 %397 = OpVectorShuffle %396 %396 0 0 0 0 
                                       f32_4 %398 = OpFMul %395 %397 
                                       f32_4 %399 = OpLoad %373 
                                       f32_4 %400 = OpFAdd %398 %399 
                                                      OpStore %28 %400 
                                       f32_4 %401 = OpLoad %28 
                              Uniform f32_4* %403 = OpAccessChain %140 %376 %402 
                                       f32_4 %404 = OpLoad %403 
                                       f32_4 %405 = OpFAdd %401 %404 
                                                      OpStore %28 %405 
                                       f32_4 %406 = OpLoad %28 
                                       f32_4 %407 = OpVectorShuffle %406 %406 1 1 1 1 
                              Uniform f32_4* %408 = OpAccessChain %140 %377 %377 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %410 = OpFMul %407 %409 
                                                      OpStore %373 %410 
                              Uniform f32_4* %411 = OpAccessChain %140 %377 %376 
                                       f32_4 %412 = OpLoad %411 
                                       f32_4 %413 = OpLoad %28 
                                       f32_4 %414 = OpVectorShuffle %413 %413 0 0 0 0 
                                       f32_4 %415 = OpFMul %412 %414 
                                       f32_4 %416 = OpLoad %373 
                                       f32_4 %417 = OpFAdd %415 %416 
                                                      OpStore %373 %417 
                              Uniform f32_4* %418 = OpAccessChain %140 %377 %393 
                                       f32_4 %419 = OpLoad %418 
                                       f32_4 %420 = OpLoad %28 
                                       f32_4 %421 = OpVectorShuffle %420 %420 2 2 2 2 
                                       f32_4 %422 = OpFMul %419 %421 
                                       f32_4 %423 = OpLoad %373 
                                       f32_4 %424 = OpFAdd %422 %423 
                                                      OpStore %373 %424 
                              Uniform f32_4* %429 = OpAccessChain %140 %377 %402 
                                       f32_4 %430 = OpLoad %429 
                                       f32_4 %431 = OpLoad %28 
                                       f32_4 %432 = OpVectorShuffle %431 %431 3 3 3 3 
                                       f32_4 %433 = OpFMul %430 %432 
                                       f32_4 %434 = OpLoad %373 
                                       f32_4 %435 = OpFAdd %433 %434 
                               Output f32_4* %436 = OpAccessChain %428 %376 
                                                      OpStore %436 %435 
                         read_only Texture2D %437 = OpLoad %173 
                                     sampler %438 = OpLoad %177 
                  read_only Texture2DSampled %439 = OpSampledImage %437 %438 
                                       f32_4 %440 = OpLoad %9 
                                       f32_2 %441 = OpVectorShuffle %440 %440 2 3 
                                       f32_4 %442 = OpImageSampleExplicitLod %439 %441 Lod %7 
                                         f32 %443 = OpCompositeExtract %442 3 
                                Private f32* %444 = OpAccessChain %28 %30 
                                                      OpStore %444 %443 
                                Private f32* %446 = OpAccessChain %28 %30 
                                         f32 %447 = OpLoad %446 
                                  Input f32* %449 = OpAccessChain %448 %51 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFMul %447 %450 
                                 Output f32* %453 = OpAccessChain %445 %51 
                                                      OpStore %453 %451 
                                       f32_4 %455 = OpLoad %448 
                                       f32_3 %456 = OpVectorShuffle %455 %455 0 1 2 
                                       f32_3 %459 = OpFMul %456 %458 
                                       f32_3 %462 = OpFAdd %459 %461 
                                       f32_4 %463 = OpLoad %28 
                                       f32_4 %464 = OpVectorShuffle %463 %462 4 5 6 3 
                                                      OpStore %28 %464 
                                       f32_4 %465 = OpLoad %448 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_4 %467 = OpLoad %28 
                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
                                       f32_3 %469 = OpFMul %466 %468 
                                       f32_3 %472 = OpFAdd %469 %471 
                                       f32_4 %473 = OpLoad %28 
                                       f32_4 %474 = OpVectorShuffle %473 %472 4 5 6 3 
                                                      OpStore %28 %474 
                                       f32_4 %475 = OpLoad %28 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_4 %477 = OpLoad %448 
                                       f32_3 %478 = OpVectorShuffle %477 %477 0 1 2 
                                       f32_3 %479 = OpFMul %476 %478 
                                       f32_4 %480 = OpLoad %445 
                                       f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
                                                      OpStore %445 %481 
                                       f32_2 %482 = OpLoad %211 
                              Uniform f32_4* %483 = OpAccessChain %140 %393 
                                       f32_4 %484 = OpLoad %483 
                                       f32_2 %485 = OpVectorShuffle %484 %484 0 1 
                                       f32_2 %486 = OpFMul %482 %485 
                              Uniform f32_4* %487 = OpAccessChain %140 %393 
                                       f32_4 %488 = OpLoad %487 
                                       f32_2 %489 = OpVectorShuffle %488 %488 2 3 
                                       f32_2 %490 = OpFAdd %486 %489 
                                       f32_4 %491 = OpLoad %28 
                                       f32_4 %492 = OpVectorShuffle %491 %490 4 5 2 3 
                                                      OpStore %28 %492 
                                       f32_4 %493 = OpLoad %28 
                                       f32_2 %494 = OpVectorShuffle %493 %493 0 1 
                              Uniform f32_4* %495 = OpAccessChain %140 %402 
                                       f32_4 %496 = OpLoad %495 
                                       f32_2 %497 = OpVectorShuffle %496 %496 0 1 
                                       f32_2 %498 = OpFMul %494 %497 
                                                      OpStore %99 %498 
                               Private bool* %499 = OpAccessChain %334 %39 
                                        bool %500 = OpLoad %499 
                                         f32 %501 = OpSelect %500 %247 %183 
                                Private f32* %502 = OpAccessChain %150 %30 
                                                      OpStore %502 %501 
                               Private bool* %503 = OpAccessChain %334 %46 
                                        bool %504 = OpLoad %503 
                                         f32 %505 = OpSelect %504 %247 %183 
                                Private f32* %506 = OpAccessChain %150 %39 
                                                      OpStore %506 %505 
                               Private bool* %507 = OpAccessChain %334 %51 
                                        bool %508 = OpLoad %507 
                                         f32 %509 = OpSelect %508 %247 %183 
                                Private f32* %510 = OpAccessChain %150 %46 
                                                      OpStore %510 %509 
                               Private bool* %512 = OpAccessChain %334 %51 
                                        bool %513 = OpLoad %512 
                                         f32 %515 = OpSelect %513 %324 %514 
                                                      OpStore %511 %515 
                                         f32 %517 = OpLoad %511 
                                Private f32* %518 = OpAccessChain %150 %39 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpFAdd %517 %519 
                                 Output f32* %521 = OpAccessChain vs_TEXCOORD1 %39 
                                                      OpStore %521 %520 
                                Private f32* %523 = OpAccessChain %150 %46 
                                         f32 %524 = OpLoad %523 
                                Private f32* %525 = OpAccessChain %150 %39 
                                         f32 %526 = OpLoad %525 
                                         f32 %527 = OpFAdd %524 %526 
                                                      OpStore %522 %527 
                                         f32 %529 = OpLoad %522 
                                        bool %530 = OpFOrdEqual %529 %247 
                                                      OpStore %528 %530 
                                        bool %531 = OpLoad %528 
                                                      OpSelectionMerge %534 None 
                                                      OpBranchConditional %531 %533 %536 
                                             %533 = OpLabel 
                                       f32_2 %535 = OpLoad %99 
                                                      OpStore %532 %535 
                                                      OpBranch %534 
                                             %536 = OpLabel 
                                       f32_4 %537 = OpLoad %28 
                                       f32_2 %538 = OpVectorShuffle %537 %537 0 1 
                                                      OpStore %532 %538 
                                                      OpBranch %534 
                                             %534 = OpLabel 
                                       f32_2 %539 = OpLoad %532 
                                       f32_4 %540 = OpLoad vs_TEXCOORD0 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %541 
                                  Input f32* %542 = OpAccessChain %11 %51 
                                         f32 %543 = OpLoad %542 
                                        bool %545 = OpFOrdEqual %543 %544 
                               Private bool* %546 = OpAccessChain %21 %30 
                                                      OpStore %546 %545 
                               Private bool* %547 = OpAccessChain %21 %30 
                                        bool %548 = OpLoad %547 
                                         f32 %549 = OpSelect %548 %247 %183 
                                Private f32* %550 = OpAccessChain %28 %30 
                                                      OpStore %550 %549 
                                         f32 %551 = OpLoad %522 
                                Private f32* %552 = OpAccessChain %28 %30 
                                         f32 %553 = OpLoad %552 
                                         f32 %554 = OpFAdd %551 %553 
                                Private f32* %555 = OpAccessChain %329 %30 
                                                      OpStore %555 %554 
                                Private f32* %556 = OpAccessChain %28 %30 
                                         f32 %557 = OpLoad %556 
                                 Output f32* %558 = OpAccessChain vs_TEXCOORD1 %30 
                                                      OpStore %558 %557 
                                Private f32* %559 = OpAccessChain %150 %30 
                                         f32 %560 = OpLoad %559 
                                Private f32* %561 = OpAccessChain %329 %30 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpFAdd %560 %562 
                                Private f32* %564 = OpAccessChain %28 %30 
                                                      OpStore %564 %563 
                                Private f32* %565 = OpAccessChain %150 %30 
                                         f32 %566 = OpLoad %565 
                                 Output f32* %567 = OpAccessChain vs_TEXCOORD1 %46 
                                                      OpStore %567 %566 
                                Private f32* %568 = OpAccessChain %195 %30 
                                         f32 %569 = OpLoad %568 
                                Private f32* %570 = OpAccessChain %28 %30 
                                         f32 %571 = OpLoad %570 
                                         f32 %572 = OpFAdd %569 %571 
                                Private f32* %573 = OpAccessChain %28 %30 
                                                      OpStore %573 %572 
                                Private f32* %574 = OpAccessChain %195 %39 
                                         f32 %575 = OpLoad %574 
                                Private f32* %576 = OpAccessChain %28 %30 
                                         f32 %577 = OpLoad %576 
                                         f32 %578 = OpFAdd %575 %577 
                                Private f32* %579 = OpAccessChain %28 %30 
                                                      OpStore %579 %578 
                                       f32_4 %582 = OpLoad %195 
                                       f32_2 %583 = OpVectorShuffle %582 %582 0 1 
                                       f32_3 %584 = OpLoad vs_TEXCOORD2 
                                       f32_3 %585 = OpVectorShuffle %584 %583 3 4 2 
                                                      OpStore vs_TEXCOORD2 %585 
                                Private f32* %586 = OpAccessChain %28 %30 
                                         f32 %587 = OpLoad %586 
                                         f32 %588 = OpExtInst %1 37 %587 %247 
                                Private f32* %589 = OpAccessChain %28 %30 
                                                      OpStore %589 %588 
                                Private f32* %590 = OpAccessChain %28 %30 
                                         f32 %591 = OpLoad %590 
                                         f32 %592 = OpFNegate %591 
                                         f32 %593 = OpFAdd %592 %247 
                                 Output f32* %594 = OpAccessChain vs_TEXCOORD1 %51 
                                                      OpStore %594 %593 
                                       f32_4 %595 = OpLoad %100 
                                       f32_2 %596 = OpVectorShuffle %595 %595 2 3 
                                         f32 %599 = OpDot %596 %598 
                                 Output f32* %600 = OpAccessChain vs_TEXCOORD2 %46 
                                                      OpStore %600 %599 
                                       f32_4 %601 = OpLoad %11 
                                       f32_2 %602 = OpVectorShuffle %601 %601 1 1 
                                       f32_2 %604 = OpFMul %602 %603 
                                       f32_4 %605 = OpLoad %28 
                                       f32_4 %606 = OpVectorShuffle %605 %604 4 5 2 3 
                                                      OpStore %28 %606 
                                Private f32* %608 = OpAccessChain %28 %39 
                                         f32 %609 = OpLoad %608 
                                Private f32* %610 = OpAccessChain %28 %39 
                                         f32 %611 = OpLoad %610 
                                         f32 %612 = OpFNegate %611 
                                        bool %613 = OpFOrdGreaterThanEqual %609 %612 
                                                      OpStore %607 %613 
                                        bool %614 = OpLoad %607 
                                      bool_2 %618 = OpCompositeConstruct %614 %614 
                                       f32_2 %619 = OpSelect %618 %615 %616 
                                                      OpStore %329 %619 
                                Private f32* %620 = OpAccessChain %329 %39 
                                         f32 %621 = OpLoad %620 
                                Private f32* %622 = OpAccessChain %28 %30 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpFMul %621 %623 
                                Private f32* %625 = OpAccessChain %28 %30 
                                                      OpStore %625 %624 
                                Private f32* %626 = OpAccessChain %28 %30 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpExtInst %1 10 %627 
                                Private f32* %629 = OpAccessChain %28 %30 
                                                      OpStore %629 %628 
                                Private f32* %630 = OpAccessChain %28 %30 
                                         f32 %631 = OpLoad %630 
                                Private f32* %632 = OpAccessChain %329 %30 
                                         f32 %633 = OpLoad %632 
                                         f32 %634 = OpFMul %631 %633 
                                Private f32* %635 = OpAccessChain %28 %30 
                                                      OpStore %635 %634 
                                  Input f32* %636 = OpAccessChain %11 %39 
                                         f32 %637 = OpLoad %636 
                                         f32 %638 = OpFMul %637 %14 
                                Private f32* %639 = OpAccessChain %28 %30 
                                         f32 %640 = OpLoad %639 
                                         f32 %641 = OpFNegate %640 
                                         f32 %642 = OpFAdd %638 %641 
                                Private f32* %643 = OpAccessChain %329 %30 
                                                      OpStore %643 %642 
                                  Input f32* %644 = OpAccessChain %89 %46 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFMul %645 %15 
                                Private f32* %647 = OpAccessChain %28 %30 
                                         f32 %648 = OpLoad %647 
                                         f32 %649 = OpFAdd %646 %648 
                                Private f32* %650 = OpAccessChain %150 %30 
                                                      OpStore %650 %649 
                                  Input f32* %651 = OpAccessChain %89 %51 
                                         f32 %652 = OpLoad %651 
                                         f32 %653 = OpFMul %652 %93 
                                Private f32* %654 = OpAccessChain %28 %30 
                                                      OpStore %654 %653 
                                Private f32* %655 = OpAccessChain %329 %30 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFMul %656 %42 
                                Private f32* %658 = OpAccessChain %28 %30 
                                         f32 %659 = OpLoad %658 
                                         f32 %660 = OpFAdd %657 %659 
                                Private f32* %661 = OpAccessChain %150 %39 
                                                      OpStore %661 %660 
                                       f32_4 %662 = OpLoad %150 
                                       f32_2 %663 = OpVectorShuffle %662 %662 0 1 
                                       f32_2 %664 = OpFAdd %663 %129 
                                       f32_4 %665 = OpLoad %28 
                                       f32_4 %666 = OpVectorShuffle %665 %664 4 5 2 3 
                                                      OpStore %28 %666 
                                       f32_4 %667 = OpLoad %28 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                              Uniform f32_4* %669 = OpAccessChain %140 %142 
                                       f32_4 %670 = OpLoad %669 
                                       f32_2 %671 = OpVectorShuffle %670 %670 0 1 
                                       f32_2 %672 = OpFMul %668 %671 
                                       f32_4 %673 = OpLoad %9 
                                       f32_4 %674 = OpVectorShuffle %673 %672 4 5 2 3 
                                                      OpStore %9 %674 
                                       f32_4 %676 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %676 
                         read_only Texture2D %678 = OpLoad %173 
                                     sampler %679 = OpLoad %177 
                  read_only Texture2DSampled %680 = OpSampledImage %678 %679 
                                       f32_4 %681 = OpLoad %9 
                                       f32_2 %682 = OpVectorShuffle %681 %681 0 1 
                                       f32_4 %683 = OpImageSampleExplicitLod %680 %682 Lod %7 
                                                      OpStore vs_TEXCOORD4 %683 
                                 Output f32* %684 = OpAccessChain %428 %376 %39 
                                         f32 %685 = OpLoad %684 
                                         f32 %686 = OpFNegate %685 
                                 Output f32* %687 = OpAccessChain %428 %376 %39 
                                                      OpStore %687 %686 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 737
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %30 %33 %155 %296 %731 %733 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD0 Location 30 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 33 
                                                      OpMemberDecorate %85 0 Offset 85 
                                                      OpMemberDecorate %85 1 Offset 85 
                                                      OpMemberDecorate %85 2 Offset 85 
                                                      OpMemberDecorate %85 3 Offset 85 
                                                      OpDecorate %85 Block 
                                                      OpDecorate %87 DescriptorSet 87 
                                                      OpDecorate %87 Binding 87 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 155 
                                                      OpDecorate %172 DescriptorSet 172 
                                                      OpDecorate %172 Binding 172 
                                                      OpDecorate %176 DescriptorSet 176 
                                                      OpDecorate %176 Binding 176 
                                                      OpDecorate %192 DescriptorSet 192 
                                                      OpDecorate %192 Binding 192 
                                                      OpDecorate %204 DescriptorSet 204 
                                                      OpDecorate %204 Binding 204 
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %280 DescriptorSet 280 
                                                      OpDecorate %280 Binding 280 
                                                      OpDecorate %282 DescriptorSet 282 
                                                      OpDecorate %282 Binding 282 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 296 
                                                      OpDecorate %341 DescriptorSet 341 
                                                      OpDecorate %341 Binding 341 
                                                      OpDecorate %343 DescriptorSet 343 
                                                      OpDecorate %343 Binding 343 
                                                      OpDecorate %731 Location 731 
                                                      OpDecorate %733 Location 733 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypeBool 
                                              %27 = OpTypeVector %26 4 
                                              %28 = OpTypePointer Private %27 
                              Private bool_4* %29 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                              %37 = OpTypeVector %26 2 
                                              %49 = OpTypePointer Private %7 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %51 = OpConstant 0 
                                              %52 = OpTypePointer Private %26 
                                          f32 %55 = OpConstant 3.674022E-40 
                                              %57 = OpTypePointer Private %6 
                                          u32 %59 = OpConstant 1 
                                          u32 %64 = OpConstant 2 
                                              %73 = OpTypeVector %6 2 
                                              %81 = OpTypePointer Private %37 
                              Private bool_2* %82 = OpVariable Private 
                                              %85 = OpTypeStruct %7 %7 %7 %7 
                                              %86 = OpTypePointer Uniform %85 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %87 = OpVariable Uniform 
                                              %88 = OpTypeInt 32 1 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                              %96 = OpTypePointer Private %73 
                               Private f32_2* %97 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_3 %137 = OpConstantComposite %15 %15 %136 
                                         i32 %146 = OpConstant 0 
                                         i32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant -1 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                Private f32* %164 = OpVariable Private 
                              Private f32_4* %169 = OpVariable Private 
                                             %170 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %171 = OpTypePointer UniformConstant %170 
        UniformConstant read_only Texture2D* %172 = OpVariable UniformConstant 
                                             %174 = OpTypeSampler 
                                             %175 = OpTypePointer UniformConstant %174 
                    UniformConstant sampler* %176 = OpVariable UniformConstant 
                                             %178 = OpTypeSampledImage %170 
                              Private f32_4* %190 = OpVariable Private 
                    UniformConstant sampler* %192 = OpVariable UniformConstant 
        UniformConstant read_only Texture2D* %204 = OpVariable UniformConstant 
                    UniformConstant sampler* %206 = OpVariable UniformConstant 
                                Private f32* %214 = OpVariable Private 
                                Private f32* %218 = OpVariable Private 
                                         f32 %229 = OpConstant 3.674022E-40 
                                         f32 %256 = OpConstant 3.674022E-40 
                                         f32 %258 = OpConstant 3.674022E-40 
        UniformConstant read_only Texture2D* %280 = OpVariable UniformConstant 
                    UniformConstant sampler* %282 = OpVariable UniformConstant 
                             Private bool_2* %294 = OpVariable Private 
                                             %295 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %299 = OpConstantComposite %15 %15 %55 %55 
                              Private f32_2* %326 = OpVariable Private 
                              Private f32_2* %332 = OpVariable Private 
                                         i32 %335 = OpConstant 2 
                              Private f32_4* %340 = OpVariable Private 
        UniformConstant read_only Texture2D* %341 = OpVariable UniformConstant 
                    UniformConstant sampler* %343 = OpVariable UniformConstant 
                               Private bool* %348 = OpVariable Private 
                                         f32 %354 = OpConstant 3.674022E-40 
                                       f32_2 %355 = OpConstantComposite %354 %354 
                                             %366 = OpTypePointer Private %12 
                              Private f32_3* %367 = OpVariable Private 
                                         f32 %375 = OpConstant 3.674022E-40 
                                       f32_2 %376 = OpConstantComposite %375 %375 
                                Private f32* %384 = OpVariable Private 
                              Private f32_2* %392 = OpVariable Private 
                                Private f32* %426 = OpVariable Private 
                               Private bool* %440 = OpVariable Private 
                                             %448 = OpTypePointer Function %6 
                               Private bool* %463 = OpVariable Private 
                                         f32 %464 = OpConstant 3.674022E-40 
                              Private f32_2* %488 = OpVariable Private 
                                             %501 = OpTypePointer Function %73 
                                Private f32* %512 = OpVariable Private 
                                         f32 %515 = OpConstant 3.674022E-40 
                                             %517 = OpTypePointer Private %88 
                                Private i32* %518 = OpVariable Private 
                             Private bool_2* %553 = OpVariable Private 
                                             %555 = OpTypeVector %88 4 
                                       i32_4 %557 = OpConstantComposite %147 %335 %146 %146 
                               Private bool* %594 = OpVariable Private 
                                Private f32* %601 = OpVariable Private 
                                             %633 = OpTypePointer Uniform %6 
                                         f32 %655 = OpConstant 3.674022E-40 
                                       f32_4 %656 = OpConstantComposite %515 %515 %655 %655 
                                       f32_2 %667 = OpConstantComposite %229 %229 
                                             %730 = OpTypePointer Output %7 
                               Output f32_4* %731 = OpVariable Output 
                                Input f32_4* %733 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_4* %314 = OpVariable Function 
                               Function f32* %449 = OpVariable Function 
                               Function f32* %481 = OpVariable Function 
                               Function f32* %490 = OpVariable Function 
                             Function f32_2* %502 = OpVariable Function 
                               Function f32* %533 = OpVariable Function 
                               Function f32* %545 = OpVariable Function 
                               Function f32* %580 = OpVariable Function 
                               Function f32* %607 = OpVariable Function 
                               Function f32* %619 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                        f32_4 %31 = OpLoad vs_TEXCOORD0 
                                        f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                        f32_4 %34 = OpLoad vs_TEXCOORD4 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                                       bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                                       bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                                       bool_4 %39 = OpLoad %29 
                                       bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                                      OpStore %29 %40 
                                        f32_4 %41 = OpLoad vs_TEXCOORD4 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                                       bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                                       bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                                       bool_4 %47 = OpLoad %29 
                                       bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                                      OpStore %29 %48 
                                Private bool* %53 = OpAccessChain %29 %51 
                                         bool %54 = OpLoad %53 
                                          f32 %56 = OpSelect %54 %15 %55 
                                 Private f32* %58 = OpAccessChain %50 %51 
                                                      OpStore %58 %56 
                                Private bool* %60 = OpAccessChain %29 %59 
                                         bool %61 = OpLoad %60 
                                          f32 %62 = OpSelect %61 %15 %55 
                                 Private f32* %63 = OpAccessChain %50 %59 
                                                      OpStore %63 %62 
                                Private bool* %65 = OpAccessChain %29 %64 
                                         bool %66 = OpLoad %65 
                                          f32 %67 = OpSelect %66 %15 %55 
                                 Private f32* %68 = OpAccessChain %50 %64 
                                                      OpStore %68 %67 
                                Private bool* %69 = OpAccessChain %29 %17 
                                         bool %70 = OpLoad %69 
                                          f32 %71 = OpSelect %70 %15 %55 
                                 Private f32* %72 = OpAccessChain %50 %17 
                                                      OpStore %72 %71 
                                        f32_4 %74 = OpLoad %50 
                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                        f32_4 %76 = OpLoad %50 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_2 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %50 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
                                                      OpStore %50 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 1 0 1 
                               Uniform f32_4* %91 = OpAccessChain %87 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpVectorShuffle %92 %92 0 1 0 1 
                                       bool_4 %94 = OpFOrdGreaterThanEqual %84 %93 
                                       bool_2 %95 = OpVectorShuffle %94 %94 0 1 
                                                      OpStore %82 %95 
                                Private bool* %98 = OpAccessChain %82 %51 
                                         bool %99 = OpLoad %98 
                                         f32 %100 = OpSelect %99 %15 %55 
                                Private f32* %101 = OpAccessChain %97 %51 
                                                      OpStore %101 %100 
                               Private bool* %102 = OpAccessChain %82 %59 
                                        bool %103 = OpLoad %102 
                                         f32 %104 = OpSelect %103 %15 %55 
                                Private f32* %105 = OpAccessChain %97 %59 
                                                      OpStore %105 %104 
                                       f32_2 %106 = OpLoad %97 
                                       f32_4 %107 = OpLoad %50 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %50 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %50 %111 
                              Uniform f32_4* %112 = OpAccessChain %87 %89 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 3 2 3 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 1 0 1 
                                      bool_4 %117 = OpFOrdGreaterThanEqual %114 %116 
                                      bool_2 %118 = OpVectorShuffle %117 %117 0 1 
                                                      OpStore %82 %118 
                               Private bool* %119 = OpAccessChain %82 %51 
                                        bool %120 = OpLoad %119 
                                         f32 %121 = OpSelect %120 %15 %55 
                                Private f32* %122 = OpAccessChain %97 %51 
                                                      OpStore %122 %121 
                               Private bool* %123 = OpAccessChain %82 %59 
                                        bool %124 = OpLoad %123 
                                         f32 %125 = OpSelect %124 %15 %55 
                                Private f32* %126 = OpAccessChain %97 %59 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %97 
                                       f32_4 %128 = OpLoad %50 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %50 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %50 %132 
                                Private f32* %133 = OpAccessChain %50 %64 
                                                      OpStore %133 %15 
                                       f32_4 %134 = OpLoad %50 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                Private f32* %139 = OpAccessChain %50 %51 
                                                      OpStore %139 %138 
                                Private f32* %140 = OpAccessChain %50 %51 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdLessThan %141 %55 
                               Private bool* %143 = OpAccessChain %29 %51 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %29 %51 
                                        bool %145 = OpLoad %144 
                                         i32 %148 = OpSelect %145 %147 %146 
                                         i32 %150 = OpIMul %148 %149 
                                        bool %151 = OpINotEqual %150 %146 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %153 
                                             %152 = OpLabel 
                                                      OpKill
                                             %153 = OpLabel 
                                  Input f32* %156 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                Private f32* %159 = OpAccessChain %50 %51 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %50 %51 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 43 %161 %55 %15 
                                Private f32* %163 = OpAccessChain %50 %51 
                                                      OpStore %163 %162 
                                  Input f32* %165 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %166 = OpLoad %165 
                                                      OpStore %164 %166 
                                         f32 %167 = OpLoad %164 
                                         f32 %168 = OpExtInst %1 43 %167 %55 %15 
                                                      OpStore %164 %168 
                         read_only Texture2D %173 = OpLoad %172 
                                     sampler %177 = OpLoad %176 
                  read_only Texture2DSampled %179 = OpSampledImage %173 %177 
                                       f32_4 %180 = OpLoad vs_TEXCOORD0 
                                       f32_2 %181 = OpVectorShuffle %180 %180 0 1 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %169 %182 
                                       f32_4 %183 = OpLoad %169 
                                       f32_4 %184 = OpLoad %50 
                                       f32_4 %185 = OpVectorShuffle %184 %184 0 0 0 0 
                                       f32_4 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad vs_TEXCOORD1 
                                       f32_4 %188 = OpVectorShuffle %187 %187 3 3 3 3 
                                       f32_4 %189 = OpFAdd %186 %188 
                                                      OpStore %169 %189 
                         read_only Texture2D %191 = OpLoad %172 
                                     sampler %193 = OpLoad %192 
                  read_only Texture2DSampled %194 = OpSampledImage %191 %193 
                                       f32_4 %195 = OpLoad vs_TEXCOORD0 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_4 %197 = OpImageSampleImplicitLod %194 %196 
                                                      OpStore %190 %197 
                                       f32_4 %198 = OpLoad %190 
                                         f32 %199 = OpLoad %164 
                                       f32_4 %200 = OpCompositeConstruct %199 %199 %199 %199 
                                       f32_4 %201 = OpFMul %198 %200 
                                       f32_4 %202 = OpLoad %169 
                                       f32_4 %203 = OpFAdd %201 %202 
                                                      OpStore %50 %203 
                         read_only Texture2D %205 = OpLoad %204 
                                     sampler %207 = OpLoad %206 
                  read_only Texture2DSampled %208 = OpSampledImage %205 %207 
                                       f32_4 %209 = OpLoad vs_TEXCOORD0 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                       f32_4 %211 = OpImageSampleImplicitLod %208 %210 
                                         f32 %212 = OpCompositeExtract %211 3 
                                Private f32* %213 = OpAccessChain %169 %51 
                                                      OpStore %213 %212 
                                Private f32* %215 = OpAccessChain %169 %51 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpDPdx %216 
                                                      OpStore %214 %217 
                                Private f32* %219 = OpAccessChain %169 %51 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpDPdy %220 
                                                      OpStore %218 %221 
                                         f32 %222 = OpLoad %218 
                                         f32 %223 = OpExtInst %1 4 %222 
                                         f32 %224 = OpLoad %214 
                                         f32 %225 = OpExtInst %1 4 %224 
                                         f32 %226 = OpFAdd %223 %225 
                                                      OpStore %214 %226 
                                         f32 %227 = OpLoad %214 
                                         f32 %228 = OpFNegate %227 
                                         f32 %230 = OpFAdd %228 %229 
                                                      OpStore %218 %230 
                                         f32 %231 = OpLoad %214 
                                         f32 %232 = OpFAdd %231 %229 
                                Private f32* %233 = OpAccessChain %169 %59 
                                                      OpStore %233 %232 
                                         f32 %234 = OpLoad %218 
                                       f32_2 %235 = OpCompositeConstruct %234 %234 
                                       f32_2 %236 = OpFNegate %235 
                                       f32_4 %237 = OpLoad %169 
                                       f32_2 %238 = OpVectorShuffle %237 %237 0 1 
                                       f32_2 %239 = OpFAdd %236 %238 
                                       f32_4 %240 = OpLoad %169 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 2 3 
                                                      OpStore %169 %241 
                                Private f32* %242 = OpAccessChain %169 %59 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFDiv %15 %243 
                                                      OpStore %214 %244 
                                         f32 %245 = OpLoad %214 
                                Private f32* %246 = OpAccessChain %169 %51 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFMul %245 %247 
                                Private f32* %249 = OpAccessChain %169 %51 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %169 %51 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpExtInst %1 43 %251 %55 %15 
                                Private f32* %253 = OpAccessChain %169 %51 
                                                      OpStore %253 %252 
                                Private f32* %254 = OpAccessChain %169 %51 
                                         f32 %255 = OpLoad %254 
                                         f32 %257 = OpFMul %255 %256 
                                         f32 %259 = OpFAdd %257 %258 
                                                      OpStore %214 %259 
                                Private f32* %260 = OpAccessChain %169 %51 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %169 %51 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFMul %261 %263 
                                Private f32* %265 = OpAccessChain %169 %51 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %169 %51 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpLoad %214 
                                         f32 %269 = OpFMul %267 %268 
                                Private f32* %270 = OpAccessChain %169 %17 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %169 %51 
                                                      OpStore %271 %15 
                                Private f32* %272 = OpAccessChain %169 %59 
                                                      OpStore %272 %15 
                                Private f32* %273 = OpAccessChain %169 %64 
                                                      OpStore %273 %15 
                                       f32_4 %274 = OpLoad %169 
                                       f32_4 %275 = OpLoad vs_TEXCOORD1 
                                       f32_4 %276 = OpVectorShuffle %275 %275 0 0 0 0 
                                       f32_4 %277 = OpFMul %274 %276 
                                       f32_4 %278 = OpLoad %50 
                                       f32_4 %279 = OpFAdd %277 %278 
                                                      OpStore %50 %279 
                         read_only Texture2D %281 = OpLoad %280 
                                     sampler %283 = OpLoad %282 
                  read_only Texture2DSampled %284 = OpSampledImage %281 %283 
                                       f32_4 %285 = OpLoad vs_TEXCOORD0 
                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                                       f32_4 %287 = OpImageSampleImplicitLod %284 %286 
                                                      OpStore %169 %287 
                                       f32_4 %288 = OpLoad %169 
                                       f32_4 %289 = OpLoad vs_TEXCOORD1 
                                       f32_4 %290 = OpVectorShuffle %289 %289 2 2 2 2 
                                       f32_4 %291 = OpFMul %288 %290 
                                       f32_4 %292 = OpLoad %50 
                                       f32_4 %293 = OpFAdd %291 %292 
                                                      OpStore %50 %293 
                                       f32_3 %297 = OpLoad vs_TEXCOORD2 
                                       f32_4 %298 = OpVectorShuffle %297 %297 0 1 0 0 
                                      bool_4 %300 = OpFOrdEqual %298 %299 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %294 %301 
                               Private bool* %302 = OpAccessChain %294 %59 
                                        bool %303 = OpLoad %302 
                               Private bool* %304 = OpAccessChain %294 %51 
                                        bool %305 = OpLoad %304 
                                        bool %306 = OpLogicalOr %303 %305 
                               Private bool* %307 = OpAccessChain %294 %51 
                                                      OpStore %307 %306 
                               Private bool* %308 = OpAccessChain %294 %51 
                                        bool %309 = OpLoad %308 
                                                      OpSelectionMerge %311 None 
                                                      OpBranchConditional %309 %310 %311 
                                             %310 = OpLabel 
                               Private bool* %312 = OpAccessChain %294 %59 
                                        bool %313 = OpLoad %312 
                                                      OpSelectionMerge %316 None 
                                                      OpBranchConditional %313 %315 %320 
                                             %315 = OpLabel 
                              Uniform f32_4* %317 = OpAccessChain %87 %147 
                                       f32_4 %318 = OpLoad %317 
                                       f32_4 %319 = OpVectorShuffle %318 %318 0 1 0 1 
                                                      OpStore %314 %319 
                                                      OpBranch %316 
                                             %320 = OpLabel 
                              Uniform f32_4* %321 = OpAccessChain %87 %146 
                                       f32_4 %322 = OpLoad %321 
                                       f32_4 %323 = OpVectorShuffle %322 %322 0 1 0 1 
                                                      OpStore %314 %323 
                                                      OpBranch %316 
                                             %316 = OpLabel 
                                       f32_4 %324 = OpLoad %314 
                                                      OpStore %169 %324 
                                Private f32* %325 = OpAccessChain %190 %51 
                                                      OpStore %325 %229 
                                Private f32* %327 = OpAccessChain %326 %59 
                                                      OpStore %327 %55 
                                  Input f32* %328 = OpAccessChain vs_TEXCOORD2 %64 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpFAdd %329 %229 
                                Private f32* %331 = OpAccessChain %190 %59 
                                                      OpStore %331 %330 
                                       f32_4 %333 = OpLoad %190 
                                       f32_2 %334 = OpVectorShuffle %333 %333 0 1 
                              Uniform f32_4* %336 = OpAccessChain %87 %335 
                                       f32_4 %337 = OpLoad %336 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                       f32_2 %339 = OpFMul %334 %338 
                                                      OpStore %332 %339 
                         read_only Texture2D %342 = OpLoad %341 
                                     sampler %344 = OpLoad %343 
                  read_only Texture2DSampled %345 = OpSampledImage %342 %344 
                                       f32_2 %346 = OpLoad %332 
                                       f32_4 %347 = OpImageSampleImplicitLod %345 %346 
                                                      OpStore %340 %347 
                                Private f32* %349 = OpAccessChain %340 %51 
                                         f32 %350 = OpLoad %349 
                                        bool %351 = OpFOrdLessThan %55 %350 
                                                      OpStore %348 %351 
                                       f32_4 %352 = OpLoad %340 
                                       f32_2 %353 = OpVectorShuffle %352 %352 2 3 
                                       f32_2 %356 = OpFAdd %353 %355 
                                       f32_4 %357 = OpLoad %340 
                                       f32_4 %358 = OpVectorShuffle %357 %356 4 1 5 3 
                                                      OpStore %340 %358 
                                       f32_4 %359 = OpLoad %340 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad %340 
                                       f32_2 %362 = OpVectorShuffle %361 %361 0 2 
                                       f32_2 %363 = OpFAdd %360 %362 
                                       f32_4 %364 = OpLoad %340 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 1 5 3 
                                                      OpStore %340 %365 
                                       f32_4 %368 = OpLoad vs_TEXCOORD0 
                                       f32_2 %369 = OpVectorShuffle %368 %368 0 1 
                                       f32_2 %370 = OpFAdd %369 %355 
                                       f32_3 %371 = OpLoad %367 
                                       f32_3 %372 = OpVectorShuffle %371 %370 3 4 2 
                                                      OpStore %367 %372 
                                       f32_3 %373 = OpLoad %367 
                                       f32_2 %374 = OpVectorShuffle %373 %373 0 1 
                                       f32_2 %377 = OpFMul %374 %376 
                                       f32_4 %378 = OpLoad %340 
                                       f32_2 %379 = OpVectorShuffle %378 %378 0 2 
                                       f32_2 %380 = OpFNegate %379 
                                       f32_2 %381 = OpFAdd %377 %380 
                                       f32_3 %382 = OpLoad %367 
                                       f32_3 %383 = OpVectorShuffle %382 %381 3 4 2 
                                                      OpStore %367 %383 
                                       f32_3 %385 = OpLoad %367 
                                       f32_2 %386 = OpVectorShuffle %385 %385 0 1 
                                       f32_3 %387 = OpLoad %367 
                                       f32_2 %388 = OpVectorShuffle %387 %387 0 1 
                                         f32 %389 = OpDot %386 %388 
                                                      OpStore %384 %389 
                                         f32 %390 = OpLoad %384 
                                         f32 %391 = OpExtInst %1 32 %390 
                                                      OpStore %384 %391 
                                         f32 %393 = OpLoad %384 
                                       f32_2 %394 = OpCompositeConstruct %393 %393 
                                       f32_3 %395 = OpLoad %367 
                                       f32_2 %396 = OpVectorShuffle %395 %395 0 1 
                                       f32_2 %397 = OpFMul %394 %396 
                                                      OpStore %392 %397 
                                       f32_4 %398 = OpLoad %340 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 2 
                                       f32_2 %400 = OpFNegate %399 
                                       f32_2 %401 = OpLoad %392 
                                         f32 %402 = OpDot %400 %401 
                                                      OpStore %384 %402 
                                       f32_4 %403 = OpLoad %340 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 2 
                                       f32_4 %405 = OpLoad %340 
                                       f32_2 %406 = OpVectorShuffle %405 %405 0 2 
                                         f32 %407 = OpDot %404 %406 
                                Private f32* %408 = OpAccessChain %340 %51 
                                                      OpStore %408 %407 
                                         f32 %409 = OpLoad %384 
                                         f32 %410 = OpFNegate %409 
                                         f32 %411 = OpLoad %384 
                                         f32 %412 = OpFMul %410 %411 
                                Private f32* %413 = OpAccessChain %340 %51 
                                         f32 %414 = OpLoad %413 
                                         f32 %415 = OpFAdd %412 %414 
                                Private f32* %416 = OpAccessChain %340 %51 
                                                      OpStore %416 %415 
                                Private f32* %417 = OpAccessChain %340 %51 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFNegate %418 
                                         f32 %420 = OpFAdd %419 %15 
                                Private f32* %421 = OpAccessChain %340 %51 
                                                      OpStore %421 %420 
                                Private f32* %422 = OpAccessChain %340 %51 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpExtInst %1 31 %423 
                                Private f32* %425 = OpAccessChain %340 %51 
                                                      OpStore %425 %424 
                                         f32 %427 = OpLoad %384 
                                Private f32* %428 = OpAccessChain %340 %51 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFNegate %429 
                                         f32 %431 = OpFAdd %427 %430 
                                                      OpStore %426 %431 
                                         f32 %432 = OpLoad %384 
                                Private f32* %433 = OpAccessChain %340 %51 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFAdd %432 %434 
                                                      OpStore %384 %435 
                                         f32 %436 = OpLoad %384 
                                         f32 %437 = OpLoad %426 
                                         f32 %438 = OpExtInst %1 37 %436 %437 
                                Private f32* %439 = OpAccessChain %340 %51 
                                                      OpStore %439 %438 
                                Private f32* %441 = OpAccessChain %340 %51 
                                         f32 %442 = OpLoad %441 
                                        bool %443 = OpFOrdLessThan %442 %55 
                                                      OpStore %440 %443 
                                         f32 %444 = OpLoad %384 
                                         f32 %445 = OpLoad %426 
                                         f32 %446 = OpExtInst %1 40 %444 %445 
                                                      OpStore %384 %446 
                                        bool %447 = OpLoad %440 
                                                      OpSelectionMerge %451 None 
                                                      OpBranchConditional %447 %450 %453 
                                             %450 = OpLabel 
                                         f32 %452 = OpLoad %384 
                                                      OpStore %449 %452 
                                                      OpBranch %451 
                                             %453 = OpLabel 
                                Private f32* %454 = OpAccessChain %340 %51 
                                         f32 %455 = OpLoad %454 
                                                      OpStore %449 %455 
                                                      OpBranch %451 
                                             %451 = OpLabel 
                                         f32 %456 = OpLoad %449 
                                                      OpStore %384 %456 
                                         f32 %457 = OpLoad %384 
                                       f32_2 %458 = OpCompositeConstruct %457 %457 
                                       f32_2 %459 = OpLoad %392 
                                       f32_2 %460 = OpFMul %458 %459 
                                       f32_4 %461 = OpLoad %340 
                                       f32_4 %462 = OpVectorShuffle %461 %460 4 1 5 3 
                                                      OpStore %340 %462 
                                Private f32* %465 = OpAccessChain %340 %51 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpExtInst %1 4 %466 
                                        bool %468 = OpFOrdGreaterThanEqual %464 %467 
                                                      OpStore %463 %468 
                                Private f32* %469 = OpAccessChain %340 %64 
                                         f32 %470 = OpLoad %469 
                                         f32 %471 = OpExtInst %1 4 %470 
                                        bool %472 = OpFOrdLessThan %464 %471 
                                                      OpStore %440 %472 
                                       f32_3 %473 = OpLoad %367 
                                       f32_2 %474 = OpVectorShuffle %473 %473 0 1 
                                       f32_4 %475 = OpLoad %340 
                                       f32_2 %476 = OpVectorShuffle %475 %475 0 2 
                                       f32_2 %477 = OpFDiv %474 %476 
                                       f32_4 %478 = OpLoad %340 
                                       f32_4 %479 = OpVectorShuffle %478 %477 4 1 5 3 
                                                      OpStore %340 %479 
                                        bool %480 = OpLoad %440 
                                                      OpSelectionMerge %483 None 
                                                      OpBranchConditional %480 %482 %486 
                                             %482 = OpLabel 
                                Private f32* %484 = OpAccessChain %340 %64 
                                         f32 %485 = OpLoad %484 
                                                      OpStore %481 %485 
                                                      OpBranch %483 
                                             %486 = OpLabel 
                                                      OpStore %481 %55 
                                                      OpBranch %483 
                                             %483 = OpLabel 
                                         f32 %487 = OpLoad %481 
                                                      OpStore %426 %487 
                                        bool %489 = OpLoad %463 
                                                      OpSelectionMerge %492 None 
                                                      OpBranchConditional %489 %491 %494 
                                             %491 = OpLabel 
                                         f32 %493 = OpLoad %426 
                                                      OpStore %490 %493 
                                                      OpBranch %492 
                                             %494 = OpLabel 
                                Private f32* %495 = OpAccessChain %340 %51 
                                         f32 %496 = OpLoad %495 
                                                      OpStore %490 %496 
                                                      OpBranch %492 
                                             %492 = OpLabel 
                                         f32 %497 = OpLoad %490 
                                Private f32* %498 = OpAccessChain %488 %51 
                                                      OpStore %498 %497 
                                Private f32* %499 = OpAccessChain %488 %59 
                                                      OpStore %499 %55 
                                        bool %500 = OpLoad %348 
                                                      OpSelectionMerge %504 None 
                                                      OpBranchConditional %500 %503 %506 
                                             %503 = OpLabel 
                                       f32_2 %505 = OpLoad %488 
                                                      OpStore %502 %505 
                                                      OpBranch %504 
                                             %506 = OpLabel 
                                       f32_4 %507 = OpLoad vs_TEXCOORD0 
                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
                                                      OpStore %502 %508 
                                                      OpBranch %504 
                                             %504 = OpLabel 
                                       f32_2 %509 = OpLoad %502 
                                       f32_3 %510 = OpLoad %367 
                                       f32_3 %511 = OpVectorShuffle %510 %509 0 3 4 
                                                      OpStore %367 %511 
                                Private f32* %513 = OpAccessChain %340 %59 
                                         f32 %514 = OpLoad %513 
                                         f32 %516 = OpFMul %514 %515 
                                                      OpStore %512 %516 
                                         f32 %519 = OpLoad %512 
                                         i32 %520 = OpConvertFToS %519 
                                                      OpStore %518 %520 
                                Private f32* %521 = OpAccessChain %367 %59 
                                         f32 %522 = OpLoad %521 
                                Private f32* %523 = OpAccessChain %367 %59 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpFNegate %524 
                                        bool %526 = OpFOrdGreaterThanEqual %522 %525 
                                                      OpStore %463 %526 
                                Private f32* %527 = OpAccessChain %367 %59 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpExtInst %1 4 %528 
                                         f32 %530 = OpExtInst %1 10 %529 
                                Private f32* %531 = OpAccessChain %340 %51 
                                                      OpStore %531 %530 
                                        bool %532 = OpLoad %463 
                                                      OpSelectionMerge %535 None 
                                                      OpBranchConditional %532 %534 %538 
                                             %534 = OpLabel 
                                Private f32* %536 = OpAccessChain %340 %51 
                                         f32 %537 = OpLoad %536 
                                                      OpStore %533 %537 
                                                      OpBranch %535 
                                             %538 = OpLabel 
                                Private f32* %539 = OpAccessChain %340 %51 
                                         f32 %540 = OpLoad %539 
                                         f32 %541 = OpFNegate %540 
                                                      OpStore %533 %541 
                                                      OpBranch %535 
                                             %535 = OpLabel 
                                         f32 %542 = OpLoad %533 
                                                      OpStore %384 %542 
                                         i32 %543 = OpLoad %518 
                                        bool %544 = OpINotEqual %543 %146 
                                                      OpSelectionMerge %547 None 
                                                      OpBranchConditional %544 %546 %550 
                                             %546 = OpLabel 
                                Private f32* %548 = OpAccessChain %367 %59 
                                         f32 %549 = OpLoad %548 
                                                      OpStore %545 %549 
                                                      OpBranch %547 
                                             %550 = OpLabel 
                                         f32 %551 = OpLoad %384 
                                                      OpStore %545 %551 
                                                      OpBranch %547 
                                             %547 = OpLabel 
                                         f32 %552 = OpLoad %545 
                                                      OpStore %384 %552 
                                         i32 %554 = OpLoad %518 
                                       i32_4 %556 = OpCompositeConstruct %554 %554 %554 %554 
                                      bool_4 %558 = OpIEqual %556 %557 
                                      bool_2 %559 = OpVectorShuffle %558 %558 0 1 
                                                      OpStore %553 %559 
                                         f32 %560 = OpLoad %384 
                                                      OpStore %512 %560 
                                         f32 %561 = OpLoad %512 
                                         f32 %562 = OpExtInst %1 43 %561 %55 %15 
                                                      OpStore %512 %562 
                               Private bool* %563 = OpAccessChain %553 %51 
                                        bool %564 = OpLoad %563 
                                         f32 %565 = OpLoad %512 
                                         f32 %566 = OpLoad %384 
                                         f32 %567 = OpSelect %564 %565 %566 
                                                      OpStore %512 %567 
                                         f32 %568 = OpLoad %512 
                                         f32 %569 = OpFMul %568 %229 
                                                      OpStore %384 %569 
                                         f32 %570 = OpLoad %384 
                                         f32 %571 = OpLoad %384 
                                         f32 %572 = OpFNegate %571 
                                        bool %573 = OpFOrdGreaterThanEqual %570 %572 
                               Private bool* %574 = OpAccessChain %553 %51 
                                                      OpStore %574 %573 
                                         f32 %575 = OpLoad %384 
                                         f32 %576 = OpExtInst %1 4 %575 
                                         f32 %577 = OpExtInst %1 10 %576 
                                                      OpStore %384 %577 
                               Private bool* %578 = OpAccessChain %553 %51 
                                        bool %579 = OpLoad %578 
                                                      OpSelectionMerge %582 None 
                                                      OpBranchConditional %579 %581 %584 
                                             %581 = OpLabel 
                                         f32 %583 = OpLoad %384 
                                                      OpStore %580 %583 
                                                      OpBranch %582 
                                             %584 = OpLabel 
                                         f32 %585 = OpLoad %384 
                                         f32 %586 = OpFNegate %585 
                                                      OpStore %580 %586 
                                                      OpBranch %582 
                                             %582 = OpLabel 
                                         f32 %587 = OpLoad %580 
                                                      OpStore %384 %587 
                                         f32 %588 = OpLoad %384 
                                         f32 %589 = OpLoad %384 
                                         f32 %590 = OpFAdd %588 %589 
                                Private f32* %591 = OpAccessChain %340 %51 
                                                      OpStore %591 %590 
                                         f32 %592 = OpLoad %384 
                                        bool %593 = OpFOrdLessThan %229 %592 
                                                      OpStore %463 %593 
                                Private f32* %595 = OpAccessChain %340 %51 
                                         f32 %596 = OpLoad %595 
                                Private f32* %597 = OpAccessChain %340 %51 
                                         f32 %598 = OpLoad %597 
                                         f32 %599 = OpFNegate %598 
                                        bool %600 = OpFOrdGreaterThanEqual %596 %599 
                                                      OpStore %594 %600 
                                Private f32* %602 = OpAccessChain %340 %51 
                                         f32 %603 = OpLoad %602 
                                         f32 %604 = OpExtInst %1 4 %603 
                                         f32 %605 = OpExtInst %1 10 %604 
                                                      OpStore %601 %605 
                                        bool %606 = OpLoad %594 
                                                      OpSelectionMerge %609 None 
                                                      OpBranchConditional %606 %608 %611 
                                             %608 = OpLabel 
                                         f32 %610 = OpLoad %601 
                                                      OpStore %607 %610 
                                                      OpBranch %609 
                                             %611 = OpLabel 
                                         f32 %612 = OpLoad %601 
                                         f32 %613 = OpFNegate %612 
                                                      OpStore %607 %613 
                                                      OpBranch %609 
                                             %609 = OpLabel 
                                         f32 %614 = OpLoad %607 
                                                      OpStore %426 %614 
                                         f32 %615 = OpLoad %426 
                                         f32 %616 = OpFNegate %615 
                                         f32 %617 = OpFAdd %616 %15 
                                                      OpStore %426 %617 
                                        bool %618 = OpLoad %463 
                                                      OpSelectionMerge %621 None 
                                                      OpBranchConditional %618 %620 %623 
                                             %620 = OpLabel 
                                         f32 %622 = OpLoad %426 
                                                      OpStore %619 %622 
                                                      OpBranch %621 
                                             %623 = OpLabel 
                                Private f32* %624 = OpAccessChain %340 %51 
                                         f32 %625 = OpLoad %624 
                                                      OpStore %619 %625 
                                                      OpBranch %621 
                                             %621 = OpLabel 
                                         f32 %626 = OpLoad %619 
                                                      OpStore %384 %626 
                               Private bool* %627 = OpAccessChain %553 %59 
                                        bool %628 = OpLoad %627 
                                         f32 %629 = OpLoad %384 
                                         f32 %630 = OpLoad %512 
                                         f32 %631 = OpSelect %628 %629 %630 
                                Private f32* %632 = OpAccessChain %367 %51 
                                                      OpStore %632 %631 
                                Uniform f32* %634 = OpAccessChain %87 %335 %51 
                                         f32 %635 = OpLoad %634 
                                Private f32* %636 = OpAccessChain %326 %51 
                                                      OpStore %636 %635 
                                       f32_4 %637 = OpLoad %190 
                                       f32_2 %638 = OpVectorShuffle %637 %637 0 1 
                              Uniform f32_4* %639 = OpAccessChain %87 %335 
                                       f32_4 %640 = OpLoad %639 
                                       f32_2 %641 = OpVectorShuffle %640 %640 0 1 
                                       f32_2 %642 = OpFMul %638 %641 
                                       f32_2 %643 = OpLoad %326 
                                       f32_2 %644 = OpFAdd %642 %643 
                                       f32_4 %645 = OpLoad %190 
                                       f32_4 %646 = OpVectorShuffle %645 %644 4 5 2 3 
                                                      OpStore %190 %646 
                         read_only Texture2D %647 = OpLoad %341 
                                     sampler %648 = OpLoad %343 
                  read_only Texture2DSampled %649 = OpSampledImage %647 %648 
                                       f32_4 %650 = OpLoad %190 
                                       f32_2 %651 = OpVectorShuffle %650 %650 0 1 
                                       f32_4 %652 = OpImageSampleImplicitLod %649 %651 
                                                      OpStore %340 %652 
                                       f32_4 %653 = OpLoad %340 
                                       f32_4 %654 = OpVectorShuffle %653 %653 1 3 0 2 
                                       f32_4 %657 = OpFMul %654 %656 
                                                      OpStore %340 %657 
                                       f32_4 %658 = OpLoad %340 
                                       f32_2 %659 = OpVectorShuffle %658 %658 0 1 
                                       f32_4 %660 = OpLoad %340 
                                       f32_2 %661 = OpVectorShuffle %660 %660 2 3 
                                       f32_2 %662 = OpFAdd %659 %661 
                                       f32_4 %663 = OpLoad %190 
                                       f32_4 %664 = OpVectorShuffle %663 %662 4 5 2 3 
                                                      OpStore %190 %664 
                                       f32_4 %665 = OpLoad %190 
                                       f32_2 %666 = OpVectorShuffle %665 %665 0 1 
                                       f32_2 %668 = OpFAdd %666 %667 
                                       f32_4 %669 = OpLoad %340 
                                       f32_4 %670 = OpVectorShuffle %669 %668 4 5 2 3 
                                                      OpStore %340 %670 
                                       f32_2 %671 = OpLoad %326 
                                       f32_2 %672 = OpFMul %671 %376 
                                       f32_2 %673 = OpLoad %332 
                                       f32_2 %674 = OpFAdd %672 %673 
                                       f32_4 %675 = OpLoad %190 
                                       f32_4 %676 = OpVectorShuffle %675 %674 4 5 2 3 
                                                      OpStore %190 %676 
                         read_only Texture2D %677 = OpLoad %341 
                                     sampler %678 = OpLoad %343 
                  read_only Texture2DSampled %679 = OpSampledImage %677 %678 
                                       f32_4 %680 = OpLoad %190 
                                       f32_2 %681 = OpVectorShuffle %680 %680 0 1 
                                       f32_4 %682 = OpImageSampleImplicitLod %679 %681 
                                                      OpStore %190 %682 
                                       f32_4 %683 = OpLoad %190 
                                       f32_4 %684 = OpVectorShuffle %683 %683 1 3 0 2 
                                       f32_4 %685 = OpFMul %684 %656 
                                                      OpStore %190 %685 
                                       f32_4 %686 = OpLoad %190 
                                       f32_2 %687 = OpVectorShuffle %686 %686 0 1 
                                       f32_4 %688 = OpLoad %190 
                                       f32_2 %689 = OpVectorShuffle %688 %688 2 3 
                                       f32_2 %690 = OpFAdd %687 %689 
                                       f32_4 %691 = OpLoad %340 
                                       f32_4 %692 = OpVectorShuffle %691 %690 0 1 4 5 
                                                      OpStore %340 %692 
                                       f32_4 %693 = OpLoad %169 
                                       f32_4 %694 = OpLoad %340 
                                       f32_4 %695 = OpFMul %693 %694 
                                                      OpStore %169 %695 
                                       f32_3 %696 = OpLoad %367 
                                       f32_2 %697 = OpVectorShuffle %696 %696 0 2 
                                       f32_4 %698 = OpLoad %169 
                                       f32_2 %699 = OpVectorShuffle %698 %698 2 3 
                                       f32_2 %700 = OpFMul %697 %699 
                                       f32_4 %701 = OpLoad %169 
                                       f32_2 %702 = OpVectorShuffle %701 %701 0 1 
                                       f32_2 %703 = OpFAdd %700 %702 
                                       f32_4 %704 = OpLoad %169 
                                       f32_4 %705 = OpVectorShuffle %704 %703 4 5 2 3 
                                                      OpStore %169 %705 
                         read_only Texture2D %706 = OpLoad %172 
                                     sampler %707 = OpLoad %192 
                  read_only Texture2DSampled %708 = OpSampledImage %706 %707 
                                       f32_4 %709 = OpLoad %169 
                                       f32_2 %710 = OpVectorShuffle %709 %709 0 1 
                                       f32_4 %711 = OpImageSampleImplicitLod %708 %710 
                                                      OpStore %190 %711 
                                       f32_4 %712 = OpLoad %190 
                                       f32_3 %713 = OpLoad vs_TEXCOORD2 
                                       f32_4 %714 = OpVectorShuffle %713 %713 0 0 0 0 
                                       f32_4 %715 = OpFMul %712 %714 
                                       f32_4 %716 = OpLoad %50 
                                       f32_4 %717 = OpFAdd %715 %716 
                                                      OpStore %190 %717 
                         read_only Texture2D %718 = OpLoad %280 
                                     sampler %719 = OpLoad %282 
                  read_only Texture2DSampled %720 = OpSampledImage %718 %719 
                                       f32_4 %721 = OpLoad %169 
                                       f32_2 %722 = OpVectorShuffle %721 %721 0 1 
                                       f32_4 %723 = OpImageSampleImplicitLod %720 %722 
                                                      OpStore %169 %723 
                                       f32_4 %724 = OpLoad %169 
                                       f32_3 %725 = OpLoad vs_TEXCOORD2 
                                       f32_4 %726 = OpVectorShuffle %725 %725 1 1 1 1 
                                       f32_4 %727 = OpFMul %724 %726 
                                       f32_4 %728 = OpLoad %190 
                                       f32_4 %729 = OpFAdd %727 %728 
                                                      OpStore %50 %729 
                                                      OpBranch %311 
                                             %311 = OpLabel 
                                       f32_4 %732 = OpLoad %50 
                                       f32_4 %734 = OpLoad %733 
                                       f32_4 %735 = OpFMul %732 %734 
                                                      OpStore %731 %735 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 98481
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec4 in_TEXCOORD2;
in  vec4 in_TEXCOORD3;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD0;
flat out vec4 vs_TEXCOORD1;
flat out vec3 vs_TEXCOORD2;
flat out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec3 u_xlat9;
float u_xlat12;
vec2 u_xlat13;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat13.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat13.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb3 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat9.x = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat9.y = u_xlatb3.z ? float(1.0) : 0.0;
    u_xlat9.z = u_xlatb3.w ? float(1.0) : 0.0;
;
    u_xlatb18 = in_TEXCOORD2.w==0.00392156886;
    u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat2.y = u_xlat9.z + u_xlat9.y;
    u_xlat18 = u_xlat2.y + u_xlat2.x;
    u_xlat18 = u_xlat9.x + u_xlat18;
    u_xlat18 = u_xlat13.x + u_xlat18;
    u_xlat18 = u_xlat13.y + u_xlat18;
    u_xlat18 = min(u_xlat18, 1.0);
    vs_TEXCOORD1.w = (-u_xlat18) + 1.0;
    u_xlatb18 = u_xlatb2.w || u_xlatb3.x;
    u_xlatb18 = u_xlatb2.z || u_xlatb18;
    if(u_xlatb18){
        u_xlat4.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat4.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat3.xz = u_xlat4.xy * _1PixelClipInvView.zw;
        u_xlat16.xy = max(abs(u_xlat3.xz), vec2(1.0, 1.0));
        u_xlat5.xy = roundEven(u_xlat16.xy);
        u_xlat16.xy = max(u_xlat16.xy, u_xlat5.xy);
        u_xlat14.x = (u_xlatb2.w) ? u_xlat16.x : u_xlat5.x;
        u_xlat14.y = (u_xlatb2.z) ? u_xlat16.y : u_xlat5.y;
        u_xlat3.xz = abs(u_xlat3.xz) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat14.xy = u_xlat14.xy / u_xlat3.xz;
        u_xlat14.xy = max(u_xlat14.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat14.xy = min(u_xlat14.xy, vec2(100.0, 100.0));
        u_xlat14.xy = u_xlat14.xy + vec2(-1.0, -1.0);
        u_xlat14.xy = u_xlat4.xy * u_xlat14.xy;
    } else {
        u_xlat14.x = float(0.0);
        u_xlat14.y = float(0.0);
    }
    u_xlat15.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat15.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat14.xy + u_xlat15.xy;
    u_xlat4 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatb14 = u_xlat2.y==1.0;
    u_xlat3.xz = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb14)) ? u_xlat3.xz : u_xlat0.xw;
    vs_TEXCOORD2.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    u_xlat3.xzw = in_COLOR0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xzw = in_COLOR0.xyz * u_xlat3.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    vs_COLOR0.xyz = u_xlat3.xzw * in_COLOR0.xyz;
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat6 = u_xlat0.z * u_xlat0.y;
    u_xlat6 = fract(u_xlat6);
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat6 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat12 = in_TEXCOORD3.y * 2040.0;
    u_xlat14.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat14.y = u_xlat6 * 0.03125 + u_xlat12;
    u_xlat0.xy = u_xlat14.xy + vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0.w = in_COLOR0.w;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD1.z = u_xlat9.x;
    vs_TEXCOORD1.xy = u_xlat2.xy;
    vs_TEXCOORD3.x = in_TEXCOORD2.y * 255.0;
    vs_TEXCOORD3.y = 0.0;
    vs_TEXCOORD2.xy = u_xlat13.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform  sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
UNITY_LOCATION(2) uniform  sampler2D _FontTex;
UNITY_LOCATION(3) uniform  sampler2D _CustomTex;
UNITY_LOCATION(4) uniform  sampler2D _GradientSettingsTex;
in  vec4 vs_COLOR0;
in  vec4 vs_TEXCOORD0;
flat in  vec4 vs_TEXCOORD1;
flat in  vec3 vs_TEXCOORD2;
flat in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat5;
bvec2 u_xlatb5;
vec3 u_xlat6;
float u_xlat9;
vec2 u_xlat13;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat17;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
bool u_xlatb26;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw);
    u_xlat0.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat2 = texture(_FontTex, vs_TEXCOORD0.xy);
    u_xlat2.x = dFdx(u_xlat2.w);
    u_xlat9 = dFdy(u_xlat2.w);
    u_xlat2.x = abs(u_xlat9) + abs(u_xlat2.x);
    u_xlat9 = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat2.x = (-u_xlat9) + u_xlat2.x;
    u_xlat9 = (-u_xlat9) + u_xlat2.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.w = u_xlat2.x * u_xlat9;
    u_xlat2.x = float(1.0);
    u_xlat2.y = float(1.0);
    u_xlat2.z = float(1.0);
    u_xlat1 = u_xlat2 * vs_TEXCOORD1.xxxx + u_xlat1;
    u_xlat2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat2 * vs_TEXCOORD1.zzzz + u_xlat1;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2 = (u_xlatb2.y) ? _CustomTex_TexelSize.xyxy : _MainTex_TexelSize.xyxy;
        u_xlat3.x = float(0.5);
        u_xlat17.y = float(0.0);
        u_xlat3.y = vs_TEXCOORD2.z + 0.5;
        u_xlat4.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat5 = texture(_GradientSettingsTex, u_xlat4.xy);
        u_xlatb18 = 0.0<u_xlat5.x;
        u_xlat5.xz = u_xlat5.zw + vec2(-0.5, -0.5);
        u_xlat5.xz = u_xlat5.xz + u_xlat5.xz;
        u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + (-u_xlat5.xz);
        u_xlat25 = dot(u_xlat6.xy, u_xlat6.xy);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat20.xy = vec2(u_xlat25) * u_xlat6.xy;
        u_xlat25 = dot((-u_xlat5.xz), u_xlat20.xy);
        u_xlat5.x = dot(u_xlat5.xz, u_xlat5.xz);
        u_xlat5.x = (-u_xlat25) * u_xlat25 + u_xlat5.x;
        u_xlat5.x = (-u_xlat5.x) + 1.0;
        u_xlat5.x = sqrt(u_xlat5.x);
        u_xlat19 = u_xlat25 + (-u_xlat5.x);
        u_xlat25 = u_xlat25 + u_xlat5.x;
        u_xlat5.x = min(u_xlat25, u_xlat19);
        u_xlatb26 = u_xlat5.x<0.0;
        u_xlat25 = max(u_xlat25, u_xlat19);
        u_xlat25 = (u_xlatb26) ? u_xlat25 : u_xlat5.x;
        u_xlat5.xz = vec2(u_xlat25) * u_xlat20.xy;
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat5.x);
        u_xlatb26 = 9.99999975e-05<abs(u_xlat5.z);
        u_xlat5.xz = u_xlat6.xy / u_xlat5.xz;
        u_xlat19 = u_xlatb26 ? u_xlat5.z : float(0.0);
        u_xlat13.x = (u_xlatb25) ? u_xlat19 : u_xlat5.x;
        u_xlat13.y = 0.0;
        u_xlat6.yz = (bool(u_xlatb18)) ? u_xlat13.xy : vs_TEXCOORD0.xy;
        u_xlat18 = u_xlat5.y * 255.0;
        u_xlati18 = int(u_xlat18);
        u_xlatb25 = u_xlat6.y>=(-u_xlat6.y);
        u_xlat5.x = fract(abs(u_xlat6.y));
        u_xlat25 = (u_xlatb25) ? u_xlat5.x : (-u_xlat5.x);
        u_xlat25 = (u_xlati18 != 0) ? u_xlat6.y : u_xlat25;
        u_xlatb5.xy = equal(ivec4(u_xlati18), ivec4(1, 2, 0, 0)).xy;
        u_xlat18 = u_xlat25;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat18 = (u_xlatb5.x) ? u_xlat18 : u_xlat25;
        u_xlat25 = u_xlat18 * 0.5;
        u_xlatb5.x = u_xlat25>=(-u_xlat25);
        u_xlat25 = fract(abs(u_xlat25));
        u_xlat25 = (u_xlatb5.x) ? u_xlat25 : (-u_xlat25);
        u_xlat5.x = u_xlat25 + u_xlat25;
        u_xlatb25 = 0.5<u_xlat25;
        u_xlatb19 = u_xlat5.x>=(-u_xlat5.x);
        u_xlat26 = fract(abs(u_xlat5.x));
        u_xlat19 = (u_xlatb19) ? u_xlat26 : (-u_xlat26);
        u_xlat19 = (-u_xlat19) + 1.0;
        u_xlat25 = (u_xlatb25) ? u_xlat19 : u_xlat5.x;
        u_xlat6.x = (u_xlatb5.y) ? u_xlat25 : u_xlat18;
        u_xlat17.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat3.xy * _GradientSettingsTex_TexelSize.xy + u_xlat17.xy;
        u_xlat5 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat5 = u_xlat5.ywxz * vec4(255.0, 255.0, 65025.0, 65025.0);
        u_xlat3.xy = u_xlat5.xy + u_xlat5.zw;
        u_xlat5.xy = u_xlat3.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat17.xy * vec2(2.0, 2.0) + u_xlat4.xy;
        u_xlat3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3 = u_xlat3.ywxz * vec4(255.0, 255.0, 65025.0, 65025.0);
        u_xlat5.zw = u_xlat3.xy + u_xlat3.zw;
        u_xlat2 = u_xlat2 * u_xlat5;
        u_xlat2.xy = u_xlat6.xz * u_xlat2.zw + u_xlat2.xy;
        u_xlat3 = texture(_MainTex, u_xlat2.xy);
        u_xlat3 = u_xlat3 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat2 * vs_TEXCOORD2.yyyy + u_xlat3;
    }
    u_xlat0.xyz = vs_COLOR0.xyz;
    SV_Target0 = u_xlat0 * u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 511
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %129 %163 %261 %330 %362 %377 %378 %385 %406 %476 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 129 
                                                      OpDecorate %149 ArrayStride 149 
                                                      OpDecorate %150 ArrayStride 150 
                                                      OpDecorate %152 ArrayStride 152 
                                                      OpMemberDecorate %153 0 Offset 153 
                                                      OpMemberDecorate %153 1 Offset 153 
                                                      OpMemberDecorate %153 2 Offset 153 
                                                      OpMemberDecorate %153 3 Offset 153 
                                                      OpMemberDecorate %153 4 Offset 153 
                                                      OpMemberDecorate %153 5 Offset 153 
                                                      OpMemberDecorate %153 6 Offset 153 
                                                      OpDecorate %153 Block 
                                                      OpDecorate %155 DescriptorSet 155 
                                                      OpDecorate %155 Binding 155 
                                                      OpDecorate %163 Location 163 
                                                      OpDecorate %261 Location 261 
                                                      OpMemberDecorate %328 0 BuiltIn 328 
                                                      OpMemberDecorate %328 1 BuiltIn 328 
                                                      OpMemberDecorate %328 2 BuiltIn 328 
                                                      OpDecorate %328 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 362 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 377 
                                                      OpDecorate %378 Location 378 
                                                      OpDecorate %385 Location 385 
                                                      OpDecorate %406 Location 406 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 476 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                          f32 %16 = OpConstant 3.674022E-40 
                                          f32 %17 = OpConstant 3.674022E-40 
                                        f32_3 %18 = OpConstantComposite %15 %16 %17 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypePointer Private %22 
                                 Private i32* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %31 = OpTypeVector %22 2 
                                              %32 = OpTypePointer Private %31 
                               Private i32_2* %33 = OpVariable Private 
                                          i32 %36 = OpConstant 1 
                                          i32 %37 = OpConstant 2 
                                        i32_2 %38 = OpConstantComposite %36 %37 
                                              %40 = OpTypeBool 
                                              %41 = OpTypeVector %40 4 
                                              %42 = OpTypePointer Private %41 
                              Private bool_4* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.674022E-40 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          f32 %49 = OpConstant 3.674022E-40 
                                        f32_4 %50 = OpConstantComposite %46 %47 %48 %49 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Private %52 
                               Private f32_2* %54 = OpVariable Private 
                                          u32 %55 = OpConstant 1 
                                              %56 = OpTypePointer Private %40 
                                          f32 %59 = OpConstant 3.674022E-40 
                                          f32 %60 = OpConstant 3.674022E-40 
                              Private bool_4* %67 = OpVariable Private 
                                          f32 %70 = OpConstant 3.674022E-40 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                        f32_4 %74 = OpConstantComposite %70 %71 %72 %73 
                                              %76 = OpTypePointer Private %12 
                               Private f32_3* %77 = OpVariable Private 
                                          u32 %82 = OpConstant 2 
                                          u32 %87 = OpConstant 3 
                                Private bool* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %6 
                                          f32 %96 = OpConstant 3.674022E-40 
                               Private f32_2* %98 = OpVariable Private 
                                Private f32* %108 = OpVariable Private 
                                             %128 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %133 = OpTypePointer Output %6 
                              Private f32_4* %147 = OpVariable Private 
                                         u32 %148 = OpConstant 4 
                                             %149 = OpTypeArray %7 %148 
                                             %150 = OpTypeArray %7 %148 
                                         u32 %151 = OpConstant 60 
                                             %152 = OpTypeArray %7 %151 
                                             %153 = OpTypeStruct %149 %150 %7 %7 %7 %7 %152 
                                             %154 = OpTypePointer Uniform %153 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[60];}* %155 = OpVariable Uniform 
                                         i32 %156 = OpConstant 6 
                                             %158 = OpTypePointer Uniform %7 
                                             %162 = OpTypePointer Input %52 
                                Input f32_2* %163 = OpVariable Input 
                              Private f32_4* %175 = OpVariable Private 
                                         i32 %178 = OpConstant 5 
                              Private f32_2* %185 = OpVariable Private 
                                       f32_2 %189 = OpConstantComposite %59 %59 
                              Private f32_4* %191 = OpVariable Private 
                              Private f32_2* %200 = OpVariable Private 
                                             %203 = OpTypePointer Function %6 
                                         f32 %229 = OpConstant 3.674022E-40 
                                       f32_2 %230 = OpConstantComposite %229 %229 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_2 %240 = OpConstantComposite %239 %239 
                                         f32 %243 = OpConstant 3.674022E-40 
                                       f32_2 %244 = OpConstantComposite %243 %243 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %247 
                              Private f32_2* %257 = OpVariable Private 
                                Input f32_4* %261 = OpVariable Input 
                              Private f32_2* %279 = OpVariable Private 
                                         i32 %285 = OpConstant 0 
                                         i32 %304 = OpConstant 3 
                                             %327 = OpTypeArray %6 %55 
                                             %328 = OpTypeStruct %7 %6 %327 
                                             %329 = OpTypePointer Output %328 
        Output struct {f32_4; f32; f32[1];}* %330 = OpVariable Output 
                               Private bool* %350 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %364 = OpTypePointer Function %52 
                                             %376 = OpTypePointer Output %12 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                Input f32_4* %378 = OpVariable Input 
                                         f32 %381 = OpConstant 3.674022E-40 
                                       f32_2 %382 = OpConstantComposite %381 %16 
                                Input f32_4* %385 = OpVariable Input 
                                         f32 %388 = OpConstant 3.674022E-40 
                                       f32_3 %389 = OpConstantComposite %388 %388 %388 
                                         f32 %391 = OpConstant 3.674022E-40 
                                       f32_3 %392 = OpConstantComposite %391 %391 %391 
                                         f32 %401 = OpConstant 3.674022E-40 
                                       f32_3 %402 = OpConstantComposite %401 %401 %401 
                               Output f32_4* %406 = OpVariable Output 
                               Private bool* %414 = OpVariable Private 
                                         f32 %422 = OpConstant 3.674022E-40 
                                         f32 %423 = OpConstant 3.674022E-40 
                                       f32_2 %424 = OpConstantComposite %422 %423 
                                         f32 %425 = OpConstant 3.674022E-40 
                                         f32 %426 = OpConstant 3.674022E-40 
                                       f32_2 %427 = OpConstantComposite %425 %426 
                                             %428 = OpTypeVector %40 2 
                                Private f32* %433 = OpVariable Private 
                                Private f32* %453 = OpVariable Private 
                                         f32 %456 = OpConstant 3.674022E-40 
                                         f32 %471 = OpConstant 3.674022E-40 
                                       f32_2 %472 = OpConstantComposite %471 %471 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %479 = OpConstant 4 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %204 = OpVariable Function 
                               Function f32* %216 = OpVariable Function 
                             Function f32_2* %365 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 2 2 
                                        f32_3 %19 = OpFMul %14 %18 
                                        f32_4 %20 = OpLoad %9 
                                        f32_4 %21 = OpVectorShuffle %20 %19 4 5 6 3 
                                                      OpStore %9 %21 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                          f32 %29 = OpLoad %28 
                                          i32 %30 = OpConvertFToS %29 
                                                      OpStore %24 %30 
                                          i32 %34 = OpLoad %24 
                                        i32_2 %35 = OpCompositeConstruct %34 %34 
                                        i32_2 %39 = OpIAdd %35 %38 
                                                      OpStore %33 %39 
                                        f32_4 %44 = OpLoad %11 
                                        f32_4 %45 = OpVectorShuffle %44 %44 3 3 3 3 
                                       bool_4 %51 = OpFOrdEqual %45 %50 
                                                      OpStore %43 %51 
                                Private bool* %57 = OpAccessChain %43 %55 
                                         bool %58 = OpLoad %57 
                                          f32 %61 = OpSelect %58 %59 %60 
                                 Private f32* %62 = OpAccessChain %54 %26 
                                                      OpStore %62 %61 
                                Private bool* %63 = OpAccessChain %43 %26 
                                         bool %64 = OpLoad %63 
                                          f32 %65 = OpSelect %64 %59 %60 
                                 Private f32* %66 = OpAccessChain %54 %55 
                                                      OpStore %66 %65 
                                        f32_4 %68 = OpLoad %11 
                                        f32_4 %69 = OpVectorShuffle %68 %68 3 3 3 3 
                                       bool_4 %75 = OpFOrdEqual %69 %74 
                                                      OpStore %67 %75 
                                Private bool* %78 = OpAccessChain %67 %55 
                                         bool %79 = OpLoad %78 
                                          f32 %80 = OpSelect %79 %59 %60 
                                 Private f32* %81 = OpAccessChain %77 %26 
                                                      OpStore %81 %80 
                                Private bool* %83 = OpAccessChain %67 %82 
                                         bool %84 = OpLoad %83 
                                          f32 %85 = OpSelect %84 %59 %60 
                                 Private f32* %86 = OpAccessChain %77 %55 
                                                      OpStore %86 %85 
                                Private bool* %88 = OpAccessChain %67 %87 
                                         bool %89 = OpLoad %88 
                                          f32 %90 = OpSelect %89 %59 %60 
                                 Private f32* %91 = OpAccessChain %77 %82 
                                                      OpStore %91 %90 
                                   Input f32* %94 = OpAccessChain %11 %87 
                                          f32 %95 = OpLoad %94 
                                         bool %97 = OpFOrdEqual %95 %96 
                                                      OpStore %92 %97 
                                         bool %99 = OpLoad %92 
                                         f32 %100 = OpSelect %99 %59 %60 
                                Private f32* %101 = OpAccessChain %98 %26 
                                                      OpStore %101 %100 
                                Private f32* %102 = OpAccessChain %77 %82 
                                         f32 %103 = OpLoad %102 
                                Private f32* %104 = OpAccessChain %77 %55 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %103 %105 
                                Private f32* %107 = OpAccessChain %98 %55 
                                                      OpStore %107 %106 
                                Private f32* %109 = OpAccessChain %98 %55 
                                         f32 %110 = OpLoad %109 
                                Private f32* %111 = OpAccessChain %98 %26 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFAdd %110 %112 
                                                      OpStore %108 %113 
                                Private f32* %114 = OpAccessChain %77 %26 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpLoad %108 
                                         f32 %117 = OpFAdd %115 %116 
                                                      OpStore %108 %117 
                                Private f32* %118 = OpAccessChain %54 %26 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %108 
                                         f32 %121 = OpFAdd %119 %120 
                                                      OpStore %108 %121 
                                Private f32* %122 = OpAccessChain %54 %55 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpLoad %108 
                                         f32 %125 = OpFAdd %123 %124 
                                                      OpStore %108 %125 
                                         f32 %126 = OpLoad %108 
                                         f32 %127 = OpExtInst %1 37 %126 %59 
                                                      OpStore %108 %127 
                                         f32 %130 = OpLoad %108 
                                         f32 %131 = OpFNegate %130 
                                         f32 %132 = OpFAdd %131 %59 
                                 Output f32* %134 = OpAccessChain vs_TEXCOORD1 %87 
                                                      OpStore %134 %132 
                               Private bool* %135 = OpAccessChain %43 %87 
                                        bool %136 = OpLoad %135 
                               Private bool* %137 = OpAccessChain %67 %26 
                                        bool %138 = OpLoad %137 
                                        bool %139 = OpLogicalOr %136 %138 
                                                      OpStore %92 %139 
                               Private bool* %140 = OpAccessChain %43 %82 
                                        bool %141 = OpLoad %140 
                                        bool %142 = OpLoad %92 
                                        bool %143 = OpLogicalOr %141 %142 
                                                      OpStore %92 %143 
                                        bool %144 = OpLoad %92 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %144 %145 %254 
                                             %145 = OpLabel 
                                         i32 %157 = OpLoad %24 
                              Uniform f32_4* %159 = OpAccessChain %155 %156 %157 
                                       f32_4 %160 = OpLoad %159 
                                       f32_2 %161 = OpVectorShuffle %160 %160 0 1 
                                       f32_2 %164 = OpLoad %163 
                                         f32 %165 = OpDot %161 %164 
                                Private f32* %166 = OpAccessChain %147 %26 
                                                      OpStore %166 %165 
                                Private i32* %167 = OpAccessChain %33 %26 
                                         i32 %168 = OpLoad %167 
                              Uniform f32_4* %169 = OpAccessChain %155 %156 %168 
                                       f32_4 %170 = OpLoad %169 
                                       f32_2 %171 = OpVectorShuffle %170 %170 0 1 
                                       f32_2 %172 = OpLoad %163 
                                         f32 %173 = OpDot %171 %172 
                                Private f32* %174 = OpAccessChain %147 %55 
                                                      OpStore %174 %173 
                                       f32_4 %176 = OpLoad %147 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                              Uniform f32_4* %179 = OpAccessChain %155 %178 
                                       f32_4 %180 = OpLoad %179 
                                       f32_2 %181 = OpVectorShuffle %180 %180 2 3 
                                       f32_2 %182 = OpFMul %177 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 1 5 3 
                                                      OpStore %175 %184 
                                       f32_4 %186 = OpLoad %175 
                                       f32_2 %187 = OpVectorShuffle %186 %186 0 2 
                                       f32_2 %188 = OpExtInst %1 4 %187 
                                       f32_2 %190 = OpExtInst %1 40 %188 %189 
                                                      OpStore %185 %190 
                                       f32_2 %192 = OpLoad %185 
                                       f32_2 %193 = OpExtInst %1 2 %192 
                                       f32_4 %194 = OpLoad %191 
                                       f32_4 %195 = OpVectorShuffle %194 %193 4 5 2 3 
                                                      OpStore %191 %195 
                                       f32_2 %196 = OpLoad %185 
                                       f32_4 %197 = OpLoad %191 
                                       f32_2 %198 = OpVectorShuffle %197 %197 0 1 
                                       f32_2 %199 = OpExtInst %1 40 %196 %198 
                                                      OpStore %185 %199 
                               Private bool* %201 = OpAccessChain %43 %87 
                                        bool %202 = OpLoad %201 
                                                      OpSelectionMerge %206 None 
                                                      OpBranchConditional %202 %205 %209 
                                             %205 = OpLabel 
                                Private f32* %207 = OpAccessChain %185 %26 
                                         f32 %208 = OpLoad %207 
                                                      OpStore %204 %208 
                                                      OpBranch %206 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %191 %26 
                                         f32 %211 = OpLoad %210 
                                                      OpStore %204 %211 
                                                      OpBranch %206 
                                             %206 = OpLabel 
                                         f32 %212 = OpLoad %204 
                                Private f32* %213 = OpAccessChain %200 %26 
                                                      OpStore %213 %212 
                               Private bool* %214 = OpAccessChain %43 %82 
                                        bool %215 = OpLoad %214 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %215 %217 %221 
                                             %217 = OpLabel 
                                Private f32* %219 = OpAccessChain %185 %55 
                                         f32 %220 = OpLoad %219 
                                                      OpStore %216 %220 
                                                      OpBranch %218 
                                             %221 = OpLabel 
                                Private f32* %222 = OpAccessChain %191 %55 
                                         f32 %223 = OpLoad %222 
                                                      OpStore %216 %223 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                         f32 %224 = OpLoad %216 
                                Private f32* %225 = OpAccessChain %200 %55 
                                                      OpStore %225 %224 
                                       f32_4 %226 = OpLoad %175 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 2 
                                       f32_2 %228 = OpExtInst %1 4 %227 
                                       f32_2 %231 = OpFAdd %228 %230 
                                       f32_4 %232 = OpLoad %175 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 1 5 3 
                                                      OpStore %175 %233 
                                       f32_2 %234 = OpLoad %200 
                                       f32_4 %235 = OpLoad %175 
                                       f32_2 %236 = OpVectorShuffle %235 %235 0 2 
                                       f32_2 %237 = OpFDiv %234 %236 
                                                      OpStore %200 %237 
                                       f32_2 %238 = OpLoad %200 
                                       f32_2 %241 = OpExtInst %1 40 %238 %240 
                                                      OpStore %200 %241 
                                       f32_2 %242 = OpLoad %200 
                                       f32_2 %245 = OpExtInst %1 37 %242 %244 
                                                      OpStore %200 %245 
                                       f32_2 %246 = OpLoad %200 
                                       f32_2 %249 = OpFAdd %246 %248 
                                                      OpStore %200 %249 
                                       f32_4 %250 = OpLoad %147 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                                       f32_2 %252 = OpLoad %200 
                                       f32_2 %253 = OpFMul %251 %252 
                                                      OpStore %200 %253 
                                                      OpBranch %146 
                                             %254 = OpLabel 
                                Private f32* %255 = OpAccessChain %200 %26 
                                                      OpStore %255 %60 
                                Private f32* %256 = OpAccessChain %200 %55 
                                                      OpStore %256 %60 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                         i32 %258 = OpLoad %24 
                              Uniform f32_4* %259 = OpAccessChain %155 %156 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_4 %262 = OpLoad %261 
                                         f32 %263 = OpDot %260 %262 
                                Private f32* %264 = OpAccessChain %257 %26 
                                                      OpStore %264 %263 
                                Private i32* %265 = OpAccessChain %33 %26 
                                         i32 %266 = OpLoad %265 
                              Uniform f32_4* %267 = OpAccessChain %155 %156 %266 
                                       f32_4 %268 = OpLoad %267 
                                       f32_4 %269 = OpLoad %261 
                                         f32 %270 = OpDot %268 %269 
                                Private f32* %271 = OpAccessChain %257 %55 
                                                      OpStore %271 %270 
                                Private i32* %272 = OpAccessChain %33 %55 
                                         i32 %273 = OpLoad %272 
                              Uniform f32_4* %274 = OpAccessChain %155 %156 %273 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpLoad %261 
                                         f32 %277 = OpDot %275 %276 
                                Private f32* %278 = OpAccessChain %9 %26 
                                                      OpStore %278 %277 
                                       f32_2 %280 = OpLoad %200 
                                       f32_2 %281 = OpLoad %257 
                                       f32_2 %282 = OpFAdd %280 %281 
                                                      OpStore %279 %282 
                                       f32_2 %283 = OpLoad %279 
                                       f32_4 %284 = OpVectorShuffle %283 %283 1 1 1 1 
                              Uniform f32_4* %286 = OpAccessChain %155 %285 %36 
                                       f32_4 %287 = OpLoad %286 
                                       f32_4 %288 = OpFMul %284 %287 
                                                      OpStore %147 %288 
                              Uniform f32_4* %289 = OpAccessChain %155 %285 %285 
                                       f32_4 %290 = OpLoad %289 
                                       f32_2 %291 = OpLoad %279 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %147 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %147 %295 
                              Uniform f32_4* %296 = OpAccessChain %155 %285 %37 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %298 0 0 0 0 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %147 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %147 %302 
                                       f32_4 %303 = OpLoad %147 
                              Uniform f32_4* %305 = OpAccessChain %155 %285 %304 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpFAdd %303 %306 
                                                      OpStore %147 %307 
                                       f32_4 %308 = OpLoad %147 
                                       f32_4 %309 = OpVectorShuffle %308 %308 1 1 1 1 
                              Uniform f32_4* %310 = OpAccessChain %155 %36 %36 
                                       f32_4 %311 = OpLoad %310 
                                       f32_4 %312 = OpFMul %309 %311 
                                                      OpStore %191 %312 
                              Uniform f32_4* %313 = OpAccessChain %155 %36 %285 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpLoad %147 
                                       f32_4 %316 = OpVectorShuffle %315 %315 0 0 0 0 
                                       f32_4 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %191 
                                       f32_4 %319 = OpFAdd %317 %318 
                                                      OpStore %191 %319 
                              Uniform f32_4* %320 = OpAccessChain %155 %36 %37 
                                       f32_4 %321 = OpLoad %320 
                                       f32_4 %322 = OpLoad %147 
                                       f32_4 %323 = OpVectorShuffle %322 %322 2 2 2 2 
                                       f32_4 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %191 
                                       f32_4 %326 = OpFAdd %324 %325 
                                                      OpStore %191 %326 
                              Uniform f32_4* %331 = OpAccessChain %155 %36 %304 
                                       f32_4 %332 = OpLoad %331 
                                       f32_4 %333 = OpLoad %147 
                                       f32_4 %334 = OpVectorShuffle %333 %333 3 3 3 3 
                                       f32_4 %335 = OpFMul %332 %334 
                                       f32_4 %336 = OpLoad %191 
                                       f32_4 %337 = OpFAdd %335 %336 
                               Output f32_4* %338 = OpAccessChain %330 %285 
                                                      OpStore %338 %337 
                                       f32_2 %339 = OpLoad %163 
                              Uniform f32_4* %340 = OpAccessChain %155 %37 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 1 
                                       f32_2 %343 = OpFMul %339 %342 
                              Uniform f32_4* %344 = OpAccessChain %155 %37 
                                       f32_4 %345 = OpLoad %344 
                                       f32_2 %346 = OpVectorShuffle %345 %345 2 3 
                                       f32_2 %347 = OpFAdd %343 %346 
                                       f32_4 %348 = OpLoad %9 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 1 2 5 
                                                      OpStore %9 %349 
                                Private f32* %351 = OpAccessChain %98 %55 
                                         f32 %352 = OpLoad %351 
                                        bool %353 = OpFOrdEqual %352 %59 
                                                      OpStore %350 %353 
                                       f32_4 %354 = OpLoad %9 
                                       f32_2 %355 = OpVectorShuffle %354 %354 0 3 
                              Uniform f32_4* %356 = OpAccessChain %155 %304 
                                       f32_4 %357 = OpLoad %356 
                                       f32_2 %358 = OpVectorShuffle %357 %357 0 1 
                                       f32_2 %359 = OpFMul %355 %358 
                                       f32_4 %360 = OpLoad %175 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 1 5 3 
                                                      OpStore %175 %361 
                                        bool %363 = OpLoad %350 
                                                      OpSelectionMerge %367 None 
                                                      OpBranchConditional %363 %366 %370 
                                             %366 = OpLabel 
                                       f32_4 %368 = OpLoad %175 
                                       f32_2 %369 = OpVectorShuffle %368 %368 0 2 
                                                      OpStore %365 %369 
                                                      OpBranch %367 
                                             %370 = OpLabel 
                                       f32_4 %371 = OpLoad %9 
                                       f32_2 %372 = OpVectorShuffle %371 %371 0 3 
                                                      OpStore %365 %372 
                                                      OpBranch %367 
                                             %367 = OpLabel 
                                       f32_2 %373 = OpLoad %365 
                                       f32_4 %374 = OpLoad vs_TEXCOORD0 
                                       f32_4 %375 = OpVectorShuffle %374 %373 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %375 
                                       f32_4 %379 = OpLoad %378 
                                       f32_2 %380 = OpVectorShuffle %379 %379 2 3 
                                         f32 %383 = OpDot %380 %382 
                                 Output f32* %384 = OpAccessChain vs_TEXCOORD2 %82 
                                                      OpStore %384 %383 
                                       f32_4 %386 = OpLoad %385 
                                       f32_3 %387 = OpVectorShuffle %386 %386 0 1 2 
                                       f32_3 %390 = OpFMul %387 %389 
                                       f32_3 %393 = OpFAdd %390 %392 
                                       f32_4 %394 = OpLoad %175 
                                       f32_4 %395 = OpVectorShuffle %394 %393 4 1 5 6 
                                                      OpStore %175 %395 
                                       f32_4 %396 = OpLoad %385 
                                       f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
                                       f32_4 %398 = OpLoad %175 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 2 3 
                                       f32_3 %400 = OpFMul %397 %399 
                                       f32_3 %403 = OpFAdd %400 %402 
                                       f32_4 %404 = OpLoad %175 
                                       f32_4 %405 = OpVectorShuffle %404 %403 4 1 5 6 
                                                      OpStore %175 %405 
                                       f32_4 %407 = OpLoad %175 
                                       f32_3 %408 = OpVectorShuffle %407 %407 0 2 3 
                                       f32_4 %409 = OpLoad %385 
                                       f32_3 %410 = OpVectorShuffle %409 %409 0 1 2 
                                       f32_3 %411 = OpFMul %408 %410 
                                       f32_4 %412 = OpLoad %406 
                                       f32_4 %413 = OpVectorShuffle %412 %411 4 5 6 3 
                                                      OpStore %406 %413 
                                Private f32* %415 = OpAccessChain %9 %82 
                                         f32 %416 = OpLoad %415 
                                Private f32* %417 = OpAccessChain %9 %82 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFNegate %418 
                                        bool %420 = OpFOrdGreaterThanEqual %416 %419 
                                                      OpStore %414 %420 
                                        bool %421 = OpLoad %414 
                                      bool_2 %429 = OpCompositeConstruct %421 %421 
                                       f32_2 %430 = OpSelect %429 %424 %427 
                                       f32_4 %431 = OpLoad %9 
                                       f32_4 %432 = OpVectorShuffle %431 %430 4 1 5 3 
                                                      OpStore %9 %432 
                                Private f32* %434 = OpAccessChain %9 %82 
                                         f32 %435 = OpLoad %434 
                                Private f32* %436 = OpAccessChain %9 %55 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpFMul %435 %437 
                                                      OpStore %433 %438 
                                         f32 %439 = OpLoad %433 
                                         f32 %440 = OpExtInst %1 10 %439 
                                                      OpStore %433 %440 
                                         f32 %441 = OpLoad %433 
                                Private f32* %442 = OpAccessChain %9 %26 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFMul %441 %443 
                                Private f32* %445 = OpAccessChain %9 %26 
                                                      OpStore %445 %444 
                                  Input f32* %446 = OpAccessChain %11 %82 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpFMul %447 %16 
                                Private f32* %449 = OpAccessChain %9 %26 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFNegate %450 
                                         f32 %452 = OpFAdd %448 %451 
                                                      OpStore %433 %452 
                                  Input f32* %454 = OpAccessChain %378 %55 
                                         f32 %455 = OpLoad %454 
                                         f32 %457 = OpFMul %455 %456 
                                                      OpStore %453 %457 
                                  Input f32* %458 = OpAccessChain %378 %26 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFMul %459 %17 
                                Private f32* %461 = OpAccessChain %9 %26 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFAdd %460 %462 
                                Private f32* %464 = OpAccessChain %200 %26 
                                                      OpStore %464 %463 
                                         f32 %465 = OpLoad %433 
                                         f32 %466 = OpFMul %465 %423 
                                         f32 %467 = OpLoad %453 
                                         f32 %468 = OpFAdd %466 %467 
                                Private f32* %469 = OpAccessChain %200 %55 
                                                      OpStore %469 %468 
                                       f32_2 %470 = OpLoad %200 
                                       f32_2 %473 = OpFAdd %470 %472 
                                       f32_4 %474 = OpLoad %9 
                                       f32_4 %475 = OpVectorShuffle %474 %473 4 5 2 3 
                                                      OpStore %9 %475 
                                       f32_4 %477 = OpLoad %9 
                                       f32_2 %478 = OpVectorShuffle %477 %477 0 1 
                              Uniform f32_4* %480 = OpAccessChain %155 %479 
                                       f32_4 %481 = OpLoad %480 
                                       f32_2 %482 = OpVectorShuffle %481 %481 0 1 
                                       f32_2 %483 = OpFMul %478 %482 
                                       f32_4 %484 = OpLoad vs_TEXCOORD3 
                                       f32_4 %485 = OpVectorShuffle %484 %483 0 1 4 5 
                                                      OpStore vs_TEXCOORD3 %485 
                                  Input f32* %486 = OpAccessChain %385 %87 
                                         f32 %487 = OpLoad %486 
                                 Output f32* %488 = OpAccessChain %406 %87 
                                                      OpStore %488 %487 
                                       f32_2 %489 = OpLoad %279 
                                       f32_4 %490 = OpLoad vs_TEXCOORD0 
                                       f32_4 %491 = OpVectorShuffle %490 %489 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %491 
                                Private f32* %492 = OpAccessChain %77 %26 
                                         f32 %493 = OpLoad %492 
                                 Output f32* %494 = OpAccessChain vs_TEXCOORD1 %82 
                                                      OpStore %494 %493 
                                       f32_2 %495 = OpLoad %98 
                                       f32_4 %496 = OpLoad vs_TEXCOORD1 
                                       f32_4 %497 = OpVectorShuffle %496 %495 4 5 2 3 
                                                      OpStore vs_TEXCOORD1 %497 
                                  Input f32* %498 = OpAccessChain %11 %55 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %499 %16 
                                 Output f32* %501 = OpAccessChain vs_TEXCOORD3 %26 
                                                      OpStore %501 %500 
                                 Output f32* %502 = OpAccessChain vs_TEXCOORD3 %55 
                                                      OpStore %502 %60 
                                       f32_2 %503 = OpLoad %54 
                                       f32_3 %504 = OpLoad vs_TEXCOORD2 
                                       f32_3 %505 = OpVectorShuffle %504 %503 3 4 2 
                                                      OpStore vs_TEXCOORD2 %505 
                                 Output f32* %506 = OpAccessChain %330 %285 %55 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFNegate %507 
                                 Output f32* %509 = OpAccessChain %330 %285 %55 
                                                      OpStore %509 %508 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 746
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %28 %37 %186 %201 %301 %741 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 28 
                                                      OpDecorate vs_TEXCOORD0 Location 37 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %171 DescriptorSet 171 
                                                      OpDecorate %171 Binding 171 
                                                      OpDecorate %175 DescriptorSet 175 
                                                      OpDecorate %175 Binding 175 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %192 DescriptorSet 192 
                                                      OpDecorate %192 Binding 192 
                                                      OpDecorate %194 DescriptorSet 194 
                                                      OpDecorate %194 Binding 194 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 201 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %285 DescriptorSet 285 
                                                      OpDecorate %285 Binding 285 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 301 
                                                      OpDecorate %347 DescriptorSet 347 
                                                      OpDecorate %347 Binding 347 
                                                      OpDecorate %349 DescriptorSet 349 
                                                      OpDecorate %349 Binding 349 
                                                      OpDecorate %741 Location 741 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypePointer Private %16 
                                 Private u32* %27 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                          u32 %29 = OpConstant 0 
                                              %33 = OpTypeBool 
                                              %34 = OpTypeVector %33 4 
                                              %35 = OpTypePointer Private %34 
                              Private bool_4* %36 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          u32 %40 = OpConstant 20 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeStruct %7 %7 %7 %7 %41 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[20];}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 4 
                                              %49 = OpTypePointer Uniform %7 
                                              %54 = OpTypeVector %33 2 
                                              %69 = OpTypePointer Private %7 
                               Private f32_4* %70 = OpVariable Private 
                                              %71 = OpTypePointer Private %33 
                                          f32 %74 = OpConstant 3.674022E-40 
                                              %76 = OpTypePointer Private %6 
                                          u32 %78 = OpConstant 1 
                                          u32 %83 = OpConstant 2 
                                              %92 = OpTypeVector %6 2 
                                             %100 = OpTypePointer Private %54 
                             Private bool_2* %101 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %110 = OpTypePointer Private %92 
                              Private f32_2* %111 = OpVariable Private 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_3 %151 = OpConstantComposite %15 %15 %150 
                                         i32 %160 = OpConstant 0 
                                         i32 %161 = OpConstant 1 
                                         i32 %163 = OpConstant -1 
                                             %169 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %170 = OpTypePointer UniformConstant %169 
        UniformConstant read_only Texture2D* %171 = OpVariable UniformConstant 
                                             %173 = OpTypeSampler 
                                             %174 = OpTypePointer UniformConstant %173 
                    UniformConstant sampler* %175 = OpVariable UniformConstant 
                                             %177 = OpTypeSampledImage %169 
                                Input f32_4* %186 = OpVariable Input 
                              Private f32_4* %191 = OpVariable Private 
        UniformConstant read_only Texture2D* %192 = OpVariable UniformConstant 
                    UniformConstant sampler* %194 = OpVariable UniformConstant 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                              Private f32_4* %208 = OpVariable Private 
        UniformConstant read_only Texture2D* %209 = OpVariable UniformConstant 
                    UniformConstant sampler* %211 = OpVariable UniformConstant 
                                Private f32* %219 = OpVariable Private 
                                Private f32* %223 = OpVariable Private 
                                         f32 %234 = OpConstant 3.674022E-40 
                                         f32 %261 = OpConstant 3.674022E-40 
                                         f32 %263 = OpConstant 3.674022E-40 
        UniformConstant read_only Texture2D* %285 = OpVariable UniformConstant 
                    UniformConstant sampler* %287 = OpVariable UniformConstant 
                             Private bool_2* %299 = OpVariable Private 
                                             %300 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %304 = OpConstantComposite %15 %15 %74 %74 
                              Private f32_4* %330 = OpVariable Private 
                              Private f32_2* %332 = OpVariable Private 
                              Private f32_2* %338 = OpVariable Private 
                                         i32 %341 = OpConstant 2 
                              Private f32_4* %346 = OpVariable Private 
        UniformConstant read_only Texture2D* %347 = OpVariable UniformConstant 
                    UniformConstant sampler* %349 = OpVariable UniformConstant 
                               Private bool* %354 = OpVariable Private 
                                         f32 %360 = OpConstant 3.674022E-40 
                                       f32_2 %361 = OpConstantComposite %360 %360 
                                             %372 = OpTypePointer Private %12 
                              Private f32_3* %373 = OpVariable Private 
                                         f32 %381 = OpConstant 3.674022E-40 
                                       f32_2 %382 = OpConstantComposite %381 %381 
                                Private f32* %390 = OpVariable Private 
                              Private f32_2* %398 = OpVariable Private 
                                Private f32* %432 = OpVariable Private 
                               Private bool* %446 = OpVariable Private 
                                             %454 = OpTypePointer Function %6 
                               Private bool* %469 = OpVariable Private 
                                         f32 %470 = OpConstant 3.674022E-40 
                              Private f32_2* %494 = OpVariable Private 
                                             %507 = OpTypePointer Function %92 
                                Private f32* %518 = OpVariable Private 
                                         f32 %521 = OpConstant 3.674022E-40 
                                             %523 = OpTypePointer Private %45 
                                Private i32* %524 = OpVariable Private 
                             Private bool_2* %559 = OpVariable Private 
                                             %561 = OpTypeVector %45 4 
                                       i32_4 %563 = OpConstantComposite %161 %341 %160 %160 
                               Private bool* %600 = OpVariable Private 
                                Private f32* %607 = OpVariable Private 
                                             %639 = OpTypePointer Uniform %6 
                                         f32 %661 = OpConstant 3.674022E-40 
                                       f32_4 %662 = OpConstantComposite %521 %521 %661 %661 
                                       f32_2 %673 = OpConstantComposite %234 %234 
                                             %740 = OpTypePointer Output %7 
                               Output f32_4* %741 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_4* %319 = OpVariable Function 
                               Function f32* %455 = OpVariable Function 
                               Function f32* %487 = OpVariable Function 
                               Function f32* %496 = OpVariable Function 
                             Function f32_2* %508 = OpVariable Function 
                               Function f32* %539 = OpVariable Function 
                               Function f32* %551 = OpVariable Function 
                               Function f32* %586 = OpVariable Function 
                               Function f32* %613 = OpVariable Function 
                               Function f32* %625 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                   Input f32* %30 = OpAccessChain vs_TEXCOORD3 %29 
                                          f32 %31 = OpLoad %30 
                                          u32 %32 = OpConvertFToU %31 
                                                      OpStore %27 %32 
                                        f32_4 %38 = OpLoad vs_TEXCOORD0 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 3 2 
                                          u32 %47 = OpLoad %27 
                                          i32 %48 = OpBitcast %47 
                               Uniform f32_4* %50 = OpAccessChain %44 %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 1 0 
                                       bool_4 %53 = OpFOrdGreaterThanEqual %39 %52 
                                       bool_2 %55 = OpVectorShuffle %53 %53 1 2 
                                       bool_4 %56 = OpLoad %36 
                                       bool_4 %57 = OpVectorShuffle %56 %55 0 4 5 3 
                                                      OpStore %36 %57 
                                          u32 %58 = OpLoad %27 
                                          i32 %59 = OpBitcast %58 
                               Uniform f32_4* %60 = OpAccessChain %44 %46 %59 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpVectorShuffle %61 %61 2 2 2 3 
                                        f32_4 %63 = OpLoad vs_TEXCOORD0 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 3 
                                       bool_4 %65 = OpFOrdGreaterThanEqual %62 %64 
                                       bool_2 %66 = OpVectorShuffle %65 %65 0 3 
                                       bool_4 %67 = OpLoad %36 
                                       bool_4 %68 = OpVectorShuffle %67 %66 4 1 2 5 
                                                      OpStore %36 %68 
                                Private bool* %72 = OpAccessChain %36 %29 
                                         bool %73 = OpLoad %72 
                                          f32 %75 = OpSelect %73 %15 %74 
                                 Private f32* %77 = OpAccessChain %70 %29 
                                                      OpStore %77 %75 
                                Private bool* %79 = OpAccessChain %36 %78 
                                         bool %80 = OpLoad %79 
                                          f32 %81 = OpSelect %80 %15 %74 
                                 Private f32* %82 = OpAccessChain %70 %78 
                                                      OpStore %82 %81 
                                Private bool* %84 = OpAccessChain %36 %83 
                                         bool %85 = OpLoad %84 
                                          f32 %86 = OpSelect %85 %15 %74 
                                 Private f32* %87 = OpAccessChain %70 %83 
                                                      OpStore %87 %86 
                                Private bool* %88 = OpAccessChain %36 %17 
                                         bool %89 = OpLoad %88 
                                          f32 %90 = OpSelect %89 %15 %74 
                                 Private f32* %91 = OpAccessChain %70 %17 
                                                      OpStore %91 %90 
                                        f32_4 %93 = OpLoad %70 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                        f32_4 %95 = OpLoad %70 
                                        f32_2 %96 = OpVectorShuffle %95 %95 1 2 
                                        f32_2 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %70 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %70 %99 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                              Uniform f32_4* %105 = OpAccessChain %44 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
                                      bool_4 %108 = OpFOrdGreaterThanEqual %103 %107 
                                      bool_2 %109 = OpVectorShuffle %108 %108 0 1 
                                                      OpStore %101 %109 
                               Private bool* %112 = OpAccessChain %101 %29 
                                        bool %113 = OpLoad %112 
                                         f32 %114 = OpSelect %113 %15 %74 
                                Private f32* %115 = OpAccessChain %111 %29 
                                                      OpStore %115 %114 
                               Private bool* %116 = OpAccessChain %101 %78 
                                        bool %117 = OpLoad %116 
                                         f32 %118 = OpSelect %117 %15 %74 
                                Private f32* %119 = OpAccessChain %111 %78 
                                                      OpStore %119 %118 
                                       f32_2 %120 = OpLoad %111 
                                       f32_4 %121 = OpLoad %70 
                                       f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                       f32_2 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %70 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
                                                      OpStore %70 %125 
                              Uniform f32_4* %126 = OpAccessChain %44 %104 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpVectorShuffle %127 %127 2 3 2 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 0 1 
                                      bool_4 %131 = OpFOrdGreaterThanEqual %128 %130 
                                      bool_2 %132 = OpVectorShuffle %131 %131 0 1 
                                                      OpStore %101 %132 
                               Private bool* %133 = OpAccessChain %101 %29 
                                        bool %134 = OpLoad %133 
                                         f32 %135 = OpSelect %134 %15 %74 
                                Private f32* %136 = OpAccessChain %111 %29 
                                                      OpStore %136 %135 
                               Private bool* %137 = OpAccessChain %101 %78 
                                        bool %138 = OpLoad %137 
                                         f32 %139 = OpSelect %138 %15 %74 
                                Private f32* %140 = OpAccessChain %111 %78 
                                                      OpStore %140 %139 
                                       f32_2 %141 = OpLoad %111 
                                       f32_4 %142 = OpLoad %70 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFAdd %141 %143 
                                       f32_4 %145 = OpLoad %70 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
                                                      OpStore %70 %146 
                                Private f32* %147 = OpAccessChain %70 %83 
                                                      OpStore %147 %15 
                                       f32_4 %148 = OpLoad %70 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %152 = OpDot %149 %151 
                                Private f32* %153 = OpAccessChain %70 %29 
                                                      OpStore %153 %152 
                                Private f32* %154 = OpAccessChain %70 %29 
                                         f32 %155 = OpLoad %154 
                                        bool %156 = OpFOrdLessThan %155 %74 
                               Private bool* %157 = OpAccessChain %36 %29 
                                                      OpStore %157 %156 
                               Private bool* %158 = OpAccessChain %36 %29 
                                        bool %159 = OpLoad %158 
                                         i32 %162 = OpSelect %159 %161 %160 
                                         i32 %164 = OpIMul %162 %163 
                                        bool %165 = OpINotEqual %164 %160 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %167 
                                             %166 = OpLabel 
                                                      OpKill
                                             %167 = OpLabel 
                         read_only Texture2D %172 = OpLoad %171 
                                     sampler %176 = OpLoad %175 
                  read_only Texture2DSampled %178 = OpSampledImage %172 %176 
                                       f32_4 %179 = OpLoad vs_TEXCOORD3 
                                       f32_2 %180 = OpVectorShuffle %179 %179 2 3 
                                       f32_4 %181 = OpImageSampleImplicitLod %178 %180 
                                         f32 %182 = OpCompositeExtract %181 3 
                                Private f32* %183 = OpAccessChain %70 %29 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %70 %29 
                                         f32 %185 = OpLoad %184 
                                  Input f32* %187 = OpAccessChain %186 %17 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %70 %17 
                                                      OpStore %190 %189 
                         read_only Texture2D %193 = OpLoad %192 
                                     sampler %195 = OpLoad %194 
                  read_only Texture2DSampled %196 = OpSampledImage %193 %195 
                                       f32_4 %197 = OpLoad vs_TEXCOORD0 
                                       f32_2 %198 = OpVectorShuffle %197 %197 0 1 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %191 %199 
                                       f32_4 %200 = OpLoad %191 
                                       f32_4 %202 = OpLoad vs_TEXCOORD1 
                                       f32_4 %203 = OpVectorShuffle %202 %202 1 1 1 1 
                                       f32_4 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad vs_TEXCOORD1 
                                       f32_4 %206 = OpVectorShuffle %205 %205 3 3 3 3 
                                       f32_4 %207 = OpFAdd %204 %206 
                                                      OpStore %191 %207 
                         read_only Texture2D %210 = OpLoad %209 
                                     sampler %212 = OpLoad %211 
                  read_only Texture2DSampled %213 = OpSampledImage %210 %212 
                                       f32_4 %214 = OpLoad vs_TEXCOORD0 
                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                                       f32_4 %216 = OpImageSampleImplicitLod %213 %215 
                                         f32 %217 = OpCompositeExtract %216 3 
                                Private f32* %218 = OpAccessChain %208 %29 
                                                      OpStore %218 %217 
                                Private f32* %220 = OpAccessChain %208 %29 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpDPdx %221 
                                                      OpStore %219 %222 
                                Private f32* %224 = OpAccessChain %208 %29 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpDPdy %225 
                                                      OpStore %223 %226 
                                         f32 %227 = OpLoad %223 
                                         f32 %228 = OpExtInst %1 4 %227 
                                         f32 %229 = OpLoad %219 
                                         f32 %230 = OpExtInst %1 4 %229 
                                         f32 %231 = OpFAdd %228 %230 
                                                      OpStore %219 %231 
                                         f32 %232 = OpLoad %219 
                                         f32 %233 = OpFNegate %232 
                                         f32 %235 = OpFAdd %233 %234 
                                                      OpStore %223 %235 
                                         f32 %236 = OpLoad %219 
                                         f32 %237 = OpFAdd %236 %234 
                                Private f32* %238 = OpAccessChain %208 %78 
                                                      OpStore %238 %237 
                                         f32 %239 = OpLoad %223 
                                       f32_2 %240 = OpCompositeConstruct %239 %239 
                                       f32_2 %241 = OpFNegate %240 
                                       f32_4 %242 = OpLoad %208 
                                       f32_2 %243 = OpVectorShuffle %242 %242 0 1 
                                       f32_2 %244 = OpFAdd %241 %243 
                                       f32_4 %245 = OpLoad %208 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 2 3 
                                                      OpStore %208 %246 
                                Private f32* %247 = OpAccessChain %208 %78 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFDiv %15 %248 
                                                      OpStore %219 %249 
                                         f32 %250 = OpLoad %219 
                                Private f32* %251 = OpAccessChain %208 %29 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFMul %250 %252 
                                Private f32* %254 = OpAccessChain %208 %29 
                                                      OpStore %254 %253 
                                Private f32* %255 = OpAccessChain %208 %29 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpExtInst %1 43 %256 %74 %15 
                                Private f32* %258 = OpAccessChain %208 %29 
                                                      OpStore %258 %257 
                                Private f32* %259 = OpAccessChain %208 %29 
                                         f32 %260 = OpLoad %259 
                                         f32 %262 = OpFMul %260 %261 
                                         f32 %264 = OpFAdd %262 %263 
                                                      OpStore %219 %264 
                                Private f32* %265 = OpAccessChain %208 %29 
                                         f32 %266 = OpLoad %265 
                                Private f32* %267 = OpAccessChain %208 %29 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFMul %266 %268 
                                Private f32* %270 = OpAccessChain %208 %29 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %208 %29 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpLoad %219 
                                         f32 %274 = OpFMul %272 %273 
                                Private f32* %275 = OpAccessChain %208 %17 
                                                      OpStore %275 %274 
                                Private f32* %276 = OpAccessChain %208 %29 
                                                      OpStore %276 %15 
                                Private f32* %277 = OpAccessChain %208 %78 
                                                      OpStore %277 %15 
                                Private f32* %278 = OpAccessChain %208 %83 
                                                      OpStore %278 %15 
                                       f32_4 %279 = OpLoad %208 
                                       f32_4 %280 = OpLoad vs_TEXCOORD1 
                                       f32_4 %281 = OpVectorShuffle %280 %280 0 0 0 0 
                                       f32_4 %282 = OpFMul %279 %281 
                                       f32_4 %283 = OpLoad %191 
                                       f32_4 %284 = OpFAdd %282 %283 
                                                      OpStore %191 %284 
                         read_only Texture2D %286 = OpLoad %285 
                                     sampler %288 = OpLoad %287 
                  read_only Texture2DSampled %289 = OpSampledImage %286 %288 
                                       f32_4 %290 = OpLoad vs_TEXCOORD0 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 1 
                                       f32_4 %292 = OpImageSampleImplicitLod %289 %291 
                                                      OpStore %208 %292 
                                       f32_4 %293 = OpLoad %208 
                                       f32_4 %294 = OpLoad vs_TEXCOORD1 
                                       f32_4 %295 = OpVectorShuffle %294 %294 2 2 2 2 
                                       f32_4 %296 = OpFMul %293 %295 
                                       f32_4 %297 = OpLoad %191 
                                       f32_4 %298 = OpFAdd %296 %297 
                                                      OpStore %191 %298 
                                       f32_3 %302 = OpLoad vs_TEXCOORD2 
                                       f32_4 %303 = OpVectorShuffle %302 %302 0 1 0 0 
                                      bool_4 %305 = OpFOrdEqual %303 %304 
                                      bool_2 %306 = OpVectorShuffle %305 %305 0 1 
                                                      OpStore %299 %306 
                               Private bool* %307 = OpAccessChain %299 %78 
                                        bool %308 = OpLoad %307 
                               Private bool* %309 = OpAccessChain %299 %29 
                                        bool %310 = OpLoad %309 
                                        bool %311 = OpLogicalOr %308 %310 
                               Private bool* %312 = OpAccessChain %299 %29 
                                                      OpStore %312 %311 
                               Private bool* %313 = OpAccessChain %299 %29 
                                        bool %314 = OpLoad %313 
                                                      OpSelectionMerge %316 None 
                                                      OpBranchConditional %314 %315 %316 
                                             %315 = OpLabel 
                               Private bool* %317 = OpAccessChain %299 %78 
                                        bool %318 = OpLoad %317 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %325 
                                             %320 = OpLabel 
                              Uniform f32_4* %322 = OpAccessChain %44 %161 
                                       f32_4 %323 = OpLoad %322 
                                       f32_4 %324 = OpVectorShuffle %323 %323 0 1 0 1 
                                                      OpStore %319 %324 
                                                      OpBranch %321 
                                             %325 = OpLabel 
                              Uniform f32_4* %326 = OpAccessChain %44 %160 
                                       f32_4 %327 = OpLoad %326 
                                       f32_4 %328 = OpVectorShuffle %327 %327 0 1 0 1 
                                                      OpStore %319 %328 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                       f32_4 %329 = OpLoad %319 
                                                      OpStore %208 %329 
                                Private f32* %331 = OpAccessChain %330 %29 
                                                      OpStore %331 %234 
                                Private f32* %333 = OpAccessChain %332 %78 
                                                      OpStore %333 %74 
                                  Input f32* %334 = OpAccessChain vs_TEXCOORD2 %83 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %335 %234 
                                Private f32* %337 = OpAccessChain %330 %78 
                                                      OpStore %337 %336 
                                       f32_4 %339 = OpLoad %330 
                                       f32_2 %340 = OpVectorShuffle %339 %339 0 1 
                              Uniform f32_4* %342 = OpAccessChain %44 %341 
                                       f32_4 %343 = OpLoad %342 
                                       f32_2 %344 = OpVectorShuffle %343 %343 0 1 
                                       f32_2 %345 = OpFMul %340 %344 
                                                      OpStore %338 %345 
                         read_only Texture2D %348 = OpLoad %347 
                                     sampler %350 = OpLoad %349 
                  read_only Texture2DSampled %351 = OpSampledImage %348 %350 
                                       f32_2 %352 = OpLoad %338 
                                       f32_4 %353 = OpImageSampleImplicitLod %351 %352 
                                                      OpStore %346 %353 
                                Private f32* %355 = OpAccessChain %346 %29 
                                         f32 %356 = OpLoad %355 
                                        bool %357 = OpFOrdLessThan %74 %356 
                                                      OpStore %354 %357 
                                       f32_4 %358 = OpLoad %346 
                                       f32_2 %359 = OpVectorShuffle %358 %358 2 3 
                                       f32_2 %362 = OpFAdd %359 %361 
                                       f32_4 %363 = OpLoad %346 
                                       f32_4 %364 = OpVectorShuffle %363 %362 4 1 5 3 
                                                      OpStore %346 %364 
                                       f32_4 %365 = OpLoad %346 
                                       f32_2 %366 = OpVectorShuffle %365 %365 0 2 
                                       f32_4 %367 = OpLoad %346 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 2 
                                       f32_2 %369 = OpFAdd %366 %368 
                                       f32_4 %370 = OpLoad %346 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 1 5 3 
                                                      OpStore %346 %371 
                                       f32_4 %374 = OpLoad vs_TEXCOORD0 
                                       f32_2 %375 = OpVectorShuffle %374 %374 0 1 
                                       f32_2 %376 = OpFAdd %375 %361 
                                       f32_3 %377 = OpLoad %373 
                                       f32_3 %378 = OpVectorShuffle %377 %376 3 4 2 
                                                      OpStore %373 %378 
                                       f32_3 %379 = OpLoad %373 
                                       f32_2 %380 = OpVectorShuffle %379 %379 0 1 
                                       f32_2 %383 = OpFMul %380 %382 
                                       f32_4 %384 = OpLoad %346 
                                       f32_2 %385 = OpVectorShuffle %384 %384 0 2 
                                       f32_2 %386 = OpFNegate %385 
                                       f32_2 %387 = OpFAdd %383 %386 
                                       f32_3 %388 = OpLoad %373 
                                       f32_3 %389 = OpVectorShuffle %388 %387 3 4 2 
                                                      OpStore %373 %389 
                                       f32_3 %391 = OpLoad %373 
                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
                                       f32_3 %393 = OpLoad %373 
                                       f32_2 %394 = OpVectorShuffle %393 %393 0 1 
                                         f32 %395 = OpDot %392 %394 
                                                      OpStore %390 %395 
                                         f32 %396 = OpLoad %390 
                                         f32 %397 = OpExtInst %1 32 %396 
                                                      OpStore %390 %397 
                                         f32 %399 = OpLoad %390 
                                       f32_2 %400 = OpCompositeConstruct %399 %399 
                                       f32_3 %401 = OpLoad %373 
                                       f32_2 %402 = OpVectorShuffle %401 %401 0 1 
                                       f32_2 %403 = OpFMul %400 %402 
                                                      OpStore %398 %403 
                                       f32_4 %404 = OpLoad %346 
                                       f32_2 %405 = OpVectorShuffle %404 %404 0 2 
                                       f32_2 %406 = OpFNegate %405 
                                       f32_2 %407 = OpLoad %398 
                                         f32 %408 = OpDot %406 %407 
                                                      OpStore %390 %408 
                                       f32_4 %409 = OpLoad %346 
                                       f32_2 %410 = OpVectorShuffle %409 %409 0 2 
                                       f32_4 %411 = OpLoad %346 
                                       f32_2 %412 = OpVectorShuffle %411 %411 0 2 
                                         f32 %413 = OpDot %410 %412 
                                Private f32* %414 = OpAccessChain %346 %29 
                                                      OpStore %414 %413 
                                         f32 %415 = OpLoad %390 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %390 
                                         f32 %418 = OpFMul %416 %417 
                                Private f32* %419 = OpAccessChain %346 %29 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFAdd %418 %420 
                                Private f32* %422 = OpAccessChain %346 %29 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %346 %29 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFNegate %424 
                                         f32 %426 = OpFAdd %425 %15 
                                Private f32* %427 = OpAccessChain %346 %29 
                                                      OpStore %427 %426 
                                Private f32* %428 = OpAccessChain %346 %29 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpExtInst %1 31 %429 
                                Private f32* %431 = OpAccessChain %346 %29 
                                                      OpStore %431 %430 
                                         f32 %433 = OpLoad %390 
                                Private f32* %434 = OpAccessChain %346 %29 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpFNegate %435 
                                         f32 %437 = OpFAdd %433 %436 
                                                      OpStore %432 %437 
                                         f32 %438 = OpLoad %390 
                                Private f32* %439 = OpAccessChain %346 %29 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFAdd %438 %440 
                                                      OpStore %390 %441 
                                         f32 %442 = OpLoad %390 
                                         f32 %443 = OpLoad %432 
                                         f32 %444 = OpExtInst %1 37 %442 %443 
                                Private f32* %445 = OpAccessChain %346 %29 
                                                      OpStore %445 %444 
                                Private f32* %447 = OpAccessChain %346 %29 
                                         f32 %448 = OpLoad %447 
                                        bool %449 = OpFOrdLessThan %448 %74 
                                                      OpStore %446 %449 
                                         f32 %450 = OpLoad %390 
                                         f32 %451 = OpLoad %432 
                                         f32 %452 = OpExtInst %1 40 %450 %451 
                                                      OpStore %390 %452 
                                        bool %453 = OpLoad %446 
                                                      OpSelectionMerge %457 None 
                                                      OpBranchConditional %453 %456 %459 
                                             %456 = OpLabel 
                                         f32 %458 = OpLoad %390 
                                                      OpStore %455 %458 
                                                      OpBranch %457 
                                             %459 = OpLabel 
                                Private f32* %460 = OpAccessChain %346 %29 
                                         f32 %461 = OpLoad %460 
                                                      OpStore %455 %461 
                                                      OpBranch %457 
                                             %457 = OpLabel 
                                         f32 %462 = OpLoad %455 
                                                      OpStore %390 %462 
                                         f32 %463 = OpLoad %390 
                                       f32_2 %464 = OpCompositeConstruct %463 %463 
                                       f32_2 %465 = OpLoad %398 
                                       f32_2 %466 = OpFMul %464 %465 
                                       f32_4 %467 = OpLoad %346 
                                       f32_4 %468 = OpVectorShuffle %467 %466 4 1 5 3 
                                                      OpStore %346 %468 
                                Private f32* %471 = OpAccessChain %346 %29 
                                         f32 %472 = OpLoad %471 
                                         f32 %473 = OpExtInst %1 4 %472 
                                        bool %474 = OpFOrdGreaterThanEqual %470 %473 
                                                      OpStore %469 %474 
                                Private f32* %475 = OpAccessChain %346 %83 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpExtInst %1 4 %476 
                                        bool %478 = OpFOrdLessThan %470 %477 
                                                      OpStore %446 %478 
                                       f32_3 %479 = OpLoad %373 
                                       f32_2 %480 = OpVectorShuffle %479 %479 0 1 
                                       f32_4 %481 = OpLoad %346 
                                       f32_2 %482 = OpVectorShuffle %481 %481 0 2 
                                       f32_2 %483 = OpFDiv %480 %482 
                                       f32_4 %484 = OpLoad %346 
                                       f32_4 %485 = OpVectorShuffle %484 %483 4 1 5 3 
                                                      OpStore %346 %485 
                                        bool %486 = OpLoad %446 
                                                      OpSelectionMerge %489 None 
                                                      OpBranchConditional %486 %488 %492 
                                             %488 = OpLabel 
                                Private f32* %490 = OpAccessChain %346 %83 
                                         f32 %491 = OpLoad %490 
                                                      OpStore %487 %491 
                                                      OpBranch %489 
                                             %492 = OpLabel 
                                                      OpStore %487 %74 
                                                      OpBranch %489 
                                             %489 = OpLabel 
                                         f32 %493 = OpLoad %487 
                                                      OpStore %432 %493 
                                        bool %495 = OpLoad %469 
                                                      OpSelectionMerge %498 None 
                                                      OpBranchConditional %495 %497 %500 
                                             %497 = OpLabel 
                                         f32 %499 = OpLoad %432 
                                                      OpStore %496 %499 
                                                      OpBranch %498 
                                             %500 = OpLabel 
                                Private f32* %501 = OpAccessChain %346 %29 
                                         f32 %502 = OpLoad %501 
                                                      OpStore %496 %502 
                                                      OpBranch %498 
                                             %498 = OpLabel 
                                         f32 %503 = OpLoad %496 
                                Private f32* %504 = OpAccessChain %494 %29 
                                                      OpStore %504 %503 
                                Private f32* %505 = OpAccessChain %494 %78 
                                                      OpStore %505 %74 
                                        bool %506 = OpLoad %354 
                                                      OpSelectionMerge %510 None 
                                                      OpBranchConditional %506 %509 %512 
                                             %509 = OpLabel 
                                       f32_2 %511 = OpLoad %494 
                                                      OpStore %508 %511 
                                                      OpBranch %510 
                                             %512 = OpLabel 
                                       f32_4 %513 = OpLoad vs_TEXCOORD0 
                                       f32_2 %514 = OpVectorShuffle %513 %513 0 1 
                                                      OpStore %508 %514 
                                                      OpBranch %510 
                                             %510 = OpLabel 
                                       f32_2 %515 = OpLoad %508 
                                       f32_3 %516 = OpLoad %373 
                                       f32_3 %517 = OpVectorShuffle %516 %515 0 3 4 
                                                      OpStore %373 %517 
                                Private f32* %519 = OpAccessChain %346 %78 
                                         f32 %520 = OpLoad %519 
                                         f32 %522 = OpFMul %520 %521 
                                                      OpStore %518 %522 
                                         f32 %525 = OpLoad %518 
                                         i32 %526 = OpConvertFToS %525 
                                                      OpStore %524 %526 
                                Private f32* %527 = OpAccessChain %373 %78 
                                         f32 %528 = OpLoad %527 
                                Private f32* %529 = OpAccessChain %373 %78 
                                         f32 %530 = OpLoad %529 
                                         f32 %531 = OpFNegate %530 
                                        bool %532 = OpFOrdGreaterThanEqual %528 %531 
                                                      OpStore %469 %532 
                                Private f32* %533 = OpAccessChain %373 %78 
                                         f32 %534 = OpLoad %533 
                                         f32 %535 = OpExtInst %1 4 %534 
                                         f32 %536 = OpExtInst %1 10 %535 
                                Private f32* %537 = OpAccessChain %346 %29 
                                                      OpStore %537 %536 
                                        bool %538 = OpLoad %469 
                                                      OpSelectionMerge %541 None 
                                                      OpBranchConditional %538 %540 %544 
                                             %540 = OpLabel 
                                Private f32* %542 = OpAccessChain %346 %29 
                                         f32 %543 = OpLoad %542 
                                                      OpStore %539 %543 
                                                      OpBranch %541 
                                             %544 = OpLabel 
                                Private f32* %545 = OpAccessChain %346 %29 
                                         f32 %546 = OpLoad %545 
                                         f32 %547 = OpFNegate %546 
                                                      OpStore %539 %547 
                                                      OpBranch %541 
                                             %541 = OpLabel 
                                         f32 %548 = OpLoad %539 
                                                      OpStore %390 %548 
                                         i32 %549 = OpLoad %524 
                                        bool %550 = OpINotEqual %549 %160 
                                                      OpSelectionMerge %553 None 
                                                      OpBranchConditional %550 %552 %556 
                                             %552 = OpLabel 
                                Private f32* %554 = OpAccessChain %373 %78 
                                         f32 %555 = OpLoad %554 
                                                      OpStore %551 %555 
                                                      OpBranch %553 
                                             %556 = OpLabel 
                                         f32 %557 = OpLoad %390 
                                                      OpStore %551 %557 
                                                      OpBranch %553 
                                             %553 = OpLabel 
                                         f32 %558 = OpLoad %551 
                                                      OpStore %390 %558 
                                         i32 %560 = OpLoad %524 
                                       i32_4 %562 = OpCompositeConstruct %560 %560 %560 %560 
                                      bool_4 %564 = OpIEqual %562 %563 
                                      bool_2 %565 = OpVectorShuffle %564 %564 0 1 
                                                      OpStore %559 %565 
                                         f32 %566 = OpLoad %390 
                                                      OpStore %518 %566 
                                         f32 %567 = OpLoad %518 
                                         f32 %568 = OpExtInst %1 43 %567 %74 %15 
                                                      OpStore %518 %568 
                               Private bool* %569 = OpAccessChain %559 %29 
                                        bool %570 = OpLoad %569 
                                         f32 %571 = OpLoad %518 
                                         f32 %572 = OpLoad %390 
                                         f32 %573 = OpSelect %570 %571 %572 
                                                      OpStore %518 %573 
                                         f32 %574 = OpLoad %518 
                                         f32 %575 = OpFMul %574 %234 
                                                      OpStore %390 %575 
                                         f32 %576 = OpLoad %390 
                                         f32 %577 = OpLoad %390 
                                         f32 %578 = OpFNegate %577 
                                        bool %579 = OpFOrdGreaterThanEqual %576 %578 
                               Private bool* %580 = OpAccessChain %559 %29 
                                                      OpStore %580 %579 
                                         f32 %581 = OpLoad %390 
                                         f32 %582 = OpExtInst %1 4 %581 
                                         f32 %583 = OpExtInst %1 10 %582 
                                                      OpStore %390 %583 
                               Private bool* %584 = OpAccessChain %559 %29 
                                        bool %585 = OpLoad %584 
                                                      OpSelectionMerge %588 None 
                                                      OpBranchConditional %585 %587 %590 
                                             %587 = OpLabel 
                                         f32 %589 = OpLoad %390 
                                                      OpStore %586 %589 
                                                      OpBranch %588 
                                             %590 = OpLabel 
                                         f32 %591 = OpLoad %390 
                                         f32 %592 = OpFNegate %591 
                                                      OpStore %586 %592 
                                                      OpBranch %588 
                                             %588 = OpLabel 
                                         f32 %593 = OpLoad %586 
                                                      OpStore %390 %593 
                                         f32 %594 = OpLoad %390 
                                         f32 %595 = OpLoad %390 
                                         f32 %596 = OpFAdd %594 %595 
                                Private f32* %597 = OpAccessChain %346 %29 
                                                      OpStore %597 %596 
                                         f32 %598 = OpLoad %390 
                                        bool %599 = OpFOrdLessThan %234 %598 
                                                      OpStore %469 %599 
                                Private f32* %601 = OpAccessChain %346 %29 
                                         f32 %602 = OpLoad %601 
                                Private f32* %603 = OpAccessChain %346 %29 
                                         f32 %604 = OpLoad %603 
                                         f32 %605 = OpFNegate %604 
                                        bool %606 = OpFOrdGreaterThanEqual %602 %605 
                                                      OpStore %600 %606 
                                Private f32* %608 = OpAccessChain %346 %29 
                                         f32 %609 = OpLoad %608 
                                         f32 %610 = OpExtInst %1 4 %609 
                                         f32 %611 = OpExtInst %1 10 %610 
                                                      OpStore %607 %611 
                                        bool %612 = OpLoad %600 
                                                      OpSelectionMerge %615 None 
                                                      OpBranchConditional %612 %614 %617 
                                             %614 = OpLabel 
                                         f32 %616 = OpLoad %607 
                                                      OpStore %613 %616 
                                                      OpBranch %615 
                                             %617 = OpLabel 
                                         f32 %618 = OpLoad %607 
                                         f32 %619 = OpFNegate %618 
                                                      OpStore %613 %619 
                                                      OpBranch %615 
                                             %615 = OpLabel 
                                         f32 %620 = OpLoad %613 
                                                      OpStore %432 %620 
                                         f32 %621 = OpLoad %432 
                                         f32 %622 = OpFNegate %621 
                                         f32 %623 = OpFAdd %622 %15 
                                                      OpStore %432 %623 
                                        bool %624 = OpLoad %469 
                                                      OpSelectionMerge %627 None 
                                                      OpBranchConditional %624 %626 %629 
                                             %626 = OpLabel 
                                         f32 %628 = OpLoad %432 
                                                      OpStore %625 %628 
                                                      OpBranch %627 
                                             %629 = OpLabel 
                                Private f32* %630 = OpAccessChain %346 %29 
                                         f32 %631 = OpLoad %630 
                                                      OpStore %625 %631 
                                                      OpBranch %627 
                                             %627 = OpLabel 
                                         f32 %632 = OpLoad %625 
                                                      OpStore %390 %632 
                               Private bool* %633 = OpAccessChain %559 %78 
                                        bool %634 = OpLoad %633 
                                         f32 %635 = OpLoad %390 
                                         f32 %636 = OpLoad %518 
                                         f32 %637 = OpSelect %634 %635 %636 
                                Private f32* %638 = OpAccessChain %373 %29 
                                                      OpStore %638 %637 
                                Uniform f32* %640 = OpAccessChain %44 %341 %29 
                                         f32 %641 = OpLoad %640 
                                Private f32* %642 = OpAccessChain %332 %29 
                                                      OpStore %642 %641 
                                       f32_4 %643 = OpLoad %330 
                                       f32_2 %644 = OpVectorShuffle %643 %643 0 1 
                              Uniform f32_4* %645 = OpAccessChain %44 %341 
                                       f32_4 %646 = OpLoad %645 
                                       f32_2 %647 = OpVectorShuffle %646 %646 0 1 
                                       f32_2 %648 = OpFMul %644 %647 
                                       f32_2 %649 = OpLoad %332 
                                       f32_2 %650 = OpFAdd %648 %649 
                                       f32_4 %651 = OpLoad %330 
                                       f32_4 %652 = OpVectorShuffle %651 %650 4 5 2 3 
                                                      OpStore %330 %652 
                         read_only Texture2D %653 = OpLoad %347 
                                     sampler %654 = OpLoad %349 
                  read_only Texture2DSampled %655 = OpSampledImage %653 %654 
                                       f32_4 %656 = OpLoad %330 
                                       f32_2 %657 = OpVectorShuffle %656 %656 0 1 
                                       f32_4 %658 = OpImageSampleImplicitLod %655 %657 
                                                      OpStore %346 %658 
                                       f32_4 %659 = OpLoad %346 
                                       f32_4 %660 = OpVectorShuffle %659 %659 1 3 0 2 
                                       f32_4 %663 = OpFMul %660 %662 
                                                      OpStore %346 %663 
                                       f32_4 %664 = OpLoad %346 
                                       f32_2 %665 = OpVectorShuffle %664 %664 0 1 
                                       f32_4 %666 = OpLoad %346 
                                       f32_2 %667 = OpVectorShuffle %666 %666 2 3 
                                       f32_2 %668 = OpFAdd %665 %667 
                                       f32_4 %669 = OpLoad %330 
                                       f32_4 %670 = OpVectorShuffle %669 %668 4 5 2 3 
                                                      OpStore %330 %670 
                                       f32_4 %671 = OpLoad %330 
                                       f32_2 %672 = OpVectorShuffle %671 %671 0 1 
                                       f32_2 %674 = OpFAdd %672 %673 
                                       f32_4 %675 = OpLoad %346 
                                       f32_4 %676 = OpVectorShuffle %675 %674 4 5 2 3 
                                                      OpStore %346 %676 
                                       f32_2 %677 = OpLoad %332 
                                       f32_2 %678 = OpFMul %677 %382 
                                       f32_2 %679 = OpLoad %338 
                                       f32_2 %680 = OpFAdd %678 %679 
                                       f32_4 %681 = OpLoad %330 
                                       f32_4 %682 = OpVectorShuffle %681 %680 4 5 2 3 
                                                      OpStore %330 %682 
                         read_only Texture2D %683 = OpLoad %347 
                                     sampler %684 = OpLoad %349 
                  read_only Texture2DSampled %685 = OpSampledImage %683 %684 
                                       f32_4 %686 = OpLoad %330 
                                       f32_2 %687 = OpVectorShuffle %686 %686 0 1 
                                       f32_4 %688 = OpImageSampleImplicitLod %685 %687 
                                                      OpStore %330 %688 
                                       f32_4 %689 = OpLoad %330 
                                       f32_4 %690 = OpVectorShuffle %689 %689 1 3 0 2 
                                       f32_4 %691 = OpFMul %690 %662 
                                                      OpStore %330 %691 
                                       f32_4 %692 = OpLoad %330 
                                       f32_2 %693 = OpVectorShuffle %692 %692 0 1 
                                       f32_4 %694 = OpLoad %330 
                                       f32_2 %695 = OpVectorShuffle %694 %694 2 3 
                                       f32_2 %696 = OpFAdd %693 %695 
                                       f32_4 %697 = OpLoad %346 
                                       f32_4 %698 = OpVectorShuffle %697 %696 0 1 4 5 
                                                      OpStore %346 %698 
                                       f32_4 %699 = OpLoad %208 
                                       f32_4 %700 = OpLoad %346 
                                       f32_4 %701 = OpFMul %699 %700 
                                                      OpStore %208 %701 
                                       f32_3 %702 = OpLoad %373 
                                       f32_2 %703 = OpVectorShuffle %702 %702 0 2 
                                       f32_4 %704 = OpLoad %208 
                                       f32_2 %705 = OpVectorShuffle %704 %704 2 3 
                                       f32_2 %706 = OpFMul %703 %705 
                                       f32_4 %707 = OpLoad %208 
                                       f32_2 %708 = OpVectorShuffle %707 %707 0 1 
                                       f32_2 %709 = OpFAdd %706 %708 
                                       f32_4 %710 = OpLoad %208 
                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 2 3 
                                                      OpStore %208 %711 
                         read_only Texture2D %712 = OpLoad %192 
                                     sampler %713 = OpLoad %194 
                  read_only Texture2DSampled %714 = OpSampledImage %712 %713 
                                       f32_4 %715 = OpLoad %208 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 1 
                                       f32_4 %717 = OpImageSampleImplicitLod %714 %716 
                                                      OpStore %330 %717 
                                       f32_4 %718 = OpLoad %330 
                                       f32_3 %719 = OpLoad vs_TEXCOORD2 
                                       f32_4 %720 = OpVectorShuffle %719 %719 0 0 0 0 
                                       f32_4 %721 = OpFMul %718 %720 
                                       f32_4 %722 = OpLoad %191 
                                       f32_4 %723 = OpFAdd %721 %722 
                                                      OpStore %330 %723 
                         read_only Texture2D %724 = OpLoad %285 
                                     sampler %725 = OpLoad %287 
                  read_only Texture2DSampled %726 = OpSampledImage %724 %725 
                                       f32_4 %727 = OpLoad %208 
                                       f32_2 %728 = OpVectorShuffle %727 %727 0 1 
                                       f32_4 %729 = OpImageSampleImplicitLod %726 %728 
                                                      OpStore %208 %729 
                                       f32_4 %730 = OpLoad %208 
                                       f32_3 %731 = OpLoad vs_TEXCOORD2 
                                       f32_4 %732 = OpVectorShuffle %731 %731 1 1 1 1 
                                       f32_4 %733 = OpFMul %730 %732 
                                       f32_4 %734 = OpLoad %330 
                                       f32_4 %735 = OpFAdd %733 %734 
                                                      OpStore %191 %735 
                                                      OpBranch %316 
                                             %316 = OpLabel 
                                       f32_4 %736 = OpLoad %186 
                                       f32_3 %737 = OpVectorShuffle %736 %736 0 1 2 
                                       f32_4 %738 = OpLoad %70 
                                       f32_4 %739 = OpVectorShuffle %738 %737 4 5 6 3 
                                                      OpStore %70 %739 
                                       f32_4 %742 = OpLoad %70 
                                       f32_4 %743 = OpLoad %191 
                                       f32_4 %744 = OpFMul %742 %743 
                                                      OpStore %741 %744 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}