//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Atmosphere_Snow_8bits" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 48564
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vec2(_TimeX) * vec2(0.0199999996, 0.500999987);
    u_xlat1.yz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = u_xlat1.yz + u_xlat1.yz;
    u_xlat18 = u_xlat12.y * _Value3;
    u_xlat1.x = u_xlat18 * 1.60000002 + u_xlat12.x;
    u_xlat0 = u_xlat1.xzxz * vec4(1.00999999, 2.01999998, 1.07000005, 2.1400001) + u_xlat0.xyxy;
    u_xlat2 = floor(u_xlat0);
    u_xlat0 = u_xlat0 + (-u_xlat2);
    u_xlat0 = u_xlat0 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
    u_xlat0 = floor(u_xlat0);
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.y = dot(u_xlat0.zw, vec2(12.9898005, 78.2330017));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(13758.5449, 13758.5449);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.y = u_xlat0.y * _Value + -0.899999976;
    u_xlat0.x = u_xlat0.x * _Value + -0.899999976;
    u_xlat0.xy = u_xlat0.xy * vec2(9.99999809, 9.99999809);
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat2 = texture(_MainTex, u_xlat1.yz);
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat0.xzw) + vec3(0.100000001, 1.0, 1.0);
    u_xlat7.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat6 * u_xlat7.x;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.w = u_xlat1.z * 2.0;
    u_xlat7.xz = vec2(_TimeX) * vec2(0.0500000007, 0.5) + u_xlat1.xw;
    u_xlat4.xy = floor(u_xlat7.xz);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat4.xy);
    u_xlat7.xz = u_xlat7.xz * vec2(vec2(_Value2, _Value2));
    u_xlat7.xz = floor(u_xlat7.xz);
    u_xlat18 = dot(u_xlat7.xz, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * 13758.5449;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * _Value + -0.899999976;
    u_xlat18 = u_xlat18 * 9.99999809;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat7.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4 = vec4(_TimeX) * vec4(0.0199999996, 0.50999999, 0.0700000003, 0.493000001);
    u_xlat4 = u_xlat1.xzxz * vec4(0.899999976, 1.79999995, 0.75, 1.5) + u_xlat4;
    u_xlat5 = floor(u_xlat4);
    u_xlat4 = u_xlat4 + (-u_xlat5);
    u_xlat4 = u_xlat4 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
    u_xlat4 = floor(u_xlat4);
    u_xlat18 = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
    u_xlat7.x = dot(u_xlat4.zw, vec2(12.9898005, 78.2330017));
    u_xlat7.x = sin(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * 13758.5449;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Value + -0.899999976;
    u_xlat7.x = u_xlat7.x * 9.99999809;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * 13758.5449;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * _Value + -0.899999976;
    u_xlat18 = u_xlat18 * 9.99999809;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat19 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4 = vec4(_TimeX) * vec4(0.0299999993, 0.504000008, 0.0199999996, 0.497000009);
    u_xlat4 = u_xlat1.xzxz * vec4(0.5, 1.0, 0.300000012, 0.600000024) + u_xlat4;
    u_xlat5 = floor(u_xlat4);
    u_xlat4 = u_xlat4 + (-u_xlat5);
    u_xlat4 = u_xlat4 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
    u_xlat4 = floor(u_xlat4);
    u_xlat18 = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
    u_xlat7.x = dot(u_xlat4.zw, vec2(12.9898005, 78.2330017));
    u_xlat7.x = sin(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * 13758.5449;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Value + -0.949999988;
    u_xlat7.x = u_xlat7.x * 19.9999962;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * 13758.5449;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * _Value + -0.939999998;
    u_xlat18 = u_xlat18 * 16.666666;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat19 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4 = vec4(_TimeX) * vec4(0.0, 0.50999999, 0.0, 0.523000002);
    u_xlat1 = u_xlat1.xzxz * vec4(0.100000001, 0.200000003, 0.0299999993, 0.0599999987) + u_xlat4;
    u_xlat4 = floor(u_xlat1);
    u_xlat1 = u_xlat1 + (-u_xlat4);
    u_xlat1 = u_xlat1 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
    u_xlat1 = floor(u_xlat1);
    u_xlat18 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = dot(u_xlat1.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 13758.5449;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Value + -0.99000001;
    u_xlat1.x = u_xlat1.x * 100.000099;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * 13758.5449;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * _Value + -0.959999979;
    u_xlat18 = u_xlat18 * 24.9999866;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat7.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(_Value4) * u_xlat0.xyz + u_xlat2.xyz;
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
; Bound: 865
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %28 %850 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 28 
                                                      OpDecorate %85 DescriptorSet 85 
                                                      OpDecorate %85 Binding 85 
                                                      OpDecorate %89 DescriptorSet 89 
                                                      OpDecorate %89 Binding 89 
                                                      OpDecorate %850 Location 850 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %10 %7 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 0 
                                              %16 = OpTypePointer Uniform %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                                          f32 %21 = OpConstant 3.674022E-40 
                                          f32 %22 = OpConstant 3.674022E-40 
                                          f32 %23 = OpConstant 3.674022E-40 
                                        f32_4 %24 = OpConstantComposite %20 %21 %22 %23 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %30 = OpConstant 6 
                                              %31 = OpTypePointer Uniform %7 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          i32 %45 = OpConstant 5 
                                              %46 = OpTypeInt 32 0 
                                          u32 %47 = OpConstant 1 
                                          f32 %50 = OpConstant 3.674022E-40 
                                              %52 = OpTypePointer Private %6 
                                 Private f32* %53 = OpVariable Private 
                                          u32 %54 = OpConstant 2 
                                          f32 %58 = OpConstant 3.674022E-40 
                                              %61 = OpTypePointer Function %6 
                                          u32 %70 = OpConstant 3 
                               Private f32_4* %72 = OpVariable Private 
                                              %80 = OpTypeVector %6 3 
                                              %81 = OpTypePointer Private %80 
                               Private f32_3* %82 = OpVariable Private 
                                              %83 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %84 = OpTypePointer UniformConstant %83 
         UniformConstant read_only Texture2D* %85 = OpVariable UniformConstant 
                                              %87 = OpTypeSampler 
                                              %88 = OpTypePointer UniformConstant %87 
                     UniformConstant sampler* %89 = OpVariable UniformConstant 
                                              %91 = OpTypeSampledImage %83 
                                              %97 = OpTypePointer Private %10 
                               Private f32_2* %98 = OpVariable Private 
                                         i32 %101 = OpConstant 3 
                                         u32 %105 = OpConstant 0 
                                         f32 %109 = OpConstant 3.674022E-40 
                                         f32 %117 = OpConstant 3.674022E-40 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                         f32 %120 = OpConstant 3.674022E-40 
                                       f32_4 %121 = OpConstantComposite %117 %118 %119 %120 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_2 %129 = OpConstantComposite %58 %128 
                              Private f32_4* %136 = OpVariable Private 
                                         i32 %144 = OpConstant 2 
                              Private f32_2* %162 = OpVariable Private 
                                         f32 %165 = OpConstant 3.674022E-40 
                                         f32 %166 = OpConstant 3.674022E-40 
                                       f32_2 %167 = OpConstantComposite %165 %166 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_2 %178 = OpConstantComposite %177 %177 
                                         i32 %184 = OpConstant 1 
                                         f32 %188 = OpConstant 3.674022E-40 
                                         f32 %199 = OpConstant 3.674022E-40 
                                       f32_2 %200 = OpConstantComposite %199 %199 
                                         f32 %208 = OpConstant 3.674022E-40 
                                         f32 %210 = OpConstant 3.674022E-40 
                                       f32_3 %227 = OpConstantComposite %58 %58 %58 
                                         f32 %243 = OpConstant 3.674022E-40 
                                       f32_3 %244 = OpConstantComposite %243 %58 %58 
                                Private f32* %253 = OpVariable Private 
                                Private f32* %339 = OpVariable Private 
                                         f32 %374 = OpConstant 3.674022E-40 
                                         f32 %375 = OpConstant 3.674022E-40 
                                         f32 %376 = OpConstant 3.674022E-40 
                                       f32_4 %377 = OpConstantComposite %20 %374 %375 %376 
                                         f32 %381 = OpConstant 3.674022E-40 
                                         f32 %382 = OpConstant 3.674022E-40 
                                       f32_2 %383 = OpConstantComposite %381 %382 
                                         f32 %390 = OpConstant 3.674022E-40 
                                         f32 %391 = OpConstant 3.674022E-40 
                                       f32_2 %392 = OpConstantComposite %390 %391 
                              Private f32_2* %399 = OpVariable Private 
                                         f32 %529 = OpConstant 3.674022E-40 
                                         f32 %530 = OpConstant 3.674022E-40 
                                         f32 %531 = OpConstant 3.674022E-40 
                                       f32_4 %532 = OpConstantComposite %529 %530 %20 %531 
                                       f32_2 %536 = OpConstantComposite %23 %58 
                                         f32 %543 = OpConstant 3.674022E-40 
                                         f32 %544 = OpConstant 3.674022E-40 
                                       f32_2 %545 = OpConstantComposite %543 %544 
                                         f32 %582 = OpConstant 3.674022E-40 
                                         f32 %585 = OpConstant 3.674022E-40 
                                         f32 %648 = OpConstant 3.674022E-40 
                                         f32 %651 = OpConstant 3.674022E-40 
                                         f32 %685 = OpConstant 3.674022E-40 
                                       f32_4 %686 = OpConstantComposite %50 %374 %50 %685 
                                         f32 %690 = OpConstant 3.674022E-40 
                                       f32_2 %691 = OpConstantComposite %243 %690 
                                         f32 %698 = OpConstant 3.674022E-40 
                                       f32_2 %699 = OpConstantComposite %529 %698 
                                         f32 %739 = OpConstant 3.674022E-40 
                                         f32 %742 = OpConstant 3.674022E-40 
                                         f32 %814 = OpConstant 3.674022E-40 
                                         f32 %817 = OpConstant 3.674022E-40 
                                             %849 = OpTypePointer Output %7 
                               Output f32_4* %850 = OpVariable Output 
                                         i32 %851 = OpConstant 4 
                                             %862 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %62 = OpVariable Function 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                        f32_4 %19 = OpCompositeConstruct %18 %18 %18 %18 
                                        f32_4 %25 = OpFMul %19 %24 
                                                      OpStore %9 %25 
                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %32 = OpAccessChain %13 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFMul %29 %34 
                               Uniform f32_4* %36 = OpAccessChain %13 %30 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                        f32_2 %39 = OpFAdd %35 %38 
                                        f32_4 %40 = OpLoad %26 
                                        f32_4 %41 = OpVectorShuffle %40 %39 0 4 5 3 
                                                      OpStore %26 %41 
                                 Uniform f32* %48 = OpAccessChain %13 %45 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %51 = OpFOrdLessThan %49 %50 
                                                      OpStore %44 %51 
                                 Private f32* %55 = OpAccessChain %26 %54 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpFNegate %56 
                                          f32 %59 = OpFAdd %57 %58 
                                                      OpStore %53 %59 
                                         bool %60 = OpLoad %44 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %60 %63 %66 
                                              %63 = OpLabel 
                                          f32 %65 = OpLoad %53 
                                                      OpStore %62 %65 
                                                      OpBranch %64 
                                              %66 = OpLabel 
                                 Private f32* %67 = OpAccessChain %26 %54 
                                          f32 %68 = OpLoad %67 
                                                      OpStore %62 %68 
                                                      OpBranch %64 
                                              %64 = OpLabel 
                                          f32 %69 = OpLoad %62 
                                 Private f32* %71 = OpAccessChain %26 %70 
                                                      OpStore %71 %69 
                                        f32_4 %73 = OpLoad %26 
                                        f32_2 %74 = OpVectorShuffle %73 %73 1 3 
                                        f32_4 %75 = OpLoad %26 
                                        f32_2 %76 = OpVectorShuffle %75 %75 1 3 
                                        f32_2 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %72 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 2 3 
                                                      OpStore %72 %79 
                          read_only Texture2D %86 = OpLoad %85 
                                      sampler %90 = OpLoad %89 
                   read_only Texture2DSampled %92 = OpSampledImage %86 %90 
                                        f32_4 %93 = OpLoad %26 
                                        f32_2 %94 = OpVectorShuffle %93 %93 1 2 
                                        f32_4 %95 = OpImageSampleImplicitLod %92 %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                                      OpStore %82 %96 
                                 Private f32* %99 = OpAccessChain %72 %47 
                                         f32 %100 = OpLoad %99 
                                Uniform f32* %102 = OpAccessChain %13 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFMul %100 %103 
                                Private f32* %106 = OpAccessChain %98 %105 
                                                      OpStore %106 %104 
                                Private f32* %107 = OpAccessChain %98 %105 
                                         f32 %108 = OpLoad %107 
                                         f32 %110 = OpFMul %108 %109 
                                Private f32* %111 = OpAccessChain %72 %105 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFAdd %110 %112 
                                Private f32* %114 = OpAccessChain %26 %105 
                                                      OpStore %114 %113 
                                       f32_4 %115 = OpLoad %26 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 3 0 3 
                                       f32_4 %122 = OpFMul %116 %121 
                                       f32_4 %123 = OpLoad %9 
                                       f32_4 %124 = OpVectorShuffle %123 %123 0 1 0 1 
                                       f32_4 %125 = OpFAdd %122 %124 
                                                      OpStore %72 %125 
                                       f32_4 %126 = OpLoad %26 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 3 
                                       f32_2 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 2 3 
                                       f32_2 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 2 3 
                                                      OpStore %9 %135 
                                       f32_4 %137 = OpLoad %72 
                                       f32_4 %138 = OpExtInst %1 8 %137 
                                                      OpStore %136 %138 
                                       f32_4 %139 = OpLoad %72 
                                       f32_4 %140 = OpLoad %136 
                                       f32_4 %141 = OpFNegate %140 
                                       f32_4 %142 = OpFAdd %139 %141 
                                                      OpStore %72 %142 
                                       f32_4 %143 = OpLoad %72 
                                Uniform f32* %145 = OpAccessChain %13 %144 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %13 %144 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %149 = OpAccessChain %13 %144 
                                         f32 %150 = OpLoad %149 
                                Uniform f32* %151 = OpAccessChain %13 %144 
                                         f32 %152 = OpLoad %151 
                                       f32_4 %153 = OpCompositeConstruct %146 %148 %150 %152 
                                         f32 %154 = OpCompositeExtract %153 0 
                                         f32 %155 = OpCompositeExtract %153 1 
                                         f32 %156 = OpCompositeExtract %153 2 
                                         f32 %157 = OpCompositeExtract %153 3 
                                       f32_4 %158 = OpCompositeConstruct %154 %155 %156 %157 
                                       f32_4 %159 = OpFMul %143 %158 
                                                      OpStore %72 %159 
                                       f32_4 %160 = OpLoad %72 
                                       f32_4 %161 = OpExtInst %1 8 %160 
                                                      OpStore %72 %161 
                                       f32_4 %163 = OpLoad %72 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                         f32 %168 = OpDot %164 %167 
                                Private f32* %169 = OpAccessChain %162 %105 
                                                      OpStore %169 %168 
                                       f32_4 %170 = OpLoad %72 
                                       f32_2 %171 = OpVectorShuffle %170 %170 2 3 
                                         f32 %172 = OpDot %171 %167 
                                Private f32* %173 = OpAccessChain %162 %47 
                                                      OpStore %173 %172 
                                       f32_2 %174 = OpLoad %162 
                                       f32_2 %175 = OpExtInst %1 13 %174 
                                                      OpStore %162 %175 
                                       f32_2 %176 = OpLoad %162 
                                       f32_2 %179 = OpFMul %176 %178 
                                                      OpStore %162 %179 
                                       f32_2 %180 = OpLoad %162 
                                       f32_2 %181 = OpExtInst %1 10 %180 
                                                      OpStore %162 %181 
                                Private f32* %182 = OpAccessChain %162 %47 
                                         f32 %183 = OpLoad %182 
                                Uniform f32* %185 = OpAccessChain %13 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFMul %183 %186 
                                         f32 %189 = OpFAdd %187 %188 
                                Private f32* %190 = OpAccessChain %162 %47 
                                                      OpStore %190 %189 
                                Private f32* %191 = OpAccessChain %162 %105 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %193 = OpAccessChain %13 %184 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFMul %192 %194 
                                         f32 %196 = OpFAdd %195 %188 
                                Private f32* %197 = OpAccessChain %162 %105 
                                                      OpStore %197 %196 
                                       f32_2 %198 = OpLoad %162 
                                       f32_2 %201 = OpFMul %198 %200 
                                                      OpStore %162 %201 
                                       f32_2 %202 = OpLoad %162 
                                       f32_2 %203 = OpCompositeConstruct %50 %50 
                                       f32_2 %204 = OpCompositeConstruct %58 %58 
                                       f32_2 %205 = OpExtInst %1 43 %202 %203 %204 
                                                      OpStore %162 %205 
                                Private f32* %206 = OpAccessChain %162 %105 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %211 = OpFAdd %209 %210 
                                Private f32* %212 = OpAccessChain %98 %105 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %162 %105 
                                         f32 %214 = OpLoad %213 
                                Private f32* %215 = OpAccessChain %162 %105 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                Private f32* %218 = OpAccessChain %162 %105 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %162 %105 
                                         f32 %220 = OpLoad %219 
                                Private f32* %221 = OpAccessChain %98 %105 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %220 %222 
                                Private f32* %224 = OpAccessChain %162 %105 
                                                      OpStore %224 %223 
                                       f32_3 %225 = OpLoad %82 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %228 = OpFAdd %226 %227 
                                       f32_4 %229 = OpLoad %72 
                                       f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                                      OpStore %72 %230 
                                       f32_2 %231 = OpLoad %162 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 0 0 
                                       f32_4 %233 = OpLoad %72 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                       f32_3 %235 = OpFMul %232 %234 
                                       f32_3 %236 = OpLoad %82 
                                       f32_3 %237 = OpFAdd %235 %236 
                                       f32_4 %238 = OpLoad %72 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %72 %239 
                                       f32_4 %240 = OpLoad %72 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %242 = OpFNegate %241 
                                       f32_3 %245 = OpFAdd %242 %244 
                                       f32_4 %246 = OpLoad %136 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %136 %247 
                                Private f32* %248 = OpAccessChain %162 %47 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFMul %249 %208 
                                         f32 %251 = OpFAdd %250 %210 
                                Private f32* %252 = OpAccessChain %162 %105 
                                                      OpStore %252 %251 
                                Private f32* %254 = OpAccessChain %162 %47 
                                         f32 %255 = OpLoad %254 
                                Private f32* %256 = OpAccessChain %162 %47 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFMul %255 %257 
                                                      OpStore %253 %258 
                                         f32 %259 = OpLoad %253 
                                Private f32* %260 = OpAccessChain %162 %105 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpFMul %259 %261 
                                Private f32* %263 = OpAccessChain %162 %105 
                                                      OpStore %263 %262 
                                       f32_2 %264 = OpLoad %162 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 0 0 
                                       f32_4 %266 = OpLoad %136 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %265 %267 
                                       f32_4 %269 = OpLoad %72 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_3 %271 = OpFAdd %268 %270 
                                       f32_4 %272 = OpLoad %72 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %72 %273 
                                       f32_4 %274 = OpLoad %72 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpFNegate %275 
                                       f32_3 %277 = OpFAdd %276 %227 
                                       f32_4 %278 = OpLoad %136 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 6 3 
                                                      OpStore %136 %279 
                                       f32_4 %280 = OpLoad %9 
                                       f32_2 %281 = OpVectorShuffle %280 %280 0 1 
                                       f32_2 %282 = OpExtInst %1 8 %281 
                                                      OpStore %162 %282 
                                       f32_2 %283 = OpLoad %162 
                                       f32_2 %284 = OpFNegate %283 
                                       f32_4 %285 = OpLoad %9 
                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                                       f32_2 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 2 3 
                                                      OpStore %9 %289 
                                       f32_4 %290 = OpLoad %9 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 1 
                                Uniform f32* %292 = OpAccessChain %13 %144 
                                         f32 %293 = OpLoad %292 
                                Uniform f32* %294 = OpAccessChain %13 %144 
                                         f32 %295 = OpLoad %294 
                                       f32_2 %296 = OpCompositeConstruct %293 %295 
                                         f32 %297 = OpCompositeExtract %296 0 
                                         f32 %298 = OpCompositeExtract %296 1 
                                       f32_2 %299 = OpCompositeConstruct %297 %298 
                                       f32_2 %300 = OpFMul %291 %299 
                                       f32_4 %301 = OpLoad %9 
                                       f32_4 %302 = OpVectorShuffle %301 %300 4 5 2 3 
                                                      OpStore %9 %302 
                                       f32_4 %303 = OpLoad %9 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_2 %305 = OpExtInst %1 8 %304 
                                       f32_4 %306 = OpLoad %9 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 2 3 
                                                      OpStore %9 %307 
                                       f32_4 %308 = OpLoad %9 
                                       f32_2 %309 = OpVectorShuffle %308 %308 0 1 
                                         f32 %310 = OpDot %309 %167 
                                Private f32* %311 = OpAccessChain %9 %105 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %9 %105 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 13 %313 
                                Private f32* %315 = OpAccessChain %9 %105 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %9 %105 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %177 
                                Private f32* %319 = OpAccessChain %9 %105 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %9 %105 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 10 %321 
                                Private f32* %323 = OpAccessChain %9 %105 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %9 %105 
                                         f32 %325 = OpLoad %324 
                                Uniform f32* %326 = OpAccessChain %13 %184 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFMul %325 %327 
                                         f32 %329 = OpFAdd %328 %188 
                                Private f32* %330 = OpAccessChain %9 %105 
                                                      OpStore %330 %329 
                                Private f32* %331 = OpAccessChain %9 %105 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFMul %332 %199 
                                Private f32* %334 = OpAccessChain %9 %105 
                                                      OpStore %334 %333 
                                Private f32* %335 = OpAccessChain %9 %105 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpExtInst %1 43 %336 %50 %58 
                                Private f32* %338 = OpAccessChain %9 %105 
                                                      OpStore %338 %337 
                                Private f32* %340 = OpAccessChain %9 %105 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpFMul %341 %208 
                                         f32 %343 = OpFAdd %342 %210 
                                                      OpStore %339 %343 
                                Private f32* %344 = OpAccessChain %9 %105 
                                         f32 %345 = OpLoad %344 
                                Private f32* %346 = OpAccessChain %9 %105 
                                         f32 %347 = OpLoad %346 
                                         f32 %348 = OpFMul %345 %347 
                                Private f32* %349 = OpAccessChain %9 %105 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %9 %105 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpLoad %339 
                                         f32 %353 = OpFMul %351 %352 
                                Private f32* %354 = OpAccessChain %9 %105 
                                                      OpStore %354 %353 
                                       f32_4 %355 = OpLoad %9 
                                       f32_3 %356 = OpVectorShuffle %355 %355 0 0 0 
                                       f32_4 %357 = OpLoad %136 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                                       f32_3 %359 = OpFMul %356 %358 
                                       f32_4 %360 = OpLoad %72 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFAdd %359 %361 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpVectorShuffle %363 %362 4 5 6 3 
                                                      OpStore %9 %364 
                                       f32_4 %365 = OpLoad %9 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFNegate %366 
                                       f32_3 %368 = OpFAdd %367 %227 
                                       f32_4 %369 = OpLoad %72 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %72 %370 
                                Uniform f32* %371 = OpAccessChain %13 %15 
                                         f32 %372 = OpLoad %371 
                                       f32_4 %373 = OpCompositeConstruct %372 %372 %372 %372 
                                       f32_4 %378 = OpFMul %373 %377 
                                                      OpStore %136 %378 
                                       f32_4 %379 = OpLoad %26 
                                       f32_2 %380 = OpVectorShuffle %379 %379 0 3 
                                       f32_2 %384 = OpFMul %380 %383 
                                       f32_4 %385 = OpLoad %136 
                                       f32_2 %386 = OpVectorShuffle %385 %385 0 1 
                                       f32_2 %387 = OpFAdd %384 %386 
                                                      OpStore %98 %387 
                                       f32_4 %388 = OpLoad %26 
                                       f32_2 %389 = OpVectorShuffle %388 %388 0 3 
                                       f32_2 %393 = OpFMul %389 %392 
                                       f32_4 %394 = OpLoad %136 
                                       f32_2 %395 = OpVectorShuffle %394 %394 2 3 
                                       f32_2 %396 = OpFAdd %393 %395 
                                       f32_4 %397 = OpLoad %136 
                                       f32_4 %398 = OpVectorShuffle %397 %396 4 5 2 3 
                                                      OpStore %136 %398 
                                       f32_2 %400 = OpLoad %98 
                                       f32_2 %401 = OpExtInst %1 8 %400 
                                                      OpStore %399 %401 
                                       f32_2 %402 = OpLoad %98 
                                       f32_2 %403 = OpLoad %399 
                                       f32_2 %404 = OpFNegate %403 
                                       f32_2 %405 = OpFAdd %402 %404 
                                                      OpStore %98 %405 
                                       f32_2 %406 = OpLoad %98 
                                Uniform f32* %407 = OpAccessChain %13 %144 
                                         f32 %408 = OpLoad %407 
                                Uniform f32* %409 = OpAccessChain %13 %144 
                                         f32 %410 = OpLoad %409 
                                       f32_2 %411 = OpCompositeConstruct %408 %410 
                                         f32 %412 = OpCompositeExtract %411 0 
                                         f32 %413 = OpCompositeExtract %411 1 
                                       f32_2 %414 = OpCompositeConstruct %412 %413 
                                       f32_2 %415 = OpFMul %406 %414 
                                                      OpStore %98 %415 
                                       f32_2 %416 = OpLoad %98 
                                       f32_2 %417 = OpExtInst %1 8 %416 
                                                      OpStore %98 %417 
                                       f32_2 %418 = OpLoad %98 
                                         f32 %419 = OpDot %418 %167 
                                                      OpStore %253 %419 
                                         f32 %420 = OpLoad %253 
                                         f32 %421 = OpExtInst %1 13 %420 
                                                      OpStore %253 %421 
                                         f32 %422 = OpLoad %253 
                                         f32 %423 = OpFMul %422 %177 
                                                      OpStore %253 %423 
                                         f32 %424 = OpLoad %253 
                                         f32 %425 = OpExtInst %1 10 %424 
                                                      OpStore %253 %425 
                                         f32 %426 = OpLoad %253 
                                Uniform f32* %427 = OpAccessChain %13 %184 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpFMul %426 %428 
                                         f32 %430 = OpFAdd %429 %188 
                                                      OpStore %253 %430 
                                         f32 %431 = OpLoad %253 
                                         f32 %432 = OpFMul %431 %199 
                                                      OpStore %253 %432 
                                         f32 %433 = OpLoad %253 
                                         f32 %434 = OpExtInst %1 43 %433 %50 %58 
                                                      OpStore %253 %434 
                                         f32 %435 = OpLoad %253 
                                         f32 %436 = OpFMul %435 %208 
                                         f32 %437 = OpFAdd %436 %210 
                                Private f32* %438 = OpAccessChain %98 %105 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %253 
                                         f32 %440 = OpLoad %253 
                                         f32 %441 = OpFMul %439 %440 
                                                      OpStore %253 %441 
                                         f32 %442 = OpLoad %253 
                                Private f32* %443 = OpAccessChain %98 %105 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpFMul %442 %444 
                                                      OpStore %253 %445 
                                         f32 %446 = OpLoad %253 
                                       f32_3 %447 = OpCompositeConstruct %446 %446 %446 
                                       f32_4 %448 = OpLoad %72 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 1 2 
                                       f32_3 %450 = OpFMul %447 %449 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 2 
                                       f32_3 %453 = OpFAdd %450 %452 
                                       f32_4 %454 = OpLoad %9 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
                                                      OpStore %9 %455 
                                       f32_4 %456 = OpLoad %9 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                                       f32_3 %458 = OpFNegate %457 
                                       f32_3 %459 = OpFAdd %458 %227 
                                       f32_4 %460 = OpLoad %72 
                                       f32_4 %461 = OpVectorShuffle %460 %459 4 5 6 3 
                                                      OpStore %72 %461 
                                       f32_4 %462 = OpLoad %136 
                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                                       f32_2 %464 = OpExtInst %1 8 %463 
                                                      OpStore %98 %464 
                                       f32_2 %465 = OpLoad %98 
                                       f32_2 %466 = OpFNegate %465 
                                       f32_4 %467 = OpLoad %136 
                                       f32_2 %468 = OpVectorShuffle %467 %467 0 1 
                                       f32_2 %469 = OpFAdd %466 %468 
                                                      OpStore %98 %469 
                                       f32_2 %470 = OpLoad %98 
                                Uniform f32* %471 = OpAccessChain %13 %144 
                                         f32 %472 = OpLoad %471 
                                Uniform f32* %473 = OpAccessChain %13 %144 
                                         f32 %474 = OpLoad %473 
                                       f32_2 %475 = OpCompositeConstruct %472 %474 
                                         f32 %476 = OpCompositeExtract %475 0 
                                         f32 %477 = OpCompositeExtract %475 1 
                                       f32_2 %478 = OpCompositeConstruct %476 %477 
                                       f32_2 %479 = OpFMul %470 %478 
                                                      OpStore %98 %479 
                                       f32_2 %480 = OpLoad %98 
                                       f32_2 %481 = OpExtInst %1 8 %480 
                                                      OpStore %98 %481 
                                       f32_2 %482 = OpLoad %98 
                                         f32 %483 = OpDot %482 %167 
                                                      OpStore %253 %483 
                                         f32 %484 = OpLoad %253 
                                         f32 %485 = OpExtInst %1 13 %484 
                                                      OpStore %253 %485 
                                         f32 %486 = OpLoad %253 
                                         f32 %487 = OpFMul %486 %177 
                                                      OpStore %253 %487 
                                         f32 %488 = OpLoad %253 
                                         f32 %489 = OpExtInst %1 10 %488 
                                                      OpStore %253 %489 
                                         f32 %490 = OpLoad %253 
                                Uniform f32* %491 = OpAccessChain %13 %184 
                                         f32 %492 = OpLoad %491 
                                         f32 %493 = OpFMul %490 %492 
                                         f32 %494 = OpFAdd %493 %188 
                                                      OpStore %253 %494 
                                         f32 %495 = OpLoad %253 
                                         f32 %496 = OpFMul %495 %199 
                                                      OpStore %253 %496 
                                         f32 %497 = OpLoad %253 
                                         f32 %498 = OpExtInst %1 43 %497 %50 %58 
                                                      OpStore %253 %498 
                                         f32 %499 = OpLoad %253 
                                         f32 %500 = OpFMul %499 %208 
                                         f32 %501 = OpFAdd %500 %210 
                                Private f32* %502 = OpAccessChain %98 %105 
                                                      OpStore %502 %501 
                                         f32 %503 = OpLoad %253 
                                         f32 %504 = OpLoad %253 
                                         f32 %505 = OpFMul %503 %504 
                                                      OpStore %253 %505 
                                         f32 %506 = OpLoad %253 
                                Private f32* %507 = OpAccessChain %98 %105 
                                         f32 %508 = OpLoad %507 
                                         f32 %509 = OpFMul %506 %508 
                                                      OpStore %253 %509 
                                         f32 %510 = OpLoad %253 
                                       f32_3 %511 = OpCompositeConstruct %510 %510 %510 
                                       f32_4 %512 = OpLoad %72 
                                       f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                                       f32_3 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %9 
                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
                                       f32_3 %517 = OpFAdd %514 %516 
                                       f32_4 %518 = OpLoad %9 
                                       f32_4 %519 = OpVectorShuffle %518 %517 4 5 6 3 
                                                      OpStore %9 %519 
                                       f32_4 %520 = OpLoad %9 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %522 = OpFNegate %521 
                                       f32_3 %523 = OpFAdd %522 %227 
                                       f32_4 %524 = OpLoad %72 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 6 3 
                                                      OpStore %72 %525 
                                Uniform f32* %526 = OpAccessChain %13 %15 
                                         f32 %527 = OpLoad %526 
                                       f32_4 %528 = OpCompositeConstruct %527 %527 %527 %527 
                                       f32_4 %533 = OpFMul %528 %532 
                                                      OpStore %136 %533 
                                       f32_4 %534 = OpLoad %26 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 3 
                                       f32_2 %537 = OpFMul %535 %536 
                                       f32_4 %538 = OpLoad %136 
                                       f32_2 %539 = OpVectorShuffle %538 %538 0 1 
                                       f32_2 %540 = OpFAdd %537 %539 
                                                      OpStore %98 %540 
                                       f32_4 %541 = OpLoad %26 
                                       f32_2 %542 = OpVectorShuffle %541 %541 0 3 
                                       f32_2 %546 = OpFMul %542 %545 
                                       f32_4 %547 = OpLoad %136 
                                       f32_2 %548 = OpVectorShuffle %547 %547 2 3 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %136 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 5 2 3 
                                                      OpStore %136 %551 
                                       f32_2 %552 = OpLoad %98 
                                       f32_2 %553 = OpExtInst %1 8 %552 
                                                      OpStore %399 %553 
                                       f32_2 %554 = OpLoad %98 
                                       f32_2 %555 = OpLoad %399 
                                       f32_2 %556 = OpFNegate %555 
                                       f32_2 %557 = OpFAdd %554 %556 
                                                      OpStore %98 %557 
                                       f32_2 %558 = OpLoad %98 
                                Uniform f32* %559 = OpAccessChain %13 %144 
                                         f32 %560 = OpLoad %559 
                                Uniform f32* %561 = OpAccessChain %13 %144 
                                         f32 %562 = OpLoad %561 
                                       f32_2 %563 = OpCompositeConstruct %560 %562 
                                         f32 %564 = OpCompositeExtract %563 0 
                                         f32 %565 = OpCompositeExtract %563 1 
                                       f32_2 %566 = OpCompositeConstruct %564 %565 
                                       f32_2 %567 = OpFMul %558 %566 
                                                      OpStore %98 %567 
                                       f32_2 %568 = OpLoad %98 
                                       f32_2 %569 = OpExtInst %1 8 %568 
                                                      OpStore %98 %569 
                                       f32_2 %570 = OpLoad %98 
                                         f32 %571 = OpDot %570 %167 
                                                      OpStore %253 %571 
                                         f32 %572 = OpLoad %253 
                                         f32 %573 = OpExtInst %1 13 %572 
                                                      OpStore %253 %573 
                                         f32 %574 = OpLoad %253 
                                         f32 %575 = OpFMul %574 %177 
                                                      OpStore %253 %575 
                                         f32 %576 = OpLoad %253 
                                         f32 %577 = OpExtInst %1 10 %576 
                                                      OpStore %253 %577 
                                         f32 %578 = OpLoad %253 
                                Uniform f32* %579 = OpAccessChain %13 %184 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                         f32 %583 = OpFAdd %581 %582 
                                                      OpStore %253 %583 
                                         f32 %584 = OpLoad %253 
                                         f32 %586 = OpFMul %584 %585 
                                                      OpStore %253 %586 
                                         f32 %587 = OpLoad %253 
                                         f32 %588 = OpExtInst %1 43 %587 %50 %58 
                                                      OpStore %253 %588 
                                         f32 %589 = OpLoad %253 
                                         f32 %590 = OpFMul %589 %208 
                                         f32 %591 = OpFAdd %590 %210 
                                Private f32* %592 = OpAccessChain %98 %105 
                                                      OpStore %592 %591 
                                         f32 %593 = OpLoad %253 
                                         f32 %594 = OpLoad %253 
                                         f32 %595 = OpFMul %593 %594 
                                                      OpStore %253 %595 
                                         f32 %596 = OpLoad %253 
                                Private f32* %597 = OpAccessChain %98 %105 
                                         f32 %598 = OpLoad %597 
                                         f32 %599 = OpFMul %596 %598 
                                                      OpStore %253 %599 
                                         f32 %600 = OpLoad %253 
                                       f32_3 %601 = OpCompositeConstruct %600 %600 %600 
                                       f32_4 %602 = OpLoad %72 
                                       f32_3 %603 = OpVectorShuffle %602 %602 0 1 2 
                                       f32_3 %604 = OpFMul %601 %603 
                                       f32_4 %605 = OpLoad %9 
                                       f32_3 %606 = OpVectorShuffle %605 %605 0 1 2 
                                       f32_3 %607 = OpFAdd %604 %606 
                                       f32_4 %608 = OpLoad %9 
                                       f32_4 %609 = OpVectorShuffle %608 %607 4 5 6 3 
                                                      OpStore %9 %609 
                                       f32_4 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
                                       f32_3 %612 = OpFNegate %611 
                                       f32_3 %613 = OpFAdd %612 %227 
                                       f32_4 %614 = OpLoad %72 
                                       f32_4 %615 = OpVectorShuffle %614 %613 4 5 6 3 
                                                      OpStore %72 %615 
                                       f32_4 %616 = OpLoad %136 
                                       f32_2 %617 = OpVectorShuffle %616 %616 0 1 
                                       f32_2 %618 = OpExtInst %1 8 %617 
                                                      OpStore %98 %618 
                                       f32_2 %619 = OpLoad %98 
                                       f32_2 %620 = OpFNegate %619 
                                       f32_4 %621 = OpLoad %136 
                                       f32_2 %622 = OpVectorShuffle %621 %621 0 1 
                                       f32_2 %623 = OpFAdd %620 %622 
                                                      OpStore %98 %623 
                                       f32_2 %624 = OpLoad %98 
                                Uniform f32* %625 = OpAccessChain %13 %144 
                                         f32 %626 = OpLoad %625 
                                Uniform f32* %627 = OpAccessChain %13 %144 
                                         f32 %628 = OpLoad %627 
                                       f32_2 %629 = OpCompositeConstruct %626 %628 
                                         f32 %630 = OpCompositeExtract %629 0 
                                         f32 %631 = OpCompositeExtract %629 1 
                                       f32_2 %632 = OpCompositeConstruct %630 %631 
                                       f32_2 %633 = OpFMul %624 %632 
                                                      OpStore %98 %633 
                                       f32_2 %634 = OpLoad %98 
                                       f32_2 %635 = OpExtInst %1 8 %634 
                                                      OpStore %98 %635 
                                       f32_2 %636 = OpLoad %98 
                                         f32 %637 = OpDot %636 %167 
                                                      OpStore %253 %637 
                                         f32 %638 = OpLoad %253 
                                         f32 %639 = OpExtInst %1 13 %638 
                                                      OpStore %253 %639 
                                         f32 %640 = OpLoad %253 
                                         f32 %641 = OpFMul %640 %177 
                                                      OpStore %253 %641 
                                         f32 %642 = OpLoad %253 
                                         f32 %643 = OpExtInst %1 10 %642 
                                                      OpStore %253 %643 
                                         f32 %644 = OpLoad %253 
                                Uniform f32* %645 = OpAccessChain %13 %184 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpFMul %644 %646 
                                         f32 %649 = OpFAdd %647 %648 
                                                      OpStore %253 %649 
                                         f32 %650 = OpLoad %253 
                                         f32 %652 = OpFMul %650 %651 
                                                      OpStore %253 %652 
                                         f32 %653 = OpLoad %253 
                                         f32 %654 = OpExtInst %1 43 %653 %50 %58 
                                                      OpStore %253 %654 
                                         f32 %655 = OpLoad %253 
                                         f32 %656 = OpFMul %655 %208 
                                         f32 %657 = OpFAdd %656 %210 
                                Private f32* %658 = OpAccessChain %98 %105 
                                                      OpStore %658 %657 
                                         f32 %659 = OpLoad %253 
                                         f32 %660 = OpLoad %253 
                                         f32 %661 = OpFMul %659 %660 
                                                      OpStore %253 %661 
                                         f32 %662 = OpLoad %253 
                                Private f32* %663 = OpAccessChain %98 %105 
                                         f32 %664 = OpLoad %663 
                                         f32 %665 = OpFMul %662 %664 
                                                      OpStore %253 %665 
                                         f32 %666 = OpLoad %253 
                                       f32_3 %667 = OpCompositeConstruct %666 %666 %666 
                                       f32_4 %668 = OpLoad %72 
                                       f32_3 %669 = OpVectorShuffle %668 %668 0 1 2 
                                       f32_3 %670 = OpFMul %667 %669 
                                       f32_4 %671 = OpLoad %9 
                                       f32_3 %672 = OpVectorShuffle %671 %671 0 1 2 
                                       f32_3 %673 = OpFAdd %670 %672 
                                       f32_4 %674 = OpLoad %9 
                                       f32_4 %675 = OpVectorShuffle %674 %673 4 5 6 3 
                                                      OpStore %9 %675 
                                       f32_4 %676 = OpLoad %9 
                                       f32_3 %677 = OpVectorShuffle %676 %676 0 1 2 
                                       f32_3 %678 = OpFNegate %677 
                                       f32_3 %679 = OpFAdd %678 %227 
                                       f32_4 %680 = OpLoad %72 
                                       f32_4 %681 = OpVectorShuffle %680 %679 4 5 6 3 
                                                      OpStore %72 %681 
                                Uniform f32* %682 = OpAccessChain %13 %15 
                                         f32 %683 = OpLoad %682 
                                       f32_4 %684 = OpCompositeConstruct %683 %683 %683 %683 
                                       f32_4 %687 = OpFMul %684 %686 
                                                      OpStore %136 %687 
                                       f32_4 %688 = OpLoad %26 
                                       f32_2 %689 = OpVectorShuffle %688 %688 0 3 
                                       f32_2 %692 = OpFMul %689 %691 
                                       f32_4 %693 = OpLoad %136 
                                       f32_2 %694 = OpVectorShuffle %693 %693 0 1 
                                       f32_2 %695 = OpFAdd %692 %694 
                                                      OpStore %98 %695 
                                       f32_4 %696 = OpLoad %26 
                                       f32_2 %697 = OpVectorShuffle %696 %696 0 3 
                                       f32_2 %700 = OpFMul %697 %699 
                                       f32_4 %701 = OpLoad %136 
                                       f32_2 %702 = OpVectorShuffle %701 %701 2 3 
                                       f32_2 %703 = OpFAdd %700 %702 
                                       f32_4 %704 = OpLoad %26 
                                       f32_4 %705 = OpVectorShuffle %704 %703 4 1 2 5 
                                                      OpStore %26 %705 
                                       f32_2 %706 = OpLoad %98 
                                       f32_2 %707 = OpExtInst %1 8 %706 
                                       f32_4 %708 = OpLoad %136 
                                       f32_4 %709 = OpVectorShuffle %708 %707 4 5 2 3 
                                                      OpStore %136 %709 
                                       f32_2 %710 = OpLoad %98 
                                       f32_4 %711 = OpLoad %136 
                                       f32_2 %712 = OpVectorShuffle %711 %711 0 1 
                                       f32_2 %713 = OpFNegate %712 
                                       f32_2 %714 = OpFAdd %710 %713 
                                                      OpStore %98 %714 
                                       f32_2 %715 = OpLoad %98 
                                Uniform f32* %716 = OpAccessChain %13 %144 
                                         f32 %717 = OpLoad %716 
                                Uniform f32* %718 = OpAccessChain %13 %144 
                                         f32 %719 = OpLoad %718 
                                       f32_2 %720 = OpCompositeConstruct %717 %719 
                                         f32 %721 = OpCompositeExtract %720 0 
                                         f32 %722 = OpCompositeExtract %720 1 
                                       f32_2 %723 = OpCompositeConstruct %721 %722 
                                       f32_2 %724 = OpFMul %715 %723 
                                                      OpStore %98 %724 
                                       f32_2 %725 = OpLoad %98 
                                       f32_2 %726 = OpExtInst %1 8 %725 
                                                      OpStore %98 %726 
                                       f32_2 %727 = OpLoad %98 
                                         f32 %728 = OpDot %727 %167 
                                                      OpStore %253 %728 
                                         f32 %729 = OpLoad %253 
                                         f32 %730 = OpExtInst %1 13 %729 
                                                      OpStore %253 %730 
                                         f32 %731 = OpLoad %253 
                                         f32 %732 = OpFMul %731 %177 
                                                      OpStore %253 %732 
                                         f32 %733 = OpLoad %253 
                                         f32 %734 = OpExtInst %1 10 %733 
                                                      OpStore %253 %734 
                                         f32 %735 = OpLoad %253 
                                Uniform f32* %736 = OpAccessChain %13 %184 
                                         f32 %737 = OpLoad %736 
                                         f32 %738 = OpFMul %735 %737 
                                         f32 %740 = OpFAdd %738 %739 
                                                      OpStore %253 %740 
                                         f32 %741 = OpLoad %253 
                                         f32 %743 = OpFMul %741 %742 
                                                      OpStore %253 %743 
                                         f32 %744 = OpLoad %253 
                                         f32 %745 = OpExtInst %1 43 %744 %50 %58 
                                                      OpStore %253 %745 
                                         f32 %746 = OpLoad %253 
                                         f32 %747 = OpFMul %746 %208 
                                         f32 %748 = OpFAdd %747 %210 
                                Private f32* %749 = OpAccessChain %98 %105 
                                                      OpStore %749 %748 
                                         f32 %750 = OpLoad %253 
                                         f32 %751 = OpLoad %253 
                                         f32 %752 = OpFMul %750 %751 
                                                      OpStore %253 %752 
                                         f32 %753 = OpLoad %253 
                                Private f32* %754 = OpAccessChain %98 %105 
                                         f32 %755 = OpLoad %754 
                                         f32 %756 = OpFMul %753 %755 
                                                      OpStore %253 %756 
                                         f32 %757 = OpLoad %253 
                                       f32_3 %758 = OpCompositeConstruct %757 %757 %757 
                                       f32_4 %759 = OpLoad %72 
                                       f32_3 %760 = OpVectorShuffle %759 %759 0 1 2 
                                       f32_3 %761 = OpFMul %758 %760 
                                       f32_4 %762 = OpLoad %9 
                                       f32_3 %763 = OpVectorShuffle %762 %762 0 1 2 
                                       f32_3 %764 = OpFAdd %761 %763 
                                       f32_4 %765 = OpLoad %9 
                                       f32_4 %766 = OpVectorShuffle %765 %764 4 5 6 3 
                                                      OpStore %9 %766 
                                       f32_4 %767 = OpLoad %9 
                                       f32_3 %768 = OpVectorShuffle %767 %767 0 1 2 
                                       f32_3 %769 = OpFNegate %768 
                                       f32_3 %770 = OpFAdd %769 %227 
                                       f32_4 %771 = OpLoad %72 
                                       f32_4 %772 = OpVectorShuffle %771 %770 4 5 6 3 
                                                      OpStore %72 %772 
                                       f32_4 %773 = OpLoad %26 
                                       f32_2 %774 = OpVectorShuffle %773 %773 0 3 
                                       f32_2 %775 = OpExtInst %1 8 %774 
                                                      OpStore %98 %775 
                                       f32_2 %776 = OpLoad %98 
                                       f32_2 %777 = OpFNegate %776 
                                       f32_4 %778 = OpLoad %26 
                                       f32_2 %779 = OpVectorShuffle %778 %778 0 3 
                                       f32_2 %780 = OpFAdd %777 %779 
                                       f32_4 %781 = OpLoad %26 
                                       f32_4 %782 = OpVectorShuffle %781 %780 4 5 2 3 
                                                      OpStore %26 %782 
                                       f32_4 %783 = OpLoad %26 
                                       f32_2 %784 = OpVectorShuffle %783 %783 0 1 
                                Uniform f32* %785 = OpAccessChain %13 %144 
                                         f32 %786 = OpLoad %785 
                                Uniform f32* %787 = OpAccessChain %13 %144 
                                         f32 %788 = OpLoad %787 
                                       f32_2 %789 = OpCompositeConstruct %786 %788 
                                         f32 %790 = OpCompositeExtract %789 0 
                                         f32 %791 = OpCompositeExtract %789 1 
                                       f32_2 %792 = OpCompositeConstruct %790 %791 
                                       f32_2 %793 = OpFMul %784 %792 
                                       f32_4 %794 = OpLoad %26 
                                       f32_4 %795 = OpVectorShuffle %794 %793 4 5 2 3 
                                                      OpStore %26 %795 
                                       f32_4 %796 = OpLoad %26 
                                       f32_2 %797 = OpVectorShuffle %796 %796 0 1 
                                       f32_2 %798 = OpExtInst %1 8 %797 
                                       f32_4 %799 = OpLoad %26 
                                       f32_4 %800 = OpVectorShuffle %799 %798 4 5 2 3 
                                                      OpStore %26 %800 
                                       f32_4 %801 = OpLoad %26 
                                       f32_2 %802 = OpVectorShuffle %801 %801 0 1 
                                         f32 %803 = OpDot %802 %167 
                                                      OpStore %253 %803 
                                         f32 %804 = OpLoad %253 
                                         f32 %805 = OpExtInst %1 13 %804 
                                                      OpStore %253 %805 
                                         f32 %806 = OpLoad %253 
                                         f32 %807 = OpFMul %806 %177 
                                                      OpStore %253 %807 
                                         f32 %808 = OpLoad %253 
                                         f32 %809 = OpExtInst %1 10 %808 
                                                      OpStore %253 %809 
                                         f32 %810 = OpLoad %253 
                                Uniform f32* %811 = OpAccessChain %13 %184 
                                         f32 %812 = OpLoad %811 
                                         f32 %813 = OpFMul %810 %812 
                                         f32 %815 = OpFAdd %813 %814 
                                                      OpStore %253 %815 
                                         f32 %816 = OpLoad %253 
                                         f32 %818 = OpFMul %816 %817 
                                                      OpStore %253 %818 
                                         f32 %819 = OpLoad %253 
                                         f32 %820 = OpExtInst %1 43 %819 %50 %58 
                                                      OpStore %253 %820 
                                         f32 %821 = OpLoad %253 
                                         f32 %822 = OpFMul %821 %208 
                                         f32 %823 = OpFAdd %822 %210 
                                Private f32* %824 = OpAccessChain %26 %105 
                                                      OpStore %824 %823 
                                         f32 %825 = OpLoad %253 
                                         f32 %826 = OpLoad %253 
                                         f32 %827 = OpFMul %825 %826 
                                                      OpStore %253 %827 
                                         f32 %828 = OpLoad %253 
                                Private f32* %829 = OpAccessChain %26 %105 
                                         f32 %830 = OpLoad %829 
                                         f32 %831 = OpFMul %828 %830 
                                                      OpStore %253 %831 
                                         f32 %832 = OpLoad %253 
                                       f32_3 %833 = OpCompositeConstruct %832 %832 %832 
                                       f32_4 %834 = OpLoad %72 
                                       f32_3 %835 = OpVectorShuffle %834 %834 0 1 2 
                                       f32_3 %836 = OpFMul %833 %835 
                                       f32_4 %837 = OpLoad %9 
                                       f32_3 %838 = OpVectorShuffle %837 %837 0 1 2 
                                       f32_3 %839 = OpFAdd %836 %838 
                                       f32_4 %840 = OpLoad %9 
                                       f32_4 %841 = OpVectorShuffle %840 %839 4 5 6 3 
                                                      OpStore %9 %841 
                                       f32_3 %842 = OpLoad %82 
                                       f32_3 %843 = OpFNegate %842 
                                       f32_4 %844 = OpLoad %9 
                                       f32_3 %845 = OpVectorShuffle %844 %844 0 1 2 
                                       f32_3 %846 = OpFAdd %843 %845 
                                       f32_4 %847 = OpLoad %9 
                                       f32_4 %848 = OpVectorShuffle %847 %846 4 5 6 3 
                                                      OpStore %9 %848 
                                Uniform f32* %852 = OpAccessChain %13 %851 
                                         f32 %853 = OpLoad %852 
                                       f32_3 %854 = OpCompositeConstruct %853 %853 %853 
                                       f32_4 %855 = OpLoad %9 
                                       f32_3 %856 = OpVectorShuffle %855 %855 0 1 2 
                                       f32_3 %857 = OpFMul %854 %856 
                                       f32_3 %858 = OpLoad %82 
                                       f32_3 %859 = OpFAdd %857 %858 
                                       f32_4 %860 = OpLoad %850 
                                       f32_4 %861 = OpVectorShuffle %860 %859 4 5 6 3 
                                                      OpStore %850 %861 
                                 Output f32* %863 = OpAccessChain %850 %70 
                                                      OpStore %863 %58 
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