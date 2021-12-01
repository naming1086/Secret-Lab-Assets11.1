//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/AAA_Super_Hexagon" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value ("_Value", Range(0.2, 10)) = 1
_HexaColor ("_HexaColor", Color) = (1,1,1,1)
_BorderSize ("_BorderSize", Range(-0.5, 0.5)) = 0
_BorderColor ("_BorderColor", Color) = (1,1,1,1)
_SpotSize ("_SpotSize", Range(0, 1)) = 0.5
_AlphaHexa ("_AlphaHexa", Range(0.2, 10)) = 1
_PositionX ("_PositionX", Range(-0.5, 0.5)) = 0
_PositionY ("_PositionY", Range(-0.5, 0.5)) = 0
_Radius ("_Radius", Range(0, 1)) = 0.5
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 44144
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
uniform 	float _TimeX;
uniform 	vec4 _ScreenResolution;
uniform 	float _Value;
uniform 	float _BorderSize;
uniform 	vec4 _BorderColor;
uniform 	vec4 _HexaColor;
uniform 	float _AlphaHexa;
uniform 	float _PositionX;
uniform 	float _PositionY;
uniform 	float _Radius;
uniform 	float _SpotSize;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat12;
bvec2 u_xlatb12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat1.x = _ScreenResolution.x * _Value;
    u_xlat7.xyz = u_xlat1.xxx * vec3(0.0108253174, 0.00937500037, 0.0108253174);
    u_xlat2.xyz = u_xlat12.yxy / u_xlat7.yxy;
    u_xlatb12.xy = greaterThanEqual(u_xlat2.yzyz, (-u_xlat2.yzyz)).xy;
    u_xlat3.xy = fract(abs(u_xlat2.yz));
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat12.x = (u_xlatb12.x) ? u_xlat3.x : (-u_xlat3.x);
    u_xlat12.y = (u_xlatb12.y) ? u_xlat3.y : (-u_xlat3.y);
    u_xlat12.xy = u_xlat7.zy * u_xlat12.xy;
    u_xlat7.xyz = u_xlat1.xxx * vec3(0.00625000009, 0.00312500005, 0.00541265868);
    u_xlat3.x = u_xlat7.y / u_xlat7.z;
    u_xlat3.y = u_xlat12.x * u_xlat3.x;
    u_xlat13 = u_xlat12.x * u_xlat3.x + (-u_xlat7.y);
    u_xlatb13 = u_xlat12.y<u_xlat13;
    u_xlat3.xz = u_xlat1.xx * vec2(0.00312500005, 0.00625000009) + (-u_xlat3.yy);
    u_xlatb3.xyz = lessThan(u_xlat12.yyyy, u_xlat3.xyzx).xyz;
    u_xlatb12.x = u_xlat7.z<u_xlat12.x;
    u_xlat4 = u_xlat2.yzyz + vec4(-1.0, -1.0, -1.0, 0.0);
    u_xlat5.z = (u_xlatb3.z) ? u_xlat4.y : u_xlat2.z;
    u_xlat5.xy = u_xlat2.yz + vec2(0.0, -1.0);
    u_xlat9.xy = (u_xlatb3.y) ? u_xlat5.xy : u_xlat4.zw;
    u_xlat12.xy = (u_xlatb12.x) ? u_xlat5.xz : u_xlat9.xy;
    u_xlat2.w = (u_xlatb13) ? u_xlat4.y : u_xlat2.z;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat4.xy : u_xlat2.yw;
    u_xlat13 = u_xlat2.x * 0.5;
    u_xlatb2 = u_xlat13>=(-u_xlat13);
    u_xlat13 = fract(abs(u_xlat13));
    u_xlat13 = (u_xlatb2) ? u_xlat13 : (-u_xlat13);
    u_xlatb13 = 0.0<u_xlat13;
    u_xlat12.xy = (bool(u_xlatb13)) ? u_xlat8.xy : u_xlat12.xy;
    u_xlat13 = u_xlat12.y * 0.5;
    u_xlatb2 = u_xlat13>=(-u_xlat13);
    u_xlat13 = fract(abs(u_xlat13));
    u_xlat13 = (u_xlatb2) ? u_xlat13 : (-u_xlat13);
    u_xlat13 = dot(vec2(u_xlat13), u_xlat7.zz);
    u_xlat12.x = dot(u_xlat12.xx, u_xlat7.zz);
    u_xlat2.x = (-u_xlat13) + u_xlat12.x;
    u_xlat12.x = u_xlat1.x * 0.00937500037;
    u_xlat2.y = u_xlat12.x * u_xlat12.y;
    u_xlat12.xy = u_xlat1.xx * vec2(0.0108253174, 0.00625000009) + u_xlat2.xy;
    u_xlat1.xz = (-u_xlat0.xy) * _ScreenResolution.xy + u_xlat12.xy;
    u_xlat12.xy = u_xlat12.xy / _ScreenResolution.xy;
    u_xlat2 = texture(_MainTex, u_xlat12.xy);
    u_xlat2.xyz = u_xlat2.xyz + (-_BorderColor.xyz);
    u_xlat12.x = dot(abs(u_xlat1.xz), vec2(0.5, 0.866025388));
    u_xlat12.x = max(abs(u_xlat1.x), u_xlat12.x);
    u_xlat18 = u_xlat7.x * _BorderSize + -1.0;
    u_xlat1.x = u_xlat7.x * _BorderSize + (-u_xlat18);
    u_xlat12.x = u_xlat12.x * 1.15470052 + (-u_xlat18);
    u_xlat18 = float(1.0) / u_xlat1.x;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = (-u_xlat18) * u_xlat12.x + 1.0;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat2.xyz + _BorderColor.xyz;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat12.xy;
    u_xlat12.xy = u_xlat12.yx * vec2(1.20000005, 1.20000005);
    u_xlat0.x = dot(u_xlat0.yy, u_xlat0.xx);
    u_xlat0.x = u_xlat0.x + 0.833333313;
    u_xlat3.xy = u_xlat12.yx * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xx * u_xlat12.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(1.80437076, 1.80437076) + vec2(1.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xx, u_xlat0.yy);
    u_xlat6.x = _TimeX * 0.25 + u_xlat3.x;
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb12.x = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat6.x = (-u_xlat6.x) * 0.5 + 1.0;
    u_xlat6.xyz = u_xlat6.xxx + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _HexaColor.xyz;
    u_xlat1.x = u_xlat3.y * 10.0 + _TimeX;
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 12.0;
    u_xlat7.xy = vec2(_TimeX) * vec2(0.333333343, 0.200000003);
    u_xlat7.xy = sin(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(0.5, 0.5) + u_xlat3.yy;
    u_xlat3.xy = (-u_xlat3.xy) + vec2(_PositionX, _PositionY);
    u_xlat19 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat19 + (-_Radius);
    u_xlat3 = texture(_MainTex, u_xlat7.xy);
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.0769230798, 0.0769230798, 0.0769230798) + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat6.xyz = u_xlat6.xyz / u_xlat1.xyz;
    u_xlat0.xyz = u_xlat6.xyz / u_xlat0.xxx;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat18 = _SpotSize * 0.150000006;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat19 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = (-u_xlat19) * u_xlat18 + 1.0;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat18 = (-_AlphaHexa) + 1.0;
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 785
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %773 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %360 DescriptorSet 360 
                                                      OpDecorate %360 Binding 360 
                                                      OpDecorate %364 DescriptorSet 364 
                                                      OpDecorate %364 Binding 364 
                                                      OpDecorate %773 Location 773 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %6 %14 %6 %6 %14 %14 %6 %6 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 11 
                                              %20 = OpTypePointer Uniform %14 
                                              %31 = OpTypePointer Private %10 
                               Private f32_2* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 1 
                               Private f32_3* %40 = OpVariable Private 
                                              %41 = OpTypeInt 32 0 
                                          u32 %42 = OpConstant 0 
                                              %43 = OpTypePointer Uniform %6 
                                          i32 %46 = OpConstant 2 
                                              %50 = OpTypePointer Private %6 
                               Private f32_3* %52 = OpVariable Private 
                                          f32 %55 = OpConstant 3.674022E-40 
                                          f32 %56 = OpConstant 3.674022E-40 
                                        f32_3 %57 = OpConstantComposite %55 %56 %55 
                                              %59 = OpTypePointer Private %14 
                               Private f32_4* %60 = OpVariable Private 
                                              %68 = OpTypeBool 
                                              %69 = OpTypeVector %68 2 
                                              %70 = OpTypePointer Private %69 
                              Private bool_2* %71 = OpVariable Private 
                                              %77 = OpTypeVector %68 4 
                               Private f32_3* %80 = OpVariable Private 
                                              %92 = OpTypePointer Private %68 
                                              %95 = OpTypePointer Function %6 
                                         u32 %107 = OpConstant 1 
                                         f32 %127 = OpConstant 3.674022E-40 
                                         f32 %128 = OpConstant 3.674022E-40 
                                         f32 %129 = OpConstant 3.674022E-40 
                                       f32_3 %130 = OpConstantComposite %127 %128 %129 
                                         u32 %134 = OpConstant 2 
                                Private f32* %145 = OpVariable Private 
                               Private bool* %155 = OpVariable Private 
                                       f32_2 %162 = OpConstantComposite %128 %127 
                                             %170 = OpTypeVector %68 3 
                                             %171 = OpTypePointer Private %170 
                             Private bool_3* %172 = OpVariable Private 
                              Private f32_4* %185 = OpVariable Private 
                                         f32 %188 = OpConstant 3.674022E-40 
                                         f32 %189 = OpConstant 3.674022E-40 
                                       f32_4 %190 = OpConstantComposite %188 %188 %188 %189 
                              Private f32_3* %192 = OpVariable Private 
                                       f32_2 %207 = OpConstantComposite %189 %188 
                              Private f32_2* %211 = OpVariable Private 
                                             %214 = OpTypePointer Function %10 
                                         u32 %244 = OpConstant 3 
                              Private f32_2* %246 = OpVariable Private 
                                         f32 %260 = OpConstant 3.674022E-40 
                               Private bool* %262 = OpVariable Private 
                                       f32_2 %337 = OpConstantComposite %55 %127 
                                             %358 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %359 = OpTypePointer UniformConstant %358 
        UniformConstant read_only Texture2D* %360 = OpVariable UniformConstant 
                                             %362 = OpTypeSampler 
                                             %363 = OpTypePointer UniformConstant %362 
                    UniformConstant sampler* %364 = OpVariable UniformConstant 
                                             %366 = OpTypeSampledImage %358 
                                         i32 %375 = OpConstant 4 
                                         f32 %386 = OpConstant 3.674022E-40 
                                       f32_2 %387 = OpConstantComposite %260 %386 
                                Private f32* %397 = OpVariable Private 
                                         i32 %400 = OpConstant 3 
                                         f32 %416 = OpConstant 3.674022E-40 
                                         f32 %422 = OpConstant 3.674022E-40 
                                         f32 %437 = OpConstant 3.674022E-40 
                                         f32 %439 = OpConstant 3.674022E-40 
                                         f32 %465 = OpConstant 3.674022E-40 
                                       f32_2 %466 = OpConstantComposite %465 %465 
                                         f32 %484 = OpConstant 3.674022E-40 
                                       f32_2 %485 = OpConstantComposite %484 %484 
                                         f32 %495 = OpConstant 3.674022E-40 
                                       f32_2 %503 = OpConstantComposite %260 %260 
                                         f32 %523 = OpConstant 3.674022E-40 
                                       f32_2 %524 = OpConstantComposite %523 %523 
                                       f32_2 %526 = OpConstantComposite %422 %422 
                              Private f32_3* %536 = OpVariable Private 
                                         i32 %537 = OpConstant 0 
                                         f32 %540 = OpConstant 3.674022E-40 
                                         i32 %613 = OpConstant 5 
                                         f32 %620 = OpConstant 3.674022E-40 
                               Private bool* %626 = OpVariable Private 
                                         f32 %652 = OpConstant 3.674022E-40 
                                         f32 %658 = OpConstant 3.674022E-40 
                                         f32 %659 = OpConstant 3.674022E-40 
                                       f32_2 %660 = OpConstantComposite %658 %659 
                                         i32 %680 = OpConstant 7 
                                         i32 %683 = OpConstant 8 
                                Private f32* %690 = OpVariable Private 
                                         i32 %699 = OpConstant 9 
                                         f32 %713 = OpConstant 3.674022E-40 
                                       f32_3 %714 = OpConstantComposite %713 %713 %713 
                                       f32_3 %719 = OpConstantComposite %260 %260 %260 
                                         i32 %733 = OpConstant 10 
                                         f32 %736 = OpConstant 3.674022E-40 
                                         i32 %767 = OpConstant 6 
                                             %772 = OpTypePointer Output %14 
                               Output f32_4* %773 = OpVariable Output 
                                             %782 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %96 = OpVariable Function 
                               Function f32* %110 = OpVariable Function 
                               Function f32* %195 = OpVariable Function 
                             Function f32_2* %215 = OpVariable Function 
                             Function f32_2* %226 = OpVariable Function 
                               Function f32* %235 = OpVariable Function 
                             Function f32_2* %249 = OpVariable Function 
                               Function f32* %271 = OpVariable Function 
                             Function f32_2* %282 = OpVariable Function 
                               Function f32* %300 = OpVariable Function 
                               Function f32* %564 = OpVariable Function 
                               Function f32* %639 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFMul %13 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                        f32_2 %28 = OpFAdd %24 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_3 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               Uniform f32_4* %36 = OpAccessChain %17 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                        f32_2 %39 = OpFMul %34 %38 
                                                      OpStore %32 %39 
                                 Uniform f32* %44 = OpAccessChain %17 %35 %42 
                                          f32 %45 = OpLoad %44 
                                 Uniform f32* %47 = OpAccessChain %17 %46 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFMul %45 %48 
                                 Private f32* %51 = OpAccessChain %40 %42 
                                                      OpStore %51 %49 
                                        f32_3 %53 = OpLoad %40 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 0 0 
                                        f32_3 %58 = OpFMul %54 %57 
                                                      OpStore %52 %58 
                                        f32_2 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 1 0 1 
                                        f32_3 %63 = OpLoad %52 
                                        f32_3 %64 = OpVectorShuffle %63 %63 1 0 1 
                                        f32_3 %65 = OpFDiv %62 %64 
                                        f32_4 %66 = OpLoad %60 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %60 %67 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpVectorShuffle %72 %72 1 2 1 2 
                                        f32_4 %74 = OpLoad %60 
                                        f32_4 %75 = OpVectorShuffle %74 %74 1 2 1 2 
                                        f32_4 %76 = OpFNegate %75 
                                       bool_4 %78 = OpFOrdGreaterThanEqual %73 %76 
                                       bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                                      OpStore %71 %79 
                                        f32_4 %81 = OpLoad %60 
                                        f32_2 %82 = OpVectorShuffle %81 %81 1 2 
                                        f32_2 %83 = OpExtInst %1 4 %82 
                                        f32_2 %84 = OpExtInst %1 10 %83 
                                        f32_3 %85 = OpLoad %80 
                                        f32_3 %86 = OpVectorShuffle %85 %84 3 4 2 
                                                      OpStore %80 %86 
                                        f32_4 %87 = OpLoad %60 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpExtInst %1 8 %88 
                                        f32_4 %90 = OpLoad %60 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                                      OpStore %60 %91 
                                Private bool* %93 = OpAccessChain %71 %42 
                                         bool %94 = OpLoad %93 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private f32* %99 = OpAccessChain %80 %42 
                                         f32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private f32* %102 = OpAccessChain %80 %42 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                                      OpStore %96 %104 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         f32 %105 = OpLoad %96 
                                Private f32* %106 = OpAccessChain %32 %42 
                                                      OpStore %106 %105 
                               Private bool* %108 = OpAccessChain %71 %107 
                                        bool %109 = OpLoad %108 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %109 %111 %115 
                                             %111 = OpLabel 
                                Private f32* %113 = OpAccessChain %80 %107 
                                         f32 %114 = OpLoad %113 
                                                      OpStore %110 %114 
                                                      OpBranch %112 
                                             %115 = OpLabel 
                                Private f32* %116 = OpAccessChain %80 %107 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                                      OpStore %110 %118 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                         f32 %119 = OpLoad %110 
                                Private f32* %120 = OpAccessChain %32 %107 
                                                      OpStore %120 %119 
                                       f32_3 %121 = OpLoad %52 
                                       f32_2 %122 = OpVectorShuffle %121 %121 2 1 
                                       f32_2 %123 = OpLoad %32 
                                       f32_2 %124 = OpFMul %122 %123 
                                                      OpStore %32 %124 
                                       f32_3 %125 = OpLoad %40 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 0 0 
                                       f32_3 %131 = OpFMul %126 %130 
                                                      OpStore %52 %131 
                                Private f32* %132 = OpAccessChain %52 %107 
                                         f32 %133 = OpLoad %132 
                                Private f32* %135 = OpAccessChain %52 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFDiv %133 %136 
                                Private f32* %138 = OpAccessChain %80 %42 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %32 %42 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %80 %42 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFMul %140 %142 
                                Private f32* %144 = OpAccessChain %80 %107 
                                                      OpStore %144 %143 
                                Private f32* %146 = OpAccessChain %32 %42 
                                         f32 %147 = OpLoad %146 
                                Private f32* %148 = OpAccessChain %80 %42 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFMul %147 %149 
                                Private f32* %151 = OpAccessChain %52 %107 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                         f32 %154 = OpFAdd %150 %153 
                                                      OpStore %145 %154 
                                Private f32* %156 = OpAccessChain %32 %107 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpLoad %145 
                                        bool %159 = OpFOrdLessThan %157 %158 
                                                      OpStore %155 %159 
                                       f32_3 %160 = OpLoad %40 
                                       f32_2 %161 = OpVectorShuffle %160 %160 0 0 
                                       f32_2 %163 = OpFMul %161 %162 
                                       f32_3 %164 = OpLoad %80 
                                       f32_2 %165 = OpVectorShuffle %164 %164 1 1 
                                       f32_2 %166 = OpFNegate %165 
                                       f32_2 %167 = OpFAdd %163 %166 
                                       f32_3 %168 = OpLoad %80 
                                       f32_3 %169 = OpVectorShuffle %168 %167 3 1 4 
                                                      OpStore %80 %169 
                                       f32_2 %173 = OpLoad %32 
                                       f32_4 %174 = OpVectorShuffle %173 %173 1 1 1 1 
                                       f32_3 %175 = OpLoad %80 
                                       f32_4 %176 = OpVectorShuffle %175 %175 0 1 2 0 
                                      bool_4 %177 = OpFOrdLessThan %174 %176 
                                      bool_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %172 %178 
                                Private f32* %179 = OpAccessChain %52 %134 
                                         f32 %180 = OpLoad %179 
                                Private f32* %181 = OpAccessChain %32 %42 
                                         f32 %182 = OpLoad %181 
                                        bool %183 = OpFOrdLessThan %180 %182 
                               Private bool* %184 = OpAccessChain %71 %42 
                                                      OpStore %184 %183 
                                       f32_4 %186 = OpLoad %60 
                                       f32_4 %187 = OpVectorShuffle %186 %186 1 2 1 2 
                                       f32_4 %191 = OpFAdd %187 %190 
                                                      OpStore %185 %191 
                               Private bool* %193 = OpAccessChain %172 %134 
                                        bool %194 = OpLoad %193 
                                                      OpSelectionMerge %197 None 
                                                      OpBranchConditional %194 %196 %200 
                                             %196 = OpLabel 
                                Private f32* %198 = OpAccessChain %185 %107 
                                         f32 %199 = OpLoad %198 
                                                      OpStore %195 %199 
                                                      OpBranch %197 
                                             %200 = OpLabel 
                                Private f32* %201 = OpAccessChain %60 %134 
                                         f32 %202 = OpLoad %201 
                                                      OpStore %195 %202 
                                                      OpBranch %197 
                                             %197 = OpLabel 
                                         f32 %203 = OpLoad %195 
                                Private f32* %204 = OpAccessChain %192 %134 
                                                      OpStore %204 %203 
                                       f32_4 %205 = OpLoad %60 
                                       f32_2 %206 = OpVectorShuffle %205 %205 1 2 
                                       f32_2 %208 = OpFAdd %206 %207 
                                       f32_3 %209 = OpLoad %192 
                                       f32_3 %210 = OpVectorShuffle %209 %208 3 4 2 
                                                      OpStore %192 %210 
                               Private bool* %212 = OpAccessChain %172 %107 
                                        bool %213 = OpLoad %212 
                                                      OpSelectionMerge %217 None 
                                                      OpBranchConditional %213 %216 %220 
                                             %216 = OpLabel 
                                       f32_3 %218 = OpLoad %192 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                                                      OpStore %215 %219 
                                                      OpBranch %217 
                                             %220 = OpLabel 
                                       f32_4 %221 = OpLoad %185 
                                       f32_2 %222 = OpVectorShuffle %221 %221 2 3 
                                                      OpStore %215 %222 
                                                      OpBranch %217 
                                             %217 = OpLabel 
                                       f32_2 %223 = OpLoad %215 
                                                      OpStore %211 %223 
                               Private bool* %224 = OpAccessChain %71 %42 
                                        bool %225 = OpLoad %224 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %225 %227 %231 
                                             %227 = OpLabel 
                                       f32_3 %229 = OpLoad %192 
                                       f32_2 %230 = OpVectorShuffle %229 %229 0 2 
                                                      OpStore %226 %230 
                                                      OpBranch %228 
                                             %231 = OpLabel 
                                       f32_2 %232 = OpLoad %211 
                                                      OpStore %226 %232 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_2 %233 = OpLoad %226 
                                                      OpStore %32 %233 
                                        bool %234 = OpLoad %155 
                                                      OpSelectionMerge %237 None 
                                                      OpBranchConditional %234 %236 %240 
                                             %236 = OpLabel 
                                Private f32* %238 = OpAccessChain %185 %107 
                                         f32 %239 = OpLoad %238 
                                                      OpStore %235 %239 
                                                      OpBranch %237 
                                             %240 = OpLabel 
                                Private f32* %241 = OpAccessChain %60 %134 
                                         f32 %242 = OpLoad %241 
                                                      OpStore %235 %242 
                                                      OpBranch %237 
                                             %237 = OpLabel 
                                         f32 %243 = OpLoad %235 
                                Private f32* %245 = OpAccessChain %60 %244 
                                                      OpStore %245 %243 
                               Private bool* %247 = OpAccessChain %172 %42 
                                        bool %248 = OpLoad %247 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %248 %250 %254 
                                             %250 = OpLabel 
                                       f32_4 %252 = OpLoad %185 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                                      OpStore %249 %253 
                                                      OpBranch %251 
                                             %254 = OpLabel 
                                       f32_4 %255 = OpLoad %60 
                                       f32_2 %256 = OpVectorShuffle %255 %255 1 3 
                                                      OpStore %249 %256 
                                                      OpBranch %251 
                                             %251 = OpLabel 
                                       f32_2 %257 = OpLoad %249 
                                                      OpStore %246 %257 
                                Private f32* %258 = OpAccessChain %60 %42 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                                      OpStore %145 %261 
                                         f32 %263 = OpLoad %145 
                                         f32 %264 = OpLoad %145 
                                         f32 %265 = OpFNegate %264 
                                        bool %266 = OpFOrdGreaterThanEqual %263 %265 
                                                      OpStore %262 %266 
                                         f32 %267 = OpLoad %145 
                                         f32 %268 = OpExtInst %1 4 %267 
                                         f32 %269 = OpExtInst %1 10 %268 
                                                      OpStore %145 %269 
                                        bool %270 = OpLoad %262 
                                                      OpSelectionMerge %273 None 
                                                      OpBranchConditional %270 %272 %275 
                                             %272 = OpLabel 
                                         f32 %274 = OpLoad %145 
                                                      OpStore %271 %274 
                                                      OpBranch %273 
                                             %275 = OpLabel 
                                         f32 %276 = OpLoad %145 
                                         f32 %277 = OpFNegate %276 
                                                      OpStore %271 %277 
                                                      OpBranch %273 
                                             %273 = OpLabel 
                                         f32 %278 = OpLoad %271 
                                                      OpStore %145 %278 
                                         f32 %279 = OpLoad %145 
                                        bool %280 = OpFOrdLessThan %189 %279 
                                                      OpStore %155 %280 
                                        bool %281 = OpLoad %155 
                                                      OpSelectionMerge %284 None 
                                                      OpBranchConditional %281 %283 %286 
                                             %283 = OpLabel 
                                       f32_2 %285 = OpLoad %246 
                                                      OpStore %282 %285 
                                                      OpBranch %284 
                                             %286 = OpLabel 
                                       f32_2 %287 = OpLoad %32 
                                                      OpStore %282 %287 
                                                      OpBranch %284 
                                             %284 = OpLabel 
                                       f32_2 %288 = OpLoad %282 
                                                      OpStore %32 %288 
                                Private f32* %289 = OpAccessChain %32 %107 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %290 %260 
                                                      OpStore %145 %291 
                                         f32 %292 = OpLoad %145 
                                         f32 %293 = OpLoad %145 
                                         f32 %294 = OpFNegate %293 
                                        bool %295 = OpFOrdGreaterThanEqual %292 %294 
                                                      OpStore %262 %295 
                                         f32 %296 = OpLoad %145 
                                         f32 %297 = OpExtInst %1 4 %296 
                                         f32 %298 = OpExtInst %1 10 %297 
                                                      OpStore %145 %298 
                                        bool %299 = OpLoad %262 
                                                      OpSelectionMerge %302 None 
                                                      OpBranchConditional %299 %301 %304 
                                             %301 = OpLabel 
                                         f32 %303 = OpLoad %145 
                                                      OpStore %300 %303 
                                                      OpBranch %302 
                                             %304 = OpLabel 
                                         f32 %305 = OpLoad %145 
                                         f32 %306 = OpFNegate %305 
                                                      OpStore %300 %306 
                                                      OpBranch %302 
                                             %302 = OpLabel 
                                         f32 %307 = OpLoad %300 
                                                      OpStore %145 %307 
                                         f32 %308 = OpLoad %145 
                                       f32_2 %309 = OpCompositeConstruct %308 %308 
                                       f32_3 %310 = OpLoad %52 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 2 
                                         f32 %312 = OpDot %309 %311 
                                                      OpStore %145 %312 
                                       f32_2 %313 = OpLoad %32 
                                       f32_2 %314 = OpVectorShuffle %313 %313 0 0 
                                       f32_3 %315 = OpLoad %52 
                                       f32_2 %316 = OpVectorShuffle %315 %315 2 2 
                                         f32 %317 = OpDot %314 %316 
                                Private f32* %318 = OpAccessChain %32 %42 
                                                      OpStore %318 %317 
                                         f32 %319 = OpLoad %145 
                                         f32 %320 = OpFNegate %319 
                                Private f32* %321 = OpAccessChain %32 %42 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFAdd %320 %322 
                                Private f32* %324 = OpAccessChain %60 %42 
                                                      OpStore %324 %323 
                                Private f32* %325 = OpAccessChain %40 %42 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpFMul %326 %56 
                                Private f32* %328 = OpAccessChain %32 %42 
                                                      OpStore %328 %327 
                                Private f32* %329 = OpAccessChain %32 %42 
                                         f32 %330 = OpLoad %329 
                                Private f32* %331 = OpAccessChain %32 %107 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFMul %330 %332 
                                Private f32* %334 = OpAccessChain %60 %107 
                                                      OpStore %334 %333 
                                       f32_3 %335 = OpLoad %40 
                                       f32_2 %336 = OpVectorShuffle %335 %335 0 0 
                                       f32_2 %338 = OpFMul %336 %337 
                                       f32_4 %339 = OpLoad %60 
                                       f32_2 %340 = OpVectorShuffle %339 %339 0 1 
                                       f32_2 %341 = OpFAdd %338 %340 
                                                      OpStore %32 %341 
                                       f32_3 %342 = OpLoad %9 
                                       f32_2 %343 = OpVectorShuffle %342 %342 0 1 
                                       f32_2 %344 = OpFNegate %343 
                              Uniform f32_4* %345 = OpAccessChain %17 %35 
                                       f32_4 %346 = OpLoad %345 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                       f32_2 %348 = OpFMul %344 %347 
                                       f32_2 %349 = OpLoad %32 
                                       f32_2 %350 = OpFAdd %348 %349 
                                       f32_3 %351 = OpLoad %40 
                                       f32_3 %352 = OpVectorShuffle %351 %350 3 1 4 
                                                      OpStore %40 %352 
                                       f32_2 %353 = OpLoad %32 
                              Uniform f32_4* %354 = OpAccessChain %17 %35 
                                       f32_4 %355 = OpLoad %354 
                                       f32_2 %356 = OpVectorShuffle %355 %355 0 1 
                                       f32_2 %357 = OpFDiv %353 %356 
                                                      OpStore %32 %357 
                         read_only Texture2D %361 = OpLoad %360 
                                     sampler %365 = OpLoad %364 
                  read_only Texture2DSampled %367 = OpSampledImage %361 %365 
                                       f32_2 %368 = OpLoad %32 
                                       f32_4 %369 = OpImageSampleImplicitLod %367 %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_4 %371 = OpLoad %60 
                                       f32_4 %372 = OpVectorShuffle %371 %370 4 5 6 3 
                                                      OpStore %60 %372 
                                       f32_4 %373 = OpLoad %60 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                              Uniform f32_4* %376 = OpAccessChain %17 %375 
                                       f32_4 %377 = OpLoad %376 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpFNegate %378 
                                       f32_3 %380 = OpFAdd %374 %379 
                                       f32_4 %381 = OpLoad %60 
                                       f32_4 %382 = OpVectorShuffle %381 %380 4 5 6 3 
                                                      OpStore %60 %382 
                                       f32_3 %383 = OpLoad %40 
                                       f32_2 %384 = OpVectorShuffle %383 %383 0 2 
                                       f32_2 %385 = OpExtInst %1 4 %384 
                                         f32 %388 = OpDot %385 %387 
                                Private f32* %389 = OpAccessChain %32 %42 
                                                      OpStore %389 %388 
                                Private f32* %390 = OpAccessChain %40 %42 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpExtInst %1 4 %391 
                                Private f32* %393 = OpAccessChain %32 %42 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpExtInst %1 40 %392 %394 
                                Private f32* %396 = OpAccessChain %32 %42 
                                                      OpStore %396 %395 
                                Private f32* %398 = OpAccessChain %52 %42 
                                         f32 %399 = OpLoad %398 
                                Uniform f32* %401 = OpAccessChain %17 %400 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFMul %399 %402 
                                         f32 %404 = OpFAdd %403 %188 
                                                      OpStore %397 %404 
                                Private f32* %405 = OpAccessChain %52 %42 
                                         f32 %406 = OpLoad %405 
                                Uniform f32* %407 = OpAccessChain %17 %400 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFMul %406 %408 
                                         f32 %410 = OpLoad %397 
                                         f32 %411 = OpFNegate %410 
                                         f32 %412 = OpFAdd %409 %411 
                                Private f32* %413 = OpAccessChain %40 %42 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %32 %42 
                                         f32 %415 = OpLoad %414 
                                         f32 %417 = OpFMul %415 %416 
                                         f32 %418 = OpLoad %397 
                                         f32 %419 = OpFNegate %418 
                                         f32 %420 = OpFAdd %417 %419 
                                Private f32* %421 = OpAccessChain %32 %42 
                                                      OpStore %421 %420 
                                Private f32* %423 = OpAccessChain %40 %42 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFDiv %422 %424 
                                                      OpStore %397 %425 
                                         f32 %426 = OpLoad %397 
                                Private f32* %427 = OpAccessChain %32 %42 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpFMul %426 %428 
                                Private f32* %430 = OpAccessChain %32 %42 
                                                      OpStore %430 %429 
                                Private f32* %431 = OpAccessChain %32 %42 
                                         f32 %432 = OpLoad %431 
                                         f32 %433 = OpExtInst %1 43 %432 %189 %422 
                                Private f32* %434 = OpAccessChain %32 %42 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %32 %42 
                                         f32 %436 = OpLoad %435 
                                         f32 %438 = OpFMul %436 %437 
                                         f32 %440 = OpFAdd %438 %439 
                                                      OpStore %397 %440 
                                Private f32* %441 = OpAccessChain %32 %42 
                                         f32 %442 = OpLoad %441 
                                Private f32* %443 = OpAccessChain %32 %42 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpFMul %442 %444 
                                Private f32* %446 = OpAccessChain %32 %42 
                                                      OpStore %446 %445 
                                         f32 %447 = OpLoad %397 
                                         f32 %448 = OpFNegate %447 
                                Private f32* %449 = OpAccessChain %32 %42 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFMul %448 %450 
                                         f32 %452 = OpFAdd %451 %422 
                                Private f32* %453 = OpAccessChain %32 %42 
                                                      OpStore %453 %452 
                                       f32_2 %454 = OpLoad %32 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 0 0 
                                       f32_4 %456 = OpLoad %60 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                                       f32_3 %458 = OpFMul %455 %457 
                              Uniform f32_4* %459 = OpAccessChain %17 %375 
                                       f32_4 %460 = OpLoad %459 
                                       f32_3 %461 = OpVectorShuffle %460 %460 0 1 2 
                                       f32_3 %462 = OpFAdd %458 %461 
                                                      OpStore %40 %462 
                                       f32_3 %463 = OpLoad %9 
                                       f32_2 %464 = OpVectorShuffle %463 %463 0 1 
                                       f32_2 %467 = OpFAdd %464 %466 
                                                      OpStore %32 %467 
                         read_only Texture2D %468 = OpLoad %360 
                                     sampler %469 = OpLoad %364 
                  read_only Texture2DSampled %470 = OpSampledImage %468 %469 
                                       f32_3 %471 = OpLoad %9 
                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
                                       f32_4 %473 = OpImageSampleImplicitLod %470 %472 
                                       f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
                                       f32_4 %475 = OpLoad %60 
                                       f32_4 %476 = OpVectorShuffle %475 %474 4 5 6 3 
                                                      OpStore %60 %476 
                                       f32_2 %477 = OpLoad %32 
                                       f32_2 %478 = OpLoad %32 
                                       f32_2 %479 = OpFMul %477 %478 
                                       f32_3 %480 = OpLoad %9 
                                       f32_3 %481 = OpVectorShuffle %480 %479 3 4 2 
                                                      OpStore %9 %481 
                                       f32_2 %482 = OpLoad %32 
                                       f32_2 %483 = OpVectorShuffle %482 %482 1 0 
                                       f32_2 %486 = OpFMul %483 %485 
                                                      OpStore %32 %486 
                                       f32_3 %487 = OpLoad %9 
                                       f32_2 %488 = OpVectorShuffle %487 %487 1 1 
                                       f32_3 %489 = OpLoad %9 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 0 
                                         f32 %491 = OpDot %488 %490 
                                Private f32* %492 = OpAccessChain %9 %42 
                                                      OpStore %492 %491 
                                Private f32* %493 = OpAccessChain %9 %42 
                                         f32 %494 = OpLoad %493 
                                         f32 %496 = OpFAdd %494 %495 
                                Private f32* %497 = OpAccessChain %9 %42 
                                                      OpStore %497 %496 
                                       f32_2 %498 = OpLoad %32 
                                       f32_2 %499 = OpVectorShuffle %498 %498 1 0 
                                       f32_3 %500 = OpLoad %9 
                                       f32_2 %501 = OpVectorShuffle %500 %500 0 0 
                                       f32_2 %502 = OpFMul %499 %501 
                                       f32_2 %504 = OpFAdd %502 %503 
                                       f32_3 %505 = OpLoad %80 
                                       f32_3 %506 = OpVectorShuffle %505 %504 3 4 2 
                                                      OpStore %80 %506 
                                       f32_3 %507 = OpLoad %9 
                                       f32_2 %508 = OpVectorShuffle %507 %507 0 0 
                                       f32_2 %509 = OpLoad %32 
                                       f32_2 %510 = OpFMul %508 %509 
                                       f32_3 %511 = OpLoad %9 
                                       f32_3 %512 = OpVectorShuffle %511 %510 3 4 2 
                                                      OpStore %9 %512 
                                       f32_3 %513 = OpLoad %9 
                                       f32_2 %514 = OpVectorShuffle %513 %513 0 1 
                                       f32_3 %515 = OpLoad %9 
                                       f32_2 %516 = OpVectorShuffle %515 %515 0 1 
                                       f32_2 %517 = OpFMul %514 %516 
                                       f32_3 %518 = OpLoad %9 
                                       f32_3 %519 = OpVectorShuffle %518 %517 3 4 2 
                                                      OpStore %9 %519 
                                       f32_3 %520 = OpLoad %9 
                                       f32_2 %521 = OpVectorShuffle %520 %520 0 1 
                                       f32_2 %522 = OpFNegate %521 
                                       f32_2 %525 = OpFMul %522 %524 
                                       f32_2 %527 = OpFAdd %525 %526 
                                       f32_3 %528 = OpLoad %9 
                                       f32_3 %529 = OpVectorShuffle %528 %527 3 4 2 
                                                      OpStore %9 %529 
                                       f32_3 %530 = OpLoad %9 
                                       f32_2 %531 = OpVectorShuffle %530 %530 0 0 
                                       f32_3 %532 = OpLoad %9 
                                       f32_2 %533 = OpVectorShuffle %532 %532 1 1 
                                         f32 %534 = OpDot %531 %533 
                                Private f32* %535 = OpAccessChain %9 %42 
                                                      OpStore %535 %534 
                                Uniform f32* %538 = OpAccessChain %17 %537 
                                         f32 %539 = OpLoad %538 
                                         f32 %541 = OpFMul %539 %540 
                                Private f32* %542 = OpAccessChain %80 %42 
                                         f32 %543 = OpLoad %542 
                                         f32 %544 = OpFAdd %541 %543 
                                Private f32* %545 = OpAccessChain %536 %42 
                                                      OpStore %545 %544 
                                Private f32* %546 = OpAccessChain %536 %42 
                                         f32 %547 = OpLoad %546 
                                         f32 %548 = OpFAdd %547 %260 
                                Private f32* %549 = OpAccessChain %536 %42 
                                                      OpStore %549 %548 
                                Private f32* %550 = OpAccessChain %536 %42 
                                         f32 %551 = OpLoad %550 
                                Private f32* %552 = OpAccessChain %536 %42 
                                         f32 %553 = OpLoad %552 
                                         f32 %554 = OpFNegate %553 
                                        bool %555 = OpFOrdGreaterThanEqual %551 %554 
                               Private bool* %556 = OpAccessChain %71 %42 
                                                      OpStore %556 %555 
                                Private f32* %557 = OpAccessChain %536 %42 
                                         f32 %558 = OpLoad %557 
                                         f32 %559 = OpExtInst %1 4 %558 
                                         f32 %560 = OpExtInst %1 10 %559 
                                Private f32* %561 = OpAccessChain %536 %42 
                                                      OpStore %561 %560 
                               Private bool* %562 = OpAccessChain %71 %42 
                                        bool %563 = OpLoad %562 
                                                      OpSelectionMerge %566 None 
                                                      OpBranchConditional %563 %565 %569 
                                             %565 = OpLabel 
                                Private f32* %567 = OpAccessChain %536 %42 
                                         f32 %568 = OpLoad %567 
                                                      OpStore %564 %568 
                                                      OpBranch %566 
                                             %569 = OpLabel 
                                Private f32* %570 = OpAccessChain %536 %42 
                                         f32 %571 = OpLoad %570 
                                         f32 %572 = OpFNegate %571 
                                                      OpStore %564 %572 
                                                      OpBranch %566 
                                             %566 = OpLabel 
                                         f32 %573 = OpLoad %564 
                                Private f32* %574 = OpAccessChain %536 %42 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %536 %42 
                                         f32 %576 = OpLoad %575 
                                Private f32* %577 = OpAccessChain %536 %42 
                                         f32 %578 = OpLoad %577 
                                         f32 %579 = OpFAdd %576 %578 
                                Private f32* %580 = OpAccessChain %536 %42 
                                                      OpStore %580 %579 
                                Private f32* %581 = OpAccessChain %536 %42 
                                         f32 %582 = OpLoad %581 
                                         f32 %583 = OpExtInst %1 43 %582 %189 %422 
                                Private f32* %584 = OpAccessChain %536 %42 
                                                      OpStore %584 %583 
                                Private f32* %585 = OpAccessChain %536 %42 
                                         f32 %586 = OpLoad %585 
                                         f32 %587 = OpFMul %586 %437 
                                         f32 %588 = OpFAdd %587 %439 
                                Private f32* %589 = OpAccessChain %32 %42 
                                                      OpStore %589 %588 
                                Private f32* %590 = OpAccessChain %536 %42 
                                         f32 %591 = OpLoad %590 
                                Private f32* %592 = OpAccessChain %536 %42 
                                         f32 %593 = OpLoad %592 
                                         f32 %594 = OpFMul %591 %593 
                                Private f32* %595 = OpAccessChain %536 %42 
                                                      OpStore %595 %594 
                                Private f32* %596 = OpAccessChain %536 %42 
                                         f32 %597 = OpLoad %596 
                                Private f32* %598 = OpAccessChain %32 %42 
                                         f32 %599 = OpLoad %598 
                                         f32 %600 = OpFMul %597 %599 
                                Private f32* %601 = OpAccessChain %536 %42 
                                                      OpStore %601 %600 
                                Private f32* %602 = OpAccessChain %536 %42 
                                         f32 %603 = OpLoad %602 
                                         f32 %604 = OpFNegate %603 
                                         f32 %605 = OpFMul %604 %260 
                                         f32 %606 = OpFAdd %605 %422 
                                Private f32* %607 = OpAccessChain %536 %42 
                                                      OpStore %607 %606 
                                       f32_3 %608 = OpLoad %536 
                                       f32_3 %609 = OpVectorShuffle %608 %608 0 0 0 
                                       f32_3 %610 = OpLoad %40 
                                       f32_3 %611 = OpFAdd %609 %610 
                                                      OpStore %536 %611 
                                       f32_3 %612 = OpLoad %536 
                              Uniform f32_4* %614 = OpAccessChain %17 %613 
                                       f32_4 %615 = OpLoad %614 
                                       f32_3 %616 = OpVectorShuffle %615 %615 0 1 2 
                                       f32_3 %617 = OpFMul %612 %616 
                                                      OpStore %536 %617 
                                Private f32* %618 = OpAccessChain %80 %107 
                                         f32 %619 = OpLoad %618 
                                         f32 %621 = OpFMul %619 %620 
                                Uniform f32* %622 = OpAccessChain %17 %537 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpFAdd %621 %623 
                                Private f32* %625 = OpAccessChain %40 %42 
                                                      OpStore %625 %624 
                                Private f32* %627 = OpAccessChain %40 %42 
                                         f32 %628 = OpLoad %627 
                                Private f32* %629 = OpAccessChain %40 %42 
                                         f32 %630 = OpLoad %629 
                                         f32 %631 = OpFNegate %630 
                                        bool %632 = OpFOrdGreaterThanEqual %628 %631 
                                                      OpStore %626 %632 
                                Private f32* %633 = OpAccessChain %40 %42 
                                         f32 %634 = OpLoad %633 
                                         f32 %635 = OpExtInst %1 4 %634 
                                         f32 %636 = OpExtInst %1 10 %635 
                                Private f32* %637 = OpAccessChain %40 %42 
                                                      OpStore %637 %636 
                                        bool %638 = OpLoad %626 
                                                      OpSelectionMerge %641 None 
                                                      OpBranchConditional %638 %640 %644 
                                             %640 = OpLabel 
                                Private f32* %642 = OpAccessChain %40 %42 
                                         f32 %643 = OpLoad %642 
                                                      OpStore %639 %643 
                                                      OpBranch %641 
                                             %644 = OpLabel 
                                Private f32* %645 = OpAccessChain %40 %42 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpFNegate %646 
                                                      OpStore %639 %647 
                                                      OpBranch %641 
                                             %641 = OpLabel 
                                         f32 %648 = OpLoad %639 
                                Private f32* %649 = OpAccessChain %40 %42 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %40 %42 
                                         f32 %651 = OpLoad %650 
                                         f32 %653 = OpFAdd %651 %652 
                                Private f32* %654 = OpAccessChain %40 %42 
                                                      OpStore %654 %653 
                                Uniform f32* %655 = OpAccessChain %17 %537 
                                         f32 %656 = OpLoad %655 
                                       f32_2 %657 = OpCompositeConstruct %656 %656 
                                       f32_2 %661 = OpFMul %657 %660 
                                       f32_3 %662 = OpLoad %52 
                                       f32_3 %663 = OpVectorShuffle %662 %661 3 4 2 
                                                      OpStore %52 %663 
                                       f32_3 %664 = OpLoad %52 
                                       f32_2 %665 = OpVectorShuffle %664 %664 0 1 
                                       f32_2 %666 = OpExtInst %1 13 %665 
                                       f32_3 %667 = OpLoad %52 
                                       f32_3 %668 = OpVectorShuffle %667 %666 3 4 2 
                                                      OpStore %52 %668 
                                       f32_3 %669 = OpLoad %52 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                       f32_2 %671 = OpFMul %670 %503 
                                       f32_3 %672 = OpLoad %80 
                                       f32_2 %673 = OpVectorShuffle %672 %672 1 1 
                                       f32_2 %674 = OpFAdd %671 %673 
                                       f32_3 %675 = OpLoad %52 
                                       f32_3 %676 = OpVectorShuffle %675 %674 3 4 2 
                                                      OpStore %52 %676 
                                       f32_3 %677 = OpLoad %80 
                                       f32_2 %678 = OpVectorShuffle %677 %677 0 1 
                                       f32_2 %679 = OpFNegate %678 
                                Uniform f32* %681 = OpAccessChain %17 %680 
                                         f32 %682 = OpLoad %681 
                                Uniform f32* %684 = OpAccessChain %17 %683 
                                         f32 %685 = OpLoad %684 
                                       f32_2 %686 = OpCompositeConstruct %682 %685 
                                       f32_2 %687 = OpFAdd %679 %686 
                                       f32_3 %688 = OpLoad %80 
                                       f32_3 %689 = OpVectorShuffle %688 %687 3 4 2 
                                                      OpStore %80 %689 
                                       f32_3 %691 = OpLoad %80 
                                       f32_2 %692 = OpVectorShuffle %691 %691 0 1 
                                       f32_3 %693 = OpLoad %80 
                                       f32_2 %694 = OpVectorShuffle %693 %693 0 1 
                                         f32 %695 = OpDot %692 %694 
                                                      OpStore %690 %695 
                                         f32 %696 = OpLoad %690 
                                         f32 %697 = OpExtInst %1 31 %696 
                                                      OpStore %690 %697 
                                         f32 %698 = OpLoad %690 
                                Uniform f32* %700 = OpAccessChain %17 %699 
                                         f32 %701 = OpLoad %700 
                                         f32 %702 = OpFNegate %701 
                                         f32 %703 = OpFAdd %698 %702 
                                                      OpStore %690 %703 
                         read_only Texture2D %704 = OpLoad %360 
                                     sampler %705 = OpLoad %364 
                  read_only Texture2DSampled %706 = OpSampledImage %704 %705 
                                       f32_3 %707 = OpLoad %52 
                                       f32_2 %708 = OpVectorShuffle %707 %707 0 1 
                                       f32_4 %709 = OpImageSampleImplicitLod %706 %708 
                                       f32_3 %710 = OpVectorShuffle %709 %709 0 1 2 
                                                      OpStore %80 %710 
                                       f32_3 %711 = OpLoad %40 
                                       f32_3 %712 = OpVectorShuffle %711 %711 0 0 0 
                                       f32_3 %715 = OpFMul %712 %714 
                                       f32_3 %716 = OpLoad %80 
                                       f32_3 %717 = OpFAdd %715 %716 
                                                      OpStore %40 %717 
                                       f32_3 %718 = OpLoad %40 
                                       f32_3 %720 = OpFMul %718 %719 
                                                      OpStore %40 %720 
                                       f32_3 %721 = OpLoad %536 
                                       f32_3 %722 = OpLoad %40 
                                       f32_3 %723 = OpFDiv %721 %722 
                                                      OpStore %536 %723 
                                       f32_3 %724 = OpLoad %536 
                                       f32_3 %725 = OpLoad %9 
                                       f32_3 %726 = OpVectorShuffle %725 %725 0 0 0 
                                       f32_3 %727 = OpFDiv %724 %726 
                                                      OpStore %9 %727 
                                       f32_3 %728 = OpLoad %9 
                                       f32_3 %729 = OpFNegate %728 
                                       f32_4 %730 = OpLoad %60 
                                       f32_3 %731 = OpVectorShuffle %730 %730 0 1 2 
                                       f32_3 %732 = OpFAdd %729 %731 
                                                      OpStore %40 %732 
                                Uniform f32* %734 = OpAccessChain %17 %733 
                                         f32 %735 = OpLoad %734 
                                         f32 %737 = OpFMul %735 %736 
                                                      OpStore %397 %737 
                                         f32 %738 = OpLoad %397 
                                         f32 %739 = OpFDiv %422 %738 
                                                      OpStore %397 %739 
                                         f32 %740 = OpLoad %397 
                                         f32 %741 = OpLoad %690 
                                         f32 %742 = OpFMul %740 %741 
                                                      OpStore %397 %742 
                                         f32 %743 = OpLoad %397 
                                         f32 %744 = OpExtInst %1 43 %743 %189 %422 
                                                      OpStore %397 %744 
                                         f32 %745 = OpLoad %397 
                                         f32 %746 = OpFMul %745 %437 
                                         f32 %747 = OpFAdd %746 %439 
                                                      OpStore %690 %747 
                                         f32 %748 = OpLoad %397 
                                         f32 %749 = OpLoad %397 
                                         f32 %750 = OpFMul %748 %749 
                                                      OpStore %397 %750 
                                         f32 %751 = OpLoad %690 
                                         f32 %752 = OpFNegate %751 
                                         f32 %753 = OpLoad %397 
                                         f32 %754 = OpFMul %752 %753 
                                         f32 %755 = OpFAdd %754 %422 
                                                      OpStore %397 %755 
                                         f32 %756 = OpLoad %397 
                                       f32_3 %757 = OpCompositeConstruct %756 %756 %756 
                                       f32_3 %758 = OpLoad %40 
                                       f32_3 %759 = OpFMul %757 %758 
                                       f32_3 %760 = OpLoad %9 
                                       f32_3 %761 = OpFAdd %759 %760 
                                                      OpStore %9 %761 
                                       f32_3 %762 = OpLoad %9 
                                       f32_3 %763 = OpFNegate %762 
                                       f32_4 %764 = OpLoad %60 
                                       f32_3 %765 = OpVectorShuffle %764 %764 0 1 2 
                                       f32_3 %766 = OpFAdd %763 %765 
                                                      OpStore %40 %766 
                                Uniform f32* %768 = OpAccessChain %17 %767 
                                         f32 %769 = OpLoad %768 
                                         f32 %770 = OpFNegate %769 
                                         f32 %771 = OpFAdd %770 %422 
                                                      OpStore %397 %771 
                                         f32 %774 = OpLoad %397 
                                       f32_3 %775 = OpCompositeConstruct %774 %774 %774 
                                       f32_3 %776 = OpLoad %40 
                                       f32_3 %777 = OpFMul %775 %776 
                                       f32_3 %778 = OpLoad %9 
                                       f32_3 %779 = OpFAdd %777 %778 
                                       f32_4 %780 = OpLoad %773 
                                       f32_4 %781 = OpVectorShuffle %780 %779 4 5 6 3 
                                                      OpStore %773 %781 
                                 Output f32* %783 = OpAccessChain %773 %244 
                                                      OpStore %783 %422 
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