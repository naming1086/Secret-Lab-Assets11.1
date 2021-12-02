//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Paper2" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 21293
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
uniform 	vec4 _PColor;
uniform 	vec4 _PColor2;
uniform 	float _TimeX;
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat8;
vec2 u_xlat14;
float u_xlat15;
vec2 u_xlat17;
void main()
{
    u_xlat0.x = _TimeX * _Value4;
    u_xlat0.x = u_xlat0.x * 10.0;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * 0.0199999996;
    u_xlat0.x = u_xlat0.x * 0.0199999996;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat14.xy);
    u_xlat15 = u_xlat1.z * 0.0199999996;
    u_xlat2.x = u_xlat0.y * 0.0833333358 + u_xlat15;
    u_xlat2.y = u_xlat0.x * 0.0833333358 + u_xlat15;
    u_xlat3.y = _Value1;
    u_xlat3.x = float(0.0);
    u_xlat17.x = float(0.0);
    u_xlat4 = u_xlat14.xyxy + u_xlat3.yxxy;
    u_xlat4 = u_xlat2.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat4;
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6 = texture(_MainTex, u_xlat14.xy);
    u_xlat5.xyz = (-u_xlat5.xyz) + u_xlat6.xyz;
    u_xlat5.xyz = -abs(u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat5.y * u_xlat5.x;
    u_xlat0.x = u_xlat5.z * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = _Value2 * 25.0;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat17.y = (-_Value1);
    u_xlat3 = u_xlat14.xyxy + u_xlat17.yxxy;
    u_xlat14.xy = u_xlat14.xy + u_xlat2.xy;
    u_xlat2 = u_xlat2.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat3;
    u_xlat3 = texture(_MainTex2, u_xlat14.xy);
    u_xlat5 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2.xyz = u_xlat6.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = -abs(u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyw = u_xlat6.xyz + (-u_xlat5.xyz);
    u_xlat3.xyw = -abs(u_xlat3.xyw) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat14.x = u_xlat3.y * u_xlat3.x;
    u_xlat14.x = u_xlat3.w * u_xlat14.x;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * u_xlat7;
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat3.xyw = (-u_xlat4.xyz) + u_xlat6.xyz;
    u_xlat3.xyw = -abs(u_xlat3.xyw) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat14.x = u_xlat3.y * u_xlat3.x;
    u_xlat14.x = u_xlat3.w * u_xlat14.x;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * u_xlat7;
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.x = u_xlat2.y * u_xlat2.x;
    u_xlat14.x = u_xlat2.z * u_xlat14.x;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = dot(vec4(u_xlat7), vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat3.z * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat7 = (-_Value5) + 1.0;
    u_xlat14.x = (-u_xlat1.y) + 1.0;
    u_xlat7 = u_xlat7 * (-u_xlat14.x) + u_xlat14.x;
    u_xlat0.x = u_xlat7 * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat8.xyz = (-u_xlat1.xxx) + _PColor2.xyz;
    u_xlat1.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat8.xyz + u_xlat1.xxx;
    u_xlat2.xyz = (-u_xlat1.xyz) + _PColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat0.xyz = (-u_xlat14.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyw;
    u_xlat0.xyz = (-u_xlat6.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat6.xyz;
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
; Bound: 546
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %65 %522 
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
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpMemberDecorate %11 11 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 65 
                                                      OpDecorate %102 DescriptorSet 102 
                                                      OpDecorate %102 Binding 102 
                                                      OpDecorate %106 DescriptorSet 106 
                                                      OpDecorate %106 Binding 106 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %158 DescriptorSet 158 
                                                      OpDecorate %158 Binding 158 
                                                      OpDecorate %522 Location 522 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeStruct %7 %7 %6 %6 %6 %6 %6 %6 %6 %6 %10 %7 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Uniform %6 
                                          i32 %19 = OpConstant 6 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          f32 %29 = OpConstant 3.674022E-40 
                               Private f32_4* %32 = OpVariable Private 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          u32 %45 = OpConstant 1 
                                              %56 = OpTypeBool 
                                              %57 = OpTypePointer Private %56 
                                Private bool* %58 = OpVariable Private 
                                          i32 %59 = OpConstant 10 
                                          f32 %62 = OpConstant 3.674022E-40 
                                              %64 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %67 = OpConstant 11 
                                              %68 = OpTypePointer Uniform %7 
                                 Private f32* %79 = OpVariable Private 
                                          f32 %83 = OpConstant 3.674022E-40 
                                              %86 = OpTypePointer Function %6 
                                          u32 %95 = OpConstant 2 
                                              %97 = OpTypeVector %6 3 
                                              %98 = OpTypePointer Private %97 
                               Private f32_3* %99 = OpVariable Private 
                                             %100 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %101 = OpTypePointer UniformConstant %100 
        UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
                                             %104 = OpTypeSampler 
                                             %105 = OpTypePointer UniformConstant %104 
                    UniformConstant sampler* %106 = OpVariable UniformConstant 
                                             %108 = OpTypeSampledImage %100 
                                             %114 = OpTypePointer Private %10 
                              Private f32_2* %115 = OpVariable Private 
                              Private f32_3* %120 = OpVariable Private 
                                         f32 %123 = OpConstant 3.674022E-40 
                                         i32 %136 = OpConstant 3 
                              Private f32_4* %142 = OpVariable Private 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_4 %151 = OpConstantComposite %150 %150 %150 %150 
                              Private f32_4* %155 = OpVariable Private 
        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
                    UniformConstant sampler* %158 = OpVariable UniformConstant 
                              Private f32_3* %176 = OpVariable Private 
                                       f32_3 %195 = OpConstantComposite %83 %83 %83 
                                       f32_3 %201 = OpConstantComposite %62 %62 %62 
                                Private f32* %221 = OpVariable Private 
                                         i32 %222 = OpConstant 4 
                                         f32 %225 = OpConstant 3.674022E-40 
                                       f32_4 %238 = OpConstantComposite %83 %83 %83 %83 
                                         i32 %412 = OpConstant 5 
                                         f32 %419 = OpConstant 3.674022E-40 
                                         i32 %426 = OpConstant 7 
                                         i32 %459 = OpConstant 1 
                                         i32 %466 = OpConstant 8 
                                         i32 %489 = OpConstant 0 
                                         f32 %506 = OpConstant 3.674022E-40 
                                       f32_3 %507 = OpConstantComposite %506 %506 %506 
                                             %521 = OpTypePointer Output %7 
                               Output f32_4* %522 = OpVariable Output 
                                         i32 %523 = OpConstant 9 
                                         u32 %542 = OpConstant 3 
                                             %543 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %87 = OpVariable Function 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                 Uniform f32* %20 = OpAccessChain %13 %19 
                                          f32 %21 = OpLoad %20 
                                          f32 %22 = OpFMul %18 %21 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %22 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                          f32 %30 = OpFMul %28 %29 
                                 Private f32* %31 = OpAccessChain %9 %24 
                                                      OpStore %31 %30 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpExtInst %1 14 %34 
                                 Private f32* %36 = OpAccessChain %32 %24 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %24 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpExtInst %1 13 %38 
                                 Private f32* %40 = OpAccessChain %9 %24 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %32 %24 
                                          f32 %42 = OpLoad %41 
                                          f32 %44 = OpFMul %42 %43 
                                 Private f32* %46 = OpAccessChain %9 %45 
                                                      OpStore %46 %44 
                                 Private f32* %47 = OpAccessChain %9 %24 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFMul %48 %43 
                                 Private f32* %50 = OpAccessChain %9 %24 
                                                      OpStore %50 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                                        f32_2 %53 = OpExtInst %1 8 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                 Uniform f32* %60 = OpAccessChain %13 %59 %45 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %58 %63 
                                        f32_2 %66 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %69 = OpAccessChain %13 %67 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                        f32_2 %72 = OpFMul %66 %71 
                               Uniform f32_4* %73 = OpAccessChain %13 %67 
                                        f32_4 %74 = OpLoad %73 
                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                        f32_2 %76 = OpFAdd %72 %75 
                                        f32_4 %77 = OpLoad %32 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 2 3 
                                                      OpStore %32 %78 
                                 Private f32* %80 = OpAccessChain %32 %45 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFNegate %81 
                                          f32 %84 = OpFAdd %82 %83 
                                                      OpStore %79 %84 
                                         bool %85 = OpLoad %58 
                                                      OpSelectionMerge %89 None 
                                                      OpBranchConditional %85 %88 %91 
                                              %88 = OpLabel 
                                          f32 %90 = OpLoad %79 
                                                      OpStore %87 %90 
                                                      OpBranch %89 
                                              %91 = OpLabel 
                                 Private f32* %92 = OpAccessChain %32 %45 
                                          f32 %93 = OpLoad %92 
                                                      OpStore %87 %93 
                                                      OpBranch %89 
                                              %89 = OpLabel 
                                          f32 %94 = OpLoad %87 
                                 Private f32* %96 = OpAccessChain %32 %95 
                                                      OpStore %96 %94 
                         read_only Texture2D %103 = OpLoad %102 
                                     sampler %107 = OpLoad %106 
                  read_only Texture2DSampled %109 = OpSampledImage %103 %107 
                                       f32_4 %110 = OpLoad %32 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 2 
                                       f32_4 %112 = OpImageSampleImplicitLod %109 %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                                      OpStore %99 %113 
                                Private f32* %116 = OpAccessChain %99 %95 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFMul %117 %43 
                                Private f32* %119 = OpAccessChain %115 %24 
                                                      OpStore %119 %118 
                                Private f32* %121 = OpAccessChain %9 %45 
                                         f32 %122 = OpLoad %121 
                                         f32 %124 = OpFMul %122 %123 
                                Private f32* %125 = OpAccessChain %115 %24 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %120 %24 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %9 %24 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %130 %123 
                                Private f32* %132 = OpAccessChain %115 %24 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFAdd %131 %133 
                                Private f32* %135 = OpAccessChain %120 %45 
                                                      OpStore %135 %134 
                                Uniform f32* %137 = OpAccessChain %13 %136 
                                         f32 %138 = OpLoad %137 
                                Private f32* %139 = OpAccessChain %9 %45 
                                                      OpStore %139 %138 
                                Private f32* %140 = OpAccessChain %9 %24 
                                                      OpStore %140 %62 
                                Private f32* %141 = OpAccessChain %115 %24 
                                                      OpStore %141 %62 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 0 0 1 
                                       f32_4 %145 = OpLoad %32 
                                       f32_4 %146 = OpVectorShuffle %145 %145 0 1 0 1 
                                       f32_4 %147 = OpFAdd %144 %146 
                                                      OpStore %142 %147 
                                       f32_3 %148 = OpLoad %120 
                                       f32_4 %149 = OpVectorShuffle %148 %148 0 1 0 1 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %142 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %142 %154 
                         read_only Texture2D %157 = OpLoad %156 
                                     sampler %159 = OpLoad %158 
                  read_only Texture2DSampled %160 = OpSampledImage %157 %159 
                                       f32_4 %161 = OpLoad %142 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_4 %163 = OpImageSampleImplicitLod %160 %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_4 %165 = OpLoad %155 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %155 %166 
                         read_only Texture2D %167 = OpLoad %156 
                                     sampler %168 = OpLoad %158 
                  read_only Texture2DSampled %169 = OpSampledImage %167 %168 
                                       f32_4 %170 = OpLoad %142 
                                       f32_2 %171 = OpVectorShuffle %170 %170 2 3 
                                       f32_4 %172 = OpImageSampleImplicitLod %169 %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_4 %174 = OpLoad %142 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %142 %175 
                         read_only Texture2D %177 = OpLoad %156 
                                     sampler %178 = OpLoad %158 
                  read_only Texture2DSampled %179 = OpSampledImage %177 %178 
                                       f32_4 %180 = OpLoad %32 
                                       f32_2 %181 = OpVectorShuffle %180 %180 0 1 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                                      OpStore %176 %183 
                                       f32_4 %184 = OpLoad %155 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpLoad %176 
                                       f32_3 %188 = OpFAdd %186 %187 
                                       f32_4 %189 = OpLoad %155 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 6 3 
                                                      OpStore %155 %190 
                                       f32_4 %191 = OpLoad %155 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                       f32_3 %193 = OpExtInst %1 4 %192 
                                       f32_3 %194 = OpFNegate %193 
                                       f32_3 %196 = OpFAdd %194 %195 
                                       f32_4 %197 = OpLoad %155 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %155 %198 
                                       f32_4 %199 = OpLoad %155 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_3 %202 = OpExtInst %1 40 %200 %201 
                                       f32_4 %203 = OpLoad %155 
                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                                      OpStore %155 %204 
                                Private f32* %205 = OpAccessChain %155 %45 
                                         f32 %206 = OpLoad %205 
                                Private f32* %207 = OpAccessChain %155 %24 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFMul %206 %208 
                                Private f32* %210 = OpAccessChain %9 %24 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %155 %95 
                                         f32 %212 = OpLoad %211 
                                Private f32* %213 = OpAccessChain %9 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFMul %212 %214 
                                Private f32* %216 = OpAccessChain %9 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %9 %24 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpExtInst %1 30 %218 
                                Private f32* %220 = OpAccessChain %9 %24 
                                                      OpStore %220 %219 
                                Uniform f32* %223 = OpAccessChain %13 %222 
                                         f32 %224 = OpLoad %223 
                                         f32 %226 = OpFMul %224 %225 
                                                      OpStore %221 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpLoad %221 
                                         f32 %230 = OpFMul %228 %229 
                                Private f32* %231 = OpAccessChain %9 %24 
                                                      OpStore %231 %230 
                                Private f32* %232 = OpAccessChain %9 %24 
                                         f32 %233 = OpLoad %232 
                                         f32 %234 = OpExtInst %1 29 %233 
                                Private f32* %235 = OpAccessChain %9 %24 
                                                      OpStore %235 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %236 0 0 0 0 
                                         f32 %239 = OpDot %237 %238 
                                Private f32* %240 = OpAccessChain %9 %24 
                                                      OpStore %240 %239 
                                Uniform f32* %241 = OpAccessChain %13 %136 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpFNegate %242 
                                Private f32* %244 = OpAccessChain %115 %45 
                                                      OpStore %244 %243 
                                       f32_2 %245 = OpLoad %115 
                                       f32_4 %246 = OpVectorShuffle %245 %245 1 0 0 1 
                                       f32_4 %247 = OpLoad %32 
                                       f32_4 %248 = OpVectorShuffle %247 %247 0 1 0 1 
                                       f32_4 %249 = OpFAdd %246 %248 
                                                      OpStore %155 %249 
                                       f32_4 %250 = OpLoad %32 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                                       f32_3 %252 = OpLoad %120 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpFAdd %251 %253 
                                                      OpStore %115 %254 
                                       f32_3 %255 = OpLoad %120 
                                       f32_4 %256 = OpVectorShuffle %255 %255 0 1 0 1 
                                       f32_4 %257 = OpFMul %256 %151 
                                       f32_4 %258 = OpLoad %155 
                                       f32_4 %259 = OpFAdd %257 %258 
                                                      OpStore %32 %259 
                         read_only Texture2D %260 = OpLoad %102 
                                     sampler %261 = OpLoad %106 
                  read_only Texture2DSampled %262 = OpSampledImage %260 %261 
                                       f32_2 %263 = OpLoad %115 
                                       f32_4 %264 = OpImageSampleImplicitLod %262 %263 
                                         f32 %265 = OpCompositeExtract %264 2 
                                Private f32* %266 = OpAccessChain %115 %24 
                                                      OpStore %266 %265 
                         read_only Texture2D %267 = OpLoad %156 
                                     sampler %268 = OpLoad %158 
                  read_only Texture2DSampled %269 = OpSampledImage %267 %268 
                                       f32_4 %270 = OpLoad %32 
                                       f32_2 %271 = OpVectorShuffle %270 %270 0 1 
                                       f32_4 %272 = OpImageSampleImplicitLod %269 %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                                      OpStore %120 %273 
                         read_only Texture2D %274 = OpLoad %156 
                                     sampler %275 = OpLoad %158 
                  read_only Texture2DSampled %276 = OpSampledImage %274 %275 
                                       f32_4 %277 = OpLoad %32 
                                       f32_2 %278 = OpVectorShuffle %277 %277 2 3 
                                       f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_4 %281 = OpLoad %32 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %32 %282 
                                       f32_3 %283 = OpLoad %176 
                                       f32_4 %284 = OpLoad %32 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpFNegate %285 
                                       f32_3 %287 = OpFAdd %283 %286 
                                       f32_4 %288 = OpLoad %32 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %32 %289 
                                       f32_4 %290 = OpLoad %32 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                       f32_3 %292 = OpExtInst %1 4 %291 
                                       f32_3 %293 = OpFNegate %292 
                                       f32_3 %294 = OpFAdd %293 %195 
                                       f32_4 %295 = OpLoad %32 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %32 %296 
                                       f32_4 %297 = OpLoad %32 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpExtInst %1 40 %298 %201 
                                       f32_4 %300 = OpLoad %32 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %32 %301 
                                       f32_3 %302 = OpLoad %176 
                                       f32_3 %303 = OpLoad %120 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %302 %304 
                                                      OpStore %120 %305 
                                       f32_3 %306 = OpLoad %120 
                                       f32_3 %307 = OpExtInst %1 4 %306 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpFAdd %308 %195 
                                                      OpStore %120 %309 
                                       f32_3 %310 = OpLoad %120 
                                       f32_3 %311 = OpExtInst %1 40 %310 %201 
                                                      OpStore %120 %311 
                                Private f32* %312 = OpAccessChain %120 %45 
                                         f32 %313 = OpLoad %312 
                                Private f32* %314 = OpAccessChain %120 %24 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFMul %313 %315 
                                                      OpStore %79 %316 
                                Private f32* %317 = OpAccessChain %120 %95 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpLoad %79 
                                         f32 %320 = OpFMul %318 %319 
                                                      OpStore %79 %320 
                                         f32 %321 = OpLoad %79 
                                         f32 %322 = OpExtInst %1 30 %321 
                                                      OpStore %79 %322 
                                         f32 %323 = OpLoad %79 
                                         f32 %324 = OpLoad %221 
                                         f32 %325 = OpFMul %323 %324 
                                                      OpStore %79 %325 
                                         f32 %326 = OpLoad %79 
                                         f32 %327 = OpExtInst %1 29 %326 
                                                      OpStore %79 %327 
                                         f32 %328 = OpLoad %79 
                                       f32_4 %329 = OpCompositeConstruct %328 %328 %328 %328 
                                         f32 %330 = OpDot %329 %238 
                                                      OpStore %79 %330 
                                         f32 %331 = OpLoad %79 
                                Private f32* %332 = OpAccessChain %9 %24 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFMul %331 %333 
                                Private f32* %335 = OpAccessChain %9 %24 
                                                      OpStore %335 %334 
                                       f32_4 %336 = OpLoad %142 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFNegate %337 
                                       f32_3 %339 = OpLoad %176 
                                       f32_3 %340 = OpFAdd %338 %339 
                                                      OpStore %120 %340 
                                       f32_3 %341 = OpLoad %120 
                                       f32_3 %342 = OpExtInst %1 4 %341 
                                       f32_3 %343 = OpFNegate %342 
                                       f32_3 %344 = OpFAdd %343 %195 
                                                      OpStore %120 %344 
                                       f32_3 %345 = OpLoad %120 
                                       f32_3 %346 = OpExtInst %1 40 %345 %201 
                                                      OpStore %120 %346 
                                Private f32* %347 = OpAccessChain %120 %45 
                                         f32 %348 = OpLoad %347 
                                Private f32* %349 = OpAccessChain %120 %24 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %348 %350 
                                                      OpStore %79 %351 
                                Private f32* %352 = OpAccessChain %120 %95 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpLoad %79 
                                         f32 %355 = OpFMul %353 %354 
                                                      OpStore %79 %355 
                                         f32 %356 = OpLoad %79 
                                         f32 %357 = OpExtInst %1 30 %356 
                                                      OpStore %79 %357 
                                         f32 %358 = OpLoad %79 
                                         f32 %359 = OpLoad %221 
                                         f32 %360 = OpFMul %358 %359 
                                                      OpStore %79 %360 
                                         f32 %361 = OpLoad %79 
                                         f32 %362 = OpExtInst %1 29 %361 
                                                      OpStore %79 %362 
                                         f32 %363 = OpLoad %79 
                                       f32_4 %364 = OpCompositeConstruct %363 %363 %363 %363 
                                         f32 %365 = OpDot %364 %238 
                                                      OpStore %79 %365 
                                         f32 %366 = OpLoad %79 
                                Private f32* %367 = OpAccessChain %9 %24 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFMul %366 %368 
                                Private f32* %370 = OpAccessChain %9 %24 
                                                      OpStore %370 %369 
                                Private f32* %371 = OpAccessChain %32 %45 
                                         f32 %372 = OpLoad %371 
                                Private f32* %373 = OpAccessChain %32 %24 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpFMul %372 %374 
                                                      OpStore %79 %375 
                                Private f32* %376 = OpAccessChain %32 %95 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpLoad %79 
                                         f32 %379 = OpFMul %377 %378 
                                                      OpStore %79 %379 
                                         f32 %380 = OpLoad %79 
                                         f32 %381 = OpExtInst %1 30 %380 
                                                      OpStore %79 %381 
                                         f32 %382 = OpLoad %79 
                                         f32 %383 = OpLoad %221 
                                         f32 %384 = OpFMul %382 %383 
                                                      OpStore %221 %384 
                                         f32 %385 = OpLoad %221 
                                         f32 %386 = OpExtInst %1 29 %385 
                                                      OpStore %221 %386 
                                         f32 %387 = OpLoad %221 
                                       f32_4 %388 = OpCompositeConstruct %387 %387 %387 %387 
                                         f32 %389 = OpDot %388 %238 
                                                      OpStore %221 %389 
                                         f32 %390 = OpLoad %221 
                                Private f32* %391 = OpAccessChain %9 %24 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpFMul %390 %392 
                                Private f32* %394 = OpAccessChain %9 %24 
                                                      OpStore %394 %393 
                                Private f32* %395 = OpAccessChain %9 %24 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpExtInst %1 37 %396 %83 
                                Private f32* %398 = OpAccessChain %9 %24 
                                                      OpStore %398 %397 
                                Private f32* %399 = OpAccessChain %9 %24 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpFNegate %400 
                                         f32 %402 = OpFAdd %401 %83 
                                Private f32* %403 = OpAccessChain %9 %24 
                                                      OpStore %403 %402 
                                Private f32* %404 = OpAccessChain %115 %24 
                                         f32 %405 = OpLoad %404 
                                Private f32* %406 = OpAccessChain %9 %24 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpFMul %405 %407 
                                Private f32* %409 = OpAccessChain %9 %24 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %9 %24 
                                         f32 %411 = OpLoad %410 
                                Uniform f32* %413 = OpAccessChain %13 %412 
                                         f32 %414 = OpLoad %413 
                                         f32 %415 = OpFMul %411 %414 
                                Private f32* %416 = OpAccessChain %9 %24 
                                                      OpStore %416 %415 
                                Private f32* %417 = OpAccessChain %9 %24 
                                         f32 %418 = OpLoad %417 
                                         f32 %420 = OpFMul %418 %419 
                                Private f32* %421 = OpAccessChain %9 %24 
                                                      OpStore %421 %420 
                                Private f32* %422 = OpAccessChain %99 %45 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFNegate %423 
                                         f32 %425 = OpFAdd %424 %83 
                                                      OpStore %221 %425 
                                Uniform f32* %427 = OpAccessChain %13 %426 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpFNegate %428 
                                         f32 %430 = OpFAdd %429 %83 
                                Private f32* %431 = OpAccessChain %115 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %115 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpLoad %221 
                                         f32 %435 = OpFNegate %434 
                                         f32 %436 = OpFMul %433 %435 
                                         f32 %437 = OpLoad %221 
                                         f32 %438 = OpFAdd %436 %437 
                                Private f32* %439 = OpAccessChain %115 %24 
                                                      OpStore %439 %438 
                                Private f32* %440 = OpAccessChain %115 %24 
                                         f32 %441 = OpLoad %440 
                                Private f32* %442 = OpAccessChain %9 %24 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFNegate %443 
                                         f32 %445 = OpFMul %441 %444 
                                Private f32* %446 = OpAccessChain %9 %24 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpFAdd %445 %447 
                                Private f32* %449 = OpAccessChain %9 %24 
                                                      OpStore %449 %448 
                                Private f32* %450 = OpAccessChain %9 %24 
                                         f32 %451 = OpLoad %450 
                                Uniform f32* %452 = OpAccessChain %13 %412 
                                         f32 %453 = OpLoad %452 
                                         f32 %454 = OpFMul %451 %453 
                                Private f32* %455 = OpAccessChain %9 %24 
                                                      OpStore %455 %454 
                                       f32_3 %456 = OpLoad %99 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 0 0 
                                       f32_3 %458 = OpFNegate %457 
                              Uniform f32_4* %460 = OpAccessChain %13 %459 
                                       f32_4 %461 = OpLoad %460 
                                       f32_3 %462 = OpVectorShuffle %461 %461 0 1 2 
                                       f32_3 %463 = OpFAdd %458 %462 
                                       f32_4 %464 = OpLoad %32 
                                       f32_4 %465 = OpVectorShuffle %464 %463 4 5 6 3 
                                                      OpStore %32 %465 
                                Uniform f32* %467 = OpAccessChain %13 %466 
                                         f32 %468 = OpLoad %467 
                                Uniform f32* %469 = OpAccessChain %13 %466 
                                         f32 %470 = OpLoad %469 
                                Uniform f32* %471 = OpAccessChain %13 %466 
                                         f32 %472 = OpLoad %471 
                                       f32_3 %473 = OpCompositeConstruct %468 %470 %472 
                                         f32 %474 = OpCompositeExtract %473 0 
                                         f32 %475 = OpCompositeExtract %473 1 
                                         f32 %476 = OpCompositeExtract %473 2 
                                       f32_3 %477 = OpCompositeConstruct %474 %475 %476 
                                       f32_4 %478 = OpLoad %32 
                                       f32_3 %479 = OpVectorShuffle %478 %478 0 1 2 
                                       f32_3 %480 = OpFMul %477 %479 
                                       f32_3 %481 = OpLoad %99 
                                       f32_3 %482 = OpVectorShuffle %481 %481 0 0 0 
                                       f32_3 %483 = OpFAdd %480 %482 
                                       f32_4 %484 = OpLoad %32 
                                       f32_4 %485 = OpVectorShuffle %484 %483 4 5 6 3 
                                                      OpStore %32 %485 
                                       f32_4 %486 = OpLoad %32 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpFNegate %487 
                              Uniform f32_4* %490 = OpAccessChain %13 %489 
                                       f32_4 %491 = OpLoad %490 
                                       f32_3 %492 = OpVectorShuffle %491 %491 0 1 2 
                                       f32_3 %493 = OpFAdd %488 %492 
                                                      OpStore %99 %493 
                                       f32_4 %494 = OpLoad %9 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 0 0 
                                       f32_3 %496 = OpLoad %99 
                                       f32_3 %497 = OpFMul %495 %496 
                                       f32_4 %498 = OpLoad %32 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
                                       f32_3 %500 = OpFAdd %497 %499 
                                       f32_4 %501 = OpLoad %9 
                                       f32_4 %502 = OpVectorShuffle %501 %500 4 1 5 6 
                                                      OpStore %9 %502 
                                         f32 %503 = OpLoad %221 
                                       f32_3 %504 = OpCompositeConstruct %503 %503 %503 
                                       f32_3 %505 = OpFNegate %504 
                                       f32_3 %508 = OpFMul %505 %507 
                                       f32_4 %509 = OpLoad %9 
                                       f32_3 %510 = OpVectorShuffle %509 %509 0 2 3 
                                       f32_3 %511 = OpFAdd %508 %510 
                                       f32_4 %512 = OpLoad %9 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                      OpStore %9 %513 
                                       f32_3 %514 = OpLoad %176 
                                       f32_3 %515 = OpFNegate %514 
                                       f32_4 %516 = OpLoad %9 
                                       f32_3 %517 = OpVectorShuffle %516 %516 0 1 2 
                                       f32_3 %518 = OpFAdd %515 %517 
                                       f32_4 %519 = OpLoad %9 
                                       f32_4 %520 = OpVectorShuffle %519 %518 4 5 6 3 
                                                      OpStore %9 %520 
                                Uniform f32* %524 = OpAccessChain %13 %523 
                                         f32 %525 = OpLoad %524 
                                Uniform f32* %526 = OpAccessChain %13 %523 
                                         f32 %527 = OpLoad %526 
                                Uniform f32* %528 = OpAccessChain %13 %523 
                                         f32 %529 = OpLoad %528 
                                       f32_3 %530 = OpCompositeConstruct %525 %527 %529 
                                         f32 %531 = OpCompositeExtract %530 0 
                                         f32 %532 = OpCompositeExtract %530 1 
                                         f32 %533 = OpCompositeExtract %530 2 
                                       f32_3 %534 = OpCompositeConstruct %531 %532 %533 
                                       f32_4 %535 = OpLoad %9 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %537 = OpFMul %534 %536 
                                       f32_3 %538 = OpLoad %176 
                                       f32_3 %539 = OpFAdd %537 %538 
                                       f32_4 %540 = OpLoad %522 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %522 %541 
                                 Output f32* %544 = OpAccessChain %522 %542 
                                                      OpStore %544 %83 
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