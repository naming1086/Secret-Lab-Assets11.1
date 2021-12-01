//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Paper3" {
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
  GpuProgramID 59063
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
vec4 u_xlat7;
float u_xlat8;
vec2 u_xlat16;
vec2 u_xlat20;
void main()
{
    u_xlat0.x = _TimeX * _Value4;
    u_xlat0.x = u_xlat0.x * 10.0;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * 0.0199999996;
    u_xlat0.x = u_xlat0.x * 0.0199999996;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat16.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat16.xy);
    u_xlat2 = u_xlat1.zxxx * vec4(0.0199999996, 0.833999991, 0.595200002, 0.375);
    u_xlat3.x = u_xlat0.y * 0.0833333358 + u_xlat2.x;
    u_xlat3.y = u_xlat0.x * 0.0833333358 + u_xlat2.x;
    u_xlat4.y = _Value1;
    u_xlat4.x = float(0.0);
    u_xlat20.x = float(0.0);
    u_xlat5 = u_xlat16.xyxy + u_xlat4.yxxy;
    u_xlat5 = u_xlat3.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat5;
    u_xlat6 = texture(_MainTex, u_xlat5.xy);
    u_xlat5 = texture(_MainTex, u_xlat5.zw);
    u_xlat7 = texture(_MainTex, u_xlat16.xy);
    u_xlat6.xyz = (-u_xlat6.xyz) + u_xlat7.xyz;
    u_xlat6.xyz = -abs(u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat6.y * u_xlat6.x;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat8 = _Value2 * 25.0;
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat20.y = (-_Value1);
    u_xlat4 = u_xlat16.xyxy + u_xlat20.yxxy;
    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
    u_xlat3 = u_xlat3.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat4;
    u_xlat4 = texture(_MainTex2, u_xlat16.xy);
    u_xlat6 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat3.xyz = u_xlat7.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = -abs(u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyw = u_xlat7.xyz + (-u_xlat6.xyz);
    u_xlat4.xyw = -abs(u_xlat4.xyw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = max(u_xlat4.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat16.x = u_xlat4.y * u_xlat4.x;
    u_xlat16.x = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * u_xlat8;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = dot(u_xlat16.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat16.x * u_xlat0.x;
    u_xlat4.xyw = (-u_xlat5.xyz) + u_xlat7.xyz;
    u_xlat4.xyw = -abs(u_xlat4.xyw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = max(u_xlat4.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat16.x = u_xlat4.y * u_xlat4.x;
    u_xlat16.x = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * u_xlat8;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = dot(u_xlat16.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat16.x * u_xlat0.x;
    u_xlat16.x = u_xlat3.y * u_xlat3.x;
    u_xlat16.x = u_xlat3.z * u_xlat16.x;
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat8 = u_xlat16.x * u_xlat8;
    u_xlat8 = exp2(u_xlat8);
    u_xlat8 = dot(vec4(u_xlat8), vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat4.z * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat8 = (-u_xlat1.y) + 1.0;
    u_xlat1.xyz = (-u_xlat1.xxx) * vec3(0.833999991, 0.595200002, 0.375) + _PColor2.xyz;
    u_xlat1.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat1.xyz + u_xlat2.yzw;
    u_xlat16.x = (-_Value5) + 1.0;
    u_xlat8 = u_xlat16.x * (-u_xlat8) + u_xlat8;
    u_xlat0.x = u_xlat8 * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat2.xyz = (-u_xlat1.xyz) + _PColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat0.xyz = (-vec3(u_xlat8)) * vec3(0.100000001, 0.100000001, 0.100000001) + u_xlat0.xzw;
    u_xlat0.xyz = (-u_xlat7.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat7.xyz;
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
; Bound: 550
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %65 %526 
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
                                                      OpDecorate %160 DescriptorSet 160 
                                                      OpDecorate %160 Binding 160 
                                                      OpDecorate %162 DescriptorSet 162 
                                                      OpDecorate %162 Binding 162 
                                                      OpDecorate %526 Location 526 
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
                              Private f32_4* %114 = OpVariable Private 
                                         f32 %117 = OpConstant 3.674022E-40 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                       f32_4 %120 = OpConstantComposite %43 %117 %118 %119 
                              Private f32_3* %122 = OpVariable Private 
                                         f32 %125 = OpConstant 3.674022E-40 
                                         i32 %138 = OpConstant 3 
                                             %143 = OpTypePointer Private %10 
                              Private f32_2* %144 = OpVariable Private 
                              Private f32_4* %146 = OpVariable Private 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                              Private f32_4* %159 = OpVariable Private 
        UniformConstant read_only Texture2D* %160 = OpVariable UniformConstant 
                    UniformConstant sampler* %162 = OpVariable UniformConstant 
                              Private f32_3* %180 = OpVariable Private 
                                       f32_3 %199 = OpConstantComposite %83 %83 %83 
                                       f32_3 %205 = OpConstantComposite %62 %62 %62 
                                Private f32* %225 = OpVariable Private 
                                         i32 %226 = OpConstant 4 
                                         f32 %229 = OpConstant 3.674022E-40 
                                       f32_4 %242 = OpConstantComposite %83 %83 %83 %83 
                                         i32 %416 = OpConstant 5 
                                         f32 %423 = OpConstant 3.674022E-40 
                                       f32_3 %433 = OpConstantComposite %117 %118 %119 
                                         i32 %435 = OpConstant 1 
                                         i32 %442 = OpConstant 8 
                                         i32 %462 = OpConstant 7 
                                         i32 %493 = OpConstant 0 
                                         f32 %510 = OpConstant 3.674022E-40 
                                       f32_3 %511 = OpConstantComposite %510 %510 %510 
                                             %525 = OpTypePointer Output %7 
                               Output f32_4* %526 = OpVariable Output 
                                         i32 %527 = OpConstant 9 
                                         u32 %546 = OpConstant 3 
                                             %547 = OpTypePointer Output %6 
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
                                       f32_3 %115 = OpLoad %99 
                                       f32_4 %116 = OpVectorShuffle %115 %115 2 0 0 0 
                                       f32_4 %121 = OpFMul %116 %120 
                                                      OpStore %114 %121 
                                Private f32* %123 = OpAccessChain %9 %45 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                Private f32* %127 = OpAccessChain %114 %24 
                                         f32 %128 = OpLoad %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %130 = OpAccessChain %122 %24 
                                                      OpStore %130 %129 
                                Private f32* %131 = OpAccessChain %9 %24 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFMul %132 %125 
                                Private f32* %134 = OpAccessChain %114 %24 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFAdd %133 %135 
                                Private f32* %137 = OpAccessChain %122 %45 
                                                      OpStore %137 %136 
                                Uniform f32* %139 = OpAccessChain %13 %138 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %9 %45 
                                                      OpStore %141 %140 
                                Private f32* %142 = OpAccessChain %9 %24 
                                                      OpStore %142 %62 
                                Private f32* %145 = OpAccessChain %144 %24 
                                                      OpStore %145 %62 
                                       f32_4 %147 = OpLoad %9 
                                       f32_4 %148 = OpVectorShuffle %147 %147 1 0 0 1 
                                       f32_4 %149 = OpLoad %32 
                                       f32_4 %150 = OpVectorShuffle %149 %149 0 1 0 1 
                                       f32_4 %151 = OpFAdd %148 %150 
                                                      OpStore %146 %151 
                                       f32_3 %152 = OpLoad %122 
                                       f32_4 %153 = OpVectorShuffle %152 %152 0 1 0 1 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %146 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %146 %158 
                         read_only Texture2D %161 = OpLoad %160 
                                     sampler %163 = OpLoad %162 
                  read_only Texture2DSampled %164 = OpSampledImage %161 %163 
                                       f32_4 %165 = OpLoad %146 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_4 %167 = OpImageSampleImplicitLod %164 %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %159 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %159 %170 
                         read_only Texture2D %171 = OpLoad %160 
                                     sampler %172 = OpLoad %162 
                  read_only Texture2DSampled %173 = OpSampledImage %171 %172 
                                       f32_4 %174 = OpLoad %146 
                                       f32_2 %175 = OpVectorShuffle %174 %174 2 3 
                                       f32_4 %176 = OpImageSampleImplicitLod %173 %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_4 %178 = OpLoad %146 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %146 %179 
                         read_only Texture2D %181 = OpLoad %160 
                                     sampler %182 = OpLoad %162 
                  read_only Texture2DSampled %183 = OpSampledImage %181 %182 
                                       f32_4 %184 = OpLoad %32 
                                       f32_2 %185 = OpVectorShuffle %184 %184 0 1 
                                       f32_4 %186 = OpImageSampleImplicitLod %183 %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                                      OpStore %180 %187 
                                       f32_4 %188 = OpLoad %159 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpLoad %180 
                                       f32_3 %192 = OpFAdd %190 %191 
                                       f32_4 %193 = OpLoad %159 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
                                                      OpStore %159 %194 
                                       f32_4 %195 = OpLoad %159 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpExtInst %1 4 %196 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %200 = OpFAdd %198 %199 
                                       f32_4 %201 = OpLoad %159 
                                       f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
                                                      OpStore %159 %202 
                                       f32_4 %203 = OpLoad %159 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %206 = OpExtInst %1 40 %204 %205 
                                       f32_4 %207 = OpLoad %159 
                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                      OpStore %159 %208 
                                Private f32* %209 = OpAccessChain %159 %45 
                                         f32 %210 = OpLoad %209 
                                Private f32* %211 = OpAccessChain %159 %24 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                Private f32* %214 = OpAccessChain %9 %24 
                                                      OpStore %214 %213 
                                Private f32* %215 = OpAccessChain %159 %95 
                                         f32 %216 = OpLoad %215 
                                Private f32* %217 = OpAccessChain %9 %24 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                Private f32* %220 = OpAccessChain %9 %24 
                                                      OpStore %220 %219 
                                Private f32* %221 = OpAccessChain %9 %24 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpExtInst %1 30 %222 
                                Private f32* %224 = OpAccessChain %9 %24 
                                                      OpStore %224 %223 
                                Uniform f32* %227 = OpAccessChain %13 %226 
                                         f32 %228 = OpLoad %227 
                                         f32 %230 = OpFMul %228 %229 
                                                      OpStore %225 %230 
                                Private f32* %231 = OpAccessChain %9 %24 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpLoad %225 
                                         f32 %234 = OpFMul %232 %233 
                                Private f32* %235 = OpAccessChain %9 %24 
                                                      OpStore %235 %234 
                                Private f32* %236 = OpAccessChain %9 %24 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpExtInst %1 29 %237 
                                Private f32* %239 = OpAccessChain %9 %24 
                                                      OpStore %239 %238 
                                       f32_4 %240 = OpLoad %9 
                                       f32_4 %241 = OpVectorShuffle %240 %240 0 0 0 0 
                                         f32 %243 = OpDot %241 %242 
                                Private f32* %244 = OpAccessChain %9 %24 
                                                      OpStore %244 %243 
                                Uniform f32* %245 = OpAccessChain %13 %138 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                Private f32* %248 = OpAccessChain %144 %45 
                                                      OpStore %248 %247 
                                       f32_2 %249 = OpLoad %144 
                                       f32_4 %250 = OpVectorShuffle %249 %249 1 0 0 1 
                                       f32_4 %251 = OpLoad %32 
                                       f32_4 %252 = OpVectorShuffle %251 %251 0 1 0 1 
                                       f32_4 %253 = OpFAdd %250 %252 
                                                      OpStore %159 %253 
                                       f32_4 %254 = OpLoad %32 
                                       f32_2 %255 = OpVectorShuffle %254 %254 0 1 
                                       f32_3 %256 = OpLoad %122 
                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
                                       f32_2 %258 = OpFAdd %255 %257 
                                                      OpStore %144 %258 
                                       f32_3 %259 = OpLoad %122 
                                       f32_4 %260 = OpVectorShuffle %259 %259 0 1 0 1 
                                       f32_4 %261 = OpFMul %260 %155 
                                       f32_4 %262 = OpLoad %159 
                                       f32_4 %263 = OpFAdd %261 %262 
                                                      OpStore %32 %263 
                         read_only Texture2D %264 = OpLoad %102 
                                     sampler %265 = OpLoad %106 
                  read_only Texture2DSampled %266 = OpSampledImage %264 %265 
                                       f32_2 %267 = OpLoad %144 
                                       f32_4 %268 = OpImageSampleImplicitLod %266 %267 
                                         f32 %269 = OpCompositeExtract %268 2 
                                Private f32* %270 = OpAccessChain %144 %24 
                                                      OpStore %270 %269 
                         read_only Texture2D %271 = OpLoad %160 
                                     sampler %272 = OpLoad %162 
                  read_only Texture2DSampled %273 = OpSampledImage %271 %272 
                                       f32_4 %274 = OpLoad %32 
                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
                                       f32_4 %276 = OpImageSampleImplicitLod %273 %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                                      OpStore %122 %277 
                         read_only Texture2D %278 = OpLoad %160 
                                     sampler %279 = OpLoad %162 
                  read_only Texture2DSampled %280 = OpSampledImage %278 %279 
                                       f32_4 %281 = OpLoad %32 
                                       f32_2 %282 = OpVectorShuffle %281 %281 2 3 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                       f32_4 %285 = OpLoad %32 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %32 %286 
                                       f32_3 %287 = OpLoad %180 
                                       f32_4 %288 = OpLoad %32 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %290 = OpFNegate %289 
                                       f32_3 %291 = OpFAdd %287 %290 
                                       f32_4 %292 = OpLoad %32 
                                       f32_4 %293 = OpVectorShuffle %292 %291 4 5 6 3 
                                                      OpStore %32 %293 
                                       f32_4 %294 = OpLoad %32 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                       f32_3 %296 = OpExtInst %1 4 %295 
                                       f32_3 %297 = OpFNegate %296 
                                       f32_3 %298 = OpFAdd %297 %199 
                                       f32_4 %299 = OpLoad %32 
                                       f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
                                                      OpStore %32 %300 
                                       f32_4 %301 = OpLoad %32 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                                       f32_3 %303 = OpExtInst %1 40 %302 %205 
                                       f32_4 %304 = OpLoad %32 
                                       f32_4 %305 = OpVectorShuffle %304 %303 4 5 6 3 
                                                      OpStore %32 %305 
                                       f32_3 %306 = OpLoad %180 
                                       f32_3 %307 = OpLoad %122 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpFAdd %306 %308 
                                                      OpStore %122 %309 
                                       f32_3 %310 = OpLoad %122 
                                       f32_3 %311 = OpExtInst %1 4 %310 
                                       f32_3 %312 = OpFNegate %311 
                                       f32_3 %313 = OpFAdd %312 %199 
                                                      OpStore %122 %313 
                                       f32_3 %314 = OpLoad %122 
                                       f32_3 %315 = OpExtInst %1 40 %314 %205 
                                                      OpStore %122 %315 
                                Private f32* %316 = OpAccessChain %122 %45 
                                         f32 %317 = OpLoad %316 
                                Private f32* %318 = OpAccessChain %122 %24 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpFMul %317 %319 
                                                      OpStore %79 %320 
                                Private f32* %321 = OpAccessChain %122 %95 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpLoad %79 
                                         f32 %324 = OpFMul %322 %323 
                                                      OpStore %79 %324 
                                         f32 %325 = OpLoad %79 
                                         f32 %326 = OpExtInst %1 30 %325 
                                                      OpStore %79 %326 
                                         f32 %327 = OpLoad %79 
                                         f32 %328 = OpLoad %225 
                                         f32 %329 = OpFMul %327 %328 
                                                      OpStore %79 %329 
                                         f32 %330 = OpLoad %79 
                                         f32 %331 = OpExtInst %1 29 %330 
                                                      OpStore %79 %331 
                                         f32 %332 = OpLoad %79 
                                       f32_4 %333 = OpCompositeConstruct %332 %332 %332 %332 
                                         f32 %334 = OpDot %333 %242 
                                                      OpStore %79 %334 
                                         f32 %335 = OpLoad %79 
                                Private f32* %336 = OpAccessChain %9 %24 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpFMul %335 %337 
                                Private f32* %339 = OpAccessChain %9 %24 
                                                      OpStore %339 %338 
                                       f32_4 %340 = OpLoad %146 
                                       f32_3 %341 = OpVectorShuffle %340 %340 0 1 2 
                                       f32_3 %342 = OpFNegate %341 
                                       f32_3 %343 = OpLoad %180 
                                       f32_3 %344 = OpFAdd %342 %343 
                                                      OpStore %122 %344 
                                       f32_3 %345 = OpLoad %122 
                                       f32_3 %346 = OpExtInst %1 4 %345 
                                       f32_3 %347 = OpFNegate %346 
                                       f32_3 %348 = OpFAdd %347 %199 
                                                      OpStore %122 %348 
                                       f32_3 %349 = OpLoad %122 
                                       f32_3 %350 = OpExtInst %1 40 %349 %205 
                                                      OpStore %122 %350 
                                Private f32* %351 = OpAccessChain %122 %45 
                                         f32 %352 = OpLoad %351 
                                Private f32* %353 = OpAccessChain %122 %24 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFMul %352 %354 
                                                      OpStore %79 %355 
                                Private f32* %356 = OpAccessChain %122 %95 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpLoad %79 
                                         f32 %359 = OpFMul %357 %358 
                                                      OpStore %79 %359 
                                         f32 %360 = OpLoad %79 
                                         f32 %361 = OpExtInst %1 30 %360 
                                                      OpStore %79 %361 
                                         f32 %362 = OpLoad %79 
                                         f32 %363 = OpLoad %225 
                                         f32 %364 = OpFMul %362 %363 
                                                      OpStore %79 %364 
                                         f32 %365 = OpLoad %79 
                                         f32 %366 = OpExtInst %1 29 %365 
                                                      OpStore %79 %366 
                                         f32 %367 = OpLoad %79 
                                       f32_4 %368 = OpCompositeConstruct %367 %367 %367 %367 
                                         f32 %369 = OpDot %368 %242 
                                                      OpStore %79 %369 
                                         f32 %370 = OpLoad %79 
                                Private f32* %371 = OpAccessChain %9 %24 
                                         f32 %372 = OpLoad %371 
                                         f32 %373 = OpFMul %370 %372 
                                Private f32* %374 = OpAccessChain %9 %24 
                                                      OpStore %374 %373 
                                Private f32* %375 = OpAccessChain %32 %45 
                                         f32 %376 = OpLoad %375 
                                Private f32* %377 = OpAccessChain %32 %24 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpFMul %376 %378 
                                                      OpStore %79 %379 
                                Private f32* %380 = OpAccessChain %32 %95 
                                         f32 %381 = OpLoad %380 
                                         f32 %382 = OpLoad %79 
                                         f32 %383 = OpFMul %381 %382 
                                                      OpStore %79 %383 
                                         f32 %384 = OpLoad %79 
                                         f32 %385 = OpExtInst %1 30 %384 
                                                      OpStore %79 %385 
                                         f32 %386 = OpLoad %79 
                                         f32 %387 = OpLoad %225 
                                         f32 %388 = OpFMul %386 %387 
                                                      OpStore %225 %388 
                                         f32 %389 = OpLoad %225 
                                         f32 %390 = OpExtInst %1 29 %389 
                                                      OpStore %225 %390 
                                         f32 %391 = OpLoad %225 
                                       f32_4 %392 = OpCompositeConstruct %391 %391 %391 %391 
                                         f32 %393 = OpDot %392 %242 
                                                      OpStore %225 %393 
                                         f32 %394 = OpLoad %225 
                                Private f32* %395 = OpAccessChain %9 %24 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFMul %394 %396 
                                Private f32* %398 = OpAccessChain %9 %24 
                                                      OpStore %398 %397 
                                Private f32* %399 = OpAccessChain %9 %24 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpExtInst %1 37 %400 %83 
                                Private f32* %402 = OpAccessChain %9 %24 
                                                      OpStore %402 %401 
                                Private f32* %403 = OpAccessChain %9 %24 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFNegate %404 
                                         f32 %406 = OpFAdd %405 %83 
                                Private f32* %407 = OpAccessChain %9 %24 
                                                      OpStore %407 %406 
                                Private f32* %408 = OpAccessChain %144 %24 
                                         f32 %409 = OpLoad %408 
                                Private f32* %410 = OpAccessChain %9 %24 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpFMul %409 %411 
                                Private f32* %413 = OpAccessChain %9 %24 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %9 %24 
                                         f32 %415 = OpLoad %414 
                                Uniform f32* %417 = OpAccessChain %13 %416 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFMul %415 %418 
                                Private f32* %420 = OpAccessChain %9 %24 
                                                      OpStore %420 %419 
                                Private f32* %421 = OpAccessChain %9 %24 
                                         f32 %422 = OpLoad %421 
                                         f32 %424 = OpFMul %422 %423 
                                Private f32* %425 = OpAccessChain %9 %24 
                                                      OpStore %425 %424 
                                Private f32* %426 = OpAccessChain %99 %45 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFNegate %427 
                                         f32 %429 = OpFAdd %428 %83 
                                                      OpStore %225 %429 
                                       f32_3 %430 = OpLoad %99 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 0 0 
                                       f32_3 %432 = OpFNegate %431 
                                       f32_3 %434 = OpFMul %432 %433 
                              Uniform f32_4* %436 = OpAccessChain %13 %435 
                                       f32_4 %437 = OpLoad %436 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 1 2 
                                       f32_3 %439 = OpFAdd %434 %438 
                                       f32_4 %440 = OpLoad %32 
                                       f32_4 %441 = OpVectorShuffle %440 %439 4 5 6 3 
                                                      OpStore %32 %441 
                                Uniform f32* %443 = OpAccessChain %13 %442 
                                         f32 %444 = OpLoad %443 
                                Uniform f32* %445 = OpAccessChain %13 %442 
                                         f32 %446 = OpLoad %445 
                                Uniform f32* %447 = OpAccessChain %13 %442 
                                         f32 %448 = OpLoad %447 
                                       f32_3 %449 = OpCompositeConstruct %444 %446 %448 
                                         f32 %450 = OpCompositeExtract %449 0 
                                         f32 %451 = OpCompositeExtract %449 1 
                                         f32 %452 = OpCompositeExtract %449 2 
                                       f32_3 %453 = OpCompositeConstruct %450 %451 %452 
                                       f32_4 %454 = OpLoad %32 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_3 %456 = OpFMul %453 %455 
                                       f32_4 %457 = OpLoad %114 
                                       f32_3 %458 = OpVectorShuffle %457 %457 1 2 3 
                                       f32_3 %459 = OpFAdd %456 %458 
                                       f32_4 %460 = OpLoad %32 
                                       f32_4 %461 = OpVectorShuffle %460 %459 4 5 6 3 
                                                      OpStore %32 %461 
                                Uniform f32* %463 = OpAccessChain %13 %462 
                                         f32 %464 = OpLoad %463 
                                         f32 %465 = OpFNegate %464 
                                         f32 %466 = OpFAdd %465 %83 
                                Private f32* %467 = OpAccessChain %144 %24 
                                                      OpStore %467 %466 
                                Private f32* %468 = OpAccessChain %144 %24 
                                         f32 %469 = OpLoad %468 
                                         f32 %470 = OpLoad %225 
                                         f32 %471 = OpFNegate %470 
                                         f32 %472 = OpFMul %469 %471 
                                         f32 %473 = OpLoad %225 
                                         f32 %474 = OpFAdd %472 %473 
                                                      OpStore %225 %474 
                                         f32 %475 = OpLoad %225 
                                Private f32* %476 = OpAccessChain %9 %24 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFNegate %477 
                                         f32 %479 = OpFMul %475 %478 
                                Private f32* %480 = OpAccessChain %9 %24 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpFAdd %479 %481 
                                Private f32* %483 = OpAccessChain %9 %24 
                                                      OpStore %483 %482 
                                Private f32* %484 = OpAccessChain %9 %24 
                                         f32 %485 = OpLoad %484 
                                Uniform f32* %486 = OpAccessChain %13 %416 
                                         f32 %487 = OpLoad %486 
                                         f32 %488 = OpFMul %485 %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                                      OpStore %489 %488 
                                       f32_4 %490 = OpLoad %32 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 1 2 
                                       f32_3 %492 = OpFNegate %491 
                              Uniform f32_4* %494 = OpAccessChain %13 %493 
                                       f32_4 %495 = OpLoad %494 
                                       f32_3 %496 = OpVectorShuffle %495 %495 0 1 2 
                                       f32_3 %497 = OpFAdd %492 %496 
                                                      OpStore %99 %497 
                                       f32_4 %498 = OpLoad %9 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 0 0 
                                       f32_3 %500 = OpLoad %99 
                                       f32_3 %501 = OpFMul %499 %500 
                                       f32_4 %502 = OpLoad %32 
                                       f32_3 %503 = OpVectorShuffle %502 %502 0 1 2 
                                       f32_3 %504 = OpFAdd %501 %503 
                                       f32_4 %505 = OpLoad %9 
                                       f32_4 %506 = OpVectorShuffle %505 %504 4 1 5 6 
                                                      OpStore %9 %506 
                                         f32 %507 = OpLoad %225 
                                       f32_3 %508 = OpCompositeConstruct %507 %507 %507 
                                       f32_3 %509 = OpFNegate %508 
                                       f32_3 %512 = OpFMul %509 %511 
                                       f32_4 %513 = OpLoad %9 
                                       f32_3 %514 = OpVectorShuffle %513 %513 0 2 3 
                                       f32_3 %515 = OpFAdd %512 %514 
                                       f32_4 %516 = OpLoad %9 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %9 %517 
                                       f32_3 %518 = OpLoad %180 
                                       f32_3 %519 = OpFNegate %518 
                                       f32_4 %520 = OpLoad %9 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %522 = OpFAdd %519 %521 
                                       f32_4 %523 = OpLoad %9 
                                       f32_4 %524 = OpVectorShuffle %523 %522 4 5 6 3 
                                                      OpStore %9 %524 
                                Uniform f32* %528 = OpAccessChain %13 %527 
                                         f32 %529 = OpLoad %528 
                                Uniform f32* %530 = OpAccessChain %13 %527 
                                         f32 %531 = OpLoad %530 
                                Uniform f32* %532 = OpAccessChain %13 %527 
                                         f32 %533 = OpLoad %532 
                                       f32_3 %534 = OpCompositeConstruct %529 %531 %533 
                                         f32 %535 = OpCompositeExtract %534 0 
                                         f32 %536 = OpCompositeExtract %534 1 
                                         f32 %537 = OpCompositeExtract %534 2 
                                       f32_3 %538 = OpCompositeConstruct %535 %536 %537 
                                       f32_4 %539 = OpLoad %9 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFMul %538 %540 
                                       f32_3 %542 = OpLoad %180 
                                       f32_3 %543 = OpFAdd %541 %542 
                                       f32_4 %544 = OpLoad %526 
                                       f32_4 %545 = OpVectorShuffle %544 %543 4 5 6 3 
                                                      OpStore %526 %545 
                                 Output f32* %548 = OpAccessChain %526 %546 
                                                      OpStore %548 %83 
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