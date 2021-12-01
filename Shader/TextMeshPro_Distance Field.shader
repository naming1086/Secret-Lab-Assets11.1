//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TextMeshPro/Distance Field" {
Properties {
_FaceTex ("Face Texture", 2D) = "white" { }
_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineTex ("Outline Texture", 2D) = "white" { }
_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_Bevel ("Bevel", Range(0, 1)) = 0.5
_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
_LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
_SpecularColor ("Specular", Color) = (1,1,1,1)
_SpecularPower ("Specular", Range(0, 4)) = 2
_Reflectivity ("Reflectivity", Range(5, 15)) = 10
_Diffuse ("Diffuse", Range(0, 1)) = 0.5
_Ambient ("Ambient", Range(1, 0)) = 0.5
_BumpMap ("Normal map", 2D) = "bump" { }
_BumpOutline ("Bump Outline", Range(0, 1)) = 0
_BumpFace ("Bump Face", Range(0, 1)) = 0
_ReflectFaceColor ("Reflection Color", Color) = (0,0,0,1)
_ReflectOutlineColor ("Reflection Color", Color) = (0,0,0,1)
_Cube ("Reflection Cubemap", Cube) = "black" { }
_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_GlowColor ("Color", Color) = (0,1,0,0.5)
_GlowOffset ("Offset", Range(-1, 1)) = 0
_GlowInner ("Inner", Range(0, 1)) = 0.05
_GlowOuter ("Outer", Range(0, 1)) = 0.05
_GlowPower ("Falloff", Range(1, 0)) = 0.75
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
_MaskCoord ("Mask Coordinates", Vector) = (0,0,32767,32767)
_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
_MaskSoftnessX ("Mask SoftnessX", Float) = 0
_MaskSoftnessY ("Mask SoftnessY", Float) = 0
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_CullMode ("Cull Mode", Float) = 0
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 27164
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-vs_TEXCOORD1.x);
    u_xlat4 = (-u_xlat0.w) + vs_TEXCOORD1.z;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat8.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
    u_xlat4 = u_xlat8.x * u_xlat12;
    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat1 = texture(_OutlineTex, u_xlat8.xy);
    u_xlat1 = u_xlat1 * _OutlineColor;
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat3 = texture(_FaceTex, u_xlat8.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.w = u_xlat3.w * _FaceColor.w;
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 517
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %183 %193 %236 %358 %452 %485 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate vs_TEXCOORD0 Location 129 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate vs_TEXCOORD2 Location 183 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 452 
                                                      OpDecorate vs_TEXCOORD5 Location 485 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_4* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %10 %17 
                                              %19 = OpTypeArray %10 %17 
                                              %20 = OpTypeArray %10 %17 
                                              %21 = OpTypeArray %10 %17 
                                              %22 = OpTypeArray %10 %17 
                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %6 %10 %10 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 13 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 14 
                                              %38 = OpTypePointer Private %10 
                               Private f32_4* %39 = OpVariable Private 
                                          i32 %42 = OpConstant 2 
                                          i32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Uniform %10 
                                          i32 %48 = OpConstant 0 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %65 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                               Private f32_4* %89 = OpVariable Private 
                                          i32 %92 = OpConstant 5 
                                         u32 %117 = OpConstant 1 
                                             %118 = OpTypeArray %6 %117 
                                             %119 = OpTypeStruct %10 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %123 = OpTypePointer Output %10 
                               Output f32_4* %125 = OpVariable Output 
                                Input f32_4* %126 = OpVariable Input 
                                             %128 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %130 = OpTypePointer Input %13 
                                Input f32_2* %131 = OpVariable Input 
                                             %133 = OpTypePointer Private %13 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %138 = OpConstant 4 
                                         i32 %154 = OpConstant 19 
                                         i32 %157 = OpConstant 20 
                                             %166 = OpTypePointer Private %6 
                                Private f32* %167 = OpVariable Private 
                                         i32 %171 = OpConstant 16 
                                         i32 %174 = OpConstant 17 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %190 = OpConstant 0 
                                Private f32* %192 = OpVariable Private 
                                Input f32_2* %193 = OpVariable Input 
                                             %194 = OpTypePointer Input %6 
                                         i32 %198 = OpConstant 18 
                                         i32 %202 = OpConstant 22 
                                         f32 %205 = OpConstant 3.674022E-40 
                                         i32 %214 = OpConstant 21 
                                             %235 = OpTypePointer Input %7 
                                Input f32_3* %236 = OpVariable Input 
                                         u32 %254 = OpConstant 2 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 10 
                                         i32 %326 = OpConstant 11 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 12 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 15 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %451 = OpTypePointer Output %7 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         f32 %463 = OpConstant 3.674022E-40 
                                         f32 %473 = OpConstant 3.674022E-40 
                                         f32 %480 = OpConstant 3.674022E-40 
                                       f32_2 %481 = OpConstantComposite %480 %480 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %488 = OpConstant 23 
                                         i32 %501 = OpConstant 24 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %15 %34 
                                        f32_3 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
                                                      OpStore %9 %37 
                                        f32_3 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFMul %41 %46 
                                                      OpStore %39 %47 
                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %39 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore %39 %55 
                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %12 
                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %39 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %39 %62 
                                        f32_4 %64 = OpLoad %39 
                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFAdd %64 %67 
                                                      OpStore %63 %68 
                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_4 %72 = OpLoad %12 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %39 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %39 %79 
                                        f32_4 %80 = OpLoad %39 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpFNegate %81 
                               Uniform f32_3* %84 = OpAccessChain %25 %48 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpFAdd %82 %85 
                                        f32_4 %87 = OpLoad %39 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %39 %88 
                                        f32_4 %90 = OpLoad %63 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpFMul %91 %94 
                                                      OpStore %89 %95 
                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %63 
                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %89 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %89 %102 
                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %63 
                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %89 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %89 %109 
                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %63 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %89 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %63 %116 
                                       f32_4 %122 = OpLoad %63 
                               Output f32_4* %124 = OpAccessChain %121 %48 
                                                      OpStore %124 %122 
                                       f32_4 %127 = OpLoad %126 
                                                      OpStore %125 %127 
                                       f32_2 %132 = OpLoad %131 
                                                      OpStore vs_TEXCOORD0 %132 
                              Uniform f32_4* %135 = OpAccessChain %25 %43 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 1 1 
                              Uniform f32_4* %139 = OpAccessChain %25 %138 %43 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                                                      OpStore %134 %142 
                              Uniform f32_4* %143 = OpAccessChain %25 %138 %48 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                              Uniform f32_4* %146 = OpAccessChain %25 %43 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 0 
                                       f32_2 %149 = OpFMul %145 %148 
                                       f32_2 %150 = OpLoad %134 
                                       f32_2 %151 = OpFAdd %149 %150 
                                                      OpStore %134 %151 
                                       f32_2 %152 = OpLoad %134 
                                       f32_2 %153 = OpExtInst %1 4 %152 
                                Uniform f32* %155 = OpAccessChain %25 %154 
                                         f32 %156 = OpLoad %155 
                                Uniform f32* %158 = OpAccessChain %25 %157 
                                         f32 %159 = OpLoad %158 
                                       f32_2 %160 = OpCompositeConstruct %156 %159 
                                       f32_2 %161 = OpFMul %153 %160 
                                                      OpStore %134 %161 
                                       f32_4 %162 = OpLoad %63 
                                       f32_2 %163 = OpVectorShuffle %162 %162 3 3 
                                       f32_2 %164 = OpLoad %134 
                                       f32_2 %165 = OpFDiv %163 %164 
                                                      OpStore %134 %165 
                                       f32_2 %168 = OpLoad %134 
                                       f32_2 %169 = OpLoad %134 
                                         f32 %170 = OpDot %168 %169 
                                                      OpStore %167 %170 
                                Uniform f32* %172 = OpAccessChain %25 %171 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %175 = OpAccessChain %25 %174 
                                         f32 %176 = OpLoad %175 
                                       f32_2 %177 = OpCompositeConstruct %173 %176 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %181 = OpLoad %134 
                                       f32_2 %182 = OpFAdd %180 %181 
                                                      OpStore %134 %182 
                                       f32_2 %184 = OpLoad %134 
                                       f32_2 %185 = OpFDiv %179 %184 
                                       f32_4 %186 = OpLoad vs_TEXCOORD2 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %187 
                                         f32 %188 = OpLoad %167 
                                         f32 %189 = OpExtInst %1 32 %188 
                                Private f32* %191 = OpAccessChain %134 %190 
                                                      OpStore %191 %189 
                                  Input f32* %195 = OpAccessChain %193 %117 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpExtInst %1 4 %196 
                                Uniform f32* %199 = OpAccessChain %25 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %197 %200 
                                                      OpStore %192 %201 
                                Uniform f32* %203 = OpAccessChain %25 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFAdd %204 %205 
                                                      OpStore %167 %206 
                                         f32 %207 = OpLoad %192 
                                         f32 %208 = OpLoad %167 
                                         f32 %209 = OpFMul %207 %208 
                                                      OpStore %192 %209 
                                         f32 %210 = OpLoad %192 
                                Private f32* %211 = OpAccessChain %134 %190 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                                      OpStore %167 %213 
                                Uniform f32* %215 = OpAccessChain %25 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                         f32 %218 = OpFAdd %217 %205 
                                Private f32* %219 = OpAccessChain %63 %190 
                                                      OpStore %219 %218 
                                         f32 %220 = OpLoad %167 
                                         f32 %221 = OpExtInst %1 4 %220 
                                Private f32* %222 = OpAccessChain %63 %190 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %221 %223 
                                Private f32* %225 = OpAccessChain %63 %190 
                                                      OpStore %225 %224 
                                Private f32* %226 = OpAccessChain %134 %190 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpLoad %192 
                                         f32 %229 = OpFMul %227 %228 
                                Private f32* %230 = OpAccessChain %63 %190 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFNegate %231 
                                         f32 %233 = OpFAdd %229 %232 
                                Private f32* %234 = OpAccessChain %134 %190 
                                                      OpStore %234 %233 
                                       f32_3 %237 = OpLoad %236 
                              Uniform f32_4* %238 = OpAccessChain %25 %65 %48 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                         f32 %241 = OpDot %237 %240 
                                Private f32* %242 = OpAccessChain %89 %190 
                                                      OpStore %242 %241 
                                       f32_3 %243 = OpLoad %236 
                              Uniform f32_4* %244 = OpAccessChain %25 %65 %43 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                         f32 %247 = OpDot %243 %246 
                                Private f32* %248 = OpAccessChain %89 %117 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %236 
                              Uniform f32_4* %250 = OpAccessChain %25 %65 %42 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                         f32 %253 = OpDot %249 %252 
                                Private f32* %255 = OpAccessChain %89 %254 
                                                      OpStore %255 %253 
                                       f32_4 %256 = OpLoad %89 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %89 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                         f32 %260 = OpDot %257 %259 
                                                      OpStore %192 %260 
                                         f32 %261 = OpLoad %192 
                                         f32 %262 = OpExtInst %1 32 %261 
                                                      OpStore %192 %262 
                                         f32 %264 = OpLoad %192 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %39 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %39 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %192 %273 
                                         f32 %274 = OpLoad %192 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %192 %275 
                                         f32 %276 = OpLoad %192 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %39 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %89 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %89 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %89 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %192 %286 
                                         f32 %287 = OpLoad %192 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %134 %190 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %63 %190 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %134 %190 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %138 %65 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %134 %190 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %167 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %190 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %193 %117 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %205 %302 
                                Private f32* %321 = OpAccessChain %134 %190 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %192 %329 
                                Private f32* %330 = OpAccessChain %134 %190 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %192 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %134 %190 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %134 %190 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %178 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %134 %190 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %134 %190 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %134 %190 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %134 %190 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %254 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %190 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %192 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %205 
                                                      OpStore %167 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %167 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %167 %382 
                                         f32 %383 = OpLoad %167 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %192 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %167 %387 
                                Private f32* %388 = OpAccessChain %134 %190 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %167 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %190 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %134 %190 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %134 %190 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %192 
                                Private f32* %403 = OpAccessChain %134 %190 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %254 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %63 %412 
                                       f32_4 %413 = OpLoad %63 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %63 %416 
                                       f32_3 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %63 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_3 %426 = OpLoad %9 
                                       f32_3 %427 = OpVectorShuffle %426 %425 3 4 2 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %63 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_3 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %39 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %43 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                                      OpStore %9 %442 
                              Uniform f32_4* %443 = OpAccessChain %25 %438 %48 
                                       f32_4 %444 = OpLoad %443 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_4 %446 = OpLoad %39 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 0 0 
                                       f32_3 %448 = OpFMul %445 %447 
                                       f32_3 %449 = OpLoad %9 
                                       f32_3 %450 = OpFAdd %448 %449 
                                                      OpStore %9 %450 
                              Uniform f32_4* %453 = OpAccessChain %25 %438 %42 
                                       f32_4 %454 = OpLoad %453 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %39 
                                       f32_3 %457 = OpVectorShuffle %456 %456 2 2 2 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %9 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore vs_TEXCOORD3 %460 
                                  Input f32* %461 = OpAccessChain %193 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %464 = OpFMul %462 %463 
                                Private f32* %465 = OpAccessChain %9 %190 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %9 %190 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpExtInst %1 8 %467 
                                Private f32* %469 = OpAccessChain %134 %190 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %134 %190 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                         f32 %474 = OpFMul %472 %473 
                                  Input f32* %475 = OpAccessChain %193 %190 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFAdd %474 %476 
                                Private f32* %478 = OpAccessChain %134 %117 
                                                      OpStore %478 %477 
                                       f32_2 %479 = OpLoad %134 
                                       f32_2 %482 = OpFMul %479 %481 
                                       f32_3 %483 = OpLoad %9 
                                       f32_3 %484 = OpVectorShuffle %483 %482 3 4 2 
                                                      OpStore %9 %484 
                                       f32_3 %486 = OpLoad %9 
                                       f32_2 %487 = OpVectorShuffle %486 %486 0 1 
                              Uniform f32_4* %489 = OpAccessChain %25 %488 
                                       f32_4 %490 = OpLoad %489 
                                       f32_2 %491 = OpVectorShuffle %490 %490 0 1 
                                       f32_2 %492 = OpFMul %487 %491 
                              Uniform f32_4* %493 = OpAccessChain %25 %488 
                                       f32_4 %494 = OpLoad %493 
                                       f32_2 %495 = OpVectorShuffle %494 %494 2 3 
                                       f32_2 %496 = OpFAdd %492 %495 
                                       f32_4 %497 = OpLoad vs_TEXCOORD5 
                                       f32_4 %498 = OpVectorShuffle %497 %496 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %498 
                                       f32_3 %499 = OpLoad %9 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                              Uniform f32_4* %502 = OpAccessChain %25 %501 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_2 %505 = OpFMul %500 %504 
                              Uniform f32_4* %506 = OpAccessChain %25 %501 
                                       f32_4 %507 = OpLoad %506 
                                       f32_2 %508 = OpVectorShuffle %507 %507 2 3 
                                       f32_2 %509 = OpFAdd %505 %508 
                                       f32_4 %510 = OpLoad vs_TEXCOORD5 
                                       f32_4 %511 = OpVectorShuffle %510 %509 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %511 
                                 Output f32* %512 = OpAccessChain %121 %48 %117 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFNegate %513 
                                 Output f32* %515 = OpAccessChain %121 %48 %117 
                                                      OpStore %515 %514 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 260
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %35 %130 %157 %254 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 22 
                                                      OpDecorate vs_TEXCOORD1 Location 35 
                                                      OpMemberDecorate %66 0 Offset 66 
                                                      OpMemberDecorate %66 1 Offset 66 
                                                      OpMemberDecorate %66 2 Offset 66 
                                                      OpMemberDecorate %66 3 Offset 66 
                                                      OpMemberDecorate %66 4 Offset 66 
                                                      OpMemberDecorate %66 5 Offset 66 
                                                      OpMemberDecorate %66 6 Offset 66 
                                                      OpMemberDecorate %66 7 Offset 66 
                                                      OpMemberDecorate %66 8 Offset 66 
                                                      OpMemberDecorate %66 9 Offset 66 
                                                      OpDecorate %66 Block 
                                                      OpDecorate %68 DescriptorSet 68 
                                                      OpDecorate %68 Binding 68 
                                                      OpDecorate vs_TEXCOORD5 Location 130 
                                                      OpDecorate %135 DescriptorSet 135 
                                                      OpDecorate %135 Binding 135 
                                                      OpDecorate %137 DescriptorSet 137 
                                                      OpDecorate %137 Binding 137 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %179 DescriptorSet 179 
                                                      OpDecorate %179 Binding 179 
                                                      OpDecorate %181 DescriptorSet 181 
                                                      OpDecorate %181 Binding 181 
                                                      OpDecorate %254 Location 254 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypePointer UniformConstant %10 
         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                              %14 = OpTypeSampler 
                                              %15 = OpTypePointer UniformConstant %14 
                     UniformConstant sampler* %16 = OpVariable UniformConstant 
                                              %18 = OpTypeSampledImage %10 
                                              %20 = OpTypeVector %6 2 
                                              %21 = OpTypePointer Input %20 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 3 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %31 = OpVariable Private 
                                              %34 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                              %36 = OpTypePointer Input %6 
                                          u32 %44 = OpConstant 2 
                                              %49 = OpTypeBool 
                                              %50 = OpTypePointer Private %49 
                                Private bool* %51 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                              %56 = OpTypeInt 32 1 
                                          i32 %57 = OpConstant 0 
                                          i32 %58 = OpConstant 1 
                                          i32 %60 = OpConstant -1 
                                              %66 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
                                              %67 = OpTypePointer Uniform %66 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %68 = OpVariable Uniform 
                                          i32 %69 = OpConstant 8 
                                              %70 = OpTypePointer Uniform %6 
                                          i32 %73 = OpConstant 9 
                                          u32 %78 = OpConstant 1 
                                              %82 = OpTypePointer Private %20 
                               Private f32_2* %83 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                 Private f32* %95 = OpVariable Private 
                                         i32 %118 = OpConstant 5 
                                         i32 %121 = OpConstant 6 
                                             %125 = OpTypePointer Uniform %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                              Private f32_4* %134 = OpVariable Private 
        UniformConstant read_only Texture2D* %135 = OpVariable UniformConstant 
                    UniformConstant sampler* %137 = OpVariable UniformConstant 
                                         i32 %143 = OpConstant 7 
                                             %147 = OpTypeVector %6 3 
                                             %155 = OpTypePointer Private %147 
                              Private f32_3* %156 = OpVariable Private 
                                Input f32_4* %157 = OpVariable Input 
                                         i32 %160 = OpConstant 3 
                                         i32 %167 = OpConstant 2 
                              Private f32_4* %178 = OpVariable Private 
        UniformConstant read_only Texture2D* %179 = OpVariable UniformConstant 
                    UniformConstant sampler* %181 = OpVariable UniformConstant 
                                         i32 %212 = OpConstant 4 
                                             %253 = OpTypePointer Output %7 
                               Output f32_4* %254 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 3 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                                      OpStore %30 %27 
                                 Private f32* %32 = OpAccessChain %9 %28 
                                          f32 %33 = OpLoad %32 
                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFNegate %38 
                                          f32 %40 = OpFAdd %33 %39 
                                                      OpStore %31 %40 
                                 Private f32* %41 = OpAccessChain %9 %28 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                   Input f32* %45 = OpAccessChain vs_TEXCOORD1 %44 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFAdd %43 %46 
                                 Private f32* %48 = OpAccessChain %9 %28 
                                                      OpStore %48 %47 
                                          f32 %52 = OpLoad %31 
                                         bool %54 = OpFOrdLessThan %52 %53 
                                                      OpStore %51 %54 
                                         bool %55 = OpLoad %51 
                                          i32 %59 = OpSelect %55 %58 %57 
                                          i32 %61 = OpIMul %59 %60 
                                         bool %62 = OpINotEqual %61 %57 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                                      OpKill
                                              %64 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %68 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %74 = OpAccessChain %68 %73 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFMul %72 %75 
                                                      OpStore %31 %76 
                                          f32 %77 = OpLoad %31 
                                   Input f32* %79 = OpAccessChain vs_TEXCOORD1 %78 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %77 %80 
                                                      OpStore %31 %81 
                                          f32 %84 = OpLoad %31 
                                          f32 %86 = OpExtInst %1 37 %84 %85 
                                 Private f32* %87 = OpAccessChain %83 %28 
                                                      OpStore %87 %86 
                                          f32 %88 = OpLoad %31 
                                          f32 %90 = OpFMul %88 %89 
                                                      OpStore %31 %90 
                                 Private f32* %91 = OpAccessChain %83 %28 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpExtInst %1 31 %92 
                                 Private f32* %94 = OpAccessChain %83 %28 
                                                      OpStore %94 %93 
                                 Private f32* %96 = OpAccessChain %9 %28 
                                          f32 %97 = OpLoad %96 
                                   Input f32* %98 = OpAccessChain vs_TEXCOORD1 %78 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %97 %99 
                                         f32 %101 = OpLoad %31 
                                         f32 %102 = OpFAdd %100 %101 
                                                      OpStore %95 %102 
                                         f32 %103 = OpLoad %95 
                                         f32 %104 = OpExtInst %1 43 %103 %53 %85 
                                                      OpStore %95 %104 
                                Private f32* %105 = OpAccessChain %9 %28 
                                         f32 %106 = OpLoad %105 
                                  Input f32* %107 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFMul %106 %108 
                                         f32 %110 = OpLoad %31 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %109 %111 
                                Private f32* %113 = OpAccessChain %9 %28 
                                                      OpStore %113 %112 
                                Private f32* %114 = OpAccessChain %83 %28 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpLoad %95 
                                         f32 %117 = OpFMul %115 %116 
                                                      OpStore %31 %117 
                                Uniform f32* %119 = OpAccessChain %68 %118 
                                         f32 %120 = OpLoad %119 
                                Uniform f32* %122 = OpAccessChain %68 %121 
                                         f32 %123 = OpLoad %122 
                                       f32_2 %124 = OpCompositeConstruct %120 %123 
                              Uniform f32_4* %126 = OpAccessChain %68 %57 
                                       f32_4 %127 = OpLoad %126 
                                       f32_2 %128 = OpVectorShuffle %127 %127 1 1 
                                       f32_2 %129 = OpFMul %124 %128 
                                       f32_4 %131 = OpLoad vs_TEXCOORD5 
                                       f32_2 %132 = OpVectorShuffle %131 %131 2 3 
                                       f32_2 %133 = OpFAdd %129 %132 
                                                      OpStore %83 %133 
                         read_only Texture2D %136 = OpLoad %135 
                                     sampler %138 = OpLoad %137 
                  read_only Texture2DSampled %139 = OpSampledImage %136 %138 
                                       f32_2 %140 = OpLoad %83 
                                       f32_4 %141 = OpImageSampleImplicitLod %139 %140 
                                                      OpStore %134 %141 
                                       f32_4 %142 = OpLoad %134 
                              Uniform f32_4* %144 = OpAccessChain %68 %143 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpFMul %142 %145 
                                                      OpStore %134 %146 
                                       f32_4 %148 = OpLoad %134 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_4 %150 = OpLoad %134 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %134 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %134 %154 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_4* %161 = OpAccessChain %68 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFMul %159 %163 
                                                      OpStore %156 %164 
                                Uniform f32* %165 = OpAccessChain %68 %58 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %168 = OpAccessChain %68 %167 
                                         f32 %169 = OpLoad %168 
                                       f32_2 %170 = OpCompositeConstruct %166 %169 
                              Uniform f32_4* %171 = OpAccessChain %68 %57 
                                       f32_4 %172 = OpLoad %171 
                                       f32_2 %173 = OpVectorShuffle %172 %172 1 1 
                                       f32_2 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad vs_TEXCOORD5 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                                      OpStore %83 %177 
                         read_only Texture2D %180 = OpLoad %179 
                                     sampler %182 = OpLoad %181 
                  read_only Texture2DSampled %183 = OpSampledImage %180 %182 
                                       f32_2 %184 = OpLoad %83 
                                       f32_4 %185 = OpImageSampleImplicitLod %183 %184 
                                                      OpStore %178 %185 
                                       f32_3 %186 = OpLoad %156 
                                       f32_4 %187 = OpLoad %178 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFMul %186 %188 
                                                      OpStore %156 %189 
                                Private f32* %190 = OpAccessChain %178 %26 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %68 %160 %26 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Private f32* %195 = OpAccessChain %178 %26 
                                                      OpStore %195 %194 
                                       f32_3 %196 = OpLoad %156 
                                       f32_4 %197 = OpLoad %178 
                                       f32_3 %198 = OpVectorShuffle %197 %197 3 3 3 
                                       f32_3 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %178 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                                      OpStore %178 %201 
                                       f32_4 %202 = OpLoad %134 
                                       f32_4 %203 = OpLoad %178 
                                       f32_4 %204 = OpFNegate %203 
                                       f32_4 %205 = OpFAdd %202 %204 
                                                      OpStore %134 %205 
                                         f32 %206 = OpLoad %31 
                                       f32_4 %207 = OpCompositeConstruct %206 %206 %206 %206 
                                       f32_4 %208 = OpLoad %134 
                                       f32_4 %209 = OpFMul %207 %208 
                                       f32_4 %210 = OpLoad %178 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %134 %211 
                                Uniform f32* %213 = OpAccessChain %68 %212 
                                         f32 %214 = OpLoad %213 
                                Uniform f32* %215 = OpAccessChain %68 %73 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                                      OpStore %31 %217 
                                         f32 %218 = OpLoad %31 
                                  Input f32* %219 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFMul %218 %220 
                                Private f32* %222 = OpAccessChain %83 %28 
                                                      OpStore %222 %221 
                                         f32 %223 = OpLoad %31 
                                  Input f32* %224 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFMul %223 %225 
                                         f32 %227 = OpFAdd %226 %85 
                                                      OpStore %31 %227 
                                Private f32* %228 = OpAccessChain %83 %28 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFMul %229 %89 
                                Private f32* %231 = OpAccessChain %9 %28 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFAdd %230 %232 
                                Private f32* %234 = OpAccessChain %9 %28 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %9 %28 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpLoad %31 
                                         f32 %238 = OpFDiv %236 %237 
                                Private f32* %239 = OpAccessChain %9 %28 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %28 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpExtInst %1 43 %241 %53 %85 
                                Private f32* %243 = OpAccessChain %9 %28 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %9 %28 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %246 %85 
                                Private f32* %248 = OpAccessChain %9 %28 
                                                      OpStore %248 %247 
                                       f32_4 %249 = OpLoad %9 
                                       f32_4 %250 = OpVectorShuffle %249 %249 0 0 0 0 
                                       f32_4 %251 = OpLoad %134 
                                       f32_4 %252 = OpFMul %250 %251 
                                                      OpStore %9 %252 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpLoad %157 
                                       f32_4 %257 = OpVectorShuffle %256 %256 3 3 3 3 
                                       f32_4 %258 = OpFMul %255 %257 
                                                      OpStore %254 %258 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	vec4 _UnderlayColor;
uniform 	float _UnderlayOffsetX;
uniform 	float _UnderlayOffsetY;
uniform 	float _UnderlayDilate;
uniform 	float _UnderlaySoftness;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioC;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_COLOR1;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xyw = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyw;
    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
    u_xlat0.x = u_xlat1.x * u_xlat6.x + 1.0;
    u_xlat0.x = u_xlat6.x / u_xlat0.x;
    u_xlat4 = u_xlat8.x * u_xlat0.x + -0.5;
    u_xlat8.x = u_xlat0.x * u_xlat1.y;
    u_xlat1.xy = (-u_xlat1.zw) * vec2(_GradientScale);
    u_xlat1.xy = u_xlat1.xy / vec2(_TextureWidth, _TextureHeight);
    vs_TEXCOORD4.xy = u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat8.x) * 0.5 + u_xlat4;
    vs_COLOR1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
    vs_COLOR1.w = _UnderlayColor.w;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_COLOR1;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat0 = u_xlat0 * _OutlineColor;
    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat2.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat2 = texture(_FaceTex, u_xlat2.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.w = u_xlat2.w * _FaceColor.w;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.www;
    u_xlat0 = u_xlat0 + (-u_xlat2);
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD1.y;
    u_xlat5 = min(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9 = (-u_xlat3.w) + vs_TEXCOORD1.z;
    u_xlat13 = u_xlat9 * vs_TEXCOORD1.y + u_xlat1.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat1.x = u_xlat9 * vs_TEXCOORD1.y + (-u_xlat1.x);
    u_xlat5 = u_xlat5 * u_xlat13;
    u_xlat0 = vec4(u_xlat5) * u_xlat0 + u_xlat2;
    u_xlat5 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y + 1.0;
    u_xlat1.x = u_xlat9 * 0.5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = (-u_xlat0.w) * u_xlat1.x + 1.0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat4 = u_xlat1.w * vs_TEXCOORD4.z + (-vs_TEXCOORD4.w);
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat1 = vec4(u_xlat4) * vs_COLOR1;
    u_xlat0 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 631
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %120 %124 %125 %128 %130 %182 %192 %235 %358 %457 %544 %561 %599 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpMemberDecorate %23 25 Offset 23 
                                                      OpMemberDecorate %23 26 Offset 23 
                                                      OpMemberDecorate %23 27 Offset 23 
                                                      OpMemberDecorate %23 28 Offset 23 
                                                      OpMemberDecorate %23 29 Offset 23 
                                                      OpMemberDecorate %23 30 Offset 23 
                                                      OpMemberDecorate %23 31 Offset 23 
                                                      OpMemberDecorate %23 32 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate vs_TEXCOORD0 Location 128 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate vs_TEXCOORD2 Location 182 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %235 Location 235 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 457 
                                                      OpDecorate vs_TEXCOORD4 Location 544 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate vs_TEXCOORD5 Location 599 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeArray %7 %17 
                                              %23 = OpTypeStruct %15 %7 %18 %19 %20 %21 %6 %6 %6 %22 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 19 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 20 
                               Private f32_4* %38 = OpVariable Private 
                                          i32 %41 = OpConstant 2 
                                          i32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Uniform %7 
                                          i32 %47 = OpConstant 0 
                               Private f32_4* %62 = OpVariable Private 
                                          i32 %64 = OpConstant 3 
                                              %82 = OpTypePointer Uniform %15 
                               Private f32_4* %88 = OpVariable Private 
                                          i32 %91 = OpConstant 5 
                                         u32 %116 = OpConstant 1 
                                             %117 = OpTypeArray %6 %116 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %122 = OpTypePointer Output %7 
                               Output f32_4* %124 = OpVariable Output 
                                Input f32_4* %125 = OpVariable Input 
                                             %127 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %129 = OpTypePointer Input %12 
                                Input f32_2* %130 = OpVariable Input 
                                             %132 = OpTypePointer Private %12 
                              Private f32_2* %133 = OpVariable Private 
                                         i32 %137 = OpConstant 4 
                                         i32 %153 = OpConstant 27 
                                         i32 %156 = OpConstant 28 
                                             %165 = OpTypePointer Private %6 
                                Private f32* %166 = OpVariable Private 
                                         i32 %170 = OpConstant 22 
                                         i32 %173 = OpConstant 23 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_2 %178 = OpConstantComposite %177 %177 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %189 = OpConstant 0 
                                Private f32* %191 = OpVariable Private 
                                Input f32_2* %192 = OpVariable Input 
                                             %193 = OpTypePointer Input %6 
                                         i32 %197 = OpConstant 26 
                                         i32 %201 = OpConstant 30 
                                         f32 %204 = OpConstant 3.674022E-40 
                                         i32 %213 = OpConstant 29 
                                             %234 = OpTypePointer Input %15 
                                Input f32_3* %235 = OpVariable Input 
                                         u32 %253 = OpConstant 2 
                                             %262 = OpTypePointer Private %15 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 15 
                                         i32 %326 = OpConstant 16 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 17 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 21 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %456 = OpTypePointer Output %15 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %467 = OpConstant 14 
                                         i32 %470 = OpConstant 13 
                                         i32 %473 = OpConstant 11 
                                         i32 %476 = OpConstant 12 
                                         i32 %480 = OpConstant 18 
                                Private f32* %509 = OpVariable Private 
                                         f32 %515 = OpConstant 3.674022E-40 
                                         i32 %534 = OpConstant 24 
                                         i32 %537 = OpConstant 25 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                               Output f32_4* %561 = OpVariable Output 
                                         i32 %562 = OpConstant 10 
                                         f32 %577 = OpConstant 3.674022E-40 
                                         f32 %587 = OpConstant 3.674022E-40 
                                         f32 %594 = OpConstant 3.674022E-40 
                                       f32_2 %595 = OpConstantComposite %594 %594 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %602 = OpConstant 31 
                                         i32 %615 = OpConstant 32 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %14 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                                      OpStore %9 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 1 1 1 1 
                               Uniform f32_4* %44 = OpAccessChain %25 %41 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_4 %46 = OpFMul %40 %45 
                                                      OpStore %38 %46 
                               Uniform f32_4* %48 = OpAccessChain %25 %41 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %38 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %38 %54 
                               Uniform f32_4* %55 = OpAccessChain %25 %41 %41 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %11 
                                        f32_4 %58 = OpVectorShuffle %57 %57 2 2 2 2 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %38 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %38 %61 
                                        f32_4 %63 = OpLoad %38 
                               Uniform f32_4* %65 = OpAccessChain %25 %41 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %62 %67 
                               Uniform f32_4* %68 = OpAccessChain %25 %41 %64 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_4 %71 = OpLoad %11 
                                        f32_3 %72 = OpVectorShuffle %71 %71 3 3 3 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %38 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %38 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %38 %78 
                                        f32_4 %79 = OpLoad %38 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpFNegate %80 
                               Uniform f32_3* %83 = OpAccessChain %25 %47 
                                        f32_3 %84 = OpLoad %83 
                                        f32_3 %85 = OpFAdd %81 %84 
                                        f32_4 %86 = OpLoad %38 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %38 %87 
                                        f32_4 %89 = OpLoad %62 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %25 %91 %42 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %90 %93 
                                                      OpStore %88 %94 
                               Uniform f32_4* %95 = OpAccessChain %25 %91 %47 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %62 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %88 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %88 %101 
                              Uniform f32_4* %102 = OpAccessChain %25 %91 %41 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %62 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %88 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %88 %108 
                              Uniform f32_4* %109 = OpAccessChain %25 %91 %64 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpVectorShuffle %111 %111 3 3 3 3 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %62 %115 
                                       f32_4 %121 = OpLoad %62 
                               Output f32_4* %123 = OpAccessChain %120 %47 
                                                      OpStore %123 %121 
                                       f32_4 %126 = OpLoad %125 
                                                      OpStore %124 %126 
                                       f32_2 %131 = OpLoad %130 
                                                      OpStore vs_TEXCOORD0 %131 
                              Uniform f32_4* %134 = OpAccessChain %25 %42 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %25 %137 %42 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %137 %47 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                              Uniform f32_4* %145 = OpAccessChain %25 %42 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 0 
                                       f32_2 %148 = OpFMul %144 %147 
                                       f32_2 %149 = OpLoad %133 
                                       f32_2 %150 = OpFAdd %148 %149 
                                                      OpStore %133 %150 
                                       f32_2 %151 = OpLoad %133 
                                       f32_2 %152 = OpExtInst %1 4 %151 
                                Uniform f32* %154 = OpAccessChain %25 %153 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %25 %156 
                                         f32 %158 = OpLoad %157 
                                       f32_2 %159 = OpCompositeConstruct %155 %158 
                                       f32_2 %160 = OpFMul %152 %159 
                                                      OpStore %133 %160 
                                       f32_4 %161 = OpLoad %62 
                                       f32_2 %162 = OpVectorShuffle %161 %161 3 3 
                                       f32_2 %163 = OpLoad %133 
                                       f32_2 %164 = OpFDiv %162 %163 
                                                      OpStore %133 %164 
                                       f32_2 %167 = OpLoad %133 
                                       f32_2 %168 = OpLoad %133 
                                         f32 %169 = OpDot %167 %168 
                                                      OpStore %166 %169 
                                Uniform f32* %171 = OpAccessChain %25 %170 
                                         f32 %172 = OpLoad %171 
                                Uniform f32* %174 = OpAccessChain %25 %173 
                                         f32 %175 = OpLoad %174 
                                       f32_2 %176 = OpCompositeConstruct %172 %175 
                                       f32_2 %179 = OpFMul %176 %178 
                                       f32_2 %180 = OpLoad %133 
                                       f32_2 %181 = OpFAdd %179 %180 
                                                      OpStore %133 %181 
                                       f32_2 %183 = OpLoad %133 
                                       f32_2 %184 = OpFDiv %178 %183 
                                       f32_4 %185 = OpLoad vs_TEXCOORD2 
                                       f32_4 %186 = OpVectorShuffle %185 %184 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %186 
                                         f32 %187 = OpLoad %166 
                                         f32 %188 = OpExtInst %1 32 %187 
                                Private f32* %190 = OpAccessChain %133 %189 
                                                      OpStore %190 %188 
                                  Input f32* %194 = OpAccessChain %192 %116 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpExtInst %1 4 %195 
                                Uniform f32* %198 = OpAccessChain %25 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %196 %199 
                                                      OpStore %191 %200 
                                Uniform f32* %202 = OpAccessChain %25 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %166 %205 
                                         f32 %206 = OpLoad %191 
                                         f32 %207 = OpLoad %166 
                                         f32 %208 = OpFMul %206 %207 
                                                      OpStore %191 %208 
                                         f32 %209 = OpLoad %191 
                                Private f32* %210 = OpAccessChain %133 %189 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFMul %209 %211 
                                                      OpStore %166 %212 
                                Uniform f32* %214 = OpAccessChain %25 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %216 %204 
                                Private f32* %218 = OpAccessChain %62 %189 
                                                      OpStore %218 %217 
                                         f32 %219 = OpLoad %166 
                                         f32 %220 = OpExtInst %1 4 %219 
                                Private f32* %221 = OpAccessChain %62 %189 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %220 %222 
                                Private f32* %224 = OpAccessChain %62 %189 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %133 %189 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpLoad %191 
                                         f32 %228 = OpFMul %226 %227 
                                Private f32* %229 = OpAccessChain %62 %189 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFNegate %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %133 %189 
                                                      OpStore %233 %232 
                                       f32_3 %236 = OpLoad %235 
                              Uniform f32_4* %237 = OpAccessChain %25 %64 %47 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                         f32 %240 = OpDot %236 %239 
                                Private f32* %241 = OpAccessChain %88 %189 
                                                      OpStore %241 %240 
                                       f32_3 %242 = OpLoad %235 
                              Uniform f32_4* %243 = OpAccessChain %25 %64 %42 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                         f32 %246 = OpDot %242 %245 
                                Private f32* %247 = OpAccessChain %88 %116 
                                                      OpStore %247 %246 
                                       f32_3 %248 = OpLoad %235 
                              Uniform f32_4* %249 = OpAccessChain %25 %64 %41 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                         f32 %252 = OpDot %248 %251 
                                Private f32* %254 = OpAccessChain %88 %253 
                                                      OpStore %254 %252 
                                       f32_4 %255 = OpLoad %88 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_4 %257 = OpLoad %88 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                         f32 %259 = OpDot %256 %258 
                                                      OpStore %191 %259 
                                         f32 %260 = OpLoad %191 
                                         f32 %261 = OpExtInst %1 32 %260 
                                                      OpStore %191 %261 
                                         f32 %264 = OpLoad %191 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %88 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %38 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %38 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %191 %273 
                                         f32 %274 = OpLoad %191 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %191 %275 
                                         f32 %276 = OpLoad %191 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %38 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %88 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %88 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %88 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %191 %286 
                                         f32 %287 = OpLoad %191 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %133 %189 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %62 %189 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %133 %189 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %137 %64 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %133 %189 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %166 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %189 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %192 %116 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %204 %302 
                                Private f32* %321 = OpAccessChain %133 %189 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %191 %329 
                                Private f32* %330 = OpAccessChain %133 %189 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %191 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %133 %189 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %133 %189 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %177 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %133 %189 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %133 %189 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %133 %189 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %133 %189 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %253 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %189 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %191 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %204 
                                                      OpStore %166 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %166 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %166 %382 
                                         f32 %383 = OpLoad %166 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %191 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %166 %387 
                                Private f32* %388 = OpAccessChain %133 %189 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %166 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %189 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %133 %189 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %133 %189 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %191 
                                Private f32* %403 = OpAccessChain %133 %189 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %253 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %88 %412 
                                       f32_4 %413 = OpLoad %88 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %88 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %88 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_4 %426 = OpLoad %9 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 2 3 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %88 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %38 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %42 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                       f32_4 %443 = OpLoad %9 
                                       f32_4 %444 = OpVectorShuffle %443 %442 4 5 2 6 
                                                      OpStore %9 %444 
                              Uniform f32_4* %445 = OpAccessChain %25 %438 %47 
                                       f32_4 %446 = OpLoad %445 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                       f32_4 %448 = OpLoad %38 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
                                       f32_3 %450 = OpFMul %447 %449 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 3 
                                       f32_3 %453 = OpFAdd %450 %452 
                                       f32_4 %454 = OpLoad %9 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 2 6 
                                                      OpStore %9 %455 
                              Uniform f32_4* %458 = OpAccessChain %25 %438 %41 
                                       f32_4 %459 = OpLoad %458 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_4 %461 = OpLoad %38 
                                       f32_3 %462 = OpVectorShuffle %461 %461 2 2 2 
                                       f32_3 %463 = OpFMul %460 %462 
                                       f32_4 %464 = OpLoad %9 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 3 
                                       f32_3 %466 = OpFAdd %463 %465 
                                                      OpStore vs_TEXCOORD3 %466 
                                Uniform f32* %468 = OpAccessChain %25 %467 
                                         f32 %469 = OpLoad %468 
                                Uniform f32* %471 = OpAccessChain %25 %470 
                                         f32 %472 = OpLoad %471 
                                Uniform f32* %474 = OpAccessChain %25 %473 
                                         f32 %475 = OpLoad %474 
                                Uniform f32* %477 = OpAccessChain %25 %476 
                                         f32 %478 = OpLoad %477 
                                       f32_4 %479 = OpCompositeConstruct %469 %472 %475 %478 
                                Uniform f32* %481 = OpAccessChain %25 %480 
                                         f32 %482 = OpLoad %481 
                                Uniform f32* %483 = OpAccessChain %25 %480 
                                         f32 %484 = OpLoad %483 
                                Uniform f32* %485 = OpAccessChain %25 %480 
                                         f32 %486 = OpLoad %485 
                                Uniform f32* %487 = OpAccessChain %25 %480 
                                         f32 %488 = OpLoad %487 
                                       f32_4 %489 = OpCompositeConstruct %482 %484 %486 %488 
                                         f32 %490 = OpCompositeExtract %489 0 
                                         f32 %491 = OpCompositeExtract %489 1 
                                         f32 %492 = OpCompositeExtract %489 2 
                                         f32 %493 = OpCompositeExtract %489 3 
                                       f32_4 %494 = OpCompositeConstruct %490 %491 %492 %493 
                                       f32_4 %495 = OpFMul %479 %494 
                                                      OpStore %38 %495 
                                Private f32* %496 = OpAccessChain %38 %189 
                                         f32 %497 = OpLoad %496 
                                Private f32* %498 = OpAccessChain %263 %189 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %497 %499 
                                         f32 %501 = OpFAdd %500 %204 
                                Private f32* %502 = OpAccessChain %9 %189 
                                                      OpStore %502 %501 
                                Private f32* %503 = OpAccessChain %263 %189 
                                         f32 %504 = OpLoad %503 
                                Private f32* %505 = OpAccessChain %9 %189 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFDiv %504 %506 
                                Private f32* %508 = OpAccessChain %9 %189 
                                                      OpStore %508 %507 
                                Private f32* %510 = OpAccessChain %133 %189 
                                         f32 %511 = OpLoad %510 
                                Private f32* %512 = OpAccessChain %9 %189 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                         f32 %516 = OpFAdd %514 %515 
                                                      OpStore %509 %516 
                                Private f32* %517 = OpAccessChain %9 %189 
                                         f32 %518 = OpLoad %517 
                                Private f32* %519 = OpAccessChain %38 %116 
                                         f32 %520 = OpLoad %519 
                                         f32 %521 = OpFMul %518 %520 
                                Private f32* %522 = OpAccessChain %133 %189 
                                                      OpStore %522 %521 
                                       f32_4 %523 = OpLoad %38 
                                       f32_2 %524 = OpVectorShuffle %523 %523 2 3 
                                       f32_2 %525 = OpFNegate %524 
                                Uniform f32* %526 = OpAccessChain %25 %197 
                                         f32 %527 = OpLoad %526 
                                       f32_2 %528 = OpCompositeConstruct %527 %527 
                                       f32_2 %529 = OpFMul %525 %528 
                                       f32_4 %530 = OpLoad %38 
                                       f32_4 %531 = OpVectorShuffle %530 %529 4 5 2 3 
                                                      OpStore %38 %531 
                                       f32_4 %532 = OpLoad %38 
                                       f32_2 %533 = OpVectorShuffle %532 %532 0 1 
                                Uniform f32* %535 = OpAccessChain %25 %534 
                                         f32 %536 = OpLoad %535 
                                Uniform f32* %538 = OpAccessChain %25 %537 
                                         f32 %539 = OpLoad %538 
                                       f32_2 %540 = OpCompositeConstruct %536 %539 
                                       f32_2 %541 = OpFDiv %533 %540 
                                       f32_4 %542 = OpLoad %38 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 2 3 
                                                      OpStore %38 %543 
                                       f32_4 %545 = OpLoad %38 
                                       f32_2 %546 = OpVectorShuffle %545 %545 0 1 
                                       f32_2 %547 = OpLoad %130 
                                       f32_2 %548 = OpFAdd %546 %547 
                                       f32_4 %549 = OpLoad vs_TEXCOORD4 
                                       f32_4 %550 = OpVectorShuffle %549 %548 4 5 2 3 
                                                      OpStore vs_TEXCOORD4 %550 
                                Private f32* %551 = OpAccessChain %9 %189 
                                         f32 %552 = OpLoad %551 
                                 Output f32* %553 = OpAccessChain vs_TEXCOORD4 %253 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %133 %189 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpFNegate %555 
                                         f32 %557 = OpFMul %556 %355 
                                         f32 %558 = OpLoad %509 
                                         f32 %559 = OpFAdd %557 %558 
                                 Output f32* %560 = OpAccessChain vs_TEXCOORD4 %299 
                                                      OpStore %560 %559 
                              Uniform f32_4* %563 = OpAccessChain %25 %562 
                                       f32_4 %564 = OpLoad %563 
                                       f32_3 %565 = OpVectorShuffle %564 %564 3 3 3 
                              Uniform f32_4* %566 = OpAccessChain %25 %562 
                                       f32_4 %567 = OpLoad %566 
                                       f32_3 %568 = OpVectorShuffle %567 %567 0 1 2 
                                       f32_3 %569 = OpFMul %565 %568 
                                       f32_4 %570 = OpLoad %561 
                                       f32_4 %571 = OpVectorShuffle %570 %569 4 5 6 3 
                                                      OpStore %561 %571 
                                Uniform f32* %572 = OpAccessChain %25 %562 %299 
                                         f32 %573 = OpLoad %572 
                                 Output f32* %574 = OpAccessChain %561 %299 
                                                      OpStore %574 %573 
                                  Input f32* %575 = OpAccessChain %192 %189 
                                         f32 %576 = OpLoad %575 
                                         f32 %578 = OpFMul %576 %577 
                                Private f32* %579 = OpAccessChain %9 %189 
                                                      OpStore %579 %578 
                                Private f32* %580 = OpAccessChain %9 %189 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 8 %581 
                                Private f32* %583 = OpAccessChain %133 %189 
                                                      OpStore %583 %582 
                                Private f32* %584 = OpAccessChain %133 %189 
                                         f32 %585 = OpLoad %584 
                                         f32 %586 = OpFNegate %585 
                                         f32 %588 = OpFMul %586 %587 
                                  Input f32* %589 = OpAccessChain %192 %189 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFAdd %588 %590 
                                Private f32* %592 = OpAccessChain %133 %116 
                                                      OpStore %592 %591 
                                       f32_2 %593 = OpLoad %133 
                                       f32_2 %596 = OpFMul %593 %595 
                                       f32_4 %597 = OpLoad %9 
                                       f32_4 %598 = OpVectorShuffle %597 %596 4 5 2 3 
                                                      OpStore %9 %598 
                                       f32_4 %600 = OpLoad %9 
                                       f32_2 %601 = OpVectorShuffle %600 %600 0 1 
                              Uniform f32_4* %603 = OpAccessChain %25 %602 
                                       f32_4 %604 = OpLoad %603 
                                       f32_2 %605 = OpVectorShuffle %604 %604 0 1 
                                       f32_2 %606 = OpFMul %601 %605 
                              Uniform f32_4* %607 = OpAccessChain %25 %602 
                                       f32_4 %608 = OpLoad %607 
                                       f32_2 %609 = OpVectorShuffle %608 %608 2 3 
                                       f32_2 %610 = OpFAdd %606 %609 
                                       f32_4 %611 = OpLoad vs_TEXCOORD5 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %612 
                                       f32_4 %613 = OpLoad %9 
                                       f32_2 %614 = OpVectorShuffle %613 %613 0 1 
                              Uniform f32_4* %616 = OpAccessChain %25 %615 
                                       f32_4 %617 = OpLoad %616 
                                       f32_2 %618 = OpVectorShuffle %617 %617 0 1 
                                       f32_2 %619 = OpFMul %614 %618 
                              Uniform f32_4* %620 = OpAccessChain %25 %615 
                                       f32_4 %621 = OpLoad %620 
                                       f32_2 %622 = OpVectorShuffle %621 %621 2 3 
                                       f32_2 %623 = OpFAdd %619 %622 
                                       f32_4 %624 = OpLoad vs_TEXCOORD5 
                                       f32_4 %625 = OpVectorShuffle %624 %623 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %625 
                                 Output f32* %626 = OpAccessChain %120 %47 %116 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFNegate %627 
                                 Output f32* %629 = OpAccessChain %120 %47 %116 
                                                      OpStore %629 %628 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 285
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %30 %63 %136 %162 %252 %269 %279 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD5 Location 30 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %90 DescriptorSet 90 
                                                      OpDecorate %90 Binding 90 
                                                      OpDecorate %92 DescriptorSet 92 
                                                      OpDecorate %92 Binding 92 
                                                      OpDecorate vs_TEXCOORD1 Location 136 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %158 DescriptorSet 158 
                                                      OpDecorate %158 Binding 158 
                                                      OpDecorate vs_TEXCOORD0 Location 162 
                                                      OpDecorate vs_TEXCOORD4 Location 252 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate %279 Location 279 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 5 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 6 
                                              %21 = OpTypeVector %6 2 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %7 
                                              %29 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %37 = OpTypePointer UniformConstant %36 
         UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampler 
                                              %41 = OpTypePointer UniformConstant %40 
                     UniformConstant sampler* %42 = OpVariable UniformConstant 
                                              %44 = OpTypeSampledImage %36 
                                          i32 %50 = OpConstant 7 
                                              %54 = OpTypeVector %6 3 
                               Private f32_4* %62 = OpVariable Private 
                                 Input f32_4* %63 = OpVariable Input 
                                          i32 %66 = OpConstant 3 
                               Private f32_4* %73 = OpVariable Private 
                                          i32 %74 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
         UniformConstant read_only Texture2D* %90 = OpVariable UniformConstant 
                     UniformConstant sampler* %92 = OpVariable UniformConstant 
                                             %105 = OpTypeInt 32 0 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Private %6 
                                         i32 %125 = OpConstant 8 
                                         i32 %128 = OpConstant 9 
                                         u32 %132 = OpConstant 0 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %137 = OpConstant 1 
                                             %138 = OpTypePointer Input %6 
                                Private f32* %143 = OpVariable Private 
                                         f32 %146 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                Private f32* %155 = OpVariable Private 
        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
                    UniformConstant sampler* %158 = OpVariable UniformConstant 
                                             %161 = OpTypePointer Input %21 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         u32 %168 = OpConstant 2 
                                Private f32* %172 = OpVariable Private 
                                         f32 %181 = OpConstant 3.674022E-40 
                                         i32 %201 = OpConstant 4 
                                Private f32* %248 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                Input f32_4* %269 = OpVariable Input 
                                             %278 = OpTypePointer Output %7 
                               Output f32_4* %279 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                        f32_2 %22 = OpCompositeConstruct %17 %20 
                               Uniform f32_4* %25 = OpAccessChain %12 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %22 %27 
                                        f32_4 %31 = OpLoad vs_TEXCOORD5 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %28 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %9 %35 
                          read_only Texture2D %39 = OpLoad %38 
                                      sampler %43 = OpLoad %42 
                   read_only Texture2DSampled %45 = OpSampledImage %39 %43 
                                        f32_4 %46 = OpLoad %9 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                        f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                                      OpStore %9 %48 
                                        f32_4 %49 = OpLoad %9 
                               Uniform f32_4* %51 = OpAccessChain %12 %50 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %49 %52 
                                                      OpStore %9 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_4 %57 = OpLoad %9 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %9 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %12 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFMul %65 %69 
                                        f32_4 %71 = OpLoad %62 
                                        f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                                      OpStore %62 %72 
                                 Uniform f32* %75 = OpAccessChain %12 %74 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %12 %77 
                                          f32 %79 = OpLoad %78 
                                        f32_2 %80 = OpCompositeConstruct %76 %79 
                               Uniform f32_4* %81 = OpAccessChain %12 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 1 1 
                                        f32_2 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad vs_TEXCOORD5 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_2 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %73 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                                      OpStore %73 %89 
                          read_only Texture2D %91 = OpLoad %90 
                                      sampler %93 = OpLoad %92 
                   read_only Texture2DSampled %94 = OpSampledImage %91 %93 
                                        f32_4 %95 = OpLoad %73 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                                      OpStore %73 %97 
                                        f32_4 %98 = OpLoad %62 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_4 %100 = OpLoad %73 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %62 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %62 %104 
                                Private f32* %108 = OpAccessChain %73 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %110 = OpAccessChain %12 %66 %106 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFMul %109 %111 
                                Private f32* %113 = OpAccessChain %73 %106 
                                                      OpStore %113 %112 
                                       f32_4 %114 = OpLoad %62 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_4 %116 = OpLoad %73 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %73 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %73 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpLoad %73 
                                       f32_4 %123 = OpFNegate %122 
                                       f32_4 %124 = OpFAdd %121 %123 
                                                      OpStore %9 %124 
                                Uniform f32* %126 = OpAccessChain %12 %125 
                                         f32 %127 = OpLoad %126 
                                Uniform f32* %129 = OpAccessChain %12 %128 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %127 %130 
                                Private f32* %133 = OpAccessChain %62 %132 
                                                      OpStore %133 %131 
                                Private f32* %134 = OpAccessChain %62 %132 
                                         f32 %135 = OpLoad %134 
                                  Input f32* %139 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFMul %135 %140 
                                Private f32* %142 = OpAccessChain %62 %132 
                                                      OpStore %142 %141 
                                Private f32* %144 = OpAccessChain %62 %132 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 37 %145 %146 
                                                      OpStore %143 %147 
                                Private f32* %148 = OpAccessChain %62 %132 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                Private f32* %152 = OpAccessChain %62 %132 
                                                      OpStore %152 %151 
                                         f32 %153 = OpLoad %143 
                                         f32 %154 = OpExtInst %1 31 %153 
                                                      OpStore %143 %154 
                         read_only Texture2D %157 = OpLoad %156 
                                     sampler %159 = OpLoad %158 
                  read_only Texture2DSampled %160 = OpSampledImage %157 %159 
                                       f32_2 %163 = OpLoad vs_TEXCOORD0 
                                       f32_4 %164 = OpImageSampleImplicitLod %160 %163 
                                         f32 %165 = OpCompositeExtract %164 3 
                                                      OpStore %155 %165 
                                         f32 %166 = OpLoad %155 
                                         f32 %167 = OpFNegate %166 
                                  Input f32* %169 = OpAccessChain vs_TEXCOORD1 %168 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFAdd %167 %170 
                                                      OpStore %155 %171 
                                         f32 %173 = OpLoad %155 
                                  Input f32* %174 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %173 %175 
                                Private f32* %177 = OpAccessChain %62 %132 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                                      OpStore %172 %179 
                                         f32 %180 = OpLoad %172 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %146 
                                                      OpStore %172 %182 
                                         f32 %183 = OpLoad %155 
                                  Input f32* %184 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                Private f32* %187 = OpAccessChain %62 %132 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                         f32 %190 = OpFAdd %186 %189 
                                Private f32* %191 = OpAccessChain %62 %132 
                                                      OpStore %191 %190 
                                         f32 %192 = OpLoad %143 
                                         f32 %193 = OpLoad %172 
                                         f32 %194 = OpFMul %192 %193 
                                                      OpStore %143 %194 
                                         f32 %195 = OpLoad %143 
                                       f32_4 %196 = OpCompositeConstruct %195 %195 %195 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFMul %196 %197 
                                       f32_4 %199 = OpLoad %73 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %9 %200 
                                Uniform f32* %202 = OpAccessChain %12 %201 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %12 %128 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                                      OpStore %143 %206 
                                         f32 %207 = OpLoad %143 
                                  Input f32* %208 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %207 %209 
                                                      OpStore %155 %210 
                                         f32 %211 = OpLoad %143 
                                  Input f32* %212 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                         f32 %215 = OpFAdd %214 %146 
                                                      OpStore %143 %215 
                                         f32 %216 = OpLoad %155 
                                         f32 %217 = OpFMul %216 %150 
                                Private f32* %218 = OpAccessChain %62 %132 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFAdd %217 %219 
                                Private f32* %221 = OpAccessChain %62 %132 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %62 %132 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpLoad %143 
                                         f32 %225 = OpFDiv %223 %224 
                                Private f32* %226 = OpAccessChain %62 %132 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %62 %132 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpExtInst %1 43 %228 %181 %146 
                                Private f32* %230 = OpAccessChain %62 %132 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %62 %132 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                         f32 %234 = OpFAdd %233 %146 
                                Private f32* %235 = OpAccessChain %62 %132 
                                                      OpStore %235 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %62 
                                       f32_4 %238 = OpVectorShuffle %237 %237 0 0 0 0 
                                       f32_4 %239 = OpFMul %236 %238 
                                                      OpStore %73 %239 
                                Private f32* %240 = OpAccessChain %9 %106 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFNegate %241 
                                Private f32* %243 = OpAccessChain %62 %132 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                         f32 %246 = OpFAdd %245 %146 
                                Private f32* %247 = OpAccessChain %9 %132 
                                                      OpStore %247 %246 
                         read_only Texture2D %249 = OpLoad %156 
                                     sampler %250 = OpLoad %158 
                  read_only Texture2DSampled %251 = OpSampledImage %249 %250 
                                       f32_4 %253 = OpLoad vs_TEXCOORD4 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_4 %255 = OpImageSampleImplicitLod %251 %254 
                                         f32 %256 = OpCompositeExtract %255 3 
                                                      OpStore %248 %256 
                                         f32 %257 = OpLoad %248 
                                  Input f32* %258 = OpAccessChain vs_TEXCOORD4 %168 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                  Input f32* %261 = OpAccessChain vs_TEXCOORD4 %106 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                         f32 %264 = OpFAdd %260 %263 
                                                      OpStore %248 %264 
                                         f32 %265 = OpLoad %248 
                                         f32 %266 = OpExtInst %1 43 %265 %181 %146 
                                                      OpStore %248 %266 
                                         f32 %267 = OpLoad %248 
                                       f32_4 %268 = OpCompositeConstruct %267 %267 %267 %267 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpFMul %268 %270 
                                                      OpStore %62 %271 
                                       f32_4 %272 = OpLoad %62 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %273 0 0 0 0 
                                       f32_4 %275 = OpFMul %272 %274 
                                       f32_4 %276 = OpLoad %73 
                                       f32_4 %277 = OpFAdd %275 %276 
                                                      OpStore %9 %277 
                                       f32_4 %280 = OpLoad %9 
                                       f32_4 %281 = OpLoad %63 
                                       f32_4 %282 = OpVectorShuffle %281 %281 3 3 3 3 
                                       f32_4 %283 = OpFMul %280 %282 
                                                      OpStore %279 %283 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-vs_TEXCOORD1.x);
    u_xlat4 = (-u_xlat0.w) + vs_TEXCOORD1.z;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat8.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
    u_xlat4 = u_xlat8.x * u_xlat12;
    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat1 = texture(_OutlineTex, u_xlat8.xy);
    u_xlat1 = u_xlat1 * _OutlineColor;
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat3 = texture(_FaceTex, u_xlat8.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.w = u_xlat3.w * _FaceColor.w;
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1 = u_xlat0.xxxx * u_xlat1;
    SV_Target0 = u_xlat1 * vs_COLOR0.wwww;
    u_xlatb0 = u_xlat4<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 517
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %183 %193 %236 %358 %452 %485 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate vs_TEXCOORD0 Location 129 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate vs_TEXCOORD2 Location 183 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 452 
                                                      OpDecorate vs_TEXCOORD5 Location 485 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_4* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %10 %17 
                                              %19 = OpTypeArray %10 %17 
                                              %20 = OpTypeArray %10 %17 
                                              %21 = OpTypeArray %10 %17 
                                              %22 = OpTypeArray %10 %17 
                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %6 %10 %10 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 13 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 14 
                                              %38 = OpTypePointer Private %10 
                               Private f32_4* %39 = OpVariable Private 
                                          i32 %42 = OpConstant 2 
                                          i32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Uniform %10 
                                          i32 %48 = OpConstant 0 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %65 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                               Private f32_4* %89 = OpVariable Private 
                                          i32 %92 = OpConstant 5 
                                         u32 %117 = OpConstant 1 
                                             %118 = OpTypeArray %6 %117 
                                             %119 = OpTypeStruct %10 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %123 = OpTypePointer Output %10 
                               Output f32_4* %125 = OpVariable Output 
                                Input f32_4* %126 = OpVariable Input 
                                             %128 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %130 = OpTypePointer Input %13 
                                Input f32_2* %131 = OpVariable Input 
                                             %133 = OpTypePointer Private %13 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %138 = OpConstant 4 
                                         i32 %154 = OpConstant 19 
                                         i32 %157 = OpConstant 20 
                                             %166 = OpTypePointer Private %6 
                                Private f32* %167 = OpVariable Private 
                                         i32 %171 = OpConstant 16 
                                         i32 %174 = OpConstant 17 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %190 = OpConstant 0 
                                Private f32* %192 = OpVariable Private 
                                Input f32_2* %193 = OpVariable Input 
                                             %194 = OpTypePointer Input %6 
                                         i32 %198 = OpConstant 18 
                                         i32 %202 = OpConstant 22 
                                         f32 %205 = OpConstant 3.674022E-40 
                                         i32 %214 = OpConstant 21 
                                             %235 = OpTypePointer Input %7 
                                Input f32_3* %236 = OpVariable Input 
                                         u32 %254 = OpConstant 2 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 10 
                                         i32 %326 = OpConstant 11 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 12 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 15 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %451 = OpTypePointer Output %7 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         f32 %463 = OpConstant 3.674022E-40 
                                         f32 %473 = OpConstant 3.674022E-40 
                                         f32 %480 = OpConstant 3.674022E-40 
                                       f32_2 %481 = OpConstantComposite %480 %480 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %488 = OpConstant 23 
                                         i32 %501 = OpConstant 24 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %15 %34 
                                        f32_3 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
                                                      OpStore %9 %37 
                                        f32_3 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFMul %41 %46 
                                                      OpStore %39 %47 
                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %39 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore %39 %55 
                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %12 
                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %39 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %39 %62 
                                        f32_4 %64 = OpLoad %39 
                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFAdd %64 %67 
                                                      OpStore %63 %68 
                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_4 %72 = OpLoad %12 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %39 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %39 %79 
                                        f32_4 %80 = OpLoad %39 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpFNegate %81 
                               Uniform f32_3* %84 = OpAccessChain %25 %48 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpFAdd %82 %85 
                                        f32_4 %87 = OpLoad %39 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %39 %88 
                                        f32_4 %90 = OpLoad %63 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpFMul %91 %94 
                                                      OpStore %89 %95 
                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %63 
                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %89 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %89 %102 
                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %63 
                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %89 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %89 %109 
                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %63 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %89 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %63 %116 
                                       f32_4 %122 = OpLoad %63 
                               Output f32_4* %124 = OpAccessChain %121 %48 
                                                      OpStore %124 %122 
                                       f32_4 %127 = OpLoad %126 
                                                      OpStore %125 %127 
                                       f32_2 %132 = OpLoad %131 
                                                      OpStore vs_TEXCOORD0 %132 
                              Uniform f32_4* %135 = OpAccessChain %25 %43 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 1 1 
                              Uniform f32_4* %139 = OpAccessChain %25 %138 %43 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                                                      OpStore %134 %142 
                              Uniform f32_4* %143 = OpAccessChain %25 %138 %48 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                              Uniform f32_4* %146 = OpAccessChain %25 %43 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 0 
                                       f32_2 %149 = OpFMul %145 %148 
                                       f32_2 %150 = OpLoad %134 
                                       f32_2 %151 = OpFAdd %149 %150 
                                                      OpStore %134 %151 
                                       f32_2 %152 = OpLoad %134 
                                       f32_2 %153 = OpExtInst %1 4 %152 
                                Uniform f32* %155 = OpAccessChain %25 %154 
                                         f32 %156 = OpLoad %155 
                                Uniform f32* %158 = OpAccessChain %25 %157 
                                         f32 %159 = OpLoad %158 
                                       f32_2 %160 = OpCompositeConstruct %156 %159 
                                       f32_2 %161 = OpFMul %153 %160 
                                                      OpStore %134 %161 
                                       f32_4 %162 = OpLoad %63 
                                       f32_2 %163 = OpVectorShuffle %162 %162 3 3 
                                       f32_2 %164 = OpLoad %134 
                                       f32_2 %165 = OpFDiv %163 %164 
                                                      OpStore %134 %165 
                                       f32_2 %168 = OpLoad %134 
                                       f32_2 %169 = OpLoad %134 
                                         f32 %170 = OpDot %168 %169 
                                                      OpStore %167 %170 
                                Uniform f32* %172 = OpAccessChain %25 %171 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %175 = OpAccessChain %25 %174 
                                         f32 %176 = OpLoad %175 
                                       f32_2 %177 = OpCompositeConstruct %173 %176 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %181 = OpLoad %134 
                                       f32_2 %182 = OpFAdd %180 %181 
                                                      OpStore %134 %182 
                                       f32_2 %184 = OpLoad %134 
                                       f32_2 %185 = OpFDiv %179 %184 
                                       f32_4 %186 = OpLoad vs_TEXCOORD2 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %187 
                                         f32 %188 = OpLoad %167 
                                         f32 %189 = OpExtInst %1 32 %188 
                                Private f32* %191 = OpAccessChain %134 %190 
                                                      OpStore %191 %189 
                                  Input f32* %195 = OpAccessChain %193 %117 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpExtInst %1 4 %196 
                                Uniform f32* %199 = OpAccessChain %25 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %197 %200 
                                                      OpStore %192 %201 
                                Uniform f32* %203 = OpAccessChain %25 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFAdd %204 %205 
                                                      OpStore %167 %206 
                                         f32 %207 = OpLoad %192 
                                         f32 %208 = OpLoad %167 
                                         f32 %209 = OpFMul %207 %208 
                                                      OpStore %192 %209 
                                         f32 %210 = OpLoad %192 
                                Private f32* %211 = OpAccessChain %134 %190 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                                      OpStore %167 %213 
                                Uniform f32* %215 = OpAccessChain %25 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                         f32 %218 = OpFAdd %217 %205 
                                Private f32* %219 = OpAccessChain %63 %190 
                                                      OpStore %219 %218 
                                         f32 %220 = OpLoad %167 
                                         f32 %221 = OpExtInst %1 4 %220 
                                Private f32* %222 = OpAccessChain %63 %190 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %221 %223 
                                Private f32* %225 = OpAccessChain %63 %190 
                                                      OpStore %225 %224 
                                Private f32* %226 = OpAccessChain %134 %190 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpLoad %192 
                                         f32 %229 = OpFMul %227 %228 
                                Private f32* %230 = OpAccessChain %63 %190 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFNegate %231 
                                         f32 %233 = OpFAdd %229 %232 
                                Private f32* %234 = OpAccessChain %134 %190 
                                                      OpStore %234 %233 
                                       f32_3 %237 = OpLoad %236 
                              Uniform f32_4* %238 = OpAccessChain %25 %65 %48 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                         f32 %241 = OpDot %237 %240 
                                Private f32* %242 = OpAccessChain %89 %190 
                                                      OpStore %242 %241 
                                       f32_3 %243 = OpLoad %236 
                              Uniform f32_4* %244 = OpAccessChain %25 %65 %43 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                         f32 %247 = OpDot %243 %246 
                                Private f32* %248 = OpAccessChain %89 %117 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %236 
                              Uniform f32_4* %250 = OpAccessChain %25 %65 %42 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                         f32 %253 = OpDot %249 %252 
                                Private f32* %255 = OpAccessChain %89 %254 
                                                      OpStore %255 %253 
                                       f32_4 %256 = OpLoad %89 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %89 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                         f32 %260 = OpDot %257 %259 
                                                      OpStore %192 %260 
                                         f32 %261 = OpLoad %192 
                                         f32 %262 = OpExtInst %1 32 %261 
                                                      OpStore %192 %262 
                                         f32 %264 = OpLoad %192 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %39 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %39 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %192 %273 
                                         f32 %274 = OpLoad %192 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %192 %275 
                                         f32 %276 = OpLoad %192 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %39 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %89 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %89 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %89 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %192 %286 
                                         f32 %287 = OpLoad %192 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %134 %190 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %63 %190 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %134 %190 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %138 %65 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %134 %190 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %167 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %190 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %193 %117 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %205 %302 
                                Private f32* %321 = OpAccessChain %134 %190 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %192 %329 
                                Private f32* %330 = OpAccessChain %134 %190 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %192 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %134 %190 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %134 %190 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %178 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %134 %190 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %134 %190 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %134 %190 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %134 %190 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %254 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %190 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %192 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %205 
                                                      OpStore %167 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %167 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %167 %382 
                                         f32 %383 = OpLoad %167 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %192 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %167 %387 
                                Private f32* %388 = OpAccessChain %134 %190 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %167 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %190 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %134 %190 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %134 %190 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %192 
                                Private f32* %403 = OpAccessChain %134 %190 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %254 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %63 %412 
                                       f32_4 %413 = OpLoad %63 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %63 %416 
                                       f32_3 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %63 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_3 %426 = OpLoad %9 
                                       f32_3 %427 = OpVectorShuffle %426 %425 3 4 2 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %63 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_3 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %39 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %43 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                                      OpStore %9 %442 
                              Uniform f32_4* %443 = OpAccessChain %25 %438 %48 
                                       f32_4 %444 = OpLoad %443 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_4 %446 = OpLoad %39 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 0 0 
                                       f32_3 %448 = OpFMul %445 %447 
                                       f32_3 %449 = OpLoad %9 
                                       f32_3 %450 = OpFAdd %448 %449 
                                                      OpStore %9 %450 
                              Uniform f32_4* %453 = OpAccessChain %25 %438 %42 
                                       f32_4 %454 = OpLoad %453 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %39 
                                       f32_3 %457 = OpVectorShuffle %456 %456 2 2 2 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %9 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore vs_TEXCOORD3 %460 
                                  Input f32* %461 = OpAccessChain %193 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %464 = OpFMul %462 %463 
                                Private f32* %465 = OpAccessChain %9 %190 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %9 %190 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpExtInst %1 8 %467 
                                Private f32* %469 = OpAccessChain %134 %190 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %134 %190 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                         f32 %474 = OpFMul %472 %473 
                                  Input f32* %475 = OpAccessChain %193 %190 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFAdd %474 %476 
                                Private f32* %478 = OpAccessChain %134 %117 
                                                      OpStore %478 %477 
                                       f32_2 %479 = OpLoad %134 
                                       f32_2 %482 = OpFMul %479 %481 
                                       f32_3 %483 = OpLoad %9 
                                       f32_3 %484 = OpVectorShuffle %483 %482 3 4 2 
                                                      OpStore %9 %484 
                                       f32_3 %486 = OpLoad %9 
                                       f32_2 %487 = OpVectorShuffle %486 %486 0 1 
                              Uniform f32_4* %489 = OpAccessChain %25 %488 
                                       f32_4 %490 = OpLoad %489 
                                       f32_2 %491 = OpVectorShuffle %490 %490 0 1 
                                       f32_2 %492 = OpFMul %487 %491 
                              Uniform f32_4* %493 = OpAccessChain %25 %488 
                                       f32_4 %494 = OpLoad %493 
                                       f32_2 %495 = OpVectorShuffle %494 %494 2 3 
                                       f32_2 %496 = OpFAdd %492 %495 
                                       f32_4 %497 = OpLoad vs_TEXCOORD5 
                                       f32_4 %498 = OpVectorShuffle %497 %496 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %498 
                                       f32_3 %499 = OpLoad %9 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                              Uniform f32_4* %502 = OpAccessChain %25 %501 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_2 %505 = OpFMul %500 %504 
                              Uniform f32_4* %506 = OpAccessChain %25 %501 
                                       f32_4 %507 = OpLoad %506 
                                       f32_2 %508 = OpVectorShuffle %507 %507 2 3 
                                       f32_2 %509 = OpFAdd %505 %508 
                                       f32_4 %510 = OpLoad vs_TEXCOORD5 
                                       f32_4 %511 = OpVectorShuffle %510 %509 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %511 
                                 Output f32* %512 = OpAccessChain %121 %48 %117 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFNegate %513 
                                 Output f32* %515 = OpAccessChain %121 %48 %117 
                                                      OpStore %515 %514 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 261
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %21 %31 %122 %150 %245 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %11 DescriptorSet 11 
                                                      OpDecorate %11 Binding 11 
                                                      OpDecorate %15 DescriptorSet 15 
                                                      OpDecorate %15 Binding 15 
                                                      OpDecorate vs_TEXCOORD0 Location 21 
                                                      OpDecorate vs_TEXCOORD1 Location 31 
                                                      OpMemberDecorate %61 0 Offset 61 
                                                      OpMemberDecorate %61 1 Offset 61 
                                                      OpMemberDecorate %61 2 Offset 61 
                                                      OpMemberDecorate %61 3 Offset 61 
                                                      OpMemberDecorate %61 4 Offset 61 
                                                      OpMemberDecorate %61 5 Offset 61 
                                                      OpMemberDecorate %61 6 Offset 61 
                                                      OpMemberDecorate %61 7 Offset 61 
                                                      OpMemberDecorate %61 8 Offset 61 
                                                      OpMemberDecorate %61 9 Offset 61 
                                                      OpDecorate %61 Block 
                                                      OpDecorate %63 DescriptorSet 63 
                                                      OpDecorate %63 Binding 63 
                                                      OpDecorate vs_TEXCOORD5 Location 122 
                                                      OpDecorate %128 DescriptorSet 128 
                                                      OpDecorate %128 Binding 128 
                                                      OpDecorate %130 DescriptorSet 130 
                                                      OpDecorate %130 Binding 130 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %172 DescriptorSet 172 
                                                      OpDecorate %172 Binding 172 
                                                      OpDecorate %174 DescriptorSet 174 
                                                      OpDecorate %174 Binding 174 
                                                      OpDecorate %245 Location 245 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %10 = OpTypePointer UniformConstant %9 
         UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                              %13 = OpTypeSampler 
                                              %14 = OpTypePointer UniformConstant %13 
                     UniformConstant sampler* %15 = OpVariable UniformConstant 
                                              %17 = OpTypeSampledImage %9 
                                              %19 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Input %19 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %23 = OpTypeVector %6 4 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 3 
                                 Private f32* %28 = OpVariable Private 
                                              %30 = OpTypePointer Input %23 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Input %6 
                                          u32 %40 = OpConstant 2 
                                              %44 = OpTypeBool 
                                              %45 = OpTypePointer Private %44 
                                Private bool* %46 = OpVariable Private 
                                          f32 %48 = OpConstant 3.674022E-40 
                                              %51 = OpTypeInt 32 1 
                                          i32 %52 = OpConstant 0 
                                          i32 %53 = OpConstant 1 
                                          i32 %55 = OpConstant -1 
                                              %61 = OpTypeStruct %23 %6 %6 %23 %6 %6 %6 %23 %6 %6 
                                              %62 = OpTypePointer Uniform %61 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %63 = OpVariable Uniform 
                                          i32 %64 = OpConstant 8 
                                              %65 = OpTypePointer Uniform %6 
                                          i32 %68 = OpConstant 9 
                                          u32 %73 = OpConstant 1 
                                              %77 = OpTypePointer Private %19 
                               Private f32_2* %78 = OpVariable Private 
                                          f32 %80 = OpConstant 3.674022E-40 
                                          f32 %84 = OpConstant 3.674022E-40 
                                 Private f32* %90 = OpVariable Private 
                                         i32 %110 = OpConstant 5 
                                         i32 %113 = OpConstant 6 
                                             %117 = OpTypePointer Uniform %23 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                                             %126 = OpTypePointer Private %23 
                              Private f32_4* %127 = OpVariable Private 
        UniformConstant read_only Texture2D* %128 = OpVariable UniformConstant 
                    UniformConstant sampler* %130 = OpVariable UniformConstant 
                                         i32 %136 = OpConstant 7 
                                             %140 = OpTypeVector %6 3 
                                             %148 = OpTypePointer Private %140 
                              Private f32_3* %149 = OpVariable Private 
                                Input f32_4* %150 = OpVariable Input 
                                         i32 %153 = OpConstant 3 
                                         i32 %160 = OpConstant 2 
                              Private f32_4* %171 = OpVariable Private 
        UniformConstant read_only Texture2D* %172 = OpVariable UniformConstant 
                    UniformConstant sampler* %174 = OpVariable UniformConstant 
                                         i32 %205 = OpConstant 4 
                                         f32 %238 = OpConstant 3.674022E-40 
                                             %244 = OpTypePointer Output %23 
                               Output f32_4* %245 = OpVariable Output 
                               Private bool* %250 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %12 = OpLoad %11 
                                      sampler %16 = OpLoad %15 
                   read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                                        f32_2 %22 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                          f32 %27 = OpCompositeExtract %24 3 
                                                      OpStore %8 %27 
                                          f32 %29 = OpLoad %8 
                                   Input f32* %34 = OpAccessChain vs_TEXCOORD1 %32 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFNegate %35 
                                          f32 %37 = OpFAdd %29 %36 
                                                      OpStore %28 %37 
                                          f32 %38 = OpLoad %8 
                                          f32 %39 = OpFNegate %38 
                                   Input f32* %41 = OpAccessChain vs_TEXCOORD1 %40 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFAdd %39 %42 
                                                      OpStore %8 %43 
                                          f32 %47 = OpLoad %28 
                                         bool %49 = OpFOrdLessThan %47 %48 
                                                      OpStore %46 %49 
                                         bool %50 = OpLoad %46 
                                          i32 %54 = OpSelect %50 %53 %52 
                                          i32 %56 = OpIMul %54 %55 
                                         bool %57 = OpINotEqual %56 %52 
                                                      OpSelectionMerge %59 None 
                                                      OpBranchConditional %57 %58 %59 
                                              %58 = OpLabel 
                                                      OpKill
                                              %59 = OpLabel 
                                 Uniform f32* %66 = OpAccessChain %63 %64 
                                          f32 %67 = OpLoad %66 
                                 Uniform f32* %69 = OpAccessChain %63 %68 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFMul %67 %70 
                                                      OpStore %28 %71 
                                          f32 %72 = OpLoad %28 
                                   Input f32* %74 = OpAccessChain vs_TEXCOORD1 %73 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFMul %72 %75 
                                                      OpStore %28 %76 
                                          f32 %79 = OpLoad %28 
                                          f32 %81 = OpExtInst %1 37 %79 %80 
                                 Private f32* %82 = OpAccessChain %78 %32 
                                                      OpStore %82 %81 
                                          f32 %83 = OpLoad %28 
                                          f32 %85 = OpFMul %83 %84 
                                                      OpStore %28 %85 
                                 Private f32* %86 = OpAccessChain %78 %32 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpExtInst %1 31 %87 
                                 Private f32* %89 = OpAccessChain %78 %32 
                                                      OpStore %89 %88 
                                          f32 %91 = OpLoad %8 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD1 %73 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFMul %91 %93 
                                          f32 %95 = OpLoad %28 
                                          f32 %96 = OpFAdd %94 %95 
                                                      OpStore %90 %96 
                                          f32 %97 = OpLoad %90 
                                          f32 %98 = OpExtInst %1 43 %97 %48 %80 
                                                      OpStore %90 %98 
                                          f32 %99 = OpLoad %8 
                                  Input f32* %100 = OpAccessChain vs_TEXCOORD1 %73 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFMul %99 %101 
                                         f32 %103 = OpLoad %28 
                                         f32 %104 = OpFNegate %103 
                                         f32 %105 = OpFAdd %102 %104 
                                                      OpStore %8 %105 
                                Private f32* %106 = OpAccessChain %78 %32 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpLoad %90 
                                         f32 %109 = OpFMul %107 %108 
                                                      OpStore %28 %109 
                                Uniform f32* %111 = OpAccessChain %63 %110 
                                         f32 %112 = OpLoad %111 
                                Uniform f32* %114 = OpAccessChain %63 %113 
                                         f32 %115 = OpLoad %114 
                                       f32_2 %116 = OpCompositeConstruct %112 %115 
                              Uniform f32_4* %118 = OpAccessChain %63 %52 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 1 1 
                                       f32_2 %121 = OpFMul %116 %120 
                                       f32_4 %123 = OpLoad vs_TEXCOORD5 
                                       f32_2 %124 = OpVectorShuffle %123 %123 2 3 
                                       f32_2 %125 = OpFAdd %121 %124 
                                                      OpStore %78 %125 
                         read_only Texture2D %129 = OpLoad %128 
                                     sampler %131 = OpLoad %130 
                  read_only Texture2DSampled %132 = OpSampledImage %129 %131 
                                       f32_2 %133 = OpLoad %78 
                                       f32_4 %134 = OpImageSampleImplicitLod %132 %133 
                                                      OpStore %127 %134 
                                       f32_4 %135 = OpLoad %127 
                              Uniform f32_4* %137 = OpAccessChain %63 %136 
                                       f32_4 %138 = OpLoad %137 
                                       f32_4 %139 = OpFMul %135 %138 
                                                      OpStore %127 %139 
                                       f32_4 %141 = OpLoad %127 
                                       f32_3 %142 = OpVectorShuffle %141 %141 3 3 3 
                                       f32_4 %143 = OpLoad %127 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %127 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %127 %147 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %63 %153 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFMul %152 %156 
                                                      OpStore %149 %157 
                                Uniform f32* %158 = OpAccessChain %63 %53 
                                         f32 %159 = OpLoad %158 
                                Uniform f32* %161 = OpAccessChain %63 %160 
                                         f32 %162 = OpLoad %161 
                                       f32_2 %163 = OpCompositeConstruct %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %63 %52 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 1 1 
                                       f32_2 %167 = OpFMul %163 %166 
                                       f32_4 %168 = OpLoad vs_TEXCOORD5 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpFAdd %167 %169 
                                                      OpStore %78 %170 
                         read_only Texture2D %173 = OpLoad %172 
                                     sampler %175 = OpLoad %174 
                  read_only Texture2DSampled %176 = OpSampledImage %173 %175 
                                       f32_2 %177 = OpLoad %78 
                                       f32_4 %178 = OpImageSampleImplicitLod %176 %177 
                                                      OpStore %171 %178 
                                       f32_3 %179 = OpLoad %149 
                                       f32_4 %180 = OpLoad %171 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                                      OpStore %149 %182 
                                Private f32* %183 = OpAccessChain %171 %26 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %63 %153 %26 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFMul %184 %186 
                                Private f32* %188 = OpAccessChain %171 %26 
                                                      OpStore %188 %187 
                                       f32_3 %189 = OpLoad %149 
                                       f32_4 %190 = OpLoad %171 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %171 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
                                                      OpStore %171 %194 
                                       f32_4 %195 = OpLoad %127 
                                       f32_4 %196 = OpLoad %171 
                                       f32_4 %197 = OpFNegate %196 
                                       f32_4 %198 = OpFAdd %195 %197 
                                                      OpStore %127 %198 
                                         f32 %199 = OpLoad %28 
                                       f32_4 %200 = OpCompositeConstruct %199 %199 %199 %199 
                                       f32_4 %201 = OpLoad %127 
                                       f32_4 %202 = OpFMul %200 %201 
                                       f32_4 %203 = OpLoad %171 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %127 %204 
                                Uniform f32* %206 = OpAccessChain %63 %205 
                                         f32 %207 = OpLoad %206 
                                Uniform f32* %208 = OpAccessChain %63 %68 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %207 %209 
                                                      OpStore %28 %210 
                                         f32 %211 = OpLoad %28 
                                  Input f32* %212 = OpAccessChain vs_TEXCOORD1 %73 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                Private f32* %215 = OpAccessChain %78 %32 
                                                      OpStore %215 %214 
                                         f32 %216 = OpLoad %28 
                                  Input f32* %217 = OpAccessChain vs_TEXCOORD1 %73 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                         f32 %220 = OpFAdd %219 %80 
                                                      OpStore %28 %220 
                                Private f32* %221 = OpAccessChain %78 %32 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %222 %84 
                                         f32 %224 = OpLoad %8 
                                         f32 %225 = OpFAdd %223 %224 
                                                      OpStore %8 %225 
                                         f32 %226 = OpLoad %8 
                                         f32 %227 = OpLoad %28 
                                         f32 %228 = OpFDiv %226 %227 
                                                      OpStore %8 %228 
                                         f32 %229 = OpLoad %8 
                                         f32 %230 = OpExtInst %1 43 %229 %48 %80 
                                                      OpStore %8 %230 
                                         f32 %231 = OpLoad %8 
                                         f32 %232 = OpFNegate %231 
                                         f32 %233 = OpFAdd %232 %80 
                                                      OpStore %8 %233 
                                Private f32* %234 = OpAccessChain %127 %26 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpLoad %8 
                                         f32 %237 = OpFMul %235 %236 
                                         f32 %239 = OpFAdd %237 %238 
                                                      OpStore %28 %239 
                                         f32 %240 = OpLoad %8 
                                       f32_4 %241 = OpCompositeConstruct %240 %240 %240 %240 
                                       f32_4 %242 = OpLoad %127 
                                       f32_4 %243 = OpFMul %241 %242 
                                                      OpStore %127 %243 
                                       f32_4 %246 = OpLoad %127 
                                       f32_4 %247 = OpLoad %150 
                                       f32_4 %248 = OpVectorShuffle %247 %247 3 3 3 3 
                                       f32_4 %249 = OpFMul %246 %248 
                                                      OpStore %245 %249 
                                         f32 %251 = OpLoad %28 
                                        bool %252 = OpFOrdLessThan %251 %48 
                                                      OpStore %250 %252 
                                        bool %253 = OpLoad %250 
                                         i32 %254 = OpSelect %253 %53 %52 
                                         i32 %255 = OpIMul %254 %55 
                                        bool %256 = OpINotEqual %255 %52 
                                                      OpSelectionMerge %258 None 
                                                      OpBranchConditional %256 %257 %258 
                                             %257 = OpLabel 
                                                      OpKill
                                             %258 = OpLabel 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	vec4 _UnderlayColor;
uniform 	float _UnderlayOffsetX;
uniform 	float _UnderlayOffsetY;
uniform 	float _UnderlayDilate;
uniform 	float _UnderlaySoftness;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioC;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_COLOR1;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xyw = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyw;
    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
    u_xlat0.x = u_xlat1.x * u_xlat6.x + 1.0;
    u_xlat0.x = u_xlat6.x / u_xlat0.x;
    u_xlat4 = u_xlat8.x * u_xlat0.x + -0.5;
    u_xlat8.x = u_xlat0.x * u_xlat1.y;
    u_xlat1.xy = (-u_xlat1.zw) * vec2(_GradientScale);
    u_xlat1.xy = u_xlat1.xy / vec2(_TextureWidth, _TextureHeight);
    vs_TEXCOORD4.xy = u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat8.x) * 0.5 + u_xlat4;
    vs_COLOR1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
    vs_COLOR1.w = _UnderlayColor.w;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_COLOR1;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat0 = u_xlat0 * _OutlineColor;
    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat2.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat2 = texture(_FaceTex, u_xlat2.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.w = u_xlat2.w * _FaceColor.w;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.www;
    u_xlat0 = u_xlat0 + (-u_xlat2);
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD1.y;
    u_xlat5 = min(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9 = (-u_xlat3.w) + vs_TEXCOORD1.z;
    u_xlat13 = u_xlat9 * vs_TEXCOORD1.y + u_xlat1.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat1.x = u_xlat9 * vs_TEXCOORD1.y + (-u_xlat1.x);
    u_xlat5 = u_xlat5 * u_xlat13;
    u_xlat0 = vec4(u_xlat5) * u_xlat0 + u_xlat2;
    u_xlat5 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y + 1.0;
    u_xlat1.x = u_xlat9 * 0.5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = (-u_xlat0.w) * u_xlat1.x + 1.0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat4 = u_xlat1.w * vs_TEXCOORD4.z + (-vs_TEXCOORD4.w);
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat1 = vec4(u_xlat4) * vs_COLOR1;
    u_xlat0 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat1.x = u_xlat0.w + -0.00100000005;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    u_xlatb0 = u_xlat1.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 631
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %120 %124 %125 %128 %130 %182 %192 %235 %358 %457 %544 %561 %599 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpMemberDecorate %23 25 Offset 23 
                                                      OpMemberDecorate %23 26 Offset 23 
                                                      OpMemberDecorate %23 27 Offset 23 
                                                      OpMemberDecorate %23 28 Offset 23 
                                                      OpMemberDecorate %23 29 Offset 23 
                                                      OpMemberDecorate %23 30 Offset 23 
                                                      OpMemberDecorate %23 31 Offset 23 
                                                      OpMemberDecorate %23 32 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate vs_TEXCOORD0 Location 128 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate vs_TEXCOORD2 Location 182 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %235 Location 235 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 457 
                                                      OpDecorate vs_TEXCOORD4 Location 544 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate vs_TEXCOORD5 Location 599 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeArray %7 %17 
                                              %23 = OpTypeStruct %15 %7 %18 %19 %20 %21 %6 %6 %6 %22 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 19 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 20 
                               Private f32_4* %38 = OpVariable Private 
                                          i32 %41 = OpConstant 2 
                                          i32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Uniform %7 
                                          i32 %47 = OpConstant 0 
                               Private f32_4* %62 = OpVariable Private 
                                          i32 %64 = OpConstant 3 
                                              %82 = OpTypePointer Uniform %15 
                               Private f32_4* %88 = OpVariable Private 
                                          i32 %91 = OpConstant 5 
                                         u32 %116 = OpConstant 1 
                                             %117 = OpTypeArray %6 %116 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %122 = OpTypePointer Output %7 
                               Output f32_4* %124 = OpVariable Output 
                                Input f32_4* %125 = OpVariable Input 
                                             %127 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %129 = OpTypePointer Input %12 
                                Input f32_2* %130 = OpVariable Input 
                                             %132 = OpTypePointer Private %12 
                              Private f32_2* %133 = OpVariable Private 
                                         i32 %137 = OpConstant 4 
                                         i32 %153 = OpConstant 27 
                                         i32 %156 = OpConstant 28 
                                             %165 = OpTypePointer Private %6 
                                Private f32* %166 = OpVariable Private 
                                         i32 %170 = OpConstant 22 
                                         i32 %173 = OpConstant 23 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_2 %178 = OpConstantComposite %177 %177 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %189 = OpConstant 0 
                                Private f32* %191 = OpVariable Private 
                                Input f32_2* %192 = OpVariable Input 
                                             %193 = OpTypePointer Input %6 
                                         i32 %197 = OpConstant 26 
                                         i32 %201 = OpConstant 30 
                                         f32 %204 = OpConstant 3.674022E-40 
                                         i32 %213 = OpConstant 29 
                                             %234 = OpTypePointer Input %15 
                                Input f32_3* %235 = OpVariable Input 
                                         u32 %253 = OpConstant 2 
                                             %262 = OpTypePointer Private %15 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 15 
                                         i32 %326 = OpConstant 16 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 17 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 21 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %456 = OpTypePointer Output %15 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %467 = OpConstant 14 
                                         i32 %470 = OpConstant 13 
                                         i32 %473 = OpConstant 11 
                                         i32 %476 = OpConstant 12 
                                         i32 %480 = OpConstant 18 
                                Private f32* %509 = OpVariable Private 
                                         f32 %515 = OpConstant 3.674022E-40 
                                         i32 %534 = OpConstant 24 
                                         i32 %537 = OpConstant 25 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                               Output f32_4* %561 = OpVariable Output 
                                         i32 %562 = OpConstant 10 
                                         f32 %577 = OpConstant 3.674022E-40 
                                         f32 %587 = OpConstant 3.674022E-40 
                                         f32 %594 = OpConstant 3.674022E-40 
                                       f32_2 %595 = OpConstantComposite %594 %594 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %602 = OpConstant 31 
                                         i32 %615 = OpConstant 32 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %14 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                                      OpStore %9 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 1 1 1 1 
                               Uniform f32_4* %44 = OpAccessChain %25 %41 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_4 %46 = OpFMul %40 %45 
                                                      OpStore %38 %46 
                               Uniform f32_4* %48 = OpAccessChain %25 %41 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %38 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %38 %54 
                               Uniform f32_4* %55 = OpAccessChain %25 %41 %41 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %11 
                                        f32_4 %58 = OpVectorShuffle %57 %57 2 2 2 2 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %38 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %38 %61 
                                        f32_4 %63 = OpLoad %38 
                               Uniform f32_4* %65 = OpAccessChain %25 %41 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %62 %67 
                               Uniform f32_4* %68 = OpAccessChain %25 %41 %64 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_4 %71 = OpLoad %11 
                                        f32_3 %72 = OpVectorShuffle %71 %71 3 3 3 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %38 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %38 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %38 %78 
                                        f32_4 %79 = OpLoad %38 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpFNegate %80 
                               Uniform f32_3* %83 = OpAccessChain %25 %47 
                                        f32_3 %84 = OpLoad %83 
                                        f32_3 %85 = OpFAdd %81 %84 
                                        f32_4 %86 = OpLoad %38 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %38 %87 
                                        f32_4 %89 = OpLoad %62 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %25 %91 %42 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %90 %93 
                                                      OpStore %88 %94 
                               Uniform f32_4* %95 = OpAccessChain %25 %91 %47 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %62 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %88 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %88 %101 
                              Uniform f32_4* %102 = OpAccessChain %25 %91 %41 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %62 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %88 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %88 %108 
                              Uniform f32_4* %109 = OpAccessChain %25 %91 %64 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpVectorShuffle %111 %111 3 3 3 3 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %62 %115 
                                       f32_4 %121 = OpLoad %62 
                               Output f32_4* %123 = OpAccessChain %120 %47 
                                                      OpStore %123 %121 
                                       f32_4 %126 = OpLoad %125 
                                                      OpStore %124 %126 
                                       f32_2 %131 = OpLoad %130 
                                                      OpStore vs_TEXCOORD0 %131 
                              Uniform f32_4* %134 = OpAccessChain %25 %42 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %25 %137 %42 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %137 %47 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                              Uniform f32_4* %145 = OpAccessChain %25 %42 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 0 
                                       f32_2 %148 = OpFMul %144 %147 
                                       f32_2 %149 = OpLoad %133 
                                       f32_2 %150 = OpFAdd %148 %149 
                                                      OpStore %133 %150 
                                       f32_2 %151 = OpLoad %133 
                                       f32_2 %152 = OpExtInst %1 4 %151 
                                Uniform f32* %154 = OpAccessChain %25 %153 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %25 %156 
                                         f32 %158 = OpLoad %157 
                                       f32_2 %159 = OpCompositeConstruct %155 %158 
                                       f32_2 %160 = OpFMul %152 %159 
                                                      OpStore %133 %160 
                                       f32_4 %161 = OpLoad %62 
                                       f32_2 %162 = OpVectorShuffle %161 %161 3 3 
                                       f32_2 %163 = OpLoad %133 
                                       f32_2 %164 = OpFDiv %162 %163 
                                                      OpStore %133 %164 
                                       f32_2 %167 = OpLoad %133 
                                       f32_2 %168 = OpLoad %133 
                                         f32 %169 = OpDot %167 %168 
                                                      OpStore %166 %169 
                                Uniform f32* %171 = OpAccessChain %25 %170 
                                         f32 %172 = OpLoad %171 
                                Uniform f32* %174 = OpAccessChain %25 %173 
                                         f32 %175 = OpLoad %174 
                                       f32_2 %176 = OpCompositeConstruct %172 %175 
                                       f32_2 %179 = OpFMul %176 %178 
                                       f32_2 %180 = OpLoad %133 
                                       f32_2 %181 = OpFAdd %179 %180 
                                                      OpStore %133 %181 
                                       f32_2 %183 = OpLoad %133 
                                       f32_2 %184 = OpFDiv %178 %183 
                                       f32_4 %185 = OpLoad vs_TEXCOORD2 
                                       f32_4 %186 = OpVectorShuffle %185 %184 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %186 
                                         f32 %187 = OpLoad %166 
                                         f32 %188 = OpExtInst %1 32 %187 
                                Private f32* %190 = OpAccessChain %133 %189 
                                                      OpStore %190 %188 
                                  Input f32* %194 = OpAccessChain %192 %116 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpExtInst %1 4 %195 
                                Uniform f32* %198 = OpAccessChain %25 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %196 %199 
                                                      OpStore %191 %200 
                                Uniform f32* %202 = OpAccessChain %25 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %166 %205 
                                         f32 %206 = OpLoad %191 
                                         f32 %207 = OpLoad %166 
                                         f32 %208 = OpFMul %206 %207 
                                                      OpStore %191 %208 
                                         f32 %209 = OpLoad %191 
                                Private f32* %210 = OpAccessChain %133 %189 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFMul %209 %211 
                                                      OpStore %166 %212 
                                Uniform f32* %214 = OpAccessChain %25 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %216 %204 
                                Private f32* %218 = OpAccessChain %62 %189 
                                                      OpStore %218 %217 
                                         f32 %219 = OpLoad %166 
                                         f32 %220 = OpExtInst %1 4 %219 
                                Private f32* %221 = OpAccessChain %62 %189 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %220 %222 
                                Private f32* %224 = OpAccessChain %62 %189 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %133 %189 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpLoad %191 
                                         f32 %228 = OpFMul %226 %227 
                                Private f32* %229 = OpAccessChain %62 %189 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFNegate %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %133 %189 
                                                      OpStore %233 %232 
                                       f32_3 %236 = OpLoad %235 
                              Uniform f32_4* %237 = OpAccessChain %25 %64 %47 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                         f32 %240 = OpDot %236 %239 
                                Private f32* %241 = OpAccessChain %88 %189 
                                                      OpStore %241 %240 
                                       f32_3 %242 = OpLoad %235 
                              Uniform f32_4* %243 = OpAccessChain %25 %64 %42 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                         f32 %246 = OpDot %242 %245 
                                Private f32* %247 = OpAccessChain %88 %116 
                                                      OpStore %247 %246 
                                       f32_3 %248 = OpLoad %235 
                              Uniform f32_4* %249 = OpAccessChain %25 %64 %41 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                         f32 %252 = OpDot %248 %251 
                                Private f32* %254 = OpAccessChain %88 %253 
                                                      OpStore %254 %252 
                                       f32_4 %255 = OpLoad %88 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_4 %257 = OpLoad %88 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                         f32 %259 = OpDot %256 %258 
                                                      OpStore %191 %259 
                                         f32 %260 = OpLoad %191 
                                         f32 %261 = OpExtInst %1 32 %260 
                                                      OpStore %191 %261 
                                         f32 %264 = OpLoad %191 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %88 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %38 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %38 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %191 %273 
                                         f32 %274 = OpLoad %191 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %191 %275 
                                         f32 %276 = OpLoad %191 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %38 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %88 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %88 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %88 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %191 %286 
                                         f32 %287 = OpLoad %191 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %133 %189 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %62 %189 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %133 %189 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %137 %64 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %133 %189 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %166 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %189 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %192 %116 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %204 %302 
                                Private f32* %321 = OpAccessChain %133 %189 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %191 %329 
                                Private f32* %330 = OpAccessChain %133 %189 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %191 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %133 %189 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %133 %189 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %177 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %133 %189 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %133 %189 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %133 %189 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %133 %189 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %253 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %189 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %191 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %204 
                                                      OpStore %166 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %166 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %166 %382 
                                         f32 %383 = OpLoad %166 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %191 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %166 %387 
                                Private f32* %388 = OpAccessChain %133 %189 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %166 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %189 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %133 %189 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %133 %189 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %191 
                                Private f32* %403 = OpAccessChain %133 %189 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %253 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %88 %412 
                                       f32_4 %413 = OpLoad %88 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %88 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %88 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_4 %426 = OpLoad %9 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 2 3 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %88 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %38 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %42 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                       f32_4 %443 = OpLoad %9 
                                       f32_4 %444 = OpVectorShuffle %443 %442 4 5 2 6 
                                                      OpStore %9 %444 
                              Uniform f32_4* %445 = OpAccessChain %25 %438 %47 
                                       f32_4 %446 = OpLoad %445 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                       f32_4 %448 = OpLoad %38 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
                                       f32_3 %450 = OpFMul %447 %449 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 3 
                                       f32_3 %453 = OpFAdd %450 %452 
                                       f32_4 %454 = OpLoad %9 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 2 6 
                                                      OpStore %9 %455 
                              Uniform f32_4* %458 = OpAccessChain %25 %438 %41 
                                       f32_4 %459 = OpLoad %458 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_4 %461 = OpLoad %38 
                                       f32_3 %462 = OpVectorShuffle %461 %461 2 2 2 
                                       f32_3 %463 = OpFMul %460 %462 
                                       f32_4 %464 = OpLoad %9 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 3 
                                       f32_3 %466 = OpFAdd %463 %465 
                                                      OpStore vs_TEXCOORD3 %466 
                                Uniform f32* %468 = OpAccessChain %25 %467 
                                         f32 %469 = OpLoad %468 
                                Uniform f32* %471 = OpAccessChain %25 %470 
                                         f32 %472 = OpLoad %471 
                                Uniform f32* %474 = OpAccessChain %25 %473 
                                         f32 %475 = OpLoad %474 
                                Uniform f32* %477 = OpAccessChain %25 %476 
                                         f32 %478 = OpLoad %477 
                                       f32_4 %479 = OpCompositeConstruct %469 %472 %475 %478 
                                Uniform f32* %481 = OpAccessChain %25 %480 
                                         f32 %482 = OpLoad %481 
                                Uniform f32* %483 = OpAccessChain %25 %480 
                                         f32 %484 = OpLoad %483 
                                Uniform f32* %485 = OpAccessChain %25 %480 
                                         f32 %486 = OpLoad %485 
                                Uniform f32* %487 = OpAccessChain %25 %480 
                                         f32 %488 = OpLoad %487 
                                       f32_4 %489 = OpCompositeConstruct %482 %484 %486 %488 
                                         f32 %490 = OpCompositeExtract %489 0 
                                         f32 %491 = OpCompositeExtract %489 1 
                                         f32 %492 = OpCompositeExtract %489 2 
                                         f32 %493 = OpCompositeExtract %489 3 
                                       f32_4 %494 = OpCompositeConstruct %490 %491 %492 %493 
                                       f32_4 %495 = OpFMul %479 %494 
                                                      OpStore %38 %495 
                                Private f32* %496 = OpAccessChain %38 %189 
                                         f32 %497 = OpLoad %496 
                                Private f32* %498 = OpAccessChain %263 %189 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %497 %499 
                                         f32 %501 = OpFAdd %500 %204 
                                Private f32* %502 = OpAccessChain %9 %189 
                                                      OpStore %502 %501 
                                Private f32* %503 = OpAccessChain %263 %189 
                                         f32 %504 = OpLoad %503 
                                Private f32* %505 = OpAccessChain %9 %189 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFDiv %504 %506 
                                Private f32* %508 = OpAccessChain %9 %189 
                                                      OpStore %508 %507 
                                Private f32* %510 = OpAccessChain %133 %189 
                                         f32 %511 = OpLoad %510 
                                Private f32* %512 = OpAccessChain %9 %189 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                         f32 %516 = OpFAdd %514 %515 
                                                      OpStore %509 %516 
                                Private f32* %517 = OpAccessChain %9 %189 
                                         f32 %518 = OpLoad %517 
                                Private f32* %519 = OpAccessChain %38 %116 
                                         f32 %520 = OpLoad %519 
                                         f32 %521 = OpFMul %518 %520 
                                Private f32* %522 = OpAccessChain %133 %189 
                                                      OpStore %522 %521 
                                       f32_4 %523 = OpLoad %38 
                                       f32_2 %524 = OpVectorShuffle %523 %523 2 3 
                                       f32_2 %525 = OpFNegate %524 
                                Uniform f32* %526 = OpAccessChain %25 %197 
                                         f32 %527 = OpLoad %526 
                                       f32_2 %528 = OpCompositeConstruct %527 %527 
                                       f32_2 %529 = OpFMul %525 %528 
                                       f32_4 %530 = OpLoad %38 
                                       f32_4 %531 = OpVectorShuffle %530 %529 4 5 2 3 
                                                      OpStore %38 %531 
                                       f32_4 %532 = OpLoad %38 
                                       f32_2 %533 = OpVectorShuffle %532 %532 0 1 
                                Uniform f32* %535 = OpAccessChain %25 %534 
                                         f32 %536 = OpLoad %535 
                                Uniform f32* %538 = OpAccessChain %25 %537 
                                         f32 %539 = OpLoad %538 
                                       f32_2 %540 = OpCompositeConstruct %536 %539 
                                       f32_2 %541 = OpFDiv %533 %540 
                                       f32_4 %542 = OpLoad %38 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 2 3 
                                                      OpStore %38 %543 
                                       f32_4 %545 = OpLoad %38 
                                       f32_2 %546 = OpVectorShuffle %545 %545 0 1 
                                       f32_2 %547 = OpLoad %130 
                                       f32_2 %548 = OpFAdd %546 %547 
                                       f32_4 %549 = OpLoad vs_TEXCOORD4 
                                       f32_4 %550 = OpVectorShuffle %549 %548 4 5 2 3 
                                                      OpStore vs_TEXCOORD4 %550 
                                Private f32* %551 = OpAccessChain %9 %189 
                                         f32 %552 = OpLoad %551 
                                 Output f32* %553 = OpAccessChain vs_TEXCOORD4 %253 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %133 %189 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpFNegate %555 
                                         f32 %557 = OpFMul %556 %355 
                                         f32 %558 = OpLoad %509 
                                         f32 %559 = OpFAdd %557 %558 
                                 Output f32* %560 = OpAccessChain vs_TEXCOORD4 %299 
                                                      OpStore %560 %559 
                              Uniform f32_4* %563 = OpAccessChain %25 %562 
                                       f32_4 %564 = OpLoad %563 
                                       f32_3 %565 = OpVectorShuffle %564 %564 3 3 3 
                              Uniform f32_4* %566 = OpAccessChain %25 %562 
                                       f32_4 %567 = OpLoad %566 
                                       f32_3 %568 = OpVectorShuffle %567 %567 0 1 2 
                                       f32_3 %569 = OpFMul %565 %568 
                                       f32_4 %570 = OpLoad %561 
                                       f32_4 %571 = OpVectorShuffle %570 %569 4 5 6 3 
                                                      OpStore %561 %571 
                                Uniform f32* %572 = OpAccessChain %25 %562 %299 
                                         f32 %573 = OpLoad %572 
                                 Output f32* %574 = OpAccessChain %561 %299 
                                                      OpStore %574 %573 
                                  Input f32* %575 = OpAccessChain %192 %189 
                                         f32 %576 = OpLoad %575 
                                         f32 %578 = OpFMul %576 %577 
                                Private f32* %579 = OpAccessChain %9 %189 
                                                      OpStore %579 %578 
                                Private f32* %580 = OpAccessChain %9 %189 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 8 %581 
                                Private f32* %583 = OpAccessChain %133 %189 
                                                      OpStore %583 %582 
                                Private f32* %584 = OpAccessChain %133 %189 
                                         f32 %585 = OpLoad %584 
                                         f32 %586 = OpFNegate %585 
                                         f32 %588 = OpFMul %586 %587 
                                  Input f32* %589 = OpAccessChain %192 %189 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFAdd %588 %590 
                                Private f32* %592 = OpAccessChain %133 %116 
                                                      OpStore %592 %591 
                                       f32_2 %593 = OpLoad %133 
                                       f32_2 %596 = OpFMul %593 %595 
                                       f32_4 %597 = OpLoad %9 
                                       f32_4 %598 = OpVectorShuffle %597 %596 4 5 2 3 
                                                      OpStore %9 %598 
                                       f32_4 %600 = OpLoad %9 
                                       f32_2 %601 = OpVectorShuffle %600 %600 0 1 
                              Uniform f32_4* %603 = OpAccessChain %25 %602 
                                       f32_4 %604 = OpLoad %603 
                                       f32_2 %605 = OpVectorShuffle %604 %604 0 1 
                                       f32_2 %606 = OpFMul %601 %605 
                              Uniform f32_4* %607 = OpAccessChain %25 %602 
                                       f32_4 %608 = OpLoad %607 
                                       f32_2 %609 = OpVectorShuffle %608 %608 2 3 
                                       f32_2 %610 = OpFAdd %606 %609 
                                       f32_4 %611 = OpLoad vs_TEXCOORD5 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %612 
                                       f32_4 %613 = OpLoad %9 
                                       f32_2 %614 = OpVectorShuffle %613 %613 0 1 
                              Uniform f32_4* %616 = OpAccessChain %25 %615 
                                       f32_4 %617 = OpLoad %616 
                                       f32_2 %618 = OpVectorShuffle %617 %617 0 1 
                                       f32_2 %619 = OpFMul %614 %618 
                              Uniform f32_4* %620 = OpAccessChain %25 %615 
                                       f32_4 %621 = OpLoad %620 
                                       f32_2 %622 = OpVectorShuffle %621 %621 2 3 
                                       f32_2 %623 = OpFAdd %619 %622 
                                       f32_4 %624 = OpLoad vs_TEXCOORD5 
                                       f32_4 %625 = OpVectorShuffle %624 %623 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %625 
                                 Output f32* %626 = OpAccessChain %120 %47 %116 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFNegate %627 
                                 Output f32* %629 = OpAccessChain %120 %47 %116 
                                                      OpStore %629 %628 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 304
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %30 %63 %136 %162 %252 %269 %284 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD5 Location 30 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %90 DescriptorSet 90 
                                                      OpDecorate %90 Binding 90 
                                                      OpDecorate %92 DescriptorSet 92 
                                                      OpDecorate %92 Binding 92 
                                                      OpDecorate vs_TEXCOORD1 Location 136 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %158 DescriptorSet 158 
                                                      OpDecorate %158 Binding 158 
                                                      OpDecorate vs_TEXCOORD0 Location 162 
                                                      OpDecorate vs_TEXCOORD4 Location 252 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate %284 Location 284 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 5 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 6 
                                              %21 = OpTypeVector %6 2 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %7 
                                              %29 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %37 = OpTypePointer UniformConstant %36 
         UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampler 
                                              %41 = OpTypePointer UniformConstant %40 
                     UniformConstant sampler* %42 = OpVariable UniformConstant 
                                              %44 = OpTypeSampledImage %36 
                                          i32 %50 = OpConstant 7 
                                              %54 = OpTypeVector %6 3 
                               Private f32_4* %62 = OpVariable Private 
                                 Input f32_4* %63 = OpVariable Input 
                                          i32 %66 = OpConstant 3 
                               Private f32_4* %73 = OpVariable Private 
                                          i32 %74 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
         UniformConstant read_only Texture2D* %90 = OpVariable UniformConstant 
                     UniformConstant sampler* %92 = OpVariable UniformConstant 
                                             %105 = OpTypeInt 32 0 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Private %6 
                                         i32 %125 = OpConstant 8 
                                         i32 %128 = OpConstant 9 
                                         u32 %132 = OpConstant 0 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %137 = OpConstant 1 
                                             %138 = OpTypePointer Input %6 
                                Private f32* %143 = OpVariable Private 
                                         f32 %146 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                Private f32* %155 = OpVariable Private 
        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
                    UniformConstant sampler* %158 = OpVariable UniformConstant 
                                             %161 = OpTypePointer Input %21 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         u32 %168 = OpConstant 2 
                                Private f32* %172 = OpVariable Private 
                                         f32 %181 = OpConstant 3.674022E-40 
                                         i32 %201 = OpConstant 4 
                                Private f32* %248 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                Input f32_4* %269 = OpVariable Input 
                                         f32 %280 = OpConstant 3.674022E-40 
                                             %283 = OpTypePointer Output %7 
                               Output f32_4* %284 = OpVariable Output 
                                             %289 = OpTypeBool 
                                             %290 = OpTypePointer Private %289 
                               Private bool* %291 = OpVariable Private 
                                         i32 %297 = OpConstant -1 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                        f32_2 %22 = OpCompositeConstruct %17 %20 
                               Uniform f32_4* %25 = OpAccessChain %12 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %22 %27 
                                        f32_4 %31 = OpLoad vs_TEXCOORD5 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %28 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %9 %35 
                          read_only Texture2D %39 = OpLoad %38 
                                      sampler %43 = OpLoad %42 
                   read_only Texture2DSampled %45 = OpSampledImage %39 %43 
                                        f32_4 %46 = OpLoad %9 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                        f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                                      OpStore %9 %48 
                                        f32_4 %49 = OpLoad %9 
                               Uniform f32_4* %51 = OpAccessChain %12 %50 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %49 %52 
                                                      OpStore %9 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_4 %57 = OpLoad %9 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %9 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %12 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFMul %65 %69 
                                        f32_4 %71 = OpLoad %62 
                                        f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                                      OpStore %62 %72 
                                 Uniform f32* %75 = OpAccessChain %12 %74 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %12 %77 
                                          f32 %79 = OpLoad %78 
                                        f32_2 %80 = OpCompositeConstruct %76 %79 
                               Uniform f32_4* %81 = OpAccessChain %12 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 1 1 
                                        f32_2 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad vs_TEXCOORD5 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_2 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %73 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                                      OpStore %73 %89 
                          read_only Texture2D %91 = OpLoad %90 
                                      sampler %93 = OpLoad %92 
                   read_only Texture2DSampled %94 = OpSampledImage %91 %93 
                                        f32_4 %95 = OpLoad %73 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                                      OpStore %73 %97 
                                        f32_4 %98 = OpLoad %62 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_4 %100 = OpLoad %73 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %62 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %62 %104 
                                Private f32* %108 = OpAccessChain %73 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %110 = OpAccessChain %12 %66 %106 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFMul %109 %111 
                                Private f32* %113 = OpAccessChain %73 %106 
                                                      OpStore %113 %112 
                                       f32_4 %114 = OpLoad %62 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_4 %116 = OpLoad %73 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %73 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %73 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpLoad %73 
                                       f32_4 %123 = OpFNegate %122 
                                       f32_4 %124 = OpFAdd %121 %123 
                                                      OpStore %9 %124 
                                Uniform f32* %126 = OpAccessChain %12 %125 
                                         f32 %127 = OpLoad %126 
                                Uniform f32* %129 = OpAccessChain %12 %128 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %127 %130 
                                Private f32* %133 = OpAccessChain %62 %132 
                                                      OpStore %133 %131 
                                Private f32* %134 = OpAccessChain %62 %132 
                                         f32 %135 = OpLoad %134 
                                  Input f32* %139 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFMul %135 %140 
                                Private f32* %142 = OpAccessChain %62 %132 
                                                      OpStore %142 %141 
                                Private f32* %144 = OpAccessChain %62 %132 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 37 %145 %146 
                                                      OpStore %143 %147 
                                Private f32* %148 = OpAccessChain %62 %132 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                Private f32* %152 = OpAccessChain %62 %132 
                                                      OpStore %152 %151 
                                         f32 %153 = OpLoad %143 
                                         f32 %154 = OpExtInst %1 31 %153 
                                                      OpStore %143 %154 
                         read_only Texture2D %157 = OpLoad %156 
                                     sampler %159 = OpLoad %158 
                  read_only Texture2DSampled %160 = OpSampledImage %157 %159 
                                       f32_2 %163 = OpLoad vs_TEXCOORD0 
                                       f32_4 %164 = OpImageSampleImplicitLod %160 %163 
                                         f32 %165 = OpCompositeExtract %164 3 
                                                      OpStore %155 %165 
                                         f32 %166 = OpLoad %155 
                                         f32 %167 = OpFNegate %166 
                                  Input f32* %169 = OpAccessChain vs_TEXCOORD1 %168 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFAdd %167 %170 
                                                      OpStore %155 %171 
                                         f32 %173 = OpLoad %155 
                                  Input f32* %174 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %173 %175 
                                Private f32* %177 = OpAccessChain %62 %132 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                                      OpStore %172 %179 
                                         f32 %180 = OpLoad %172 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %146 
                                                      OpStore %172 %182 
                                         f32 %183 = OpLoad %155 
                                  Input f32* %184 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                Private f32* %187 = OpAccessChain %62 %132 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                         f32 %190 = OpFAdd %186 %189 
                                Private f32* %191 = OpAccessChain %62 %132 
                                                      OpStore %191 %190 
                                         f32 %192 = OpLoad %143 
                                         f32 %193 = OpLoad %172 
                                         f32 %194 = OpFMul %192 %193 
                                                      OpStore %143 %194 
                                         f32 %195 = OpLoad %143 
                                       f32_4 %196 = OpCompositeConstruct %195 %195 %195 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFMul %196 %197 
                                       f32_4 %199 = OpLoad %73 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %9 %200 
                                Uniform f32* %202 = OpAccessChain %12 %201 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %12 %128 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                                      OpStore %143 %206 
                                         f32 %207 = OpLoad %143 
                                  Input f32* %208 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %207 %209 
                                                      OpStore %155 %210 
                                         f32 %211 = OpLoad %143 
                                  Input f32* %212 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                         f32 %215 = OpFAdd %214 %146 
                                                      OpStore %143 %215 
                                         f32 %216 = OpLoad %155 
                                         f32 %217 = OpFMul %216 %150 
                                Private f32* %218 = OpAccessChain %62 %132 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFAdd %217 %219 
                                Private f32* %221 = OpAccessChain %62 %132 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %62 %132 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpLoad %143 
                                         f32 %225 = OpFDiv %223 %224 
                                Private f32* %226 = OpAccessChain %62 %132 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %62 %132 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpExtInst %1 43 %228 %181 %146 
                                Private f32* %230 = OpAccessChain %62 %132 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %62 %132 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                         f32 %234 = OpFAdd %233 %146 
                                Private f32* %235 = OpAccessChain %62 %132 
                                                      OpStore %235 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %62 
                                       f32_4 %238 = OpVectorShuffle %237 %237 0 0 0 0 
                                       f32_4 %239 = OpFMul %236 %238 
                                                      OpStore %73 %239 
                                Private f32* %240 = OpAccessChain %9 %106 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFNegate %241 
                                Private f32* %243 = OpAccessChain %62 %132 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                         f32 %246 = OpFAdd %245 %146 
                                Private f32* %247 = OpAccessChain %9 %132 
                                                      OpStore %247 %246 
                         read_only Texture2D %249 = OpLoad %156 
                                     sampler %250 = OpLoad %158 
                  read_only Texture2DSampled %251 = OpSampledImage %249 %250 
                                       f32_4 %253 = OpLoad vs_TEXCOORD4 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_4 %255 = OpImageSampleImplicitLod %251 %254 
                                         f32 %256 = OpCompositeExtract %255 3 
                                                      OpStore %248 %256 
                                         f32 %257 = OpLoad %248 
                                  Input f32* %258 = OpAccessChain vs_TEXCOORD4 %168 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                  Input f32* %261 = OpAccessChain vs_TEXCOORD4 %106 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                         f32 %264 = OpFAdd %260 %263 
                                                      OpStore %248 %264 
                                         f32 %265 = OpLoad %248 
                                         f32 %266 = OpExtInst %1 43 %265 %181 %146 
                                                      OpStore %248 %266 
                                         f32 %267 = OpLoad %248 
                                       f32_4 %268 = OpCompositeConstruct %267 %267 %267 %267 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpFMul %268 %270 
                                                      OpStore %62 %271 
                                       f32_4 %272 = OpLoad %62 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %273 0 0 0 0 
                                       f32_4 %275 = OpFMul %272 %274 
                                       f32_4 %276 = OpLoad %73 
                                       f32_4 %277 = OpFAdd %275 %276 
                                                      OpStore %9 %277 
                                Private f32* %278 = OpAccessChain %9 %106 
                                         f32 %279 = OpLoad %278 
                                         f32 %281 = OpFAdd %279 %280 
                                Private f32* %282 = OpAccessChain %62 %132 
                                                      OpStore %282 %281 
                                       f32_4 %285 = OpLoad %9 
                                       f32_4 %286 = OpLoad %63 
                                       f32_4 %287 = OpVectorShuffle %286 %286 3 3 3 3 
                                       f32_4 %288 = OpFMul %285 %287 
                                                      OpStore %284 %288 
                                Private f32* %292 = OpAccessChain %62 %132 
                                         f32 %293 = OpLoad %292 
                                        bool %294 = OpFOrdLessThan %293 %181 
                                                      OpStore %291 %294 
                                        bool %295 = OpLoad %291 
                                         i32 %296 = OpSelect %295 %74 %23 
                                         i32 %298 = OpIMul %296 %297 
                                        bool %299 = OpINotEqual %298 %23 
                                                      OpSelectionMerge %301 None 
                                                      OpBranchConditional %299 %300 %301 
                                             %300 = OpLabel 
                                                      OpKill
                                             %301 = OpLabel 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-vs_TEXCOORD1.x);
    u_xlat4 = (-u_xlat0.w) + vs_TEXCOORD1.z;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat8.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
    u_xlat4 = u_xlat8.x * u_xlat12;
    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat1 = texture(_OutlineTex, u_xlat8.xy);
    u_xlat1 = u_xlat1 * _OutlineColor;
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat3 = texture(_FaceTex, u_xlat8.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.w = u_xlat3.w * _FaceColor.w;
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 517
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %183 %193 %236 %358 %452 %485 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate vs_TEXCOORD0 Location 129 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate vs_TEXCOORD2 Location 183 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 452 
                                                      OpDecorate vs_TEXCOORD5 Location 485 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_4* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %10 %17 
                                              %19 = OpTypeArray %10 %17 
                                              %20 = OpTypeArray %10 %17 
                                              %21 = OpTypeArray %10 %17 
                                              %22 = OpTypeArray %10 %17 
                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %6 %10 %10 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 13 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 14 
                                              %38 = OpTypePointer Private %10 
                               Private f32_4* %39 = OpVariable Private 
                                          i32 %42 = OpConstant 2 
                                          i32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Uniform %10 
                                          i32 %48 = OpConstant 0 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %65 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                               Private f32_4* %89 = OpVariable Private 
                                          i32 %92 = OpConstant 5 
                                         u32 %117 = OpConstant 1 
                                             %118 = OpTypeArray %6 %117 
                                             %119 = OpTypeStruct %10 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %123 = OpTypePointer Output %10 
                               Output f32_4* %125 = OpVariable Output 
                                Input f32_4* %126 = OpVariable Input 
                                             %128 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %130 = OpTypePointer Input %13 
                                Input f32_2* %131 = OpVariable Input 
                                             %133 = OpTypePointer Private %13 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %138 = OpConstant 4 
                                         i32 %154 = OpConstant 19 
                                         i32 %157 = OpConstant 20 
                                             %166 = OpTypePointer Private %6 
                                Private f32* %167 = OpVariable Private 
                                         i32 %171 = OpConstant 16 
                                         i32 %174 = OpConstant 17 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %190 = OpConstant 0 
                                Private f32* %192 = OpVariable Private 
                                Input f32_2* %193 = OpVariable Input 
                                             %194 = OpTypePointer Input %6 
                                         i32 %198 = OpConstant 18 
                                         i32 %202 = OpConstant 22 
                                         f32 %205 = OpConstant 3.674022E-40 
                                         i32 %214 = OpConstant 21 
                                             %235 = OpTypePointer Input %7 
                                Input f32_3* %236 = OpVariable Input 
                                         u32 %254 = OpConstant 2 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 10 
                                         i32 %326 = OpConstant 11 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 12 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 15 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %451 = OpTypePointer Output %7 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         f32 %463 = OpConstant 3.674022E-40 
                                         f32 %473 = OpConstant 3.674022E-40 
                                         f32 %480 = OpConstant 3.674022E-40 
                                       f32_2 %481 = OpConstantComposite %480 %480 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %488 = OpConstant 23 
                                         i32 %501 = OpConstant 24 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %15 %34 
                                        f32_3 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
                                                      OpStore %9 %37 
                                        f32_3 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFMul %41 %46 
                                                      OpStore %39 %47 
                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %39 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore %39 %55 
                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %12 
                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %39 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %39 %62 
                                        f32_4 %64 = OpLoad %39 
                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFAdd %64 %67 
                                                      OpStore %63 %68 
                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_4 %72 = OpLoad %12 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %39 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %39 %79 
                                        f32_4 %80 = OpLoad %39 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpFNegate %81 
                               Uniform f32_3* %84 = OpAccessChain %25 %48 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpFAdd %82 %85 
                                        f32_4 %87 = OpLoad %39 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %39 %88 
                                        f32_4 %90 = OpLoad %63 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpFMul %91 %94 
                                                      OpStore %89 %95 
                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %63 
                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %89 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %89 %102 
                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %63 
                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %89 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %89 %109 
                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %63 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %89 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %63 %116 
                                       f32_4 %122 = OpLoad %63 
                               Output f32_4* %124 = OpAccessChain %121 %48 
                                                      OpStore %124 %122 
                                       f32_4 %127 = OpLoad %126 
                                                      OpStore %125 %127 
                                       f32_2 %132 = OpLoad %131 
                                                      OpStore vs_TEXCOORD0 %132 
                              Uniform f32_4* %135 = OpAccessChain %25 %43 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 1 1 
                              Uniform f32_4* %139 = OpAccessChain %25 %138 %43 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                                                      OpStore %134 %142 
                              Uniform f32_4* %143 = OpAccessChain %25 %138 %48 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                              Uniform f32_4* %146 = OpAccessChain %25 %43 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 0 
                                       f32_2 %149 = OpFMul %145 %148 
                                       f32_2 %150 = OpLoad %134 
                                       f32_2 %151 = OpFAdd %149 %150 
                                                      OpStore %134 %151 
                                       f32_2 %152 = OpLoad %134 
                                       f32_2 %153 = OpExtInst %1 4 %152 
                                Uniform f32* %155 = OpAccessChain %25 %154 
                                         f32 %156 = OpLoad %155 
                                Uniform f32* %158 = OpAccessChain %25 %157 
                                         f32 %159 = OpLoad %158 
                                       f32_2 %160 = OpCompositeConstruct %156 %159 
                                       f32_2 %161 = OpFMul %153 %160 
                                                      OpStore %134 %161 
                                       f32_4 %162 = OpLoad %63 
                                       f32_2 %163 = OpVectorShuffle %162 %162 3 3 
                                       f32_2 %164 = OpLoad %134 
                                       f32_2 %165 = OpFDiv %163 %164 
                                                      OpStore %134 %165 
                                       f32_2 %168 = OpLoad %134 
                                       f32_2 %169 = OpLoad %134 
                                         f32 %170 = OpDot %168 %169 
                                                      OpStore %167 %170 
                                Uniform f32* %172 = OpAccessChain %25 %171 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %175 = OpAccessChain %25 %174 
                                         f32 %176 = OpLoad %175 
                                       f32_2 %177 = OpCompositeConstruct %173 %176 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %181 = OpLoad %134 
                                       f32_2 %182 = OpFAdd %180 %181 
                                                      OpStore %134 %182 
                                       f32_2 %184 = OpLoad %134 
                                       f32_2 %185 = OpFDiv %179 %184 
                                       f32_4 %186 = OpLoad vs_TEXCOORD2 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %187 
                                         f32 %188 = OpLoad %167 
                                         f32 %189 = OpExtInst %1 32 %188 
                                Private f32* %191 = OpAccessChain %134 %190 
                                                      OpStore %191 %189 
                                  Input f32* %195 = OpAccessChain %193 %117 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpExtInst %1 4 %196 
                                Uniform f32* %199 = OpAccessChain %25 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %197 %200 
                                                      OpStore %192 %201 
                                Uniform f32* %203 = OpAccessChain %25 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFAdd %204 %205 
                                                      OpStore %167 %206 
                                         f32 %207 = OpLoad %192 
                                         f32 %208 = OpLoad %167 
                                         f32 %209 = OpFMul %207 %208 
                                                      OpStore %192 %209 
                                         f32 %210 = OpLoad %192 
                                Private f32* %211 = OpAccessChain %134 %190 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                                      OpStore %167 %213 
                                Uniform f32* %215 = OpAccessChain %25 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                         f32 %218 = OpFAdd %217 %205 
                                Private f32* %219 = OpAccessChain %63 %190 
                                                      OpStore %219 %218 
                                         f32 %220 = OpLoad %167 
                                         f32 %221 = OpExtInst %1 4 %220 
                                Private f32* %222 = OpAccessChain %63 %190 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %221 %223 
                                Private f32* %225 = OpAccessChain %63 %190 
                                                      OpStore %225 %224 
                                Private f32* %226 = OpAccessChain %134 %190 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpLoad %192 
                                         f32 %229 = OpFMul %227 %228 
                                Private f32* %230 = OpAccessChain %63 %190 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFNegate %231 
                                         f32 %233 = OpFAdd %229 %232 
                                Private f32* %234 = OpAccessChain %134 %190 
                                                      OpStore %234 %233 
                                       f32_3 %237 = OpLoad %236 
                              Uniform f32_4* %238 = OpAccessChain %25 %65 %48 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                         f32 %241 = OpDot %237 %240 
                                Private f32* %242 = OpAccessChain %89 %190 
                                                      OpStore %242 %241 
                                       f32_3 %243 = OpLoad %236 
                              Uniform f32_4* %244 = OpAccessChain %25 %65 %43 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                         f32 %247 = OpDot %243 %246 
                                Private f32* %248 = OpAccessChain %89 %117 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %236 
                              Uniform f32_4* %250 = OpAccessChain %25 %65 %42 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                         f32 %253 = OpDot %249 %252 
                                Private f32* %255 = OpAccessChain %89 %254 
                                                      OpStore %255 %253 
                                       f32_4 %256 = OpLoad %89 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %89 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                         f32 %260 = OpDot %257 %259 
                                                      OpStore %192 %260 
                                         f32 %261 = OpLoad %192 
                                         f32 %262 = OpExtInst %1 32 %261 
                                                      OpStore %192 %262 
                                         f32 %264 = OpLoad %192 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %39 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %39 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %192 %273 
                                         f32 %274 = OpLoad %192 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %192 %275 
                                         f32 %276 = OpLoad %192 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %39 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %89 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %89 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %89 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %192 %286 
                                         f32 %287 = OpLoad %192 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %134 %190 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %63 %190 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %134 %190 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %138 %65 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %134 %190 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %167 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %190 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %193 %117 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %205 %302 
                                Private f32* %321 = OpAccessChain %134 %190 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %192 %329 
                                Private f32* %330 = OpAccessChain %134 %190 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %192 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %134 %190 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %134 %190 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %178 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %134 %190 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %134 %190 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %134 %190 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %134 %190 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %254 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %190 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %192 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %205 
                                                      OpStore %167 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %167 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %167 %382 
                                         f32 %383 = OpLoad %167 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %192 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %167 %387 
                                Private f32* %388 = OpAccessChain %134 %190 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %167 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %190 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %134 %190 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %134 %190 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %192 
                                Private f32* %403 = OpAccessChain %134 %190 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %254 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %63 %412 
                                       f32_4 %413 = OpLoad %63 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %63 %416 
                                       f32_3 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %63 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_3 %426 = OpLoad %9 
                                       f32_3 %427 = OpVectorShuffle %426 %425 3 4 2 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %63 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_3 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %39 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %43 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                                      OpStore %9 %442 
                              Uniform f32_4* %443 = OpAccessChain %25 %438 %48 
                                       f32_4 %444 = OpLoad %443 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_4 %446 = OpLoad %39 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 0 0 
                                       f32_3 %448 = OpFMul %445 %447 
                                       f32_3 %449 = OpLoad %9 
                                       f32_3 %450 = OpFAdd %448 %449 
                                                      OpStore %9 %450 
                              Uniform f32_4* %453 = OpAccessChain %25 %438 %42 
                                       f32_4 %454 = OpLoad %453 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %39 
                                       f32_3 %457 = OpVectorShuffle %456 %456 2 2 2 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %9 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore vs_TEXCOORD3 %460 
                                  Input f32* %461 = OpAccessChain %193 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %464 = OpFMul %462 %463 
                                Private f32* %465 = OpAccessChain %9 %190 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %9 %190 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpExtInst %1 8 %467 
                                Private f32* %469 = OpAccessChain %134 %190 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %134 %190 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                         f32 %474 = OpFMul %472 %473 
                                  Input f32* %475 = OpAccessChain %193 %190 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFAdd %474 %476 
                                Private f32* %478 = OpAccessChain %134 %117 
                                                      OpStore %478 %477 
                                       f32_2 %479 = OpLoad %134 
                                       f32_2 %482 = OpFMul %479 %481 
                                       f32_3 %483 = OpLoad %9 
                                       f32_3 %484 = OpVectorShuffle %483 %482 3 4 2 
                                                      OpStore %9 %484 
                                       f32_3 %486 = OpLoad %9 
                                       f32_2 %487 = OpVectorShuffle %486 %486 0 1 
                              Uniform f32_4* %489 = OpAccessChain %25 %488 
                                       f32_4 %490 = OpLoad %489 
                                       f32_2 %491 = OpVectorShuffle %490 %490 0 1 
                                       f32_2 %492 = OpFMul %487 %491 
                              Uniform f32_4* %493 = OpAccessChain %25 %488 
                                       f32_4 %494 = OpLoad %493 
                                       f32_2 %495 = OpVectorShuffle %494 %494 2 3 
                                       f32_2 %496 = OpFAdd %492 %495 
                                       f32_4 %497 = OpLoad vs_TEXCOORD5 
                                       f32_4 %498 = OpVectorShuffle %497 %496 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %498 
                                       f32_3 %499 = OpLoad %9 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                              Uniform f32_4* %502 = OpAccessChain %25 %501 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_2 %505 = OpFMul %500 %504 
                              Uniform f32_4* %506 = OpAccessChain %25 %501 
                                       f32_4 %507 = OpLoad %506 
                                       f32_2 %508 = OpVectorShuffle %507 %507 2 3 
                                       f32_2 %509 = OpFAdd %505 %508 
                                       f32_4 %510 = OpLoad vs_TEXCOORD5 
                                       f32_4 %511 = OpVectorShuffle %510 %509 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %511 
                                 Output f32* %512 = OpAccessChain %121 %48 %117 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFNegate %513 
                                 Output f32* %515 = OpAccessChain %121 %48 %117 
                                                      OpStore %515 %514 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 305
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %35 %130 %157 %266 %299 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 22 
                                                      OpDecorate vs_TEXCOORD1 Location 35 
                                                      OpMemberDecorate %66 0 Offset 66 
                                                      OpMemberDecorate %66 1 Offset 66 
                                                      OpMemberDecorate %66 2 Offset 66 
                                                      OpMemberDecorate %66 3 Offset 66 
                                                      OpMemberDecorate %66 4 Offset 66 
                                                      OpMemberDecorate %66 5 Offset 66 
                                                      OpMemberDecorate %66 6 Offset 66 
                                                      OpMemberDecorate %66 7 Offset 66 
                                                      OpMemberDecorate %66 8 Offset 66 
                                                      OpMemberDecorate %66 9 Offset 66 
                                                      OpMemberDecorate %66 10 Offset 66 
                                                      OpDecorate %66 Block 
                                                      OpDecorate %68 DescriptorSet 68 
                                                      OpDecorate %68 Binding 68 
                                                      OpDecorate vs_TEXCOORD5 Location 130 
                                                      OpDecorate %135 DescriptorSet 135 
                                                      OpDecorate %135 Binding 135 
                                                      OpDecorate %137 DescriptorSet 137 
                                                      OpDecorate %137 Binding 137 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %179 DescriptorSet 179 
                                                      OpDecorate %179 Binding 179 
                                                      OpDecorate %181 DescriptorSet 181 
                                                      OpDecorate %181 Binding 181 
                                                      OpDecorate vs_TEXCOORD2 Location 266 
                                                      OpDecorate %299 Location 299 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypePointer UniformConstant %10 
         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                              %14 = OpTypeSampler 
                                              %15 = OpTypePointer UniformConstant %14 
                     UniformConstant sampler* %16 = OpVariable UniformConstant 
                                              %18 = OpTypeSampledImage %10 
                                              %20 = OpTypeVector %6 2 
                                              %21 = OpTypePointer Input %20 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 3 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %31 = OpVariable Private 
                                              %34 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                              %36 = OpTypePointer Input %6 
                                          u32 %44 = OpConstant 2 
                                              %49 = OpTypeBool 
                                              %50 = OpTypePointer Private %49 
                                Private bool* %51 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                              %56 = OpTypeInt 32 1 
                                          i32 %57 = OpConstant 0 
                                          i32 %58 = OpConstant 1 
                                          i32 %60 = OpConstant -1 
                                              %66 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 %7 
                                              %67 = OpTypePointer Uniform %66 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4;}* %68 = OpVariable Uniform 
                                          i32 %69 = OpConstant 8 
                                              %70 = OpTypePointer Uniform %6 
                                          i32 %73 = OpConstant 9 
                                          u32 %78 = OpConstant 1 
                                              %82 = OpTypePointer Private %20 
                               Private f32_2* %83 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                 Private f32* %95 = OpVariable Private 
                                         i32 %118 = OpConstant 5 
                                         i32 %121 = OpConstant 6 
                                             %125 = OpTypePointer Uniform %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                              Private f32_4* %134 = OpVariable Private 
        UniformConstant read_only Texture2D* %135 = OpVariable UniformConstant 
                    UniformConstant sampler* %137 = OpVariable UniformConstant 
                                         i32 %143 = OpConstant 7 
                                             %147 = OpTypeVector %6 3 
                                             %155 = OpTypePointer Private %147 
                              Private f32_3* %156 = OpVariable Private 
                                Input f32_4* %157 = OpVariable Input 
                                         i32 %160 = OpConstant 3 
                                         i32 %167 = OpConstant 2 
                              Private f32_4* %178 = OpVariable Private 
        UniformConstant read_only Texture2D* %179 = OpVariable UniformConstant 
                    UniformConstant sampler* %181 = OpVariable UniformConstant 
                                         i32 %212 = OpConstant 4 
                                         i32 %253 = OpConstant 10 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                             %298 = OpTypePointer Output %7 
                               Output f32_4* %299 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 3 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                                      OpStore %30 %27 
                                 Private f32* %32 = OpAccessChain %9 %28 
                                          f32 %33 = OpLoad %32 
                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFNegate %38 
                                          f32 %40 = OpFAdd %33 %39 
                                                      OpStore %31 %40 
                                 Private f32* %41 = OpAccessChain %9 %28 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                   Input f32* %45 = OpAccessChain vs_TEXCOORD1 %44 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFAdd %43 %46 
                                 Private f32* %48 = OpAccessChain %9 %28 
                                                      OpStore %48 %47 
                                          f32 %52 = OpLoad %31 
                                         bool %54 = OpFOrdLessThan %52 %53 
                                                      OpStore %51 %54 
                                         bool %55 = OpLoad %51 
                                          i32 %59 = OpSelect %55 %58 %57 
                                          i32 %61 = OpIMul %59 %60 
                                         bool %62 = OpINotEqual %61 %57 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                                      OpKill
                                              %64 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %68 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %74 = OpAccessChain %68 %73 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFMul %72 %75 
                                                      OpStore %31 %76 
                                          f32 %77 = OpLoad %31 
                                   Input f32* %79 = OpAccessChain vs_TEXCOORD1 %78 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %77 %80 
                                                      OpStore %31 %81 
                                          f32 %84 = OpLoad %31 
                                          f32 %86 = OpExtInst %1 37 %84 %85 
                                 Private f32* %87 = OpAccessChain %83 %28 
                                                      OpStore %87 %86 
                                          f32 %88 = OpLoad %31 
                                          f32 %90 = OpFMul %88 %89 
                                                      OpStore %31 %90 
                                 Private f32* %91 = OpAccessChain %83 %28 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpExtInst %1 31 %92 
                                 Private f32* %94 = OpAccessChain %83 %28 
                                                      OpStore %94 %93 
                                 Private f32* %96 = OpAccessChain %9 %28 
                                          f32 %97 = OpLoad %96 
                                   Input f32* %98 = OpAccessChain vs_TEXCOORD1 %78 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %97 %99 
                                         f32 %101 = OpLoad %31 
                                         f32 %102 = OpFAdd %100 %101 
                                                      OpStore %95 %102 
                                         f32 %103 = OpLoad %95 
                                         f32 %104 = OpExtInst %1 43 %103 %53 %85 
                                                      OpStore %95 %104 
                                Private f32* %105 = OpAccessChain %9 %28 
                                         f32 %106 = OpLoad %105 
                                  Input f32* %107 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFMul %106 %108 
                                         f32 %110 = OpLoad %31 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %109 %111 
                                Private f32* %113 = OpAccessChain %9 %28 
                                                      OpStore %113 %112 
                                Private f32* %114 = OpAccessChain %83 %28 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpLoad %95 
                                         f32 %117 = OpFMul %115 %116 
                                                      OpStore %31 %117 
                                Uniform f32* %119 = OpAccessChain %68 %118 
                                         f32 %120 = OpLoad %119 
                                Uniform f32* %122 = OpAccessChain %68 %121 
                                         f32 %123 = OpLoad %122 
                                       f32_2 %124 = OpCompositeConstruct %120 %123 
                              Uniform f32_4* %126 = OpAccessChain %68 %57 
                                       f32_4 %127 = OpLoad %126 
                                       f32_2 %128 = OpVectorShuffle %127 %127 1 1 
                                       f32_2 %129 = OpFMul %124 %128 
                                       f32_4 %131 = OpLoad vs_TEXCOORD5 
                                       f32_2 %132 = OpVectorShuffle %131 %131 2 3 
                                       f32_2 %133 = OpFAdd %129 %132 
                                                      OpStore %83 %133 
                         read_only Texture2D %136 = OpLoad %135 
                                     sampler %138 = OpLoad %137 
                  read_only Texture2DSampled %139 = OpSampledImage %136 %138 
                                       f32_2 %140 = OpLoad %83 
                                       f32_4 %141 = OpImageSampleImplicitLod %139 %140 
                                                      OpStore %134 %141 
                                       f32_4 %142 = OpLoad %134 
                              Uniform f32_4* %144 = OpAccessChain %68 %143 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpFMul %142 %145 
                                                      OpStore %134 %146 
                                       f32_4 %148 = OpLoad %134 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_4 %150 = OpLoad %134 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %134 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %134 %154 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_4* %161 = OpAccessChain %68 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFMul %159 %163 
                                                      OpStore %156 %164 
                                Uniform f32* %165 = OpAccessChain %68 %58 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %168 = OpAccessChain %68 %167 
                                         f32 %169 = OpLoad %168 
                                       f32_2 %170 = OpCompositeConstruct %166 %169 
                              Uniform f32_4* %171 = OpAccessChain %68 %57 
                                       f32_4 %172 = OpLoad %171 
                                       f32_2 %173 = OpVectorShuffle %172 %172 1 1 
                                       f32_2 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad vs_TEXCOORD5 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                                      OpStore %83 %177 
                         read_only Texture2D %180 = OpLoad %179 
                                     sampler %182 = OpLoad %181 
                  read_only Texture2DSampled %183 = OpSampledImage %180 %182 
                                       f32_2 %184 = OpLoad %83 
                                       f32_4 %185 = OpImageSampleImplicitLod %183 %184 
                                                      OpStore %178 %185 
                                       f32_3 %186 = OpLoad %156 
                                       f32_4 %187 = OpLoad %178 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFMul %186 %188 
                                                      OpStore %156 %189 
                                Private f32* %190 = OpAccessChain %178 %26 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %68 %160 %26 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Private f32* %195 = OpAccessChain %178 %26 
                                                      OpStore %195 %194 
                                       f32_3 %196 = OpLoad %156 
                                       f32_4 %197 = OpLoad %178 
                                       f32_3 %198 = OpVectorShuffle %197 %197 3 3 3 
                                       f32_3 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %178 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                                      OpStore %178 %201 
                                       f32_4 %202 = OpLoad %134 
                                       f32_4 %203 = OpLoad %178 
                                       f32_4 %204 = OpFNegate %203 
                                       f32_4 %205 = OpFAdd %202 %204 
                                                      OpStore %134 %205 
                                         f32 %206 = OpLoad %31 
                                       f32_4 %207 = OpCompositeConstruct %206 %206 %206 %206 
                                       f32_4 %208 = OpLoad %134 
                                       f32_4 %209 = OpFMul %207 %208 
                                       f32_4 %210 = OpLoad %178 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %134 %211 
                                Uniform f32* %213 = OpAccessChain %68 %212 
                                         f32 %214 = OpLoad %213 
                                Uniform f32* %215 = OpAccessChain %68 %73 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                                      OpStore %31 %217 
                                         f32 %218 = OpLoad %31 
                                  Input f32* %219 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFMul %218 %220 
                                Private f32* %222 = OpAccessChain %83 %28 
                                                      OpStore %222 %221 
                                         f32 %223 = OpLoad %31 
                                  Input f32* %224 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFMul %223 %225 
                                         f32 %227 = OpFAdd %226 %85 
                                                      OpStore %31 %227 
                                Private f32* %228 = OpAccessChain %83 %28 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFMul %229 %89 
                                Private f32* %231 = OpAccessChain %9 %28 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFAdd %230 %232 
                                Private f32* %234 = OpAccessChain %9 %28 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %9 %28 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpLoad %31 
                                         f32 %238 = OpFDiv %236 %237 
                                Private f32* %239 = OpAccessChain %9 %28 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %28 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpExtInst %1 43 %241 %53 %85 
                                Private f32* %243 = OpAccessChain %9 %28 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %9 %28 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %246 %85 
                                Private f32* %248 = OpAccessChain %9 %28 
                                                      OpStore %248 %247 
                                       f32_4 %249 = OpLoad %9 
                                       f32_4 %250 = OpVectorShuffle %249 %249 0 0 0 0 
                                       f32_4 %251 = OpLoad %134 
                                       f32_4 %252 = OpFMul %250 %251 
                                                      OpStore %9 %252 
                              Uniform f32_4* %254 = OpAccessChain %68 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFNegate %256 
                              Uniform f32_4* %258 = OpAccessChain %68 %253 
                                       f32_4 %259 = OpLoad %258 
                                       f32_2 %260 = OpVectorShuffle %259 %259 2 3 
                                       f32_2 %261 = OpFAdd %257 %260 
                                       f32_4 %262 = OpLoad %134 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                      OpStore %134 %263 
                                       f32_4 %264 = OpLoad %134 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %267 = OpLoad vs_TEXCOORD2 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 4 %268 
                                       f32_2 %270 = OpFNegate %269 
                                       f32_2 %271 = OpFAdd %265 %270 
                                       f32_4 %272 = OpLoad %134 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                      OpStore %134 %273 
                                       f32_4 %274 = OpLoad %134 
                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
                                       f32_4 %276 = OpLoad vs_TEXCOORD2 
                                       f32_2 %277 = OpVectorShuffle %276 %276 2 3 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_4 %279 = OpLoad %134 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 2 3 
                                                      OpStore %134 %280 
                                       f32_4 %281 = OpLoad %134 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_2 %283 = OpCompositeConstruct %53 %53 
                                       f32_2 %284 = OpCompositeConstruct %85 %85 
                                       f32_2 %285 = OpExtInst %1 43 %282 %283 %284 
                                       f32_4 %286 = OpLoad %134 
                                       f32_4 %287 = OpVectorShuffle %286 %285 4 5 2 3 
                                                      OpStore %134 %287 
                                Private f32* %288 = OpAccessChain %134 %78 
                                         f32 %289 = OpLoad %288 
                                Private f32* %290 = OpAccessChain %134 %28 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpFMul %289 %291 
                                Private f32* %293 = OpAccessChain %134 %28 
                                                      OpStore %293 %292 
                                       f32_4 %294 = OpLoad %9 
                                       f32_4 %295 = OpLoad %134 
                                       f32_4 %296 = OpVectorShuffle %295 %295 0 0 0 0 
                                       f32_4 %297 = OpFMul %294 %296 
                                                      OpStore %9 %297 
                                       f32_4 %300 = OpLoad %9 
                                       f32_4 %301 = OpLoad %157 
                                       f32_4 %302 = OpVectorShuffle %301 %301 3 3 3 3 
                                       f32_4 %303 = OpFMul %300 %302 
                                                      OpStore %299 %303 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	vec4 _UnderlayColor;
uniform 	float _UnderlayOffsetX;
uniform 	float _UnderlayOffsetY;
uniform 	float _UnderlayDilate;
uniform 	float _UnderlaySoftness;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioC;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_COLOR1;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xyw = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyw;
    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
    u_xlat0.x = u_xlat1.x * u_xlat6.x + 1.0;
    u_xlat0.x = u_xlat6.x / u_xlat0.x;
    u_xlat4 = u_xlat8.x * u_xlat0.x + -0.5;
    u_xlat8.x = u_xlat0.x * u_xlat1.y;
    u_xlat1.xy = (-u_xlat1.zw) * vec2(_GradientScale);
    u_xlat1.xy = u_xlat1.xy / vec2(_TextureWidth, _TextureHeight);
    vs_TEXCOORD4.xy = u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat8.x) * 0.5 + u_xlat4;
    vs_COLOR1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
    vs_COLOR1.w = _UnderlayColor.w;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_COLOR1;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat0 = u_xlat0 * _OutlineColor;
    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat2.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat2 = texture(_FaceTex, u_xlat2.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.w = u_xlat2.w * _FaceColor.w;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.www;
    u_xlat0 = u_xlat0 + (-u_xlat2);
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD1.y;
    u_xlat5 = min(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9 = (-u_xlat3.w) + vs_TEXCOORD1.z;
    u_xlat13 = u_xlat9 * vs_TEXCOORD1.y + u_xlat1.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat1.x = u_xlat9 * vs_TEXCOORD1.y + (-u_xlat1.x);
    u_xlat5 = u_xlat5 * u_xlat13;
    u_xlat0 = vec4(u_xlat5) * u_xlat0 + u_xlat2;
    u_xlat5 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y + 1.0;
    u_xlat1.x = u_xlat9 * 0.5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = (-u_xlat0.w) * u_xlat1.x + 1.0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat4 = u_xlat1.w * vs_TEXCOORD4.z + (-vs_TEXCOORD4.w);
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat1 = vec4(u_xlat4) * vs_COLOR1;
    u_xlat0 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 631
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %120 %124 %125 %128 %130 %182 %192 %235 %358 %457 %544 %561 %599 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpMemberDecorate %23 25 Offset 23 
                                                      OpMemberDecorate %23 26 Offset 23 
                                                      OpMemberDecorate %23 27 Offset 23 
                                                      OpMemberDecorate %23 28 Offset 23 
                                                      OpMemberDecorate %23 29 Offset 23 
                                                      OpMemberDecorate %23 30 Offset 23 
                                                      OpMemberDecorate %23 31 Offset 23 
                                                      OpMemberDecorate %23 32 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate vs_TEXCOORD0 Location 128 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate vs_TEXCOORD2 Location 182 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %235 Location 235 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 457 
                                                      OpDecorate vs_TEXCOORD4 Location 544 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate vs_TEXCOORD5 Location 599 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeArray %7 %17 
                                              %23 = OpTypeStruct %15 %7 %18 %19 %20 %21 %6 %6 %6 %22 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 19 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 20 
                               Private f32_4* %38 = OpVariable Private 
                                          i32 %41 = OpConstant 2 
                                          i32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Uniform %7 
                                          i32 %47 = OpConstant 0 
                               Private f32_4* %62 = OpVariable Private 
                                          i32 %64 = OpConstant 3 
                                              %82 = OpTypePointer Uniform %15 
                               Private f32_4* %88 = OpVariable Private 
                                          i32 %91 = OpConstant 5 
                                         u32 %116 = OpConstant 1 
                                             %117 = OpTypeArray %6 %116 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %122 = OpTypePointer Output %7 
                               Output f32_4* %124 = OpVariable Output 
                                Input f32_4* %125 = OpVariable Input 
                                             %127 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %129 = OpTypePointer Input %12 
                                Input f32_2* %130 = OpVariable Input 
                                             %132 = OpTypePointer Private %12 
                              Private f32_2* %133 = OpVariable Private 
                                         i32 %137 = OpConstant 4 
                                         i32 %153 = OpConstant 27 
                                         i32 %156 = OpConstant 28 
                                             %165 = OpTypePointer Private %6 
                                Private f32* %166 = OpVariable Private 
                                         i32 %170 = OpConstant 22 
                                         i32 %173 = OpConstant 23 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_2 %178 = OpConstantComposite %177 %177 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %189 = OpConstant 0 
                                Private f32* %191 = OpVariable Private 
                                Input f32_2* %192 = OpVariable Input 
                                             %193 = OpTypePointer Input %6 
                                         i32 %197 = OpConstant 26 
                                         i32 %201 = OpConstant 30 
                                         f32 %204 = OpConstant 3.674022E-40 
                                         i32 %213 = OpConstant 29 
                                             %234 = OpTypePointer Input %15 
                                Input f32_3* %235 = OpVariable Input 
                                         u32 %253 = OpConstant 2 
                                             %262 = OpTypePointer Private %15 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 15 
                                         i32 %326 = OpConstant 16 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 17 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 21 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %456 = OpTypePointer Output %15 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %467 = OpConstant 14 
                                         i32 %470 = OpConstant 13 
                                         i32 %473 = OpConstant 11 
                                         i32 %476 = OpConstant 12 
                                         i32 %480 = OpConstant 18 
                                Private f32* %509 = OpVariable Private 
                                         f32 %515 = OpConstant 3.674022E-40 
                                         i32 %534 = OpConstant 24 
                                         i32 %537 = OpConstant 25 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                               Output f32_4* %561 = OpVariable Output 
                                         i32 %562 = OpConstant 10 
                                         f32 %577 = OpConstant 3.674022E-40 
                                         f32 %587 = OpConstant 3.674022E-40 
                                         f32 %594 = OpConstant 3.674022E-40 
                                       f32_2 %595 = OpConstantComposite %594 %594 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %602 = OpConstant 31 
                                         i32 %615 = OpConstant 32 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %14 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                                      OpStore %9 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 1 1 1 1 
                               Uniform f32_4* %44 = OpAccessChain %25 %41 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_4 %46 = OpFMul %40 %45 
                                                      OpStore %38 %46 
                               Uniform f32_4* %48 = OpAccessChain %25 %41 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %38 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %38 %54 
                               Uniform f32_4* %55 = OpAccessChain %25 %41 %41 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %11 
                                        f32_4 %58 = OpVectorShuffle %57 %57 2 2 2 2 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %38 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %38 %61 
                                        f32_4 %63 = OpLoad %38 
                               Uniform f32_4* %65 = OpAccessChain %25 %41 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %62 %67 
                               Uniform f32_4* %68 = OpAccessChain %25 %41 %64 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_4 %71 = OpLoad %11 
                                        f32_3 %72 = OpVectorShuffle %71 %71 3 3 3 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %38 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %38 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %38 %78 
                                        f32_4 %79 = OpLoad %38 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpFNegate %80 
                               Uniform f32_3* %83 = OpAccessChain %25 %47 
                                        f32_3 %84 = OpLoad %83 
                                        f32_3 %85 = OpFAdd %81 %84 
                                        f32_4 %86 = OpLoad %38 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %38 %87 
                                        f32_4 %89 = OpLoad %62 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %25 %91 %42 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %90 %93 
                                                      OpStore %88 %94 
                               Uniform f32_4* %95 = OpAccessChain %25 %91 %47 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %62 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %88 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %88 %101 
                              Uniform f32_4* %102 = OpAccessChain %25 %91 %41 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %62 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %88 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %88 %108 
                              Uniform f32_4* %109 = OpAccessChain %25 %91 %64 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpVectorShuffle %111 %111 3 3 3 3 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %62 %115 
                                       f32_4 %121 = OpLoad %62 
                               Output f32_4* %123 = OpAccessChain %120 %47 
                                                      OpStore %123 %121 
                                       f32_4 %126 = OpLoad %125 
                                                      OpStore %124 %126 
                                       f32_2 %131 = OpLoad %130 
                                                      OpStore vs_TEXCOORD0 %131 
                              Uniform f32_4* %134 = OpAccessChain %25 %42 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %25 %137 %42 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %137 %47 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                              Uniform f32_4* %145 = OpAccessChain %25 %42 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 0 
                                       f32_2 %148 = OpFMul %144 %147 
                                       f32_2 %149 = OpLoad %133 
                                       f32_2 %150 = OpFAdd %148 %149 
                                                      OpStore %133 %150 
                                       f32_2 %151 = OpLoad %133 
                                       f32_2 %152 = OpExtInst %1 4 %151 
                                Uniform f32* %154 = OpAccessChain %25 %153 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %25 %156 
                                         f32 %158 = OpLoad %157 
                                       f32_2 %159 = OpCompositeConstruct %155 %158 
                                       f32_2 %160 = OpFMul %152 %159 
                                                      OpStore %133 %160 
                                       f32_4 %161 = OpLoad %62 
                                       f32_2 %162 = OpVectorShuffle %161 %161 3 3 
                                       f32_2 %163 = OpLoad %133 
                                       f32_2 %164 = OpFDiv %162 %163 
                                                      OpStore %133 %164 
                                       f32_2 %167 = OpLoad %133 
                                       f32_2 %168 = OpLoad %133 
                                         f32 %169 = OpDot %167 %168 
                                                      OpStore %166 %169 
                                Uniform f32* %171 = OpAccessChain %25 %170 
                                         f32 %172 = OpLoad %171 
                                Uniform f32* %174 = OpAccessChain %25 %173 
                                         f32 %175 = OpLoad %174 
                                       f32_2 %176 = OpCompositeConstruct %172 %175 
                                       f32_2 %179 = OpFMul %176 %178 
                                       f32_2 %180 = OpLoad %133 
                                       f32_2 %181 = OpFAdd %179 %180 
                                                      OpStore %133 %181 
                                       f32_2 %183 = OpLoad %133 
                                       f32_2 %184 = OpFDiv %178 %183 
                                       f32_4 %185 = OpLoad vs_TEXCOORD2 
                                       f32_4 %186 = OpVectorShuffle %185 %184 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %186 
                                         f32 %187 = OpLoad %166 
                                         f32 %188 = OpExtInst %1 32 %187 
                                Private f32* %190 = OpAccessChain %133 %189 
                                                      OpStore %190 %188 
                                  Input f32* %194 = OpAccessChain %192 %116 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpExtInst %1 4 %195 
                                Uniform f32* %198 = OpAccessChain %25 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %196 %199 
                                                      OpStore %191 %200 
                                Uniform f32* %202 = OpAccessChain %25 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %166 %205 
                                         f32 %206 = OpLoad %191 
                                         f32 %207 = OpLoad %166 
                                         f32 %208 = OpFMul %206 %207 
                                                      OpStore %191 %208 
                                         f32 %209 = OpLoad %191 
                                Private f32* %210 = OpAccessChain %133 %189 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFMul %209 %211 
                                                      OpStore %166 %212 
                                Uniform f32* %214 = OpAccessChain %25 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %216 %204 
                                Private f32* %218 = OpAccessChain %62 %189 
                                                      OpStore %218 %217 
                                         f32 %219 = OpLoad %166 
                                         f32 %220 = OpExtInst %1 4 %219 
                                Private f32* %221 = OpAccessChain %62 %189 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %220 %222 
                                Private f32* %224 = OpAccessChain %62 %189 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %133 %189 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpLoad %191 
                                         f32 %228 = OpFMul %226 %227 
                                Private f32* %229 = OpAccessChain %62 %189 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFNegate %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %133 %189 
                                                      OpStore %233 %232 
                                       f32_3 %236 = OpLoad %235 
                              Uniform f32_4* %237 = OpAccessChain %25 %64 %47 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                         f32 %240 = OpDot %236 %239 
                                Private f32* %241 = OpAccessChain %88 %189 
                                                      OpStore %241 %240 
                                       f32_3 %242 = OpLoad %235 
                              Uniform f32_4* %243 = OpAccessChain %25 %64 %42 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                         f32 %246 = OpDot %242 %245 
                                Private f32* %247 = OpAccessChain %88 %116 
                                                      OpStore %247 %246 
                                       f32_3 %248 = OpLoad %235 
                              Uniform f32_4* %249 = OpAccessChain %25 %64 %41 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                         f32 %252 = OpDot %248 %251 
                                Private f32* %254 = OpAccessChain %88 %253 
                                                      OpStore %254 %252 
                                       f32_4 %255 = OpLoad %88 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_4 %257 = OpLoad %88 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                         f32 %259 = OpDot %256 %258 
                                                      OpStore %191 %259 
                                         f32 %260 = OpLoad %191 
                                         f32 %261 = OpExtInst %1 32 %260 
                                                      OpStore %191 %261 
                                         f32 %264 = OpLoad %191 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %88 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %38 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %38 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %191 %273 
                                         f32 %274 = OpLoad %191 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %191 %275 
                                         f32 %276 = OpLoad %191 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %38 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %88 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %88 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %88 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %191 %286 
                                         f32 %287 = OpLoad %191 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %133 %189 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %62 %189 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %133 %189 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %137 %64 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %133 %189 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %166 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %189 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %192 %116 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %204 %302 
                                Private f32* %321 = OpAccessChain %133 %189 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %191 %329 
                                Private f32* %330 = OpAccessChain %133 %189 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %191 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %133 %189 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %133 %189 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %177 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %133 %189 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %133 %189 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %133 %189 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %133 %189 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %253 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %189 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %191 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %204 
                                                      OpStore %166 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %166 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %166 %382 
                                         f32 %383 = OpLoad %166 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %191 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %166 %387 
                                Private f32* %388 = OpAccessChain %133 %189 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %166 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %189 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %133 %189 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %133 %189 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %191 
                                Private f32* %403 = OpAccessChain %133 %189 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %253 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %88 %412 
                                       f32_4 %413 = OpLoad %88 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %88 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %88 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_4 %426 = OpLoad %9 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 2 3 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %88 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %38 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %42 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                       f32_4 %443 = OpLoad %9 
                                       f32_4 %444 = OpVectorShuffle %443 %442 4 5 2 6 
                                                      OpStore %9 %444 
                              Uniform f32_4* %445 = OpAccessChain %25 %438 %47 
                                       f32_4 %446 = OpLoad %445 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                       f32_4 %448 = OpLoad %38 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
                                       f32_3 %450 = OpFMul %447 %449 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 3 
                                       f32_3 %453 = OpFAdd %450 %452 
                                       f32_4 %454 = OpLoad %9 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 2 6 
                                                      OpStore %9 %455 
                              Uniform f32_4* %458 = OpAccessChain %25 %438 %41 
                                       f32_4 %459 = OpLoad %458 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_4 %461 = OpLoad %38 
                                       f32_3 %462 = OpVectorShuffle %461 %461 2 2 2 
                                       f32_3 %463 = OpFMul %460 %462 
                                       f32_4 %464 = OpLoad %9 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 3 
                                       f32_3 %466 = OpFAdd %463 %465 
                                                      OpStore vs_TEXCOORD3 %466 
                                Uniform f32* %468 = OpAccessChain %25 %467 
                                         f32 %469 = OpLoad %468 
                                Uniform f32* %471 = OpAccessChain %25 %470 
                                         f32 %472 = OpLoad %471 
                                Uniform f32* %474 = OpAccessChain %25 %473 
                                         f32 %475 = OpLoad %474 
                                Uniform f32* %477 = OpAccessChain %25 %476 
                                         f32 %478 = OpLoad %477 
                                       f32_4 %479 = OpCompositeConstruct %469 %472 %475 %478 
                                Uniform f32* %481 = OpAccessChain %25 %480 
                                         f32 %482 = OpLoad %481 
                                Uniform f32* %483 = OpAccessChain %25 %480 
                                         f32 %484 = OpLoad %483 
                                Uniform f32* %485 = OpAccessChain %25 %480 
                                         f32 %486 = OpLoad %485 
                                Uniform f32* %487 = OpAccessChain %25 %480 
                                         f32 %488 = OpLoad %487 
                                       f32_4 %489 = OpCompositeConstruct %482 %484 %486 %488 
                                         f32 %490 = OpCompositeExtract %489 0 
                                         f32 %491 = OpCompositeExtract %489 1 
                                         f32 %492 = OpCompositeExtract %489 2 
                                         f32 %493 = OpCompositeExtract %489 3 
                                       f32_4 %494 = OpCompositeConstruct %490 %491 %492 %493 
                                       f32_4 %495 = OpFMul %479 %494 
                                                      OpStore %38 %495 
                                Private f32* %496 = OpAccessChain %38 %189 
                                         f32 %497 = OpLoad %496 
                                Private f32* %498 = OpAccessChain %263 %189 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %497 %499 
                                         f32 %501 = OpFAdd %500 %204 
                                Private f32* %502 = OpAccessChain %9 %189 
                                                      OpStore %502 %501 
                                Private f32* %503 = OpAccessChain %263 %189 
                                         f32 %504 = OpLoad %503 
                                Private f32* %505 = OpAccessChain %9 %189 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFDiv %504 %506 
                                Private f32* %508 = OpAccessChain %9 %189 
                                                      OpStore %508 %507 
                                Private f32* %510 = OpAccessChain %133 %189 
                                         f32 %511 = OpLoad %510 
                                Private f32* %512 = OpAccessChain %9 %189 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                         f32 %516 = OpFAdd %514 %515 
                                                      OpStore %509 %516 
                                Private f32* %517 = OpAccessChain %9 %189 
                                         f32 %518 = OpLoad %517 
                                Private f32* %519 = OpAccessChain %38 %116 
                                         f32 %520 = OpLoad %519 
                                         f32 %521 = OpFMul %518 %520 
                                Private f32* %522 = OpAccessChain %133 %189 
                                                      OpStore %522 %521 
                                       f32_4 %523 = OpLoad %38 
                                       f32_2 %524 = OpVectorShuffle %523 %523 2 3 
                                       f32_2 %525 = OpFNegate %524 
                                Uniform f32* %526 = OpAccessChain %25 %197 
                                         f32 %527 = OpLoad %526 
                                       f32_2 %528 = OpCompositeConstruct %527 %527 
                                       f32_2 %529 = OpFMul %525 %528 
                                       f32_4 %530 = OpLoad %38 
                                       f32_4 %531 = OpVectorShuffle %530 %529 4 5 2 3 
                                                      OpStore %38 %531 
                                       f32_4 %532 = OpLoad %38 
                                       f32_2 %533 = OpVectorShuffle %532 %532 0 1 
                                Uniform f32* %535 = OpAccessChain %25 %534 
                                         f32 %536 = OpLoad %535 
                                Uniform f32* %538 = OpAccessChain %25 %537 
                                         f32 %539 = OpLoad %538 
                                       f32_2 %540 = OpCompositeConstruct %536 %539 
                                       f32_2 %541 = OpFDiv %533 %540 
                                       f32_4 %542 = OpLoad %38 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 2 3 
                                                      OpStore %38 %543 
                                       f32_4 %545 = OpLoad %38 
                                       f32_2 %546 = OpVectorShuffle %545 %545 0 1 
                                       f32_2 %547 = OpLoad %130 
                                       f32_2 %548 = OpFAdd %546 %547 
                                       f32_4 %549 = OpLoad vs_TEXCOORD4 
                                       f32_4 %550 = OpVectorShuffle %549 %548 4 5 2 3 
                                                      OpStore vs_TEXCOORD4 %550 
                                Private f32* %551 = OpAccessChain %9 %189 
                                         f32 %552 = OpLoad %551 
                                 Output f32* %553 = OpAccessChain vs_TEXCOORD4 %253 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %133 %189 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpFNegate %555 
                                         f32 %557 = OpFMul %556 %355 
                                         f32 %558 = OpLoad %509 
                                         f32 %559 = OpFAdd %557 %558 
                                 Output f32* %560 = OpAccessChain vs_TEXCOORD4 %299 
                                                      OpStore %560 %559 
                              Uniform f32_4* %563 = OpAccessChain %25 %562 
                                       f32_4 %564 = OpLoad %563 
                                       f32_3 %565 = OpVectorShuffle %564 %564 3 3 3 
                              Uniform f32_4* %566 = OpAccessChain %25 %562 
                                       f32_4 %567 = OpLoad %566 
                                       f32_3 %568 = OpVectorShuffle %567 %567 0 1 2 
                                       f32_3 %569 = OpFMul %565 %568 
                                       f32_4 %570 = OpLoad %561 
                                       f32_4 %571 = OpVectorShuffle %570 %569 4 5 6 3 
                                                      OpStore %561 %571 
                                Uniform f32* %572 = OpAccessChain %25 %562 %299 
                                         f32 %573 = OpLoad %572 
                                 Output f32* %574 = OpAccessChain %561 %299 
                                                      OpStore %574 %573 
                                  Input f32* %575 = OpAccessChain %192 %189 
                                         f32 %576 = OpLoad %575 
                                         f32 %578 = OpFMul %576 %577 
                                Private f32* %579 = OpAccessChain %9 %189 
                                                      OpStore %579 %578 
                                Private f32* %580 = OpAccessChain %9 %189 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 8 %581 
                                Private f32* %583 = OpAccessChain %133 %189 
                                                      OpStore %583 %582 
                                Private f32* %584 = OpAccessChain %133 %189 
                                         f32 %585 = OpLoad %584 
                                         f32 %586 = OpFNegate %585 
                                         f32 %588 = OpFMul %586 %587 
                                  Input f32* %589 = OpAccessChain %192 %189 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFAdd %588 %590 
                                Private f32* %592 = OpAccessChain %133 %116 
                                                      OpStore %592 %591 
                                       f32_2 %593 = OpLoad %133 
                                       f32_2 %596 = OpFMul %593 %595 
                                       f32_4 %597 = OpLoad %9 
                                       f32_4 %598 = OpVectorShuffle %597 %596 4 5 2 3 
                                                      OpStore %9 %598 
                                       f32_4 %600 = OpLoad %9 
                                       f32_2 %601 = OpVectorShuffle %600 %600 0 1 
                              Uniform f32_4* %603 = OpAccessChain %25 %602 
                                       f32_4 %604 = OpLoad %603 
                                       f32_2 %605 = OpVectorShuffle %604 %604 0 1 
                                       f32_2 %606 = OpFMul %601 %605 
                              Uniform f32_4* %607 = OpAccessChain %25 %602 
                                       f32_4 %608 = OpLoad %607 
                                       f32_2 %609 = OpVectorShuffle %608 %608 2 3 
                                       f32_2 %610 = OpFAdd %606 %609 
                                       f32_4 %611 = OpLoad vs_TEXCOORD5 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %612 
                                       f32_4 %613 = OpLoad %9 
                                       f32_2 %614 = OpVectorShuffle %613 %613 0 1 
                              Uniform f32_4* %616 = OpAccessChain %25 %615 
                                       f32_4 %617 = OpLoad %616 
                                       f32_2 %618 = OpVectorShuffle %617 %617 0 1 
                                       f32_2 %619 = OpFMul %614 %618 
                              Uniform f32_4* %620 = OpAccessChain %25 %615 
                                       f32_4 %621 = OpLoad %620 
                                       f32_2 %622 = OpVectorShuffle %621 %621 2 3 
                                       f32_2 %623 = OpFAdd %619 %622 
                                       f32_4 %624 = OpLoad vs_TEXCOORD5 
                                       f32_4 %625 = OpVectorShuffle %624 %623 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %625 
                                 Output f32* %626 = OpAccessChain %120 %47 %116 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFNegate %627 
                                 Output f32* %629 = OpAccessChain %120 %47 %116 
                                                      OpStore %629 %628 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 330
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %30 %63 %136 %162 %252 %269 %291 %324 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD5 Location 30 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %90 DescriptorSet 90 
                                                      OpDecorate %90 Binding 90 
                                                      OpDecorate %92 DescriptorSet 92 
                                                      OpDecorate %92 Binding 92 
                                                      OpDecorate vs_TEXCOORD1 Location 136 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %158 DescriptorSet 158 
                                                      OpDecorate %158 Binding 158 
                                                      OpDecorate vs_TEXCOORD0 Location 162 
                                                      OpDecorate vs_TEXCOORD4 Location 252 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate vs_TEXCOORD2 Location 291 
                                                      OpDecorate %324 Location 324 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 5 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 6 
                                              %21 = OpTypeVector %6 2 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %7 
                                              %29 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %37 = OpTypePointer UniformConstant %36 
         UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampler 
                                              %41 = OpTypePointer UniformConstant %40 
                     UniformConstant sampler* %42 = OpVariable UniformConstant 
                                              %44 = OpTypeSampledImage %36 
                                          i32 %50 = OpConstant 7 
                                              %54 = OpTypeVector %6 3 
                               Private f32_4* %62 = OpVariable Private 
                                 Input f32_4* %63 = OpVariable Input 
                                          i32 %66 = OpConstant 3 
                               Private f32_4* %73 = OpVariable Private 
                                          i32 %74 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
         UniformConstant read_only Texture2D* %90 = OpVariable UniformConstant 
                     UniformConstant sampler* %92 = OpVariable UniformConstant 
                                             %105 = OpTypeInt 32 0 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Private %6 
                                         i32 %125 = OpConstant 8 
                                         i32 %128 = OpConstant 9 
                                         u32 %132 = OpConstant 0 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %137 = OpConstant 1 
                                             %138 = OpTypePointer Input %6 
                                Private f32* %143 = OpVariable Private 
                                         f32 %146 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                Private f32* %155 = OpVariable Private 
        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
                    UniformConstant sampler* %158 = OpVariable UniformConstant 
                                             %161 = OpTypePointer Input %21 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         u32 %168 = OpConstant 2 
                                Private f32* %172 = OpVariable Private 
                                         f32 %181 = OpConstant 3.674022E-40 
                                         i32 %201 = OpConstant 4 
                                Private f32* %248 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                Input f32_4* %269 = OpVariable Input 
                                         i32 %278 = OpConstant 10 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                             %323 = OpTypePointer Output %7 
                               Output f32_4* %324 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                        f32_2 %22 = OpCompositeConstruct %17 %20 
                               Uniform f32_4* %25 = OpAccessChain %12 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %22 %27 
                                        f32_4 %31 = OpLoad vs_TEXCOORD5 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %28 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %9 %35 
                          read_only Texture2D %39 = OpLoad %38 
                                      sampler %43 = OpLoad %42 
                   read_only Texture2DSampled %45 = OpSampledImage %39 %43 
                                        f32_4 %46 = OpLoad %9 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                        f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                                      OpStore %9 %48 
                                        f32_4 %49 = OpLoad %9 
                               Uniform f32_4* %51 = OpAccessChain %12 %50 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %49 %52 
                                                      OpStore %9 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_4 %57 = OpLoad %9 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %9 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %12 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFMul %65 %69 
                                        f32_4 %71 = OpLoad %62 
                                        f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                                      OpStore %62 %72 
                                 Uniform f32* %75 = OpAccessChain %12 %74 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %12 %77 
                                          f32 %79 = OpLoad %78 
                                        f32_2 %80 = OpCompositeConstruct %76 %79 
                               Uniform f32_4* %81 = OpAccessChain %12 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 1 1 
                                        f32_2 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad vs_TEXCOORD5 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_2 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %73 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                                      OpStore %73 %89 
                          read_only Texture2D %91 = OpLoad %90 
                                      sampler %93 = OpLoad %92 
                   read_only Texture2DSampled %94 = OpSampledImage %91 %93 
                                        f32_4 %95 = OpLoad %73 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                                      OpStore %73 %97 
                                        f32_4 %98 = OpLoad %62 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_4 %100 = OpLoad %73 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %62 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %62 %104 
                                Private f32* %108 = OpAccessChain %73 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %110 = OpAccessChain %12 %66 %106 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFMul %109 %111 
                                Private f32* %113 = OpAccessChain %73 %106 
                                                      OpStore %113 %112 
                                       f32_4 %114 = OpLoad %62 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_4 %116 = OpLoad %73 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %73 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %73 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpLoad %73 
                                       f32_4 %123 = OpFNegate %122 
                                       f32_4 %124 = OpFAdd %121 %123 
                                                      OpStore %9 %124 
                                Uniform f32* %126 = OpAccessChain %12 %125 
                                         f32 %127 = OpLoad %126 
                                Uniform f32* %129 = OpAccessChain %12 %128 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %127 %130 
                                Private f32* %133 = OpAccessChain %62 %132 
                                                      OpStore %133 %131 
                                Private f32* %134 = OpAccessChain %62 %132 
                                         f32 %135 = OpLoad %134 
                                  Input f32* %139 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFMul %135 %140 
                                Private f32* %142 = OpAccessChain %62 %132 
                                                      OpStore %142 %141 
                                Private f32* %144 = OpAccessChain %62 %132 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 37 %145 %146 
                                                      OpStore %143 %147 
                                Private f32* %148 = OpAccessChain %62 %132 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                Private f32* %152 = OpAccessChain %62 %132 
                                                      OpStore %152 %151 
                                         f32 %153 = OpLoad %143 
                                         f32 %154 = OpExtInst %1 31 %153 
                                                      OpStore %143 %154 
                         read_only Texture2D %157 = OpLoad %156 
                                     sampler %159 = OpLoad %158 
                  read_only Texture2DSampled %160 = OpSampledImage %157 %159 
                                       f32_2 %163 = OpLoad vs_TEXCOORD0 
                                       f32_4 %164 = OpImageSampleImplicitLod %160 %163 
                                         f32 %165 = OpCompositeExtract %164 3 
                                                      OpStore %155 %165 
                                         f32 %166 = OpLoad %155 
                                         f32 %167 = OpFNegate %166 
                                  Input f32* %169 = OpAccessChain vs_TEXCOORD1 %168 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFAdd %167 %170 
                                                      OpStore %155 %171 
                                         f32 %173 = OpLoad %155 
                                  Input f32* %174 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %173 %175 
                                Private f32* %177 = OpAccessChain %62 %132 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                                      OpStore %172 %179 
                                         f32 %180 = OpLoad %172 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %146 
                                                      OpStore %172 %182 
                                         f32 %183 = OpLoad %155 
                                  Input f32* %184 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                Private f32* %187 = OpAccessChain %62 %132 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                         f32 %190 = OpFAdd %186 %189 
                                Private f32* %191 = OpAccessChain %62 %132 
                                                      OpStore %191 %190 
                                         f32 %192 = OpLoad %143 
                                         f32 %193 = OpLoad %172 
                                         f32 %194 = OpFMul %192 %193 
                                                      OpStore %143 %194 
                                         f32 %195 = OpLoad %143 
                                       f32_4 %196 = OpCompositeConstruct %195 %195 %195 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFMul %196 %197 
                                       f32_4 %199 = OpLoad %73 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %9 %200 
                                Uniform f32* %202 = OpAccessChain %12 %201 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %12 %128 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                                      OpStore %143 %206 
                                         f32 %207 = OpLoad %143 
                                  Input f32* %208 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %207 %209 
                                                      OpStore %155 %210 
                                         f32 %211 = OpLoad %143 
                                  Input f32* %212 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                         f32 %215 = OpFAdd %214 %146 
                                                      OpStore %143 %215 
                                         f32 %216 = OpLoad %155 
                                         f32 %217 = OpFMul %216 %150 
                                Private f32* %218 = OpAccessChain %62 %132 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFAdd %217 %219 
                                Private f32* %221 = OpAccessChain %62 %132 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %62 %132 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpLoad %143 
                                         f32 %225 = OpFDiv %223 %224 
                                Private f32* %226 = OpAccessChain %62 %132 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %62 %132 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpExtInst %1 43 %228 %181 %146 
                                Private f32* %230 = OpAccessChain %62 %132 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %62 %132 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                         f32 %234 = OpFAdd %233 %146 
                                Private f32* %235 = OpAccessChain %62 %132 
                                                      OpStore %235 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %62 
                                       f32_4 %238 = OpVectorShuffle %237 %237 0 0 0 0 
                                       f32_4 %239 = OpFMul %236 %238 
                                                      OpStore %73 %239 
                                Private f32* %240 = OpAccessChain %9 %106 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFNegate %241 
                                Private f32* %243 = OpAccessChain %62 %132 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                         f32 %246 = OpFAdd %245 %146 
                                Private f32* %247 = OpAccessChain %9 %132 
                                                      OpStore %247 %246 
                         read_only Texture2D %249 = OpLoad %156 
                                     sampler %250 = OpLoad %158 
                  read_only Texture2DSampled %251 = OpSampledImage %249 %250 
                                       f32_4 %253 = OpLoad vs_TEXCOORD4 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_4 %255 = OpImageSampleImplicitLod %251 %254 
                                         f32 %256 = OpCompositeExtract %255 3 
                                                      OpStore %248 %256 
                                         f32 %257 = OpLoad %248 
                                  Input f32* %258 = OpAccessChain vs_TEXCOORD4 %168 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                  Input f32* %261 = OpAccessChain vs_TEXCOORD4 %106 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                         f32 %264 = OpFAdd %260 %263 
                                                      OpStore %248 %264 
                                         f32 %265 = OpLoad %248 
                                         f32 %266 = OpExtInst %1 43 %265 %181 %146 
                                                      OpStore %248 %266 
                                         f32 %267 = OpLoad %248 
                                       f32_4 %268 = OpCompositeConstruct %267 %267 %267 %267 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpFMul %268 %270 
                                                      OpStore %62 %271 
                                       f32_4 %272 = OpLoad %62 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %273 0 0 0 0 
                                       f32_4 %275 = OpFMul %272 %274 
                                       f32_4 %276 = OpLoad %73 
                                       f32_4 %277 = OpFAdd %275 %276 
                                                      OpStore %9 %277 
                              Uniform f32_4* %279 = OpAccessChain %12 %278 
                                       f32_4 %280 = OpLoad %279 
                                       f32_2 %281 = OpVectorShuffle %280 %280 0 1 
                                       f32_2 %282 = OpFNegate %281 
                              Uniform f32_4* %283 = OpAccessChain %12 %278 
                                       f32_4 %284 = OpLoad %283 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_2 %286 = OpFAdd %282 %285 
                                       f32_4 %287 = OpLoad %62 
                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 2 3 
                                                      OpStore %62 %288 
                                       f32_4 %289 = OpLoad %62 
                                       f32_2 %290 = OpVectorShuffle %289 %289 0 1 
                                       f32_4 %292 = OpLoad vs_TEXCOORD2 
                                       f32_2 %293 = OpVectorShuffle %292 %292 0 1 
                                       f32_2 %294 = OpExtInst %1 4 %293 
                                       f32_2 %295 = OpFNegate %294 
                                       f32_2 %296 = OpFAdd %290 %295 
                                       f32_4 %297 = OpLoad %62 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 2 3 
                                                      OpStore %62 %298 
                                       f32_4 %299 = OpLoad %62 
                                       f32_2 %300 = OpVectorShuffle %299 %299 0 1 
                                       f32_4 %301 = OpLoad vs_TEXCOORD2 
                                       f32_2 %302 = OpVectorShuffle %301 %301 2 3 
                                       f32_2 %303 = OpFMul %300 %302 
                                       f32_4 %304 = OpLoad %62 
                                       f32_4 %305 = OpVectorShuffle %304 %303 4 5 2 3 
                                                      OpStore %62 %305 
                                       f32_4 %306 = OpLoad %62 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpCompositeConstruct %181 %181 
                                       f32_2 %309 = OpCompositeConstruct %146 %146 
                                       f32_2 %310 = OpExtInst %1 43 %307 %308 %309 
                                       f32_4 %311 = OpLoad %62 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 2 3 
                                                      OpStore %62 %312 
                                Private f32* %313 = OpAccessChain %62 %137 
                                         f32 %314 = OpLoad %313 
                                Private f32* %315 = OpAccessChain %62 %132 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFMul %314 %316 
                                Private f32* %318 = OpAccessChain %62 %132 
                                                      OpStore %318 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpLoad %62 
                                       f32_4 %321 = OpVectorShuffle %320 %320 0 0 0 0 
                                       f32_4 %322 = OpFMul %319 %321 
                                                      OpStore %9 %322 
                                       f32_4 %325 = OpLoad %9 
                                       f32_4 %326 = OpLoad %63 
                                       f32_4 %327 = OpVectorShuffle %326 %326 3 3 3 3 
                                       f32_4 %328 = OpFMul %325 %327 
                                                      OpStore %324 %328 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w + (-vs_TEXCOORD1.x);
    u_xlat4 = (-u_xlat0.w) + vs_TEXCOORD1.z;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat8.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
    u_xlat4 = u_xlat8.x * u_xlat12;
    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat1 = texture(_OutlineTex, u_xlat8.xy);
    u_xlat1 = u_xlat1 * _OutlineColor;
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat3 = texture(_FaceTex, u_xlat8.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.w = u_xlat3.w * _FaceColor.w;
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat5 = u_xlat0.w * u_xlat1.x + -0.00100000005;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    u_xlatb0 = u_xlat5<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 517
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %183 %193 %236 %358 %452 %485 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate vs_TEXCOORD0 Location 129 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate vs_TEXCOORD2 Location 183 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 452 
                                                      OpDecorate vs_TEXCOORD5 Location 485 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_4* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %10 %17 
                                              %19 = OpTypeArray %10 %17 
                                              %20 = OpTypeArray %10 %17 
                                              %21 = OpTypeArray %10 %17 
                                              %22 = OpTypeArray %10 %17 
                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %6 %10 %10 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 13 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 14 
                                              %38 = OpTypePointer Private %10 
                               Private f32_4* %39 = OpVariable Private 
                                          i32 %42 = OpConstant 2 
                                          i32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Uniform %10 
                                          i32 %48 = OpConstant 0 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %65 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                               Private f32_4* %89 = OpVariable Private 
                                          i32 %92 = OpConstant 5 
                                         u32 %117 = OpConstant 1 
                                             %118 = OpTypeArray %6 %117 
                                             %119 = OpTypeStruct %10 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %123 = OpTypePointer Output %10 
                               Output f32_4* %125 = OpVariable Output 
                                Input f32_4* %126 = OpVariable Input 
                                             %128 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %130 = OpTypePointer Input %13 
                                Input f32_2* %131 = OpVariable Input 
                                             %133 = OpTypePointer Private %13 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %138 = OpConstant 4 
                                         i32 %154 = OpConstant 19 
                                         i32 %157 = OpConstant 20 
                                             %166 = OpTypePointer Private %6 
                                Private f32* %167 = OpVariable Private 
                                         i32 %171 = OpConstant 16 
                                         i32 %174 = OpConstant 17 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %190 = OpConstant 0 
                                Private f32* %192 = OpVariable Private 
                                Input f32_2* %193 = OpVariable Input 
                                             %194 = OpTypePointer Input %6 
                                         i32 %198 = OpConstant 18 
                                         i32 %202 = OpConstant 22 
                                         f32 %205 = OpConstant 3.674022E-40 
                                         i32 %214 = OpConstant 21 
                                             %235 = OpTypePointer Input %7 
                                Input f32_3* %236 = OpVariable Input 
                                         u32 %254 = OpConstant 2 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 10 
                                         i32 %326 = OpConstant 11 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 12 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 15 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %451 = OpTypePointer Output %7 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         f32 %463 = OpConstant 3.674022E-40 
                                         f32 %473 = OpConstant 3.674022E-40 
                                         f32 %480 = OpConstant 3.674022E-40 
                                       f32_2 %481 = OpConstantComposite %480 %480 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %488 = OpConstant 23 
                                         i32 %501 = OpConstant 24 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %15 %34 
                                        f32_3 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
                                                      OpStore %9 %37 
                                        f32_3 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFMul %41 %46 
                                                      OpStore %39 %47 
                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %39 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore %39 %55 
                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %12 
                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %39 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %39 %62 
                                        f32_4 %64 = OpLoad %39 
                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFAdd %64 %67 
                                                      OpStore %63 %68 
                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_4 %72 = OpLoad %12 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %39 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %39 %79 
                                        f32_4 %80 = OpLoad %39 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpFNegate %81 
                               Uniform f32_3* %84 = OpAccessChain %25 %48 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpFAdd %82 %85 
                                        f32_4 %87 = OpLoad %39 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %39 %88 
                                        f32_4 %90 = OpLoad %63 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpFMul %91 %94 
                                                      OpStore %89 %95 
                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %63 
                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %89 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %89 %102 
                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %63 
                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %89 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %89 %109 
                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %63 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %89 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %63 %116 
                                       f32_4 %122 = OpLoad %63 
                               Output f32_4* %124 = OpAccessChain %121 %48 
                                                      OpStore %124 %122 
                                       f32_4 %127 = OpLoad %126 
                                                      OpStore %125 %127 
                                       f32_2 %132 = OpLoad %131 
                                                      OpStore vs_TEXCOORD0 %132 
                              Uniform f32_4* %135 = OpAccessChain %25 %43 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 1 1 
                              Uniform f32_4* %139 = OpAccessChain %25 %138 %43 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                                                      OpStore %134 %142 
                              Uniform f32_4* %143 = OpAccessChain %25 %138 %48 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                              Uniform f32_4* %146 = OpAccessChain %25 %43 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 0 
                                       f32_2 %149 = OpFMul %145 %148 
                                       f32_2 %150 = OpLoad %134 
                                       f32_2 %151 = OpFAdd %149 %150 
                                                      OpStore %134 %151 
                                       f32_2 %152 = OpLoad %134 
                                       f32_2 %153 = OpExtInst %1 4 %152 
                                Uniform f32* %155 = OpAccessChain %25 %154 
                                         f32 %156 = OpLoad %155 
                                Uniform f32* %158 = OpAccessChain %25 %157 
                                         f32 %159 = OpLoad %158 
                                       f32_2 %160 = OpCompositeConstruct %156 %159 
                                       f32_2 %161 = OpFMul %153 %160 
                                                      OpStore %134 %161 
                                       f32_4 %162 = OpLoad %63 
                                       f32_2 %163 = OpVectorShuffle %162 %162 3 3 
                                       f32_2 %164 = OpLoad %134 
                                       f32_2 %165 = OpFDiv %163 %164 
                                                      OpStore %134 %165 
                                       f32_2 %168 = OpLoad %134 
                                       f32_2 %169 = OpLoad %134 
                                         f32 %170 = OpDot %168 %169 
                                                      OpStore %167 %170 
                                Uniform f32* %172 = OpAccessChain %25 %171 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %175 = OpAccessChain %25 %174 
                                         f32 %176 = OpLoad %175 
                                       f32_2 %177 = OpCompositeConstruct %173 %176 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %181 = OpLoad %134 
                                       f32_2 %182 = OpFAdd %180 %181 
                                                      OpStore %134 %182 
                                       f32_2 %184 = OpLoad %134 
                                       f32_2 %185 = OpFDiv %179 %184 
                                       f32_4 %186 = OpLoad vs_TEXCOORD2 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %187 
                                         f32 %188 = OpLoad %167 
                                         f32 %189 = OpExtInst %1 32 %188 
                                Private f32* %191 = OpAccessChain %134 %190 
                                                      OpStore %191 %189 
                                  Input f32* %195 = OpAccessChain %193 %117 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpExtInst %1 4 %196 
                                Uniform f32* %199 = OpAccessChain %25 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %197 %200 
                                                      OpStore %192 %201 
                                Uniform f32* %203 = OpAccessChain %25 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFAdd %204 %205 
                                                      OpStore %167 %206 
                                         f32 %207 = OpLoad %192 
                                         f32 %208 = OpLoad %167 
                                         f32 %209 = OpFMul %207 %208 
                                                      OpStore %192 %209 
                                         f32 %210 = OpLoad %192 
                                Private f32* %211 = OpAccessChain %134 %190 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                                      OpStore %167 %213 
                                Uniform f32* %215 = OpAccessChain %25 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                         f32 %218 = OpFAdd %217 %205 
                                Private f32* %219 = OpAccessChain %63 %190 
                                                      OpStore %219 %218 
                                         f32 %220 = OpLoad %167 
                                         f32 %221 = OpExtInst %1 4 %220 
                                Private f32* %222 = OpAccessChain %63 %190 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %221 %223 
                                Private f32* %225 = OpAccessChain %63 %190 
                                                      OpStore %225 %224 
                                Private f32* %226 = OpAccessChain %134 %190 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpLoad %192 
                                         f32 %229 = OpFMul %227 %228 
                                Private f32* %230 = OpAccessChain %63 %190 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFNegate %231 
                                         f32 %233 = OpFAdd %229 %232 
                                Private f32* %234 = OpAccessChain %134 %190 
                                                      OpStore %234 %233 
                                       f32_3 %237 = OpLoad %236 
                              Uniform f32_4* %238 = OpAccessChain %25 %65 %48 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                         f32 %241 = OpDot %237 %240 
                                Private f32* %242 = OpAccessChain %89 %190 
                                                      OpStore %242 %241 
                                       f32_3 %243 = OpLoad %236 
                              Uniform f32_4* %244 = OpAccessChain %25 %65 %43 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                         f32 %247 = OpDot %243 %246 
                                Private f32* %248 = OpAccessChain %89 %117 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %236 
                              Uniform f32_4* %250 = OpAccessChain %25 %65 %42 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                         f32 %253 = OpDot %249 %252 
                                Private f32* %255 = OpAccessChain %89 %254 
                                                      OpStore %255 %253 
                                       f32_4 %256 = OpLoad %89 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %89 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                         f32 %260 = OpDot %257 %259 
                                                      OpStore %192 %260 
                                         f32 %261 = OpLoad %192 
                                         f32 %262 = OpExtInst %1 32 %261 
                                                      OpStore %192 %262 
                                         f32 %264 = OpLoad %192 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %39 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %39 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %192 %273 
                                         f32 %274 = OpLoad %192 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %192 %275 
                                         f32 %276 = OpLoad %192 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %39 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %89 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %89 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %89 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %192 %286 
                                         f32 %287 = OpLoad %192 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %134 %190 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %63 %190 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %134 %190 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %138 %65 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %134 %190 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %167 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %190 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %193 %117 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %205 %302 
                                Private f32* %321 = OpAccessChain %134 %190 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %192 %329 
                                Private f32* %330 = OpAccessChain %134 %190 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %192 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %134 %190 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %134 %190 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %178 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %134 %190 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %134 %190 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %134 %190 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %134 %190 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %254 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %190 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %192 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %205 
                                                      OpStore %167 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %167 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %167 %382 
                                         f32 %383 = OpLoad %167 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %192 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %167 %387 
                                Private f32* %388 = OpAccessChain %134 %190 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %167 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %190 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %134 %190 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %134 %190 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %192 
                                Private f32* %403 = OpAccessChain %134 %190 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %254 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %63 %412 
                                       f32_4 %413 = OpLoad %63 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %63 %416 
                                       f32_3 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %63 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_3 %426 = OpLoad %9 
                                       f32_3 %427 = OpVectorShuffle %426 %425 3 4 2 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %63 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_3 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %39 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %43 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                                      OpStore %9 %442 
                              Uniform f32_4* %443 = OpAccessChain %25 %438 %48 
                                       f32_4 %444 = OpLoad %443 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_4 %446 = OpLoad %39 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 0 0 
                                       f32_3 %448 = OpFMul %445 %447 
                                       f32_3 %449 = OpLoad %9 
                                       f32_3 %450 = OpFAdd %448 %449 
                                                      OpStore %9 %450 
                              Uniform f32_4* %453 = OpAccessChain %25 %438 %42 
                                       f32_4 %454 = OpLoad %453 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %39 
                                       f32_3 %457 = OpVectorShuffle %456 %456 2 2 2 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %9 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore vs_TEXCOORD3 %460 
                                  Input f32* %461 = OpAccessChain %193 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %464 = OpFMul %462 %463 
                                Private f32* %465 = OpAccessChain %9 %190 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %9 %190 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpExtInst %1 8 %467 
                                Private f32* %469 = OpAccessChain %134 %190 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %134 %190 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                         f32 %474 = OpFMul %472 %473 
                                  Input f32* %475 = OpAccessChain %193 %190 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFAdd %474 %476 
                                Private f32* %478 = OpAccessChain %134 %117 
                                                      OpStore %478 %477 
                                       f32_2 %479 = OpLoad %134 
                                       f32_2 %482 = OpFMul %479 %481 
                                       f32_3 %483 = OpLoad %9 
                                       f32_3 %484 = OpVectorShuffle %483 %482 3 4 2 
                                                      OpStore %9 %484 
                                       f32_3 %486 = OpLoad %9 
                                       f32_2 %487 = OpVectorShuffle %486 %486 0 1 
                              Uniform f32_4* %489 = OpAccessChain %25 %488 
                                       f32_4 %490 = OpLoad %489 
                                       f32_2 %491 = OpVectorShuffle %490 %490 0 1 
                                       f32_2 %492 = OpFMul %487 %491 
                              Uniform f32_4* %493 = OpAccessChain %25 %488 
                                       f32_4 %494 = OpLoad %493 
                                       f32_2 %495 = OpVectorShuffle %494 %494 2 3 
                                       f32_2 %496 = OpFAdd %492 %495 
                                       f32_4 %497 = OpLoad vs_TEXCOORD5 
                                       f32_4 %498 = OpVectorShuffle %497 %496 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %498 
                                       f32_3 %499 = OpLoad %9 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                              Uniform f32_4* %502 = OpAccessChain %25 %501 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_2 %505 = OpFMul %500 %504 
                              Uniform f32_4* %506 = OpAccessChain %25 %501 
                                       f32_4 %507 = OpLoad %506 
                                       f32_2 %508 = OpVectorShuffle %507 %507 2 3 
                                       f32_2 %509 = OpFAdd %505 %508 
                                       f32_4 %510 = OpLoad vs_TEXCOORD5 
                                       f32_4 %511 = OpVectorShuffle %510 %509 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %511 
                                 Output f32* %512 = OpAccessChain %121 %48 %117 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFNegate %513 
                                 Output f32* %515 = OpAccessChain %121 %48 %117 
                                                      OpStore %515 %514 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 323
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %35 %130 %157 %266 %307 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 22 
                                                      OpDecorate vs_TEXCOORD1 Location 35 
                                                      OpMemberDecorate %66 0 Offset 66 
                                                      OpMemberDecorate %66 1 Offset 66 
                                                      OpMemberDecorate %66 2 Offset 66 
                                                      OpMemberDecorate %66 3 Offset 66 
                                                      OpMemberDecorate %66 4 Offset 66 
                                                      OpMemberDecorate %66 5 Offset 66 
                                                      OpMemberDecorate %66 6 Offset 66 
                                                      OpMemberDecorate %66 7 Offset 66 
                                                      OpMemberDecorate %66 8 Offset 66 
                                                      OpMemberDecorate %66 9 Offset 66 
                                                      OpMemberDecorate %66 10 Offset 66 
                                                      OpDecorate %66 Block 
                                                      OpDecorate %68 DescriptorSet 68 
                                                      OpDecorate %68 Binding 68 
                                                      OpDecorate vs_TEXCOORD5 Location 130 
                                                      OpDecorate %135 DescriptorSet 135 
                                                      OpDecorate %135 Binding 135 
                                                      OpDecorate %137 DescriptorSet 137 
                                                      OpDecorate %137 Binding 137 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %179 DescriptorSet 179 
                                                      OpDecorate %179 Binding 179 
                                                      OpDecorate %181 DescriptorSet 181 
                                                      OpDecorate %181 Binding 181 
                                                      OpDecorate vs_TEXCOORD2 Location 266 
                                                      OpDecorate %307 Location 307 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypePointer UniformConstant %10 
         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                              %14 = OpTypeSampler 
                                              %15 = OpTypePointer UniformConstant %14 
                     UniformConstant sampler* %16 = OpVariable UniformConstant 
                                              %18 = OpTypeSampledImage %10 
                                              %20 = OpTypeVector %6 2 
                                              %21 = OpTypePointer Input %20 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 3 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %31 = OpVariable Private 
                                              %34 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                              %36 = OpTypePointer Input %6 
                                          u32 %44 = OpConstant 2 
                                              %49 = OpTypeBool 
                                              %50 = OpTypePointer Private %49 
                                Private bool* %51 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                              %56 = OpTypeInt 32 1 
                                          i32 %57 = OpConstant 0 
                                          i32 %58 = OpConstant 1 
                                          i32 %60 = OpConstant -1 
                                              %66 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 %7 
                                              %67 = OpTypePointer Uniform %66 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4;}* %68 = OpVariable Uniform 
                                          i32 %69 = OpConstant 8 
                                              %70 = OpTypePointer Uniform %6 
                                          i32 %73 = OpConstant 9 
                                          u32 %78 = OpConstant 1 
                                              %82 = OpTypePointer Private %20 
                               Private f32_2* %83 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                 Private f32* %95 = OpVariable Private 
                                         i32 %118 = OpConstant 5 
                                         i32 %121 = OpConstant 6 
                                             %125 = OpTypePointer Uniform %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                              Private f32_4* %134 = OpVariable Private 
        UniformConstant read_only Texture2D* %135 = OpVariable UniformConstant 
                    UniformConstant sampler* %137 = OpVariable UniformConstant 
                                         i32 %143 = OpConstant 7 
                                             %147 = OpTypeVector %6 3 
                                             %155 = OpTypePointer Private %147 
                              Private f32_3* %156 = OpVariable Private 
                                Input f32_4* %157 = OpVariable Input 
                                         i32 %160 = OpConstant 3 
                                         i32 %167 = OpConstant 2 
                              Private f32_4* %178 = OpVariable Private 
        UniformConstant read_only Texture2D* %179 = OpVariable UniformConstant 
                    UniformConstant sampler* %181 = OpVariable UniformConstant 
                                         i32 %212 = OpConstant 4 
                                         i32 %253 = OpConstant 10 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                Private f32* %294 = OpVariable Private 
                                         f32 %300 = OpConstant 3.674022E-40 
                                             %306 = OpTypePointer Output %7 
                               Output f32_4* %307 = OpVariable Output 
                               Private bool* %312 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 3 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                                      OpStore %30 %27 
                                 Private f32* %32 = OpAccessChain %9 %28 
                                          f32 %33 = OpLoad %32 
                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFNegate %38 
                                          f32 %40 = OpFAdd %33 %39 
                                                      OpStore %31 %40 
                                 Private f32* %41 = OpAccessChain %9 %28 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                   Input f32* %45 = OpAccessChain vs_TEXCOORD1 %44 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFAdd %43 %46 
                                 Private f32* %48 = OpAccessChain %9 %28 
                                                      OpStore %48 %47 
                                          f32 %52 = OpLoad %31 
                                         bool %54 = OpFOrdLessThan %52 %53 
                                                      OpStore %51 %54 
                                         bool %55 = OpLoad %51 
                                          i32 %59 = OpSelect %55 %58 %57 
                                          i32 %61 = OpIMul %59 %60 
                                         bool %62 = OpINotEqual %61 %57 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                                      OpKill
                                              %64 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %68 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %74 = OpAccessChain %68 %73 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFMul %72 %75 
                                                      OpStore %31 %76 
                                          f32 %77 = OpLoad %31 
                                   Input f32* %79 = OpAccessChain vs_TEXCOORD1 %78 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %77 %80 
                                                      OpStore %31 %81 
                                          f32 %84 = OpLoad %31 
                                          f32 %86 = OpExtInst %1 37 %84 %85 
                                 Private f32* %87 = OpAccessChain %83 %28 
                                                      OpStore %87 %86 
                                          f32 %88 = OpLoad %31 
                                          f32 %90 = OpFMul %88 %89 
                                                      OpStore %31 %90 
                                 Private f32* %91 = OpAccessChain %83 %28 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpExtInst %1 31 %92 
                                 Private f32* %94 = OpAccessChain %83 %28 
                                                      OpStore %94 %93 
                                 Private f32* %96 = OpAccessChain %9 %28 
                                          f32 %97 = OpLoad %96 
                                   Input f32* %98 = OpAccessChain vs_TEXCOORD1 %78 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %97 %99 
                                         f32 %101 = OpLoad %31 
                                         f32 %102 = OpFAdd %100 %101 
                                                      OpStore %95 %102 
                                         f32 %103 = OpLoad %95 
                                         f32 %104 = OpExtInst %1 43 %103 %53 %85 
                                                      OpStore %95 %104 
                                Private f32* %105 = OpAccessChain %9 %28 
                                         f32 %106 = OpLoad %105 
                                  Input f32* %107 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFMul %106 %108 
                                         f32 %110 = OpLoad %31 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %109 %111 
                                Private f32* %113 = OpAccessChain %9 %28 
                                                      OpStore %113 %112 
                                Private f32* %114 = OpAccessChain %83 %28 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpLoad %95 
                                         f32 %117 = OpFMul %115 %116 
                                                      OpStore %31 %117 
                                Uniform f32* %119 = OpAccessChain %68 %118 
                                         f32 %120 = OpLoad %119 
                                Uniform f32* %122 = OpAccessChain %68 %121 
                                         f32 %123 = OpLoad %122 
                                       f32_2 %124 = OpCompositeConstruct %120 %123 
                              Uniform f32_4* %126 = OpAccessChain %68 %57 
                                       f32_4 %127 = OpLoad %126 
                                       f32_2 %128 = OpVectorShuffle %127 %127 1 1 
                                       f32_2 %129 = OpFMul %124 %128 
                                       f32_4 %131 = OpLoad vs_TEXCOORD5 
                                       f32_2 %132 = OpVectorShuffle %131 %131 2 3 
                                       f32_2 %133 = OpFAdd %129 %132 
                                                      OpStore %83 %133 
                         read_only Texture2D %136 = OpLoad %135 
                                     sampler %138 = OpLoad %137 
                  read_only Texture2DSampled %139 = OpSampledImage %136 %138 
                                       f32_2 %140 = OpLoad %83 
                                       f32_4 %141 = OpImageSampleImplicitLod %139 %140 
                                                      OpStore %134 %141 
                                       f32_4 %142 = OpLoad %134 
                              Uniform f32_4* %144 = OpAccessChain %68 %143 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpFMul %142 %145 
                                                      OpStore %134 %146 
                                       f32_4 %148 = OpLoad %134 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_4 %150 = OpLoad %134 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %134 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %134 %154 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_4* %161 = OpAccessChain %68 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFMul %159 %163 
                                                      OpStore %156 %164 
                                Uniform f32* %165 = OpAccessChain %68 %58 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %168 = OpAccessChain %68 %167 
                                         f32 %169 = OpLoad %168 
                                       f32_2 %170 = OpCompositeConstruct %166 %169 
                              Uniform f32_4* %171 = OpAccessChain %68 %57 
                                       f32_4 %172 = OpLoad %171 
                                       f32_2 %173 = OpVectorShuffle %172 %172 1 1 
                                       f32_2 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad vs_TEXCOORD5 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                                      OpStore %83 %177 
                         read_only Texture2D %180 = OpLoad %179 
                                     sampler %182 = OpLoad %181 
                  read_only Texture2DSampled %183 = OpSampledImage %180 %182 
                                       f32_2 %184 = OpLoad %83 
                                       f32_4 %185 = OpImageSampleImplicitLod %183 %184 
                                                      OpStore %178 %185 
                                       f32_3 %186 = OpLoad %156 
                                       f32_4 %187 = OpLoad %178 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFMul %186 %188 
                                                      OpStore %156 %189 
                                Private f32* %190 = OpAccessChain %178 %26 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %68 %160 %26 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Private f32* %195 = OpAccessChain %178 %26 
                                                      OpStore %195 %194 
                                       f32_3 %196 = OpLoad %156 
                                       f32_4 %197 = OpLoad %178 
                                       f32_3 %198 = OpVectorShuffle %197 %197 3 3 3 
                                       f32_3 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %178 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                                      OpStore %178 %201 
                                       f32_4 %202 = OpLoad %134 
                                       f32_4 %203 = OpLoad %178 
                                       f32_4 %204 = OpFNegate %203 
                                       f32_4 %205 = OpFAdd %202 %204 
                                                      OpStore %134 %205 
                                         f32 %206 = OpLoad %31 
                                       f32_4 %207 = OpCompositeConstruct %206 %206 %206 %206 
                                       f32_4 %208 = OpLoad %134 
                                       f32_4 %209 = OpFMul %207 %208 
                                       f32_4 %210 = OpLoad %178 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %134 %211 
                                Uniform f32* %213 = OpAccessChain %68 %212 
                                         f32 %214 = OpLoad %213 
                                Uniform f32* %215 = OpAccessChain %68 %73 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                                      OpStore %31 %217 
                                         f32 %218 = OpLoad %31 
                                  Input f32* %219 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFMul %218 %220 
                                Private f32* %222 = OpAccessChain %83 %28 
                                                      OpStore %222 %221 
                                         f32 %223 = OpLoad %31 
                                  Input f32* %224 = OpAccessChain vs_TEXCOORD1 %78 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFMul %223 %225 
                                         f32 %227 = OpFAdd %226 %85 
                                                      OpStore %31 %227 
                                Private f32* %228 = OpAccessChain %83 %28 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFMul %229 %89 
                                Private f32* %231 = OpAccessChain %9 %28 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFAdd %230 %232 
                                Private f32* %234 = OpAccessChain %9 %28 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %9 %28 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpLoad %31 
                                         f32 %238 = OpFDiv %236 %237 
                                Private f32* %239 = OpAccessChain %9 %28 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %28 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpExtInst %1 43 %241 %53 %85 
                                Private f32* %243 = OpAccessChain %9 %28 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %9 %28 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %246 %85 
                                Private f32* %248 = OpAccessChain %9 %28 
                                                      OpStore %248 %247 
                                       f32_4 %249 = OpLoad %9 
                                       f32_4 %250 = OpVectorShuffle %249 %249 0 0 0 0 
                                       f32_4 %251 = OpLoad %134 
                                       f32_4 %252 = OpFMul %250 %251 
                                                      OpStore %9 %252 
                              Uniform f32_4* %254 = OpAccessChain %68 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFNegate %256 
                              Uniform f32_4* %258 = OpAccessChain %68 %253 
                                       f32_4 %259 = OpLoad %258 
                                       f32_2 %260 = OpVectorShuffle %259 %259 2 3 
                                       f32_2 %261 = OpFAdd %257 %260 
                                       f32_4 %262 = OpLoad %134 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                      OpStore %134 %263 
                                       f32_4 %264 = OpLoad %134 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %267 = OpLoad vs_TEXCOORD2 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 4 %268 
                                       f32_2 %270 = OpFNegate %269 
                                       f32_2 %271 = OpFAdd %265 %270 
                                       f32_4 %272 = OpLoad %134 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                      OpStore %134 %273 
                                       f32_4 %274 = OpLoad %134 
                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
                                       f32_4 %276 = OpLoad vs_TEXCOORD2 
                                       f32_2 %277 = OpVectorShuffle %276 %276 2 3 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_4 %279 = OpLoad %134 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 2 3 
                                                      OpStore %134 %280 
                                       f32_4 %281 = OpLoad %134 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_2 %283 = OpCompositeConstruct %53 %53 
                                       f32_2 %284 = OpCompositeConstruct %85 %85 
                                       f32_2 %285 = OpExtInst %1 43 %282 %283 %284 
                                       f32_4 %286 = OpLoad %134 
                                       f32_4 %287 = OpVectorShuffle %286 %285 4 5 2 3 
                                                      OpStore %134 %287 
                                Private f32* %288 = OpAccessChain %134 %78 
                                         f32 %289 = OpLoad %288 
                                Private f32* %290 = OpAccessChain %134 %28 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpFMul %289 %291 
                                Private f32* %293 = OpAccessChain %134 %28 
                                                      OpStore %293 %292 
                                Private f32* %295 = OpAccessChain %9 %26 
                                         f32 %296 = OpLoad %295 
                                Private f32* %297 = OpAccessChain %134 %28 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFMul %296 %298 
                                         f32 %301 = OpFAdd %299 %300 
                                                      OpStore %294 %301 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpLoad %134 
                                       f32_4 %304 = OpVectorShuffle %303 %303 0 0 0 0 
                                       f32_4 %305 = OpFMul %302 %304 
                                                      OpStore %9 %305 
                                       f32_4 %308 = OpLoad %9 
                                       f32_4 %309 = OpLoad %157 
                                       f32_4 %310 = OpVectorShuffle %309 %309 3 3 3 3 
                                       f32_4 %311 = OpFMul %308 %310 
                                                      OpStore %307 %311 
                                         f32 %313 = OpLoad %294 
                                        bool %314 = OpFOrdLessThan %313 %53 
                                                      OpStore %312 %314 
                                        bool %315 = OpLoad %312 
                                         i32 %316 = OpSelect %315 %58 %57 
                                         i32 %317 = OpIMul %316 %60 
                                        bool %318 = OpINotEqual %317 %57 
                                                      OpSelectionMerge %320 None 
                                                      OpBranchConditional %318 %319 %320 
                                             %319 = OpLabel 
                                                      OpKill
                                             %320 = OpLabel 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	vec4 _UnderlayColor;
uniform 	float _UnderlayOffsetX;
uniform 	float _UnderlayOffsetY;
uniform 	float _UnderlayDilate;
uniform 	float _UnderlaySoftness;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioC;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_COLOR1;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xyw = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyw;
    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
    u_xlat0.x = u_xlat1.x * u_xlat6.x + 1.0;
    u_xlat0.x = u_xlat6.x / u_xlat0.x;
    u_xlat4 = u_xlat8.x * u_xlat0.x + -0.5;
    u_xlat8.x = u_xlat0.x * u_xlat1.y;
    u_xlat1.xy = (-u_xlat1.zw) * vec2(_GradientScale);
    u_xlat1.xy = u_xlat1.xy / vec2(_TextureWidth, _TextureHeight);
    vs_TEXCOORD4.xy = u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD4.w = (-u_xlat8.x) * 0.5 + u_xlat4;
    vs_COLOR1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
    vs_COLOR1.w = _UnderlayColor.w;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_COLOR1;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat0 = u_xlat0 * _OutlineColor;
    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat2.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat2 = texture(_FaceTex, u_xlat2.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.w = u_xlat2.w * _FaceColor.w;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.www;
    u_xlat0 = u_xlat0 + (-u_xlat2);
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD1.y;
    u_xlat5 = min(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9 = (-u_xlat3.w) + vs_TEXCOORD1.z;
    u_xlat13 = u_xlat9 * vs_TEXCOORD1.y + u_xlat1.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat1.x = u_xlat9 * vs_TEXCOORD1.y + (-u_xlat1.x);
    u_xlat5 = u_xlat5 * u_xlat13;
    u_xlat0 = vec4(u_xlat5) * u_xlat0 + u_xlat2;
    u_xlat5 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y + 1.0;
    u_xlat1.x = u_xlat9 * 0.5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = (-u_xlat0.w) * u_xlat1.x + 1.0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat4 = u_xlat1.w * vs_TEXCOORD4.z + (-vs_TEXCOORD4.w);
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat1 = vec4(u_xlat4) * vs_COLOR1;
    u_xlat0 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat5 = u_xlat0.w * u_xlat1.x + -0.00100000005;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
    u_xlatb0 = u_xlat5<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 631
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %120 %124 %125 %128 %130 %182 %192 %235 %358 %457 %544 %561 %599 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpMemberDecorate %23 16 Offset 23 
                                                      OpMemberDecorate %23 17 Offset 23 
                                                      OpMemberDecorate %23 18 Offset 23 
                                                      OpMemberDecorate %23 19 Offset 23 
                                                      OpMemberDecorate %23 20 Offset 23 
                                                      OpMemberDecorate %23 21 Offset 23 
                                                      OpMemberDecorate %23 22 Offset 23 
                                                      OpMemberDecorate %23 23 Offset 23 
                                                      OpMemberDecorate %23 24 Offset 23 
                                                      OpMemberDecorate %23 25 Offset 23 
                                                      OpMemberDecorate %23 26 Offset 23 
                                                      OpMemberDecorate %23 27 Offset 23 
                                                      OpMemberDecorate %23 28 Offset 23 
                                                      OpMemberDecorate %23 29 Offset 23 
                                                      OpMemberDecorate %23 30 Offset 23 
                                                      OpMemberDecorate %23 31 Offset 23 
                                                      OpMemberDecorate %23 32 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate vs_TEXCOORD0 Location 128 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate vs_TEXCOORD2 Location 182 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %235 Location 235 
                                                      OpDecorate vs_TEXCOORD1 Location 358 
                                                      OpDecorate vs_TEXCOORD3 Location 457 
                                                      OpDecorate vs_TEXCOORD4 Location 544 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate vs_TEXCOORD5 Location 599 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeArray %7 %17 
                                              %23 = OpTypeStruct %15 %7 %18 %19 %20 %21 %6 %6 %6 %22 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
                                              %26 = OpTypeInt 32 1 
                                          i32 %27 = OpConstant 19 
                                              %28 = OpTypePointer Uniform %6 
                                          i32 %31 = OpConstant 20 
                               Private f32_4* %38 = OpVariable Private 
                                          i32 %41 = OpConstant 2 
                                          i32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Uniform %7 
                                          i32 %47 = OpConstant 0 
                               Private f32_4* %62 = OpVariable Private 
                                          i32 %64 = OpConstant 3 
                                              %82 = OpTypePointer Uniform %15 
                               Private f32_4* %88 = OpVariable Private 
                                          i32 %91 = OpConstant 5 
                                         u32 %116 = OpConstant 1 
                                             %117 = OpTypeArray %6 %116 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %122 = OpTypePointer Output %7 
                               Output f32_4* %124 = OpVariable Output 
                                Input f32_4* %125 = OpVariable Input 
                                             %127 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %129 = OpTypePointer Input %12 
                                Input f32_2* %130 = OpVariable Input 
                                             %132 = OpTypePointer Private %12 
                              Private f32_2* %133 = OpVariable Private 
                                         i32 %137 = OpConstant 4 
                                         i32 %153 = OpConstant 27 
                                         i32 %156 = OpConstant 28 
                                             %165 = OpTypePointer Private %6 
                                Private f32* %166 = OpVariable Private 
                                         i32 %170 = OpConstant 22 
                                         i32 %173 = OpConstant 23 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_2 %178 = OpConstantComposite %177 %177 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %189 = OpConstant 0 
                                Private f32* %191 = OpVariable Private 
                                Input f32_2* %192 = OpVariable Input 
                                             %193 = OpTypePointer Input %6 
                                         i32 %197 = OpConstant 26 
                                         i32 %201 = OpConstant 30 
                                         f32 %204 = OpConstant 3.674022E-40 
                                         i32 %213 = OpConstant 29 
                                             %234 = OpTypePointer Input %15 
                                Input f32_3* %235 = OpVariable Input 
                                         u32 %253 = OpConstant 2 
                                             %262 = OpTypePointer Private %15 
                              Private f32_3* %263 = OpVariable Private 
                                             %296 = OpTypeBool 
                                             %297 = OpTypePointer Private %296 
                               Private bool* %298 = OpVariable Private 
                                         u32 %299 = OpConstant 3 
                                         f32 %302 = OpConstant 3.674022E-40 
                                             %305 = OpTypePointer Function %6 
                               Private bool* %315 = OpVariable Private 
                                         i32 %322 = OpConstant 15 
                                         i32 %326 = OpConstant 16 
                                         i32 %341 = OpConstant 6 
                                         i32 %348 = OpConstant 17 
                                         f32 %355 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %366 = OpConstant 8 
                                         i32 %374 = OpConstant 7 
                                             %394 = OpTypePointer Output %6 
                                         i32 %407 = OpConstant 21 
                                         f32 %410 = OpConstant 3.674022E-40 
                                       f32_4 %411 = OpConstantComposite %410 %410 %410 %410 
                                         f32 %414 = OpConstant 3.674022E-40 
                                       f32_4 %415 = OpConstantComposite %414 %414 %414 %414 
                                         f32 %419 = OpConstant 3.674022E-40 
                                       f32_2 %420 = OpConstantComposite %419 %419 
                                         i32 %438 = OpConstant 9 
                                             %456 = OpTypePointer Output %15 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %467 = OpConstant 14 
                                         i32 %470 = OpConstant 13 
                                         i32 %473 = OpConstant 11 
                                         i32 %476 = OpConstant 12 
                                         i32 %480 = OpConstant 18 
                                Private f32* %509 = OpVariable Private 
                                         f32 %515 = OpConstant 3.674022E-40 
                                         i32 %534 = OpConstant 24 
                                         i32 %537 = OpConstant 25 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                               Output f32_4* %561 = OpVariable Output 
                                         i32 %562 = OpConstant 10 
                                         f32 %577 = OpConstant 3.674022E-40 
                                         f32 %587 = OpConstant 3.674022E-40 
                                         f32 %594 = OpConstant 3.674022E-40 
                                       f32_2 %595 = OpConstantComposite %594 %594 
                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
                                         i32 %602 = OpConstant 31 
                                         i32 %615 = OpConstant 32 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %306 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                 Uniform f32* %29 = OpAccessChain %25 %27 
                                          f32 %30 = OpLoad %29 
                                 Uniform f32* %32 = OpAccessChain %25 %31 
                                          f32 %33 = OpLoad %32 
                                        f32_2 %34 = OpCompositeConstruct %30 %33 
                                        f32_2 %35 = OpFAdd %14 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                                      OpStore %9 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 1 1 1 1 
                               Uniform f32_4* %44 = OpAccessChain %25 %41 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_4 %46 = OpFMul %40 %45 
                                                      OpStore %38 %46 
                               Uniform f32_4* %48 = OpAccessChain %25 %41 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %38 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %38 %54 
                               Uniform f32_4* %55 = OpAccessChain %25 %41 %41 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %11 
                                        f32_4 %58 = OpVectorShuffle %57 %57 2 2 2 2 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %38 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %38 %61 
                                        f32_4 %63 = OpLoad %38 
                               Uniform f32_4* %65 = OpAccessChain %25 %41 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %62 %67 
                               Uniform f32_4* %68 = OpAccessChain %25 %41 %64 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_4 %71 = OpLoad %11 
                                        f32_3 %72 = OpVectorShuffle %71 %71 3 3 3 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %38 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %38 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %38 %78 
                                        f32_4 %79 = OpLoad %38 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpFNegate %80 
                               Uniform f32_3* %83 = OpAccessChain %25 %47 
                                        f32_3 %84 = OpLoad %83 
                                        f32_3 %85 = OpFAdd %81 %84 
                                        f32_4 %86 = OpLoad %38 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %38 %87 
                                        f32_4 %89 = OpLoad %62 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %25 %91 %42 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %90 %93 
                                                      OpStore %88 %94 
                               Uniform f32_4* %95 = OpAccessChain %25 %91 %47 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %62 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %88 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %88 %101 
                              Uniform f32_4* %102 = OpAccessChain %25 %91 %41 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %62 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %88 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %88 %108 
                              Uniform f32_4* %109 = OpAccessChain %25 %91 %64 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpVectorShuffle %111 %111 3 3 3 3 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %62 %115 
                                       f32_4 %121 = OpLoad %62 
                               Output f32_4* %123 = OpAccessChain %120 %47 
                                                      OpStore %123 %121 
                                       f32_4 %126 = OpLoad %125 
                                                      OpStore %124 %126 
                                       f32_2 %131 = OpLoad %130 
                                                      OpStore vs_TEXCOORD0 %131 
                              Uniform f32_4* %134 = OpAccessChain %25 %42 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %25 %137 %42 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %137 %47 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                              Uniform f32_4* %145 = OpAccessChain %25 %42 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 0 
                                       f32_2 %148 = OpFMul %144 %147 
                                       f32_2 %149 = OpLoad %133 
                                       f32_2 %150 = OpFAdd %148 %149 
                                                      OpStore %133 %150 
                                       f32_2 %151 = OpLoad %133 
                                       f32_2 %152 = OpExtInst %1 4 %151 
                                Uniform f32* %154 = OpAccessChain %25 %153 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %25 %156 
                                         f32 %158 = OpLoad %157 
                                       f32_2 %159 = OpCompositeConstruct %155 %158 
                                       f32_2 %160 = OpFMul %152 %159 
                                                      OpStore %133 %160 
                                       f32_4 %161 = OpLoad %62 
                                       f32_2 %162 = OpVectorShuffle %161 %161 3 3 
                                       f32_2 %163 = OpLoad %133 
                                       f32_2 %164 = OpFDiv %162 %163 
                                                      OpStore %133 %164 
                                       f32_2 %167 = OpLoad %133 
                                       f32_2 %168 = OpLoad %133 
                                         f32 %169 = OpDot %167 %168 
                                                      OpStore %166 %169 
                                Uniform f32* %171 = OpAccessChain %25 %170 
                                         f32 %172 = OpLoad %171 
                                Uniform f32* %174 = OpAccessChain %25 %173 
                                         f32 %175 = OpLoad %174 
                                       f32_2 %176 = OpCompositeConstruct %172 %175 
                                       f32_2 %179 = OpFMul %176 %178 
                                       f32_2 %180 = OpLoad %133 
                                       f32_2 %181 = OpFAdd %179 %180 
                                                      OpStore %133 %181 
                                       f32_2 %183 = OpLoad %133 
                                       f32_2 %184 = OpFDiv %178 %183 
                                       f32_4 %185 = OpLoad vs_TEXCOORD2 
                                       f32_4 %186 = OpVectorShuffle %185 %184 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %186 
                                         f32 %187 = OpLoad %166 
                                         f32 %188 = OpExtInst %1 32 %187 
                                Private f32* %190 = OpAccessChain %133 %189 
                                                      OpStore %190 %188 
                                  Input f32* %194 = OpAccessChain %192 %116 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpExtInst %1 4 %195 
                                Uniform f32* %198 = OpAccessChain %25 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %196 %199 
                                                      OpStore %191 %200 
                                Uniform f32* %202 = OpAccessChain %25 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %166 %205 
                                         f32 %206 = OpLoad %191 
                                         f32 %207 = OpLoad %166 
                                         f32 %208 = OpFMul %206 %207 
                                                      OpStore %191 %208 
                                         f32 %209 = OpLoad %191 
                                Private f32* %210 = OpAccessChain %133 %189 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFMul %209 %211 
                                                      OpStore %166 %212 
                                Uniform f32* %214 = OpAccessChain %25 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %216 %204 
                                Private f32* %218 = OpAccessChain %62 %189 
                                                      OpStore %218 %217 
                                         f32 %219 = OpLoad %166 
                                         f32 %220 = OpExtInst %1 4 %219 
                                Private f32* %221 = OpAccessChain %62 %189 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %220 %222 
                                Private f32* %224 = OpAccessChain %62 %189 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %133 %189 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpLoad %191 
                                         f32 %228 = OpFMul %226 %227 
                                Private f32* %229 = OpAccessChain %62 %189 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFNegate %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %133 %189 
                                                      OpStore %233 %232 
                                       f32_3 %236 = OpLoad %235 
                              Uniform f32_4* %237 = OpAccessChain %25 %64 %47 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                         f32 %240 = OpDot %236 %239 
                                Private f32* %241 = OpAccessChain %88 %189 
                                                      OpStore %241 %240 
                                       f32_3 %242 = OpLoad %235 
                              Uniform f32_4* %243 = OpAccessChain %25 %64 %42 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                         f32 %246 = OpDot %242 %245 
                                Private f32* %247 = OpAccessChain %88 %116 
                                                      OpStore %247 %246 
                                       f32_3 %248 = OpLoad %235 
                              Uniform f32_4* %249 = OpAccessChain %25 %64 %41 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                         f32 %252 = OpDot %248 %251 
                                Private f32* %254 = OpAccessChain %88 %253 
                                                      OpStore %254 %252 
                                       f32_4 %255 = OpLoad %88 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_4 %257 = OpLoad %88 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                         f32 %259 = OpDot %256 %258 
                                                      OpStore %191 %259 
                                         f32 %260 = OpLoad %191 
                                         f32 %261 = OpExtInst %1 32 %260 
                                                      OpStore %191 %261 
                                         f32 %264 = OpLoad %191 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_4 %266 = OpLoad %88 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                                      OpStore %263 %268 
                                       f32_4 %269 = OpLoad %38 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_4 %271 = OpLoad %38 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %270 %272 
                                                      OpStore %191 %273 
                                         f32 %274 = OpLoad %191 
                                         f32 %275 = OpExtInst %1 32 %274 
                                                      OpStore %191 %275 
                                         f32 %276 = OpLoad %191 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %38 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %88 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %88 %282 
                                       f32_3 %283 = OpLoad %263 
                                       f32_4 %284 = OpLoad %88 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                         f32 %286 = OpDot %283 %285 
                                                      OpStore %191 %286 
                                         f32 %287 = OpLoad %191 
                                         f32 %288 = OpExtInst %1 4 %287 
                                Private f32* %289 = OpAccessChain %133 %189 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %62 %189 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %133 %189 
                                                      OpStore %295 %294 
                                Uniform f32* %300 = OpAccessChain %25 %137 %64 %299 
                                         f32 %301 = OpLoad %300 
                                        bool %303 = OpFOrdEqual %301 %302 
                                                      OpStore %298 %303 
                                        bool %304 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %304 %307 %311 
                                             %307 = OpLabel 
                                Private f32* %309 = OpAccessChain %133 %189 
                                         f32 %310 = OpLoad %309 
                                                      OpStore %306 %310 
                                                      OpBranch %308 
                                             %311 = OpLabel 
                                         f32 %312 = OpLoad %166 
                                                      OpStore %306 %312 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %313 = OpLoad %306 
                                Private f32* %314 = OpAccessChain %263 %189 
                                                      OpStore %314 %313 
                                  Input f32* %316 = OpAccessChain %192 %116 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %302 %317 
                                                      OpStore %315 %318 
                                        bool %319 = OpLoad %315 
                                         f32 %320 = OpSelect %319 %204 %302 
                                Private f32* %321 = OpAccessChain %133 %189 
                                                      OpStore %321 %320 
                                Uniform f32* %323 = OpAccessChain %25 %322 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFNegate %324 
                                Uniform f32* %327 = OpAccessChain %25 %326 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %325 %328 
                                                      OpStore %191 %329 
                                Private f32* %330 = OpAccessChain %133 %189 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpLoad %191 
                                         f32 %333 = OpFMul %331 %332 
                                Uniform f32* %334 = OpAccessChain %25 %322 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpFAdd %333 %335 
                                Private f32* %337 = OpAccessChain %133 %189 
                                                      OpStore %337 %336 
                                Private f32* %338 = OpAccessChain %133 %189 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %339 %177 
                                Uniform f32* %342 = OpAccessChain %25 %341 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %340 %343 
                                Private f32* %345 = OpAccessChain %133 %189 
                                                      OpStore %345 %344 
                                Private f32* %346 = OpAccessChain %133 %189 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %349 = OpAccessChain %25 %348 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %347 %350 
                                Private f32* %352 = OpAccessChain %133 %189 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %133 %189 
                                         f32 %354 = OpLoad %353 
                                         f32 %356 = OpFMul %354 %355 
                                Private f32* %357 = OpAccessChain %263 %253 
                                                      OpStore %357 %356 
                                       f32_3 %359 = OpLoad %263 
                                       f32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                       f32_4 %361 = OpLoad vs_TEXCOORD1 
                                       f32_4 %362 = OpVectorShuffle %361 %360 0 4 2 5 
                                                      OpStore vs_TEXCOORD1 %362 
                                Private f32* %363 = OpAccessChain %263 %189 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFDiv %355 %364 
                                                      OpStore %191 %365 
                                Uniform f32* %367 = OpAccessChain %25 %366 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFNegate %368 
                                Uniform f32* %370 = OpAccessChain %25 %348 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFMul %369 %371 
                                         f32 %373 = OpFAdd %372 %204 
                                                      OpStore %166 %373 
                                Uniform f32* %375 = OpAccessChain %25 %374 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Uniform f32* %378 = OpAccessChain %25 %348 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                         f32 %381 = OpLoad %166 
                                         f32 %382 = OpFAdd %380 %381 
                                                      OpStore %166 %382 
                                         f32 %383 = OpLoad %166 
                                         f32 %384 = OpFMul %383 %355 
                                         f32 %385 = OpLoad %191 
                                         f32 %386 = OpFNegate %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %166 %387 
                                Private f32* %388 = OpAccessChain %133 %189 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                         f32 %391 = OpFMul %390 %355 
                                         f32 %392 = OpLoad %166 
                                         f32 %393 = OpFAdd %391 %392 
                                 Output f32* %395 = OpAccessChain vs_TEXCOORD1 %189 
                                                      OpStore %395 %393 
                                Private f32* %396 = OpAccessChain %133 %189 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                         f32 %399 = OpFMul %398 %355 
                                         f32 %400 = OpFAdd %399 %355 
                                Private f32* %401 = OpAccessChain %133 %189 
                                                      OpStore %401 %400 
                                         f32 %402 = OpLoad %191 
                                Private f32* %403 = OpAccessChain %133 %189 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                 Output f32* %406 = OpAccessChain vs_TEXCOORD1 %253 
                                                      OpStore %406 %405 
                              Uniform f32_4* %408 = OpAccessChain %25 %407 
                                       f32_4 %409 = OpLoad %408 
                                       f32_4 %412 = OpExtInst %1 40 %409 %411 
                                                      OpStore %88 %412 
                                       f32_4 %413 = OpLoad %88 
                                       f32_4 %416 = OpExtInst %1 37 %413 %415 
                                                      OpStore %88 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
                                       f32_2 %421 = OpFMul %418 %420 
                                       f32_4 %422 = OpLoad %88 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                       f32_2 %424 = OpFNegate %423 
                                       f32_2 %425 = OpFAdd %421 %424 
                                       f32_4 %426 = OpLoad %9 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 2 3 
                                                      OpStore %9 %427 
                                       f32_4 %428 = OpLoad %88 
                                       f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                                       f32_2 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %9 
                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
                                       f32_2 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad vs_TEXCOORD2 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %435 
                                       f32_4 %436 = OpLoad %38 
                                       f32_3 %437 = OpVectorShuffle %436 %436 1 1 1 
                              Uniform f32_4* %439 = OpAccessChain %25 %438 %42 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                       f32_4 %443 = OpLoad %9 
                                       f32_4 %444 = OpVectorShuffle %443 %442 4 5 2 6 
                                                      OpStore %9 %444 
                              Uniform f32_4* %445 = OpAccessChain %25 %438 %47 
                                       f32_4 %446 = OpLoad %445 
                                       f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                       f32_4 %448 = OpLoad %38 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
                                       f32_3 %450 = OpFMul %447 %449 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 3 
                                       f32_3 %453 = OpFAdd %450 %452 
                                       f32_4 %454 = OpLoad %9 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 2 6 
                                                      OpStore %9 %455 
                              Uniform f32_4* %458 = OpAccessChain %25 %438 %41 
                                       f32_4 %459 = OpLoad %458 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_4 %461 = OpLoad %38 
                                       f32_3 %462 = OpVectorShuffle %461 %461 2 2 2 
                                       f32_3 %463 = OpFMul %460 %462 
                                       f32_4 %464 = OpLoad %9 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 3 
                                       f32_3 %466 = OpFAdd %463 %465 
                                                      OpStore vs_TEXCOORD3 %466 
                                Uniform f32* %468 = OpAccessChain %25 %467 
                                         f32 %469 = OpLoad %468 
                                Uniform f32* %471 = OpAccessChain %25 %470 
                                         f32 %472 = OpLoad %471 
                                Uniform f32* %474 = OpAccessChain %25 %473 
                                         f32 %475 = OpLoad %474 
                                Uniform f32* %477 = OpAccessChain %25 %476 
                                         f32 %478 = OpLoad %477 
                                       f32_4 %479 = OpCompositeConstruct %469 %472 %475 %478 
                                Uniform f32* %481 = OpAccessChain %25 %480 
                                         f32 %482 = OpLoad %481 
                                Uniform f32* %483 = OpAccessChain %25 %480 
                                         f32 %484 = OpLoad %483 
                                Uniform f32* %485 = OpAccessChain %25 %480 
                                         f32 %486 = OpLoad %485 
                                Uniform f32* %487 = OpAccessChain %25 %480 
                                         f32 %488 = OpLoad %487 
                                       f32_4 %489 = OpCompositeConstruct %482 %484 %486 %488 
                                         f32 %490 = OpCompositeExtract %489 0 
                                         f32 %491 = OpCompositeExtract %489 1 
                                         f32 %492 = OpCompositeExtract %489 2 
                                         f32 %493 = OpCompositeExtract %489 3 
                                       f32_4 %494 = OpCompositeConstruct %490 %491 %492 %493 
                                       f32_4 %495 = OpFMul %479 %494 
                                                      OpStore %38 %495 
                                Private f32* %496 = OpAccessChain %38 %189 
                                         f32 %497 = OpLoad %496 
                                Private f32* %498 = OpAccessChain %263 %189 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %497 %499 
                                         f32 %501 = OpFAdd %500 %204 
                                Private f32* %502 = OpAccessChain %9 %189 
                                                      OpStore %502 %501 
                                Private f32* %503 = OpAccessChain %263 %189 
                                         f32 %504 = OpLoad %503 
                                Private f32* %505 = OpAccessChain %9 %189 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFDiv %504 %506 
                                Private f32* %508 = OpAccessChain %9 %189 
                                                      OpStore %508 %507 
                                Private f32* %510 = OpAccessChain %133 %189 
                                         f32 %511 = OpLoad %510 
                                Private f32* %512 = OpAccessChain %9 %189 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                         f32 %516 = OpFAdd %514 %515 
                                                      OpStore %509 %516 
                                Private f32* %517 = OpAccessChain %9 %189 
                                         f32 %518 = OpLoad %517 
                                Private f32* %519 = OpAccessChain %38 %116 
                                         f32 %520 = OpLoad %519 
                                         f32 %521 = OpFMul %518 %520 
                                Private f32* %522 = OpAccessChain %133 %189 
                                                      OpStore %522 %521 
                                       f32_4 %523 = OpLoad %38 
                                       f32_2 %524 = OpVectorShuffle %523 %523 2 3 
                                       f32_2 %525 = OpFNegate %524 
                                Uniform f32* %526 = OpAccessChain %25 %197 
                                         f32 %527 = OpLoad %526 
                                       f32_2 %528 = OpCompositeConstruct %527 %527 
                                       f32_2 %529 = OpFMul %525 %528 
                                       f32_4 %530 = OpLoad %38 
                                       f32_4 %531 = OpVectorShuffle %530 %529 4 5 2 3 
                                                      OpStore %38 %531 
                                       f32_4 %532 = OpLoad %38 
                                       f32_2 %533 = OpVectorShuffle %532 %532 0 1 
                                Uniform f32* %535 = OpAccessChain %25 %534 
                                         f32 %536 = OpLoad %535 
                                Uniform f32* %538 = OpAccessChain %25 %537 
                                         f32 %539 = OpLoad %538 
                                       f32_2 %540 = OpCompositeConstruct %536 %539 
                                       f32_2 %541 = OpFDiv %533 %540 
                                       f32_4 %542 = OpLoad %38 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 2 3 
                                                      OpStore %38 %543 
                                       f32_4 %545 = OpLoad %38 
                                       f32_2 %546 = OpVectorShuffle %545 %545 0 1 
                                       f32_2 %547 = OpLoad %130 
                                       f32_2 %548 = OpFAdd %546 %547 
                                       f32_4 %549 = OpLoad vs_TEXCOORD4 
                                       f32_4 %550 = OpVectorShuffle %549 %548 4 5 2 3 
                                                      OpStore vs_TEXCOORD4 %550 
                                Private f32* %551 = OpAccessChain %9 %189 
                                         f32 %552 = OpLoad %551 
                                 Output f32* %553 = OpAccessChain vs_TEXCOORD4 %253 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %133 %189 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpFNegate %555 
                                         f32 %557 = OpFMul %556 %355 
                                         f32 %558 = OpLoad %509 
                                         f32 %559 = OpFAdd %557 %558 
                                 Output f32* %560 = OpAccessChain vs_TEXCOORD4 %299 
                                                      OpStore %560 %559 
                              Uniform f32_4* %563 = OpAccessChain %25 %562 
                                       f32_4 %564 = OpLoad %563 
                                       f32_3 %565 = OpVectorShuffle %564 %564 3 3 3 
                              Uniform f32_4* %566 = OpAccessChain %25 %562 
                                       f32_4 %567 = OpLoad %566 
                                       f32_3 %568 = OpVectorShuffle %567 %567 0 1 2 
                                       f32_3 %569 = OpFMul %565 %568 
                                       f32_4 %570 = OpLoad %561 
                                       f32_4 %571 = OpVectorShuffle %570 %569 4 5 6 3 
                                                      OpStore %561 %571 
                                Uniform f32* %572 = OpAccessChain %25 %562 %299 
                                         f32 %573 = OpLoad %572 
                                 Output f32* %574 = OpAccessChain %561 %299 
                                                      OpStore %574 %573 
                                  Input f32* %575 = OpAccessChain %192 %189 
                                         f32 %576 = OpLoad %575 
                                         f32 %578 = OpFMul %576 %577 
                                Private f32* %579 = OpAccessChain %9 %189 
                                                      OpStore %579 %578 
                                Private f32* %580 = OpAccessChain %9 %189 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 8 %581 
                                Private f32* %583 = OpAccessChain %133 %189 
                                                      OpStore %583 %582 
                                Private f32* %584 = OpAccessChain %133 %189 
                                         f32 %585 = OpLoad %584 
                                         f32 %586 = OpFNegate %585 
                                         f32 %588 = OpFMul %586 %587 
                                  Input f32* %589 = OpAccessChain %192 %189 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFAdd %588 %590 
                                Private f32* %592 = OpAccessChain %133 %116 
                                                      OpStore %592 %591 
                                       f32_2 %593 = OpLoad %133 
                                       f32_2 %596 = OpFMul %593 %595 
                                       f32_4 %597 = OpLoad %9 
                                       f32_4 %598 = OpVectorShuffle %597 %596 4 5 2 3 
                                                      OpStore %9 %598 
                                       f32_4 %600 = OpLoad %9 
                                       f32_2 %601 = OpVectorShuffle %600 %600 0 1 
                              Uniform f32_4* %603 = OpAccessChain %25 %602 
                                       f32_4 %604 = OpLoad %603 
                                       f32_2 %605 = OpVectorShuffle %604 %604 0 1 
                                       f32_2 %606 = OpFMul %601 %605 
                              Uniform f32_4* %607 = OpAccessChain %25 %602 
                                       f32_4 %608 = OpLoad %607 
                                       f32_2 %609 = OpVectorShuffle %608 %608 2 3 
                                       f32_2 %610 = OpFAdd %606 %609 
                                       f32_4 %611 = OpLoad vs_TEXCOORD5 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 2 3 
                                                      OpStore vs_TEXCOORD5 %612 
                                       f32_4 %613 = OpLoad %9 
                                       f32_2 %614 = OpVectorShuffle %613 %613 0 1 
                              Uniform f32_4* %616 = OpAccessChain %25 %615 
                                       f32_4 %617 = OpLoad %616 
                                       f32_2 %618 = OpVectorShuffle %617 %617 0 1 
                                       f32_2 %619 = OpFMul %614 %618 
                              Uniform f32_4* %620 = OpAccessChain %25 %615 
                                       f32_4 %621 = OpLoad %620 
                                       f32_2 %622 = OpVectorShuffle %621 %621 2 3 
                                       f32_2 %623 = OpFAdd %619 %622 
                                       f32_4 %624 = OpLoad vs_TEXCOORD5 
                                       f32_4 %625 = OpVectorShuffle %624 %623 0 1 4 5 
                                                      OpStore vs_TEXCOORD5 %625 
                                 Output f32* %626 = OpAccessChain %120 %47 %116 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFNegate %627 
                                 Output f32* %629 = OpAccessChain %120 %47 %116 
                                                      OpStore %629 %628 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 350
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %30 %63 %136 %162 %252 %269 %291 %331 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD5 Location 30 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %90 DescriptorSet 90 
                                                      OpDecorate %90 Binding 90 
                                                      OpDecorate %92 DescriptorSet 92 
                                                      OpDecorate %92 Binding 92 
                                                      OpDecorate vs_TEXCOORD1 Location 136 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %158 DescriptorSet 158 
                                                      OpDecorate %158 Binding 158 
                                                      OpDecorate vs_TEXCOORD0 Location 162 
                                                      OpDecorate vs_TEXCOORD4 Location 252 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate vs_TEXCOORD2 Location 291 
                                                      OpDecorate %331 Location 331 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 5 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 6 
                                              %21 = OpTypeVector %6 2 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %7 
                                              %29 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %37 = OpTypePointer UniformConstant %36 
         UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampler 
                                              %41 = OpTypePointer UniformConstant %40 
                     UniformConstant sampler* %42 = OpVariable UniformConstant 
                                              %44 = OpTypeSampledImage %36 
                                          i32 %50 = OpConstant 7 
                                              %54 = OpTypeVector %6 3 
                               Private f32_4* %62 = OpVariable Private 
                                 Input f32_4* %63 = OpVariable Input 
                                          i32 %66 = OpConstant 3 
                               Private f32_4* %73 = OpVariable Private 
                                          i32 %74 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
         UniformConstant read_only Texture2D* %90 = OpVariable UniformConstant 
                     UniformConstant sampler* %92 = OpVariable UniformConstant 
                                             %105 = OpTypeInt 32 0 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Private %6 
                                         i32 %125 = OpConstant 8 
                                         i32 %128 = OpConstant 9 
                                         u32 %132 = OpConstant 0 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %137 = OpConstant 1 
                                             %138 = OpTypePointer Input %6 
                                Private f32* %143 = OpVariable Private 
                                         f32 %146 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                Private f32* %155 = OpVariable Private 
        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
                    UniformConstant sampler* %158 = OpVariable UniformConstant 
                                             %161 = OpTypePointer Input %21 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         u32 %168 = OpConstant 2 
                                Private f32* %172 = OpVariable Private 
                                         f32 %181 = OpConstant 3.674022E-40 
                                         i32 %201 = OpConstant 4 
                                Private f32* %248 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                Input f32_4* %269 = OpVariable Input 
                                         i32 %278 = OpConstant 10 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                         f32 %324 = OpConstant 3.674022E-40 
                                             %330 = OpTypePointer Output %7 
                               Output f32_4* %331 = OpVariable Output 
                                             %336 = OpTypeBool 
                                             %337 = OpTypePointer Private %336 
                               Private bool* %338 = OpVariable Private 
                                         i32 %343 = OpConstant -1 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                        f32_2 %22 = OpCompositeConstruct %17 %20 
                               Uniform f32_4* %25 = OpAccessChain %12 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %22 %27 
                                        f32_4 %31 = OpLoad vs_TEXCOORD5 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %28 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %9 %35 
                          read_only Texture2D %39 = OpLoad %38 
                                      sampler %43 = OpLoad %42 
                   read_only Texture2DSampled %45 = OpSampledImage %39 %43 
                                        f32_4 %46 = OpLoad %9 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                        f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                                      OpStore %9 %48 
                                        f32_4 %49 = OpLoad %9 
                               Uniform f32_4* %51 = OpAccessChain %12 %50 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %49 %52 
                                                      OpStore %9 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_4 %57 = OpLoad %9 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %9 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %12 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFMul %65 %69 
                                        f32_4 %71 = OpLoad %62 
                                        f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                                      OpStore %62 %72 
                                 Uniform f32* %75 = OpAccessChain %12 %74 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %12 %77 
                                          f32 %79 = OpLoad %78 
                                        f32_2 %80 = OpCompositeConstruct %76 %79 
                               Uniform f32_4* %81 = OpAccessChain %12 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 1 1 
                                        f32_2 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad vs_TEXCOORD5 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_2 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %73 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                                      OpStore %73 %89 
                          read_only Texture2D %91 = OpLoad %90 
                                      sampler %93 = OpLoad %92 
                   read_only Texture2DSampled %94 = OpSampledImage %91 %93 
                                        f32_4 %95 = OpLoad %73 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                                      OpStore %73 %97 
                                        f32_4 %98 = OpLoad %62 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_4 %100 = OpLoad %73 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %62 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %62 %104 
                                Private f32* %108 = OpAccessChain %73 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %110 = OpAccessChain %12 %66 %106 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFMul %109 %111 
                                Private f32* %113 = OpAccessChain %73 %106 
                                                      OpStore %113 %112 
                                       f32_4 %114 = OpLoad %62 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_4 %116 = OpLoad %73 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %73 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %73 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpLoad %73 
                                       f32_4 %123 = OpFNegate %122 
                                       f32_4 %124 = OpFAdd %121 %123 
                                                      OpStore %9 %124 
                                Uniform f32* %126 = OpAccessChain %12 %125 
                                         f32 %127 = OpLoad %126 
                                Uniform f32* %129 = OpAccessChain %12 %128 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %127 %130 
                                Private f32* %133 = OpAccessChain %62 %132 
                                                      OpStore %133 %131 
                                Private f32* %134 = OpAccessChain %62 %132 
                                         f32 %135 = OpLoad %134 
                                  Input f32* %139 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFMul %135 %140 
                                Private f32* %142 = OpAccessChain %62 %132 
                                                      OpStore %142 %141 
                                Private f32* %144 = OpAccessChain %62 %132 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 37 %145 %146 
                                                      OpStore %143 %147 
                                Private f32* %148 = OpAccessChain %62 %132 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                Private f32* %152 = OpAccessChain %62 %132 
                                                      OpStore %152 %151 
                                         f32 %153 = OpLoad %143 
                                         f32 %154 = OpExtInst %1 31 %153 
                                                      OpStore %143 %154 
                         read_only Texture2D %157 = OpLoad %156 
                                     sampler %159 = OpLoad %158 
                  read_only Texture2DSampled %160 = OpSampledImage %157 %159 
                                       f32_2 %163 = OpLoad vs_TEXCOORD0 
                                       f32_4 %164 = OpImageSampleImplicitLod %160 %163 
                                         f32 %165 = OpCompositeExtract %164 3 
                                                      OpStore %155 %165 
                                         f32 %166 = OpLoad %155 
                                         f32 %167 = OpFNegate %166 
                                  Input f32* %169 = OpAccessChain vs_TEXCOORD1 %168 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFAdd %167 %170 
                                                      OpStore %155 %171 
                                         f32 %173 = OpLoad %155 
                                  Input f32* %174 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %173 %175 
                                Private f32* %177 = OpAccessChain %62 %132 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                                      OpStore %172 %179 
                                         f32 %180 = OpLoad %172 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %146 
                                                      OpStore %172 %182 
                                         f32 %183 = OpLoad %155 
                                  Input f32* %184 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                Private f32* %187 = OpAccessChain %62 %132 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                         f32 %190 = OpFAdd %186 %189 
                                Private f32* %191 = OpAccessChain %62 %132 
                                                      OpStore %191 %190 
                                         f32 %192 = OpLoad %143 
                                         f32 %193 = OpLoad %172 
                                         f32 %194 = OpFMul %192 %193 
                                                      OpStore %143 %194 
                                         f32 %195 = OpLoad %143 
                                       f32_4 %196 = OpCompositeConstruct %195 %195 %195 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFMul %196 %197 
                                       f32_4 %199 = OpLoad %73 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %9 %200 
                                Uniform f32* %202 = OpAccessChain %12 %201 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %12 %128 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                                      OpStore %143 %206 
                                         f32 %207 = OpLoad %143 
                                  Input f32* %208 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %207 %209 
                                                      OpStore %155 %210 
                                         f32 %211 = OpLoad %143 
                                  Input f32* %212 = OpAccessChain vs_TEXCOORD1 %137 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                         f32 %215 = OpFAdd %214 %146 
                                                      OpStore %143 %215 
                                         f32 %216 = OpLoad %155 
                                         f32 %217 = OpFMul %216 %150 
                                Private f32* %218 = OpAccessChain %62 %132 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFAdd %217 %219 
                                Private f32* %221 = OpAccessChain %62 %132 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %62 %132 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpLoad %143 
                                         f32 %225 = OpFDiv %223 %224 
                                Private f32* %226 = OpAccessChain %62 %132 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %62 %132 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpExtInst %1 43 %228 %181 %146 
                                Private f32* %230 = OpAccessChain %62 %132 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %62 %132 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                         f32 %234 = OpFAdd %233 %146 
                                Private f32* %235 = OpAccessChain %62 %132 
                                                      OpStore %235 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %62 
                                       f32_4 %238 = OpVectorShuffle %237 %237 0 0 0 0 
                                       f32_4 %239 = OpFMul %236 %238 
                                                      OpStore %73 %239 
                                Private f32* %240 = OpAccessChain %9 %106 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFNegate %241 
                                Private f32* %243 = OpAccessChain %62 %132 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                         f32 %246 = OpFAdd %245 %146 
                                Private f32* %247 = OpAccessChain %9 %132 
                                                      OpStore %247 %246 
                         read_only Texture2D %249 = OpLoad %156 
                                     sampler %250 = OpLoad %158 
                  read_only Texture2DSampled %251 = OpSampledImage %249 %250 
                                       f32_4 %253 = OpLoad vs_TEXCOORD4 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_4 %255 = OpImageSampleImplicitLod %251 %254 
                                         f32 %256 = OpCompositeExtract %255 3 
                                                      OpStore %248 %256 
                                         f32 %257 = OpLoad %248 
                                  Input f32* %258 = OpAccessChain vs_TEXCOORD4 %168 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                  Input f32* %261 = OpAccessChain vs_TEXCOORD4 %106 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                         f32 %264 = OpFAdd %260 %263 
                                                      OpStore %248 %264 
                                         f32 %265 = OpLoad %248 
                                         f32 %266 = OpExtInst %1 43 %265 %181 %146 
                                                      OpStore %248 %266 
                                         f32 %267 = OpLoad %248 
                                       f32_4 %268 = OpCompositeConstruct %267 %267 %267 %267 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpFMul %268 %270 
                                                      OpStore %62 %271 
                                       f32_4 %272 = OpLoad %62 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %273 0 0 0 0 
                                       f32_4 %275 = OpFMul %272 %274 
                                       f32_4 %276 = OpLoad %73 
                                       f32_4 %277 = OpFAdd %275 %276 
                                                      OpStore %9 %277 
                              Uniform f32_4* %279 = OpAccessChain %12 %278 
                                       f32_4 %280 = OpLoad %279 
                                       f32_2 %281 = OpVectorShuffle %280 %280 0 1 
                                       f32_2 %282 = OpFNegate %281 
                              Uniform f32_4* %283 = OpAccessChain %12 %278 
                                       f32_4 %284 = OpLoad %283 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_2 %286 = OpFAdd %282 %285 
                                       f32_4 %287 = OpLoad %62 
                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 2 3 
                                                      OpStore %62 %288 
                                       f32_4 %289 = OpLoad %62 
                                       f32_2 %290 = OpVectorShuffle %289 %289 0 1 
                                       f32_4 %292 = OpLoad vs_TEXCOORD2 
                                       f32_2 %293 = OpVectorShuffle %292 %292 0 1 
                                       f32_2 %294 = OpExtInst %1 4 %293 
                                       f32_2 %295 = OpFNegate %294 
                                       f32_2 %296 = OpFAdd %290 %295 
                                       f32_4 %297 = OpLoad %62 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 2 3 
                                                      OpStore %62 %298 
                                       f32_4 %299 = OpLoad %62 
                                       f32_2 %300 = OpVectorShuffle %299 %299 0 1 
                                       f32_4 %301 = OpLoad vs_TEXCOORD2 
                                       f32_2 %302 = OpVectorShuffle %301 %301 2 3 
                                       f32_2 %303 = OpFMul %300 %302 
                                       f32_4 %304 = OpLoad %62 
                                       f32_4 %305 = OpVectorShuffle %304 %303 4 5 2 3 
                                                      OpStore %62 %305 
                                       f32_4 %306 = OpLoad %62 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpCompositeConstruct %181 %181 
                                       f32_2 %309 = OpCompositeConstruct %146 %146 
                                       f32_2 %310 = OpExtInst %1 43 %307 %308 %309 
                                       f32_4 %311 = OpLoad %62 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 2 3 
                                                      OpStore %62 %312 
                                Private f32* %313 = OpAccessChain %62 %137 
                                         f32 %314 = OpLoad %313 
                                Private f32* %315 = OpAccessChain %62 %132 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFMul %314 %316 
                                Private f32* %318 = OpAccessChain %62 %132 
                                                      OpStore %318 %317 
                                Private f32* %319 = OpAccessChain %9 %106 
                                         f32 %320 = OpLoad %319 
                                Private f32* %321 = OpAccessChain %62 %132 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFMul %320 %322 
                                         f32 %325 = OpFAdd %323 %324 
                                                      OpStore %143 %325 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpLoad %62 
                                       f32_4 %328 = OpVectorShuffle %327 %327 0 0 0 0 
                                       f32_4 %329 = OpFMul %326 %328 
                                                      OpStore %9 %329 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpLoad %63 
                                       f32_4 %334 = OpVectorShuffle %333 %333 3 3 3 3 
                                       f32_4 %335 = OpFMul %332 %334 
                                                      OpStore %331 %335 
                                         f32 %339 = OpLoad %143 
                                        bool %340 = OpFOrdLessThan %339 %181 
                                                      OpStore %338 %340 
                                        bool %341 = OpLoad %338 
                                         i32 %342 = OpSelect %341 %74 %23 
                                         i32 %344 = OpIMul %342 %343 
                                        bool %345 = OpINotEqual %344 %23 
                                                      OpSelectionMerge %347 None 
                                                      OpBranchConditional %345 %346 %347 
                                             %346 = OpLabel 
                                                      OpKill
                                             %347 = OpLabel 
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
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" }
""
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "d3d11 " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Keywords { "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
Fallback "TextMeshPro/Mobile/Distance Field"
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}