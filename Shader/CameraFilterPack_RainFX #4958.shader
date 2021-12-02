//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/RainFX" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  GpuProgramID 24572
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
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _Time;
uniform 	float _Value;
uniform 	float _Speed;
uniform 	vec4 Coord1;
uniform 	vec4 Coord2;
uniform 	vec4 Coord3;
uniform 	vec4 Coord4;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D Texture3;
UNITY_LOCATION(1) uniform  sampler2D Texture2;
UNITY_LOCATION(2) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
float u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
vec2 u_xlat10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.xy = Coord2.zx * vec2(0.03125, 0.850000024);
    u_xlat1.xy = (-u_xlat0.xy);
    u_xlatb4 = u_xlat0.x>=u_xlat1.x;
    u_xlat8.x = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 8.0;
    u_xlat4.x = (u_xlatb4) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat2.x = u_xlat4.x * 0.99999994;
    u_xlat4.x = Coord2.w + 1.0;
    u_xlat4.x = u_xlat4.x * 0.127500013;
    u_xlat8.x = 0.125 / u_xlat4.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat2.y = u_xlat4.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.x * Coord2.y;
    u_xlat1.z = (-u_xlat0.x);
    u_xlat0.xz = u_xlat1.yz + u_xlat2.xy;
    u_xlat1.xz = vs_TEXCOORD0.xx * vec2(0.850000024, 0.850000024);
    u_xlat1.w = u_xlat4.x * vs_TEXCOORD0.y;
    u_xlat0.xz = u_xlat0.xz + u_xlat1.zw;
    u_xlat2 = texture(Texture3, u_xlat0.xz);
    u_xlat0.xz = (-Coord2.yy) * u_xlat4.xx + vec2(1.12419999, 1.00030005);
    u_xlat4.x = (-vs_TEXCOORD0.y) * u_xlat4.x + 1.0;
    u_xlat0.xy = (-u_xlat0.xz) + u_xlat4.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(1250.00208, -3332.78027);
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat3 = Coord2.zzxx * vec4(0.00390625, 0.00390625, 0.850000024, 0.850000024) + vec4(-0.00999999978, -0.699999988, 0.0312200002, 0.000300000014);
    u_xlat9.x = Coord2.x * 0.850000024 + (-u_xlat3.w);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat2.xz = vs_TEXCOORD0.xx * vec2(0.850000024, 0.850000024) + (-u_xlat3.zw);
    u_xlat3.xy = u_xlat3.xy * vec2(11.1111107, 3.57142806);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat9.x = u_xlat9.x * u_xlat2.z;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat13 = u_xlat2.x * 33333.5977;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat2.x = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.x = u_xlat13 * -2.0 + 3.0;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat9.x = u_xlat2.x * u_xlat13 + u_xlat9.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x + u_xlat9.x;
    u_xlat0.x = u_xlat8.y * u_xlat0.y + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * (-u_xlat2.y) + u_xlat2.y;
    u_xlat4.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat9.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat8.x = u_xlat4.y * u_xlat9.y;
    u_xlat4.x = u_xlat4.x * u_xlat9.x + (-u_xlat8.x);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
    u_xlat4.xy = Coord1.zx * vec2(0.03125, 0.850000024);
    u_xlat2.xy = (-u_xlat4.xy);
    u_xlatb8 = u_xlat4.x>=u_xlat2.x;
    u_xlat12 = fract(abs(u_xlat4.x));
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) + 8.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat12 : (-u_xlat12);
    u_xlat3.x = u_xlat8.x * 0.99999994;
    u_xlat8.x = Coord1.w + 1.0;
    u_xlat8.x = u_xlat8.x * 0.127500013;
    u_xlat12 = 0.125 / u_xlat8.x;
    u_xlat4.x = u_xlat4.x * u_xlat12;
    u_xlat3.y = u_xlat8.x * u_xlat4.x;
    u_xlat4.x = u_xlat8.x * Coord1.y;
    u_xlat2.z = (-u_xlat4.x);
    u_xlat4.xz = u_xlat2.yz + u_xlat3.xy;
    u_xlat1.y = u_xlat8.x * vs_TEXCOORD0.y;
    u_xlat4.xz = u_xlat4.xz + u_xlat1.xy;
    u_xlat1 = texture(Texture3, u_xlat4.xz);
    u_xlat4.xz = (-Coord1.yy) * u_xlat8.xx + vec2(1.12419999, 1.00030005);
    u_xlat8.x = (-vs_TEXCOORD0.y) * u_xlat8.x + 1.0;
    u_xlat4.xy = (-u_xlat4.xz) + u_xlat8.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(1250.00208, -3332.78027);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat5.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2 = Coord1.zzxx * vec4(0.00390625, 0.00390625, 0.850000024, 0.850000024) + vec4(-0.00999999978, -0.699999988, 0.0312200002, 0.000300000014);
    u_xlat12 = Coord1.x * 0.850000024 + (-u_xlat2.w);
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat10.xy = vs_TEXCOORD0.xx * vec2(0.850000024, 0.850000024) + (-u_xlat2.zw);
    u_xlat2.xy = u_xlat2.xy * vec2(11.1111107, 3.57142806);
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat4.z = u_xlat12 * u_xlat10.y;
    u_xlat4.z = clamp(u_xlat4.z, 0.0, 1.0);
    u_xlat13 = u_xlat10.x * 33333.5977;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat10.x = u_xlat4.z * -2.0 + 3.0;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat4.z * u_xlat10.x;
    u_xlat10.x = u_xlat13 * -2.0 + 3.0;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat10.x * u_xlat13 + u_xlat12;
    u_xlat4.x = u_xlat5.x * u_xlat4.x + u_xlat12;
    u_xlat4.x = u_xlat5.y * u_xlat4.y + u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x * (-u_xlat1.x) + u_xlat1.x;
    u_xlat8.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat12 = u_xlat8.y * u_xlat1.y;
    u_xlat8.x = u_xlat8.x * u_xlat1.x + (-u_xlat12);
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat0.x = u_xlat4.x * u_xlat8.x + u_xlat0.x;
    u_xlat4.xy = Coord3.zx * vec2(0.03125, 0.850000024);
    u_xlat1.xy = (-u_xlat4.xy);
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
    u_xlat12 = fract(abs(u_xlat4.x));
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) + 8.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat12 : (-u_xlat12);
    u_xlat2.x = u_xlat8.x * 0.99999994;
    u_xlat8.x = Coord3.w + 1.0;
    u_xlat8.x = u_xlat8.x * 0.127500013;
    u_xlat12 = 0.125 / u_xlat8.x;
    u_xlat4.x = u_xlat4.x * u_xlat12;
    u_xlat2.y = u_xlat8.x * u_xlat4.x;
    u_xlat4.x = u_xlat8.x * Coord3.y;
    u_xlat1.z = (-u_xlat4.x);
    u_xlat4.xz = u_xlat1.yz + u_xlat2.xy;
    u_xlat1.xz = vs_TEXCOORD0.xx * vec2(0.850000024, 0.850000024);
    u_xlat1.y = u_xlat8.x * vs_TEXCOORD0.y;
    u_xlat4.xz = u_xlat4.xz + u_xlat1.xy;
    u_xlat2 = texture(Texture3, u_xlat4.xz);
    u_xlat4.xz = (-Coord3.yy) * u_xlat8.xx + vec2(1.12419999, 1.00030005);
    u_xlat8.x = (-vs_TEXCOORD0.y) * u_xlat8.x + 1.0;
    u_xlat4.xy = (-u_xlat4.xz) + u_xlat8.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(1250.00208, -3332.78027);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3 = Coord3.zzxx * vec4(0.00390625, 0.00390625, 0.850000024, 0.850000024) + vec4(-0.00999999978, -0.699999988, 0.0312200002, 0.000300000014);
    u_xlat12 = Coord3.x * 0.850000024 + (-u_xlat3.w);
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat2.xy = vs_TEXCOORD0.xx * vec2(0.850000024, 0.850000024) + (-u_xlat3.zw);
    u_xlat3.xy = u_xlat3.xy * vec2(11.1111107, 3.57142806);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.z = u_xlat12 * u_xlat2.y;
    u_xlat4.z = clamp(u_xlat4.z, 0.0, 1.0);
    u_xlat2.x = u_xlat2.x * 33333.5977;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat6 = u_xlat4.z * -2.0 + 3.0;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat4.z * u_xlat6;
    u_xlat6 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat12 = u_xlat6 * u_xlat2.x + u_xlat12;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat12;
    u_xlat4.x = u_xlat1.y * u_xlat4.y + u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x * (-u_xlat2.z) + u_xlat2.z;
    u_xlat8.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat1.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat12 = u_xlat8.y * u_xlat1.y;
    u_xlat8.x = u_xlat8.x * u_xlat1.x + (-u_xlat12);
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat0.x = u_xlat4.x * u_xlat8.x + u_xlat0.x;
    u_xlat4.xy = Coord4.zx * vec2(0.03125, 0.850000024);
    u_xlat2.xy = (-u_xlat4.xy);
    u_xlatb8 = u_xlat4.x>=u_xlat2.x;
    u_xlat12 = fract(abs(u_xlat4.x));
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) + 8.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat12 : (-u_xlat12);
    u_xlat1.x = u_xlat8.x * 0.99999994;
    u_xlat8.x = Coord4.w + 1.0;
    u_xlat8.x = u_xlat8.x * 0.127500013;
    u_xlat12 = 0.125 / u_xlat8.x;
    u_xlat4.x = u_xlat4.x * u_xlat12;
    u_xlat1.y = u_xlat8.x * u_xlat4.x;
    u_xlat4.x = u_xlat8.x * Coord4.y;
    u_xlat2.z = (-u_xlat4.x);
    u_xlat4.xz = u_xlat1.xy + u_xlat2.yz;
    u_xlat1.w = u_xlat8.x * vs_TEXCOORD0.y;
    u_xlat4.xz = u_xlat4.xz + u_xlat1.zw;
    u_xlat1 = texture(Texture3, u_xlat4.xz);
    u_xlat4.xz = (-Coord4.yy) * u_xlat8.xx + vec2(1.12419999, 1.00030005);
    u_xlat8.x = (-vs_TEXCOORD0.y) * u_xlat8.x + 1.0;
    u_xlat4.xy = (-u_xlat4.xz) + u_xlat8.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(1250.00208, -3332.78027);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat5.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2 = Coord4.zzxx * vec4(0.00390625, 0.00390625, 0.850000024, 0.850000024) + vec4(-0.00999999978, -0.699999988, 0.0312200002, 0.000300000014);
    u_xlat12 = Coord4.x * 0.850000024 + (-u_xlat2.w);
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat10.xy = vs_TEXCOORD0.xx * vec2(0.850000024, 0.850000024) + (-u_xlat2.zw);
    u_xlat2.xy = u_xlat2.xy * vec2(11.1111107, 3.57142806);
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat4.z = u_xlat12 * u_xlat10.y;
    u_xlat4.z = clamp(u_xlat4.z, 0.0, 1.0);
    u_xlat13 = u_xlat10.x * 33333.5977;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat10.x = u_xlat4.z * -2.0 + 3.0;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat4.z * u_xlat10.x;
    u_xlat10.x = u_xlat13 * -2.0 + 3.0;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat10.x * u_xlat13 + u_xlat12;
    u_xlat4.x = u_xlat5.x * u_xlat4.x + u_xlat12;
    u_xlat4.x = u_xlat5.y * u_xlat4.y + u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x * (-u_xlat1.x) + u_xlat1.x;
    u_xlat8.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat12 = u_xlat8.y * u_xlat1.y;
    u_xlat8.x = u_xlat8.x * u_xlat1.x + (-u_xlat12);
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat0.x = u_xlat4.x * u_xlat8.x + u_xlat0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(0.0, -0.159999996);
    u_xlat1 = texture(Texture2, u_xlat4.xy);
    u_xlat4.x = u_xlat1.z + vs_TEXCOORD0.y;
    u_xlat8.x = u_xlat1.z * u_xlat1.z;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat1.x = _Time.x * _Speed;
    u_xlat2.y = u_xlat1.x * u_xlat8.x + u_xlat4.x;
    u_xlat2.x = vs_TEXCOORD0.x;
    u_xlat2 = texture(Texture2, u_xlat2.xy);
    u_xlat0.x = u_xlat2.y * u_xlat12 + u_xlat0.x;
    u_xlat4.xyz = vs_TEXCOORD0.xyy * vec3(0.75, 0.75, 0.75) + vec3(0.5, 0.5, 0.340000004);
    u_xlat2 = texture(Texture2, u_xlat4.xz);
    u_xlat4.x = u_xlat4.y + u_xlat2.z;
    u_xlat8.x = u_xlat2.z * u_xlat2.z;
    u_xlat12 = (-u_xlat2.x) + 1.0;
    u_xlat1.y = u_xlat1.x * u_xlat8.x + u_xlat4.x;
    u_xlat1.x = vs_TEXCOORD0.x * 0.75 + 0.5;
    u_xlat1 = texture(Texture2, u_xlat1.xy);
    u_xlat0.x = u_xlat1.y * u_xlat12 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * _Value;
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = 0.25;
    u_xlat0.xz = vec2(0.0, 0.25) * u_xlat0.xy + u_xlat8.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xz);
    SV_Target0 = vec4(0.349999994, 0.349999994, 0.349999994, 0.349999994) * u_xlat0.yyyy + u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                              OpDecorate %88 Location 88 
                                              OpDecorate %89 Location 89 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                        Output f32_4* %88 = OpVariable Output 
                         Input f32_4* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore vs_TEXCOORD0 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                                f32_4 %90 = OpLoad %89 
                                              OpStore %88 %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %78 %28 %74 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 1427
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %53 %1418 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 53 
                                                      OpDecorate %337 DescriptorSet 337 
                                                      OpDecorate %337 Binding 337 
                                                      OpDecorate %341 DescriptorSet 341 
                                                      OpDecorate %341 Binding 341 
                                                      OpDecorate %1254 DescriptorSet 1254 
                                                      OpDecorate %1254 Binding 1254 
                                                      OpDecorate %1256 DescriptorSet 1256 
                                                      OpDecorate %1256 Binding 1256 
                                                      OpDecorate %1409 DescriptorSet 1409 
                                                      OpDecorate %1409 Binding 1409 
                                                      OpDecorate %1411 DescriptorSet 1411 
                                                      OpDecorate %1411 Binding 1411 
                                                      OpDecorate %1418 Location 1418 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeStruct %7 %6 %6 %7 %7 %7 %7 %10 %7 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32; f32; f32_4; f32_4; f32_4; f32_4; f32_2; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 4 
                                              %16 = OpTypePointer Uniform %7 
                                          f32 %20 = OpConstant 3.674022E-40 
                                          f32 %21 = OpConstant 3.674022E-40 
                                        f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
                                          f32 %24 = OpConstant 3.674022E-40 
                                          f32 %25 = OpConstant 3.674022E-40 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                        f32_4 %28 = OpConstantComposite %24 %25 %26 %27 
                               Private f32_4* %30 = OpVariable Private 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          u32 %37 = OpConstant 3 
                                              %38 = OpTypePointer Private %6 
                                          f32 %44 = OpConstant 3.674022E-40 
                                              %49 = OpTypeVector %6 3 
                                              %50 = OpTypePointer Private %49 
                               Private f32_3* %51 = OpVariable Private 
                                              %52 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %54 = OpTypePointer Input %6 
                                          u32 %57 = OpConstant 1 
                                        f32_2 %61 = OpConstantComposite %21 %21 
                                 Private f32* %69 = OpVariable Private 
                                          f32 %76 = OpConstant 3.674022E-40 
                                          f32 %80 = OpConstant 3.674022E-40 
                                          f32 %81 = OpConstant 3.674022E-40 
                                          f32 %82 = OpConstant 3.674022E-40 
                                        f32_3 %83 = OpConstantComposite %80 %81 %82 
                                          f32 %95 = OpConstant 3.674022E-40 
                                          f32 %97 = OpConstant 3.674022E-40 
                                         u32 %107 = OpConstant 2 
                                             %113 = OpTypePointer Private %10 
                              Private f32_2* %114 = OpVariable Private 
                                         f32 %133 = OpConstant 3.674022E-40 
                                         f32 %142 = OpConstant 3.674022E-40 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_2 %144 = OpConstantComposite %142 %143 
                                             %148 = OpTypeBool 
                                             %149 = OpTypePointer Private %148 
                               Private bool* %150 = OpVariable Private 
                                         i32 %151 = OpConstant 7 
                                Private f32* %155 = OpVariable Private 
                                             %161 = OpTypePointer Function %6 
                              Private f32_2* %171 = OpVariable Private 
                                         f32 %189 = OpConstant 3.674022E-40 
                                         f32 %190 = OpConstant 3.674022E-40 
                                       f32_2 %191 = OpConstantComposite %189 %190 
                                       f32_2 %204 = OpConstantComposite %95 %95 
                                       f32_2 %206 = OpConstantComposite %97 %97 
                                         f32 %240 = OpConstant 3.674022E-40 
                                       f32_2 %241 = OpConstantComposite %240 %21 
                              Private f32_4* %245 = OpVariable Private 
                               Private bool* %251 = OpVariable Private 
                                         f32 %269 = OpConstant 3.674022E-40 
                                Private f32* %272 = OpVariable Private 
                              Private f32_2* %284 = OpVariable Private 
                                         f32 %286 = OpConstant 3.674022E-40 
                                         f32 %289 = OpConstant 3.674022E-40 
                              Private f32_4* %307 = OpVariable Private 
                                             %335 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %336 = OpTypePointer UniformConstant %335 
        UniformConstant read_only Texture2D* %337 = OpVariable UniformConstant 
                                             %339 = OpTypeSampler 
                                             %340 = OpTypePointer UniformConstant %339 
                    UniformConstant sampler* %341 = OpVariable UniformConstant 
                                             %343 = OpTypeSampledImage %335 
                              Private f32_3* %370 = OpVariable Private 
                                         i32 %397 = OpConstant 3 
                               Private bool* %409 = OpVariable Private 
                                         i32 %672 = OpConstant 5 
                                       f32_2 %806 = OpConstantComposite %80 %81 
                              Private f32_2* %894 = OpVariable Private 
                                         i32 %975 = OpConstant 6 
                                        f32 %1251 = OpConstant 3.674022E-40 
       UniformConstant read_only Texture2D* %1254 = OpVariable UniformConstant 
                   UniformConstant sampler* %1256 = OpVariable UniformConstant 
                                        f32 %1267 = OpConstant 3.674022E-40 
                                      f32_3 %1268 = OpConstantComposite %1267 %1267 %1267 
                                        f32 %1270 = OpConstant 3.674022E-40 
                                        f32 %1271 = OpConstant 3.674022E-40 
                                      f32_3 %1272 = OpConstantComposite %1270 %1270 %1271 
                                        i32 %1292 = OpConstant 0 
                                        i32 %1295 = OpConstant 2 
                                        i32 %1380 = OpConstant 1 
                                        i32 %1390 = OpConstant 8 
                                        f32 %1399 = OpConstant 3.674022E-40 
                                      f32_2 %1401 = OpConstantComposite %76 %1399 
       UniformConstant read_only Texture2D* %1409 = OpVariable UniformConstant 
                   UniformConstant sampler* %1411 = OpVariable UniformConstant 
                                            %1417 = OpTypePointer Output %7 
                              Output f32_4* %1418 = OpVariable Output 
                                        f32 %1419 = OpConstant 3.674022E-40 
                                      f32_4 %1420 = OpConstantComposite %1419 %1419 %1419 %1419 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %162 = OpVariable Function 
                               Function f32* %274 = OpVariable Function 
                               Function f32* %429 = OpVariable Function 
                               Function f32* %703 = OpVariable Function 
                              Function f32* %1006 = OpVariable Function 
                               Uniform f32_4* %17 = OpAccessChain %13 %15 
                                        f32_4 %18 = OpLoad %17 
                                        f32_4 %19 = OpVectorShuffle %18 %18 2 2 0 0 
                                        f32_4 %23 = OpFMul %19 %22 
                                        f32_4 %29 = OpFAdd %23 %28 
                                                      OpStore %9 %29 
                                 Uniform f32* %34 = OpAccessChain %13 %15 %32 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %35 %21 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFNegate %40 
                                          f32 %42 = OpFAdd %36 %41 
                                 Private f32* %43 = OpAccessChain %30 %32 
                                                      OpStore %43 %42 
                                 Private f32* %45 = OpAccessChain %30 %32 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFDiv %44 %46 
                                 Private f32* %48 = OpAccessChain %30 %32 
                                                      OpStore %48 %47 
                                   Input f32* %55 = OpAccessChain vs_TEXCOORD0 %32 
                                          f32 %56 = OpLoad %55 
                                 Private f32* %58 = OpAccessChain %51 %57 
                                                      OpStore %58 %56 
                                        f32_3 %59 = OpLoad %51 
                                        f32_2 %60 = OpVectorShuffle %59 %59 1 1 
                                        f32_2 %62 = OpFMul %60 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_2 %64 = OpVectorShuffle %63 %63 2 3 
                                        f32_2 %65 = OpFNegate %64 
                                        f32_2 %66 = OpFAdd %62 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 0 1 4 5 
                                                      OpStore %9 %68 
                                 Private f32* %70 = OpAccessChain %30 %32 
                                          f32 %71 = OpLoad %70 
                                 Private f32* %72 = OpAccessChain %9 %37 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFMul %71 %73 
                                                      OpStore %69 %74 
                                          f32 %75 = OpLoad %69 
                                          f32 %77 = OpExtInst %1 43 %75 %76 %44 
                                                      OpStore %69 %77 
                                        f32_4 %78 = OpLoad %9 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                        f32_3 %84 = OpFMul %79 %83 
                                        f32_4 %85 = OpLoad %9 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                      OpStore %9 %86 
                                        f32_4 %87 = OpLoad %9 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpCompositeConstruct %76 %76 %76 
                                        f32_3 %90 = OpCompositeConstruct %44 %44 %44 
                                        f32_3 %91 = OpExtInst %1 43 %88 %89 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %9 %93 
                                          f32 %94 = OpLoad %69 
                                          f32 %96 = OpFMul %94 %95 
                                          f32 %98 = OpFAdd %96 %97 
                                 Private f32* %99 = OpAccessChain %30 %32 
                                                      OpStore %99 %98 
                                         f32 %100 = OpLoad %69 
                                         f32 %101 = OpLoad %69 
                                         f32 %102 = OpFMul %100 %101 
                                                      OpStore %69 %102 
                                         f32 %103 = OpLoad %69 
                                Private f32* %104 = OpAccessChain %30 %32 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFMul %103 %105 
                                                      OpStore %69 %106 
                                Private f32* %108 = OpAccessChain %9 %107 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %109 %95 
                                         f32 %111 = OpFAdd %110 %97 
                                Private f32* %112 = OpAccessChain %30 %32 
                                                      OpStore %112 %111 
                                Private f32* %115 = OpAccessChain %9 %107 
                                         f32 %116 = OpLoad %115 
                                Private f32* %117 = OpAccessChain %9 %107 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFMul %116 %118 
                                Private f32* %120 = OpAccessChain %114 %32 
                                                      OpStore %120 %119 
                                Private f32* %121 = OpAccessChain %30 %32 
                                         f32 %122 = OpLoad %121 
                                Private f32* %123 = OpAccessChain %114 %32 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFMul %122 %124 
                                         f32 %126 = OpLoad %69 
                                         f32 %127 = OpFAdd %125 %126 
                                Private f32* %128 = OpAccessChain %114 %32 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %13 %15 %37 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFAdd %130 %44 
                                                      OpStore %69 %131 
                                         f32 %132 = OpLoad %69 
                                         f32 %134 = OpFMul %132 %133 
                                                      OpStore %69 %134 
                              Uniform f32_4* %135 = OpAccessChain %13 %15 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 1 1 
                                       f32_2 %138 = OpFNegate %137 
                                         f32 %139 = OpLoad %69 
                                       f32_2 %140 = OpCompositeConstruct %139 %139 
                                       f32_2 %141 = OpFMul %138 %140 
                                       f32_2 %145 = OpFAdd %141 %144 
                                       f32_4 %146 = OpLoad %30 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %30 %147 
                                Uniform f32* %152 = OpAccessChain %13 %151 %57 
                                         f32 %153 = OpLoad %152 
                                        bool %154 = OpFOrdLessThan %153 %76 
                                                      OpStore %150 %154 
                                  Input f32* %156 = OpAccessChain vs_TEXCOORD0 %57 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                         f32 %159 = OpFAdd %158 %44 
                                                      OpStore %155 %159 
                                        bool %160 = OpLoad %150 
                                                      OpSelectionMerge %164 None 
                                                      OpBranchConditional %160 %163 %166 
                                             %163 = OpLabel 
                                         f32 %165 = OpLoad %155 
                                                      OpStore %162 %165 
                                                      OpBranch %164 
                                             %166 = OpLabel 
                                  Input f32* %167 = OpAccessChain vs_TEXCOORD0 %57 
                                         f32 %168 = OpLoad %167 
                                                      OpStore %162 %168 
                                                      OpBranch %164 
                                             %164 = OpLabel 
                                         f32 %169 = OpLoad %162 
                                Private f32* %170 = OpAccessChain %51 %32 
                                                      OpStore %170 %169 
                                Private f32* %172 = OpAccessChain %51 %32 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                         f32 %175 = OpLoad %69 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %177 = OpFAdd %176 %44 
                                Private f32* %178 = OpAccessChain %171 %32 
                                                      OpStore %178 %177 
                                       f32_4 %179 = OpLoad %30 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                       f32_2 %181 = OpFNegate %180 
                                       f32_2 %182 = OpLoad %171 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 0 
                                       f32_2 %184 = OpFAdd %181 %183 
                                       f32_4 %185 = OpLoad %30 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 2 3 
                                                      OpStore %30 %186 
                                       f32_4 %187 = OpLoad %30 
                                       f32_2 %188 = OpVectorShuffle %187 %187 0 1 
                                       f32_2 %192 = OpFMul %188 %191 
                                       f32_4 %193 = OpLoad %30 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 2 3 
                                                      OpStore %30 %194 
                                       f32_4 %195 = OpLoad %30 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_2 %197 = OpCompositeConstruct %76 %76 
                                       f32_2 %198 = OpCompositeConstruct %44 %44 
                                       f32_2 %199 = OpExtInst %1 43 %196 %197 %198 
                                       f32_4 %200 = OpLoad %30 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 2 3 
                                                      OpStore %30 %201 
                                       f32_4 %202 = OpLoad %30 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                       f32_2 %205 = OpFMul %203 %204 
                                       f32_2 %207 = OpFAdd %205 %206 
                                                      OpStore %171 %207 
                                       f32_4 %208 = OpLoad %30 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_4 %210 = OpLoad %30 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 1 
                                       f32_2 %212 = OpFMul %209 %211 
                                       f32_4 %213 = OpLoad %30 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %30 %214 
                                Private f32* %215 = OpAccessChain %171 %32 
                                         f32 %216 = OpLoad %215 
                                Private f32* %217 = OpAccessChain %30 %32 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                Private f32* %220 = OpAccessChain %114 %32 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFAdd %219 %221 
                                Private f32* %223 = OpAccessChain %114 %32 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %171 %57 
                                         f32 %225 = OpLoad %224 
                                Private f32* %226 = OpAccessChain %30 %57 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpFMul %225 %227 
                                Private f32* %229 = OpAccessChain %114 %32 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFAdd %228 %230 
                                Private f32* %232 = OpAccessChain %114 %32 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %114 %32 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpExtInst %1 37 %234 %44 
                                Private f32* %236 = OpAccessChain %114 %32 
                                                      OpStore %236 %235 
                              Uniform f32_4* %237 = OpAccessChain %13 %15 
                                       f32_4 %238 = OpLoad %237 
                                       f32_2 %239 = OpVectorShuffle %238 %238 2 0 
                                       f32_2 %242 = OpFMul %239 %241 
                                       f32_4 %243 = OpLoad %30 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 2 3 
                                                      OpStore %30 %244 
                                       f32_4 %246 = OpLoad %30 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %248 = OpFNegate %247 
                                       f32_4 %249 = OpLoad %245 
                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 2 3 
                                                      OpStore %245 %250 
                                Private f32* %252 = OpAccessChain %30 %32 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %245 %32 
                                         f32 %255 = OpLoad %254 
                                        bool %256 = OpFOrdGreaterThanEqual %253 %255 
                                                      OpStore %251 %256 
                                Private f32* %257 = OpAccessChain %30 %32 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpExtInst %1 4 %258 
                                         f32 %260 = OpExtInst %1 10 %259 
                                Private f32* %261 = OpAccessChain %171 %32 
                                                      OpStore %261 %260 
                                Private f32* %262 = OpAccessChain %30 %32 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpExtInst %1 8 %263 
                                Private f32* %265 = OpAccessChain %30 %32 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %30 %32 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFNegate %267 
                                         f32 %270 = OpFAdd %268 %269 
                                Private f32* %271 = OpAccessChain %30 %32 
                                                      OpStore %271 %270 
                                        bool %273 = OpLoad %251 
                                                      OpSelectionMerge %276 None 
                                                      OpBranchConditional %273 %275 %279 
                                             %275 = OpLabel 
                                Private f32* %277 = OpAccessChain %171 %32 
                                         f32 %278 = OpLoad %277 
                                                      OpStore %274 %278 
                                                      OpBranch %276 
                                             %279 = OpLabel 
                                Private f32* %280 = OpAccessChain %171 %32 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFNegate %281 
                                                      OpStore %274 %282 
                                                      OpBranch %276 
                                             %276 = OpLabel 
                                         f32 %283 = OpLoad %274 
                                                      OpStore %272 %283 
                                         f32 %285 = OpLoad %272 
                                         f32 %287 = OpFMul %285 %286 
                                Private f32* %288 = OpAccessChain %284 %32 
                                                      OpStore %288 %287 
                                         f32 %290 = OpLoad %69 
                                         f32 %291 = OpFDiv %289 %290 
                                                      OpStore %272 %291 
                                Private f32* %292 = OpAccessChain %30 %32 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpLoad %272 
                                         f32 %295 = OpFMul %293 %294 
                                Private f32* %296 = OpAccessChain %30 %32 
                                                      OpStore %296 %295 
                                         f32 %297 = OpLoad %69 
                                Private f32* %298 = OpAccessChain %30 %32 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpFMul %297 %299 
                                Private f32* %301 = OpAccessChain %284 %57 
                                                      OpStore %301 %300 
                                         f32 %302 = OpLoad %69 
                                Uniform f32* %303 = OpAccessChain %13 %15 %57 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFMul %302 %304 
                                Private f32* %306 = OpAccessChain %30 %32 
                                                      OpStore %306 %305 
                                         f32 %308 = OpLoad %69 
                                Private f32* %309 = OpAccessChain %51 %32 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFMul %308 %310 
                                Private f32* %312 = OpAccessChain %307 %37 
                                                      OpStore %312 %311 
                                Private f32* %313 = OpAccessChain %30 %32 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                Private f32* %316 = OpAccessChain %245 %107 
                                                      OpStore %316 %315 
                                       f32_4 %317 = OpLoad %245 
                                       f32_2 %318 = OpVectorShuffle %317 %317 1 2 
                                       f32_2 %319 = OpLoad %284 
                                       f32_2 %320 = OpFAdd %318 %319 
                                       f32_4 %321 = OpLoad %30 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 2 3 
                                                      OpStore %30 %322 
                                       f32_3 %323 = OpLoad %51 
                                       f32_2 %324 = OpVectorShuffle %323 %323 1 1 
                                       f32_2 %325 = OpFMul %324 %61 
                                       f32_4 %326 = OpLoad %307 
                                       f32_4 %327 = OpVectorShuffle %326 %325 4 1 5 3 
                                                      OpStore %307 %327 
                                       f32_4 %328 = OpLoad %30 
                                       f32_2 %329 = OpVectorShuffle %328 %328 0 1 
                                       f32_4 %330 = OpLoad %307 
                                       f32_2 %331 = OpVectorShuffle %330 %330 2 3 
                                       f32_2 %332 = OpFAdd %329 %331 
                                       f32_4 %333 = OpLoad %30 
                                       f32_4 %334 = OpVectorShuffle %333 %332 4 5 2 3 
                                                      OpStore %30 %334 
                         read_only Texture2D %338 = OpLoad %337 
                                     sampler %342 = OpLoad %341 
                  read_only Texture2DSampled %344 = OpSampledImage %338 %342 
                                       f32_4 %345 = OpLoad %30 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 1 
                                       f32_4 %347 = OpImageSampleImplicitLod %344 %346 
                                         f32 %348 = OpCompositeExtract %347 1 
                                                      OpStore %69 %348 
                                Private f32* %349 = OpAccessChain %114 %32 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpLoad %69 
                                         f32 %352 = OpFNegate %351 
                                         f32 %353 = OpFMul %350 %352 
                                         f32 %354 = OpLoad %69 
                                         f32 %355 = OpFAdd %353 %354 
                                Private f32* %356 = OpAccessChain %114 %32 
                                                      OpStore %356 %355 
                                       f32_4 %357 = OpLoad %9 
                                       f32_2 %358 = OpVectorShuffle %357 %357 0 1 
                                       f32_2 %359 = OpFMul %358 %204 
                                       f32_2 %360 = OpFAdd %359 %206 
                                       f32_4 %361 = OpLoad %30 
                                       f32_4 %362 = OpVectorShuffle %361 %360 4 5 2 3 
                                                      OpStore %30 %362 
                                       f32_4 %363 = OpLoad %9 
                                       f32_2 %364 = OpVectorShuffle %363 %363 0 1 
                                       f32_4 %365 = OpLoad %9 
                                       f32_2 %366 = OpVectorShuffle %365 %365 0 1 
                                       f32_2 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %9 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 2 3 
                                                      OpStore %9 %369 
                                Private f32* %371 = OpAccessChain %9 %57 
                                         f32 %372 = OpLoad %371 
                                Private f32* %373 = OpAccessChain %30 %57 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpFMul %372 %374 
                                Private f32* %376 = OpAccessChain %370 %32 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %30 %32 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %9 %32 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFMul %378 %380 
                                Private f32* %382 = OpAccessChain %370 %32 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                         f32 %385 = OpFAdd %381 %384 
                                Private f32* %386 = OpAccessChain %9 %32 
                                                      OpStore %386 %385 
                                Private f32* %387 = OpAccessChain %9 %32 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpExtInst %1 43 %388 %76 %44 
                                Private f32* %390 = OpAccessChain %9 %32 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %9 %32 
                                         f32 %392 = OpLoad %391 
                                Private f32* %393 = OpAccessChain %114 %32 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpFMul %392 %394 
                                Private f32* %396 = OpAccessChain %9 %32 
                                                      OpStore %396 %395 
                              Uniform f32_4* %398 = OpAccessChain %13 %397 
                                       f32_4 %399 = OpLoad %398 
                                       f32_2 %400 = OpVectorShuffle %399 %399 2 0 
                                       f32_2 %401 = OpFMul %400 %241 
                                       f32_3 %402 = OpLoad %370 
                                       f32_3 %403 = OpVectorShuffle %402 %401 3 4 2 
                                                      OpStore %370 %403 
                                       f32_3 %404 = OpLoad %370 
                                       f32_2 %405 = OpVectorShuffle %404 %404 0 1 
                                       f32_2 %406 = OpFNegate %405 
                                       f32_4 %407 = OpLoad %30 
                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 2 3 
                                                      OpStore %30 %408 
                                Private f32* %410 = OpAccessChain %370 %32 
                                         f32 %411 = OpLoad %410 
                                Private f32* %412 = OpAccessChain %30 %32 
                                         f32 %413 = OpLoad %412 
                                        bool %414 = OpFOrdGreaterThanEqual %411 %413 
                                                      OpStore %409 %414 
                                Private f32* %415 = OpAccessChain %370 %32 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpExtInst %1 4 %416 
                                         f32 %418 = OpExtInst %1 10 %417 
                                                      OpStore %69 %418 
                                Private f32* %419 = OpAccessChain %370 %32 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpExtInst %1 8 %420 
                                Private f32* %422 = OpAccessChain %370 %32 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %370 %32 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFNegate %424 
                                         f32 %426 = OpFAdd %425 %269 
                                Private f32* %427 = OpAccessChain %370 %32 
                                                      OpStore %427 %426 
                                        bool %428 = OpLoad %409 
                                                      OpSelectionMerge %431 None 
                                                      OpBranchConditional %428 %430 %433 
                                             %430 = OpLabel 
                                         f32 %432 = OpLoad %69 
                                                      OpStore %429 %432 
                                                      OpBranch %431 
                                             %433 = OpLabel 
                                         f32 %434 = OpLoad %69 
                                         f32 %435 = OpFNegate %434 
                                                      OpStore %429 %435 
                                                      OpBranch %431 
                                             %431 = OpLabel 
                                         f32 %436 = OpLoad %429 
                                Private f32* %437 = OpAccessChain %114 %32 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %114 %32 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFMul %439 %286 
                                Private f32* %441 = OpAccessChain %245 %32 
                                                      OpStore %441 %440 
                                Uniform f32* %442 = OpAccessChain %13 %397 %37 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %443 %44 
                                Private f32* %445 = OpAccessChain %114 %32 
                                                      OpStore %445 %444 
                                Private f32* %446 = OpAccessChain %114 %32 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpFMul %447 %133 
                                Private f32* %449 = OpAccessChain %114 %32 
                                                      OpStore %449 %448 
                                Private f32* %450 = OpAccessChain %114 %32 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFDiv %289 %451 
                                                      OpStore %69 %452 
                                Private f32* %453 = OpAccessChain %370 %32 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpLoad %69 
                                         f32 %456 = OpFMul %454 %455 
                                Private f32* %457 = OpAccessChain %370 %32 
                                                      OpStore %457 %456 
                                Private f32* %458 = OpAccessChain %114 %32 
                                         f32 %459 = OpLoad %458 
                                Private f32* %460 = OpAccessChain %370 %32 
                                         f32 %461 = OpLoad %460 
                                         f32 %462 = OpFMul %459 %461 
                                Private f32* %463 = OpAccessChain %245 %57 
                                                      OpStore %463 %462 
                                Private f32* %464 = OpAccessChain %114 %32 
                                         f32 %465 = OpLoad %464 
                                Uniform f32* %466 = OpAccessChain %13 %397 %57 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpFMul %465 %467 
                                Private f32* %469 = OpAccessChain %370 %32 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %370 %32 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                Private f32* %473 = OpAccessChain %30 %107 
                                                      OpStore %473 %472 
                                       f32_4 %474 = OpLoad %30 
                                       f32_2 %475 = OpVectorShuffle %474 %474 1 2 
                                       f32_4 %476 = OpLoad %245 
                                       f32_2 %477 = OpVectorShuffle %476 %476 0 1 
                                       f32_2 %478 = OpFAdd %475 %477 
                                       f32_3 %479 = OpLoad %370 
                                       f32_3 %480 = OpVectorShuffle %479 %478 3 1 4 
                                                      OpStore %370 %480 
                                Private f32* %481 = OpAccessChain %114 %32 
                                         f32 %482 = OpLoad %481 
                                Private f32* %483 = OpAccessChain %51 %32 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpFMul %482 %484 
                                Private f32* %486 = OpAccessChain %307 %57 
                                                      OpStore %486 %485 
                                       f32_3 %487 = OpLoad %370 
                                       f32_2 %488 = OpVectorShuffle %487 %487 0 2 
                                       f32_4 %489 = OpLoad %307 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 1 
                                       f32_2 %491 = OpFAdd %488 %490 
                                       f32_3 %492 = OpLoad %370 
                                       f32_3 %493 = OpVectorShuffle %492 %491 3 1 4 
                                                      OpStore %370 %493 
                         read_only Texture2D %494 = OpLoad %337 
                                     sampler %495 = OpLoad %341 
                  read_only Texture2DSampled %496 = OpSampledImage %494 %495 
                                       f32_3 %497 = OpLoad %370 
                                       f32_2 %498 = OpVectorShuffle %497 %497 0 2 
                                       f32_4 %499 = OpImageSampleImplicitLod %496 %498 
                                         f32 %500 = OpCompositeExtract %499 0 
                                Private f32* %501 = OpAccessChain %370 %32 
                                                      OpStore %501 %500 
                              Uniform f32_4* %502 = OpAccessChain %13 %397 
                                       f32_4 %503 = OpLoad %502 
                                       f32_4 %504 = OpVectorShuffle %503 %503 2 2 0 0 
                                       f32_4 %505 = OpFMul %504 %22 
                                       f32_4 %506 = OpFAdd %505 %28 
                                                      OpStore %30 %506 
                                Uniform f32* %507 = OpAccessChain %13 %397 %32 
                                         f32 %508 = OpLoad %507 
                                         f32 %509 = OpFMul %508 %21 
                                Private f32* %510 = OpAccessChain %30 %37 
                                         f32 %511 = OpLoad %510 
                                         f32 %512 = OpFNegate %511 
                                         f32 %513 = OpFAdd %509 %512 
                                                      OpStore %69 %513 
                                         f32 %514 = OpLoad %69 
                                         f32 %515 = OpFDiv %44 %514 
                                                      OpStore %69 %515 
                                       f32_3 %516 = OpLoad %51 
                                       f32_2 %517 = OpVectorShuffle %516 %516 1 1 
                                       f32_2 %518 = OpFMul %517 %61 
                                       f32_4 %519 = OpLoad %30 
                                       f32_2 %520 = OpVectorShuffle %519 %519 2 3 
                                       f32_2 %521 = OpFNegate %520 
                                       f32_2 %522 = OpFAdd %518 %521 
                                       f32_4 %523 = OpLoad %30 
                                       f32_4 %524 = OpVectorShuffle %523 %522 0 1 4 5 
                                                      OpStore %30 %524 
                                         f32 %525 = OpLoad %69 
                                Private f32* %526 = OpAccessChain %30 %37 
                                         f32 %527 = OpLoad %526 
                                         f32 %528 = OpFMul %525 %527 
                                                      OpStore %69 %528 
                                         f32 %529 = OpLoad %69 
                                         f32 %530 = OpExtInst %1 43 %529 %76 %44 
                                                      OpStore %69 %530 
                                       f32_4 %531 = OpLoad %30 
                                       f32_3 %532 = OpVectorShuffle %531 %531 0 1 2 
                                       f32_3 %533 = OpFMul %532 %83 
                                       f32_4 %534 = OpLoad %30 
                                       f32_4 %535 = OpVectorShuffle %534 %533 4 5 6 3 
                                                      OpStore %30 %535 
                                       f32_4 %536 = OpLoad %30 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
                                       f32_3 %538 = OpCompositeConstruct %76 %76 %76 
                                       f32_3 %539 = OpCompositeConstruct %44 %44 %44 
                                       f32_3 %540 = OpExtInst %1 43 %537 %538 %539 
                                       f32_4 %541 = OpLoad %30 
                                       f32_4 %542 = OpVectorShuffle %541 %540 4 5 6 3 
                                                      OpStore %30 %542 
                                         f32 %543 = OpLoad %69 
                                         f32 %544 = OpFMul %543 %95 
                                         f32 %545 = OpFAdd %544 %97 
                                                      OpStore %155 %545 
                                         f32 %546 = OpLoad %69 
                                         f32 %547 = OpLoad %69 
                                         f32 %548 = OpFMul %546 %547 
                                                      OpStore %69 %548 
                                         f32 %549 = OpLoad %69 
                                         f32 %550 = OpLoad %155 
                                         f32 %551 = OpFMul %549 %550 
                                                      OpStore %69 %551 
                                Private f32* %552 = OpAccessChain %30 %107 
                                         f32 %553 = OpLoad %552 
                                         f32 %554 = OpFMul %553 %95 
                                         f32 %555 = OpFAdd %554 %97 
                                                      OpStore %155 %555 
                                Private f32* %556 = OpAccessChain %30 %107 
                                         f32 %557 = OpLoad %556 
                                Private f32* %558 = OpAccessChain %30 %107 
                                         f32 %559 = OpLoad %558 
                                         f32 %560 = OpFMul %557 %559 
                                Private f32* %561 = OpAccessChain %171 %32 
                                                      OpStore %561 %560 
                                         f32 %562 = OpLoad %155 
                                Private f32* %563 = OpAccessChain %171 %32 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                         f32 %566 = OpLoad %69 
                                         f32 %567 = OpFAdd %565 %566 
                                                      OpStore %69 %567 
                              Uniform f32_4* %568 = OpAccessChain %13 %397 
                                       f32_4 %569 = OpLoad %568 
                                       f32_2 %570 = OpVectorShuffle %569 %569 1 1 
                                       f32_2 %571 = OpFNegate %570 
                                       f32_2 %572 = OpLoad %114 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 0 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_2 %575 = OpFAdd %574 %144 
                                                      OpStore %171 %575 
                                Private f32* %576 = OpAccessChain %51 %32 
                                         f32 %577 = OpLoad %576 
                                         f32 %578 = OpFNegate %577 
                                Private f32* %579 = OpAccessChain %114 %32 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                         f32 %582 = OpFAdd %581 %44 
                                Private f32* %583 = OpAccessChain %114 %32 
                                                      OpStore %583 %582 
                                       f32_2 %584 = OpLoad %171 
                                       f32_2 %585 = OpFNegate %584 
                                       f32_2 %586 = OpLoad %114 
                                       f32_2 %587 = OpVectorShuffle %586 %586 0 0 
                                       f32_2 %588 = OpFAdd %585 %587 
                                                      OpStore %171 %588 
                                       f32_2 %589 = OpLoad %171 
                                       f32_2 %590 = OpFMul %589 %191 
                                                      OpStore %171 %590 
                                       f32_2 %591 = OpLoad %171 
                                       f32_2 %592 = OpCompositeConstruct %76 %76 
                                       f32_2 %593 = OpCompositeConstruct %44 %44 
                                       f32_2 %594 = OpExtInst %1 43 %591 %592 %593 
                                                      OpStore %171 %594 
                                       f32_2 %595 = OpLoad %171 
                                       f32_2 %596 = OpFMul %595 %204 
                                       f32_2 %597 = OpFAdd %596 %206 
                                       f32_4 %598 = OpLoad %245 
                                       f32_4 %599 = OpVectorShuffle %598 %597 4 5 2 3 
                                                      OpStore %245 %599 
                                       f32_2 %600 = OpLoad %171 
                                       f32_2 %601 = OpLoad %171 
                                       f32_2 %602 = OpFMul %600 %601 
                                                      OpStore %171 %602 
                                Private f32* %603 = OpAccessChain %245 %32 
                                         f32 %604 = OpLoad %603 
                                Private f32* %605 = OpAccessChain %171 %32 
                                         f32 %606 = OpLoad %605 
                                         f32 %607 = OpFMul %604 %606 
                                         f32 %608 = OpLoad %69 
                                         f32 %609 = OpFAdd %607 %608 
                                Private f32* %610 = OpAccessChain %114 %32 
                                                      OpStore %610 %609 
                                Private f32* %611 = OpAccessChain %245 %57 
                                         f32 %612 = OpLoad %611 
                                Private f32* %613 = OpAccessChain %171 %57 
                                         f32 %614 = OpLoad %613 
                                         f32 %615 = OpFMul %612 %614 
                                Private f32* %616 = OpAccessChain %114 %32 
                                         f32 %617 = OpLoad %616 
                                         f32 %618 = OpFAdd %615 %617 
                                Private f32* %619 = OpAccessChain %114 %32 
                                                      OpStore %619 %618 
                                Private f32* %620 = OpAccessChain %114 %32 
                                         f32 %621 = OpLoad %620 
                                         f32 %622 = OpExtInst %1 37 %621 %44 
                                Private f32* %623 = OpAccessChain %114 %32 
                                                      OpStore %623 %622 
                                Private f32* %624 = OpAccessChain %114 %32 
                                         f32 %625 = OpLoad %624 
                                Private f32* %626 = OpAccessChain %370 %32 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFNegate %627 
                                         f32 %629 = OpFMul %625 %628 
                                Private f32* %630 = OpAccessChain %370 %32 
                                         f32 %631 = OpLoad %630 
                                         f32 %632 = OpFAdd %629 %631 
                                Private f32* %633 = OpAccessChain %370 %32 
                                                      OpStore %633 %632 
                                       f32_4 %634 = OpLoad %30 
                                       f32_2 %635 = OpVectorShuffle %634 %634 0 1 
                                       f32_2 %636 = OpFMul %635 %204 
                                       f32_2 %637 = OpFAdd %636 %206 
                                                      OpStore %114 %637 
                                       f32_4 %638 = OpLoad %30 
                                       f32_2 %639 = OpVectorShuffle %638 %638 0 1 
                                       f32_4 %640 = OpLoad %30 
                                       f32_2 %641 = OpVectorShuffle %640 %640 0 1 
                                       f32_2 %642 = OpFMul %639 %641 
                                       f32_4 %643 = OpLoad %30 
                                       f32_4 %644 = OpVectorShuffle %643 %642 4 5 2 3 
                                                      OpStore %30 %644 
                                Private f32* %645 = OpAccessChain %114 %57 
                                         f32 %646 = OpLoad %645 
                                Private f32* %647 = OpAccessChain %30 %57 
                                         f32 %648 = OpLoad %647 
                                         f32 %649 = OpFMul %646 %648 
                                                      OpStore %69 %649 
                                Private f32* %650 = OpAccessChain %114 %32 
                                         f32 %651 = OpLoad %650 
                                Private f32* %652 = OpAccessChain %30 %32 
                                         f32 %653 = OpLoad %652 
                                         f32 %654 = OpFMul %651 %653 
                                         f32 %655 = OpLoad %69 
                                         f32 %656 = OpFNegate %655 
                                         f32 %657 = OpFAdd %654 %656 
                                Private f32* %658 = OpAccessChain %114 %32 
                                                      OpStore %658 %657 
                                Private f32* %659 = OpAccessChain %114 %32 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpExtInst %1 43 %660 %76 %44 
                                Private f32* %662 = OpAccessChain %114 %32 
                                                      OpStore %662 %661 
                                Private f32* %663 = OpAccessChain %370 %32 
                                         f32 %664 = OpLoad %663 
                                Private f32* %665 = OpAccessChain %114 %32 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpFMul %664 %666 
                                Private f32* %668 = OpAccessChain %9 %32 
                                         f32 %669 = OpLoad %668 
                                         f32 %670 = OpFAdd %667 %669 
                                Private f32* %671 = OpAccessChain %9 %32 
                                                      OpStore %671 %670 
                              Uniform f32_4* %673 = OpAccessChain %13 %672 
                                       f32_4 %674 = OpLoad %673 
                                       f32_2 %675 = OpVectorShuffle %674 %674 2 0 
                                       f32_2 %676 = OpFMul %675 %241 
                                       f32_3 %677 = OpLoad %370 
                                       f32_3 %678 = OpVectorShuffle %677 %676 3 4 2 
                                                      OpStore %370 %678 
                                       f32_3 %679 = OpLoad %370 
                                       f32_2 %680 = OpVectorShuffle %679 %679 0 1 
                                       f32_2 %681 = OpFNegate %680 
                                       f32_4 %682 = OpLoad %30 
                                       f32_4 %683 = OpVectorShuffle %682 %681 4 5 2 3 
                                                      OpStore %30 %683 
                                Private f32* %684 = OpAccessChain %370 %32 
                                         f32 %685 = OpLoad %684 
                                Private f32* %686 = OpAccessChain %30 %32 
                                         f32 %687 = OpLoad %686 
                                        bool %688 = OpFOrdGreaterThanEqual %685 %687 
                                                      OpStore %409 %688 
                                Private f32* %689 = OpAccessChain %370 %32 
                                         f32 %690 = OpLoad %689 
                                         f32 %691 = OpExtInst %1 4 %690 
                                         f32 %692 = OpExtInst %1 10 %691 
                                                      OpStore %69 %692 
                                Private f32* %693 = OpAccessChain %370 %32 
                                         f32 %694 = OpLoad %693 
                                         f32 %695 = OpExtInst %1 8 %694 
                                Private f32* %696 = OpAccessChain %370 %32 
                                                      OpStore %696 %695 
                                Private f32* %697 = OpAccessChain %370 %32 
                                         f32 %698 = OpLoad %697 
                                         f32 %699 = OpFNegate %698 
                                         f32 %700 = OpFAdd %699 %269 
                                Private f32* %701 = OpAccessChain %370 %32 
                                                      OpStore %701 %700 
                                        bool %702 = OpLoad %409 
                                                      OpSelectionMerge %705 None 
                                                      OpBranchConditional %702 %704 %707 
                                             %704 = OpLabel 
                                         f32 %706 = OpLoad %69 
                                                      OpStore %703 %706 
                                                      OpBranch %705 
                                             %707 = OpLabel 
                                         f32 %708 = OpLoad %69 
                                         f32 %709 = OpFNegate %708 
                                                      OpStore %703 %709 
                                                      OpBranch %705 
                                             %705 = OpLabel 
                                         f32 %710 = OpLoad %703 
                                Private f32* %711 = OpAccessChain %114 %32 
                                                      OpStore %711 %710 
                                Private f32* %712 = OpAccessChain %114 %32 
                                         f32 %713 = OpLoad %712 
                                         f32 %714 = OpFMul %713 %286 
                                Private f32* %715 = OpAccessChain %245 %32 
                                                      OpStore %715 %714 
                                Uniform f32* %716 = OpAccessChain %13 %672 %37 
                                         f32 %717 = OpLoad %716 
                                         f32 %718 = OpFAdd %717 %44 
                                Private f32* %719 = OpAccessChain %114 %32 
                                                      OpStore %719 %718 
                                Private f32* %720 = OpAccessChain %114 %32 
                                         f32 %721 = OpLoad %720 
                                         f32 %722 = OpFMul %721 %133 
                                Private f32* %723 = OpAccessChain %114 %32 
                                                      OpStore %723 %722 
                                Private f32* %724 = OpAccessChain %114 %32 
                                         f32 %725 = OpLoad %724 
                                         f32 %726 = OpFDiv %289 %725 
                                                      OpStore %69 %726 
                                Private f32* %727 = OpAccessChain %370 %32 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpLoad %69 
                                         f32 %730 = OpFMul %728 %729 
                                Private f32* %731 = OpAccessChain %370 %32 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %114 %32 
                                         f32 %733 = OpLoad %732 
                                Private f32* %734 = OpAccessChain %370 %32 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpFMul %733 %735 
                                Private f32* %737 = OpAccessChain %245 %57 
                                                      OpStore %737 %736 
                                Private f32* %738 = OpAccessChain %114 %32 
                                         f32 %739 = OpLoad %738 
                                Uniform f32* %740 = OpAccessChain %13 %672 %57 
                                         f32 %741 = OpLoad %740 
                                         f32 %742 = OpFMul %739 %741 
                                Private f32* %743 = OpAccessChain %370 %32 
                                                      OpStore %743 %742 
                                Private f32* %744 = OpAccessChain %370 %32 
                                         f32 %745 = OpLoad %744 
                                         f32 %746 = OpFNegate %745 
                                Private f32* %747 = OpAccessChain %30 %107 
                                                      OpStore %747 %746 
                                       f32_4 %748 = OpLoad %30 
                                       f32_2 %749 = OpVectorShuffle %748 %748 1 2 
                                       f32_4 %750 = OpLoad %245 
                                       f32_2 %751 = OpVectorShuffle %750 %750 0 1 
                                       f32_2 %752 = OpFAdd %749 %751 
                                       f32_3 %753 = OpLoad %370 
                                       f32_3 %754 = OpVectorShuffle %753 %752 3 1 4 
                                                      OpStore %370 %754 
                                Private f32* %755 = OpAccessChain %114 %32 
                                         f32 %756 = OpLoad %755 
                                Private f32* %757 = OpAccessChain %51 %32 
                                         f32 %758 = OpLoad %757 
                                         f32 %759 = OpFMul %756 %758 
                                Private f32* %760 = OpAccessChain %30 %57 
                                                      OpStore %760 %759 
                                       f32_3 %761 = OpLoad %51 
                                       f32_2 %762 = OpVectorShuffle %761 %761 1 1 
                                       f32_2 %763 = OpFMul %762 %61 
                                       f32_4 %764 = OpLoad %30 
                                       f32_4 %765 = OpVectorShuffle %764 %763 4 1 5 3 
                                                      OpStore %30 %765 
                                       f32_3 %766 = OpLoad %370 
                                       f32_2 %767 = OpVectorShuffle %766 %766 0 2 
                                       f32_4 %768 = OpLoad %30 
                                       f32_2 %769 = OpVectorShuffle %768 %768 0 1 
                                       f32_2 %770 = OpFAdd %767 %769 
                                       f32_3 %771 = OpLoad %370 
                                       f32_3 %772 = OpVectorShuffle %771 %770 3 1 4 
                                                      OpStore %370 %772 
                         read_only Texture2D %773 = OpLoad %337 
                                     sampler %774 = OpLoad %341 
                  read_only Texture2DSampled %775 = OpSampledImage %773 %774 
                                       f32_3 %776 = OpLoad %370 
                                       f32_2 %777 = OpVectorShuffle %776 %776 0 2 
                                       f32_4 %778 = OpImageSampleImplicitLod %775 %777 
                                         f32 %779 = OpCompositeExtract %778 2 
                                Private f32* %780 = OpAccessChain %370 %32 
                                                      OpStore %780 %779 
                              Uniform f32_4* %781 = OpAccessChain %13 %672 
                                       f32_4 %782 = OpLoad %781 
                                       f32_4 %783 = OpVectorShuffle %782 %782 2 2 0 0 
                                       f32_4 %784 = OpFMul %783 %22 
                                       f32_4 %785 = OpFAdd %784 %28 
                                                      OpStore %245 %785 
                                Uniform f32* %786 = OpAccessChain %13 %672 %32 
                                         f32 %787 = OpLoad %786 
                                         f32 %788 = OpFMul %787 %21 
                                Private f32* %789 = OpAccessChain %245 %37 
                                         f32 %790 = OpLoad %789 
                                         f32 %791 = OpFNegate %790 
                                         f32 %792 = OpFAdd %788 %791 
                                                      OpStore %69 %792 
                                         f32 %793 = OpLoad %69 
                                         f32 %794 = OpFDiv %44 %793 
                                                      OpStore %69 %794 
                                       f32_3 %795 = OpLoad %51 
                                       f32_2 %796 = OpVectorShuffle %795 %795 1 1 
                                       f32_2 %797 = OpFMul %796 %61 
                                       f32_4 %798 = OpLoad %245 
                                       f32_2 %799 = OpVectorShuffle %798 %798 2 3 
                                       f32_2 %800 = OpFNegate %799 
                                       f32_2 %801 = OpFAdd %797 %800 
                                       f32_4 %802 = OpLoad %30 
                                       f32_4 %803 = OpVectorShuffle %802 %801 4 5 2 3 
                                                      OpStore %30 %803 
                                       f32_4 %804 = OpLoad %245 
                                       f32_2 %805 = OpVectorShuffle %804 %804 0 1 
                                       f32_2 %807 = OpFMul %805 %806 
                                       f32_4 %808 = OpLoad %245 
                                       f32_4 %809 = OpVectorShuffle %808 %807 4 5 2 3 
                                                      OpStore %245 %809 
                                       f32_4 %810 = OpLoad %245 
                                       f32_2 %811 = OpVectorShuffle %810 %810 0 1 
                                       f32_2 %812 = OpCompositeConstruct %76 %76 
                                       f32_2 %813 = OpCompositeConstruct %44 %44 
                                       f32_2 %814 = OpExtInst %1 43 %811 %812 %813 
                                       f32_4 %815 = OpLoad %245 
                                       f32_4 %816 = OpVectorShuffle %815 %814 4 5 2 3 
                                                      OpStore %245 %816 
                                         f32 %817 = OpLoad %69 
                                Private f32* %818 = OpAccessChain %30 %57 
                                         f32 %819 = OpLoad %818 
                                         f32 %820 = OpFMul %817 %819 
                                                      OpStore %69 %820 
                                         f32 %821 = OpLoad %69 
                                         f32 %822 = OpExtInst %1 43 %821 %76 %44 
                                                      OpStore %69 %822 
                                Private f32* %823 = OpAccessChain %30 %32 
                                         f32 %824 = OpLoad %823 
                                         f32 %825 = OpFMul %824 %82 
                                Private f32* %826 = OpAccessChain %30 %32 
                                                      OpStore %826 %825 
                                Private f32* %827 = OpAccessChain %30 %32 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpExtInst %1 43 %828 %76 %44 
                                Private f32* %830 = OpAccessChain %30 %32 
                                                      OpStore %830 %829 
                                         f32 %831 = OpLoad %69 
                                         f32 %832 = OpFMul %831 %95 
                                         f32 %833 = OpFAdd %832 %97 
                                                      OpStore %272 %833 
                                         f32 %834 = OpLoad %69 
                                         f32 %835 = OpLoad %69 
                                         f32 %836 = OpFMul %834 %835 
                                                      OpStore %69 %836 
                                         f32 %837 = OpLoad %69 
                                         f32 %838 = OpLoad %272 
                                         f32 %839 = OpFMul %837 %838 
                                                      OpStore %69 %839 
                                Private f32* %840 = OpAccessChain %30 %32 
                                         f32 %841 = OpLoad %840 
                                         f32 %842 = OpFMul %841 %95 
                                         f32 %843 = OpFAdd %842 %97 
                                                      OpStore %272 %843 
                                Private f32* %844 = OpAccessChain %30 %32 
                                         f32 %845 = OpLoad %844 
                                Private f32* %846 = OpAccessChain %30 %32 
                                         f32 %847 = OpLoad %846 
                                         f32 %848 = OpFMul %845 %847 
                                Private f32* %849 = OpAccessChain %30 %32 
                                                      OpStore %849 %848 
                                         f32 %850 = OpLoad %272 
                                Private f32* %851 = OpAccessChain %30 %32 
                                         f32 %852 = OpLoad %851 
                                         f32 %853 = OpFMul %850 %852 
                                         f32 %854 = OpLoad %69 
                                         f32 %855 = OpFAdd %853 %854 
                                                      OpStore %69 %855 
                              Uniform f32_4* %856 = OpAccessChain %13 %672 
                                       f32_4 %857 = OpLoad %856 
                                       f32_2 %858 = OpVectorShuffle %857 %857 1 1 
                                       f32_2 %859 = OpFNegate %858 
                                       f32_2 %860 = OpLoad %114 
                                       f32_2 %861 = OpVectorShuffle %860 %860 0 0 
                                       f32_2 %862 = OpFMul %859 %861 
                                       f32_2 %863 = OpFAdd %862 %144 
                                       f32_4 %864 = OpLoad %30 
                                       f32_4 %865 = OpVectorShuffle %864 %863 4 5 2 3 
                                                      OpStore %30 %865 
                                Private f32* %866 = OpAccessChain %51 %32 
                                         f32 %867 = OpLoad %866 
                                         f32 %868 = OpFNegate %867 
                                Private f32* %869 = OpAccessChain %114 %32 
                                         f32 %870 = OpLoad %869 
                                         f32 %871 = OpFMul %868 %870 
                                         f32 %872 = OpFAdd %871 %44 
                                Private f32* %873 = OpAccessChain %114 %32 
                                                      OpStore %873 %872 
                                       f32_4 %874 = OpLoad %30 
                                       f32_2 %875 = OpVectorShuffle %874 %874 0 1 
                                       f32_2 %876 = OpFNegate %875 
                                       f32_2 %877 = OpLoad %114 
                                       f32_2 %878 = OpVectorShuffle %877 %877 0 0 
                                       f32_2 %879 = OpFAdd %876 %878 
                                       f32_4 %880 = OpLoad %30 
                                       f32_4 %881 = OpVectorShuffle %880 %879 4 5 2 3 
                                                      OpStore %30 %881 
                                       f32_4 %882 = OpLoad %30 
                                       f32_2 %883 = OpVectorShuffle %882 %882 0 1 
                                       f32_2 %884 = OpFMul %883 %191 
                                       f32_4 %885 = OpLoad %30 
                                       f32_4 %886 = OpVectorShuffle %885 %884 4 5 2 3 
                                                      OpStore %30 %886 
                                       f32_4 %887 = OpLoad %30 
                                       f32_2 %888 = OpVectorShuffle %887 %887 0 1 
                                       f32_2 %889 = OpCompositeConstruct %76 %76 
                                       f32_2 %890 = OpCompositeConstruct %44 %44 
                                       f32_2 %891 = OpExtInst %1 43 %888 %889 %890 
                                       f32_4 %892 = OpLoad %30 
                                       f32_4 %893 = OpVectorShuffle %892 %891 4 5 2 3 
                                                      OpStore %30 %893 
                                       f32_4 %895 = OpLoad %30 
                                       f32_2 %896 = OpVectorShuffle %895 %895 0 1 
                                       f32_2 %897 = OpFMul %896 %204 
                                       f32_2 %898 = OpFAdd %897 %206 
                                                      OpStore %894 %898 
                                       f32_4 %899 = OpLoad %30 
                                       f32_2 %900 = OpVectorShuffle %899 %899 0 1 
                                       f32_4 %901 = OpLoad %30 
                                       f32_2 %902 = OpVectorShuffle %901 %901 0 1 
                                       f32_2 %903 = OpFMul %900 %902 
                                       f32_4 %904 = OpLoad %30 
                                       f32_4 %905 = OpVectorShuffle %904 %903 4 5 2 3 
                                                      OpStore %30 %905 
                                Private f32* %906 = OpAccessChain %894 %32 
                                         f32 %907 = OpLoad %906 
                                Private f32* %908 = OpAccessChain %30 %32 
                                         f32 %909 = OpLoad %908 
                                         f32 %910 = OpFMul %907 %909 
                                         f32 %911 = OpLoad %69 
                                         f32 %912 = OpFAdd %910 %911 
                                Private f32* %913 = OpAccessChain %114 %32 
                                                      OpStore %913 %912 
                                Private f32* %914 = OpAccessChain %894 %57 
                                         f32 %915 = OpLoad %914 
                                Private f32* %916 = OpAccessChain %30 %57 
                                         f32 %917 = OpLoad %916 
                                         f32 %918 = OpFMul %915 %917 
                                Private f32* %919 = OpAccessChain %114 %32 
                                         f32 %920 = OpLoad %919 
                                         f32 %921 = OpFAdd %918 %920 
                                Private f32* %922 = OpAccessChain %114 %32 
                                                      OpStore %922 %921 
                                Private f32* %923 = OpAccessChain %114 %32 
                                         f32 %924 = OpLoad %923 
                                         f32 %925 = OpExtInst %1 37 %924 %44 
                                Private f32* %926 = OpAccessChain %114 %32 
                                                      OpStore %926 %925 
                                Private f32* %927 = OpAccessChain %114 %32 
                                         f32 %928 = OpLoad %927 
                                Private f32* %929 = OpAccessChain %370 %32 
                                         f32 %930 = OpLoad %929 
                                         f32 %931 = OpFNegate %930 
                                         f32 %932 = OpFMul %928 %931 
                                Private f32* %933 = OpAccessChain %370 %32 
                                         f32 %934 = OpLoad %933 
                                         f32 %935 = OpFAdd %932 %934 
                                Private f32* %936 = OpAccessChain %370 %32 
                                                      OpStore %936 %935 
                                       f32_4 %937 = OpLoad %245 
                                       f32_2 %938 = OpVectorShuffle %937 %937 0 1 
                                       f32_2 %939 = OpFMul %938 %204 
                                       f32_2 %940 = OpFAdd %939 %206 
                                                      OpStore %114 %940 
                                       f32_4 %941 = OpLoad %245 
                                       f32_2 %942 = OpVectorShuffle %941 %941 0 1 
                                       f32_4 %943 = OpLoad %245 
                                       f32_2 %944 = OpVectorShuffle %943 %943 0 1 
                                       f32_2 %945 = OpFMul %942 %944 
                                       f32_4 %946 = OpLoad %30 
                                       f32_4 %947 = OpVectorShuffle %946 %945 4 5 2 3 
                                                      OpStore %30 %947 
                                Private f32* %948 = OpAccessChain %114 %57 
                                         f32 %949 = OpLoad %948 
                                Private f32* %950 = OpAccessChain %30 %57 
                                         f32 %951 = OpLoad %950 
                                         f32 %952 = OpFMul %949 %951 
                                                      OpStore %69 %952 
                                Private f32* %953 = OpAccessChain %114 %32 
                                         f32 %954 = OpLoad %953 
                                Private f32* %955 = OpAccessChain %30 %32 
                                         f32 %956 = OpLoad %955 
                                         f32 %957 = OpFMul %954 %956 
                                         f32 %958 = OpLoad %69 
                                         f32 %959 = OpFNegate %958 
                                         f32 %960 = OpFAdd %957 %959 
                                Private f32* %961 = OpAccessChain %114 %32 
                                                      OpStore %961 %960 
                                Private f32* %962 = OpAccessChain %114 %32 
                                         f32 %963 = OpLoad %962 
                                         f32 %964 = OpExtInst %1 43 %963 %76 %44 
                                Private f32* %965 = OpAccessChain %114 %32 
                                                      OpStore %965 %964 
                                Private f32* %966 = OpAccessChain %370 %32 
                                         f32 %967 = OpLoad %966 
                                Private f32* %968 = OpAccessChain %114 %32 
                                         f32 %969 = OpLoad %968 
                                         f32 %970 = OpFMul %967 %969 
                                Private f32* %971 = OpAccessChain %9 %32 
                                         f32 %972 = OpLoad %971 
                                         f32 %973 = OpFAdd %970 %972 
                                Private f32* %974 = OpAccessChain %9 %32 
                                                      OpStore %974 %973 
                              Uniform f32_4* %976 = OpAccessChain %13 %975 
                                       f32_4 %977 = OpLoad %976 
                                       f32_2 %978 = OpVectorShuffle %977 %977 2 0 
                                       f32_2 %979 = OpFMul %978 %241 
                                       f32_3 %980 = OpLoad %370 
                                       f32_3 %981 = OpVectorShuffle %980 %979 3 4 2 
                                                      OpStore %370 %981 
                                       f32_3 %982 = OpLoad %370 
                                       f32_2 %983 = OpVectorShuffle %982 %982 0 1 
                                       f32_2 %984 = OpFNegate %983 
                                       f32_4 %985 = OpLoad %245 
                                       f32_4 %986 = OpVectorShuffle %985 %984 4 5 2 3 
                                                      OpStore %245 %986 
                                Private f32* %987 = OpAccessChain %370 %32 
                                         f32 %988 = OpLoad %987 
                                Private f32* %989 = OpAccessChain %245 %32 
                                         f32 %990 = OpLoad %989 
                                        bool %991 = OpFOrdGreaterThanEqual %988 %990 
                                                      OpStore %409 %991 
                                Private f32* %992 = OpAccessChain %370 %32 
                                         f32 %993 = OpLoad %992 
                                         f32 %994 = OpExtInst %1 4 %993 
                                         f32 %995 = OpExtInst %1 10 %994 
                                                      OpStore %69 %995 
                                Private f32* %996 = OpAccessChain %370 %32 
                                         f32 %997 = OpLoad %996 
                                         f32 %998 = OpExtInst %1 8 %997 
                                Private f32* %999 = OpAccessChain %370 %32 
                                                      OpStore %999 %998 
                               Private f32* %1000 = OpAccessChain %370 %32 
                                        f32 %1001 = OpLoad %1000 
                                        f32 %1002 = OpFNegate %1001 
                                        f32 %1003 = OpFAdd %1002 %269 
                               Private f32* %1004 = OpAccessChain %370 %32 
                                                      OpStore %1004 %1003 
                                       bool %1005 = OpLoad %409 
                                                      OpSelectionMerge %1008 None 
                                                      OpBranchConditional %1005 %1007 %1010 
                                            %1007 = OpLabel 
                                        f32 %1009 = OpLoad %69 
                                                      OpStore %1006 %1009 
                                                      OpBranch %1008 
                                            %1010 = OpLabel 
                                        f32 %1011 = OpLoad %69 
                                        f32 %1012 = OpFNegate %1011 
                                                      OpStore %1006 %1012 
                                                      OpBranch %1008 
                                            %1008 = OpLabel 
                                        f32 %1013 = OpLoad %1006 
                               Private f32* %1014 = OpAccessChain %114 %32 
                                                      OpStore %1014 %1013 
                               Private f32* %1015 = OpAccessChain %114 %32 
                                        f32 %1016 = OpLoad %1015 
                                        f32 %1017 = OpFMul %1016 %286 
                               Private f32* %1018 = OpAccessChain %30 %32 
                                                      OpStore %1018 %1017 
                               Uniform f32* %1019 = OpAccessChain %13 %975 %37 
                                        f32 %1020 = OpLoad %1019 
                                        f32 %1021 = OpFAdd %1020 %44 
                               Private f32* %1022 = OpAccessChain %114 %32 
                                                      OpStore %1022 %1021 
                               Private f32* %1023 = OpAccessChain %114 %32 
                                        f32 %1024 = OpLoad %1023 
                                        f32 %1025 = OpFMul %1024 %133 
                               Private f32* %1026 = OpAccessChain %114 %32 
                                                      OpStore %1026 %1025 
                               Private f32* %1027 = OpAccessChain %114 %32 
                                        f32 %1028 = OpLoad %1027 
                                        f32 %1029 = OpFDiv %289 %1028 
                                                      OpStore %69 %1029 
                               Private f32* %1030 = OpAccessChain %370 %32 
                                        f32 %1031 = OpLoad %1030 
                                        f32 %1032 = OpLoad %69 
                                        f32 %1033 = OpFMul %1031 %1032 
                               Private f32* %1034 = OpAccessChain %370 %32 
                                                      OpStore %1034 %1033 
                               Private f32* %1035 = OpAccessChain %114 %32 
                                        f32 %1036 = OpLoad %1035 
                               Private f32* %1037 = OpAccessChain %370 %32 
                                        f32 %1038 = OpLoad %1037 
                                        f32 %1039 = OpFMul %1036 %1038 
                               Private f32* %1040 = OpAccessChain %30 %57 
                                                      OpStore %1040 %1039 
                               Private f32* %1041 = OpAccessChain %114 %32 
                                        f32 %1042 = OpLoad %1041 
                               Uniform f32* %1043 = OpAccessChain %13 %975 %57 
                                        f32 %1044 = OpLoad %1043 
                                        f32 %1045 = OpFMul %1042 %1044 
                               Private f32* %1046 = OpAccessChain %370 %32 
                                                      OpStore %1046 %1045 
                               Private f32* %1047 = OpAccessChain %370 %32 
                                        f32 %1048 = OpLoad %1047 
                                        f32 %1049 = OpFNegate %1048 
                               Private f32* %1050 = OpAccessChain %245 %107 
                                                      OpStore %1050 %1049 
                                      f32_4 %1051 = OpLoad %30 
                                      f32_2 %1052 = OpVectorShuffle %1051 %1051 0 1 
                                      f32_4 %1053 = OpLoad %245 
                                      f32_2 %1054 = OpVectorShuffle %1053 %1053 1 2 
                                      f32_2 %1055 = OpFAdd %1052 %1054 
                                      f32_3 %1056 = OpLoad %370 
                                      f32_3 %1057 = OpVectorShuffle %1056 %1055 3 1 4 
                                                      OpStore %370 %1057 
                               Private f32* %1058 = OpAccessChain %114 %32 
                                        f32 %1059 = OpLoad %1058 
                               Private f32* %1060 = OpAccessChain %51 %32 
                                        f32 %1061 = OpLoad %1060 
                                        f32 %1062 = OpFMul %1059 %1061 
                               Private f32* %1063 = OpAccessChain %30 %37 
                                                      OpStore %1063 %1062 
                                      f32_3 %1064 = OpLoad %370 
                                      f32_2 %1065 = OpVectorShuffle %1064 %1064 0 2 
                                      f32_4 %1066 = OpLoad %30 
                                      f32_2 %1067 = OpVectorShuffle %1066 %1066 2 3 
                                      f32_2 %1068 = OpFAdd %1065 %1067 
                                      f32_3 %1069 = OpLoad %370 
                                      f32_3 %1070 = OpVectorShuffle %1069 %1068 3 1 4 
                                                      OpStore %370 %1070 
                        read_only Texture2D %1071 = OpLoad %337 
                                    sampler %1072 = OpLoad %341 
                 read_only Texture2DSampled %1073 = OpSampledImage %1071 %1072 
                                      f32_3 %1074 = OpLoad %370 
                                      f32_2 %1075 = OpVectorShuffle %1074 %1074 0 2 
                                      f32_4 %1076 = OpImageSampleImplicitLod %1073 %1075 
                                        f32 %1077 = OpCompositeExtract %1076 0 
                               Private f32* %1078 = OpAccessChain %370 %32 
                                                      OpStore %1078 %1077 
                             Uniform f32_4* %1079 = OpAccessChain %13 %975 
                                      f32_4 %1080 = OpLoad %1079 
                                      f32_4 %1081 = OpVectorShuffle %1080 %1080 2 2 0 0 
                                      f32_4 %1082 = OpFMul %1081 %22 
                                      f32_4 %1083 = OpFAdd %1082 %28 
                                                      OpStore %30 %1083 
                               Uniform f32* %1084 = OpAccessChain %13 %975 %32 
                                        f32 %1085 = OpLoad %1084 
                                        f32 %1086 = OpFMul %1085 %21 
                               Private f32* %1087 = OpAccessChain %30 %37 
                                        f32 %1088 = OpLoad %1087 
                                        f32 %1089 = OpFNegate %1088 
                                        f32 %1090 = OpFAdd %1086 %1089 
                                                      OpStore %69 %1090 
                                        f32 %1091 = OpLoad %69 
                                        f32 %1092 = OpFDiv %44 %1091 
                                                      OpStore %69 %1092 
                                      f32_3 %1093 = OpLoad %51 
                                      f32_2 %1094 = OpVectorShuffle %1093 %1093 1 1 
                                      f32_2 %1095 = OpFMul %1094 %61 
                                      f32_4 %1096 = OpLoad %30 
                                      f32_2 %1097 = OpVectorShuffle %1096 %1096 2 3 
                                      f32_2 %1098 = OpFNegate %1097 
                                      f32_2 %1099 = OpFAdd %1095 %1098 
                                      f32_4 %1100 = OpLoad %30 
                                      f32_4 %1101 = OpVectorShuffle %1100 %1099 0 1 4 5 
                                                      OpStore %30 %1101 
                                        f32 %1102 = OpLoad %69 
                               Private f32* %1103 = OpAccessChain %30 %37 
                                        f32 %1104 = OpLoad %1103 
                                        f32 %1105 = OpFMul %1102 %1104 
                                                      OpStore %69 %1105 
                                        f32 %1106 = OpLoad %69 
                                        f32 %1107 = OpExtInst %1 43 %1106 %76 %44 
                                                      OpStore %69 %1107 
                                      f32_4 %1108 = OpLoad %30 
                                      f32_3 %1109 = OpVectorShuffle %1108 %1108 0 1 2 
                                      f32_3 %1110 = OpFMul %1109 %83 
                                      f32_4 %1111 = OpLoad %30 
                                      f32_4 %1112 = OpVectorShuffle %1111 %1110 4 5 6 3 
                                                      OpStore %30 %1112 
                                      f32_4 %1113 = OpLoad %30 
                                      f32_3 %1114 = OpVectorShuffle %1113 %1113 0 1 2 
                                      f32_3 %1115 = OpCompositeConstruct %76 %76 %76 
                                      f32_3 %1116 = OpCompositeConstruct %44 %44 %44 
                                      f32_3 %1117 = OpExtInst %1 43 %1114 %1115 %1116 
                                      f32_4 %1118 = OpLoad %30 
                                      f32_4 %1119 = OpVectorShuffle %1118 %1117 4 5 6 3 
                                                      OpStore %30 %1119 
                                        f32 %1120 = OpLoad %69 
                                        f32 %1121 = OpFMul %1120 %95 
                                        f32 %1122 = OpFAdd %1121 %97 
                                                      OpStore %155 %1122 
                                        f32 %1123 = OpLoad %69 
                                        f32 %1124 = OpLoad %69 
                                        f32 %1125 = OpFMul %1123 %1124 
                                                      OpStore %69 %1125 
                                        f32 %1126 = OpLoad %69 
                                        f32 %1127 = OpLoad %155 
                                        f32 %1128 = OpFMul %1126 %1127 
                                                      OpStore %69 %1128 
                               Private f32* %1129 = OpAccessChain %30 %107 
                                        f32 %1130 = OpLoad %1129 
                                        f32 %1131 = OpFMul %1130 %95 
                                        f32 %1132 = OpFAdd %1131 %97 
                                                      OpStore %155 %1132 
                               Private f32* %1133 = OpAccessChain %30 %107 
                                        f32 %1134 = OpLoad %1133 
                               Private f32* %1135 = OpAccessChain %30 %107 
                                        f32 %1136 = OpLoad %1135 
                                        f32 %1137 = OpFMul %1134 %1136 
                               Private f32* %1138 = OpAccessChain %171 %32 
                                                      OpStore %1138 %1137 
                                        f32 %1139 = OpLoad %155 
                               Private f32* %1140 = OpAccessChain %171 %32 
                                        f32 %1141 = OpLoad %1140 
                                        f32 %1142 = OpFMul %1139 %1141 
                                        f32 %1143 = OpLoad %69 
                                        f32 %1144 = OpFAdd %1142 %1143 
                                                      OpStore %69 %1144 
                             Uniform f32_4* %1145 = OpAccessChain %13 %975 
                                      f32_4 %1146 = OpLoad %1145 
                                      f32_2 %1147 = OpVectorShuffle %1146 %1146 1 1 
                                      f32_2 %1148 = OpFNegate %1147 
                                      f32_2 %1149 = OpLoad %114 
                                      f32_2 %1150 = OpVectorShuffle %1149 %1149 0 0 
                                      f32_2 %1151 = OpFMul %1148 %1150 
                                      f32_2 %1152 = OpFAdd %1151 %144 
                                                      OpStore %171 %1152 
                               Private f32* %1153 = OpAccessChain %51 %32 
                                        f32 %1154 = OpLoad %1153 
                                        f32 %1155 = OpFNegate %1154 
                               Private f32* %1156 = OpAccessChain %114 %32 
                                        f32 %1157 = OpLoad %1156 
                                        f32 %1158 = OpFMul %1155 %1157 
                                        f32 %1159 = OpFAdd %1158 %44 
                               Private f32* %1160 = OpAccessChain %114 %32 
                                                      OpStore %1160 %1159 
                                      f32_2 %1161 = OpLoad %171 
                                      f32_2 %1162 = OpFNegate %1161 
                                      f32_2 %1163 = OpLoad %114 
                                      f32_2 %1164 = OpVectorShuffle %1163 %1163 0 0 
                                      f32_2 %1165 = OpFAdd %1162 %1164 
                                                      OpStore %171 %1165 
                                      f32_2 %1166 = OpLoad %171 
                                      f32_2 %1167 = OpFMul %1166 %191 
                                                      OpStore %171 %1167 
                                      f32_2 %1168 = OpLoad %171 
                                      f32_2 %1169 = OpCompositeConstruct %76 %76 
                                      f32_2 %1170 = OpCompositeConstruct %44 %44 
                                      f32_2 %1171 = OpExtInst %1 43 %1168 %1169 %1170 
                                                      OpStore %171 %1171 
                                      f32_2 %1172 = OpLoad %171 
                                      f32_2 %1173 = OpFMul %1172 %204 
                                      f32_2 %1174 = OpFAdd %1173 %206 
                                      f32_4 %1175 = OpLoad %245 
                                      f32_4 %1176 = OpVectorShuffle %1175 %1174 4 5 2 3 
                                                      OpStore %245 %1176 
                                      f32_2 %1177 = OpLoad %171 
                                      f32_2 %1178 = OpLoad %171 
                                      f32_2 %1179 = OpFMul %1177 %1178 
                                                      OpStore %171 %1179 
                               Private f32* %1180 = OpAccessChain %245 %32 
                                        f32 %1181 = OpLoad %1180 
                               Private f32* %1182 = OpAccessChain %171 %32 
                                        f32 %1183 = OpLoad %1182 
                                        f32 %1184 = OpFMul %1181 %1183 
                                        f32 %1185 = OpLoad %69 
                                        f32 %1186 = OpFAdd %1184 %1185 
                               Private f32* %1187 = OpAccessChain %114 %32 
                                                      OpStore %1187 %1186 
                               Private f32* %1188 = OpAccessChain %245 %57 
                                        f32 %1189 = OpLoad %1188 
                               Private f32* %1190 = OpAccessChain %171 %57 
                                        f32 %1191 = OpLoad %1190 
                                        f32 %1192 = OpFMul %1189 %1191 
                               Private f32* %1193 = OpAccessChain %114 %32 
                                        f32 %1194 = OpLoad %1193 
                                        f32 %1195 = OpFAdd %1192 %1194 
                               Private f32* %1196 = OpAccessChain %114 %32 
                                                      OpStore %1196 %1195 
                               Private f32* %1197 = OpAccessChain %114 %32 
                                        f32 %1198 = OpLoad %1197 
                                        f32 %1199 = OpExtInst %1 37 %1198 %44 
                               Private f32* %1200 = OpAccessChain %114 %32 
                                                      OpStore %1200 %1199 
                               Private f32* %1201 = OpAccessChain %114 %32 
                                        f32 %1202 = OpLoad %1201 
                               Private f32* %1203 = OpAccessChain %370 %32 
                                        f32 %1204 = OpLoad %1203 
                                        f32 %1205 = OpFNegate %1204 
                                        f32 %1206 = OpFMul %1202 %1205 
                               Private f32* %1207 = OpAccessChain %370 %32 
                                        f32 %1208 = OpLoad %1207 
                                        f32 %1209 = OpFAdd %1206 %1208 
                               Private f32* %1210 = OpAccessChain %370 %32 
                                                      OpStore %1210 %1209 
                                      f32_4 %1211 = OpLoad %30 
                                      f32_2 %1212 = OpVectorShuffle %1211 %1211 0 1 
                                      f32_2 %1213 = OpFMul %1212 %204 
                                      f32_2 %1214 = OpFAdd %1213 %206 
                                                      OpStore %114 %1214 
                                      f32_4 %1215 = OpLoad %30 
                                      f32_2 %1216 = OpVectorShuffle %1215 %1215 0 1 
                                      f32_4 %1217 = OpLoad %30 
                                      f32_2 %1218 = OpVectorShuffle %1217 %1217 0 1 
                                      f32_2 %1219 = OpFMul %1216 %1218 
                                      f32_4 %1220 = OpLoad %30 
                                      f32_4 %1221 = OpVectorShuffle %1220 %1219 4 5 2 3 
                                                      OpStore %30 %1221 
                               Private f32* %1222 = OpAccessChain %114 %57 
                                        f32 %1223 = OpLoad %1222 
                               Private f32* %1224 = OpAccessChain %30 %57 
                                        f32 %1225 = OpLoad %1224 
                                        f32 %1226 = OpFMul %1223 %1225 
                                                      OpStore %69 %1226 
                               Private f32* %1227 = OpAccessChain %114 %32 
                                        f32 %1228 = OpLoad %1227 
                               Private f32* %1229 = OpAccessChain %30 %32 
                                        f32 %1230 = OpLoad %1229 
                                        f32 %1231 = OpFMul %1228 %1230 
                                        f32 %1232 = OpLoad %69 
                                        f32 %1233 = OpFNegate %1232 
                                        f32 %1234 = OpFAdd %1231 %1233 
                               Private f32* %1235 = OpAccessChain %114 %32 
                                                      OpStore %1235 %1234 
                               Private f32* %1236 = OpAccessChain %114 %32 
                                        f32 %1237 = OpLoad %1236 
                                        f32 %1238 = OpExtInst %1 43 %1237 %76 %44 
                               Private f32* %1239 = OpAccessChain %114 %32 
                                                      OpStore %1239 %1238 
                               Private f32* %1240 = OpAccessChain %370 %32 
                                        f32 %1241 = OpLoad %1240 
                               Private f32* %1242 = OpAccessChain %114 %32 
                                        f32 %1243 = OpLoad %1242 
                                        f32 %1244 = OpFMul %1241 %1243 
                               Private f32* %1245 = OpAccessChain %9 %32 
                                        f32 %1246 = OpLoad %1245 
                                        f32 %1247 = OpFAdd %1244 %1246 
                               Private f32* %1248 = OpAccessChain %9 %32 
                                                      OpStore %1248 %1247 
                               Private f32* %1249 = OpAccessChain %51 %32 
                                        f32 %1250 = OpLoad %1249 
                                        f32 %1252 = OpFAdd %1250 %1251 
                               Private f32* %1253 = OpAccessChain %51 %107 
                                                      OpStore %1253 %1252 
                        read_only Texture2D %1255 = OpLoad %1254 
                                    sampler %1257 = OpLoad %1256 
                 read_only Texture2DSampled %1258 = OpSampledImage %1255 %1257 
                                      f32_3 %1259 = OpLoad %51 
                                      f32_2 %1260 = OpVectorShuffle %1259 %1259 1 2 
                                      f32_4 %1261 = OpImageSampleImplicitLod %1258 %1260 
                                      f32_2 %1262 = OpVectorShuffle %1261 %1261 0 2 
                                      f32_3 %1263 = OpLoad %370 
                                      f32_3 %1264 = OpVectorShuffle %1263 %1262 3 4 2 
                                                      OpStore %370 %1264 
                                      f32_3 %1265 = OpLoad %51 
                                      f32_3 %1266 = OpVectorShuffle %1265 %1265 1 0 0 
                                      f32_3 %1269 = OpFMul %1266 %1268 
                                      f32_3 %1273 = OpFAdd %1269 %1272 
                                      f32_4 %1274 = OpLoad %30 
                                      f32_4 %1275 = OpVectorShuffle %1274 %1273 4 5 6 3 
                                                      OpStore %30 %1275 
                               Private f32* %1276 = OpAccessChain %51 %32 
                                        f32 %1277 = OpLoad %1276 
                               Private f32* %1278 = OpAccessChain %370 %57 
                                        f32 %1279 = OpLoad %1278 
                                        f32 %1280 = OpFAdd %1277 %1279 
                                                      OpStore %69 %1280 
                               Private f32* %1281 = OpAccessChain %370 %57 
                                        f32 %1282 = OpLoad %1281 
                               Private f32* %1283 = OpAccessChain %370 %57 
                                        f32 %1284 = OpLoad %1283 
                                        f32 %1285 = OpFMul %1282 %1284 
                               Private f32* %1286 = OpAccessChain %114 %32 
                                                      OpStore %1286 %1285 
                               Private f32* %1287 = OpAccessChain %370 %32 
                                        f32 %1288 = OpLoad %1287 
                                        f32 %1289 = OpFNegate %1288 
                                        f32 %1290 = OpFAdd %1289 %44 
                               Private f32* %1291 = OpAccessChain %370 %32 
                                                      OpStore %1291 %1290 
                               Uniform f32* %1293 = OpAccessChain %13 %1292 %32 
                                        f32 %1294 = OpLoad %1293 
                               Uniform f32* %1296 = OpAccessChain %13 %1295 
                                        f32 %1297 = OpLoad %1296 
                                        f32 %1298 = OpFMul %1294 %1297 
                               Private f32* %1299 = OpAccessChain %51 %32 
                                                      OpStore %1299 %1298 
                               Private f32* %1300 = OpAccessChain %51 %32 
                                        f32 %1301 = OpLoad %1300 
                               Private f32* %1302 = OpAccessChain %114 %32 
                                        f32 %1303 = OpLoad %1302 
                                        f32 %1304 = OpFMul %1301 %1303 
                                        f32 %1305 = OpLoad %69 
                                        f32 %1306 = OpFAdd %1304 %1305 
                               Private f32* %1307 = OpAccessChain %245 %57 
                                                      OpStore %1307 %1306 
                                 Input f32* %1308 = OpAccessChain vs_TEXCOORD0 %32 
                                        f32 %1309 = OpLoad %1308 
                               Private f32* %1310 = OpAccessChain %245 %32 
                                                      OpStore %1310 %1309 
                        read_only Texture2D %1311 = OpLoad %1254 
                                    sampler %1312 = OpLoad %1256 
                 read_only Texture2DSampled %1313 = OpSampledImage %1311 %1312 
                                      f32_4 %1314 = OpLoad %245 
                                      f32_2 %1315 = OpVectorShuffle %1314 %1314 0 1 
                                      f32_4 %1316 = OpImageSampleImplicitLod %1313 %1315 
                                        f32 %1317 = OpCompositeExtract %1316 1 
                               Private f32* %1318 = OpAccessChain %114 %32 
                                                      OpStore %1318 %1317 
                               Private f32* %1319 = OpAccessChain %114 %32 
                                        f32 %1320 = OpLoad %1319 
                               Private f32* %1321 = OpAccessChain %370 %32 
                                        f32 %1322 = OpLoad %1321 
                                        f32 %1323 = OpFMul %1320 %1322 
                               Private f32* %1324 = OpAccessChain %9 %32 
                                        f32 %1325 = OpLoad %1324 
                                        f32 %1326 = OpFAdd %1323 %1325 
                               Private f32* %1327 = OpAccessChain %9 %32 
                                                      OpStore %1327 %1326 
                        read_only Texture2D %1328 = OpLoad %1254 
                                    sampler %1329 = OpLoad %1256 
                 read_only Texture2DSampled %1330 = OpSampledImage %1328 %1329 
                                      f32_4 %1331 = OpLoad %30 
                                      f32_2 %1332 = OpVectorShuffle %1331 %1331 0 2 
                                      f32_4 %1333 = OpImageSampleImplicitLod %1330 %1332 
                                      f32_2 %1334 = OpVectorShuffle %1333 %1333 0 2 
                                      f32_3 %1335 = OpLoad %370 
                                      f32_3 %1336 = OpVectorShuffle %1335 %1334 3 4 2 
                                                      OpStore %370 %1336 
                               Private f32* %1337 = OpAccessChain %30 %57 
                                        f32 %1338 = OpLoad %1337 
                               Private f32* %1339 = OpAccessChain %370 %57 
                                        f32 %1340 = OpLoad %1339 
                                        f32 %1341 = OpFAdd %1338 %1340 
                                                      OpStore %69 %1341 
                               Private f32* %1342 = OpAccessChain %370 %57 
                                        f32 %1343 = OpLoad %1342 
                               Private f32* %1344 = OpAccessChain %370 %57 
                                        f32 %1345 = OpLoad %1344 
                                        f32 %1346 = OpFMul %1343 %1345 
                               Private f32* %1347 = OpAccessChain %114 %32 
                                                      OpStore %1347 %1346 
                               Private f32* %1348 = OpAccessChain %370 %32 
                                        f32 %1349 = OpLoad %1348 
                                        f32 %1350 = OpFNegate %1349 
                                        f32 %1351 = OpFAdd %1350 %44 
                               Private f32* %1352 = OpAccessChain %370 %32 
                                                      OpStore %1352 %1351 
                               Private f32* %1353 = OpAccessChain %51 %32 
                                        f32 %1354 = OpLoad %1353 
                               Private f32* %1355 = OpAccessChain %114 %32 
                                        f32 %1356 = OpLoad %1355 
                                        f32 %1357 = OpFMul %1354 %1356 
                                        f32 %1358 = OpLoad %69 
                                        f32 %1359 = OpFAdd %1357 %1358 
                               Private f32* %1360 = OpAccessChain %30 %37 
                                                      OpStore %1360 %1359 
                        read_only Texture2D %1361 = OpLoad %1254 
                                    sampler %1362 = OpLoad %1256 
                 read_only Texture2DSampled %1363 = OpSampledImage %1361 %1362 
                                      f32_4 %1364 = OpLoad %30 
                                      f32_2 %1365 = OpVectorShuffle %1364 %1364 0 3 
                                      f32_4 %1366 = OpImageSampleImplicitLod %1363 %1365 
                                        f32 %1367 = OpCompositeExtract %1366 1 
                               Private f32* %1368 = OpAccessChain %114 %32 
                                                      OpStore %1368 %1367 
                               Private f32* %1369 = OpAccessChain %114 %32 
                                        f32 %1370 = OpLoad %1369 
                               Private f32* %1371 = OpAccessChain %370 %32 
                                        f32 %1372 = OpLoad %1371 
                                        f32 %1373 = OpFMul %1370 %1372 
                               Private f32* %1374 = OpAccessChain %9 %32 
                                        f32 %1375 = OpLoad %1374 
                                        f32 %1376 = OpFAdd %1373 %1375 
                               Private f32* %1377 = OpAccessChain %9 %32 
                                                      OpStore %1377 %1376 
                               Private f32* %1378 = OpAccessChain %9 %32 
                                        f32 %1379 = OpLoad %1378 
                               Uniform f32* %1381 = OpAccessChain %13 %1380 
                                        f32 %1382 = OpLoad %1381 
                                        f32 %1383 = OpFMul %1379 %1382 
                               Private f32* %1384 = OpAccessChain %9 %57 
                                                      OpStore %1384 %1383 
                               Private f32* %1385 = OpAccessChain %9 %57 
                                        f32 %1386 = OpLoad %1385 
                                        f32 %1387 = OpExtInst %1 43 %1386 %76 %44 
                               Private f32* %1388 = OpAccessChain %9 %57 
                                                      OpStore %1388 %1387 
                                      f32_2 %1389 = OpLoad vs_TEXCOORD0 
                             Uniform f32_4* %1391 = OpAccessChain %13 %1390 
                                      f32_4 %1392 = OpLoad %1391 
                                      f32_2 %1393 = OpVectorShuffle %1392 %1392 0 1 
                                      f32_2 %1394 = OpFMul %1389 %1393 
                             Uniform f32_4* %1395 = OpAccessChain %13 %1390 
                                      f32_4 %1396 = OpLoad %1395 
                                      f32_2 %1397 = OpVectorShuffle %1396 %1396 2 3 
                                      f32_2 %1398 = OpFAdd %1394 %1397 
                                                      OpStore %114 %1398 
                               Private f32* %1400 = OpAccessChain %9 %32 
                                                      OpStore %1400 %1399 
                                      f32_4 %1402 = OpLoad %9 
                                      f32_2 %1403 = OpVectorShuffle %1402 %1402 0 1 
                                      f32_2 %1404 = OpFMul %1401 %1403 
                                      f32_2 %1405 = OpLoad %114 
                                      f32_2 %1406 = OpFAdd %1404 %1405 
                                      f32_4 %1407 = OpLoad %9 
                                      f32_4 %1408 = OpVectorShuffle %1407 %1406 4 1 5 3 
                                                      OpStore %9 %1408 
                        read_only Texture2D %1410 = OpLoad %1409 
                                    sampler %1412 = OpLoad %1411 
                 read_only Texture2DSampled %1413 = OpSampledImage %1410 %1412 
                                      f32_4 %1414 = OpLoad %9 
                                      f32_2 %1415 = OpVectorShuffle %1414 %1414 0 2 
                                      f32_4 %1416 = OpImageSampleImplicitLod %1413 %1415 
                                                      OpStore %30 %1416 
                                      f32_4 %1421 = OpLoad %9 
                                      f32_4 %1422 = OpVectorShuffle %1421 %1421 1 1 1 1 
                                      f32_4 %1423 = OpFMul %1420 %1422 
                                      f32_4 %1424 = OpLoad %30 
                                      f32_4 %1425 = OpFAdd %1423 %1424 
                                                      OpStore %1418 %1425 
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