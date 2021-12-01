//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Particles/Alpha Blended" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 17606
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
uniform 	vec4 _TintColor;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _TintColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = vs_COLOR0 + vs_COLOR0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat1;
    SV_Target0.w = u_xlat0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 108
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %90 %92 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %83 Location 83 
                                                      OpDecorate vs_TEXCOORD0 Location 90 
                                                      OpDecorate %92 Location 92 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeStruct %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 0 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %68 = OpConstant 1 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeStruct %7 %6 %69 
                                              %71 = OpTypePointer Output %70 
         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                              %80 = OpTypePointer Output %7 
                                Output f32_4* %82 = OpVariable Output 
                                 Input f32_4* %83 = OpVariable Input 
                                              %88 = OpTypeVector %6 2 
                                              %89 = OpTypePointer Output %88 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %91 = OpTypePointer Input %88 
                                 Input f32_2* %92 = OpVariable Input 
                                             %102 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_4 %84 = OpLoad %83 
                               Uniform f32_4* %85 = OpAccessChain %20 %35 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpFMul %84 %86 
                                                      OpStore %82 %87 
                                        f32_2 %93 = OpLoad %92 
                               Uniform f32_4* %94 = OpAccessChain %20 %44 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                               Uniform f32_4* %98 = OpAccessChain %20 %44 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore vs_TEXCOORD0 %101 
                                 Output f32* %103 = OpAccessChain %72 %22 %68 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFNegate %104 
                                 Output f32* %106 = OpAccessChain %72 %22 %68 
                                                      OpStore %106 %105 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 55
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %28 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 Location 11 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate vs_TEXCOORD0 Location 28 
                                             OpDecorate %35 Location 35 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                      Private f32_4* %15 = OpVariable Private 
                                     %16 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %17 = OpTypePointer UniformConstant %16 
