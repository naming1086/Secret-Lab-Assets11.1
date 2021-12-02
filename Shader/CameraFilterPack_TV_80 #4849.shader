//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_80" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2602
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
uniform 	float _Fade;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.y = 0.00100000005;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat8.yy * vec2(21.0, 29.0);
    u_xlat1.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat1.xy;
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat5 = _TimeX * 0.330000013 + 0.300000012;
    u_xlat5 = u_xlat8.y * 31.0 + u_xlat5;
    u_xlat5 = sin(u_xlat5);
    u_xlat1.x = u_xlat5 * u_xlat1.x;
    u_xlat5 = u_xlat1.x * 0.00170000002 + u_xlat8.x;
    u_xlat1.x = u_xlat1.x * 0.00170000002 + 0.0250000004;
    u_xlat2.x = u_xlat1.x * 0.75 + u_xlat8.x;
    u_xlat1.x = u_xlat5 + 0.00100000005;
    u_xlat0.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat0.xy + u_xlat8.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat3.xyz = u_xlat1.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat2.y = u_xlat8.y + 0.00100000005;
    u_xlat0.xy = u_xlat2.xy + vec2(0.00100000005, -0.0149999997);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.x = u_xlat8.x * u_xlat8.y;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat4.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.y * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.300000012;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(3.66000009, 2.94000006, 2.66000009);
    u_xlat13 = u_xlat8.y * _ScreenResolution.y;
    u_xlat2.x = _TimeX * 3.5;
    u_xlat13 = u_xlat13 * 1.5 + u_xlat2.x;
    u_xlat13 = sin(u_xlat13);
    u_xlat13 = u_xlat13 * 0.349999994 + 0.349999994;
    u_xlat13 = log2(u_xlat13);
    u_xlat13 = u_xlat13 * 1.70000005;
    u_xlat13 = exp2(u_xlat13);
    u_xlat13 = u_xlat13 * 0.699999988 + 0.400000006;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat2.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
    u_xlat12 = u_xlat8.y * 6.0 + u_xlat2.x;
    u_xlat13 = sin(u_xlat2.y);
    u_xlat13 = u_xlat13 * 0.00999999978 + 1.0;
    u_xlat12 = sin(u_xlat12);
    u_xlat12 = u_xlat12 + 1.95000005;
    u_xlat12 = floor(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.10000002);
    u_xlat12 = u_xlat12 * 0.25 + u_xlat13;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 357
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %19 %335 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 19 
                                                  OpMemberDecorate %22 0 Offset 22 
                                                  OpMemberDecorate %22 1 Offset 22 
                                                  OpMemberDecorate %22 2 Offset 22 
                                                  OpMemberDecorate %22 3 Offset 22 
                                                  OpDecorate %22 Block 
                                                  OpDecorate %24 DescriptorSet 24 
                                                  OpDecorate %24 Binding 24 
                                                  OpDecorate %140 DescriptorSet 140 
                                                  OpDecorate %140 Binding 140 
                                                  OpDecorate %144 DescriptorSet 144 
                                                  OpDecorate %144 Binding 144 
                                                  OpDecorate %335 Location 335 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 3 
                                           %8 = OpTypePointer Private %7 
                            Private f32_3* %9 = OpVariable Private 
                                      f32 %10 = OpConstant 3.674022E-40 
                                          %11 = OpTypeInt 32 0 
                                      u32 %12 = OpConstant 1 
                                          %13 = OpTypePointer Private %6 
                                          %15 = OpTypeVector %6 2 
                                          %16 = OpTypePointer Private %15 
                           Private f32_2* %17 = OpVariable Private 
                                          %18 = OpTypePointer Input %15 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          %21 = OpTypeVector %6 4 
                                          %22 = OpTypeStruct %6 %6 %21 %21 
                                          %23 = OpTypePointer Uniform %22 
