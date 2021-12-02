//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Deep_OilPaintHQ" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_ColorRGB ("_ColorRGB", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2207
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ZBufferParams;
uniform 	float _Visualize;
uniform 	vec4 _ScreenResolution;
uniform 	float _Near;
uniform 	float _Far;
uniform 	float _FixDistance;
uniform 	float _LightIntensity;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
float u_xlat9;
vec2 u_xlat18;
float u_xlat27;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9 = _FixDistance * 10.0;
    u_xlat0.x = u_xlat0.x / u_xlat9;
    u_xlat9 = _Far + _Near;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = u_xlat9 + (-_Near);
    u_xlat0.x = u_xlat0.x + (-_Near);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.x = u_xlat9 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat9);
    u_xlatb1 = _Visualize==1.0;
    if(u_xlatb1){
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat18.x = u_xlat0.w * _LightIntensity;
    u_xlat18.xy = u_xlat18.xx / _ScreenResolution.xy;
    u_xlat1 = u_xlat18.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat5.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat6.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat8.xyz = u_xlat3.xyz + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(2.0, 0.0, -1.0, -4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat8.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(3.0, 0.0, 0.0, -4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat8.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(4.0, 0.0, -4.0, -3.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat8.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat8.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat5.xyz = u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat18.xy + u_xlat0.xy;
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat7.xyz = u_xlat2.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat4 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(2.0, 1.0, -1.0, -3.0) + u_xlat0.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat6.xy);
    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(3.0, 1.0, 0.0, -3.0) + u_xlat0.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat6.xy);
    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(4.0, 1.0, -4.0, -2.0) + u_xlat0.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat6.xy);
    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat0.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat6.xy);
    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat6 = u_xlat18.xyxy * vec4(1.0, 2.0, -1.0, -2.0) + u_xlat0.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat6.xy);
    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat4.xy = u_xlat18.xy * vec2(2.0, 2.0) + u_xlat0.xy;
    u_xlat4 = texture(_MainTex, u_xlat4.xy);
    u_xlat7.xyz = u_xlat4.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4 = texture(_MainTex, u_xlat6.zw);
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(3.0, 2.0, 0.0, -2.0) + u_xlat0.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat4.xy);
    u_xlat7.xyz = u_xlat6.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(4.0, 2.0, -4.0, -1.0) + u_xlat0.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat4.xy);
    u_xlat7.xyz = u_xlat6.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(0.0, 3.0, -3.0, -1.0) + u_xlat0.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat4.xy);
    u_xlat7.xyz = u_xlat6.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(1.0, 3.0, -2.0, -1.0) + u_xlat0.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat4.xy);
    u_xlat7.xyz = u_xlat6.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat5.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(2.0, 3.0, 3.0, 3.0) + u_xlat0.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat4.xy);
    u_xlat7.xyz = u_xlat6.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat4.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat6 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6.xyz = u_xlat4.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(0.0, -1.0, 4.0, 3.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(-4.0, 0.0, 0.0, 4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(-3.0, 0.0, 1.0, 4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(-2.0, 0.0, 2.0, 4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat18.xyxy * vec4(-1.0, 0.0, 3.0, 4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat3.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xy = u_xlat18.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat3.xyz = u_xlat0.xyz + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat4.xyz);
    u_xlat27 = abs(u_xlat1.y) + abs(u_xlat1.x);
    u_xlat27 = abs(u_xlat1.z) + u_xlat27;
    u_xlatb1 = u_xlat27<100.0;
    u_xlat2.w = 1.0;
    u_xlat1 = bool(u_xlatb1) ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = min(u_xlat27, 100.0);
    u_xlat2.xyz = u_xlat3.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat3.xyz);
    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
    u_xlatb0 = u_xlat0.x<u_xlat27;
    u_xlat2.w = 1.0;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 127
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %109 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate %89 Location 89 
                                                     OpDecorate %90 Location 90 
                                                     OpDecorate vs_TEXCOORD1 Location 109 
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
                                             %24 = OpTypeStruct %13 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %13 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %13 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %13 
                               Output f32_4* %89 = OpVariable Output 
                                Input f32_4* %90 = OpVariable Input 
                                             %92 = OpTypePointer Private %6 
                                         u32 %95 = OpConstant 0 
                                             %96 = OpTypePointer Uniform %6 
                                            %101 = OpTypeVector %6 3 
                                        f32 %104 = OpConstant 3.674022E-40 
                                      f32_3 %105 = OpConstantComposite %104 %104 %104 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                            %121 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                                                     OpStore vs_TEXCOORD0 %12 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
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
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                       f32_4 %91 = OpLoad %90 
                                                     OpStore %89 %91 
                                Private f32* %93 = OpAccessChain %15 %81 
                                         f32 %94 = OpLoad %93 
                                Uniform f32* %97 = OpAccessChain %26 %33 %95 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFMul %94 %98 
                               Private f32* %100 = OpAccessChain %15 %81 
                                                     OpStore %100 %99 
                                      f32_4 %102 = OpLoad %15 
                                      f32_3 %103 = OpVectorShuffle %102 %102 0 3 1 
                                      f32_3 %106 = OpFMul %103 %105 
                                      f32_4 %107 = OpLoad %54 
                                      f32_4 %108 = OpVectorShuffle %107 %106 4 1 5 6 
                                                     OpStore %54 %108 
                                      f32_4 %110 = OpLoad %15 
                                      f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                      f32_4 %112 = OpLoad vs_TEXCOORD1 
                                      f32_4 %113 = OpVectorShuffle %112 %111 0 1 4 5 
                                                     OpStore vs_TEXCOORD1 %113 
                                      f32_4 %114 = OpLoad %54 
                                      f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                      f32_4 %116 = OpLoad %54 
                                      f32_2 %117 = OpVectorShuffle %116 %116 0 3 
                                      f32_2 %118 = OpFAdd %115 %117 
                                      f32_4 %119 = OpLoad vs_TEXCOORD1 
                                      f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                     OpStore vs_TEXCOORD1 %120 
                                Output f32* %122 = OpAccessChain %85 %33 %81 
                                        f32 %123 = OpLoad %122 
                                        f32 %124 = OpFNegate %123 
                                Output f32* %125 = OpAccessChain %85 %33 %81 
                                                     OpStore %125 %124 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 1500
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %132 %136 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD1 Location 11 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate vs_TEXCOORD0 Location 136 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %179 DescriptorSet 179 
                                                      OpDecorate %179 Binding 179 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %21 = OpTypePointer UniformConstant %20 
         UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                              %24 = OpTypeSampler 
                                              %25 = OpTypePointer UniformConstant %24 
                     UniformConstant sampler* %26 = OpVariable UniformConstant 
                                              %28 = OpTypeSampledImage %20 
                                              %33 = OpTypeInt 32 0 
                                          u32 %34 = OpConstant 0 
                                              %36 = OpTypePointer Private %6 
                                              %38 = OpTypeStruct %7 %6 %7 %6 %6 %6 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32; f32_4; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 0 
                                          u32 %43 = OpConstant 2 
                                              %44 = OpTypePointer Uniform %6 
                                          u32 %50 = OpConstant 3 
                                          f32 %55 = OpConstant 3.674022E-40 
                                 Private f32* %60 = OpVariable Private 
                                          i32 %61 = OpConstant 5 
                                          f32 %64 = OpConstant 3.674022E-40 
                                          i32 %71 = OpConstant 4 
                                          i32 %74 = OpConstant 3 
                                          f32 %79 = OpConstant 3.674022E-40 
                                         f32 %106 = OpConstant 3.674022E-40 
                                         f32 %108 = OpConstant 3.674022E-40 
                                             %121 = OpTypeBool 
                                             %122 = OpTypePointer Private %121 
                               Private bool* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 1 
                                             %131 = OpTypePointer Output %7 
                               Output f32_4* %132 = OpVariable Output 
                                             %135 = OpTypePointer Input %12 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %138 = OpConstant 7 
                                             %139 = OpTypePointer Uniform %7 
                                             %150 = OpTypePointer Private %12 
                              Private f32_2* %151 = OpVariable Private 
                                         i32 %154 = OpConstant 6 
                                         i32 %161 = OpConstant 2 
                              Private f32_4* %166 = OpVariable Private 
                                         f32 %169 = OpConstant 3.674022E-40 
                                         f32 %170 = OpConstant 3.674022E-40 
                                       f32_4 %171 = OpConstantComposite %169 %169 %170 %170 
                              Private f32_4* %176 = OpVariable Private 
        UniformConstant read_only Texture2D* %177 = OpVariable UniformConstant 
                    UniformConstant sampler* %179 = OpVariable UniformConstant 
                                             %185 = OpTypeVector %6 3 
                                             %189 = OpTypePointer Private %185 
                              Private f32_3* %190 = OpVariable Private 
                              Private f32_4* %198 = OpVariable Private 
                              Private f32_3* %213 = OpVariable Private 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_4 %239 = OpConstantComposite %55 %79 %106 %106 
                              Private f32_3* %244 = OpVariable Private 
                              Private f32_3* %252 = OpVariable Private 
                                         f32 %289 = OpConstant 3.674022E-40 
                                         f32 %290 = OpConstant 3.674022E-40 
                                       f32_4 %291 = OpConstantComposite %289 %79 %290 %169 
                                       f32_4 %339 = OpConstantComposite %108 %79 %79 %169 
                                         f32 %387 = OpConstant 3.674022E-40 
                                       f32_4 %388 = OpConstantComposite %387 %79 %169 %170 
                                       f32_4 %436 = OpConstantComposite %79 %55 %106 %170 
                                       f32_4 %527 = OpConstantComposite %289 %55 %290 %170 
                                       f32_4 %575 = OpConstantComposite %108 %55 %79 %170 
                                       f32_4 %623 = OpConstantComposite %387 %55 %169 %106 
                                       f32_4 %671 = OpConstantComposite %79 %289 %170 %106 
                                       f32_4 %719 = OpConstantComposite %55 %289 %290 %106 
                                       f32_2 %757 = OpConstantComposite %289 %289 
                                       f32_4 %812 = OpConstantComposite %108 %289 %79 %106 
                                       f32_4 %865 = OpConstantComposite %387 %289 %169 %290 
                                       f32_4 %918 = OpConstantComposite %79 %108 %170 %290 
                                       f32_4 %971 = OpConstantComposite %55 %108 %106 %290 
                                      f32_4 %1024 = OpConstantComposite %289 %108 %108 %108 
                                      f32_4 %1109 = OpConstantComposite %79 %290 %387 %108 
                                      f32_4 %1160 = OpConstantComposite %169 %79 %79 %387 
                                      f32_4 %1211 = OpConstantComposite %170 %79 %55 %387 
                                      f32_4 %1262 = OpConstantComposite %106 %79 %289 %387 
                                      f32_4 %1313 = OpConstantComposite %290 %79 %108 %387 
                                      f32_2 %1376 = OpConstantComposite %387 %387 
                                        f32 %1409 = OpConstant 3.674022E-40 
                                      f32_3 %1410 = OpConstantComposite %1409 %1409 %1409 
                               Private f32* %1430 = OpVariable Private 
                                        u32 %1431 = OpConstant 1 
                                        f32 %1445 = OpConstant 3.674022E-40 
                                      f32_4 %1450 = OpConstantComposite %79 %79 %79 %79 
                                            %1451 = OpTypeVector %121 4 
                              Private bool* %1488 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                          read_only Texture2D %23 = OpLoad %22 
                                      sampler %27 = OpLoad %26 
                   read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                                        f32_4 %30 = OpLoad %9 
                                        f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                        f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                          f32 %35 = OpCompositeExtract %32 0 
                                 Private f32* %37 = OpAccessChain %9 %34 
                                                      OpStore %37 %35 
                                 Uniform f32* %45 = OpAccessChain %40 %42 %43 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %34 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFMul %46 %48 
                                 Uniform f32* %51 = OpAccessChain %40 %42 %50 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %49 %52 
                                 Private f32* %54 = OpAccessChain %9 %34 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %9 %34 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFDiv %55 %57 
                                 Private f32* %59 = OpAccessChain %9 %34 
                                                      OpStore %59 %58 
                                 Uniform f32* %62 = OpAccessChain %40 %61 
                                          f32 %63 = OpLoad %62 
                                          f32 %65 = OpFMul %63 %64 
                                                      OpStore %60 %65 
                                 Private f32* %66 = OpAccessChain %9 %34 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpLoad %60 
                                          f32 %69 = OpFDiv %67 %68 
                                 Private f32* %70 = OpAccessChain %9 %34 
                                                      OpStore %70 %69 
                                 Uniform f32* %72 = OpAccessChain %40 %71 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %75 = OpAccessChain %40 %74 
                                          f32 %76 = OpLoad %75 
                                          f32 %77 = OpFAdd %73 %76 
                                                      OpStore %60 %77 
                                          f32 %78 = OpLoad %60 
                                          f32 %80 = OpExtInst %1 43 %78 %79 %55 
                                                      OpStore %60 %80 
                                          f32 %81 = OpLoad %60 
                                 Uniform f32* %82 = OpAccessChain %40 %74 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFNegate %83 
                                          f32 %85 = OpFAdd %81 %84 
                                                      OpStore %60 %85 
                                 Private f32* %86 = OpAccessChain %9 %34 
                                          f32 %87 = OpLoad %86 
                                 Uniform f32* %88 = OpAccessChain %40 %74 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %87 %90 
                                 Private f32* %92 = OpAccessChain %9 %34 
                                                      OpStore %92 %91 
                                          f32 %93 = OpLoad %60 
                                          f32 %94 = OpFDiv %55 %93 
                                                      OpStore %60 %94 
                                          f32 %95 = OpLoad %60 
                                 Private f32* %96 = OpAccessChain %9 %34 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %95 %97 
                                 Private f32* %99 = OpAccessChain %9 %34 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %9 %34 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpExtInst %1 43 %101 %79 %55 
                                Private f32* %103 = OpAccessChain %9 %34 
                                                      OpStore %103 %102 
                                Private f32* %104 = OpAccessChain %9 %34 
                                         f32 %105 = OpLoad %104 
                                         f32 %107 = OpFMul %105 %106 
                                         f32 %109 = OpFAdd %107 %108 
                                                      OpStore %60 %109 
                                Private f32* %110 = OpAccessChain %9 %34 
                                         f32 %111 = OpLoad %110 
                                Private f32* %112 = OpAccessChain %9 %34 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %111 %113 
                                Private f32* %115 = OpAccessChain %9 %34 
                                                      OpStore %115 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %116 0 0 0 0 
                                         f32 %118 = OpLoad %60 
                                       f32_4 %119 = OpCompositeConstruct %118 %118 %118 %118 
                                       f32_4 %120 = OpFMul %117 %119 
                                                      OpStore %9 %120 
                                Uniform f32* %125 = OpAccessChain %40 %124 
                                         f32 %126 = OpLoad %125 
                                        bool %127 = OpFOrdEqual %126 %55 
                                                      OpStore %123 %127 
                                        bool %128 = OpLoad %123 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                       f32_4 %133 = OpLoad %9 
                                                      OpStore %132 %133 
                                                      OpReturn
                                             %130 = OpLabel 
                                       f32_2 %137 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %140 = OpAccessChain %40 %138 
                                       f32_4 %141 = OpLoad %140 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 1 
                                       f32_2 %143 = OpFMul %137 %142 
                              Uniform f32_4* %144 = OpAccessChain %40 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 2 3 
                                       f32_2 %147 = OpFAdd %143 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 2 3 
                                                      OpStore %9 %149 
                                Private f32* %152 = OpAccessChain %9 %50 
                                         f32 %153 = OpLoad %152 
                                Uniform f32* %155 = OpAccessChain %40 %154 
                                         f32 %156 = OpLoad %155 
                                         f32 %157 = OpFMul %153 %156 
                                Private f32* %158 = OpAccessChain %151 %34 
                                                      OpStore %158 %157 
                                       f32_2 %159 = OpLoad %151 
                                       f32_2 %160 = OpVectorShuffle %159 %159 0 0 
                              Uniform f32_4* %162 = OpAccessChain %40 %161 
                                       f32_4 %163 = OpLoad %162 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                       f32_2 %165 = OpFDiv %160 %164 
                                                      OpStore %151 %165 
                                       f32_2 %167 = OpLoad %151 
                                       f32_4 %168 = OpVectorShuffle %167 %167 0 1 0 1 
                                       f32_4 %172 = OpFMul %168 %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 0 1 0 1 
                                       f32_4 %175 = OpFAdd %172 %174 
                                                      OpStore %166 %175 
                         read_only Texture2D %178 = OpLoad %177 
                                     sampler %180 = OpLoad %179 
                  read_only Texture2DSampled %181 = OpSampledImage %178 %180 
                                       f32_4 %182 = OpLoad %166 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                       f32_4 %184 = OpImageSampleImplicitLod %181 %183 
                                       f32_3 %186 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_4 %187 = OpLoad %176 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %176 %188 
                         read_only Texture2D %191 = OpLoad %177 
                                     sampler %192 = OpLoad %179 
                  read_only Texture2DSampled %193 = OpSampledImage %191 %192 
                                       f32_4 %194 = OpLoad %9 
                                       f32_2 %195 = OpVectorShuffle %194 %194 0 1 
                                       f32_4 %196 = OpImageSampleImplicitLod %193 %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                                      OpStore %190 %197 
                                       f32_3 %199 = OpLoad %190 
                                       f32_3 %200 = OpLoad %190 
                                       f32_3 %201 = OpFMul %199 %200 
                                       f32_4 %202 = OpLoad %198 
                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
                                                      OpStore %198 %203 
                         read_only Texture2D %204 = OpLoad %177 
                                     sampler %205 = OpLoad %179 
                  read_only Texture2DSampled %206 = OpSampledImage %204 %205 
                                       f32_4 %207 = OpLoad %166 
                                       f32_2 %208 = OpVectorShuffle %207 %207 2 3 
                                       f32_4 %209 = OpImageSampleImplicitLod %206 %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_4 %211 = OpLoad %166 
                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
                                                      OpStore %166 %212 
                                       f32_4 %214 = OpLoad %166 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_4 %216 = OpLoad %176 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_3 %218 = OpFAdd %215 %217 
                                                      OpStore %213 %218 
                                       f32_4 %220 = OpLoad %166 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_4 %222 = OpLoad %166 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_4 %225 = OpLoad %219 
                                       f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
                                                      OpStore %219 %226 
                                       f32_4 %227 = OpLoad %176 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_4 %229 = OpLoad %176 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_3 %231 = OpFMul %228 %230 
                                       f32_4 %232 = OpLoad %219 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFAdd %231 %233 
                                       f32_4 %235 = OpLoad %176 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %176 %236 
                                       f32_2 %237 = OpLoad %151 
                                       f32_4 %238 = OpVectorShuffle %237 %237 0 1 0 1 
                                       f32_4 %240 = OpFMul %238 %239 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpVectorShuffle %241 %241 0 1 0 1 
                                       f32_4 %243 = OpFAdd %240 %242 
                                                      OpStore %219 %243 
                         read_only Texture2D %245 = OpLoad %177 
                                     sampler %246 = OpLoad %179 
                  read_only Texture2DSampled %247 = OpSampledImage %245 %246 
                                       f32_4 %248 = OpLoad %219 
                                       f32_2 %249 = OpVectorShuffle %248 %248 0 1 
                                       f32_4 %250 = OpImageSampleImplicitLod %247 %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                                      OpStore %244 %251 
                                       f32_3 %253 = OpLoad %190 
                                       f32_3 %254 = OpLoad %244 
                                       f32_3 %255 = OpFAdd %253 %254 
                                                      OpStore %252 %255 
                                       f32_3 %256 = OpLoad %244 
                                       f32_3 %257 = OpLoad %244 
                                       f32_3 %258 = OpFMul %256 %257 
                                       f32_4 %259 = OpLoad %198 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFAdd %258 %260 
                                       f32_4 %262 = OpLoad %198 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %198 %263 
                         read_only Texture2D %264 = OpLoad %177 
                                     sampler %265 = OpLoad %179 
                  read_only Texture2DSampled %266 = OpSampledImage %264 %265 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 2 3 
                                       f32_4 %269 = OpImageSampleImplicitLod %266 %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %219 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %219 %272 
                                       f32_3 %273 = OpLoad %213 
                                       f32_4 %274 = OpLoad %219 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpFAdd %273 %275 
                                                      OpStore %213 %276 
                                       f32_4 %277 = OpLoad %219 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_4 %279 = OpLoad %219 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %176 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFAdd %281 %283 
                                       f32_4 %285 = OpLoad %176 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %176 %286 
                                       f32_2 %287 = OpLoad %151 
                                       f32_4 %288 = OpVectorShuffle %287 %287 0 1 0 1 
                                       f32_4 %292 = OpFMul %288 %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 1 0 1 
                                       f32_4 %295 = OpFAdd %292 %294 
                                                      OpStore %219 %295 
                         read_only Texture2D %296 = OpLoad %177 
                                     sampler %297 = OpLoad %179 
                  read_only Texture2DSampled %298 = OpSampledImage %296 %297 
                                       f32_4 %299 = OpLoad %219 
                                       f32_2 %300 = OpVectorShuffle %299 %299 0 1 
                                       f32_4 %301 = OpImageSampleImplicitLod %298 %300 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                                                      OpStore %244 %302 
                                       f32_3 %303 = OpLoad %244 
                                       f32_3 %304 = OpLoad %252 
                                       f32_3 %305 = OpFAdd %303 %304 
                                                      OpStore %252 %305 
                                       f32_3 %306 = OpLoad %244 
                                       f32_3 %307 = OpLoad %244 
                                       f32_3 %308 = OpFMul %306 %307 
                                       f32_4 %309 = OpLoad %198 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpFAdd %308 %310 
                                       f32_4 %312 = OpLoad %198 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
                                                      OpStore %198 %313 
                         read_only Texture2D %314 = OpLoad %177 
                                     sampler %315 = OpLoad %179 
                  read_only Texture2DSampled %316 = OpSampledImage %314 %315 
                                       f32_4 %317 = OpLoad %219 
                                       f32_2 %318 = OpVectorShuffle %317 %317 2 3 
                                       f32_4 %319 = OpImageSampleImplicitLod %316 %318 
                                       f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                                       f32_4 %321 = OpLoad %219 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %219 %322 
                                       f32_3 %323 = OpLoad %213 
                                       f32_4 %324 = OpLoad %219 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFAdd %323 %325 
                                                      OpStore %213 %326 
                                       f32_4 %327 = OpLoad %219 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_4 %329 = OpLoad %219 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                                       f32_3 %331 = OpFMul %328 %330 
                                       f32_4 %332 = OpLoad %176 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFAdd %331 %333 
                                       f32_4 %335 = OpLoad %176 
                                       f32_4 %336 = OpVectorShuffle %335 %334 4 5 6 3 
                                                      OpStore %176 %336 
                                       f32_2 %337 = OpLoad %151 
                                       f32_4 %338 = OpVectorShuffle %337 %337 0 1 0 1 
                                       f32_4 %340 = OpFMul %338 %339 
                                       f32_4 %341 = OpLoad %9 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 1 0 1 
                                       f32_4 %343 = OpFAdd %340 %342 
                                                      OpStore %219 %343 
                         read_only Texture2D %344 = OpLoad %177 
                                     sampler %345 = OpLoad %179 
                  read_only Texture2DSampled %346 = OpSampledImage %344 %345 
                                       f32_4 %347 = OpLoad %219 
                                       f32_2 %348 = OpVectorShuffle %347 %347 0 1 
                                       f32_4 %349 = OpImageSampleImplicitLod %346 %348 
                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
                                                      OpStore %244 %350 
                                       f32_3 %351 = OpLoad %244 
                                       f32_3 %352 = OpLoad %252 
                                       f32_3 %353 = OpFAdd %351 %352 
                                                      OpStore %252 %353 
                                       f32_3 %354 = OpLoad %244 
                                       f32_3 %355 = OpLoad %244 
                                       f32_3 %356 = OpFMul %354 %355 
                                       f32_4 %357 = OpLoad %198 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                                       f32_3 %359 = OpFAdd %356 %358 
                                       f32_4 %360 = OpLoad %198 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 5 6 3 
                                                      OpStore %198 %361 
                         read_only Texture2D %362 = OpLoad %177 
                                     sampler %363 = OpLoad %179 
                  read_only Texture2DSampled %364 = OpSampledImage %362 %363 
                                       f32_4 %365 = OpLoad %219 
                                       f32_2 %366 = OpVectorShuffle %365 %365 2 3 
                                       f32_4 %367 = OpImageSampleImplicitLod %364 %366 
                                       f32_3 %368 = OpVectorShuffle %367 %367 0 1 2 
                                       f32_4 %369 = OpLoad %219 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %219 %370 
                                       f32_3 %371 = OpLoad %213 
                                       f32_4 %372 = OpLoad %219 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                                      OpStore %213 %374 
                                       f32_4 %375 = OpLoad %219 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_4 %377 = OpLoad %219 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpFMul %376 %378 
                                       f32_4 %380 = OpLoad %176 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                                       f32_3 %382 = OpFAdd %379 %381 
                                       f32_4 %383 = OpLoad %176 
                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
                                                      OpStore %176 %384 
                                       f32_2 %385 = OpLoad %151 
                                       f32_4 %386 = OpVectorShuffle %385 %385 0 1 0 1 
                                       f32_4 %389 = OpFMul %386 %388 
                                       f32_4 %390 = OpLoad %9 
                                       f32_4 %391 = OpVectorShuffle %390 %390 0 1 0 1 
                                       f32_4 %392 = OpFAdd %389 %391 
                                                      OpStore %219 %392 
                         read_only Texture2D %393 = OpLoad %177 
                                     sampler %394 = OpLoad %179 
                  read_only Texture2DSampled %395 = OpSampledImage %393 %394 
                                       f32_4 %396 = OpLoad %219 
                                       f32_2 %397 = OpVectorShuffle %396 %396 0 1 
                                       f32_4 %398 = OpImageSampleImplicitLod %395 %397 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                                      OpStore %244 %399 
                                       f32_3 %400 = OpLoad %244 
                                       f32_3 %401 = OpLoad %252 
                                       f32_3 %402 = OpFAdd %400 %401 
                                                      OpStore %252 %402 
                                       f32_3 %403 = OpLoad %244 
                                       f32_3 %404 = OpLoad %244 
                                       f32_3 %405 = OpFMul %403 %404 
                                       f32_4 %406 = OpLoad %198 
                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                       f32_3 %408 = OpFAdd %405 %407 
                                       f32_4 %409 = OpLoad %198 
                                       f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
                                                      OpStore %198 %410 
                         read_only Texture2D %411 = OpLoad %177 
                                     sampler %412 = OpLoad %179 
                  read_only Texture2DSampled %413 = OpSampledImage %411 %412 
                                       f32_4 %414 = OpLoad %219 
                                       f32_2 %415 = OpVectorShuffle %414 %414 2 3 
                                       f32_4 %416 = OpImageSampleImplicitLod %413 %415 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                                       f32_4 %418 = OpLoad %219 
                                       f32_4 %419 = OpVectorShuffle %418 %417 4 5 6 3 
                                                      OpStore %219 %419 
                                       f32_3 %420 = OpLoad %213 
                                       f32_4 %421 = OpLoad %219 
                                       f32_3 %422 = OpVectorShuffle %421 %421 0 1 2 
                                       f32_3 %423 = OpFAdd %420 %422 
                                                      OpStore %213 %423 
                                       f32_4 %424 = OpLoad %219 
                                       f32_3 %425 = OpVectorShuffle %424 %424 0 1 2 
                                       f32_4 %426 = OpLoad %219 
                                       f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
                                       f32_3 %428 = OpFMul %425 %427 
                                       f32_4 %429 = OpLoad %176 
                                       f32_3 %430 = OpVectorShuffle %429 %429 0 1 2 
                                       f32_3 %431 = OpFAdd %428 %430 
                                       f32_4 %432 = OpLoad %176 
                                       f32_4 %433 = OpVectorShuffle %432 %431 4 5 6 3 
                                                      OpStore %176 %433 
                                       f32_2 %434 = OpLoad %151 
                                       f32_4 %435 = OpVectorShuffle %434 %434 0 1 0 1 
                                       f32_4 %437 = OpFMul %435 %436 
                                       f32_4 %438 = OpLoad %9 
                                       f32_4 %439 = OpVectorShuffle %438 %438 0 1 0 1 
                                       f32_4 %440 = OpFAdd %437 %439 
                                                      OpStore %219 %440 
                         read_only Texture2D %441 = OpLoad %177 
                                     sampler %442 = OpLoad %179 
                  read_only Texture2DSampled %443 = OpSampledImage %441 %442 
                                       f32_4 %444 = OpLoad %219 
                                       f32_2 %445 = OpVectorShuffle %444 %444 0 1 
                                       f32_4 %446 = OpImageSampleImplicitLod %443 %445 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                                      OpStore %244 %447 
                                       f32_3 %448 = OpLoad %244 
                                       f32_3 %449 = OpLoad %252 
                                       f32_3 %450 = OpFAdd %448 %449 
                                                      OpStore %252 %450 
                                       f32_3 %451 = OpLoad %244 
                                       f32_3 %452 = OpLoad %244 
                                       f32_3 %453 = OpFMul %451 %452 
                                       f32_4 %454 = OpLoad %198 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_3 %456 = OpFAdd %453 %455 
                                       f32_4 %457 = OpLoad %198 
                                       f32_4 %458 = OpVectorShuffle %457 %456 4 5 6 3 
                                                      OpStore %198 %458 
                                       f32_4 %459 = OpLoad %166 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_3 %461 = OpLoad %213 
                                       f32_3 %462 = OpFAdd %460 %461 
                                                      OpStore %213 %462 
                                       f32_4 %463 = OpLoad %166 
                                       f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
                                       f32_4 %465 = OpLoad %166 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_3 %467 = OpFMul %464 %466 
                                       f32_4 %468 = OpLoad %176 
                                       f32_3 %469 = OpVectorShuffle %468 %468 0 1 2 
                                       f32_3 %470 = OpFAdd %467 %469 
                                       f32_4 %471 = OpLoad %166 
                                       f32_4 %472 = OpVectorShuffle %471 %470 4 5 6 3 
                                                      OpStore %166 %472 
                                       f32_2 %473 = OpLoad %151 
                                       f32_4 %474 = OpLoad %9 
                                       f32_2 %475 = OpVectorShuffle %474 %474 0 1 
                                       f32_2 %476 = OpFAdd %473 %475 
                                       f32_4 %477 = OpLoad %176 
                                       f32_4 %478 = OpVectorShuffle %477 %476 4 5 2 3 
                                                      OpStore %176 %478 
                         read_only Texture2D %479 = OpLoad %177 
                                     sampler %480 = OpLoad %179 
                  read_only Texture2DSampled %481 = OpSampledImage %479 %480 
                                       f32_4 %482 = OpLoad %176 
                                       f32_2 %483 = OpVectorShuffle %482 %482 0 1 
                                       f32_4 %484 = OpImageSampleImplicitLod %481 %483 
                                       f32_3 %485 = OpVectorShuffle %484 %484 0 1 2 
                                       f32_4 %486 = OpLoad %176 
                                       f32_4 %487 = OpVectorShuffle %486 %485 4 5 6 3 
                                                      OpStore %176 %487 
                                       f32_4 %488 = OpLoad %176 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpLoad %252 
                                       f32_3 %491 = OpFAdd %489 %490 
                                                      OpStore %244 %491 
                                       f32_4 %492 = OpLoad %176 
                                       f32_3 %493 = OpVectorShuffle %492 %492 0 1 2 
                                       f32_4 %494 = OpLoad %176 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpFMul %493 %495 
                                       f32_4 %497 = OpLoad %198 
                                       f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
                                       f32_3 %499 = OpFAdd %496 %498 
                                       f32_4 %500 = OpLoad %176 
                                       f32_4 %501 = OpVectorShuffle %500 %499 4 5 6 3 
                                                      OpStore %176 %501 
                         read_only Texture2D %502 = OpLoad %177 
                                     sampler %503 = OpLoad %179 
                  read_only Texture2DSampled %504 = OpSampledImage %502 %503 
                                       f32_4 %505 = OpLoad %219 
                                       f32_2 %506 = OpVectorShuffle %505 %505 2 3 
                                       f32_4 %507 = OpImageSampleImplicitLod %504 %506 
                                       f32_3 %508 = OpVectorShuffle %507 %507 0 1 2 
                                       f32_4 %509 = OpLoad %198 
                                       f32_4 %510 = OpVectorShuffle %509 %508 4 5 6 3 
                                                      OpStore %198 %510 
                                       f32_4 %511 = OpLoad %198 
                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
                                       f32_3 %513 = OpLoad %213 
                                       f32_3 %514 = OpFAdd %512 %513 
                                                      OpStore %213 %514 
                                       f32_4 %515 = OpLoad %198 
                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
                                       f32_4 %517 = OpLoad %198 
                                       f32_3 %518 = OpVectorShuffle %517 %517 0 1 2 
                                       f32_3 %519 = OpFMul %516 %518 
                                       f32_4 %520 = OpLoad %166 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %522 = OpFAdd %519 %521 
                                       f32_4 %523 = OpLoad %166 
                                       f32_4 %524 = OpVectorShuffle %523 %522 4 5 6 3 
                                                      OpStore %166 %524 
                                       f32_2 %525 = OpLoad %151 
                                       f32_4 %526 = OpVectorShuffle %525 %525 0 1 0 1 
                                       f32_4 %528 = OpFMul %526 %527 
                                       f32_4 %529 = OpLoad %9 
                                       f32_4 %530 = OpVectorShuffle %529 %529 0 1 0 1 
                                       f32_4 %531 = OpFAdd %528 %530 
                                                      OpStore %219 %531 
                         read_only Texture2D %532 = OpLoad %177 
                                     sampler %533 = OpLoad %179 
                  read_only Texture2DSampled %534 = OpSampledImage %532 %533 
                                       f32_4 %535 = OpLoad %219 
                                       f32_2 %536 = OpVectorShuffle %535 %535 0 1 
                                       f32_4 %537 = OpImageSampleImplicitLod %534 %536 
                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
                                                      OpStore %252 %538 
                                       f32_3 %539 = OpLoad %244 
                                       f32_3 %540 = OpLoad %252 
                                       f32_3 %541 = OpFAdd %539 %540 
                                                      OpStore %244 %541 
                                       f32_3 %542 = OpLoad %252 
                                       f32_3 %543 = OpLoad %252 
                                       f32_3 %544 = OpFMul %542 %543 
                                       f32_4 %545 = OpLoad %176 
                                       f32_3 %546 = OpVectorShuffle %545 %545 0 1 2 
                                       f32_3 %547 = OpFAdd %544 %546 
                                       f32_4 %548 = OpLoad %176 
                                       f32_4 %549 = OpVectorShuffle %548 %547 4 5 6 3 
                                                      OpStore %176 %549 
                         read_only Texture2D %550 = OpLoad %177 
                                     sampler %551 = OpLoad %179 
                  read_only Texture2DSampled %552 = OpSampledImage %550 %551 
                                       f32_4 %553 = OpLoad %219 
                                       f32_2 %554 = OpVectorShuffle %553 %553 2 3 
                                       f32_4 %555 = OpImageSampleImplicitLod %552 %554 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                       f32_4 %557 = OpLoad %219 
                                       f32_4 %558 = OpVectorShuffle %557 %556 4 5 6 3 
                                                      OpStore %219 %558 
                                       f32_3 %559 = OpLoad %213 
                                       f32_4 %560 = OpLoad %219 
                                       f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                                       f32_3 %562 = OpFAdd %559 %561 
                                                      OpStore %213 %562 
                                       f32_4 %563 = OpLoad %219 
                                       f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
                                       f32_4 %565 = OpLoad %219 
                                       f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                       f32_3 %567 = OpFMul %564 %566 
                                       f32_4 %568 = OpLoad %166 
                                       f32_3 %569 = OpVectorShuffle %568 %568 0 1 2 
                                       f32_3 %570 = OpFAdd %567 %569 
                                       f32_4 %571 = OpLoad %166 
                                       f32_4 %572 = OpVectorShuffle %571 %570 4 5 6 3 
                                                      OpStore %166 %572 
                                       f32_2 %573 = OpLoad %151 
                                       f32_4 %574 = OpVectorShuffle %573 %573 0 1 0 1 
                                       f32_4 %576 = OpFMul %574 %575 
                                       f32_4 %577 = OpLoad %9 
                                       f32_4 %578 = OpVectorShuffle %577 %577 0 1 0 1 
                                       f32_4 %579 = OpFAdd %576 %578 
                                                      OpStore %219 %579 
                         read_only Texture2D %580 = OpLoad %177 
                                     sampler %581 = OpLoad %179 
                  read_only Texture2DSampled %582 = OpSampledImage %580 %581 
                                       f32_4 %583 = OpLoad %219 
                                       f32_2 %584 = OpVectorShuffle %583 %583 0 1 
                                       f32_4 %585 = OpImageSampleImplicitLod %582 %584 
                                       f32_3 %586 = OpVectorShuffle %585 %585 0 1 2 
                                                      OpStore %252 %586 
                                       f32_3 %587 = OpLoad %244 
                                       f32_3 %588 = OpLoad %252 
                                       f32_3 %589 = OpFAdd %587 %588 
                                                      OpStore %244 %589 
                                       f32_3 %590 = OpLoad %252 
                                       f32_3 %591 = OpLoad %252 
                                       f32_3 %592 = OpFMul %590 %591 
                                       f32_4 %593 = OpLoad %176 
                                       f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                       f32_3 %595 = OpFAdd %592 %594 
                                       f32_4 %596 = OpLoad %176 
                                       f32_4 %597 = OpVectorShuffle %596 %595 4 5 6 3 
                                                      OpStore %176 %597 
                         read_only Texture2D %598 = OpLoad %177 
                                     sampler %599 = OpLoad %179 
                  read_only Texture2DSampled %600 = OpSampledImage %598 %599 
                                       f32_4 %601 = OpLoad %219 
                                       f32_2 %602 = OpVectorShuffle %601 %601 2 3 
                                       f32_4 %603 = OpImageSampleImplicitLod %600 %602 
                                       f32_3 %604 = OpVectorShuffle %603 %603 0 1 2 
                                       f32_4 %605 = OpLoad %219 
                                       f32_4 %606 = OpVectorShuffle %605 %604 4 5 6 3 
                                                      OpStore %219 %606 
                                       f32_3 %607 = OpLoad %213 
                                       f32_4 %608 = OpLoad %219 
                                       f32_3 %609 = OpVectorShuffle %608 %608 0 1 2 
                                       f32_3 %610 = OpFAdd %607 %609 
                                                      OpStore %213 %610 
                                       f32_4 %611 = OpLoad %219 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_4 %613 = OpLoad %219 
                                       f32_3 %614 = OpVectorShuffle %613 %613 0 1 2 
                                       f32_3 %615 = OpFMul %612 %614 
                                       f32_4 %616 = OpLoad %166 
                                       f32_3 %617 = OpVectorShuffle %616 %616 0 1 2 
                                       f32_3 %618 = OpFAdd %615 %617 
                                       f32_4 %619 = OpLoad %166 
                                       f32_4 %620 = OpVectorShuffle %619 %618 4 5 6 3 
                                                      OpStore %166 %620 
                                       f32_2 %621 = OpLoad %151 
                                       f32_4 %622 = OpVectorShuffle %621 %621 0 1 0 1 
                                       f32_4 %624 = OpFMul %622 %623 
                                       f32_4 %625 = OpLoad %9 
                                       f32_4 %626 = OpVectorShuffle %625 %625 0 1 0 1 
                                       f32_4 %627 = OpFAdd %624 %626 
                                                      OpStore %219 %627 
                         read_only Texture2D %628 = OpLoad %177 
                                     sampler %629 = OpLoad %179 
                  read_only Texture2DSampled %630 = OpSampledImage %628 %629 
                                       f32_4 %631 = OpLoad %219 
                                       f32_2 %632 = OpVectorShuffle %631 %631 0 1 
                                       f32_4 %633 = OpImageSampleImplicitLod %630 %632 
                                       f32_3 %634 = OpVectorShuffle %633 %633 0 1 2 
                                                      OpStore %252 %634 
                                       f32_3 %635 = OpLoad %244 
                                       f32_3 %636 = OpLoad %252 
                                       f32_3 %637 = OpFAdd %635 %636 
                                                      OpStore %244 %637 
                                       f32_3 %638 = OpLoad %252 
                                       f32_3 %639 = OpLoad %252 
                                       f32_3 %640 = OpFMul %638 %639 
                                       f32_4 %641 = OpLoad %176 
                                       f32_3 %642 = OpVectorShuffle %641 %641 0 1 2 
                                       f32_3 %643 = OpFAdd %640 %642 
                                       f32_4 %644 = OpLoad %176 
                                       f32_4 %645 = OpVectorShuffle %644 %643 4 5 6 3 
                                                      OpStore %176 %645 
                         read_only Texture2D %646 = OpLoad %177 
                                     sampler %647 = OpLoad %179 
                  read_only Texture2DSampled %648 = OpSampledImage %646 %647 
                                       f32_4 %649 = OpLoad %219 
                                       f32_2 %650 = OpVectorShuffle %649 %649 2 3 
                                       f32_4 %651 = OpImageSampleImplicitLod %648 %650 
                                       f32_3 %652 = OpVectorShuffle %651 %651 0 1 2 
                                       f32_4 %653 = OpLoad %219 
                                       f32_4 %654 = OpVectorShuffle %653 %652 4 5 6 3 
                                                      OpStore %219 %654 
                                       f32_3 %655 = OpLoad %213 
                                       f32_4 %656 = OpLoad %219 
                                       f32_3 %657 = OpVectorShuffle %656 %656 0 1 2 
                                       f32_3 %658 = OpFAdd %655 %657 
                                                      OpStore %213 %658 
                                       f32_4 %659 = OpLoad %219 
                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
                                       f32_4 %661 = OpLoad %219 
                                       f32_3 %662 = OpVectorShuffle %661 %661 0 1 2 
                                       f32_3 %663 = OpFMul %660 %662 
                                       f32_4 %664 = OpLoad %166 
                                       f32_3 %665 = OpVectorShuffle %664 %664 0 1 2 
                                       f32_3 %666 = OpFAdd %663 %665 
                                       f32_4 %667 = OpLoad %166 
                                       f32_4 %668 = OpVectorShuffle %667 %666 4 5 6 3 
                                                      OpStore %166 %668 
                                       f32_2 %669 = OpLoad %151 
                                       f32_4 %670 = OpVectorShuffle %669 %669 0 1 0 1 
                                       f32_4 %672 = OpFMul %670 %671 
                                       f32_4 %673 = OpLoad %9 
                                       f32_4 %674 = OpVectorShuffle %673 %673 0 1 0 1 
                                       f32_4 %675 = OpFAdd %672 %674 
                                                      OpStore %219 %675 
                         read_only Texture2D %676 = OpLoad %177 
                                     sampler %677 = OpLoad %179 
                  read_only Texture2DSampled %678 = OpSampledImage %676 %677 
                                       f32_4 %679 = OpLoad %219 
                                       f32_2 %680 = OpVectorShuffle %679 %679 0 1 
                                       f32_4 %681 = OpImageSampleImplicitLod %678 %680 
                                       f32_3 %682 = OpVectorShuffle %681 %681 0 1 2 
                                                      OpStore %252 %682 
                                       f32_3 %683 = OpLoad %244 
                                       f32_3 %684 = OpLoad %252 
                                       f32_3 %685 = OpFAdd %683 %684 
                                                      OpStore %244 %685 
                                       f32_3 %686 = OpLoad %252 
                                       f32_3 %687 = OpLoad %252 
                                       f32_3 %688 = OpFMul %686 %687 
                                       f32_4 %689 = OpLoad %176 
                                       f32_3 %690 = OpVectorShuffle %689 %689 0 1 2 
                                       f32_3 %691 = OpFAdd %688 %690 
                                       f32_4 %692 = OpLoad %176 
                                       f32_4 %693 = OpVectorShuffle %692 %691 4 5 6 3 
                                                      OpStore %176 %693 
                         read_only Texture2D %694 = OpLoad %177 
                                     sampler %695 = OpLoad %179 
                  read_only Texture2DSampled %696 = OpSampledImage %694 %695 
                                       f32_4 %697 = OpLoad %219 
                                       f32_2 %698 = OpVectorShuffle %697 %697 2 3 
                                       f32_4 %699 = OpImageSampleImplicitLod %696 %698 
                                       f32_3 %700 = OpVectorShuffle %699 %699 0 1 2 
                                       f32_4 %701 = OpLoad %219 
                                       f32_4 %702 = OpVectorShuffle %701 %700 4 5 6 3 
                                                      OpStore %219 %702 
                                       f32_3 %703 = OpLoad %213 
                                       f32_4 %704 = OpLoad %219 
                                       f32_3 %705 = OpVectorShuffle %704 %704 0 1 2 
                                       f32_3 %706 = OpFAdd %703 %705 
                                                      OpStore %213 %706 
                                       f32_4 %707 = OpLoad %219 
                                       f32_3 %708 = OpVectorShuffle %707 %707 0 1 2 
                                       f32_4 %709 = OpLoad %219 
                                       f32_3 %710 = OpVectorShuffle %709 %709 0 1 2 
                                       f32_3 %711 = OpFMul %708 %710 
                                       f32_4 %712 = OpLoad %166 
                                       f32_3 %713 = OpVectorShuffle %712 %712 0 1 2 
                                       f32_3 %714 = OpFAdd %711 %713 
                                       f32_4 %715 = OpLoad %166 
                                       f32_4 %716 = OpVectorShuffle %715 %714 4 5 6 3 
                                                      OpStore %166 %716 
                                       f32_2 %717 = OpLoad %151 
                                       f32_4 %718 = OpVectorShuffle %717 %717 0 1 0 1 
                                       f32_4 %720 = OpFMul %718 %719 
                                       f32_4 %721 = OpLoad %9 
                                       f32_4 %722 = OpVectorShuffle %721 %721 0 1 0 1 
                                       f32_4 %723 = OpFAdd %720 %722 
                                                      OpStore %219 %723 
                         read_only Texture2D %724 = OpLoad %177 
                                     sampler %725 = OpLoad %179 
                  read_only Texture2DSampled %726 = OpSampledImage %724 %725 
                                       f32_4 %727 = OpLoad %219 
                                       f32_2 %728 = OpVectorShuffle %727 %727 0 1 
                                       f32_4 %729 = OpImageSampleImplicitLod %726 %728 
                                       f32_3 %730 = OpVectorShuffle %729 %729 0 1 2 
                                                      OpStore %252 %730 
                                       f32_3 %731 = OpLoad %244 
                                       f32_3 %732 = OpLoad %252 
                                       f32_3 %733 = OpFAdd %731 %732 
                                                      OpStore %244 %733 
                                       f32_3 %734 = OpLoad %252 
                                       f32_3 %735 = OpLoad %252 
                                       f32_3 %736 = OpFMul %734 %735 
                                       f32_4 %737 = OpLoad %176 
                                       f32_3 %738 = OpVectorShuffle %737 %737 0 1 2 
                                       f32_3 %739 = OpFAdd %736 %738 
                                       f32_4 %740 = OpLoad %176 
                                       f32_4 %741 = OpVectorShuffle %740 %739 4 5 6 3 
                                                      OpStore %176 %741 
                                       f32_4 %742 = OpLoad %198 
                                       f32_3 %743 = OpVectorShuffle %742 %742 0 1 2 
                                       f32_3 %744 = OpLoad %213 
                                       f32_3 %745 = OpFAdd %743 %744 
                                                      OpStore %213 %745 
                                       f32_4 %746 = OpLoad %198 
                                       f32_3 %747 = OpVectorShuffle %746 %746 0 1 2 
                                       f32_4 %748 = OpLoad %198 
                                       f32_3 %749 = OpVectorShuffle %748 %748 0 1 2 
                                       f32_3 %750 = OpFMul %747 %749 
                                       f32_4 %751 = OpLoad %166 
                                       f32_3 %752 = OpVectorShuffle %751 %751 0 1 2 
                                       f32_3 %753 = OpFAdd %750 %752 
                                       f32_4 %754 = OpLoad %166 
                                       f32_4 %755 = OpVectorShuffle %754 %753 4 5 6 3 
                                                      OpStore %166 %755 
                                       f32_2 %756 = OpLoad %151 
                                       f32_2 %758 = OpFMul %756 %757 
                                       f32_4 %759 = OpLoad %9 
                                       f32_2 %760 = OpVectorShuffle %759 %759 0 1 
                                       f32_2 %761 = OpFAdd %758 %760 
                                       f32_4 %762 = OpLoad %198 
                                       f32_4 %763 = OpVectorShuffle %762 %761 4 5 2 3 
                                                      OpStore %198 %763 
                         read_only Texture2D %764 = OpLoad %177 
                                     sampler %765 = OpLoad %179 
                  read_only Texture2DSampled %766 = OpSampledImage %764 %765 
                                       f32_4 %767 = OpLoad %198 
                                       f32_2 %768 = OpVectorShuffle %767 %767 0 1 
                                       f32_4 %769 = OpImageSampleImplicitLod %766 %768 
                                       f32_3 %770 = OpVectorShuffle %769 %769 0 1 2 
                                       f32_4 %771 = OpLoad %198 
                                       f32_4 %772 = OpVectorShuffle %771 %770 4 5 6 3 
                                                      OpStore %198 %772 
                                       f32_4 %773 = OpLoad %198 
                                       f32_3 %774 = OpVectorShuffle %773 %773 0 1 2 
                                       f32_3 %775 = OpLoad %244 
                                       f32_3 %776 = OpFAdd %774 %775 
                                                      OpStore %244 %776 
                                       f32_4 %777 = OpLoad %198 
                                       f32_3 %778 = OpVectorShuffle %777 %777 0 1 2 
                                       f32_4 %779 = OpLoad %198 
                                       f32_3 %780 = OpVectorShuffle %779 %779 0 1 2 
                                       f32_3 %781 = OpFMul %778 %780 
                                       f32_4 %782 = OpLoad %176 
                                       f32_3 %783 = OpVectorShuffle %782 %782 0 1 2 
                                       f32_3 %784 = OpFAdd %781 %783 
                                       f32_4 %785 = OpLoad %176 
                                       f32_4 %786 = OpVectorShuffle %785 %784 4 5 6 3 
                                                      OpStore %176 %786 
                         read_only Texture2D %787 = OpLoad %177 
                                     sampler %788 = OpLoad %179 
                  read_only Texture2DSampled %789 = OpSampledImage %787 %788 
                                       f32_4 %790 = OpLoad %219 
                                       f32_2 %791 = OpVectorShuffle %790 %790 2 3 
                                       f32_4 %792 = OpImageSampleImplicitLod %789 %791 
                                       f32_3 %793 = OpVectorShuffle %792 %792 0 1 2 
                                       f32_4 %794 = OpLoad %198 
                                       f32_4 %795 = OpVectorShuffle %794 %793 4 5 6 3 
                                                      OpStore %198 %795 
                                       f32_4 %796 = OpLoad %198 
                                       f32_3 %797 = OpVectorShuffle %796 %796 0 1 2 
                                       f32_3 %798 = OpLoad %213 
                                       f32_3 %799 = OpFAdd %797 %798 
                                                      OpStore %213 %799 
                                       f32_4 %800 = OpLoad %198 
                                       f32_3 %801 = OpVectorShuffle %800 %800 0 1 2 
                                       f32_4 %802 = OpLoad %198 
                                       f32_3 %803 = OpVectorShuffle %802 %802 0 1 2 
                                       f32_3 %804 = OpFMul %801 %803 
                                       f32_4 %805 = OpLoad %166 
                                       f32_3 %806 = OpVectorShuffle %805 %805 0 1 2 
                                       f32_3 %807 = OpFAdd %804 %806 
                                       f32_4 %808 = OpLoad %166 
                                       f32_4 %809 = OpVectorShuffle %808 %807 4 5 6 3 
                                                      OpStore %166 %809 
                                       f32_2 %810 = OpLoad %151 
                                       f32_4 %811 = OpVectorShuffle %810 %810 0 1 0 1 
                                       f32_4 %813 = OpFMul %811 %812 
                                       f32_4 %814 = OpLoad %9 
                                       f32_4 %815 = OpVectorShuffle %814 %814 0 1 0 1 
                                       f32_4 %816 = OpFAdd %813 %815 
                                                      OpStore %198 %816 
                         read_only Texture2D %817 = OpLoad %177 
                                     sampler %818 = OpLoad %179 
                  read_only Texture2DSampled %819 = OpSampledImage %817 %818 
                                       f32_4 %820 = OpLoad %198 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 1 
                                       f32_4 %822 = OpImageSampleImplicitLod %819 %821 
                                       f32_3 %823 = OpVectorShuffle %822 %822 0 1 2 
                                       f32_4 %824 = OpLoad %219 
                                       f32_4 %825 = OpVectorShuffle %824 %823 4 5 6 3 
                                                      OpStore %219 %825 
                                       f32_4 %826 = OpLoad %219 
                                       f32_3 %827 = OpVectorShuffle %826 %826 0 1 2 
                                       f32_3 %828 = OpLoad %244 
                                       f32_3 %829 = OpFAdd %827 %828 
                                                      OpStore %244 %829 
                                       f32_4 %830 = OpLoad %219 
                                       f32_3 %831 = OpVectorShuffle %830 %830 0 1 2 
                                       f32_4 %832 = OpLoad %219 
                                       f32_3 %833 = OpVectorShuffle %832 %832 0 1 2 
                                       f32_3 %834 = OpFMul %831 %833 
                                       f32_4 %835 = OpLoad %176 
                                       f32_3 %836 = OpVectorShuffle %835 %835 0 1 2 
                                       f32_3 %837 = OpFAdd %834 %836 
                                       f32_4 %838 = OpLoad %176 
                                       f32_4 %839 = OpVectorShuffle %838 %837 4 5 6 3 
                                                      OpStore %176 %839 
                         read_only Texture2D %840 = OpLoad %177 
                                     sampler %841 = OpLoad %179 
                  read_only Texture2DSampled %842 = OpSampledImage %840 %841 
                                       f32_4 %843 = OpLoad %198 
                                       f32_2 %844 = OpVectorShuffle %843 %843 2 3 
                                       f32_4 %845 = OpImageSampleImplicitLod %842 %844 
                                       f32_3 %846 = OpVectorShuffle %845 %845 0 1 2 
                                       f32_4 %847 = OpLoad %198 
                                       f32_4 %848 = OpVectorShuffle %847 %846 4 5 6 3 
                                                      OpStore %198 %848 
                                       f32_4 %849 = OpLoad %198 
                                       f32_3 %850 = OpVectorShuffle %849 %849 0 1 2 
                                       f32_3 %851 = OpLoad %213 
                                       f32_3 %852 = OpFAdd %850 %851 
                                                      OpStore %213 %852 
                                       f32_4 %853 = OpLoad %198 
                                       f32_3 %854 = OpVectorShuffle %853 %853 0 1 2 
                                       f32_4 %855 = OpLoad %198 
                                       f32_3 %856 = OpVectorShuffle %855 %855 0 1 2 
                                       f32_3 %857 = OpFMul %854 %856 
                                       f32_4 %858 = OpLoad %166 
                                       f32_3 %859 = OpVectorShuffle %858 %858 0 1 2 
                                       f32_3 %860 = OpFAdd %857 %859 
                                       f32_4 %861 = OpLoad %166 
                                       f32_4 %862 = OpVectorShuffle %861 %860 4 5 6 3 
                                                      OpStore %166 %862 
                                       f32_2 %863 = OpLoad %151 
                                       f32_4 %864 = OpVectorShuffle %863 %863 0 1 0 1 
                                       f32_4 %866 = OpFMul %864 %865 
                                       f32_4 %867 = OpLoad %9 
                                       f32_4 %868 = OpVectorShuffle %867 %867 0 1 0 1 
                                       f32_4 %869 = OpFAdd %866 %868 
                                                      OpStore %198 %869 
                         read_only Texture2D %870 = OpLoad %177 
                                     sampler %871 = OpLoad %179 
                  read_only Texture2DSampled %872 = OpSampledImage %870 %871 
                                       f32_4 %873 = OpLoad %198 
                                       f32_2 %874 = OpVectorShuffle %873 %873 0 1 
                                       f32_4 %875 = OpImageSampleImplicitLod %872 %874 
                                       f32_3 %876 = OpVectorShuffle %875 %875 0 1 2 
                                       f32_4 %877 = OpLoad %219 
                                       f32_4 %878 = OpVectorShuffle %877 %876 4 5 6 3 
                                                      OpStore %219 %878 
                                       f32_4 %879 = OpLoad %219 
                                       f32_3 %880 = OpVectorShuffle %879 %879 0 1 2 
                                       f32_3 %881 = OpLoad %244 
                                       f32_3 %882 = OpFAdd %880 %881 
                                                      OpStore %244 %882 
                                       f32_4 %883 = OpLoad %219 
                                       f32_3 %884 = OpVectorShuffle %883 %883 0 1 2 
                                       f32_4 %885 = OpLoad %219 
                                       f32_3 %886 = OpVectorShuffle %885 %885 0 1 2 
                                       f32_3 %887 = OpFMul %884 %886 
                                       f32_4 %888 = OpLoad %176 
                                       f32_3 %889 = OpVectorShuffle %888 %888 0 1 2 
                                       f32_3 %890 = OpFAdd %887 %889 
                                       f32_4 %891 = OpLoad %176 
                                       f32_4 %892 = OpVectorShuffle %891 %890 4 5 6 3 
                                                      OpStore %176 %892 
                         read_only Texture2D %893 = OpLoad %177 
                                     sampler %894 = OpLoad %179 
                  read_only Texture2DSampled %895 = OpSampledImage %893 %894 
                                       f32_4 %896 = OpLoad %198 
                                       f32_2 %897 = OpVectorShuffle %896 %896 2 3 
                                       f32_4 %898 = OpImageSampleImplicitLod %895 %897 
                                       f32_3 %899 = OpVectorShuffle %898 %898 0 1 2 
                                       f32_4 %900 = OpLoad %198 
                                       f32_4 %901 = OpVectorShuffle %900 %899 4 5 6 3 
                                                      OpStore %198 %901 
                                       f32_4 %902 = OpLoad %198 
                                       f32_3 %903 = OpVectorShuffle %902 %902 0 1 2 
                                       f32_3 %904 = OpLoad %213 
                                       f32_3 %905 = OpFAdd %903 %904 
                                                      OpStore %213 %905 
                                       f32_4 %906 = OpLoad %198 
                                       f32_3 %907 = OpVectorShuffle %906 %906 0 1 2 
                                       f32_4 %908 = OpLoad %198 
                                       f32_3 %909 = OpVectorShuffle %908 %908 0 1 2 
                                       f32_3 %910 = OpFMul %907 %909 
                                       f32_4 %911 = OpLoad %166 
                                       f32_3 %912 = OpVectorShuffle %911 %911 0 1 2 
                                       f32_3 %913 = OpFAdd %910 %912 
                                       f32_4 %914 = OpLoad %166 
                                       f32_4 %915 = OpVectorShuffle %914 %913 4 5 6 3 
                                                      OpStore %166 %915 
                                       f32_2 %916 = OpLoad %151 
                                       f32_4 %917 = OpVectorShuffle %916 %916 0 1 0 1 
                                       f32_4 %919 = OpFMul %917 %918 
                                       f32_4 %920 = OpLoad %9 
                                       f32_4 %921 = OpVectorShuffle %920 %920 0 1 0 1 
                                       f32_4 %922 = OpFAdd %919 %921 
                                                      OpStore %198 %922 
                         read_only Texture2D %923 = OpLoad %177 
                                     sampler %924 = OpLoad %179 
                  read_only Texture2DSampled %925 = OpSampledImage %923 %924 
                                       f32_4 %926 = OpLoad %198 
                                       f32_2 %927 = OpVectorShuffle %926 %926 0 1 
                                       f32_4 %928 = OpImageSampleImplicitLod %925 %927 
                                       f32_3 %929 = OpVectorShuffle %928 %928 0 1 2 
                                       f32_4 %930 = OpLoad %219 
                                       f32_4 %931 = OpVectorShuffle %930 %929 4 5 6 3 
                                                      OpStore %219 %931 
                                       f32_4 %932 = OpLoad %219 
                                       f32_3 %933 = OpVectorShuffle %932 %932 0 1 2 
                                       f32_3 %934 = OpLoad %244 
                                       f32_3 %935 = OpFAdd %933 %934 
                                                      OpStore %244 %935 
                                       f32_4 %936 = OpLoad %219 
                                       f32_3 %937 = OpVectorShuffle %936 %936 0 1 2 
                                       f32_4 %938 = OpLoad %219 
                                       f32_3 %939 = OpVectorShuffle %938 %938 0 1 2 
                                       f32_3 %940 = OpFMul %937 %939 
                                       f32_4 %941 = OpLoad %176 
                                       f32_3 %942 = OpVectorShuffle %941 %941 0 1 2 
                                       f32_3 %943 = OpFAdd %940 %942 
                                       f32_4 %944 = OpLoad %176 
                                       f32_4 %945 = OpVectorShuffle %944 %943 4 5 6 3 
                                                      OpStore %176 %945 
                         read_only Texture2D %946 = OpLoad %177 
                                     sampler %947 = OpLoad %179 
                  read_only Texture2DSampled %948 = OpSampledImage %946 %947 
                                       f32_4 %949 = OpLoad %198 
                                       f32_2 %950 = OpVectorShuffle %949 %949 2 3 
                                       f32_4 %951 = OpImageSampleImplicitLod %948 %950 
                                       f32_3 %952 = OpVectorShuffle %951 %951 0 1 2 
                                       f32_4 %953 = OpLoad %198 
                                       f32_4 %954 = OpVectorShuffle %953 %952 4 5 6 3 
                                                      OpStore %198 %954 
                                       f32_4 %955 = OpLoad %198 
                                       f32_3 %956 = OpVectorShuffle %955 %955 0 1 2 
                                       f32_3 %957 = OpLoad %213 
                                       f32_3 %958 = OpFAdd %956 %957 
                                                      OpStore %213 %958 
                                       f32_4 %959 = OpLoad %198 
                                       f32_3 %960 = OpVectorShuffle %959 %959 0 1 2 
                                       f32_4 %961 = OpLoad %198 
                                       f32_3 %962 = OpVectorShuffle %961 %961 0 1 2 
                                       f32_3 %963 = OpFMul %960 %962 
                                       f32_4 %964 = OpLoad %166 
                                       f32_3 %965 = OpVectorShuffle %964 %964 0 1 2 
                                       f32_3 %966 = OpFAdd %963 %965 
                                       f32_4 %967 = OpLoad %166 
                                       f32_4 %968 = OpVectorShuffle %967 %966 4 5 6 3 
                                                      OpStore %166 %968 
                                       f32_2 %969 = OpLoad %151 
                                       f32_4 %970 = OpVectorShuffle %969 %969 0 1 0 1 
                                       f32_4 %972 = OpFMul %970 %971 
                                       f32_4 %973 = OpLoad %9 
                                       f32_4 %974 = OpVectorShuffle %973 %973 0 1 0 1 
                                       f32_4 %975 = OpFAdd %972 %974 
                                                      OpStore %198 %975 
                         read_only Texture2D %976 = OpLoad %177 
                                     sampler %977 = OpLoad %179 
                  read_only Texture2DSampled %978 = OpSampledImage %976 %977 
                                       f32_4 %979 = OpLoad %198 
                                       f32_2 %980 = OpVectorShuffle %979 %979 0 1 
                                       f32_4 %981 = OpImageSampleImplicitLod %978 %980 
                                       f32_3 %982 = OpVectorShuffle %981 %981 0 1 2 
                                       f32_4 %983 = OpLoad %219 
                                       f32_4 %984 = OpVectorShuffle %983 %982 4 5 6 3 
                                                      OpStore %219 %984 
                                       f32_4 %985 = OpLoad %219 
                                       f32_3 %986 = OpVectorShuffle %985 %985 0 1 2 
                                       f32_3 %987 = OpLoad %244 
                                       f32_3 %988 = OpFAdd %986 %987 
                                                      OpStore %244 %988 
                                       f32_4 %989 = OpLoad %219 
                                       f32_3 %990 = OpVectorShuffle %989 %989 0 1 2 
                                       f32_4 %991 = OpLoad %219 
                                       f32_3 %992 = OpVectorShuffle %991 %991 0 1 2 
                                       f32_3 %993 = OpFMul %990 %992 
                                       f32_4 %994 = OpLoad %176 
                                       f32_3 %995 = OpVectorShuffle %994 %994 0 1 2 
                                       f32_3 %996 = OpFAdd %993 %995 
                                       f32_4 %997 = OpLoad %176 
                                       f32_4 %998 = OpVectorShuffle %997 %996 4 5 6 3 
                                                      OpStore %176 %998 
                         read_only Texture2D %999 = OpLoad %177 
                                    sampler %1000 = OpLoad %179 
                 read_only Texture2DSampled %1001 = OpSampledImage %999 %1000 
                                      f32_4 %1002 = OpLoad %198 
                                      f32_2 %1003 = OpVectorShuffle %1002 %1002 2 3 
                                      f32_4 %1004 = OpImageSampleImplicitLod %1001 %1003 
                                      f32_3 %1005 = OpVectorShuffle %1004 %1004 0 1 2 
                                      f32_4 %1006 = OpLoad %198 
                                      f32_4 %1007 = OpVectorShuffle %1006 %1005 4 5 6 3 
                                                      OpStore %198 %1007 
                                      f32_4 %1008 = OpLoad %198 
                                      f32_3 %1009 = OpVectorShuffle %1008 %1008 0 1 2 
                                      f32_3 %1010 = OpLoad %213 
                                      f32_3 %1011 = OpFAdd %1009 %1010 
                                                      OpStore %213 %1011 
                                      f32_4 %1012 = OpLoad %198 
                                      f32_3 %1013 = OpVectorShuffle %1012 %1012 0 1 2 
                                      f32_4 %1014 = OpLoad %198 
                                      f32_3 %1015 = OpVectorShuffle %1014 %1014 0 1 2 
                                      f32_3 %1016 = OpFMul %1013 %1015 
                                      f32_4 %1017 = OpLoad %166 
                                      f32_3 %1018 = OpVectorShuffle %1017 %1017 0 1 2 
                                      f32_3 %1019 = OpFAdd %1016 %1018 
                                      f32_4 %1020 = OpLoad %166 
                                      f32_4 %1021 = OpVectorShuffle %1020 %1019 4 5 6 3 
                                                      OpStore %166 %1021 
                                      f32_2 %1022 = OpLoad %151 
                                      f32_4 %1023 = OpVectorShuffle %1022 %1022 0 1 0 1 
                                      f32_4 %1025 = OpFMul %1023 %1024 
                                      f32_4 %1026 = OpLoad %9 
                                      f32_4 %1027 = OpVectorShuffle %1026 %1026 0 1 0 1 
                                      f32_4 %1028 = OpFAdd %1025 %1027 
                                                      OpStore %198 %1028 
                        read_only Texture2D %1029 = OpLoad %177 
                                    sampler %1030 = OpLoad %179 
                 read_only Texture2DSampled %1031 = OpSampledImage %1029 %1030 
                                      f32_4 %1032 = OpLoad %198 
                                      f32_2 %1033 = OpVectorShuffle %1032 %1032 0 1 
                                      f32_4 %1034 = OpImageSampleImplicitLod %1031 %1033 
                                      f32_3 %1035 = OpVectorShuffle %1034 %1034 0 1 2 
                                      f32_4 %1036 = OpLoad %219 
                                      f32_4 %1037 = OpVectorShuffle %1036 %1035 4 5 6 3 
                                                      OpStore %219 %1037 
                                      f32_4 %1038 = OpLoad %219 
                                      f32_3 %1039 = OpVectorShuffle %1038 %1038 0 1 2 
                                      f32_3 %1040 = OpLoad %244 
                                      f32_3 %1041 = OpFAdd %1039 %1040 
                                                      OpStore %244 %1041 
                                      f32_4 %1042 = OpLoad %219 
                                      f32_3 %1043 = OpVectorShuffle %1042 %1042 0 1 2 
                                      f32_4 %1044 = OpLoad %219 
                                      f32_3 %1045 = OpVectorShuffle %1044 %1044 0 1 2 
                                      f32_3 %1046 = OpFMul %1043 %1045 
                                      f32_4 %1047 = OpLoad %176 
                                      f32_3 %1048 = OpVectorShuffle %1047 %1047 0 1 2 
                                      f32_3 %1049 = OpFAdd %1046 %1048 
                                      f32_4 %1050 = OpLoad %176 
                                      f32_4 %1051 = OpVectorShuffle %1050 %1049 4 5 6 3 
                                                      OpStore %176 %1051 
                                      f32_2 %1052 = OpLoad %151 
                                      f32_2 %1053 = OpFNegate %1052 
                                      f32_4 %1054 = OpLoad %9 
                                      f32_2 %1055 = OpVectorShuffle %1054 %1054 0 1 
                                      f32_2 %1056 = OpFAdd %1053 %1055 
                                      f32_4 %1057 = OpLoad %198 
                                      f32_4 %1058 = OpVectorShuffle %1057 %1056 4 5 2 3 
                                                      OpStore %198 %1058 
                        read_only Texture2D %1059 = OpLoad %177 
                                    sampler %1060 = OpLoad %179 
                 read_only Texture2DSampled %1061 = OpSampledImage %1059 %1060 
                                      f32_4 %1062 = OpLoad %198 
                                      f32_2 %1063 = OpVectorShuffle %1062 %1062 0 1 
                                      f32_4 %1064 = OpImageSampleImplicitLod %1061 %1063 
                                      f32_3 %1065 = OpVectorShuffle %1064 %1064 0 1 2 
                                      f32_4 %1066 = OpLoad %219 
                                      f32_4 %1067 = OpVectorShuffle %1066 %1065 4 5 6 3 
                                                      OpStore %219 %1067 
                                      f32_3 %1068 = OpLoad %213 
                                      f32_4 %1069 = OpLoad %219 
                                      f32_3 %1070 = OpVectorShuffle %1069 %1069 0 1 2 
                                      f32_3 %1071 = OpFAdd %1068 %1070 
                                                      OpStore %213 %1071 
                                      f32_4 %1072 = OpLoad %219 
                                      f32_3 %1073 = OpVectorShuffle %1072 %1072 0 1 2 
                                      f32_4 %1074 = OpLoad %219 
                                      f32_3 %1075 = OpVectorShuffle %1074 %1074 0 1 2 
                                      f32_3 %1076 = OpFMul %1073 %1075 
                                      f32_4 %1077 = OpLoad %166 
                                      f32_3 %1078 = OpVectorShuffle %1077 %1077 0 1 2 
                                      f32_3 %1079 = OpFAdd %1076 %1078 
                                      f32_4 %1080 = OpLoad %166 
                                      f32_4 %1081 = OpVectorShuffle %1080 %1079 4 5 6 3 
                                                      OpStore %166 %1081 
                        read_only Texture2D %1082 = OpLoad %177 
                                    sampler %1083 = OpLoad %179 
                 read_only Texture2DSampled %1084 = OpSampledImage %1082 %1083 
                                      f32_4 %1085 = OpLoad %198 
                                      f32_2 %1086 = OpVectorShuffle %1085 %1085 2 3 
                                      f32_4 %1087 = OpImageSampleImplicitLod %1084 %1086 
                                      f32_3 %1088 = OpVectorShuffle %1087 %1087 0 1 2 
                                      f32_4 %1089 = OpLoad %198 
                                      f32_4 %1090 = OpVectorShuffle %1089 %1088 4 5 6 3 
                                                      OpStore %198 %1090 
                                      f32_4 %1091 = OpLoad %198 
                                      f32_3 %1092 = OpVectorShuffle %1091 %1091 0 1 2 
                                      f32_3 %1093 = OpLoad %244 
                                      f32_3 %1094 = OpFAdd %1092 %1093 
                                      f32_4 %1095 = OpLoad %219 
                                      f32_4 %1096 = OpVectorShuffle %1095 %1094 4 5 6 3 
                                                      OpStore %219 %1096 
                                      f32_4 %1097 = OpLoad %198 
                                      f32_3 %1098 = OpVectorShuffle %1097 %1097 0 1 2 
                                      f32_4 %1099 = OpLoad %198 
                                      f32_3 %1100 = OpVectorShuffle %1099 %1099 0 1 2 
                                      f32_3 %1101 = OpFMul %1098 %1100 
                                      f32_4 %1102 = OpLoad %176 
                                      f32_3 %1103 = OpVectorShuffle %1102 %1102 0 1 2 
                                      f32_3 %1104 = OpFAdd %1101 %1103 
                                      f32_4 %1105 = OpLoad %176 
                                      f32_4 %1106 = OpVectorShuffle %1105 %1104 4 5 6 3 
                                                      OpStore %176 %1106 
                                      f32_2 %1107 = OpLoad %151 
                                      f32_4 %1108 = OpVectorShuffle %1107 %1107 0 1 0 1 
                                      f32_4 %1110 = OpFMul %1108 %1109 
                                      f32_4 %1111 = OpLoad %9 
                                      f32_4 %1112 = OpVectorShuffle %1111 %1111 0 1 0 1 
                                      f32_4 %1113 = OpFAdd %1110 %1112 
                                                      OpStore %198 %1113 
                        read_only Texture2D %1114 = OpLoad %177 
                                    sampler %1115 = OpLoad %179 
                 read_only Texture2DSampled %1116 = OpSampledImage %1114 %1115 
                                      f32_4 %1117 = OpLoad %198 
                                      f32_2 %1118 = OpVectorShuffle %1117 %1117 0 1 
                                      f32_4 %1119 = OpImageSampleImplicitLod %1116 %1118 
                                      f32_3 %1120 = OpVectorShuffle %1119 %1119 0 1 2 
                                                      OpStore %244 %1120 
                                      f32_3 %1121 = OpLoad %213 
                                      f32_3 %1122 = OpLoad %244 
                                      f32_3 %1123 = OpFAdd %1121 %1122 
                                                      OpStore %213 %1123 
                                      f32_3 %1124 = OpLoad %244 
                                      f32_3 %1125 = OpLoad %244 
                                      f32_3 %1126 = OpFMul %1124 %1125 
                                      f32_4 %1127 = OpLoad %166 
                                      f32_3 %1128 = OpVectorShuffle %1127 %1127 0 1 2 
                                      f32_3 %1129 = OpFAdd %1126 %1128 
                                      f32_4 %1130 = OpLoad %166 
                                      f32_4 %1131 = OpVectorShuffle %1130 %1129 4 5 6 3 
                                                      OpStore %166 %1131 
                        read_only Texture2D %1132 = OpLoad %177 
                                    sampler %1133 = OpLoad %179 
                 read_only Texture2DSampled %1134 = OpSampledImage %1132 %1133 
                                      f32_4 %1135 = OpLoad %198 
                                      f32_2 %1136 = OpVectorShuffle %1135 %1135 2 3 
                                      f32_4 %1137 = OpImageSampleImplicitLod %1134 %1136 
                                      f32_3 %1138 = OpVectorShuffle %1137 %1137 0 1 2 
                                      f32_4 %1139 = OpLoad %198 
                                      f32_4 %1140 = OpVectorShuffle %1139 %1138 4 5 6 3 
                                                      OpStore %198 %1140 
                                      f32_4 %1141 = OpLoad %198 
                                      f32_3 %1142 = OpVectorShuffle %1141 %1141 0 1 2 
                                      f32_4 %1143 = OpLoad %219 
                                      f32_3 %1144 = OpVectorShuffle %1143 %1143 0 1 2 
                                      f32_3 %1145 = OpFAdd %1142 %1144 
                                      f32_4 %1146 = OpLoad %219 
                                      f32_4 %1147 = OpVectorShuffle %1146 %1145 4 5 6 3 
                                                      OpStore %219 %1147 
                                      f32_4 %1148 = OpLoad %198 
                                      f32_3 %1149 = OpVectorShuffle %1148 %1148 0 1 2 
                                      f32_4 %1150 = OpLoad %198 
                                      f32_3 %1151 = OpVectorShuffle %1150 %1150 0 1 2 
                                      f32_3 %1152 = OpFMul %1149 %1151 
                                      f32_4 %1153 = OpLoad %176 
                                      f32_3 %1154 = OpVectorShuffle %1153 %1153 0 1 2 
                                      f32_3 %1155 = OpFAdd %1152 %1154 
                                      f32_4 %1156 = OpLoad %176 
                                      f32_4 %1157 = OpVectorShuffle %1156 %1155 4 5 6 3 
                                                      OpStore %176 %1157 
                                      f32_2 %1158 = OpLoad %151 
                                      f32_4 %1159 = OpVectorShuffle %1158 %1158 0 1 0 1 
                                      f32_4 %1161 = OpFMul %1159 %1160 
                                      f32_4 %1162 = OpLoad %9 
                                      f32_4 %1163 = OpVectorShuffle %1162 %1162 0 1 0 1 
                                      f32_4 %1164 = OpFAdd %1161 %1163 
                                                      OpStore %198 %1164 
                        read_only Texture2D %1165 = OpLoad %177 
                                    sampler %1166 = OpLoad %179 
                 read_only Texture2DSampled %1167 = OpSampledImage %1165 %1166 
                                      f32_4 %1168 = OpLoad %198 
                                      f32_2 %1169 = OpVectorShuffle %1168 %1168 0 1 
                                      f32_4 %1170 = OpImageSampleImplicitLod %1167 %1169 
                                      f32_3 %1171 = OpVectorShuffle %1170 %1170 0 1 2 
                                                      OpStore %244 %1171 
                                      f32_3 %1172 = OpLoad %213 
                                      f32_3 %1173 = OpLoad %244 
                                      f32_3 %1174 = OpFAdd %1172 %1173 
                                                      OpStore %213 %1174 
                                      f32_3 %1175 = OpLoad %244 
                                      f32_3 %1176 = OpLoad %244 
                                      f32_3 %1177 = OpFMul %1175 %1176 
                                      f32_4 %1178 = OpLoad %166 
                                      f32_3 %1179 = OpVectorShuffle %1178 %1178 0 1 2 
                                      f32_3 %1180 = OpFAdd %1177 %1179 
                                      f32_4 %1181 = OpLoad %166 
                                      f32_4 %1182 = OpVectorShuffle %1181 %1180 4 5 6 3 
                                                      OpStore %166 %1182 
                        read_only Texture2D %1183 = OpLoad %177 
                                    sampler %1184 = OpLoad %179 
                 read_only Texture2DSampled %1185 = OpSampledImage %1183 %1184 
                                      f32_4 %1186 = OpLoad %198 
                                      f32_2 %1187 = OpVectorShuffle %1186 %1186 2 3 
                                      f32_4 %1188 = OpImageSampleImplicitLod %1185 %1187 
                                      f32_3 %1189 = OpVectorShuffle %1188 %1188 0 1 2 
                                      f32_4 %1190 = OpLoad %198 
                                      f32_4 %1191 = OpVectorShuffle %1190 %1189 4 5 6 3 
                                                      OpStore %198 %1191 
                                      f32_4 %1192 = OpLoad %198 
                                      f32_3 %1193 = OpVectorShuffle %1192 %1192 0 1 2 
                                      f32_4 %1194 = OpLoad %219 
                                      f32_3 %1195 = OpVectorShuffle %1194 %1194 0 1 2 
                                      f32_3 %1196 = OpFAdd %1193 %1195 
                                      f32_4 %1197 = OpLoad %219 
                                      f32_4 %1198 = OpVectorShuffle %1197 %1196 4 5 6 3 
                                                      OpStore %219 %1198 
                                      f32_4 %1199 = OpLoad %198 
                                      f32_3 %1200 = OpVectorShuffle %1199 %1199 0 1 2 
                                      f32_4 %1201 = OpLoad %198 
                                      f32_3 %1202 = OpVectorShuffle %1201 %1201 0 1 2 
                                      f32_3 %1203 = OpFMul %1200 %1202 
                                      f32_4 %1204 = OpLoad %176 
                                      f32_3 %1205 = OpVectorShuffle %1204 %1204 0 1 2 
                                      f32_3 %1206 = OpFAdd %1203 %1205 
                                      f32_4 %1207 = OpLoad %176 
                                      f32_4 %1208 = OpVectorShuffle %1207 %1206 4 5 6 3 
                                                      OpStore %176 %1208 
                                      f32_2 %1209 = OpLoad %151 
                                      f32_4 %1210 = OpVectorShuffle %1209 %1209 0 1 0 1 
                                      f32_4 %1212 = OpFMul %1210 %1211 
                                      f32_4 %1213 = OpLoad %9 
                                      f32_4 %1214 = OpVectorShuffle %1213 %1213 0 1 0 1 
                                      f32_4 %1215 = OpFAdd %1212 %1214 
                                                      OpStore %198 %1215 
                        read_only Texture2D %1216 = OpLoad %177 
                                    sampler %1217 = OpLoad %179 
                 read_only Texture2DSampled %1218 = OpSampledImage %1216 %1217 
                                      f32_4 %1219 = OpLoad %198 
                                      f32_2 %1220 = OpVectorShuffle %1219 %1219 0 1 
                                      f32_4 %1221 = OpImageSampleImplicitLod %1218 %1220 
                                      f32_3 %1222 = OpVectorShuffle %1221 %1221 0 1 2 
                                                      OpStore %244 %1222 
                                      f32_3 %1223 = OpLoad %213 
                                      f32_3 %1224 = OpLoad %244 
                                      f32_3 %1225 = OpFAdd %1223 %1224 
                                                      OpStore %213 %1225 
                                      f32_3 %1226 = OpLoad %244 
                                      f32_3 %1227 = OpLoad %244 
                                      f32_3 %1228 = OpFMul %1226 %1227 
                                      f32_4 %1229 = OpLoad %166 
                                      f32_3 %1230 = OpVectorShuffle %1229 %1229 0 1 2 
                                      f32_3 %1231 = OpFAdd %1228 %1230 
                                      f32_4 %1232 = OpLoad %166 
                                      f32_4 %1233 = OpVectorShuffle %1232 %1231 4 5 6 3 
                                                      OpStore %166 %1233 
                        read_only Texture2D %1234 = OpLoad %177 
                                    sampler %1235 = OpLoad %179 
                 read_only Texture2DSampled %1236 = OpSampledImage %1234 %1235 
                                      f32_4 %1237 = OpLoad %198 
                                      f32_2 %1238 = OpVectorShuffle %1237 %1237 2 3 
                                      f32_4 %1239 = OpImageSampleImplicitLod %1236 %1238 
                                      f32_3 %1240 = OpVectorShuffle %1239 %1239 0 1 2 
                                      f32_4 %1241 = OpLoad %198 
                                      f32_4 %1242 = OpVectorShuffle %1241 %1240 4 5 6 3 
                                                      OpStore %198 %1242 
                                      f32_4 %1243 = OpLoad %198 
                                      f32_3 %1244 = OpVectorShuffle %1243 %1243 0 1 2 
                                      f32_4 %1245 = OpLoad %219 
                                      f32_3 %1246 = OpVectorShuffle %1245 %1245 0 1 2 
                                      f32_3 %1247 = OpFAdd %1244 %1246 
                                      f32_4 %1248 = OpLoad %219 
                                      f32_4 %1249 = OpVectorShuffle %1248 %1247 4 5 6 3 
                                                      OpStore %219 %1249 
                                      f32_4 %1250 = OpLoad %198 
                                      f32_3 %1251 = OpVectorShuffle %1250 %1250 0 1 2 
                                      f32_4 %1252 = OpLoad %198 
                                      f32_3 %1253 = OpVectorShuffle %1252 %1252 0 1 2 
                                      f32_3 %1254 = OpFMul %1251 %1253 
                                      f32_4 %1255 = OpLoad %176 
                                      f32_3 %1256 = OpVectorShuffle %1255 %1255 0 1 2 
                                      f32_3 %1257 = OpFAdd %1254 %1256 
                                      f32_4 %1258 = OpLoad %176 
                                      f32_4 %1259 = OpVectorShuffle %1258 %1257 4 5 6 3 
                                                      OpStore %176 %1259 
                                      f32_2 %1260 = OpLoad %151 
                                      f32_4 %1261 = OpVectorShuffle %1260 %1260 0 1 0 1 
                                      f32_4 %1263 = OpFMul %1261 %1262 
                                      f32_4 %1264 = OpLoad %9 
                                      f32_4 %1265 = OpVectorShuffle %1264 %1264 0 1 0 1 
                                      f32_4 %1266 = OpFAdd %1263 %1265 
                                                      OpStore %198 %1266 
                        read_only Texture2D %1267 = OpLoad %177 
                                    sampler %1268 = OpLoad %179 
                 read_only Texture2DSampled %1269 = OpSampledImage %1267 %1268 
                                      f32_4 %1270 = OpLoad %198 
                                      f32_2 %1271 = OpVectorShuffle %1270 %1270 0 1 
                                      f32_4 %1272 = OpImageSampleImplicitLod %1269 %1271 
                                      f32_3 %1273 = OpVectorShuffle %1272 %1272 0 1 2 
                                                      OpStore %244 %1273 
                                      f32_3 %1274 = OpLoad %213 
                                      f32_3 %1275 = OpLoad %244 
                                      f32_3 %1276 = OpFAdd %1274 %1275 
                                                      OpStore %213 %1276 
                                      f32_3 %1277 = OpLoad %244 
                                      f32_3 %1278 = OpLoad %244 
                                      f32_3 %1279 = OpFMul %1277 %1278 
                                      f32_4 %1280 = OpLoad %166 
                                      f32_3 %1281 = OpVectorShuffle %1280 %1280 0 1 2 
                                      f32_3 %1282 = OpFAdd %1279 %1281 
                                      f32_4 %1283 = OpLoad %166 
                                      f32_4 %1284 = OpVectorShuffle %1283 %1282 4 5 6 3 
                                                      OpStore %166 %1284 
                        read_only Texture2D %1285 = OpLoad %177 
                                    sampler %1286 = OpLoad %179 
                 read_only Texture2DSampled %1287 = OpSampledImage %1285 %1286 
                                      f32_4 %1288 = OpLoad %198 
                                      f32_2 %1289 = OpVectorShuffle %1288 %1288 2 3 
                                      f32_4 %1290 = OpImageSampleImplicitLod %1287 %1289 
                                      f32_3 %1291 = OpVectorShuffle %1290 %1290 0 1 2 
                                      f32_4 %1292 = OpLoad %198 
                                      f32_4 %1293 = OpVectorShuffle %1292 %1291 4 5 6 3 
                                                      OpStore %198 %1293 
                                      f32_4 %1294 = OpLoad %198 
                                      f32_3 %1295 = OpVectorShuffle %1294 %1294 0 1 2 
                                      f32_4 %1296 = OpLoad %219 
                                      f32_3 %1297 = OpVectorShuffle %1296 %1296 0 1 2 
                                      f32_3 %1298 = OpFAdd %1295 %1297 
                                      f32_4 %1299 = OpLoad %219 
                                      f32_4 %1300 = OpVectorShuffle %1299 %1298 4 5 6 3 
                                                      OpStore %219 %1300 
                                      f32_4 %1301 = OpLoad %198 
                                      f32_3 %1302 = OpVectorShuffle %1301 %1301 0 1 2 
                                      f32_4 %1303 = OpLoad %198 
                                      f32_3 %1304 = OpVectorShuffle %1303 %1303 0 1 2 
                                      f32_3 %1305 = OpFMul %1302 %1304 
                                      f32_4 %1306 = OpLoad %176 
                                      f32_3 %1307 = OpVectorShuffle %1306 %1306 0 1 2 
                                      f32_3 %1308 = OpFAdd %1305 %1307 
                                      f32_4 %1309 = OpLoad %176 
                                      f32_4 %1310 = OpVectorShuffle %1309 %1308 4 5 6 3 
                                                      OpStore %176 %1310 
                                      f32_2 %1311 = OpLoad %151 
                                      f32_4 %1312 = OpVectorShuffle %1311 %1311 0 1 0 1 
                                      f32_4 %1314 = OpFMul %1312 %1313 
                                      f32_4 %1315 = OpLoad %9 
                                      f32_4 %1316 = OpVectorShuffle %1315 %1315 0 1 0 1 
                                      f32_4 %1317 = OpFAdd %1314 %1316 
                                                      OpStore %198 %1317 
                        read_only Texture2D %1318 = OpLoad %177 
                                    sampler %1319 = OpLoad %179 
                 read_only Texture2DSampled %1320 = OpSampledImage %1318 %1319 
                                      f32_4 %1321 = OpLoad %198 
                                      f32_2 %1322 = OpVectorShuffle %1321 %1321 0 1 
                                      f32_4 %1323 = OpImageSampleImplicitLod %1320 %1322 
                                      f32_3 %1324 = OpVectorShuffle %1323 %1323 0 1 2 
                                                      OpStore %244 %1324 
                                      f32_3 %1325 = OpLoad %213 
                                      f32_3 %1326 = OpLoad %244 
                                      f32_3 %1327 = OpFAdd %1325 %1326 
                                                      OpStore %213 %1327 
                                      f32_3 %1328 = OpLoad %244 
                                      f32_3 %1329 = OpLoad %244 
                                      f32_3 %1330 = OpFMul %1328 %1329 
                                      f32_4 %1331 = OpLoad %166 
                                      f32_3 %1332 = OpVectorShuffle %1331 %1331 0 1 2 
                                      f32_3 %1333 = OpFAdd %1330 %1332 
                                      f32_4 %1334 = OpLoad %166 
                                      f32_4 %1335 = OpVectorShuffle %1334 %1333 4 5 6 3 
                                                      OpStore %166 %1335 
                        read_only Texture2D %1336 = OpLoad %177 
                                    sampler %1337 = OpLoad %179 
                 read_only Texture2DSampled %1338 = OpSampledImage %1336 %1337 
                                      f32_4 %1339 = OpLoad %198 
                                      f32_2 %1340 = OpVectorShuffle %1339 %1339 2 3 
                                      f32_4 %1341 = OpImageSampleImplicitLod %1338 %1340 
                                      f32_3 %1342 = OpVectorShuffle %1341 %1341 0 1 2 
                                      f32_4 %1343 = OpLoad %198 
                                      f32_4 %1344 = OpVectorShuffle %1343 %1342 4 5 6 3 
                                                      OpStore %198 %1344 
                                      f32_4 %1345 = OpLoad %198 
                                      f32_3 %1346 = OpVectorShuffle %1345 %1345 0 1 2 
                                      f32_4 %1347 = OpLoad %219 
                                      f32_3 %1348 = OpVectorShuffle %1347 %1347 0 1 2 
                                      f32_3 %1349 = OpFAdd %1346 %1348 
                                      f32_4 %1350 = OpLoad %219 
                                      f32_4 %1351 = OpVectorShuffle %1350 %1349 4 5 6 3 
                                                      OpStore %219 %1351 
                                      f32_4 %1352 = OpLoad %198 
                                      f32_3 %1353 = OpVectorShuffle %1352 %1352 0 1 2 
                                      f32_4 %1354 = OpLoad %198 
                                      f32_3 %1355 = OpVectorShuffle %1354 %1354 0 1 2 
                                      f32_3 %1356 = OpFMul %1353 %1355 
                                      f32_4 %1357 = OpLoad %176 
                                      f32_3 %1358 = OpVectorShuffle %1357 %1357 0 1 2 
                                      f32_3 %1359 = OpFAdd %1356 %1358 
                                      f32_4 %1360 = OpLoad %176 
                                      f32_4 %1361 = OpVectorShuffle %1360 %1359 4 5 6 3 
                                                      OpStore %176 %1361 
                                      f32_3 %1362 = OpLoad %190 
                                      f32_3 %1363 = OpLoad %213 
                                      f32_3 %1364 = OpFAdd %1362 %1363 
                                      f32_4 %1365 = OpLoad %198 
                                      f32_4 %1366 = OpVectorShuffle %1365 %1364 4 5 6 3 
                                                      OpStore %198 %1366 
                                      f32_3 %1367 = OpLoad %190 
                                      f32_3 %1368 = OpLoad %190 
                                      f32_3 %1369 = OpFMul %1367 %1368 
                                      f32_4 %1370 = OpLoad %166 
                                      f32_3 %1371 = OpVectorShuffle %1370 %1370 0 1 2 
                                      f32_3 %1372 = OpFAdd %1369 %1371 
                                      f32_4 %1373 = OpLoad %166 
                                      f32_4 %1374 = OpVectorShuffle %1373 %1372 4 5 6 3 
                                                      OpStore %166 %1374 
                                      f32_2 %1375 = OpLoad %151 
                                      f32_2 %1377 = OpFMul %1375 %1376 
                                      f32_4 %1378 = OpLoad %9 
                                      f32_2 %1379 = OpVectorShuffle %1378 %1378 0 1 
                                      f32_2 %1380 = OpFAdd %1377 %1379 
                                      f32_4 %1381 = OpLoad %9 
                                      f32_4 %1382 = OpVectorShuffle %1381 %1380 4 5 2 3 
                                                      OpStore %9 %1382 
                        read_only Texture2D %1383 = OpLoad %177 
                                    sampler %1384 = OpLoad %179 
                 read_only Texture2DSampled %1385 = OpSampledImage %1383 %1384 
                                      f32_4 %1386 = OpLoad %9 
                                      f32_2 %1387 = OpVectorShuffle %1386 %1386 0 1 
                                      f32_4 %1388 = OpImageSampleImplicitLod %1385 %1387 
                                      f32_3 %1389 = OpVectorShuffle %1388 %1388 0 1 2 
                                      f32_4 %1390 = OpLoad %9 
                                      f32_4 %1391 = OpVectorShuffle %1390 %1389 4 5 6 3 
                                                      OpStore %9 %1391 
                                      f32_4 %1392 = OpLoad %9 
                                      f32_3 %1393 = OpVectorShuffle %1392 %1392 0 1 2 
                                      f32_4 %1394 = OpLoad %219 
                                      f32_3 %1395 = OpVectorShuffle %1394 %1394 0 1 2 
                                      f32_3 %1396 = OpFAdd %1393 %1395 
                                                      OpStore %190 %1396 
                                      f32_4 %1397 = OpLoad %9 
                                      f32_3 %1398 = OpVectorShuffle %1397 %1397 0 1 2 
                                      f32_4 %1399 = OpLoad %9 
                                      f32_3 %1400 = OpVectorShuffle %1399 %1399 0 1 2 
                                      f32_3 %1401 = OpFMul %1398 %1400 
                                      f32_4 %1402 = OpLoad %176 
                                      f32_3 %1403 = OpVectorShuffle %1402 %1402 0 1 2 
                                      f32_3 %1404 = OpFAdd %1401 %1403 
                                      f32_4 %1405 = OpLoad %9 
                                      f32_4 %1406 = OpVectorShuffle %1405 %1404 4 5 6 3 
                                                      OpStore %9 %1406 
                                      f32_4 %1407 = OpLoad %198 
                                      f32_3 %1408 = OpVectorShuffle %1407 %1407 0 1 2 
                                      f32_3 %1411 = OpFMul %1408 %1410 
                                      f32_4 %1412 = OpLoad %176 
                                      f32_4 %1413 = OpVectorShuffle %1412 %1411 4 5 6 3 
                                                      OpStore %176 %1413 
                                      f32_4 %1414 = OpLoad %176 
                                      f32_3 %1415 = OpVectorShuffle %1414 %1414 0 1 2 
                                      f32_4 %1416 = OpLoad %176 
                                      f32_3 %1417 = OpVectorShuffle %1416 %1416 0 1 2 
                                      f32_3 %1418 = OpFMul %1415 %1417 
                                      f32_4 %1419 = OpLoad %198 
                                      f32_4 %1420 = OpVectorShuffle %1419 %1418 4 5 6 3 
                                                      OpStore %198 %1420 
                                      f32_4 %1421 = OpLoad %166 
                                      f32_3 %1422 = OpVectorShuffle %1421 %1421 0 1 2 
                                      f32_3 %1423 = OpFMul %1422 %1410 
                                      f32_4 %1424 = OpLoad %198 
                                      f32_3 %1425 = OpVectorShuffle %1424 %1424 0 1 2 
                                      f32_3 %1426 = OpFNegate %1425 
                                      f32_3 %1427 = OpFAdd %1423 %1426 
                                      f32_4 %1428 = OpLoad %166 
                                      f32_4 %1429 = OpVectorShuffle %1428 %1427 4 5 6 3 
                                                      OpStore %166 %1429 
                               Private f32* %1432 = OpAccessChain %166 %1431 
                                        f32 %1433 = OpLoad %1432 
                                        f32 %1434 = OpExtInst %1 4 %1433 
                               Private f32* %1435 = OpAccessChain %166 %34 
                                        f32 %1436 = OpLoad %1435 
                                        f32 %1437 = OpExtInst %1 4 %1436 
                                        f32 %1438 = OpFAdd %1434 %1437 
                                                      OpStore %1430 %1438 
                               Private f32* %1439 = OpAccessChain %166 %43 
                                        f32 %1440 = OpLoad %1439 
                                        f32 %1441 = OpExtInst %1 4 %1440 
                                        f32 %1442 = OpLoad %1430 
                                        f32 %1443 = OpFAdd %1441 %1442 
                                                      OpStore %1430 %1443 
                                        f32 %1444 = OpLoad %1430 
                                       bool %1446 = OpFOrdLessThan %1444 %1445 
                                                      OpStore %123 %1446 
                               Private f32* %1447 = OpAccessChain %176 %50 
                                                      OpStore %1447 %55 
                                       bool %1448 = OpLoad %123 
                                      f32_4 %1449 = OpLoad %176 
                                     bool_4 %1452 = OpCompositeConstruct %1448 %1448 %1448 %1448 
                                      f32_4 %1453 = OpSelect %1452 %1449 %1450 
                                                      OpStore %166 %1453 
                                        f32 %1454 = OpLoad %1430 
                                        f32 %1455 = OpExtInst %1 37 %1454 %1445 
                                                      OpStore %1430 %1455 
                                      f32_3 %1456 = OpLoad %190 
                                      f32_3 %1457 = OpFMul %1456 %1410 
                                      f32_4 %1458 = OpLoad %176 
                                      f32_4 %1459 = OpVectorShuffle %1458 %1457 4 5 6 3 
                                                      OpStore %176 %1459 
                                      f32_4 %1460 = OpLoad %176 
                                      f32_3 %1461 = OpVectorShuffle %1460 %1460 0 1 2 
                                      f32_4 %1462 = OpLoad %176 
                                      f32_3 %1463 = OpVectorShuffle %1462 %1462 0 1 2 
                                      f32_3 %1464 = OpFMul %1461 %1463 
                                                      OpStore %190 %1464 
                                      f32_4 %1465 = OpLoad %9 
                                      f32_3 %1466 = OpVectorShuffle %1465 %1465 0 1 2 
                                      f32_3 %1467 = OpFMul %1466 %1410 
                                      f32_3 %1468 = OpLoad %190 
                                      f32_3 %1469 = OpFNegate %1468 
                                      f32_3 %1470 = OpFAdd %1467 %1469 
                                      f32_4 %1471 = OpLoad %9 
                                      f32_4 %1472 = OpVectorShuffle %1471 %1470 4 5 6 3 
                                                      OpStore %9 %1472 
                               Private f32* %1473 = OpAccessChain %9 %1431 
                                        f32 %1474 = OpLoad %1473 
                                        f32 %1475 = OpExtInst %1 4 %1474 
                               Private f32* %1476 = OpAccessChain %9 %34 
                                        f32 %1477 = OpLoad %1476 
                                        f32 %1478 = OpExtInst %1 4 %1477 
                                        f32 %1479 = OpFAdd %1475 %1478 
                               Private f32* %1480 = OpAccessChain %9 %34 
                                                      OpStore %1480 %1479 
                               Private f32* %1481 = OpAccessChain %9 %43 
                                        f32 %1482 = OpLoad %1481 
                                        f32 %1483 = OpExtInst %1 4 %1482 
                               Private f32* %1484 = OpAccessChain %9 %34 
                                        f32 %1485 = OpLoad %1484 
                                        f32 %1486 = OpFAdd %1483 %1485 
                               Private f32* %1487 = OpAccessChain %9 %34 
                                                      OpStore %1487 %1486 
                               Private f32* %1489 = OpAccessChain %9 %34 
                                        f32 %1490 = OpLoad %1489 
                                        f32 %1491 = OpLoad %1430 
                                       bool %1492 = OpFOrdLessThan %1490 %1491 
                                                      OpStore %1488 %1492 
                               Private f32* %1493 = OpAccessChain %176 %50 
                                                      OpStore %1493 %55 
                                       bool %1494 = OpLoad %1488 
                                      f32_4 %1495 = OpLoad %176 
                                      f32_4 %1496 = OpLoad %166 
                                     bool_4 %1497 = OpCompositeConstruct %1494 %1494 %1494 %1494 
                                      f32_4 %1498 = OpSelect %1497 %1495 %1496 
                                                      OpStore %132 %1498 
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