UniformConstant read_only Texture2D* %18 = OpVariable UniformConstant 
                                     %20 = OpTypeSampler 
                                     %21 = OpTypePointer UniformConstant %20 
            UniformConstant sampler* %22 = OpVariable UniformConstant 
                                     %24 = OpTypeSampledImage %16 
                                     %26 = OpTypeVector %6 2 
                                     %27 = OpTypePointer Input %26 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %34 = OpTypePointer Output %7 
                       Output f32_4* %35 = OpVariable Output 
                                     %36 = OpTypeInt 32 0 
                                 u32 %37 = OpConstant 3 
                                     %38 = OpTypePointer Private %6 
                                     %41 = OpTypePointer Output %6 
                                 f32 %45 = OpConstant 3.674022E-40 
                                 f32 %46 = OpConstant 3.674022E-40 
                                     %49 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                               f32_4 %13 = OpLoad %11 
                               f32_4 %14 = OpFAdd %12 %13 
                                             OpStore %9 %14 
                 read_only Texture2D %19 = OpLoad %18 
                             sampler %23 = OpLoad %22 
          read_only Texture2DSampled %25 = OpSampledImage %19 %23 
                               f32_2 %29 = OpLoad vs_TEXCOORD0 
                               f32_4 %30 = OpImageSampleImplicitLod %25 %29 
                                             OpStore %15 %30 
                               f32_4 %31 = OpLoad %9 
                               f32_4 %32 = OpLoad %15 
                               f32_4 %33 = OpFMul %31 %32 
                                             OpStore %9 %33 
                        Private f32* %39 = OpAccessChain %9 %37 
                                 f32 %40 = OpLoad %39 
                         Output f32* %42 = OpAccessChain %35 %37 
                                             OpStore %42 %40 
                         Output f32* %43 = OpAccessChain %35 %37 
                                 f32 %44 = OpLoad %43 
                                 f32 %47 = OpExtInst %1 43 %44 %45 %46 
                         Output f32* %48 = OpAccessChain %35 %37 
                                             OpStore %48 %47 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                               f32_4 %52 = OpLoad %35 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                             OpStore %35 %53 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SOFTPARTICLES_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TintColor;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0 * _TintColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	float _InvFade;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat1;
    SV_Target0.w = u_xlat0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SOFTPARTICLES_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 181
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %143 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 93 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate vs_TEXCOORD2 Location 143 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                                          i32 %97 = OpConstant 5 
                                             %106 = OpTypePointer Private %6 
                                Private f32* %107 = OpVariable Private 
                                         u32 %110 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %6 
                                         u32 %117 = OpConstant 0 
                                         u32 %135 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %147 = OpTypePointer Output %6 
                                         f32 %157 = OpConstant 3.674022E-40 
                                       f32_2 %162 = OpConstantComposite %157 %157 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                               Uniform f32_4* %98 = OpAccessChain %21 %97 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                       f32_2 %101 = OpFMul %96 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %97 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 2 3 
                                       f32_2 %105 = OpFAdd %101 %104 
                                                      OpStore vs_TEXCOORD0 %105 
                                Private f32* %108 = OpAccessChain %9 %76 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %112 = OpAccessChain %21 %36 %23 %110 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %109 %113 
                                                      OpStore %107 %114 
                                Uniform f32* %115 = OpAccessChain %21 %36 %28 %110 
                                         f32 %116 = OpLoad %115 
                                Private f32* %118 = OpAccessChain %9 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFMul %116 %119 
                                         f32 %121 = OpLoad %107 
                                         f32 %122 = OpFAdd %120 %121 
                                Private f32* %123 = OpAccessChain %9 %117 
                                                      OpStore %123 %122 
                                Uniform f32* %124 = OpAccessChain %21 %36 %36 %110 
                                         f32 %125 = OpLoad %124 
                                Private f32* %126 = OpAccessChain %9 %110 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFMul %125 %127 
                                Private f32* %129 = OpAccessChain %9 %117 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFAdd %128 %130 
                                Private f32* %132 = OpAccessChain %9 %117 
                                                      OpStore %132 %131 
                                Uniform f32* %133 = OpAccessChain %21 %36 %45 %110 
                                         f32 %134 = OpLoad %133 
                                Private f32* %136 = OpAccessChain %9 %135 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %117 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %9 %117 
                                                      OpStore %142 %141 
                                Private f32* %144 = OpAccessChain %9 %117 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpFNegate %145 
                                 Output f32* %148 = OpAccessChain vs_TEXCOORD2 %110 
                                                      OpStore %148 %146 
                                Private f32* %149 = OpAccessChain %49 %76 
                                         f32 %150 = OpLoad %149 
                                Uniform f32* %151 = OpAccessChain %21 %28 %117 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %150 %152 
                                Private f32* %154 = OpAccessChain %9 %117 
                                                      OpStore %154 %153 
                                Private f32* %155 = OpAccessChain %9 %117 
                                         f32 %156 = OpLoad %155 
                                         f32 %158 = OpFMul %156 %157 
                                Private f32* %159 = OpAccessChain %9 %135 
                                                      OpStore %159 %158 
                                       f32_4 %160 = OpLoad %49 
                                       f32_2 %161 = OpVectorShuffle %160 %160 0 3 
                                       f32_2 %163 = OpFMul %161 %162 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 1 5 3 
                                                      OpStore %9 %165 
                                Private f32* %166 = OpAccessChain %49 %135 
                                         f32 %167 = OpLoad %166 
                                 Output f32* %168 = OpAccessChain vs_TEXCOORD2 %135 
                                                      OpStore %168 %167 
                                       f32_4 %169 = OpLoad %9 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 2 
                                       f32_4 %171 = OpLoad %9 
                                       f32_2 %172 = OpVectorShuffle %171 %171 0 3 
                                       f32_2 %173 = OpFAdd %170 %172 
                                       f32_4 %174 = OpLoad vs_TEXCOORD2 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %175 
                                 Output f32* %176 = OpAccessChain %80 %28 %76 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFNegate %177 
                                 Output f32* %179 = OpAccessChain %80 %28 %76 
                                                      OpStore %179 %178 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %82 %102 %109 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD2 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpMemberDecorate %38 0 Offset 38 
                                             OpMemberDecorate %38 1 Offset 38 
                                             OpDecorate %38 Block 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %82 Location 82 
                                             OpDecorate %96 DescriptorSet 96 
                                             OpDecorate %96 Binding 96 
                                             OpDecorate %98 DescriptorSet 98 
                                             OpDecorate %98 Binding 98 
                                             OpDecorate vs_TEXCOORD0 Location 102 
                                             OpDecorate %109 Location 109 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
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
                                     %38 = OpTypeStruct %7 %6 
                                     %39 = OpTypePointer Uniform %38 
       Uniform struct {f32_4; f32;}* %40 = OpVariable Uniform 
                                     %41 = OpTypeInt 32 1 
                                 i32 %42 = OpConstant 0 
                                 u32 %43 = OpConstant 2 
                                     %44 = OpTypePointer Uniform %6 
                                 u32 %50 = OpConstant 3 
                                 f32 %55 = OpConstant 3.674022E-40 
                                     %62 = OpTypePointer Input %6 
                                 i32 %70 = OpConstant 1 
                                 f32 %77 = OpConstant 3.674022E-40 
                        Input f32_4* %82 = OpVariable Input 
                                     %87 = OpTypeVector %6 3 
                      Private f32_4* %95 = OpVariable Private 
UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
            UniformConstant sampler* %98 = OpVariable UniformConstant 
                                    %101 = OpTypePointer Input %12 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                    %108 = OpTypePointer Output %7 
                      Output f32_4* %109 = OpVariable Output 
                                    %112 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD2 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD2 
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
                        Private f32* %60 = OpAccessChain %9 %34 
                                 f32 %61 = OpLoad %60 
                          Input f32* %63 = OpAccessChain vs_TEXCOORD2 %43 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFNegate %64 
                                 f32 %66 = OpFAdd %61 %65 
                        Private f32* %67 = OpAccessChain %9 %34 
                                             OpStore %67 %66 
                        Private f32* %68 = OpAccessChain %9 %34 
                                 f32 %69 = OpLoad %68 
                        Uniform f32* %71 = OpAccessChain %40 %70 
                                 f32 %72 = OpLoad %71 
                                 f32 %73 = OpFMul %69 %72 
                        Private f32* %74 = OpAccessChain %9 %34 
                                             OpStore %74 %73 
                        Private f32* %75 = OpAccessChain %9 %34 
                                 f32 %76 = OpLoad %75 
                                 f32 %78 = OpExtInst %1 43 %76 %77 %55 
                        Private f32* %79 = OpAccessChain %9 %34 
                                             OpStore %79 %78 
                        Private f32* %80 = OpAccessChain %9 %34 
                                 f32 %81 = OpLoad %80 
                          Input f32* %83 = OpAccessChain %82 %50 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %81 %84 
                        Private f32* %86 = OpAccessChain %9 %50 
                                             OpStore %86 %85 
                               f32_4 %88 = OpLoad %82 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_4 %90 = OpLoad %9 
                               f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                             OpStore %9 %91 
                               f32_4 %92 = OpLoad %9 
                               f32_4 %93 = OpLoad %9 
                               f32_4 %94 = OpFAdd %92 %93 
                                             OpStore %9 %94 
                 read_only Texture2D %97 = OpLoad %96 
                             sampler %99 = OpLoad %98 
         read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                              f32_2 %103 = OpLoad vs_TEXCOORD0 
                              f32_4 %104 = OpImageSampleImplicitLod %100 %103 
                                             OpStore %95 %104 
                              f32_4 %105 = OpLoad %9 
                              f32_4 %106 = OpLoad %95 
                              f32_4 %107 = OpFMul %105 %106 
                                             OpStore %9 %107 
                       Private f32* %110 = OpAccessChain %9 %50 
                                f32 %111 = OpLoad %110 
                        Output f32* %113 = OpAccessChain %109 %50 
                                             OpStore %113 %111 
                        Output f32* %114 = OpAccessChain %109 %50 
                                f32 %115 = OpLoad %114 
                                f32 %116 = OpExtInst %1 43 %115 %77 %55 
                        Output f32* %117 = OpAccessChain %109 %50 
                                             OpStore %117 %116 
                              f32_4 %118 = OpLoad %9 
                              f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                              f32_4 %120 = OpLoad %109 
                              f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                             OpStore %109 %121 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
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
uniform 	vec4 unity_FogParams;
uniform 	vec4 _TintColor;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_COLOR0 = in_COLOR0 * _TintColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 unity_FogColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = vs_COLOR0 + vs_COLOR0;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz + (-unity_FogColor.xyz);
    u_xlat1.x = u_xlat1.w * u_xlat2.w;
    SV_Target0.w = u_xlat1.x;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat3.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 148
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %121 %122 %130 %132 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %77 0 BuiltIn 77 
                                                      OpMemberDecorate %77 1 BuiltIn 77 
                                                      OpMemberDecorate %77 2 BuiltIn 77 
                                                      OpDecorate %77 Block 
                                                      OpDecorate vs_TEXCOORD1 Location 111 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate vs_TEXCOORD0 Location 130 
                                                      OpDecorate %132 Location 132 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %75 = OpConstant 1 
                                              %76 = OpTypeArray %6 %75 
                                              %77 = OpTypeStruct %7 %6 %76 
                                              %78 = OpTypePointer Output %77 
         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                          u32 %83 = OpConstant 2 
                                              %84 = OpTypePointer Private %6 
                                              %87 = OpTypePointer Uniform %6 
                                          u32 %91 = OpConstant 0 
                                          f32 %96 = OpConstant 3.674022E-40 
                                         f32 %107 = OpConstant 3.674022E-40 
                                             %110 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %117 = OpConstant 3 
                               Output f32_4* %121 = OpVariable Output 
                                Input f32_4* %122 = OpVariable Input 
                                         i32 %124 = OpConstant 4 
                                             %128 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Output %128 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %131 = OpTypePointer Input %128 
                                Input f32_2* %132 = OpVariable Input 
                                         i32 %134 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %13 %25 
                                                      OpStore %9 %26 
                               Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %48 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %80 = OpLoad %9 
                                Output f32_4* %82 = OpAccessChain %79 %27 
                                                      OpStore %82 %80 
                                 Private f32* %85 = OpAccessChain %9 %83 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %88 = OpAccessChain %20 %27 %75 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFDiv %86 %89 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                                      OpStore %92 %90 
                                 Private f32* %93 = OpAccessChain %9 %91 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFNegate %94 
                                          f32 %97 = OpFAdd %95 %96 
                                 Private f32* %98 = OpAccessChain %9 %91 
                                                      OpStore %98 %97 
                                 Private f32* %99 = OpAccessChain %9 %91 
                                         f32 %100 = OpLoad %99 
                                Uniform f32* %101 = OpAccessChain %20 %27 %83 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %100 %102 
                                Private f32* %104 = OpAccessChain %9 %91 
                                                      OpStore %104 %103 
                                Private f32* %105 = OpAccessChain %9 %91 
                                         f32 %106 = OpLoad %105 
                                         f32 %108 = OpExtInst %1 40 %106 %107 
                                Private f32* %109 = OpAccessChain %9 %91 
                                                      OpStore %109 %108 
                                Private f32* %112 = OpAccessChain %9 %91 
                                         f32 %113 = OpLoad %112 
                                Uniform f32* %114 = OpAccessChain %20 %44 %83 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFMul %113 %115 
                                Uniform f32* %118 = OpAccessChain %20 %44 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFAdd %116 %119 
                                                      OpStore vs_TEXCOORD1 %120 
                                       f32_4 %123 = OpLoad %122 
                              Uniform f32_4* %125 = OpAccessChain %20 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpFMul %123 %126 
                                                      OpStore %121 %127 
                                       f32_2 %133 = OpLoad %132 
                              Uniform f32_4* %135 = OpAccessChain %20 %134 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                                       f32_2 %138 = OpFMul %133 %137 
                              Uniform f32_4* %139 = OpAccessChain %20 %134 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 2 3 
                                       f32_2 %142 = OpFAdd %138 %141 
                                                      OpStore vs_TEXCOORD0 %142 
                                 Output f32* %143 = OpAccessChain %79 %27 %75 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFNegate %144 
                                 Output f32* %146 = OpAccessChain %79 %27 %75 
                                                      OpStore %146 %145 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 89
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %10 %20 %37 %69 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 10 
                                             OpDecorate %20 Location 20 
                                             OpDecorate %27 DescriptorSet 27 
                                             OpDecorate %27 Binding 27 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate vs_TEXCOORD0 Location 37 
                                             OpMemberDecorate %48 0 Offset 48 
                                             OpDecorate %48 Block 
                                             OpDecorate %50 DescriptorSet 50 
                                             OpDecorate %50 Binding 50 
                                             OpDecorate %69 Location 69 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %13 = OpConstant 3.674022E-40 
                                 f32 %14 = OpConstant 3.674022E-40 
                                     %16 = OpTypeVector %6 4 
                                     %17 = OpTypePointer Private %16 
                      Private f32_4* %18 = OpVariable Private 
                                     %19 = OpTypePointer Input %16 
                        Input f32_4* %20 = OpVariable Input 
                      Private f32_4* %24 = OpVariable Private 
                                     %25 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %26 = OpTypePointer UniformConstant %25 