Uniform struct {f32; f32; f32_4; f32_4;}* %24 = OpVariable Uniform 
                                          %25 = OpTypeInt 32 1 
                                      i32 %26 = OpConstant 3 
                                          %27 = OpTypePointer Uniform %21 
                           Private f32_3* %36 = OpVariable Private 
                                      f32 %39 = OpConstant 3.674022E-40 
                                      f32 %40 = OpConstant 3.674022E-40 
                                    f32_2 %41 = OpConstantComposite %39 %40 
                                      i32 %45 = OpConstant 0 
                                          %46 = OpTypePointer Uniform %6 
                                      f32 %50 = OpConstant 3.674022E-40 
                                      f32 %51 = OpConstant 3.674022E-40 
                                    f32_2 %52 = OpConstantComposite %50 %51 
                                      u32 %66 = OpConstant 0 
                             Private f32* %71 = OpVariable Private 
                                      f32 %74 = OpConstant 3.674022E-40 
                                      f32 %79 = OpConstant 3.674022E-40 
                                      f32 %92 = OpConstant 3.674022E-40 
                                     f32 %100 = OpConstant 3.674022E-40 
                          Private f32_3* %103 = OpVariable Private 
                                     f32 %106 = OpConstant 3.674022E-40 
                                     i32 %122 = OpConstant 1 
                                         %138 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                         %139 = OpTypePointer UniformConstant %138 
    UniformConstant read_only Texture2D* %140 = OpVariable UniformConstant 
                                         %142 = OpTypeSampler 
                                         %143 = OpTypePointer UniformConstant %142 
                UniformConstant sampler* %144 = OpVariable UniformConstant 
                                         %146 = OpTypeSampledImage %138 
                          Private f32_3* %152 = OpVariable Private 
                                     f32 %154 = OpConstant 3.674022E-40 
                                   f32_3 %155 = OpConstantComposite %154 %154 %154 
                                     f32 %163 = OpConstant 3.674022E-40 
                                   f32_2 %164 = OpConstantComposite %10 %163 
                                     f32 %176 = OpConstant 3.674022E-40 
                                   f32_3 %177 = OpConstantComposite %176 %154 %176 
                                     f32 %185 = OpConstant 3.674022E-40 
                                   f32_3 %186 = OpConstantComposite %185 %185 %185 
                                     f32 %189 = OpConstant 3.674022E-40 
                                   f32_3 %190 = OpConstantComposite %189 %189 %189 
                                     f32 %195 = OpConstant 3.674022E-40 
                                     f32 %196 = OpConstant 3.674022E-40 
                                     f32 %208 = OpConstant 3.674022E-40 
                          Private f32_2* %211 = OpVariable Private 
                                   f32_2 %214 = OpConstantComposite %196 %196 
                                     f32 %245 = OpConstant 3.674022E-40 
                                     f32 %246 = OpConstant 3.674022E-40 
                                     f32 %247 = OpConstant 3.674022E-40 
                                   f32_3 %248 = OpConstantComposite %245 %246 %247 
                            Private f32* %250 = OpVariable Private 
                                     i32 %253 = OpConstant 2 
                                     f32 %259 = OpConstant 3.674022E-40 
                                     f32 %263 = OpConstant 3.674022E-40 
                                     f32 %271 = OpConstant 3.674022E-40 
                                     f32 %277 = OpConstant 3.674022E-40 
                                     f32 %291 = OpConstant 3.674022E-40 
                                     f32 %292 = OpConstant 3.674022E-40 
                                   f32_2 %293 = OpConstantComposite %291 %292 
                            Private f32* %297 = OpVariable Private 
                                     f32 %300 = OpConstant 3.674022E-40 
                                     f32 %309 = OpConstant 3.674022E-40 
                                     f32 %315 = OpConstant 3.674022E-40 
                                     f32 %320 = OpConstant 3.674022E-40 
                                     f32 %323 = OpConstant 3.674022E-40 
                                         %334 = OpTypePointer Output %21 
                           Output f32_4* %335 = OpVariable Output 
                                     u32 %353 = OpConstant 3 
                                         %354 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                             Private f32* %14 = OpAccessChain %9 %12 
                                                  OpStore %14 %10 
                                    f32_2 %20 = OpLoad vs_TEXCOORD0 
                           Uniform f32_4* %28 = OpAccessChain %24 %26 
                                    f32_4 %29 = OpLoad %28 
                                    f32_2 %30 = OpVectorShuffle %29 %29 0 1 
                                    f32_2 %31 = OpFMul %20 %30 
                           Uniform f32_4* %32 = OpAccessChain %24 %26 
                                    f32_4 %33 = OpLoad %32 
                                    f32_2 %34 = OpVectorShuffle %33 %33 2 3 
                                    f32_2 %35 = OpFAdd %31 %34 
                                                  OpStore %17 %35 
                                    f32_2 %37 = OpLoad %17 
                                    f32_2 %38 = OpVectorShuffle %37 %37 1 1 
                                    f32_2 %42 = OpFMul %38 %41 
                                    f32_3 %43 = OpLoad %36 
                                    f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                  OpStore %36 %44 
                             Uniform f32* %47 = OpAccessChain %24 %45 
                                      f32 %48 = OpLoad %47 
                                    f32_2 %49 = OpCompositeConstruct %48 %48 
                                    f32_2 %53 = OpFMul %49 %52 
                                    f32_3 %54 = OpLoad %36 
                                    f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                    f32_2 %56 = OpFAdd %53 %55 
                                    f32_3 %57 = OpLoad %36 
                                    f32_3 %58 = OpVectorShuffle %57 %56 3 4 2 
                                                  OpStore %36 %58 
                                    f32_3 %59 = OpLoad %36 
                                    f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                    f32_2 %61 = OpExtInst %1 13 %60 
                                    f32_3 %62 = OpLoad %36 
                                    f32_3 %63 = OpVectorShuffle %62 %61 3 4 2 
                                                  OpStore %36 %63 
                             Private f32* %64 = OpAccessChain %36 %12 
                                      f32 %65 = OpLoad %64 
                             Private f32* %67 = OpAccessChain %36 %66 
                                      f32 %68 = OpLoad %67 
                                      f32 %69 = OpFMul %65 %68 
                             Private f32* %70 = OpAccessChain %36 %66 
                                                  OpStore %70 %69 
                             Uniform f32* %72 = OpAccessChain %24 %45 
                                      f32 %73 = OpLoad %72 
                                      f32 %75 = OpFMul %73 %74 
                                      f32 %76 = OpFAdd %75 %50 
                                                  OpStore %71 %76 
                             Private f32* %77 = OpAccessChain %17 %12 
                                      f32 %78 = OpLoad %77 
                                      f32 %80 = OpFMul %78 %79 
                                      f32 %81 = OpLoad %71 
                                      f32 %82 = OpFAdd %80 %81 
                                                  OpStore %71 %82 
                                      f32 %83 = OpLoad %71 
                                      f32 %84 = OpExtInst %1 13 %83 
                                                  OpStore %71 %84 
                                      f32 %85 = OpLoad %71 
                             Private f32* %86 = OpAccessChain %36 %66 
                                      f32 %87 = OpLoad %86 
                                      f32 %88 = OpFMul %85 %87 
                             Private f32* %89 = OpAccessChain %36 %66 
                                                  OpStore %89 %88 
                             Private f32* %90 = OpAccessChain %36 %66 
                                      f32 %91 = OpLoad %90 
                                      f32 %93 = OpFMul %91 %92 
                             Private f32* %94 = OpAccessChain %17 %66 
                                      f32 %95 = OpLoad %94 
                                      f32 %96 = OpFAdd %93 %95 
                                                  OpStore %71 %96 
                             Private f32* %97 = OpAccessChain %36 %66 
                                      f32 %98 = OpLoad %97 
                                      f32 %99 = OpFMul %98 %92 
                                     f32 %101 = OpFAdd %99 %100 
                            Private f32* %102 = OpAccessChain %36 %66 
                                                  OpStore %102 %101 
                            Private f32* %104 = OpAccessChain %36 %66 
                                     f32 %105 = OpLoad %104 
                                     f32 %107 = OpFMul %105 %106 
                            Private f32* %108 = OpAccessChain %17 %66 
                                     f32 %109 = OpLoad %108 
                                     f32 %110 = OpFAdd %107 %109 
                            Private f32* %111 = OpAccessChain %103 %66 
                                                  OpStore %111 %110 
                                     f32 %112 = OpLoad %71 
                                     f32 %113 = OpFAdd %112 %10 
                            Private f32* %114 = OpAccessChain %36 %66 
                                                  OpStore %114 %113 
                            Private f32* %115 = OpAccessChain %17 %66 
                                     f32 %116 = OpLoad %115 
                                     f32 %117 = OpFNegate %116 
                            Private f32* %118 = OpAccessChain %36 %66 
                                     f32 %119 = OpLoad %118 
                                     f32 %120 = OpFAdd %117 %119 
                            Private f32* %121 = OpAccessChain %9 %66 
                                                  OpStore %121 %120 
                            Uniform f32* %123 = OpAccessChain %24 %122 
                                     f32 %124 = OpLoad %123 
                            Uniform f32* %125 = OpAccessChain %24 %122 
                                     f32 %126 = OpLoad %125 
                                   f32_2 %127 = OpCompositeConstruct %124 %126 
                                     f32 %128 = OpCompositeExtract %127 0 
                                     f32 %129 = OpCompositeExtract %127 1 
                                   f32_2 %130 = OpCompositeConstruct %128 %129 
                                   f32_3 %131 = OpLoad %9 
                                   f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                                   f32_2 %133 = OpFMul %130 %132 
                                   f32_2 %134 = OpLoad %17 
                                   f32_2 %135 = OpFAdd %133 %134 
                                   f32_3 %136 = OpLoad %9 
                                   f32_3 %137 = OpVectorShuffle %136 %135 3 4 2 
                                                  OpStore %9 %137 
                     read_only Texture2D %141 = OpLoad %140 
                                 sampler %145 = OpLoad %144 
              read_only Texture2DSampled %147 = OpSampledImage %141 %145 
                                   f32_3 %148 = OpLoad %9 
                                   f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                   f32_4 %150 = OpImageSampleImplicitLod %147 %149 
                                   f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                                  OpStore %36 %151 
                                   f32_3 %153 = OpLoad %36 
                                   f32_3 %156 = OpFAdd %153 %155 
                                                  OpStore %152 %156 
                            Private f32* %157 = OpAccessChain %17 %12 
                                     f32 %158 = OpLoad %157 
                                     f32 %159 = OpFAdd %158 %10 
                            Private f32* %160 = OpAccessChain %103 %12 
                                                  OpStore %160 %159 
                                   f32_3 %161 = OpLoad %103 
                                   f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                   f32_2 %165 = OpFAdd %162 %164 
                                   f32_3 %166 = OpLoad %9 
                                   f32_3 %167 = OpVectorShuffle %166 %165 3 4 2 
                                                  OpStore %9 %167 
                     read_only Texture2D %168 = OpLoad %140 
                                 sampler %169 = OpLoad %144 
              read_only Texture2DSampled %170 = OpSampledImage %168 %169 
                                   f32_3 %171 = OpLoad %9 
                                   f32_2 %172 = OpVectorShuffle %171 %171 0 1 
                                   f32_4 %173 = OpImageSampleImplicitLod %170 %172 
                                   f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                                  OpStore %103 %174 
                                   f32_3 %175 = OpLoad %103 
                                   f32_3 %178 = OpFMul %175 %177 
                                   f32_3 %179 = OpLoad %152 
                                   f32_3 %180 = OpFAdd %178 %179 
                                                  OpStore %103 %180 
                                   f32_3 %181 = OpLoad %103 
                                   f32_3 %182 = OpLoad %103 
                                   f32_3 %183 = OpFMul %181 %182 
                                                  OpStore %152 %183 
                                   f32_3 %184 = OpLoad %152 
                                   f32_3 %187 = OpFMul %184 %186 
                                                  OpStore %152 %187 
                                   f32_3 %188 = OpLoad %103 
                                   f32_3 %191 = OpFMul %188 %190 
                                   f32_3 %192 = OpLoad %152 
                                   f32_3 %193 = OpFAdd %191 %192 
                                                  OpStore %103 %193 
                                   f32_3 %194 = OpLoad %103 
                                   f32_3 %197 = OpCompositeConstruct %195 %195 %195 
                                   f32_3 %198 = OpCompositeConstruct %196 %196 %196 
                                   f32_3 %199 = OpExtInst %1 43 %194 %197 %198 
                                                  OpStore %103 %199 
                            Private f32* %200 = OpAccessChain %17 %66 
                                     f32 %201 = OpLoad %200 
                            Private f32* %202 = OpAccessChain %17 %12 
                                     f32 %203 = OpLoad %202 
                                     f32 %204 = OpFMul %201 %203 
                            Private f32* %205 = OpAccessChain %9 %66 
                                                  OpStore %205 %204 
                            Private f32* %206 = OpAccessChain %9 %66 
                                     f32 %207 = OpLoad %206 
                                     f32 %209 = OpFMul %207 %208 
                            Private f32* %210 = OpAccessChain %9 %66 
                                                  OpStore %210 %209 
                                   f32_2 %212 = OpLoad %17 
                                   f32_2 %213 = OpFNegate %212 
                                   f32_2 %215 = OpFAdd %213 %214 
                                                  OpStore %211 %215 
                            Private f32* %216 = OpAccessChain %211 %66 
                                     f32 %217 = OpLoad %216 
                            Private f32* %218 = OpAccessChain %9 %66 
                                     f32 %219 = OpLoad %218 
                                     f32 %220 = OpFMul %217 %219 
                            Private f32* %221 = OpAccessChain %9 %66 
                                                  OpStore %221 %220 
                            Private f32* %222 = OpAccessChain %211 %12 
                                     f32 %223 = OpLoad %222 
                            Private f32* %224 = OpAccessChain %9 %66 
                                     f32 %225 = OpLoad %224 
                                     f32 %226 = OpFMul %223 %225 
                            Private f32* %227 = OpAccessChain %9 %66 
                                                  OpStore %227 %226 
                            Private f32* %228 = OpAccessChain %9 %66 
                                     f32 %229 = OpLoad %228 
                                     f32 %230 = OpExtInst %1 30 %229 
                            Private f32* %231 = OpAccessChain %9 %66 
                                                  OpStore %231 %230 
                            Private f32* %232 = OpAccessChain %9 %66 
                                     f32 %233 = OpLoad %232 
                                     f32 %234 = OpFMul %233 %50 
                            Private f32* %235 = OpAccessChain %9 %66 
                                                  OpStore %235 %234 
                            Private f32* %236 = OpAccessChain %9 %66 
                                     f32 %237 = OpLoad %236 
                                     f32 %238 = OpExtInst %1 29 %237 
                            Private f32* %239 = OpAccessChain %9 %66 
                                                  OpStore %239 %238 
                                   f32_3 %240 = OpLoad %9 
                                   f32_3 %241 = OpVectorShuffle %240 %240 0 0 0 
                                   f32_3 %242 = OpLoad %103 
                                   f32_3 %243 = OpFMul %241 %242 
                                                  OpStore %9 %243 
                                   f32_3 %244 = OpLoad %9 
                                   f32_3 %249 = OpFMul %244 %248 
                                                  OpStore %9 %249 
                            Private f32* %251 = OpAccessChain %17 %12 
                                     f32 %252 = OpLoad %251 
                            Uniform f32* %254 = OpAccessChain %24 %253 %12 
                                     f32 %255 = OpLoad %254 
                                     f32 %256 = OpFMul %252 %255 
                                                  OpStore %250 %256 
                            Uniform f32* %257 = OpAccessChain %24 %45 
                                     f32 %258 = OpLoad %257 
                                     f32 %260 = OpFMul %258 %259 
                            Private f32* %261 = OpAccessChain %103 %66 
                                                  OpStore %261 %260 
                                     f32 %262 = OpLoad %250 
                                     f32 %264 = OpFMul %262 %263 
                            Private f32* %265 = OpAccessChain %103 %66 
                                     f32 %266 = OpLoad %265 
                                     f32 %267 = OpFAdd %264 %266 
                                                  OpStore %250 %267 
                                     f32 %268 = OpLoad %250 
                                     f32 %269 = OpExtInst %1 13 %268 
                                                  OpStore %250 %269 
                                     f32 %270 = OpLoad %250 
                                     f32 %272 = OpFMul %270 %271 
                                     f32 %273 = OpFAdd %272 %271 
                                                  OpStore %250 %273 
                                     f32 %274 = OpLoad %250 
                                     f32 %275 = OpExtInst %1 30 %274 
                                                  OpStore %250 %275 
                                     f32 %276 = OpLoad %250 
                                     f32 %278 = OpFMul %276 %277 
                                                  OpStore %250 %278 
                                     f32 %279 = OpLoad %250 
                                     f32 %280 = OpExtInst %1 29 %279 
                                                  OpStore %250 %280 
                                     f32 %281 = OpLoad %250 
                                     f32 %282 = OpFMul %281 %51 
                                     f32 %283 = OpFAdd %282 %185 
                                                  OpStore %250 %283 
                                   f32_3 %284 = OpLoad %9 
                                     f32 %285 = OpLoad %250 
                                   f32_3 %286 = OpCompositeConstruct %285 %285 %285 
                                   f32_3 %287 = OpFMul %284 %286 
                                                  OpStore %9 %287 
                            Uniform f32* %288 = OpAccessChain %24 %45 
                                     f32 %289 = OpLoad %288 
                                   f32_2 %290 = OpCompositeConstruct %289 %289 
                                   f32_2 %294 = OpFMul %290 %293 
                                   f32_3 %295 = OpLoad %103 
                                   f32_3 %296 = OpVectorShuffle %295 %294 3 4 2 
                                                  OpStore %103 %296 
                            Private f32* %298 = OpAccessChain %17 %12 
                                     f32 %299 = OpLoad %298 
                                     f32 %301 = OpFMul %299 %300 
                            Private f32* %302 = OpAccessChain %103 %66 
                                     f32 %303 = OpLoad %302 
                                     f32 %304 = OpFAdd %301 %303 
                                                  OpStore %297 %304 
                            Private f32* %305 = OpAccessChain %103 %12 
                                     f32 %306 = OpLoad %305 
                                     f32 %307 = OpExtInst %1 13 %306 
                                                  OpStore %250 %307 
                                     f32 %308 = OpLoad %250 
                                     f32 %310 = OpFMul %308 %309 
                                     f32 %311 = OpFAdd %310 %196 
                                                  OpStore %250 %311 
                                     f32 %312 = OpLoad %297 
                                     f32 %313 = OpExtInst %1 13 %312 
                                                  OpStore %297 %313 
                                     f32 %314 = OpLoad %297 
                                     f32 %316 = OpFAdd %314 %315 
                                                  OpStore %297 %316 
                                     f32 %317 = OpLoad %297 
                                     f32 %318 = OpExtInst %1 8 %317 
                                                  OpStore %297 %318 
                                     f32 %319 = OpLoad %297 
                                     f32 %321 = OpExtInst %1 37 %319 %320 
                                                  OpStore %297 %321 
                                     f32 %322 = OpLoad %297 
                                     f32 %324 = OpFMul %322 %323 
                                     f32 %325 = OpLoad %250 
                                     f32 %326 = OpFAdd %324 %325 
                                                  OpStore %297 %326 
                                   f32_3 %327 = OpLoad %9 
                                     f32 %328 = OpLoad %297 
                                   f32_3 %329 = OpCompositeConstruct %328 %328 %328 
                                   f32_3 %330 = OpFMul %327 %329 
                                   f32_3 %331 = OpLoad %36 
                                   f32_3 %332 = OpFNegate %331 
                                   f32_3 %333 = OpFAdd %330 %332 
                                                  OpStore %9 %333 
                            Uniform f32* %336 = OpAccessChain %24 %122 
                                     f32 %337 = OpLoad %336 
                            Uniform f32* %338 = OpAccessChain %24 %122 
                                     f32 %339 = OpLoad %338 
                            Uniform f32* %340 = OpAccessChain %24 %122 
                                     f32 %341 = OpLoad %340 
                                   f32_3 %342 = OpCompositeConstruct %337 %339 %341 
                                     f32 %343 = OpCompositeExtract %342 0 
                                     f32 %344 = OpCompositeExtract %342 1 
                                     f32 %345 = OpCompositeExtract %342 2 
                                   f32_3 %346 = OpCompositeConstruct %343 %344 %345 
                                   f32_3 %347 = OpLoad %9 
                                   f32_3 %348 = OpFMul %346 %347 
                                   f32_3 %349 = OpLoad %36 
                                   f32_3 %350 = OpFAdd %348 %349 
                                   f32_4 %351 = OpLoad %335 
                                   f32_4 %352 = OpVectorShuffle %351 %350 4 5 6 3 
                                                  OpStore %335 %352 
                             Output f32* %355 = OpAccessChain %335 %353 
                                                  OpStore %355 %196 
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