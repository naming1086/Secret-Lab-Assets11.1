//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Pixelisation_OilPaintHQ" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value ("_Value", Range(0, 5)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 51268
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec3 u_xlat24;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat50;
float u_xlat76;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat50.xy = vec2(_Value) / _ScreenResolution.xy;
    u_xlat3 = u_xlat50.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat0.xyxy;
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat5 = u_xlat50.xyxy * vec4(2.0, 0.0, -1.0, -4.0) + u_xlat0.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat5.xy);
    u_xlat5 = texture(_MainTex, u_xlat5.zw);
    u_xlat2.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat6 = u_xlat50.xyxy * vec4(3.0, 0.0, 0.0, -4.0) + u_xlat0.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat2.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat7.xyz;
    u_xlat7 = u_xlat50.xyxy * vec4(4.0, 0.0, -4.0, -3.0) + u_xlat0.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat7.xy);
    u_xlat7 = texture(_MainTex, u_xlat7.zw);
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat8.xyz;
    u_xlat8 = u_xlat50.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat0.xyxy;
    u_xlat9 = texture(_MainTex, u_xlat8.xy);
    u_xlat8 = texture(_MainTex, u_xlat8.zw);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat9.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat9.xyz;
    u_xlat9.xy = u_xlat50.xy + u_xlat0.xy;
    u_xlat9 = texture(_MainTex, u_xlat9.xy);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat9.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat9.xyz;
    u_xlat9 = u_xlat50.xyxy * vec4(2.0, 1.0, -1.0, -3.0) + u_xlat0.xyxy;
    u_xlat10 = texture(_MainTex, u_xlat9.xy);
    u_xlat9 = texture(_MainTex, u_xlat9.zw);
    u_xlat2.xyz = u_xlat10.xyz * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat10.xyz;
    u_xlat10 = u_xlat50.xyxy * vec4(3.0, 1.0, 0.0, -3.0) + u_xlat0.xyxy;
    u_xlat11 = texture(_MainTex, u_xlat10.xy);
    u_xlat10 = texture(_MainTex, u_xlat10.zw);
    u_xlat2.xyz = u_xlat11.xyz * u_xlat11.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat11.xyz;
    u_xlat11 = u_xlat50.xyxy * vec4(4.0, 1.0, -4.0, -2.0) + u_xlat0.xyxy;
    u_xlat12 = texture(_MainTex, u_xlat11.xy);
    u_xlat11 = texture(_MainTex, u_xlat11.zw);
    u_xlat2.xyz = u_xlat12.xyz * u_xlat12.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat12.xyz;
    u_xlat12 = u_xlat50.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat0.xyxy;
    u_xlat13 = texture(_MainTex, u_xlat12.xy);
    u_xlat12 = texture(_MainTex, u_xlat12.zw);
    u_xlat2.xyz = u_xlat13.xyz * u_xlat13.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat13.xyz;
    u_xlat13 = u_xlat50.xyxy * vec4(1.0, 2.0, -1.0, -2.0) + u_xlat0.xyxy;
    u_xlat14 = texture(_MainTex, u_xlat13.xy);
    u_xlat13 = texture(_MainTex, u_xlat13.zw);
    u_xlat2.xyz = u_xlat14.xyz * u_xlat14.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat14.xyz;
    u_xlat14.xy = u_xlat50.xy * vec2(2.0, 2.0) + u_xlat0.xy;
    u_xlat14 = texture(_MainTex, u_xlat14.xy);
    u_xlat2.xyz = u_xlat14.xyz * u_xlat14.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat14.xyz;
    u_xlat14 = u_xlat50.xyxy * vec4(3.0, 2.0, 0.0, -2.0) + u_xlat0.xyxy;
    u_xlat15 = texture(_MainTex, u_xlat14.xy);
    u_xlat14 = texture(_MainTex, u_xlat14.zw);
    u_xlat2.xyz = u_xlat15.xyz * u_xlat15.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat15.xyz;
    u_xlat15 = u_xlat50.xyxy * vec4(4.0, 2.0, -4.0, -1.0) + u_xlat0.xyxy;
    u_xlat16 = texture(_MainTex, u_xlat15.xy);
    u_xlat15 = texture(_MainTex, u_xlat15.zw);
    u_xlat2.xyz = u_xlat16.xyz * u_xlat16.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16.xyz;
    u_xlat16 = u_xlat50.xyxy * vec4(0.0, 3.0, -3.0, -1.0) + u_xlat0.xyxy;
    u_xlat17 = texture(_MainTex, u_xlat16.xy);
    u_xlat16 = texture(_MainTex, u_xlat16.zw);
    u_xlat2.xyz = u_xlat17.xyz * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat17.xyz;
    u_xlat17 = u_xlat50.xyxy * vec4(1.0, 3.0, -2.0, -1.0) + u_xlat0.xyxy;
    u_xlat18 = texture(_MainTex, u_xlat17.xy);
    u_xlat17 = texture(_MainTex, u_xlat17.zw);
    u_xlat2.xyz = u_xlat18.xyz * u_xlat18.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat18.xyz;
    u_xlat18 = u_xlat50.xyxy * vec4(2.0, 3.0, 3.0, 3.0) + u_xlat0.xyxy;
    u_xlat19 = texture(_MainTex, u_xlat18.xy);
    u_xlat18 = texture(_MainTex, u_xlat18.zw);
    u_xlat2.xyz = u_xlat19.xyz * u_xlat19.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat19.xyz;
    u_xlat4.xyz = u_xlat18.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat18.xyz * u_xlat18.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat50.xyxy * vec4(0.0, -1.0, 4.0, 3.0) + u_xlat0.xyxy;
    u_xlat19 = texture(_MainTex, u_xlat18.zw);
    u_xlat18 = texture(_MainTex, u_xlat18.xy);
    u_xlat2.xyz = u_xlat19.xyz * u_xlat19.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat19.xyz;
    u_xlat19 = u_xlat50.xyxy * vec4(-4.0, 0.0, 0.0, 4.0) + u_xlat0.xyxy;
    u_xlat20 = texture(_MainTex, u_xlat19.zw);
    u_xlat19 = texture(_MainTex, u_xlat19.xy);
    u_xlat2.xyz = u_xlat20.xyz * u_xlat20.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat20.xyz;
    u_xlat20 = u_xlat50.xyxy * vec4(-3.0, 0.0, 1.0, 4.0) + u_xlat0.xyxy;
    u_xlat21 = texture(_MainTex, u_xlat20.zw);
    u_xlat20 = texture(_MainTex, u_xlat20.xy);
    u_xlat2.xyz = u_xlat21.xyz * u_xlat21.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat21.xyz;
    u_xlat21 = u_xlat50.xyxy * vec4(-2.0, 0.0, 2.0, 4.0) + u_xlat0.xyxy;
    u_xlat22 = texture(_MainTex, u_xlat21.zw);
    u_xlat21 = texture(_MainTex, u_xlat21.xy);
    u_xlat2.xyz = u_xlat22.xyz * u_xlat22.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat22.xyz;
    u_xlat22 = u_xlat50.xyxy * vec4(-1.0, 0.0, 3.0, 4.0) + u_xlat0.xyxy;
    u_xlat23 = texture(_MainTex, u_xlat22.zw);
    u_xlat22 = texture(_MainTex, u_xlat22.xy);
    u_xlat2.xyz = u_xlat23.xyz * u_xlat23.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat23.xyz;
    u_xlat23.xy = u_xlat50.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat23 = texture(_MainTex, u_xlat23.xy);
    u_xlat2.xyz = u_xlat23.xyz * u_xlat23.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat23.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat23.xyz);
    u_xlat76 = abs(u_xlat2.y) + abs(u_xlat2.x);
    u_xlat76 = abs(u_xlat2.z) + u_xlat76;
    u_xlat2 = u_xlat50.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat0.xyxy;
    u_xlat0.xy = (-u_xlat50.xy) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat23 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat24.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat24.xyz = u_xlat23.xyz * u_xlat23.xyz + u_xlat24.xyz;
    u_xlat23.xyz = u_xlat2.xyz + u_xlat23.xyz;
    u_xlat23.xyz = u_xlat3.xyz + u_xlat23.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat24.xyz;
    u_xlat3.xyz = u_xlat5.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xyz + u_xlat23.xyz;
    u_xlat5.xyz = u_xlat6.xyz + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat7.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat2.xyz + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat9.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10.xyz * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat11.xyz * u_xlat11.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat12.xyz * u_xlat12.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat13.xyz * u_xlat13.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat14.xyz * u_xlat14.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat15.xyz * u_xlat15.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16.xyz * u_xlat16.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat17.xyz * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xyz * u_xlat18.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat19.xyz * u_xlat19.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat20.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xyz * u_xlat21.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat22.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat8.xyz + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat9.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat11.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat12.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat8.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat13.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat14.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat15.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat17.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat18.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat19.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat21.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat22.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat1.xyz);
    u_xlat1.x = abs(u_xlat1.y) + abs(u_xlat1.x);
    u_xlat1.x = abs(u_xlat1.z) + u_xlat1.x;
    u_xlat26 = min(u_xlat1.x, 100.0);
    u_xlatb1 = u_xlat1.x<100.0;
    u_xlatb26 = u_xlat76<u_xlat26;
    u_xlat0.w = 1.0;
    u_xlat0 = bool(u_xlatb1) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat4.w = 1.0;
    SV_Target0 = (bool(u_xlatb26)) ? u_xlat4 : u_xlat0;
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
; Bound: 1579
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %1572 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %1572 Location 1572 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %14 = OpTypeStruct %7 %6 %7 
                                     %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %7 
                                     %30 = OpTypeVector %6 3 
                                     %31 = OpTypePointer Private %30 
                      Private f32_3* %32 = OpVariable Private 
                                     %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %34 = OpTypePointer UniformConstant %33 
UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
                                     %37 = OpTypeSampler 
                                     %38 = OpTypePointer UniformConstant %37 
            UniformConstant sampler* %39 = OpVariable UniformConstant 
                                     %41 = OpTypeSampledImage %33 
                      Private f32_4* %47 = OpVariable Private 
                                     %53 = OpTypePointer Private %10 
                      Private f32_2* %54 = OpVariable Private 
                                 i32 %55 = OpConstant 1 
                                     %56 = OpTypePointer Uniform %6 
                                 i32 %60 = OpConstant 0 
                      Private f32_4* %65 = OpVariable Private 
                                 f32 %68 = OpConstant 3.674022E-40 
                                 f32 %69 = OpConstant 3.674022E-40 
                                 f32 %70 = OpConstant 3.674022E-40 
                               f32_4 %71 = OpConstantComposite %68 %69 %70 %70 
                      Private f32_4* %76 = OpVariable Private 
                     Private f32_4* %111 = OpVariable Private 
                                f32 %114 = OpConstant 3.674022E-40 
                                f32 %115 = OpConstant 3.674022E-40 
                                f32 %116 = OpConstant 3.674022E-40 
                              f32_4 %117 = OpConstantComposite %114 %69 %115 %116 
                     Private f32_4* %122 = OpVariable Private 
                                f32 %160 = OpConstant 3.674022E-40 
                              f32_4 %161 = OpConstantComposite %160 %69 %69 %116 
                     Private f32_4* %166 = OpVariable Private 
                                f32 %204 = OpConstant 3.674022E-40 
                                f32 %205 = OpConstant 3.674022E-40 
                              f32_4 %206 = OpConstantComposite %204 %69 %116 %205 
                     Private f32_4* %211 = OpVariable Private 
                              f32_4 %249 = OpConstantComposite %69 %68 %70 %205 
                     Private f32_4* %254 = OpVariable Private 
                              f32_4 %324 = OpConstantComposite %114 %68 %115 %205 
                     Private f32_4* %329 = OpVariable Private 
                              f32_4 %367 = OpConstantComposite %160 %68 %69 %205 
                     Private f32_4* %372 = OpVariable Private 
                              f32_4 %410 = OpConstantComposite %204 %68 %116 %70 
                     Private f32_4* %415 = OpVariable Private 
                              f32_4 %453 = OpConstantComposite %69 %114 %205 %70 
                     Private f32_4* %458 = OpVariable Private 
                              f32_4 %496 = OpConstantComposite %68 %114 %115 %70 
                     Private f32_4* %501 = OpVariable Private 
                              f32_2 %538 = OpConstantComposite %114 %114 
                              f32_4 %573 = OpConstantComposite %160 %114 %69 %70 
                     Private f32_4* %578 = OpVariable Private 
                              f32_4 %616 = OpConstantComposite %204 %114 %116 %115 
                     Private f32_4* %621 = OpVariable Private 
                              f32_4 %659 = OpConstantComposite %69 %160 %205 %115 
                     Private f32_4* %664 = OpVariable Private 
                              f32_4 %702 = OpConstantComposite %68 %160 %70 %115 
                     Private f32_4* %707 = OpVariable Private 
                              f32_4 %745 = OpConstantComposite %114 %160 %160 %160 
                     Private f32_4* %750 = OpVariable Private 
                              f32_4 %805 = OpConstantComposite %69 %115 %204 %160 
                              f32_4 %847 = OpConstantComposite %116 %69 %69 %204 
                     Private f32_4* %852 = OpVariable Private 
                              f32_4 %890 = OpConstantComposite %205 %69 %68 %204 
                     Private f32_4* %895 = OpVariable Private 
                              f32_4 %933 = OpConstantComposite %70 %69 %114 %204 
                     Private f32_4* %938 = OpVariable Private 
                              f32_4 %976 = OpConstantComposite %115 %69 %160 %204 
                     Private f32_3* %981 = OpVariable Private 
                             f32_2 %1013 = OpConstantComposite %204 %204 
                               f32 %1043 = OpConstant 3.674022E-40 
                             f32_3 %1044 = OpConstantComposite %1043 %1043 %1043 
                                   %1061 = OpTypePointer Private %6 
                      Private f32* %1062 = OpVariable Private 
                                   %1063 = OpTypeInt 32 0 
                               u32 %1064 = OpConstant 1 
                               u32 %1068 = OpConstant 0 
                               u32 %1073 = OpConstant 2 
                             f32_4 %1081 = OpConstantComposite %116 %116 %205 %205 
                    Private f32_3* %1118 = OpVariable Private 
                      Private f32* %1547 = OpVariable Private 
                               f32 %1550 = OpConstant 3.674022E-40 
                                   %1552 = OpTypeBool 
                                   %1553 = OpTypePointer Private %1552 
                     Private bool* %1554 = OpVariable Private 
                     Private bool* %1558 = OpVariable Private 
                               u32 %1562 = OpConstant 3 
                             f32_4 %1566 = OpConstantComposite %69 %69 %69 %69 
                                   %1567 = OpTypeVector %1552 4 
                                   %1571 = OpTypePointer Output %7 
                     Output f32_4* %1572 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                               f32_2 %23 = OpFMul %13 %22 
                      Uniform f32_4* %24 = OpAccessChain %16 %18 
                               f32_4 %25 = OpLoad %24 
                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                               f32_2 %27 = OpFAdd %23 %26 
                               f32_4 %28 = OpLoad %9 
                               f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                 read_only Texture2D %36 = OpLoad %35 
                             sampler %40 = OpLoad %39 
          read_only Texture2DSampled %42 = OpSampledImage %36 %40 
                               f32_4 %43 = OpLoad %9 
                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
                               f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                             OpStore %32 %46 
                               f32_3 %48 = OpLoad %32 
                               f32_3 %49 = OpLoad %32 
                               f32_3 %50 = OpFMul %48 %49 
                               f32_4 %51 = OpLoad %47 
                               f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                             OpStore %47 %52 
                        Uniform f32* %57 = OpAccessChain %16 %55 
                                 f32 %58 = OpLoad %57 
                               f32_2 %59 = OpCompositeConstruct %58 %58 
                      Uniform f32_4* %61 = OpAccessChain %16 %60 
                               f32_4 %62 = OpLoad %61 
                               f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                               f32_2 %64 = OpFDiv %59 %63 
                                             OpStore %54 %64 
                               f32_2 %66 = OpLoad %54 
                               f32_4 %67 = OpVectorShuffle %66 %66 0 1 0 1 
                               f32_4 %72 = OpFMul %67 %71 
                               f32_4 %73 = OpLoad %9 
                               f32_4 %74 = OpVectorShuffle %73 %73 0 1 0 1 
                               f32_4 %75 = OpFAdd %72 %74 
                                             OpStore %65 %75 
                 read_only Texture2D %77 = OpLoad %35 
                             sampler %78 = OpLoad %39 
          read_only Texture2DSampled %79 = OpSampledImage %77 %78 
                               f32_4 %80 = OpLoad %65 
                               f32_2 %81 = OpVectorShuffle %80 %80 0 1 
                               f32_4 %82 = OpImageSampleImplicitLod %79 %81 
                               f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                               f32_4 %84 = OpLoad %76 
                               f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                             OpStore %76 %85 
                 read_only Texture2D %86 = OpLoad %35 
                             sampler %87 = OpLoad %39 
          read_only Texture2DSampled %88 = OpSampledImage %86 %87 
                               f32_4 %89 = OpLoad %65 
                               f32_2 %90 = OpVectorShuffle %89 %89 2 3 
                               f32_4 %91 = OpImageSampleImplicitLod %88 %90 
                               f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               f32_4 %93 = OpLoad %65 
                               f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                             OpStore %65 %94 
                               f32_4 %95 = OpLoad %76 
                               f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                               f32_4 %97 = OpLoad %76 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                               f32_3 %99 = OpFMul %96 %98 
                              f32_4 %100 = OpLoad %47 
                              f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                              f32_3 %102 = OpFAdd %99 %101 
                              f32_4 %103 = OpLoad %47 
                              f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                             OpStore %47 %104 
                              f32_3 %105 = OpLoad %32 
                              f32_4 %106 = OpLoad %76 
                              f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                              f32_3 %108 = OpFAdd %105 %107 
                              f32_4 %109 = OpLoad %76 
                              f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                             OpStore %76 %110 
                              f32_2 %112 = OpLoad %54 
                              f32_4 %113 = OpVectorShuffle %112 %112 0 1 0 1 
                              f32_4 %118 = OpFMul %113 %117 
                              f32_4 %119 = OpLoad %9 
                              f32_4 %120 = OpVectorShuffle %119 %119 0 1 0 1 
                              f32_4 %121 = OpFAdd %118 %120 
                                             OpStore %111 %121 
                read_only Texture2D %123 = OpLoad %35 
                            sampler %124 = OpLoad %39 
         read_only Texture2DSampled %125 = OpSampledImage %123 %124 
                              f32_4 %126 = OpLoad %111 
                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                              f32_4 %128 = OpImageSampleImplicitLod %125 %127 
                              f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                              f32_4 %130 = OpLoad %122 
                              f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                             OpStore %122 %131 
                read_only Texture2D %132 = OpLoad %35 
                            sampler %133 = OpLoad %39 
         read_only Texture2DSampled %134 = OpSampledImage %132 %133 
                              f32_4 %135 = OpLoad %111 
                              f32_2 %136 = OpVectorShuffle %135 %135 2 3 
                              f32_4 %137 = OpImageSampleImplicitLod %134 %136 
                              f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                              f32_4 %139 = OpLoad %111 
                              f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                             OpStore %111 %140 
                              f32_4 %141 = OpLoad %122 
                              f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              f32_4 %143 = OpLoad %122 
                              f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              f32_3 %145 = OpFMul %142 %144 
                              f32_4 %146 = OpLoad %47 
                              f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                              f32_3 %148 = OpFAdd %145 %147 
                              f32_4 %149 = OpLoad %47 
                              f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                             OpStore %47 %150 
                              f32_4 %151 = OpLoad %76 
                              f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              f32_4 %153 = OpLoad %122 
                              f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                              f32_3 %155 = OpFAdd %152 %154 
                              f32_4 %156 = OpLoad %76 
                              f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                             OpStore %76 %157 
                              f32_2 %158 = OpLoad %54 
                              f32_4 %159 = OpVectorShuffle %158 %158 0 1 0 1 
                              f32_4 %162 = OpFMul %159 %161 
                              f32_4 %163 = OpLoad %9 
                              f32_4 %164 = OpVectorShuffle %163 %163 0 1 0 1 
                              f32_4 %165 = OpFAdd %162 %164 
                                             OpStore %122 %165 
                read_only Texture2D %167 = OpLoad %35 
                            sampler %168 = OpLoad %39 
         read_only Texture2DSampled %169 = OpSampledImage %167 %168 
                              f32_4 %170 = OpLoad %122 
                              f32_2 %171 = OpVectorShuffle %170 %170 0 1 
                              f32_4 %172 = OpImageSampleImplicitLod %169 %171 
                              f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                              f32_4 %174 = OpLoad %166 
                              f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                             OpStore %166 %175 
                read_only Texture2D %176 = OpLoad %35 
                            sampler %177 = OpLoad %39 
         read_only Texture2DSampled %178 = OpSampledImage %176 %177 
                              f32_4 %179 = OpLoad %122 
                              f32_2 %180 = OpVectorShuffle %179 %179 2 3 
                              f32_4 %181 = OpImageSampleImplicitLod %178 %180 
                              f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              f32_4 %183 = OpLoad %122 
                              f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                             OpStore %122 %184 
                              f32_4 %185 = OpLoad %166 
                              f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              f32_4 %187 = OpLoad %166 
                              f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              f32_3 %189 = OpFMul %186 %188 
                              f32_4 %190 = OpLoad %47 
                              f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                              f32_3 %192 = OpFAdd %189 %191 
                              f32_4 %193 = OpLoad %47 
                              f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
                                             OpStore %47 %194 
                              f32_4 %195 = OpLoad %76 
                              f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                              f32_4 %197 = OpLoad %166 
                              f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                              f32_3 %199 = OpFAdd %196 %198 
                              f32_4 %200 = OpLoad %76 
                              f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                             OpStore %76 %201 
                              f32_2 %202 = OpLoad %54 
                              f32_4 %203 = OpVectorShuffle %202 %202 0 1 0 1 
                              f32_4 %207 = OpFMul %203 %206 
                              f32_4 %208 = OpLoad %9 
                              f32_4 %209 = OpVectorShuffle %208 %208 0 1 0 1 
                              f32_4 %210 = OpFAdd %207 %209 
                                             OpStore %166 %210 
                read_only Texture2D %212 = OpLoad %35 
                            sampler %213 = OpLoad %39 
         read_only Texture2DSampled %214 = OpSampledImage %212 %213 
                              f32_4 %215 = OpLoad %166 
                              f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                              f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                              f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              f32_4 %219 = OpLoad %211 
                              f32_4 %220 = OpVectorShuffle %219 %218 4 5 6 3 
                                             OpStore %211 %220 
                read_only Texture2D %221 = OpLoad %35 
                            sampler %222 = OpLoad %39 
         read_only Texture2DSampled %223 = OpSampledImage %221 %222 
                              f32_4 %224 = OpLoad %166 
                              f32_2 %225 = OpVectorShuffle %224 %224 2 3 
                              f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                              f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              f32_4 %228 = OpLoad %166 
                              f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                             OpStore %166 %229 
                              f32_4 %230 = OpLoad %211 
                              f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              f32_4 %232 = OpLoad %211 
                              f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              f32_3 %234 = OpFMul %231 %233 
                              f32_4 %235 = OpLoad %47 
                              f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                              f32_3 %237 = OpFAdd %234 %236 
                              f32_4 %238 = OpLoad %47 
                              f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                             OpStore %47 %239 
                              f32_4 %240 = OpLoad %76 
                              f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                              f32_4 %242 = OpLoad %211 
                              f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                              f32_3 %244 = OpFAdd %241 %243 
                              f32_4 %245 = OpLoad %76 
                              f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                             OpStore %76 %246 
                              f32_2 %247 = OpLoad %54 
                              f32_4 %248 = OpVectorShuffle %247 %247 0 1 0 1 
                              f32_4 %250 = OpFMul %248 %249 
                              f32_4 %251 = OpLoad %9 
                              f32_4 %252 = OpVectorShuffle %251 %251 0 1 0 1 
                              f32_4 %253 = OpFAdd %250 %252 
                                             OpStore %211 %253 
                read_only Texture2D %255 = OpLoad %35 
                            sampler %256 = OpLoad %39 
         read_only Texture2DSampled %257 = OpSampledImage %255 %256 
                              f32_4 %258 = OpLoad %211 
                              f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                              f32_4 %260 = OpImageSampleImplicitLod %257 %259 
                              f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                              f32_4 %262 = OpLoad %254 
                              f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                             OpStore %254 %263 
                read_only Texture2D %264 = OpLoad %35 
                            sampler %265 = OpLoad %39 
         read_only Texture2DSampled %266 = OpSampledImage %264 %265 
                              f32_4 %267 = OpLoad %211 
                              f32_2 %268 = OpVectorShuffle %267 %267 2 3 
                              f32_4 %269 = OpImageSampleImplicitLod %266 %268 
                              f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              f32_4 %271 = OpLoad %211 
                              f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                             OpStore %211 %272 
                              f32_4 %273 = OpLoad %254 
                              f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                              f32_4 %275 = OpLoad %254 
                              f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                              f32_3 %277 = OpFMul %274 %276 
                              f32_4 %278 = OpLoad %47 
                              f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              f32_3 %280 = OpFAdd %277 %279 
                              f32_4 %281 = OpLoad %47 
                              f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                             OpStore %47 %282 
                              f32_4 %283 = OpLoad %76 
                              f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                              f32_4 %285 = OpLoad %254 
                              f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              f32_3 %287 = OpFAdd %284 %286 
                              f32_4 %288 = OpLoad %76 
                              f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                             OpStore %76 %289 
                              f32_2 %290 = OpLoad %54 
                              f32_4 %291 = OpLoad %9 
                              f32_2 %292 = OpVectorShuffle %291 %291 0 1 
                              f32_2 %293 = OpFAdd %290 %292 
                              f32_4 %294 = OpLoad %254 
                              f32_4 %295 = OpVectorShuffle %294 %293 4 5 2 3 
                                             OpStore %254 %295 
                read_only Texture2D %296 = OpLoad %35 
                            sampler %297 = OpLoad %39 
         read_only Texture2DSampled %298 = OpSampledImage %296 %297 
                              f32_4 %299 = OpLoad %254 
                              f32_2 %300 = OpVectorShuffle %299 %299 0 1 
                              f32_4 %301 = OpImageSampleImplicitLod %298 %300 
                              f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                              f32_4 %303 = OpLoad %254 
                              f32_4 %304 = OpVectorShuffle %303 %302 4 5 6 3 
                                             OpStore %254 %304 
                              f32_4 %305 = OpLoad %254 
                              f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                              f32_4 %307 = OpLoad %254 
                              f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                              f32_3 %309 = OpFMul %306 %308 
                              f32_4 %310 = OpLoad %47 
                              f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                              f32_3 %312 = OpFAdd %309 %311 
                              f32_4 %313 = OpLoad %47 
                              f32_4 %314 = OpVectorShuffle %313 %312 4 5 6 3 
                                             OpStore %47 %314 
                              f32_4 %315 = OpLoad %76 
                              f32_3 %316 = OpVectorShuffle %315 %315 0 1 2 
                              f32_4 %317 = OpLoad %254 
                              f32_3 %318 = OpVectorShuffle %317 %317 0 1 2 
                              f32_3 %319 = OpFAdd %316 %318 
                              f32_4 %320 = OpLoad %76 
                              f32_4 %321 = OpVectorShuffle %320 %319 4 5 6 3 
                                             OpStore %76 %321 
                              f32_2 %322 = OpLoad %54 
                              f32_4 %323 = OpVectorShuffle %322 %322 0 1 0 1 
                              f32_4 %325 = OpFMul %323 %324 
                              f32_4 %326 = OpLoad %9 
                              f32_4 %327 = OpVectorShuffle %326 %326 0 1 0 1 
                              f32_4 %328 = OpFAdd %325 %327 
                                             OpStore %254 %328 
                read_only Texture2D %330 = OpLoad %35 
                            sampler %331 = OpLoad %39 
         read_only Texture2DSampled %332 = OpSampledImage %330 %331 
                              f32_4 %333 = OpLoad %254 
                              f32_2 %334 = OpVectorShuffle %333 %333 0 1 
                              f32_4 %335 = OpImageSampleImplicitLod %332 %334 
                              f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                              f32_4 %337 = OpLoad %329 
                              f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                             OpStore %329 %338 
                read_only Texture2D %339 = OpLoad %35 
                            sampler %340 = OpLoad %39 
         read_only Texture2DSampled %341 = OpSampledImage %339 %340 
                              f32_4 %342 = OpLoad %254 
                              f32_2 %343 = OpVectorShuffle %342 %342 2 3 
                              f32_4 %344 = OpImageSampleImplicitLod %341 %343 
                              f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                              f32_4 %346 = OpLoad %254 
                              f32_4 %347 = OpVectorShuffle %346 %345 4 5 6 3 
                                             OpStore %254 %347 
                              f32_4 %348 = OpLoad %329 
                              f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
                              f32_4 %350 = OpLoad %329 
                              f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                              f32_3 %352 = OpFMul %349 %351 
                              f32_4 %353 = OpLoad %47 
                              f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
                              f32_3 %355 = OpFAdd %352 %354 
                              f32_4 %356 = OpLoad %47 
                              f32_4 %357 = OpVectorShuffle %356 %355 4 5 6 3 
                                             OpStore %47 %357 
                              f32_4 %358 = OpLoad %76 
                              f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                              f32_4 %360 = OpLoad %329 
                              f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                              f32_3 %362 = OpFAdd %359 %361 
                              f32_4 %363 = OpLoad %76 
                              f32_4 %364 = OpVectorShuffle %363 %362 4 5 6 3 
                                             OpStore %76 %364 
                              f32_2 %365 = OpLoad %54 
                              f32_4 %366 = OpVectorShuffle %365 %365 0 1 0 1 
                              f32_4 %368 = OpFMul %366 %367 
                              f32_4 %369 = OpLoad %9 
                              f32_4 %370 = OpVectorShuffle %369 %369 0 1 0 1 
                              f32_4 %371 = OpFAdd %368 %370 
                                             OpStore %329 %371 
                read_only Texture2D %373 = OpLoad %35 
                            sampler %374 = OpLoad %39 
         read_only Texture2DSampled %375 = OpSampledImage %373 %374 
                              f32_4 %376 = OpLoad %329 
                              f32_2 %377 = OpVectorShuffle %376 %376 0 1 
                              f32_4 %378 = OpImageSampleImplicitLod %375 %377 
                              f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                              f32_4 %380 = OpLoad %372 
                              f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
                                             OpStore %372 %381 
                read_only Texture2D %382 = OpLoad %35 
                            sampler %383 = OpLoad %39 
         read_only Texture2DSampled %384 = OpSampledImage %382 %383 
                              f32_4 %385 = OpLoad %329 
                              f32_2 %386 = OpVectorShuffle %385 %385 2 3 
                              f32_4 %387 = OpImageSampleImplicitLod %384 %386 
                              f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                              f32_4 %389 = OpLoad %329 
                              f32_4 %390 = OpVectorShuffle %389 %388 4 5 6 3 
                                             OpStore %329 %390 
                              f32_4 %391 = OpLoad %372 
                              f32_3 %392 = OpVectorShuffle %391 %391 0 1 2 
                              f32_4 %393 = OpLoad %372 
                              f32_3 %394 = OpVectorShuffle %393 %393 0 1 2 
                              f32_3 %395 = OpFMul %392 %394 
                              f32_4 %396 = OpLoad %47 
                              f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
                              f32_3 %398 = OpFAdd %395 %397 
                              f32_4 %399 = OpLoad %47 
                              f32_4 %400 = OpVectorShuffle %399 %398 4 5 6 3 
                                             OpStore %47 %400 
                              f32_4 %401 = OpLoad %76 
                              f32_3 %402 = OpVectorShuffle %401 %401 0 1 2 
                              f32_4 %403 = OpLoad %372 
                              f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                              f32_3 %405 = OpFAdd %402 %404 
                              f32_4 %406 = OpLoad %76 
                              f32_4 %407 = OpVectorShuffle %406 %405 4 5 6 3 
                                             OpStore %76 %407 
                              f32_2 %408 = OpLoad %54 
                              f32_4 %409 = OpVectorShuffle %408 %408 0 1 0 1 
                              f32_4 %411 = OpFMul %409 %410 
                              f32_4 %412 = OpLoad %9 
                              f32_4 %413 = OpVectorShuffle %412 %412 0 1 0 1 
                              f32_4 %414 = OpFAdd %411 %413 
                                             OpStore %372 %414 
                read_only Texture2D %416 = OpLoad %35 
                            sampler %417 = OpLoad %39 
         read_only Texture2DSampled %418 = OpSampledImage %416 %417 
                              f32_4 %419 = OpLoad %372 
                              f32_2 %420 = OpVectorShuffle %419 %419 0 1 
                              f32_4 %421 = OpImageSampleImplicitLod %418 %420 
                              f32_3 %422 = OpVectorShuffle %421 %421 0 1 2 
                              f32_4 %423 = OpLoad %415 
                              f32_4 %424 = OpVectorShuffle %423 %422 4 5 6 3 
                                             OpStore %415 %424 
                read_only Texture2D %425 = OpLoad %35 
                            sampler %426 = OpLoad %39 
         read_only Texture2DSampled %427 = OpSampledImage %425 %426 
                              f32_4 %428 = OpLoad %372 
                              f32_2 %429 = OpVectorShuffle %428 %428 2 3 
                              f32_4 %430 = OpImageSampleImplicitLod %427 %429 
                              f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
                              f32_4 %432 = OpLoad %372 
                              f32_4 %433 = OpVectorShuffle %432 %431 4 5 6 3 
                                             OpStore %372 %433 
                              f32_4 %434 = OpLoad %415 
                              f32_3 %435 = OpVectorShuffle %434 %434 0 1 2 
                              f32_4 %436 = OpLoad %415 
                              f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
                              f32_3 %438 = OpFMul %435 %437 
                              f32_4 %439 = OpLoad %47 
                              f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
                              f32_3 %441 = OpFAdd %438 %440 
                              f32_4 %442 = OpLoad %47 
                              f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
                                             OpStore %47 %443 
                              f32_4 %444 = OpLoad %76 
                              f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                              f32_4 %446 = OpLoad %415 
                              f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                              f32_3 %448 = OpFAdd %445 %447 
                              f32_4 %449 = OpLoad %76 
                              f32_4 %450 = OpVectorShuffle %449 %448 4 5 6 3 
                                             OpStore %76 %450 
                              f32_2 %451 = OpLoad %54 
                              f32_4 %452 = OpVectorShuffle %451 %451 0 1 0 1 
                              f32_4 %454 = OpFMul %452 %453 
                              f32_4 %455 = OpLoad %9 
                              f32_4 %456 = OpVectorShuffle %455 %455 0 1 0 1 
                              f32_4 %457 = OpFAdd %454 %456 
                                             OpStore %415 %457 
                read_only Texture2D %459 = OpLoad %35 
                            sampler %460 = OpLoad %39 
         read_only Texture2DSampled %461 = OpSampledImage %459 %460 
                              f32_4 %462 = OpLoad %415 
                              f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                              f32_4 %464 = OpImageSampleImplicitLod %461 %463 
                              f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                              f32_4 %466 = OpLoad %458 
                              f32_4 %467 = OpVectorShuffle %466 %465 4 5 6 3 
                                             OpStore %458 %467 
                read_only Texture2D %468 = OpLoad %35 
                            sampler %469 = OpLoad %39 
         read_only Texture2DSampled %470 = OpSampledImage %468 %469 
                              f32_4 %471 = OpLoad %415 
                              f32_2 %472 = OpVectorShuffle %471 %471 2 3 
                              f32_4 %473 = OpImageSampleImplicitLod %470 %472 
                              f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
                              f32_4 %475 = OpLoad %415 
                              f32_4 %476 = OpVectorShuffle %475 %474 4 5 6 3 
                                             OpStore %415 %476 
                              f32_4 %477 = OpLoad %458 
                              f32_3 %478 = OpVectorShuffle %477 %477 0 1 2 
                              f32_4 %479 = OpLoad %458 
                              f32_3 %480 = OpVectorShuffle %479 %479 0 1 2 
                              f32_3 %481 = OpFMul %478 %480 
                              f32_4 %482 = OpLoad %47 
                              f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                              f32_3 %484 = OpFAdd %481 %483 
                              f32_4 %485 = OpLoad %47 
                              f32_4 %486 = OpVectorShuffle %485 %484 4 5 6 3 
                                             OpStore %47 %486 
                              f32_4 %487 = OpLoad %76 
                              f32_3 %488 = OpVectorShuffle %487 %487 0 1 2 
                              f32_4 %489 = OpLoad %458 
                              f32_3 %490 = OpVectorShuffle %489 %489 0 1 2 
                              f32_3 %491 = OpFAdd %488 %490 
                              f32_4 %492 = OpLoad %76 
                              f32_4 %493 = OpVectorShuffle %492 %491 4 5 6 3 
                                             OpStore %76 %493 
                              f32_2 %494 = OpLoad %54 
                              f32_4 %495 = OpVectorShuffle %494 %494 0 1 0 1 
                              f32_4 %497 = OpFMul %495 %496 
                              f32_4 %498 = OpLoad %9 
                              f32_4 %499 = OpVectorShuffle %498 %498 0 1 0 1 
                              f32_4 %500 = OpFAdd %497 %499 
                                             OpStore %458 %500 
                read_only Texture2D %502 = OpLoad %35 
                            sampler %503 = OpLoad %39 
         read_only Texture2DSampled %504 = OpSampledImage %502 %503 
                              f32_4 %505 = OpLoad %458 
                              f32_2 %506 = OpVectorShuffle %505 %505 0 1 
                              f32_4 %507 = OpImageSampleImplicitLod %504 %506 
                              f32_3 %508 = OpVectorShuffle %507 %507 0 1 2 
                              f32_4 %509 = OpLoad %501 
                              f32_4 %510 = OpVectorShuffle %509 %508 4 5 6 3 
                                             OpStore %501 %510 
                read_only Texture2D %511 = OpLoad %35 
                            sampler %512 = OpLoad %39 
         read_only Texture2DSampled %513 = OpSampledImage %511 %512 
                              f32_4 %514 = OpLoad %458 
                              f32_2 %515 = OpVectorShuffle %514 %514 2 3 
                              f32_4 %516 = OpImageSampleImplicitLod %513 %515 
                              f32_3 %517 = OpVectorShuffle %516 %516 0 1 2 
                              f32_4 %518 = OpLoad %458 
                              f32_4 %519 = OpVectorShuffle %518 %517 4 5 6 3 
                                             OpStore %458 %519 
                              f32_4 %520 = OpLoad %501 
                              f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                              f32_4 %522 = OpLoad %501 
                              f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                              f32_3 %524 = OpFMul %521 %523 
                              f32_4 %525 = OpLoad %47 
                              f32_3 %526 = OpVectorShuffle %525 %525 0 1 2 
                              f32_3 %527 = OpFAdd %524 %526 
                              f32_4 %528 = OpLoad %47 
                              f32_4 %529 = OpVectorShuffle %528 %527 4 5 6 3 
                                             OpStore %47 %529 
                              f32_4 %530 = OpLoad %76 
                              f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                              f32_4 %532 = OpLoad %501 
                              f32_3 %533 = OpVectorShuffle %532 %532 0 1 2 
                              f32_3 %534 = OpFAdd %531 %533 
                              f32_4 %535 = OpLoad %76 
                              f32_4 %536 = OpVectorShuffle %535 %534 4 5 6 3 
                                             OpStore %76 %536 
                              f32_2 %537 = OpLoad %54 
                              f32_2 %539 = OpFMul %537 %538 
                              f32_4 %540 = OpLoad %9 
                              f32_2 %541 = OpVectorShuffle %540 %540 0 1 
                              f32_2 %542 = OpFAdd %539 %541 
                              f32_4 %543 = OpLoad %501 
                              f32_4 %544 = OpVectorShuffle %543 %542 4 5 2 3 
                                             OpStore %501 %544 
                read_only Texture2D %545 = OpLoad %35 
                            sampler %546 = OpLoad %39 
         read_only Texture2DSampled %547 = OpSampledImage %545 %546 
                              f32_4 %548 = OpLoad %501 
                              f32_2 %549 = OpVectorShuffle %548 %548 0 1 
                              f32_4 %550 = OpImageSampleImplicitLod %547 %549 
                              f32_3 %551 = OpVectorShuffle %550 %550 0 1 2 
                              f32_4 %552 = OpLoad %501 
                              f32_4 %553 = OpVectorShuffle %552 %551 4 5 6 3 
                                             OpStore %501 %553 
                              f32_4 %554 = OpLoad %501 
                              f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                              f32_4 %556 = OpLoad %501 
                              f32_3 %557 = OpVectorShuffle %556 %556 0 1 2 
                              f32_3 %558 = OpFMul %555 %557 
                              f32_4 %559 = OpLoad %47 
                              f32_3 %560 = OpVectorShuffle %559 %559 0 1 2 
                              f32_3 %561 = OpFAdd %558 %560 
                              f32_4 %562 = OpLoad %47 
                              f32_4 %563 = OpVectorShuffle %562 %561 4 5 6 3 
                                             OpStore %47 %563 
                              f32_4 %564 = OpLoad %76 
                              f32_3 %565 = OpVectorShuffle %564 %564 0 1 2 
                              f32_4 %566 = OpLoad %501 
                              f32_3 %567 = OpVectorShuffle %566 %566 0 1 2 
                              f32_3 %568 = OpFAdd %565 %567 
                              f32_4 %569 = OpLoad %76 
                              f32_4 %570 = OpVectorShuffle %569 %568 4 5 6 3 
                                             OpStore %76 %570 
                              f32_2 %571 = OpLoad %54 
                              f32_4 %572 = OpVectorShuffle %571 %571 0 1 0 1 
                              f32_4 %574 = OpFMul %572 %573 
                              f32_4 %575 = OpLoad %9 
                              f32_4 %576 = OpVectorShuffle %575 %575 0 1 0 1 
                              f32_4 %577 = OpFAdd %574 %576 
                                             OpStore %501 %577 
                read_only Texture2D %579 = OpLoad %35 
                            sampler %580 = OpLoad %39 
         read_only Texture2DSampled %581 = OpSampledImage %579 %580 
                              f32_4 %582 = OpLoad %501 
                              f32_2 %583 = OpVectorShuffle %582 %582 0 1 
                              f32_4 %584 = OpImageSampleImplicitLod %581 %583 
                              f32_3 %585 = OpVectorShuffle %584 %584 0 1 2 
                              f32_4 %586 = OpLoad %578 
                              f32_4 %587 = OpVectorShuffle %586 %585 4 5 6 3 
                                             OpStore %578 %587 
                read_only Texture2D %588 = OpLoad %35 
                            sampler %589 = OpLoad %39 
         read_only Texture2DSampled %590 = OpSampledImage %588 %589 
                              f32_4 %591 = OpLoad %501 
                              f32_2 %592 = OpVectorShuffle %591 %591 2 3 
                              f32_4 %593 = OpImageSampleImplicitLod %590 %592 
                              f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                              f32_4 %595 = OpLoad %501 
                              f32_4 %596 = OpVectorShuffle %595 %594 4 5 6 3 
                                             OpStore %501 %596 
                              f32_4 %597 = OpLoad %578 
                              f32_3 %598 = OpVectorShuffle %597 %597 0 1 2 
                              f32_4 %599 = OpLoad %578 
                              f32_3 %600 = OpVectorShuffle %599 %599 0 1 2 
                              f32_3 %601 = OpFMul %598 %600 
                              f32_4 %602 = OpLoad %47 
                              f32_3 %603 = OpVectorShuffle %602 %602 0 1 2 
                              f32_3 %604 = OpFAdd %601 %603 
                              f32_4 %605 = OpLoad %47 
                              f32_4 %606 = OpVectorShuffle %605 %604 4 5 6 3 
                                             OpStore %47 %606 
                              f32_4 %607 = OpLoad %76 
                              f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                              f32_4 %609 = OpLoad %578 
                              f32_3 %610 = OpVectorShuffle %609 %609 0 1 2 
                              f32_3 %611 = OpFAdd %608 %610 
                              f32_4 %612 = OpLoad %76 
                              f32_4 %613 = OpVectorShuffle %612 %611 4 5 6 3 
                                             OpStore %76 %613 
                              f32_2 %614 = OpLoad %54 
                              f32_4 %615 = OpVectorShuffle %614 %614 0 1 0 1 
                              f32_4 %617 = OpFMul %615 %616 
                              f32_4 %618 = OpLoad %9 
                              f32_4 %619 = OpVectorShuffle %618 %618 0 1 0 1 
                              f32_4 %620 = OpFAdd %617 %619 
                                             OpStore %578 %620 
                read_only Texture2D %622 = OpLoad %35 
                            sampler %623 = OpLoad %39 
         read_only Texture2DSampled %624 = OpSampledImage %622 %623 
                              f32_4 %625 = OpLoad %578 
                              f32_2 %626 = OpVectorShuffle %625 %625 0 1 
                              f32_4 %627 = OpImageSampleImplicitLod %624 %626 
                              f32_3 %628 = OpVectorShuffle %627 %627 0 1 2 
                              f32_4 %629 = OpLoad %621 
                              f32_4 %630 = OpVectorShuffle %629 %628 4 5 6 3 
                                             OpStore %621 %630 
                read_only Texture2D %631 = OpLoad %35 
                            sampler %632 = OpLoad %39 
         read_only Texture2DSampled %633 = OpSampledImage %631 %632 
                              f32_4 %634 = OpLoad %578 
                              f32_2 %635 = OpVectorShuffle %634 %634 2 3 
                              f32_4 %636 = OpImageSampleImplicitLod %633 %635 
                              f32_3 %637 = OpVectorShuffle %636 %636 0 1 2 
                              f32_4 %638 = OpLoad %578 
                              f32_4 %639 = OpVectorShuffle %638 %637 4 5 6 3 
                                             OpStore %578 %639 
                              f32_4 %640 = OpLoad %621 
                              f32_3 %641 = OpVectorShuffle %640 %640 0 1 2 
                              f32_4 %642 = OpLoad %621 
                              f32_3 %643 = OpVectorShuffle %642 %642 0 1 2 
                              f32_3 %644 = OpFMul %641 %643 
                              f32_4 %645 = OpLoad %47 
                              f32_3 %646 = OpVectorShuffle %645 %645 0 1 2 
                              f32_3 %647 = OpFAdd %644 %646 
                              f32_4 %648 = OpLoad %47 
                              f32_4 %649 = OpVectorShuffle %648 %647 4 5 6 3 
                                             OpStore %47 %649 
                              f32_4 %650 = OpLoad %76 
                              f32_3 %651 = OpVectorShuffle %650 %650 0 1 2 
                              f32_4 %652 = OpLoad %621 
                              f32_3 %653 = OpVectorShuffle %652 %652 0 1 2 
                              f32_3 %654 = OpFAdd %651 %653 
                              f32_4 %655 = OpLoad %76 
                              f32_4 %656 = OpVectorShuffle %655 %654 4 5 6 3 
                                             OpStore %76 %656 
                              f32_2 %657 = OpLoad %54 
                              f32_4 %658 = OpVectorShuffle %657 %657 0 1 0 1 
                              f32_4 %660 = OpFMul %658 %659 
                              f32_4 %661 = OpLoad %9 
                              f32_4 %662 = OpVectorShuffle %661 %661 0 1 0 1 
                              f32_4 %663 = OpFAdd %660 %662 
                                             OpStore %621 %663 
                read_only Texture2D %665 = OpLoad %35 
                            sampler %666 = OpLoad %39 
         read_only Texture2DSampled %667 = OpSampledImage %665 %666 
                              f32_4 %668 = OpLoad %621 
                              f32_2 %669 = OpVectorShuffle %668 %668 0 1 
                              f32_4 %670 = OpImageSampleImplicitLod %667 %669 
                              f32_3 %671 = OpVectorShuffle %670 %670 0 1 2 
                              f32_4 %672 = OpLoad %664 
                              f32_4 %673 = OpVectorShuffle %672 %671 4 5 6 3 
                                             OpStore %664 %673 
                read_only Texture2D %674 = OpLoad %35 
                            sampler %675 = OpLoad %39 
         read_only Texture2DSampled %676 = OpSampledImage %674 %675 
                              f32_4 %677 = OpLoad %621 
                              f32_2 %678 = OpVectorShuffle %677 %677 2 3 
                              f32_4 %679 = OpImageSampleImplicitLod %676 %678 
                              f32_3 %680 = OpVectorShuffle %679 %679 0 1 2 
                              f32_4 %681 = OpLoad %621 
                              f32_4 %682 = OpVectorShuffle %681 %680 4 5 6 3 
                                             OpStore %621 %682 
                              f32_4 %683 = OpLoad %664 
                              f32_3 %684 = OpVectorShuffle %683 %683 0 1 2 
                              f32_4 %685 = OpLoad %664 
                              f32_3 %686 = OpVectorShuffle %685 %685 0 1 2 
                              f32_3 %687 = OpFMul %684 %686 
                              f32_4 %688 = OpLoad %47 
                              f32_3 %689 = OpVectorShuffle %688 %688 0 1 2 
                              f32_3 %690 = OpFAdd %687 %689 
                              f32_4 %691 = OpLoad %47 
                              f32_4 %692 = OpVectorShuffle %691 %690 4 5 6 3 
                                             OpStore %47 %692 
                              f32_4 %693 = OpLoad %76 
                              f32_3 %694 = OpVectorShuffle %693 %693 0 1 2 
                              f32_4 %695 = OpLoad %664 
                              f32_3 %696 = OpVectorShuffle %695 %695 0 1 2 
                              f32_3 %697 = OpFAdd %694 %696 
                              f32_4 %698 = OpLoad %76 
                              f32_4 %699 = OpVectorShuffle %698 %697 4 5 6 3 
                                             OpStore %76 %699 
                              f32_2 %700 = OpLoad %54 
                              f32_4 %701 = OpVectorShuffle %700 %700 0 1 0 1 
                              f32_4 %703 = OpFMul %701 %702 
                              f32_4 %704 = OpLoad %9 
                              f32_4 %705 = OpVectorShuffle %704 %704 0 1 0 1 
                              f32_4 %706 = OpFAdd %703 %705 
                                             OpStore %664 %706 
                read_only Texture2D %708 = OpLoad %35 
                            sampler %709 = OpLoad %39 
         read_only Texture2DSampled %710 = OpSampledImage %708 %709 
                              f32_4 %711 = OpLoad %664 
                              f32_2 %712 = OpVectorShuffle %711 %711 0 1 
                              f32_4 %713 = OpImageSampleImplicitLod %710 %712 
                              f32_3 %714 = OpVectorShuffle %713 %713 0 1 2 
                              f32_4 %715 = OpLoad %707 
                              f32_4 %716 = OpVectorShuffle %715 %714 4 5 6 3 
                                             OpStore %707 %716 
                read_only Texture2D %717 = OpLoad %35 
                            sampler %718 = OpLoad %39 
         read_only Texture2DSampled %719 = OpSampledImage %717 %718 
                              f32_4 %720 = OpLoad %664 
                              f32_2 %721 = OpVectorShuffle %720 %720 2 3 
                              f32_4 %722 = OpImageSampleImplicitLod %719 %721 
                              f32_3 %723 = OpVectorShuffle %722 %722 0 1 2 
                              f32_4 %724 = OpLoad %664 
                              f32_4 %725 = OpVectorShuffle %724 %723 4 5 6 3 
                                             OpStore %664 %725 
                              f32_4 %726 = OpLoad %707 
                              f32_3 %727 = OpVectorShuffle %726 %726 0 1 2 
                              f32_4 %728 = OpLoad %707 
                              f32_3 %729 = OpVectorShuffle %728 %728 0 1 2 
                              f32_3 %730 = OpFMul %727 %729 
                              f32_4 %731 = OpLoad %47 
                              f32_3 %732 = OpVectorShuffle %731 %731 0 1 2 
                              f32_3 %733 = OpFAdd %730 %732 
                              f32_4 %734 = OpLoad %47 
                              f32_4 %735 = OpVectorShuffle %734 %733 4 5 6 3 
                                             OpStore %47 %735 
                              f32_4 %736 = OpLoad %76 
                              f32_3 %737 = OpVectorShuffle %736 %736 0 1 2 
                              f32_4 %738 = OpLoad %707 
                              f32_3 %739 = OpVectorShuffle %738 %738 0 1 2 
                              f32_3 %740 = OpFAdd %737 %739 
                              f32_4 %741 = OpLoad %76 
                              f32_4 %742 = OpVectorShuffle %741 %740 4 5 6 3 
                                             OpStore %76 %742 
                              f32_2 %743 = OpLoad %54 
                              f32_4 %744 = OpVectorShuffle %743 %743 0 1 0 1 
                              f32_4 %746 = OpFMul %744 %745 
                              f32_4 %747 = OpLoad %9 
                              f32_4 %748 = OpVectorShuffle %747 %747 0 1 0 1 
                              f32_4 %749 = OpFAdd %746 %748 
                                             OpStore %707 %749 
                read_only Texture2D %751 = OpLoad %35 
                            sampler %752 = OpLoad %39 
         read_only Texture2DSampled %753 = OpSampledImage %751 %752 
                              f32_4 %754 = OpLoad %707 
                              f32_2 %755 = OpVectorShuffle %754 %754 0 1 
                              f32_4 %756 = OpImageSampleImplicitLod %753 %755 
                              f32_3 %757 = OpVectorShuffle %756 %756 0 1 2 
                              f32_4 %758 = OpLoad %750 
                              f32_4 %759 = OpVectorShuffle %758 %757 4 5 6 3 
                                             OpStore %750 %759 
                read_only Texture2D %760 = OpLoad %35 
                            sampler %761 = OpLoad %39 
         read_only Texture2DSampled %762 = OpSampledImage %760 %761 
                              f32_4 %763 = OpLoad %707 
                              f32_2 %764 = OpVectorShuffle %763 %763 2 3 
                              f32_4 %765 = OpImageSampleImplicitLod %762 %764 
                              f32_3 %766 = OpVectorShuffle %765 %765 0 1 2 
                              f32_4 %767 = OpLoad %707 
                              f32_4 %768 = OpVectorShuffle %767 %766 4 5 6 3 
                                             OpStore %707 %768 
                              f32_4 %769 = OpLoad %750 
                              f32_3 %770 = OpVectorShuffle %769 %769 0 1 2 
                              f32_4 %771 = OpLoad %750 
                              f32_3 %772 = OpVectorShuffle %771 %771 0 1 2 
                              f32_3 %773 = OpFMul %770 %772 
                              f32_4 %774 = OpLoad %47 
                              f32_3 %775 = OpVectorShuffle %774 %774 0 1 2 
                              f32_3 %776 = OpFAdd %773 %775 
                              f32_4 %777 = OpLoad %47 
                              f32_4 %778 = OpVectorShuffle %777 %776 4 5 6 3 
                                             OpStore %47 %778 
                              f32_4 %779 = OpLoad %76 
                              f32_3 %780 = OpVectorShuffle %779 %779 0 1 2 
                              f32_4 %781 = OpLoad %750 
                              f32_3 %782 = OpVectorShuffle %781 %781 0 1 2 
                              f32_3 %783 = OpFAdd %780 %782 
                              f32_4 %784 = OpLoad %76 
                              f32_4 %785 = OpVectorShuffle %784 %783 4 5 6 3 
                                             OpStore %76 %785 
                              f32_4 %786 = OpLoad %707 
                              f32_3 %787 = OpVectorShuffle %786 %786 0 1 2 
                              f32_4 %788 = OpLoad %76 
                              f32_3 %789 = OpVectorShuffle %788 %788 0 1 2 
                              f32_3 %790 = OpFAdd %787 %789 
                              f32_4 %791 = OpLoad %76 
                              f32_4 %792 = OpVectorShuffle %791 %790 4 5 6 3 
                                             OpStore %76 %792 
                              f32_4 %793 = OpLoad %707 
                              f32_3 %794 = OpVectorShuffle %793 %793 0 1 2 
                              f32_4 %795 = OpLoad %707 
                              f32_3 %796 = OpVectorShuffle %795 %795 0 1 2 
                              f32_3 %797 = OpFMul %794 %796 
                              f32_4 %798 = OpLoad %47 
                              f32_3 %799 = OpVectorShuffle %798 %798 0 1 2 
                              f32_3 %800 = OpFAdd %797 %799 
                              f32_4 %801 = OpLoad %47 
                              f32_4 %802 = OpVectorShuffle %801 %800 4 5 6 3 
                                             OpStore %47 %802 
                              f32_2 %803 = OpLoad %54 
                              f32_4 %804 = OpVectorShuffle %803 %803 0 1 0 1 
                              f32_4 %806 = OpFMul %804 %805 
                              f32_4 %807 = OpLoad %9 
                              f32_4 %808 = OpVectorShuffle %807 %807 0 1 0 1 
                              f32_4 %809 = OpFAdd %806 %808 
                                             OpStore %707 %809 
                read_only Texture2D %810 = OpLoad %35 
                            sampler %811 = OpLoad %39 
         read_only Texture2DSampled %812 = OpSampledImage %810 %811 
                              f32_4 %813 = OpLoad %707 
                              f32_2 %814 = OpVectorShuffle %813 %813 2 3 
                              f32_4 %815 = OpImageSampleImplicitLod %812 %814 
                              f32_3 %816 = OpVectorShuffle %815 %815 0 1 2 
                              f32_4 %817 = OpLoad %750 
                              f32_4 %818 = OpVectorShuffle %817 %816 4 5 6 3 
                                             OpStore %750 %818 
                read_only Texture2D %819 = OpLoad %35 
                            sampler %820 = OpLoad %39 
         read_only Texture2DSampled %821 = OpSampledImage %819 %820 
                              f32_4 %822 = OpLoad %707 
                              f32_2 %823 = OpVectorShuffle %822 %822 0 1 
                              f32_4 %824 = OpImageSampleImplicitLod %821 %823 
                              f32_3 %825 = OpVectorShuffle %824 %824 0 1 2 
                              f32_4 %826 = OpLoad %707 
                              f32_4 %827 = OpVectorShuffle %826 %825 4 5 6 3 
                                             OpStore %707 %827 
                              f32_4 %828 = OpLoad %750 
                              f32_3 %829 = OpVectorShuffle %828 %828 0 1 2 
                              f32_4 %830 = OpLoad %750 
                              f32_3 %831 = OpVectorShuffle %830 %830 0 1 2 
                              f32_3 %832 = OpFMul %829 %831 
                              f32_4 %833 = OpLoad %47 
                              f32_3 %834 = OpVectorShuffle %833 %833 0 1 2 
                              f32_3 %835 = OpFAdd %832 %834 
                              f32_4 %836 = OpLoad %47 
                              f32_4 %837 = OpVectorShuffle %836 %835 4 5 6 3 
                                             OpStore %47 %837 
                              f32_4 %838 = OpLoad %76 
                              f32_3 %839 = OpVectorShuffle %838 %838 0 1 2 
                              f32_4 %840 = OpLoad %750 
                              f32_3 %841 = OpVectorShuffle %840 %840 0 1 2 
                              f32_3 %842 = OpFAdd %839 %841 
                              f32_4 %843 = OpLoad %76 
                              f32_4 %844 = OpVectorShuffle %843 %842 4 5 6 3 
                                             OpStore %76 %844 
                              f32_2 %845 = OpLoad %54 
                              f32_4 %846 = OpVectorShuffle %845 %845 0 1 0 1 
                              f32_4 %848 = OpFMul %846 %847 
                              f32_4 %849 = OpLoad %9 
                              f32_4 %850 = OpVectorShuffle %849 %849 0 1 0 1 
                              f32_4 %851 = OpFAdd %848 %850 
                                             OpStore %750 %851 
                read_only Texture2D %853 = OpLoad %35 
                            sampler %854 = OpLoad %39 
         read_only Texture2DSampled %855 = OpSampledImage %853 %854 
                              f32_4 %856 = OpLoad %750 
                              f32_2 %857 = OpVectorShuffle %856 %856 2 3 
                              f32_4 %858 = OpImageSampleImplicitLod %855 %857 
                              f32_3 %859 = OpVectorShuffle %858 %858 0 1 2 
                              f32_4 %860 = OpLoad %852 
                              f32_4 %861 = OpVectorShuffle %860 %859 4 5 6 3 
                                             OpStore %852 %861 
                read_only Texture2D %862 = OpLoad %35 
                            sampler %863 = OpLoad %39 
         read_only Texture2DSampled %864 = OpSampledImage %862 %863 
                              f32_4 %865 = OpLoad %750 
                              f32_2 %866 = OpVectorShuffle %865 %865 0 1 
                              f32_4 %867 = OpImageSampleImplicitLod %864 %866 
                              f32_3 %868 = OpVectorShuffle %867 %867 0 1 2 
                              f32_4 %869 = OpLoad %750 
                              f32_4 %870 = OpVectorShuffle %869 %868 4 5 6 3 
                                             OpStore %750 %870 
                              f32_4 %871 = OpLoad %852 
                              f32_3 %872 = OpVectorShuffle %871 %871 0 1 2 
                              f32_4 %873 = OpLoad %852 
                              f32_3 %874 = OpVectorShuffle %873 %873 0 1 2 
                              f32_3 %875 = OpFMul %872 %874 
                              f32_4 %876 = OpLoad %47 
                              f32_3 %877 = OpVectorShuffle %876 %876 0 1 2 
                              f32_3 %878 = OpFAdd %875 %877 
                              f32_4 %879 = OpLoad %47 
                              f32_4 %880 = OpVectorShuffle %879 %878 4 5 6 3 
                                             OpStore %47 %880 
                              f32_4 %881 = OpLoad %76 
                              f32_3 %882 = OpVectorShuffle %881 %881 0 1 2 
                              f32_4 %883 = OpLoad %852 
                              f32_3 %884 = OpVectorShuffle %883 %883 0 1 2 
                              f32_3 %885 = OpFAdd %882 %884 
                              f32_4 %886 = OpLoad %76 
                              f32_4 %887 = OpVectorShuffle %886 %885 4 5 6 3 
                                             OpStore %76 %887 
                              f32_2 %888 = OpLoad %54 
                              f32_4 %889 = OpVectorShuffle %888 %888 0 1 0 1 
                              f32_4 %891 = OpFMul %889 %890 
                              f32_4 %892 = OpLoad %9 
                              f32_4 %893 = OpVectorShuffle %892 %892 0 1 0 1 
                              f32_4 %894 = OpFAdd %891 %893 
                                             OpStore %852 %894 
                read_only Texture2D %896 = OpLoad %35 
                            sampler %897 = OpLoad %39 
         read_only Texture2DSampled %898 = OpSampledImage %896 %897 
                              f32_4 %899 = OpLoad %852 
                              f32_2 %900 = OpVectorShuffle %899 %899 2 3 
                              f32_4 %901 = OpImageSampleImplicitLod %898 %900 
                              f32_3 %902 = OpVectorShuffle %901 %901 0 1 2 
                              f32_4 %903 = OpLoad %895 
                              f32_4 %904 = OpVectorShuffle %903 %902 4 5 6 3 
                                             OpStore %895 %904 
                read_only Texture2D %905 = OpLoad %35 
                            sampler %906 = OpLoad %39 
         read_only Texture2DSampled %907 = OpSampledImage %905 %906 
                              f32_4 %908 = OpLoad %852 
                              f32_2 %909 = OpVectorShuffle %908 %908 0 1 
                              f32_4 %910 = OpImageSampleImplicitLod %907 %909 
                              f32_3 %911 = OpVectorShuffle %910 %910 0 1 2 
                              f32_4 %912 = OpLoad %852 
                              f32_4 %913 = OpVectorShuffle %912 %911 4 5 6 3 
                                             OpStore %852 %913 
                              f32_4 %914 = OpLoad %895 
                              f32_3 %915 = OpVectorShuffle %914 %914 0 1 2 
                              f32_4 %916 = OpLoad %895 
                              f32_3 %917 = OpVectorShuffle %916 %916 0 1 2 
                              f32_3 %918 = OpFMul %915 %917 
                              f32_4 %919 = OpLoad %47 
                              f32_3 %920 = OpVectorShuffle %919 %919 0 1 2 
                              f32_3 %921 = OpFAdd %918 %920 
                              f32_4 %922 = OpLoad %47 
                              f32_4 %923 = OpVectorShuffle %922 %921 4 5 6 3 
                                             OpStore %47 %923 
                              f32_4 %924 = OpLoad %76 
                              f32_3 %925 = OpVectorShuffle %924 %924 0 1 2 
                              f32_4 %926 = OpLoad %895 
                              f32_3 %927 = OpVectorShuffle %926 %926 0 1 2 
                              f32_3 %928 = OpFAdd %925 %927 
                              f32_4 %929 = OpLoad %76 
                              f32_4 %930 = OpVectorShuffle %929 %928 4 5 6 3 
                                             OpStore %76 %930 
                              f32_2 %931 = OpLoad %54 
                              f32_4 %932 = OpVectorShuffle %931 %931 0 1 0 1 
                              f32_4 %934 = OpFMul %932 %933 
                              f32_4 %935 = OpLoad %9 
                              f32_4 %936 = OpVectorShuffle %935 %935 0 1 0 1 
                              f32_4 %937 = OpFAdd %934 %936 
                                             OpStore %895 %937 
                read_only Texture2D %939 = OpLoad %35 
                            sampler %940 = OpLoad %39 
         read_only Texture2DSampled %941 = OpSampledImage %939 %940 
                              f32_4 %942 = OpLoad %895 
                              f32_2 %943 = OpVectorShuffle %942 %942 2 3 
                              f32_4 %944 = OpImageSampleImplicitLod %941 %943 
                              f32_3 %945 = OpVectorShuffle %944 %944 0 1 2 
                              f32_4 %946 = OpLoad %938 
                              f32_4 %947 = OpVectorShuffle %946 %945 4 5 6 3 
                                             OpStore %938 %947 
                read_only Texture2D %948 = OpLoad %35 
                            sampler %949 = OpLoad %39 
         read_only Texture2DSampled %950 = OpSampledImage %948 %949 
                              f32_4 %951 = OpLoad %895 
                              f32_2 %952 = OpVectorShuffle %951 %951 0 1 
                              f32_4 %953 = OpImageSampleImplicitLod %950 %952 
                              f32_3 %954 = OpVectorShuffle %953 %953 0 1 2 
                              f32_4 %955 = OpLoad %895 
                              f32_4 %956 = OpVectorShuffle %955 %954 4 5 6 3 
                                             OpStore %895 %956 
                              f32_4 %957 = OpLoad %938 
                              f32_3 %958 = OpVectorShuffle %957 %957 0 1 2 
                              f32_4 %959 = OpLoad %938 
                              f32_3 %960 = OpVectorShuffle %959 %959 0 1 2 
                              f32_3 %961 = OpFMul %958 %960 
                              f32_4 %962 = OpLoad %47 
                              f32_3 %963 = OpVectorShuffle %962 %962 0 1 2 
                              f32_3 %964 = OpFAdd %961 %963 
                              f32_4 %965 = OpLoad %47 
                              f32_4 %966 = OpVectorShuffle %965 %964 4 5 6 3 
                                             OpStore %47 %966 
                              f32_4 %967 = OpLoad %76 
                              f32_3 %968 = OpVectorShuffle %967 %967 0 1 2 
                              f32_4 %969 = OpLoad %938 
                              f32_3 %970 = OpVectorShuffle %969 %969 0 1 2 
                              f32_3 %971 = OpFAdd %968 %970 
                              f32_4 %972 = OpLoad %76 
                              f32_4 %973 = OpVectorShuffle %972 %971 4 5 6 3 
                                             OpStore %76 %973 
                              f32_2 %974 = OpLoad %54 
                              f32_4 %975 = OpVectorShuffle %974 %974 0 1 0 1 
                              f32_4 %977 = OpFMul %975 %976 
                              f32_4 %978 = OpLoad %9 
                              f32_4 %979 = OpVectorShuffle %978 %978 0 1 0 1 
                              f32_4 %980 = OpFAdd %977 %979 
                                             OpStore %938 %980 
                read_only Texture2D %982 = OpLoad %35 
                            sampler %983 = OpLoad %39 
         read_only Texture2DSampled %984 = OpSampledImage %982 %983 
                              f32_4 %985 = OpLoad %938 
                              f32_2 %986 = OpVectorShuffle %985 %985 2 3 
                              f32_4 %987 = OpImageSampleImplicitLod %984 %986 
                              f32_3 %988 = OpVectorShuffle %987 %987 0 1 2 
                                             OpStore %981 %988 
                read_only Texture2D %989 = OpLoad %35 
                            sampler %990 = OpLoad %39 
         read_only Texture2DSampled %991 = OpSampledImage %989 %990 
                              f32_4 %992 = OpLoad %938 
                              f32_2 %993 = OpVectorShuffle %992 %992 0 1 
                              f32_4 %994 = OpImageSampleImplicitLod %991 %993 
                              f32_3 %995 = OpVectorShuffle %994 %994 0 1 2 
                              f32_4 %996 = OpLoad %938 
                              f32_4 %997 = OpVectorShuffle %996 %995 4 5 6 3 
                                             OpStore %938 %997 
                              f32_3 %998 = OpLoad %981 
                              f32_3 %999 = OpLoad %981 
                             f32_3 %1000 = OpFMul %998 %999 
                             f32_4 %1001 = OpLoad %47 
                             f32_3 %1002 = OpVectorShuffle %1001 %1001 0 1 2 
                             f32_3 %1003 = OpFAdd %1000 %1002 
                             f32_4 %1004 = OpLoad %47 
                             f32_4 %1005 = OpVectorShuffle %1004 %1003 4 5 6 3 
                                             OpStore %47 %1005 
                             f32_4 %1006 = OpLoad %76 
                             f32_3 %1007 = OpVectorShuffle %1006 %1006 0 1 2 
                             f32_3 %1008 = OpLoad %981 
                             f32_3 %1009 = OpFAdd %1007 %1008 
                             f32_4 %1010 = OpLoad %76 
                             f32_4 %1011 = OpVectorShuffle %1010 %1009 4 5 6 3 
                                             OpStore %76 %1011 
                             f32_2 %1012 = OpLoad %54 
                             f32_2 %1014 = OpFMul %1012 %1013 
                             f32_4 %1015 = OpLoad %9 
                             f32_2 %1016 = OpVectorShuffle %1015 %1015 0 1 
                             f32_2 %1017 = OpFAdd %1014 %1016 
                             f32_3 %1018 = OpLoad %981 
                             f32_3 %1019 = OpVectorShuffle %1018 %1017 3 4 2 
                                             OpStore %981 %1019 
               read_only Texture2D %1020 = OpLoad %35 
                           sampler %1021 = OpLoad %39 
        read_only Texture2DSampled %1022 = OpSampledImage %1020 %1021 
                             f32_3 %1023 = OpLoad %981 
                             f32_2 %1024 = OpVectorShuffle %1023 %1023 0 1 
                             f32_4 %1025 = OpImageSampleImplicitLod %1022 %1024 
                             f32_3 %1026 = OpVectorShuffle %1025 %1025 0 1 2 
                                             OpStore %981 %1026 
                             f32_3 %1027 = OpLoad %981 
                             f32_3 %1028 = OpLoad %981 
                             f32_3 %1029 = OpFMul %1027 %1028 
                             f32_4 %1030 = OpLoad %47 
                             f32_3 %1031 = OpVectorShuffle %1030 %1030 0 1 2 
                             f32_3 %1032 = OpFAdd %1029 %1031 
                             f32_4 %1033 = OpLoad %47 
                             f32_4 %1034 = OpVectorShuffle %1033 %1032 4 5 6 3 
                                             OpStore %47 %1034 
                             f32_4 %1035 = OpLoad %76 
                             f32_3 %1036 = OpVectorShuffle %1035 %1035 0 1 2 
                             f32_3 %1037 = OpLoad %981 
                             f32_3 %1038 = OpFAdd %1036 %1037 
                             f32_4 %1039 = OpLoad %76 
                             f32_4 %1040 = OpVectorShuffle %1039 %1038 4 5 6 3 
                                             OpStore %76 %1040 
                             f32_4 %1041 = OpLoad %76 
                             f32_3 %1042 = OpVectorShuffle %1041 %1041 0 1 2 
                             f32_3 %1045 = OpFMul %1042 %1044 
                             f32_4 %1046 = OpLoad %76 
                             f32_4 %1047 = OpVectorShuffle %1046 %1045 4 5 6 3 
                                             OpStore %76 %1047 
                             f32_4 %1048 = OpLoad %76 
                             f32_3 %1049 = OpVectorShuffle %1048 %1048 0 1 2 
                             f32_4 %1050 = OpLoad %76 
                             f32_3 %1051 = OpVectorShuffle %1050 %1050 0 1 2 
                             f32_3 %1052 = OpFMul %1049 %1051 
                                             OpStore %981 %1052 
                             f32_4 %1053 = OpLoad %47 
                             f32_3 %1054 = OpVectorShuffle %1053 %1053 0 1 2 
                             f32_3 %1055 = OpFMul %1054 %1044 
                             f32_3 %1056 = OpLoad %981 
                             f32_3 %1057 = OpFNegate %1056 
                             f32_3 %1058 = OpFAdd %1055 %1057 
                             f32_4 %1059 = OpLoad %47 
                             f32_4 %1060 = OpVectorShuffle %1059 %1058 4 5 6 3 
                                             OpStore %47 %1060 
                      Private f32* %1065 = OpAccessChain %47 %1064 
                               f32 %1066 = OpLoad %1065 
                               f32 %1067 = OpExtInst %1 4 %1066 
                      Private f32* %1069 = OpAccessChain %47 %1068 
                               f32 %1070 = OpLoad %1069 
                               f32 %1071 = OpExtInst %1 4 %1070 
                               f32 %1072 = OpFAdd %1067 %1071 
                                             OpStore %1062 %1072 
                      Private f32* %1074 = OpAccessChain %47 %1073 
                               f32 %1075 = OpLoad %1074 
                               f32 %1076 = OpExtInst %1 4 %1075 
                               f32 %1077 = OpLoad %1062 
                               f32 %1078 = OpFAdd %1076 %1077 
                                             OpStore %1062 %1078 
                             f32_2 %1079 = OpLoad %54 
                             f32_4 %1080 = OpVectorShuffle %1079 %1079 0 1 0 1 
                             f32_4 %1082 = OpFMul %1080 %1081 
                             f32_4 %1083 = OpLoad %9 
                             f32_4 %1084 = OpVectorShuffle %1083 %1083 0 1 0 1 
                             f32_4 %1085 = OpFAdd %1082 %1084 
                                             OpStore %47 %1085 
                             f32_2 %1086 = OpLoad %54 
                             f32_2 %1087 = OpFNegate %1086 
                             f32_4 %1088 = OpLoad %9 
                             f32_2 %1089 = OpVectorShuffle %1088 %1088 0 1 
                             f32_2 %1090 = OpFAdd %1087 %1089 
                             f32_4 %1091 = OpLoad %9 
                             f32_4 %1092 = OpVectorShuffle %1091 %1090 4 5 2 3 
                                             OpStore %9 %1092 
               read_only Texture2D %1093 = OpLoad %35 
                           sampler %1094 = OpLoad %39 
        read_only Texture2DSampled %1095 = OpSampledImage %1093 %1094 
                             f32_4 %1096 = OpLoad %9 
                             f32_2 %1097 = OpVectorShuffle %1096 %1096 0 1 
                             f32_4 %1098 = OpImageSampleImplicitLod %1095 %1097 
                             f32_3 %1099 = OpVectorShuffle %1098 %1098 0 1 2 
                             f32_4 %1100 = OpLoad %9 
                             f32_4 %1101 = OpVectorShuffle %1100 %1099 4 5 6 3 
                                             OpStore %9 %1101 
               read_only Texture2D %1102 = OpLoad %35 
                           sampler %1103 = OpLoad %39 
        read_only Texture2DSampled %1104 = OpSampledImage %1102 %1103 
                             f32_4 %1105 = OpLoad %47 
                             f32_2 %1106 = OpVectorShuffle %1105 %1105 0 1 
                             f32_4 %1107 = OpImageSampleImplicitLod %1104 %1106 
                             f32_3 %1108 = OpVectorShuffle %1107 %1107 0 1 2 
                                             OpStore %981 %1108 
               read_only Texture2D %1109 = OpLoad %35 
                           sampler %1110 = OpLoad %39 
        read_only Texture2DSampled %1111 = OpSampledImage %1109 %1110 
                             f32_4 %1112 = OpLoad %47 
                             f32_2 %1113 = OpVectorShuffle %1112 %1112 2 3 
                             f32_4 %1114 = OpImageSampleImplicitLod %1111 %1113 
                             f32_3 %1115 = OpVectorShuffle %1114 %1114 0 1 2 
                             f32_4 %1116 = OpLoad %47 
                             f32_4 %1117 = OpVectorShuffle %1116 %1115 4 5 6 3 
                                             OpStore %47 %1117 
                             f32_4 %1119 = OpLoad %47 
                             f32_3 %1120 = OpVectorShuffle %1119 %1119 0 1 2 
                             f32_4 %1121 = OpLoad %47 
                             f32_3 %1122 = OpVectorShuffle %1121 %1121 0 1 2 
                             f32_3 %1123 = OpFMul %1120 %1122 
                                             OpStore %1118 %1123 
                             f32_3 %1124 = OpLoad %981 
                             f32_3 %1125 = OpLoad %981 
                             f32_3 %1126 = OpFMul %1124 %1125 
                             f32_3 %1127 = OpLoad %1118 
                             f32_3 %1128 = OpFAdd %1126 %1127 
                                             OpStore %1118 %1128 
                             f32_4 %1129 = OpLoad %47 
                             f32_3 %1130 = OpVectorShuffle %1129 %1129 0 1 2 
                             f32_3 %1131 = OpLoad %981 
                             f32_3 %1132 = OpFAdd %1130 %1131 
                                             OpStore %981 %1132 
                             f32_4 %1133 = OpLoad %65 
                             f32_3 %1134 = OpVectorShuffle %1133 %1133 0 1 2 
                             f32_3 %1135 = OpLoad %981 
                             f32_3 %1136 = OpFAdd %1134 %1135 
                                             OpStore %981 %1136 
                             f32_4 %1137 = OpLoad %65 
                             f32_3 %1138 = OpVectorShuffle %1137 %1137 0 1 2 
                             f32_4 %1139 = OpLoad %65 
                             f32_3 %1140 = OpVectorShuffle %1139 %1139 0 1 2 
                             f32_3 %1141 = OpFMul %1138 %1140 
                             f32_3 %1142 = OpLoad %1118 
                             f32_3 %1143 = OpFAdd %1141 %1142 
                             f32_4 %1144 = OpLoad %65 
                             f32_4 %1145 = OpVectorShuffle %1144 %1143 4 5 6 3 
                                             OpStore %65 %1145 
                             f32_4 %1146 = OpLoad %111 
                             f32_3 %1147 = OpVectorShuffle %1146 %1146 0 1 2 
                             f32_4 %1148 = OpLoad %111 
                             f32_3 %1149 = OpVectorShuffle %1148 %1148 0 1 2 
                             f32_3 %1150 = OpFMul %1147 %1149 
                             f32_4 %1151 = OpLoad %65 
                             f32_3 %1152 = OpVectorShuffle %1151 %1151 0 1 2 
                             f32_3 %1153 = OpFAdd %1150 %1152 
                             f32_4 %1154 = OpLoad %65 
                             f32_4 %1155 = OpVectorShuffle %1154 %1153 4 5 6 3 
                                             OpStore %65 %1155 
                             f32_4 %1156 = OpLoad %111 
                             f32_3 %1157 = OpVectorShuffle %1156 %1156 0 1 2 
                             f32_3 %1158 = OpLoad %981 
                             f32_3 %1159 = OpFAdd %1157 %1158 
                             f32_4 %1160 = OpLoad %111 
                             f32_4 %1161 = OpVectorShuffle %1160 %1159 4 5 6 3 
                                             OpStore %111 %1161 
                             f32_4 %1162 = OpLoad %122 
                             f32_3 %1163 = OpVectorShuffle %1162 %1162 0 1 2 
                             f32_4 %1164 = OpLoad %111 
                             f32_3 %1165 = OpVectorShuffle %1164 %1164 0 1 2 
                             f32_3 %1166 = OpFAdd %1163 %1165 
                             f32_4 %1167 = OpLoad %111 
                             f32_4 %1168 = OpVectorShuffle %1167 %1166 4 5 6 3 
                                             OpStore %111 %1168 
                             f32_4 %1169 = OpLoad %122 
                             f32_3 %1170 = OpVectorShuffle %1169 %1169 0 1 2 
                             f32_4 %1171 = OpLoad %122 
                             f32_3 %1172 = OpVectorShuffle %1171 %1171 0 1 2 
                             f32_3 %1173 = OpFMul %1170 %1172 
                             f32_4 %1174 = OpLoad %65 
                             f32_3 %1175 = OpVectorShuffle %1174 %1174 0 1 2 
                             f32_3 %1176 = OpFAdd %1173 %1175 
                             f32_4 %1177 = OpLoad %65 
                             f32_4 %1178 = OpVectorShuffle %1177 %1176 4 5 6 3 
                                             OpStore %65 %1178 
                             f32_4 %1179 = OpLoad %166 
                             f32_3 %1180 = OpVectorShuffle %1179 %1179 0 1 2 
                             f32_4 %1181 = OpLoad %166 
                             f32_3 %1182 = OpVectorShuffle %1181 %1181 0 1 2 
                             f32_3 %1183 = OpFMul %1180 %1182 
                             f32_4 %1184 = OpLoad %65 
                             f32_3 %1185 = OpVectorShuffle %1184 %1184 0 1 2 
                             f32_3 %1186 = OpFAdd %1183 %1185 
                             f32_4 %1187 = OpLoad %65 
                             f32_4 %1188 = OpVectorShuffle %1187 %1186 4 5 6 3 
                                             OpStore %65 %1188 
                             f32_4 %1189 = OpLoad %166 
                             f32_3 %1190 = OpVectorShuffle %1189 %1189 0 1 2 
                             f32_4 %1191 = OpLoad %111 
                             f32_3 %1192 = OpVectorShuffle %1191 %1191 0 1 2 
                             f32_3 %1193 = OpFAdd %1190 %1192 
                             f32_4 %1194 = OpLoad %111 
                             f32_4 %1195 = OpVectorShuffle %1194 %1193 4 5 6 3 
                                             OpStore %111 %1195 
                             f32_4 %1196 = OpLoad %47 
                             f32_3 %1197 = OpVectorShuffle %1196 %1196 0 1 2 
                             f32_4 %1198 = OpLoad %111 
                             f32_3 %1199 = OpVectorShuffle %1198 %1198 0 1 2 
                             f32_3 %1200 = OpFAdd %1197 %1199 
                             f32_4 %1201 = OpLoad %111 
                             f32_4 %1202 = OpVectorShuffle %1201 %1200 4 5 6 3 
                                             OpStore %111 %1202 
                             f32_4 %1203 = OpLoad %47 
                             f32_3 %1204 = OpVectorShuffle %1203 %1203 0 1 2 
                             f32_4 %1205 = OpLoad %47 
                             f32_3 %1206 = OpVectorShuffle %1205 %1205 0 1 2 
                             f32_3 %1207 = OpFMul %1204 %1206 
                             f32_4 %1208 = OpLoad %65 
                             f32_3 %1209 = OpVectorShuffle %1208 %1208 0 1 2 
                             f32_3 %1210 = OpFAdd %1207 %1209 
                             f32_4 %1211 = OpLoad %47 
                             f32_4 %1212 = OpVectorShuffle %1211 %1210 4 5 6 3 
                                             OpStore %47 %1212 
                             f32_4 %1213 = OpLoad %211 
                             f32_3 %1214 = OpVectorShuffle %1213 %1213 0 1 2 
                             f32_4 %1215 = OpLoad %211 
                             f32_3 %1216 = OpVectorShuffle %1215 %1215 0 1 2 
                             f32_3 %1217 = OpFMul %1214 %1216 
                             f32_4 %1218 = OpLoad %47 
                             f32_3 %1219 = OpVectorShuffle %1218 %1218 0 1 2 
                             f32_3 %1220 = OpFAdd %1217 %1219 
                             f32_4 %1221 = OpLoad %47 
                             f32_4 %1222 = OpVectorShuffle %1221 %1220 4 5 6 3 
                                             OpStore %47 %1222 
                             f32_4 %1223 = OpLoad %254 
                             f32_3 %1224 = OpVectorShuffle %1223 %1223 0 1 2 
                             f32_4 %1225 = OpLoad %254 
                             f32_3 %1226 = OpVectorShuffle %1225 %1225 0 1 2 
                             f32_3 %1227 = OpFMul %1224 %1226 
                             f32_4 %1228 = OpLoad %47 
                             f32_3 %1229 = OpVectorShuffle %1228 %1228 0 1 2 
                             f32_3 %1230 = OpFAdd %1227 %1229 
                             f32_4 %1231 = OpLoad %47 
                             f32_4 %1232 = OpVectorShuffle %1231 %1230 4 5 6 3 
                                             OpStore %47 %1232 
                             f32_4 %1233 = OpLoad %329 
                             f32_3 %1234 = OpVectorShuffle %1233 %1233 0 1 2 
                             f32_4 %1235 = OpLoad %329 
                             f32_3 %1236 = OpVectorShuffle %1235 %1235 0 1 2 
                             f32_3 %1237 = OpFMul %1234 %1236 
                             f32_4 %1238 = OpLoad %47 
                             f32_3 %1239 = OpVectorShuffle %1238 %1238 0 1 2 
                             f32_3 %1240 = OpFAdd %1237 %1239 
                             f32_4 %1241 = OpLoad %47 
                             f32_4 %1242 = OpVectorShuffle %1241 %1240 4 5 6 3 
                                             OpStore %47 %1242 
                             f32_4 %1243 = OpLoad %372 
                             f32_3 %1244 = OpVectorShuffle %1243 %1243 0 1 2 
                             f32_4 %1245 = OpLoad %372 
                             f32_3 %1246 = OpVectorShuffle %1245 %1245 0 1 2 
                             f32_3 %1247 = OpFMul %1244 %1246 
                             f32_4 %1248 = OpLoad %47 
                             f32_3 %1249 = OpVectorShuffle %1248 %1248 0 1 2 
                             f32_3 %1250 = OpFAdd %1247 %1249 
                             f32_4 %1251 = OpLoad %47 
                             f32_4 %1252 = OpVectorShuffle %1251 %1250 4 5 6 3 
                                             OpStore %47 %1252 
                             f32_4 %1253 = OpLoad %415 
                             f32_3 %1254 = OpVectorShuffle %1253 %1253 0 1 2 
                             f32_4 %1255 = OpLoad %415 
                             f32_3 %1256 = OpVectorShuffle %1255 %1255 0 1 2 
                             f32_3 %1257 = OpFMul %1254 %1256 
                             f32_4 %1258 = OpLoad %47 
                             f32_3 %1259 = OpVectorShuffle %1258 %1258 0 1 2 
                             f32_3 %1260 = OpFAdd %1257 %1259 
                             f32_4 %1261 = OpLoad %47 
                             f32_4 %1262 = OpVectorShuffle %1261 %1260 4 5 6 3 
                                             OpStore %47 %1262 
                             f32_4 %1263 = OpLoad %211 
                             f32_3 %1264 = OpVectorShuffle %1263 %1263 0 1 2 
                             f32_4 %1265 = OpLoad %211 
                             f32_3 %1266 = OpVectorShuffle %1265 %1265 0 1 2 
                             f32_3 %1267 = OpFMul %1264 %1266 
                             f32_4 %1268 = OpLoad %47 
                             f32_3 %1269 = OpVectorShuffle %1268 %1268 0 1 2 
                             f32_3 %1270 = OpFAdd %1267 %1269 
                             f32_4 %1271 = OpLoad %47 
                             f32_4 %1272 = OpVectorShuffle %1271 %1270 4 5 6 3 
                                             OpStore %47 %1272 
                             f32_4 %1273 = OpLoad %458 
                             f32_3 %1274 = OpVectorShuffle %1273 %1273 0 1 2 
                             f32_4 %1275 = OpLoad %458 
                             f32_3 %1276 = OpVectorShuffle %1275 %1275 0 1 2 
                             f32_3 %1277 = OpFMul %1274 %1276 
                             f32_4 %1278 = OpLoad %47 
                             f32_3 %1279 = OpVectorShuffle %1278 %1278 0 1 2 
                             f32_3 %1280 = OpFAdd %1277 %1279 
                             f32_4 %1281 = OpLoad %47 
                             f32_4 %1282 = OpVectorShuffle %1281 %1280 4 5 6 3 
                                             OpStore %47 %1282 
                             f32_4 %1283 = OpLoad %501 
                             f32_3 %1284 = OpVectorShuffle %1283 %1283 0 1 2 
                             f32_4 %1285 = OpLoad %501 
                             f32_3 %1286 = OpVectorShuffle %1285 %1285 0 1 2 
                             f32_3 %1287 = OpFMul %1284 %1286 
                             f32_4 %1288 = OpLoad %47 
                             f32_3 %1289 = OpVectorShuffle %1288 %1288 0 1 2 
                             f32_3 %1290 = OpFAdd %1287 %1289 
                             f32_4 %1291 = OpLoad %47 
                             f32_4 %1292 = OpVectorShuffle %1291 %1290 4 5 6 3 
                                             OpStore %47 %1292 
                             f32_4 %1293 = OpLoad %578 
                             f32_3 %1294 = OpVectorShuffle %1293 %1293 0 1 2 
                             f32_4 %1295 = OpLoad %578 
                             f32_3 %1296 = OpVectorShuffle %1295 %1295 0 1 2 
                             f32_3 %1297 = OpFMul %1294 %1296 
                             f32_4 %1298 = OpLoad %47 
                             f32_3 %1299 = OpVectorShuffle %1298 %1298 0 1 2 
                             f32_3 %1300 = OpFAdd %1297 %1299 
                             f32_4 %1301 = OpLoad %47 
                             f32_4 %1302 = OpVectorShuffle %1301 %1300 4 5 6 3 
                                             OpStore %47 %1302 
                             f32_4 %1303 = OpLoad %621 
                             f32_3 %1304 = OpVectorShuffle %1303 %1303 0 1 2 
                             f32_4 %1305 = OpLoad %621 
                             f32_3 %1306 = OpVectorShuffle %1305 %1305 0 1 2 
                             f32_3 %1307 = OpFMul %1304 %1306 
                             f32_4 %1308 = OpLoad %47 
                             f32_3 %1309 = OpVectorShuffle %1308 %1308 0 1 2 
                             f32_3 %1310 = OpFAdd %1307 %1309 
                             f32_4 %1311 = OpLoad %47 
                             f32_4 %1312 = OpVectorShuffle %1311 %1310 4 5 6 3 
                                             OpStore %47 %1312 
                             f32_4 %1313 = OpLoad %664 
                             f32_3 %1314 = OpVectorShuffle %1313 %1313 0 1 2 
                             f32_4 %1315 = OpLoad %664 
                             f32_3 %1316 = OpVectorShuffle %1315 %1315 0 1 2 
                             f32_3 %1317 = OpFMul %1314 %1316 
                             f32_4 %1318 = OpLoad %47 
                             f32_3 %1319 = OpVectorShuffle %1318 %1318 0 1 2 
                             f32_3 %1320 = OpFAdd %1317 %1319 
                             f32_4 %1321 = OpLoad %47 
                             f32_4 %1322 = OpVectorShuffle %1321 %1320 4 5 6 3 
                                             OpStore %47 %1322 
                             f32_4 %1323 = OpLoad %9 
                             f32_3 %1324 = OpVectorShuffle %1323 %1323 0 1 2 
                             f32_4 %1325 = OpLoad %9 
                             f32_3 %1326 = OpVectorShuffle %1325 %1325 0 1 2 
                             f32_3 %1327 = OpFMul %1324 %1326 
                             f32_4 %1328 = OpLoad %47 
                             f32_3 %1329 = OpVectorShuffle %1328 %1328 0 1 2 
                             f32_3 %1330 = OpFAdd %1327 %1329 
                             f32_4 %1331 = OpLoad %47 
                             f32_4 %1332 = OpVectorShuffle %1331 %1330 4 5 6 3 
                                             OpStore %47 %1332 
                             f32_4 %1333 = OpLoad %707 
                             f32_3 %1334 = OpVectorShuffle %1333 %1333 0 1 2 
                             f32_4 %1335 = OpLoad %707 
                             f32_3 %1336 = OpVectorShuffle %1335 %1335 0 1 2 
                             f32_3 %1337 = OpFMul %1334 %1336 
                             f32_4 %1338 = OpLoad %47 
                             f32_3 %1339 = OpVectorShuffle %1338 %1338 0 1 2 
                             f32_3 %1340 = OpFAdd %1337 %1339 
                             f32_4 %1341 = OpLoad %47 
                             f32_4 %1342 = OpVectorShuffle %1341 %1340 4 5 6 3 
                                             OpStore %47 %1342 
                             f32_4 %1343 = OpLoad %750 
                             f32_3 %1344 = OpVectorShuffle %1343 %1343 0 1 2 
                             f32_4 %1345 = OpLoad %750 
                             f32_3 %1346 = OpVectorShuffle %1345 %1345 0 1 2 
                             f32_3 %1347 = OpFMul %1344 %1346 
                             f32_4 %1348 = OpLoad %47 
                             f32_3 %1349 = OpVectorShuffle %1348 %1348 0 1 2 
                             f32_3 %1350 = OpFAdd %1347 %1349 
                             f32_4 %1351 = OpLoad %47 
                             f32_4 %1352 = OpVectorShuffle %1351 %1350 4 5 6 3 
                                             OpStore %47 %1352 
                             f32_4 %1353 = OpLoad %852 
                             f32_3 %1354 = OpVectorShuffle %1353 %1353 0 1 2 
                             f32_4 %1355 = OpLoad %852 
                             f32_3 %1356 = OpVectorShuffle %1355 %1355 0 1 2 
                             f32_3 %1357 = OpFMul %1354 %1356 
                             f32_4 %1358 = OpLoad %47 
                             f32_3 %1359 = OpVectorShuffle %1358 %1358 0 1 2 
                             f32_3 %1360 = OpFAdd %1357 %1359 
                             f32_4 %1361 = OpLoad %47 
                             f32_4 %1362 = OpVectorShuffle %1361 %1360 4 5 6 3 
                                             OpStore %47 %1362 
                             f32_4 %1363 = OpLoad %895 
                             f32_3 %1364 = OpVectorShuffle %1363 %1363 0 1 2 
                             f32_4 %1365 = OpLoad %895 
                             f32_3 %1366 = OpVectorShuffle %1365 %1365 0 1 2 
                             f32_3 %1367 = OpFMul %1364 %1366 
                             f32_4 %1368 = OpLoad %47 
                             f32_3 %1369 = OpVectorShuffle %1368 %1368 0 1 2 
                             f32_3 %1370 = OpFAdd %1367 %1369 
                             f32_4 %1371 = OpLoad %47 
                             f32_4 %1372 = OpVectorShuffle %1371 %1370 4 5 6 3 
                                             OpStore %47 %1372 
                             f32_4 %1373 = OpLoad %938 
                             f32_3 %1374 = OpVectorShuffle %1373 %1373 0 1 2 
                             f32_4 %1375 = OpLoad %938 
                             f32_3 %1376 = OpVectorShuffle %1375 %1375 0 1 2 
                             f32_3 %1377 = OpFMul %1374 %1376 
                             f32_4 %1378 = OpLoad %47 
                             f32_3 %1379 = OpVectorShuffle %1378 %1378 0 1 2 
                             f32_3 %1380 = OpFAdd %1377 %1379 
                             f32_4 %1381 = OpLoad %47 
                             f32_4 %1382 = OpVectorShuffle %1381 %1380 4 5 6 3 
                                             OpStore %47 %1382 
                             f32_3 %1383 = OpLoad %32 
                             f32_3 %1384 = OpLoad %32 
                             f32_3 %1385 = OpFMul %1383 %1384 
                             f32_4 %1386 = OpLoad %47 
                             f32_3 %1387 = OpVectorShuffle %1386 %1386 0 1 2 
                             f32_3 %1388 = OpFAdd %1385 %1387 
                             f32_4 %1389 = OpLoad %47 
                             f32_4 %1390 = OpVectorShuffle %1389 %1388 4 5 6 3 
                                             OpStore %47 %1390 
                             f32_4 %1391 = OpLoad %211 
                             f32_3 %1392 = OpVectorShuffle %1391 %1391 0 1 2 
                             f32_4 %1393 = OpLoad %111 
                             f32_3 %1394 = OpVectorShuffle %1393 %1393 0 1 2 
                             f32_3 %1395 = OpFAdd %1392 %1394 
                             f32_4 %1396 = OpLoad %65 
                             f32_4 %1397 = OpVectorShuffle %1396 %1395 4 5 6 3 
                                             OpStore %65 %1397 
                             f32_4 %1398 = OpLoad %254 
                             f32_3 %1399 = OpVectorShuffle %1398 %1398 0 1 2 
                             f32_4 %1400 = OpLoad %65 
                             f32_3 %1401 = OpVectorShuffle %1400 %1400 0 1 2 
                             f32_3 %1402 = OpFAdd %1399 %1401 
                             f32_4 %1403 = OpLoad %65 
                             f32_4 %1404 = OpVectorShuffle %1403 %1402 4 5 6 3 
                                             OpStore %65 %1404 
                             f32_4 %1405 = OpLoad %329 
                             f32_3 %1406 = OpVectorShuffle %1405 %1405 0 1 2 
                             f32_4 %1407 = OpLoad %65 
                             f32_3 %1408 = OpVectorShuffle %1407 %1407 0 1 2 
                             f32_3 %1409 = OpFAdd %1406 %1408 
                             f32_4 %1410 = OpLoad %65 
                             f32_4 %1411 = OpVectorShuffle %1410 %1409 4 5 6 3 
                                             OpStore %65 %1411 
                             f32_4 %1412 = OpLoad %372 
                             f32_3 %1413 = OpVectorShuffle %1412 %1412 0 1 2 
                             f32_4 %1414 = OpLoad %65 
                             f32_3 %1415 = OpVectorShuffle %1414 %1414 0 1 2 
                             f32_3 %1416 = OpFAdd %1413 %1415 
                             f32_4 %1417 = OpLoad %65 
                             f32_4 %1418 = OpVectorShuffle %1417 %1416 4 5 6 3 
                                             OpStore %65 %1418 
                             f32_4 %1419 = OpLoad %415 
                             f32_3 %1420 = OpVectorShuffle %1419 %1419 0 1 2 
                             f32_4 %1421 = OpLoad %65 
                             f32_3 %1422 = OpVectorShuffle %1421 %1421 0 1 2 
                             f32_3 %1423 = OpFAdd %1420 %1422 
                             f32_4 %1424 = OpLoad %65 
                             f32_4 %1425 = OpVectorShuffle %1424 %1423 4 5 6 3 
                                             OpStore %65 %1425 
                             f32_4 %1426 = OpLoad %211 
                             f32_3 %1427 = OpVectorShuffle %1426 %1426 0 1 2 
                             f32_4 %1428 = OpLoad %65 
                             f32_3 %1429 = OpVectorShuffle %1428 %1428 0 1 2 
                             f32_3 %1430 = OpFAdd %1427 %1429 
                             f32_4 %1431 = OpLoad %65 
                             f32_4 %1432 = OpVectorShuffle %1431 %1430 4 5 6 3 
                                             OpStore %65 %1432 
                             f32_4 %1433 = OpLoad %458 
                             f32_3 %1434 = OpVectorShuffle %1433 %1433 0 1 2 
                             f32_4 %1435 = OpLoad %65 
                             f32_3 %1436 = OpVectorShuffle %1435 %1435 0 1 2 
                             f32_3 %1437 = OpFAdd %1434 %1436 
                             f32_4 %1438 = OpLoad %65 
                             f32_4 %1439 = OpVectorShuffle %1438 %1437 4 5 6 3 
                                             OpStore %65 %1439 
                             f32_4 %1440 = OpLoad %501 
                             f32_3 %1441 = OpVectorShuffle %1440 %1440 0 1 2 
                             f32_4 %1442 = OpLoad %65 
                             f32_3 %1443 = OpVectorShuffle %1442 %1442 0 1 2 
                             f32_3 %1444 = OpFAdd %1441 %1443 
                             f32_4 %1445 = OpLoad %65 
                             f32_4 %1446 = OpVectorShuffle %1445 %1444 4 5 6 3 
                                             OpStore %65 %1446 
                             f32_4 %1447 = OpLoad %578 
                             f32_3 %1448 = OpVectorShuffle %1447 %1447 0 1 2 
                             f32_4 %1449 = OpLoad %65 
                             f32_3 %1450 = OpVectorShuffle %1449 %1449 0 1 2 
                             f32_3 %1451 = OpFAdd %1448 %1450 
                             f32_4 %1452 = OpLoad %65 
                             f32_4 %1453 = OpVectorShuffle %1452 %1451 4 5 6 3 
                                             OpStore %65 %1453 
                             f32_4 %1454 = OpLoad %621 
                             f32_3 %1455 = OpVectorShuffle %1454 %1454 0 1 2 
                             f32_4 %1456 = OpLoad %65 
                             f32_3 %1457 = OpVectorShuffle %1456 %1456 0 1 2 
                             f32_3 %1458 = OpFAdd %1455 %1457 
                             f32_4 %1459 = OpLoad %65 
                             f32_4 %1460 = OpVectorShuffle %1459 %1458 4 5 6 3 
                                             OpStore %65 %1460 
                             f32_4 %1461 = OpLoad %664 
                             f32_3 %1462 = OpVectorShuffle %1461 %1461 0 1 2 
                             f32_4 %1463 = OpLoad %65 
                             f32_3 %1464 = OpVectorShuffle %1463 %1463 0 1 2 
                             f32_3 %1465 = OpFAdd %1462 %1464 
                             f32_4 %1466 = OpLoad %65 
                             f32_4 %1467 = OpVectorShuffle %1466 %1465 4 5 6 3 
                                             OpStore %65 %1467 
                             f32_4 %1468 = OpLoad %9 
                             f32_3 %1469 = OpVectorShuffle %1468 %1468 0 1 2 
                             f32_4 %1470 = OpLoad %65 
                             f32_3 %1471 = OpVectorShuffle %1470 %1470 0 1 2 
                             f32_3 %1472 = OpFAdd %1469 %1471 
                             f32_4 %1473 = OpLoad %9 
                             f32_4 %1474 = OpVectorShuffle %1473 %1472 4 5 6 3 
                                             OpStore %9 %1474 
                             f32_4 %1475 = OpLoad %707 
                             f32_3 %1476 = OpVectorShuffle %1475 %1475 0 1 2 
                             f32_4 %1477 = OpLoad %9 
                             f32_3 %1478 = OpVectorShuffle %1477 %1477 0 1 2 
                             f32_3 %1479 = OpFAdd %1476 %1478 
                             f32_4 %1480 = OpLoad %9 
                             f32_4 %1481 = OpVectorShuffle %1480 %1479 4 5 6 3 
                                             OpStore %9 %1481 
                             f32_4 %1482 = OpLoad %750 
                             f32_3 %1483 = OpVectorShuffle %1482 %1482 0 1 2 
                             f32_4 %1484 = OpLoad %9 
                             f32_3 %1485 = OpVectorShuffle %1484 %1484 0 1 2 
                             f32_3 %1486 = OpFAdd %1483 %1485 
                             f32_4 %1487 = OpLoad %9 
                             f32_4 %1488 = OpVectorShuffle %1487 %1486 4 5 6 3 
                                             OpStore %9 %1488 
                             f32_4 %1489 = OpLoad %852 
                             f32_3 %1490 = OpVectorShuffle %1489 %1489 0 1 2 
                             f32_4 %1491 = OpLoad %9 
                             f32_3 %1492 = OpVectorShuffle %1491 %1491 0 1 2 
                             f32_3 %1493 = OpFAdd %1490 %1492 
                             f32_4 %1494 = OpLoad %9 
                             f32_4 %1495 = OpVectorShuffle %1494 %1493 4 5 6 3 
                                             OpStore %9 %1495 
                             f32_4 %1496 = OpLoad %895 
                             f32_3 %1497 = OpVectorShuffle %1496 %1496 0 1 2 
                             f32_4 %1498 = OpLoad %9 
                             f32_3 %1499 = OpVectorShuffle %1498 %1498 0 1 2 
                             f32_3 %1500 = OpFAdd %1497 %1499 
                             f32_4 %1501 = OpLoad %9 
                             f32_4 %1502 = OpVectorShuffle %1501 %1500 4 5 6 3 
                                             OpStore %9 %1502 
                             f32_4 %1503 = OpLoad %938 
                             f32_3 %1504 = OpVectorShuffle %1503 %1503 0 1 2 
                             f32_4 %1505 = OpLoad %9 
                             f32_3 %1506 = OpVectorShuffle %1505 %1505 0 1 2 
                             f32_3 %1507 = OpFAdd %1504 %1506 
                             f32_4 %1508 = OpLoad %9 
                             f32_4 %1509 = OpVectorShuffle %1508 %1507 4 5 6 3 
                                             OpStore %9 %1509 
                             f32_3 %1510 = OpLoad %32 
                             f32_4 %1511 = OpLoad %9 
                             f32_3 %1512 = OpVectorShuffle %1511 %1511 0 1 2 
                             f32_3 %1513 = OpFAdd %1510 %1512 
                             f32_4 %1514 = OpLoad %9 
                             f32_4 %1515 = OpVectorShuffle %1514 %1513 4 5 6 3 
                                             OpStore %9 %1515 
                             f32_4 %1516 = OpLoad %9 
                             f32_3 %1517 = OpVectorShuffle %1516 %1516 0 1 2 
                             f32_3 %1518 = OpFMul %1517 %1044 
                             f32_4 %1519 = OpLoad %9 
                             f32_4 %1520 = OpVectorShuffle %1519 %1518 4 5 6 3 
                                             OpStore %9 %1520 
                             f32_4 %1521 = OpLoad %9 
                             f32_3 %1522 = OpVectorShuffle %1521 %1521 0 1 2 
                             f32_4 %1523 = OpLoad %9 
                             f32_3 %1524 = OpVectorShuffle %1523 %1523 0 1 2 
                             f32_3 %1525 = OpFMul %1522 %1524 
                                             OpStore %32 %1525 
                             f32_4 %1526 = OpLoad %47 
                             f32_3 %1527 = OpVectorShuffle %1526 %1526 0 1 2 
                             f32_3 %1528 = OpFMul %1527 %1044 
                             f32_3 %1529 = OpLoad %32 
                             f32_3 %1530 = OpFNegate %1529 
                             f32_3 %1531 = OpFAdd %1528 %1530 
                                             OpStore %32 %1531 
                      Private f32* %1532 = OpAccessChain %32 %1064 
                               f32 %1533 = OpLoad %1532 
                               f32 %1534 = OpExtInst %1 4 %1533 
                      Private f32* %1535 = OpAccessChain %32 %1068 
                               f32 %1536 = OpLoad %1535 
                               f32 %1537 = OpExtInst %1 4 %1536 
                               f32 %1538 = OpFAdd %1534 %1537 
                      Private f32* %1539 = OpAccessChain %32 %1068 
                                             OpStore %1539 %1538 
                      Private f32* %1540 = OpAccessChain %32 %1073 
                               f32 %1541 = OpLoad %1540 
                               f32 %1542 = OpExtInst %1 4 %1541 
                      Private f32* %1543 = OpAccessChain %32 %1068 
                               f32 %1544 = OpLoad %1543 
                               f32 %1545 = OpFAdd %1542 %1544 
                      Private f32* %1546 = OpAccessChain %32 %1068 
                                             OpStore %1546 %1545 
                      Private f32* %1548 = OpAccessChain %32 %1068 
                               f32 %1549 = OpLoad %1548 
                               f32 %1551 = OpExtInst %1 37 %1549 %1550 
                                             OpStore %1547 %1551 
                      Private f32* %1555 = OpAccessChain %32 %1068 
                               f32 %1556 = OpLoad %1555 
                              bool %1557 = OpFOrdLessThan %1556 %1550 
                                             OpStore %1554 %1557 
                               f32 %1559 = OpLoad %1062 
                               f32 %1560 = OpLoad %1547 
                              bool %1561 = OpFOrdLessThan %1559 %1560 
                                             OpStore %1558 %1561 
                      Private f32* %1563 = OpAccessChain %9 %1562 
                                             OpStore %1563 %68 
                              bool %1564 = OpLoad %1554 
                             f32_4 %1565 = OpLoad %9 
                            bool_4 %1568 = OpCompositeConstruct %1564 %1564 %1564 %1564 
                             f32_4 %1569 = OpSelect %1568 %1565 %1566 
                                             OpStore %9 %1569 
                      Private f32* %1570 = OpAccessChain %76 %1562 
                                             OpStore %1570 %68 
                              bool %1573 = OpLoad %1558 
                             f32_4 %1574 = OpLoad %76 
                             f32_4 %1575 = OpLoad %9 
                            bool_4 %1576 = OpCompositeConstruct %1573 %1573 %1573 %1573 
                             f32_4 %1577 = OpSelect %1576 %1574 %1575 
                                             OpStore %1572 %1577 
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