UniformConstant read_only Texture2D* %27 = OpVariable UniformConstant 
                                     %29 = OpTypeSampler 
                                     %30 = OpTypePointer UniformConstant %29 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                     %33 = OpTypeSampledImage %25 
                                     %35 = OpTypeVector %6 2 
                                     %36 = OpTypePointer Input %35 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %40 = OpTypeVector %6 3 
                                     %41 = OpTypePointer Private %40 
                      Private f32_3* %42 = OpVariable Private 
                                     %48 = OpTypeStruct %16 
                                     %49 = OpTypePointer Uniform %48 
            Uniform struct {f32_4;}* %50 = OpVariable Uniform 
                                     %51 = OpTypeInt 32 1 
                                 i32 %52 = OpConstant 0 
                                     %53 = OpTypePointer Uniform %16 
                                     %59 = OpTypeInt 32 0 
                                 u32 %60 = OpConstant 3 
                                 u32 %66 = OpConstant 0 
                                     %68 = OpTypePointer Output %16 
                       Output f32_4* %69 = OpVariable Output 
                                     %72 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                                 f32 %11 = OpLoad vs_TEXCOORD1 
                                             OpStore %8 %11 
                                 f32 %12 = OpLoad %8 
                                 f32 %15 = OpExtInst %1 43 %12 %13 %14 
                                             OpStore %8 %15 
                               f32_4 %21 = OpLoad %20 
                               f32_4 %22 = OpLoad %20 
                               f32_4 %23 = OpFAdd %21 %22 
                                             OpStore %18 %23 
                 read_only Texture2D %28 = OpLoad %27 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %34 = OpSampledImage %28 %32 
                               f32_2 %38 = OpLoad vs_TEXCOORD0 
                               f32_4 %39 = OpImageSampleImplicitLod %34 %38 
                                             OpStore %24 %39 
                               f32_4 %43 = OpLoad %18 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               f32_4 %45 = OpLoad %24 
                               f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                               f32_3 %47 = OpFMul %44 %46 
                      Uniform f32_4* %54 = OpAccessChain %50 %52 
                               f32_4 %55 = OpLoad %54 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_3 %57 = OpFNegate %56 
                               f32_3 %58 = OpFAdd %47 %57 
                                             OpStore %42 %58 
                        Private f32* %61 = OpAccessChain %18 %60 
                                 f32 %62 = OpLoad %61 
                        Private f32* %63 = OpAccessChain %24 %60 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFMul %62 %64 
                        Private f32* %67 = OpAccessChain %18 %66 
                                             OpStore %67 %65 
                        Private f32* %70 = OpAccessChain %18 %66 
                                 f32 %71 = OpLoad %70 
                         Output f32* %73 = OpAccessChain %69 %60 
                                             OpStore %73 %71 
                         Output f32* %74 = OpAccessChain %69 %60 
                                 f32 %75 = OpLoad %74 
                                 f32 %76 = OpExtInst %1 43 %75 %13 %14 
                         Output f32* %77 = OpAccessChain %69 %60 
                                             OpStore %77 %76 
                                 f32 %78 = OpLoad %8 
                               f32_3 %79 = OpCompositeConstruct %78 %78 %78 
                               f32_3 %80 = OpLoad %42 
                               f32_3 %81 = OpFMul %79 %80 
                      Uniform f32_4* %82 = OpAccessChain %50 %52 
                               f32_4 %83 = OpLoad %82 
                               f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                               f32_3 %85 = OpFAdd %81 %84 
                               f32_4 %86 = OpLoad %69 
                               f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                             OpStore %69 %87 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _TintColor;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0 * _TintColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 unity_FogColor;
