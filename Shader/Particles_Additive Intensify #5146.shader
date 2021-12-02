//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Particles/Additive Intensify" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 90)) = 1
_Glow ("Intensity", Range(0, 300)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Overlay" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Overlay" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 41037
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
uniform 	float _Glow;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0.xyz = u_xlat0.xyz * vec3(_Glow);
    vs_COLOR0.w = u_xlat0.w;
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
    SV_Target0 = u_xlat0 * u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 124
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %106 %108 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate vs_TEXCOORD0 Location 106 
                                                      OpDecorate %108 Location 108 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32; f32_4;}* %20 = OpVariable Uniform 
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
                                 Input f32_4* %82 = OpVariable Input 
                                Output f32_4* %87 = OpVariable Output 
                                              %88 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Uniform %6 
                                          u32 %98 = OpConstant 3 
                                              %99 = OpTypePointer Private %6 
                                             %102 = OpTypePointer Output %6 
                                             %104 = OpTypeVector %6 2 
                                             %105 = OpTypePointer Output %104 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %107 = OpTypePointer Input %104 
                                Input f32_2* %108 = OpVariable Input 
                                         i32 %110 = OpConstant 4 
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
                                        f32_4 %83 = OpLoad %82 
                               Uniform f32_4* %84 = OpAccessChain %20 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %83 %85 
                                                      OpStore %9 %86 
                                        f32_4 %89 = OpLoad %9 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                 Uniform f32* %92 = OpAccessChain %20 %44 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpFMul %90 %94 
                                        f32_4 %96 = OpLoad %87 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %87 %97 
                                Private f32* %100 = OpAccessChain %9 %98 
                                         f32 %101 = OpLoad %100 
                                 Output f32* %103 = OpAccessChain %87 %98 
                                                      OpStore %103 %101 
                                       f32_2 %109 = OpLoad %108 
                              Uniform f32_4* %111 = OpAccessChain %20 %110 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_2 %114 = OpFMul %109 %113 
                              Uniform f32_4* %115 = OpAccessChain %20 %110 
                                       f32_4 %116 = OpLoad %115 
                                       f32_2 %117 = OpVectorShuffle %116 %116 2 3 
                                       f32_2 %118 = OpFAdd %114 %117 
                                                      OpStore vs_TEXCOORD0 %118 
                                 Output f32* %119 = OpAccessChain %72 %22 %68 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                 Output f32* %122 = OpAccessChain %72 %22 %68 
                                                      OpStore %122 %121 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 37
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 Location 11 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate vs_TEXCOORD0 Location 28 
                                             OpDecorate %32 Location 32 
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
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
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
                               f32_4 %33 = OpLoad %9 
                               f32_4 %34 = OpLoad %15 
                               f32_4 %35 = OpFMul %33 %34 
                                             OpStore %32 %35 
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
uniform 	float _Glow;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
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
    u_xlat2 = in_COLOR0 * _TintColor;
    vs_COLOR0.xyz = u_xlat2.xyz * vec3(_Glow);
    vs_COLOR0.w = u_xlat2.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat3;
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
    SV_Target0 = u_xlat0 * u_xlat1;
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
; Bound: 195
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %85 %91 %111 %113 %158 
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
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate vs_TEXCOORD0 Location 111 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate vs_TEXCOORD2 Location 158 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %6 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32; f32_4;}* %21 = OpVariable Uniform 
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
                               Private f32_4* %84 = OpVariable Private 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                Output f32_4* %91 = OpVariable Output 
                                              %92 = OpTypeVector %6 3 
                                          i32 %95 = OpConstant 5 
                                              %96 = OpTypePointer Uniform %6 
                                         u32 %103 = OpConstant 3 
                                             %104 = OpTypePointer Private %6 
                                             %107 = OpTypePointer Output %6 
                                             %109 = OpTypeVector %6 2 
                                             %110 = OpTypePointer Output %109 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %112 = OpTypePointer Input %109 
                                Input f32_2* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 6 
                                Private f32* %124 = OpVariable Private 
                                         u32 %127 = OpConstant 2 
                                         u32 %133 = OpConstant 0 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         f32 %171 = OpConstant 3.674022E-40 
                                       f32_2 %176 = OpConstantComposite %171 %171 
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
                                        f32_4 %93 = OpLoad %84 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                 Uniform f32* %97 = OpAccessChain %21 %95 
                                          f32 %98 = OpLoad %97 
                                        f32_3 %99 = OpCompositeConstruct %98 %98 %98 
                                       f32_3 %100 = OpFMul %94 %99 
                                       f32_4 %101 = OpLoad %91 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %91 %102 
                                Private f32* %105 = OpAccessChain %84 %103 
                                         f32 %106 = OpLoad %105 
                                 Output f32* %108 = OpAccessChain %91 %103 
                                                      OpStore %108 %106 
                                       f32_2 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %21 %115 
                                       f32_4 %117 = OpLoad %116 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFMul %114 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %115 
                                       f32_4 %121 = OpLoad %120 
                                       f32_2 %122 = OpVectorShuffle %121 %121 2 3 
                                       f32_2 %123 = OpFAdd %119 %122 
                                                      OpStore vs_TEXCOORD0 %123 
                                Private f32* %125 = OpAccessChain %9 %76 
                                         f32 %126 = OpLoad %125 
                                Uniform f32* %128 = OpAccessChain %21 %36 %23 %127 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %126 %129 
                                                      OpStore %124 %130 
                                Uniform f32* %131 = OpAccessChain %21 %36 %28 %127 
                                         f32 %132 = OpLoad %131 
                                Private f32* %134 = OpAccessChain %9 %133 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFMul %132 %135 
                                         f32 %137 = OpLoad %124 
                                         f32 %138 = OpFAdd %136 %137 
                                Private f32* %139 = OpAccessChain %9 %133 
                                                      OpStore %139 %138 
                                Uniform f32* %140 = OpAccessChain %21 %36 %36 %127 
                                         f32 %141 = OpLoad %140 
                                Private f32* %142 = OpAccessChain %9 %127 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFMul %141 %143 
                                Private f32* %145 = OpAccessChain %9 %133 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFAdd %144 %146 
                                Private f32* %148 = OpAccessChain %9 %133 
                                                      OpStore %148 %147 
                                Uniform f32* %149 = OpAccessChain %21 %36 %45 %127 
                                         f32 %150 = OpLoad %149 
                                Private f32* %151 = OpAccessChain %9 %103 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %150 %152 
                                Private f32* %154 = OpAccessChain %9 %133 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFAdd %153 %155 
                                Private f32* %157 = OpAccessChain %9 %133 
                                                      OpStore %157 %156 
                                Private f32* %159 = OpAccessChain %9 %133 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFNegate %160 
                                 Output f32* %162 = OpAccessChain vs_TEXCOORD2 %127 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %49 %76 
                                         f32 %164 = OpLoad %163 
                                Uniform f32* %165 = OpAccessChain %21 %28 %133 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                Private f32* %168 = OpAccessChain %9 %133 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %9 %133 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpFMul %170 %171 
                                Private f32* %173 = OpAccessChain %9 %103 
                                                      OpStore %173 %172 
                                       f32_4 %174 = OpLoad %49 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 3 
                                       f32_2 %177 = OpFMul %175 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 1 5 3 
                                                      OpStore %9 %179 
                                Private f32* %180 = OpAccessChain %49 %103 
                                         f32 %181 = OpLoad %180 
                                 Output f32* %182 = OpAccessChain vs_TEXCOORD2 %103 
                                                      OpStore %182 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_2 %184 = OpVectorShuffle %183 %183 2 2 
                                       f32_4 %185 = OpLoad %9 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 3 
                                       f32_2 %187 = OpFAdd %184 %186 
                                       f32_4 %188 = OpLoad vs_TEXCOORD2 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %189 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpFNegate %191 
                                 Output f32* %193 = OpAccessChain %80 %28 %76 
                                                      OpStore %193 %192 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 111
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %82 %102 %106 
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
                                             OpDecorate %106 Location 106 
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
                                    %105 = OpTypePointer Output %7 
                      Output f32_4* %106 = OpVariable Output 
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
                              f32_4 %107 = OpLoad %9 
                              f32_4 %108 = OpLoad %95 
                              f32_4 %109 = OpFMul %107 %108 
                                             OpStore %106 %109 
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
uniform 	float _Glow;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0.xyz = u_xlat0.xyz * vec3(_Glow);
    vs_COLOR0.w = u_xlat0.w;
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
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = vs_COLOR0 + vs_COLOR0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.x = vs_TEXCOORD1;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %121 %127 %143 %145 
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
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %77 0 BuiltIn 77 
                                                      OpMemberDecorate %77 1 BuiltIn 77 
                                                      OpMemberDecorate %77 2 BuiltIn 77 
                                                      OpDecorate %77 Block 
                                                      OpDecorate vs_TEXCOORD1 Location 111 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate vs_TEXCOORD0 Location 143 
                                                      OpDecorate %145 Location 145 
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
                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 %6 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %20 = OpVariable Uniform 
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
                                Input f32_4* %121 = OpVariable Input 
                                         i32 %123 = OpConstant 4 
                               Output f32_4* %127 = OpVariable Output 
                                             %128 = OpTypeVector %6 3 
                                         i32 %131 = OpConstant 5 
                                             %141 = OpTypeVector %6 2 
                                             %142 = OpTypePointer Output %141 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %144 = OpTypePointer Input %141 
                                Input f32_2* %145 = OpVariable Input 
                                         i32 %147 = OpConstant 6 
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
                                       f32_4 %122 = OpLoad %121 
                              Uniform f32_4* %124 = OpAccessChain %20 %123 
                                       f32_4 %125 = OpLoad %124 
                                       f32_4 %126 = OpFMul %122 %125 
                                                      OpStore %9 %126 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                Uniform f32* %132 = OpAccessChain %20 %131 
                                         f32 %133 = OpLoad %132 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpFMul %130 %134 
                                       f32_4 %136 = OpLoad %127 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %127 %137 
                                Private f32* %138 = OpAccessChain %9 %117 
                                         f32 %139 = OpLoad %138 
                                 Output f32* %140 = OpAccessChain %127 %117 
                                                      OpStore %140 %139 
                                       f32_2 %146 = OpLoad %145 
                              Uniform f32_4* %148 = OpAccessChain %20 %147 
                                       f32_4 %149 = OpLoad %148 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %151 = OpFMul %146 %150 
                              Uniform f32_4* %152 = OpAccessChain %20 %147 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 3 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD0 %155 
                                 Output f32* %156 = OpAccessChain %79 %27 %75 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %79 %27 %75 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 63
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %28 %35 %48 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %11 Location 11 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate vs_TEXCOORD0 Location 28 
                                             OpDecorate vs_TEXCOORD1 Location 35 
                                             OpDecorate %48 Location 48 
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
                                     %34 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                     %37 = OpTypeInt 32 0 
                                 u32 %38 = OpConstant 0 
                                     %39 = OpTypePointer Private %6 
                                 f32 %43 = OpConstant 3.674022E-40 
                                 f32 %44 = OpConstant 3.674022E-40 
                                     %47 = OpTypePointer Output %7 
                       Output f32_4* %48 = OpVariable Output 
                                     %49 = OpTypeVector %6 3 
                                 u32 %57 = OpConstant 3 
                                     %60 = OpTypePointer Output %6 
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
                                 f32 %36 = OpLoad vs_TEXCOORD1 
                        Private f32* %40 = OpAccessChain %15 %38 
                                             OpStore %40 %36 
                        Private f32* %41 = OpAccessChain %15 %38 
                                 f32 %42 = OpLoad %41 
                                 f32 %45 = OpExtInst %1 43 %42 %43 %44 
                        Private f32* %46 = OpAccessChain %15 %38 
                                             OpStore %46 %45 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                               f32_4 %52 = OpLoad %15 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 0 0 
                               f32_3 %54 = OpFMul %51 %53 
                               f32_4 %55 = OpLoad %48 
                               f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                             OpStore %48 %56 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                         Output f32* %61 = OpAccessChain %48 %57 
                                             OpStore %61 %59 
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
uniform 	float _Glow;
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
vec4 u_xlat2;
float u_xlat3;
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
    u_xlat2 = in_COLOR0 * _TintColor;
    vs_COLOR0.xyz = u_xlat2.xyz * vec3(_Glow);
    vs_COLOR0.w = u_xlat2.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat3;
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
in  float vs_TEXCOORD1;
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
    u_xlat1.x = vs_TEXCOORD1;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 221
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %85 %91 %111 %113 %142 %184 
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
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate vs_TEXCOORD0 Location 111 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate vs_TEXCOORD1 Location 142 
                                                      OpDecorate vs_TEXCOORD2 Location 184 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %21 = OpVariable Uniform 
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
                               Private f32_4* %84 = OpVariable Private 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 5 
                                Output f32_4* %91 = OpVariable Output 
                                              %92 = OpTypeVector %6 3 
                                          i32 %95 = OpConstant 6 
                                              %96 = OpTypePointer Uniform %6 
                                         u32 %103 = OpConstant 3 
                                             %104 = OpTypePointer Private %6 
                                             %107 = OpTypePointer Output %6 
                                             %109 = OpTypeVector %6 2 
                                             %110 = OpTypePointer Output %109 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %112 = OpTypePointer Input %109 
                                Input f32_2* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 7 
                                Private f32* %124 = OpVariable Private 
                                         u32 %125 = OpConstant 2 
                                         f32 %133 = OpConstant 3.674022E-40 
                                         f32 %140 = OpConstant 3.674022E-40 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %144 = OpConstant 4 
                                Private f32* %151 = OpVariable Private 
                                         u32 %159 = OpConstant 0 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         f32 %197 = OpConstant 3.674022E-40 
                                       f32_2 %202 = OpConstantComposite %197 %197 
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
                                        f32_4 %93 = OpLoad %84 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                 Uniform f32* %97 = OpAccessChain %21 %95 
                                          f32 %98 = OpLoad %97 
                                        f32_3 %99 = OpCompositeConstruct %98 %98 %98 
                                       f32_3 %100 = OpFMul %94 %99 
                                       f32_4 %101 = OpLoad %91 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %91 %102 
                                Private f32* %105 = OpAccessChain %84 %103 
                                         f32 %106 = OpLoad %105 
                                 Output f32* %108 = OpAccessChain %91 %103 
                                                      OpStore %108 %106 
                                       f32_2 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %21 %115 
                                       f32_4 %117 = OpLoad %116 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFMul %114 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %115 
                                       f32_4 %121 = OpLoad %120 
                                       f32_2 %122 = OpVectorShuffle %121 %121 2 3 
                                       f32_2 %123 = OpFAdd %119 %122 
                                                      OpStore vs_TEXCOORD0 %123 
                                Private f32* %126 = OpAccessChain %49 %125 
                                         f32 %127 = OpLoad %126 
                                Uniform f32* %128 = OpAccessChain %21 %28 %76 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFDiv %127 %129 
                                                      OpStore %124 %130 
                                         f32 %131 = OpLoad %124 
                                         f32 %132 = OpFNegate %131 
                                         f32 %134 = OpFAdd %132 %133 
                                                      OpStore %124 %134 
                                         f32 %135 = OpLoad %124 
                                Uniform f32* %136 = OpAccessChain %21 %28 %125 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %135 %137 
                                                      OpStore %124 %138 
                                         f32 %139 = OpLoad %124 
                                         f32 %141 = OpExtInst %1 40 %139 %140 
                                                      OpStore %124 %141 
                                         f32 %143 = OpLoad %124 
                                Uniform f32* %145 = OpAccessChain %21 %144 %125 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFMul %143 %146 
                                Uniform f32* %148 = OpAccessChain %21 %144 %103 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFAdd %147 %149 
                                                      OpStore vs_TEXCOORD1 %150 
                                Private f32* %152 = OpAccessChain %9 %76 
                                         f32 %153 = OpLoad %152 
                                Uniform f32* %154 = OpAccessChain %21 %36 %23 %125 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                                      OpStore %151 %156 
                                Uniform f32* %157 = OpAccessChain %21 %36 %28 %125 
                                         f32 %158 = OpLoad %157 
                                Private f32* %160 = OpAccessChain %9 %159 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpFMul %158 %161 
                                         f32 %163 = OpLoad %151 
                                         f32 %164 = OpFAdd %162 %163 
                                Private f32* %165 = OpAccessChain %9 %159 
                                                      OpStore %165 %164 
                                Uniform f32* %166 = OpAccessChain %21 %36 %36 %125 
                                         f32 %167 = OpLoad %166 
                                Private f32* %168 = OpAccessChain %9 %125 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFMul %167 %169 
                                Private f32* %171 = OpAccessChain %9 %159 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %170 %172 
                                Private f32* %174 = OpAccessChain %9 %159 
                                                      OpStore %174 %173 
                                Uniform f32* %175 = OpAccessChain %21 %36 %45 %125 
                                         f32 %176 = OpLoad %175 
                                Private f32* %177 = OpAccessChain %9 %103 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %176 %178 
                                Private f32* %180 = OpAccessChain %9 %159 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFAdd %179 %181 
                                Private f32* %183 = OpAccessChain %9 %159 
                                                      OpStore %183 %182 
                                Private f32* %185 = OpAccessChain %9 %159 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain vs_TEXCOORD2 %125 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %49 %76 
                                         f32 %190 = OpLoad %189 
                                Uniform f32* %191 = OpAccessChain %21 %28 %159 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %190 %192 
                                Private f32* %194 = OpAccessChain %9 %159 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %9 %159 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFMul %196 %197 
                                Private f32* %199 = OpAccessChain %9 %103 
                                                      OpStore %199 %198 
                                       f32_4 %200 = OpLoad %49 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 3 
                                       f32_2 %203 = OpFMul %201 %202 
                                       f32_4 %204 = OpLoad %9 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 1 5 3 
                                                      OpStore %9 %205 
                                Private f32* %206 = OpAccessChain %49 %103 
                                         f32 %207 = OpLoad %206 
                                 Output f32* %208 = OpAccessChain vs_TEXCOORD2 %103 
                                                      OpStore %208 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_2 %210 = OpVectorShuffle %209 %209 2 2 
                                       f32_4 %211 = OpLoad %9 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 3 
                                       f32_2 %213 = OpFAdd %210 %212 
                                       f32_4 %214 = OpLoad vs_TEXCOORD2 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %215 
                                 Output f32* %216 = OpAccessChain %80 %28 %76 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFNegate %217 
                                 Output f32* %219 = OpAccessChain %80 %28 %76 
                                                      OpStore %219 %218 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 129
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %82 %102 %108 %116 
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
                                             OpDecorate %38 Block 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %82 Location 82 
                                             OpDecorate %96 DescriptorSet 96 
                                             OpDecorate %96 Binding 96 
                                             OpDecorate %98 DescriptorSet 98 
                                             OpDecorate %98 Binding 98 
                                             OpDecorate vs_TEXCOORD0 Location 102 
                                             OpDecorate vs_TEXCOORD1 Location 108 
                                             OpDecorate %116 Location 116 
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
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                    %115 = OpTypePointer Output %7 
                      Output f32_4* %116 = OpVariable Output 
                                    %126 = OpTypePointer Output %6 
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
                                f32 %109 = OpLoad vs_TEXCOORD1 
                       Private f32* %110 = OpAccessChain %95 %34 
                                             OpStore %110 %109 
                       Private f32* %111 = OpAccessChain %95 %34 
                                f32 %112 = OpLoad %111 
                                f32 %113 = OpExtInst %1 43 %112 %77 %55 
                       Private f32* %114 = OpAccessChain %95 %34 
                                             OpStore %114 %113 
                              f32_4 %117 = OpLoad %9 
                              f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                              f32_4 %119 = OpLoad %95 
                              f32_3 %120 = OpVectorShuffle %119 %119 0 0 0 
                              f32_3 %121 = OpFMul %118 %120 
                              f32_4 %122 = OpLoad %116 
                              f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                             OpStore %116 %123 
                       Private f32* %124 = OpAccessChain %9 %50 
                                f32 %125 = OpLoad %124 
                        Output f32* %127 = OpAccessChain %116 %50 
                                             OpStore %127 %125 
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