uniform 	float _InvFade;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat6 = u_xlat0.w * u_xlat1.w;
    SV_Target0.w = u_xlat6;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 207
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %127 %170 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 93 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate vs_TEXCOORD1 Location 127 
                                                      OpDecorate vs_TEXCOORD2 Location 170 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 5 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                                          i32 %97 = OpConstant 6 
                                             %106 = OpTypePointer Private %6 
                                Private f32* %107 = OpVariable Private 
                                         u32 %108 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %6 
                                         f32 %117 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                                             %126 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 4 
                                         u32 %133 = OpConstant 3 
                                Private f32* %137 = OpVariable Private 
                                         u32 %145 = OpConstant 0 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         f32 %183 = OpConstant 3.674022E-40 
                                       f32_2 %188 = OpConstantComposite %183 %183 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                               Uniform f32_4* %98 = OpAccessChain %21 %97 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                       f32_2 %101 = OpFMul %96 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %97 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 2 3 
                                       f32_2 %105 = OpFAdd %101 %104 
                                                      OpStore vs_TEXCOORD0 %105 
                                Private f32* %109 = OpAccessChain %49 %108 
                                         f32 %110 = OpLoad %109 
                                Uniform f32* %112 = OpAccessChain %21 %28 %76 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFDiv %110 %113 
                                                      OpStore %107 %114 
                                         f32 %115 = OpLoad %107 
                                         f32 %116 = OpFNegate %115 
                                         f32 %118 = OpFAdd %116 %117 
                                                      OpStore %107 %118 
                                         f32 %119 = OpLoad %107 
                                Uniform f32* %120 = OpAccessChain %21 %28 %108 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFMul %119 %121 
                                                      OpStore %107 %122 
                                         f32 %123 = OpLoad %107 
                                         f32 %125 = OpExtInst %1 40 %123 %124 
                                                      OpStore %107 %125 
                                         f32 %128 = OpLoad %107 
                                Uniform f32* %130 = OpAccessChain %21 %129 %108 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpFMul %128 %131 
                                Uniform f32* %134 = OpAccessChain %21 %129 %133 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFAdd %132 %135 
                                                      OpStore vs_TEXCOORD1 %136 
                                Private f32* %138 = OpAccessChain %9 %76 
                                         f32 %139 = OpLoad %138 
                                Uniform f32* %140 = OpAccessChain %21 %36 %23 %108 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFMul %139 %141 
                                                      OpStore %137 %142 
                                Uniform f32* %143 = OpAccessChain %21 %36 %28 %108 
                                         f32 %144 = OpLoad %143 
                                Private f32* %146 = OpAccessChain %9 %145 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFMul %144 %147 
                                         f32 %149 = OpLoad %137 
                                         f32 %150 = OpFAdd %148 %149 
                                Private f32* %151 = OpAccessChain %9 %145 
                                                      OpStore %151 %150 
                                Uniform f32* %152 = OpAccessChain %21 %36 %36 %108 
                                         f32 %153 = OpLoad %152 
                                Private f32* %154 = OpAccessChain %9 %108 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                Private f32* %157 = OpAccessChain %9 %145 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %9 %145 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %21 %36 %45 %108 
                                         f32 %162 = OpLoad %161 
                                Private f32* %163 = OpAccessChain %9 %133 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %162 %164 
                                Private f32* %166 = OpAccessChain %9 %145 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %165 %167 
                                Private f32* %169 = OpAccessChain %9 %145 
                                                      OpStore %169 %168 
                                Private f32* %171 = OpAccessChain %9 %145 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain vs_TEXCOORD2 %108 
                                                      OpStore %174 %173 
                                Private f32* %175 = OpAccessChain %49 %76 
                                         f32 %176 = OpLoad %175 
                                Uniform f32* %177 = OpAccessChain %21 %28 %145 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %176 %178 
                                Private f32* %180 = OpAccessChain %9 %145 
                                                      OpStore %180 %179 
                                Private f32* %181 = OpAccessChain %9 %145 
                                         f32 %182 = OpLoad %181 
                                         f32 %184 = OpFMul %182 %183 
                                Private f32* %185 = OpAccessChain %9 %133 
                                                      OpStore %185 %184 
                                       f32_4 %186 = OpLoad %49 
                                       f32_2 %187 = OpVectorShuffle %186 %186 0 3 
                                       f32_2 %189 = OpFMul %187 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 1 5 3 
                                                      OpStore %9 %191 
                                Private f32* %192 = OpAccessChain %49 %133 
                                         f32 %193 = OpLoad %192 
                                 Output f32* %194 = OpAccessChain vs_TEXCOORD2 %133 
                                                      OpStore %194 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_2 %196 = OpVectorShuffle %195 %195 2 2 
                                       f32_4 %197 = OpLoad %9 
                                       f32_2 %198 = OpVectorShuffle %197 %197 0 3 
                                       f32_2 %199 = OpFAdd %196 %198 
                                       f32_4 %200 = OpLoad vs_TEXCOORD2 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %201 
                                 Output f32* %202 = OpAccessChain %80 %28 %76 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFNegate %203 
                                 Output f32* %205 = OpAccessChain %80 %28 %76 
                                                      OpStore %205 %204 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 150
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %82 %102 %126 %134 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD2 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpMemberDecorate %38 0 Offset 38 
                                             OpMemberDecorate %38 1 Offset 38 
                                             OpMemberDecorate %38 2 Offset 38 
                                             OpDecorate %38 Block 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %82 Location 82 
                                             OpDecorate %96 DescriptorSet 96 
                                             OpDecorate %96 Binding 96 
                                             OpDecorate %98 DescriptorSet 98 
                                             OpDecorate %98 Binding 98 
                                             OpDecorate vs_TEXCOORD0 Location 102 
                                             OpDecorate %126 Location 126 
                                             OpDecorate vs_TEXCOORD1 Location 134 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
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
                                     %38 = OpTypeStruct %7 %7 %6 
                                     %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32;}* %40 = OpVariable Uniform 
                                     %41 = OpTypeInt 32 1 
                                 i32 %42 = OpConstant 0 
                                 u32 %43 = OpConstant 2 
                                     %44 = OpTypePointer Uniform %6 
                                 u32 %50 = OpConstant 3 
                                 f32 %55 = OpConstant 3.674022E-40 
                                     %62 = OpTypePointer Input %6 
                                 i32 %70 = OpConstant 2 
                                 f32 %77 = OpConstant 3.674022E-40 
                        Input f32_4* %82 = OpVariable Input 
                                     %87 = OpTypeVector %6 3 
                      Private f32_4* %95 = OpVariable Private 
UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
            UniformConstant sampler* %98 = OpVariable UniformConstant 
                                    %101 = OpTypePointer Input %12 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                i32 %110 = OpConstant 1 
                                    %111 = OpTypePointer Uniform %7 
                       Private f32* %119 = OpVariable Private 
                                    %125 = OpTypePointer Output %7 
                      Output f32_4* %126 = OpVariable Output 
                                    %128 = OpTypePointer Output %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD2 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD2 
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
                        Private f32* %60 = OpAccessChain %9 %34 
                                 f32 %61 = OpLoad %60 
                          Input f32* %63 = OpAccessChain vs_TEXCOORD2 %43 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFNegate %64 
                                 f32 %66 = OpFAdd %61 %65 
                        Private f32* %67 = OpAccessChain %9 %34 
                                             OpStore %67 %66 
                        Private f32* %68 = OpAccessChain %9 %34 
                                 f32 %69 = OpLoad %68 
                        Uniform f32* %71 = OpAccessChain %40 %70 
                                 f32 %72 = OpLoad %71 
                                 f32 %73 = OpFMul %69 %72 
                        Private f32* %74 = OpAccessChain %9 %34 
                                             OpStore %74 %73 
                        Private f32* %75 = OpAccessChain %9 %34 
                                 f32 %76 = OpLoad %75 
                                 f32 %78 = OpExtInst %1 43 %76 %77 %55 
                        Private f32* %79 = OpAccessChain %9 %34 
                                             OpStore %79 %78 
                        Private f32* %80 = OpAccessChain %9 %34 
                                 f32 %81 = OpLoad %80 
                          Input f32* %83 = OpAccessChain %82 %50 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %81 %84 
                        Private f32* %86 = OpAccessChain %9 %50 
                                             OpStore %86 %85 
                               f32_4 %88 = OpLoad %82 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_4 %90 = OpLoad %9 
                               f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                             OpStore %9 %91 
                               f32_4 %92 = OpLoad %9 
                               f32_4 %93 = OpLoad %9 
                               f32_4 %94 = OpFAdd %92 %93 
                                             OpStore %9 %94 
                 read_only Texture2D %97 = OpLoad %96 
                             sampler %99 = OpLoad %98 
         read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                              f32_2 %103 = OpLoad vs_TEXCOORD0 
                              f32_4 %104 = OpImageSampleImplicitLod %100 %103 
                                             OpStore %95 %104 
                              f32_4 %105 = OpLoad %9 
                              f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                              f32_4 %107 = OpLoad %95 
                              f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                              f32_3 %109 = OpFMul %106 %108 
                     Uniform f32_4* %112 = OpAccessChain %40 %110 
                              f32_4 %113 = OpLoad %112 
                              f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              f32_3 %115 = OpFNegate %114 
                              f32_3 %116 = OpFAdd %109 %115 
                              f32_4 %117 = OpLoad %9 
                              f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                             OpStore %9 %118 
                       Private f32* %120 = OpAccessChain %9 %50 
                                f32 %121 = OpLoad %120 
                       Private f32* %122 = OpAccessChain %95 %50 
                                f32 %123 = OpLoad %122 
                                f32 %124 = OpFMul %121 %123 
                                             OpStore %119 %124 
                                f32 %127 = OpLoad %119 
                        Output f32* %129 = OpAccessChain %126 %50 
                                             OpStore %129 %127 
                        Output f32* %130 = OpAccessChain %126 %50 
                                f32 %131 = OpLoad %130 
                                f32 %132 = OpExtInst %1 43 %131 %77 %55 
                        Output f32* %133 = OpAccessChain %126 %50 
                                             OpStore %133 %132 
                                f32 %135 = OpLoad vs_TEXCOORD1 
                                             OpStore %119 %135 
                                f32 %136 = OpLoad %119 
                                f32 %137 = OpExtInst %1 43 %136 %77 %55 
                                             OpStore %119 %137 
                                f32 %138 = OpLoad %119 
                              f32_3 %139 = OpCompositeConstruct %138 %138 %138 
                              f32_4 %140 = OpLoad %9 
                              f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              f32_3 %142 = OpFMul %139 %141 
                     Uniform f32_4* %143 = OpAccessChain %40 %110 
                              f32_4 %144 = OpLoad %143 
                              f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                              f32_3 %146 = OpFAdd %142 %145 
                              f32_4 %147 = OpLoad %126 
                              f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                             OpStore %126 %148 
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
Keywords { "SOFTPARTICLES_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "vulkan " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
""
}
}
}
}
}