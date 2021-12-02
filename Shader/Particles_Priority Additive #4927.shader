//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Particles/Priority Additive" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 49946
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _TintColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = vs_COLOR0 + vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
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
; Bound: 105
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate vs_TEXCOORD0 Location 87 
                                                     OpDecorate %89 Location 89 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
                                             %99 = OpTypePointer Output %6 
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
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore vs_TEXCOORD0 %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFNegate %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                                     OpStore %103 %102 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %38 %42 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 Location 11 
                                             OpMemberDecorate %13 0 Offset 13 
                                             OpDecorate %13 Block 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate vs_TEXCOORD0 Location 38 
                                             OpDecorate %42 Location 42 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                                     %13 = OpTypeStruct %7 
                                     %14 = OpTypePointer Uniform %13 
            Uniform struct {f32_4;}* %15 = OpVariable Uniform 
                                     %16 = OpTypeInt 32 1 
                                 i32 %17 = OpConstant 0 
                                     %18 = OpTypePointer Uniform %7 
                      Private f32_4* %25 = OpVariable Private 
                                     %26 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %27 = OpTypePointer UniformConstant %26 
UniformConstant read_only Texture2D* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampler 
                                     %31 = OpTypePointer UniformConstant %30 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampledImage %26 
                                     %36 = OpTypeVector %6 2 
                                     %37 = OpTypePointer Input %36 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                      Uniform f32_4* %19 = OpAccessChain %15 %17 
                               f32_4 %20 = OpLoad %19 
                               f32_4 %21 = OpFMul %12 %20 
                                             OpStore %9 %21 
                               f32_4 %22 = OpLoad %9 
                               f32_4 %23 = OpLoad %9 
                               f32_4 %24 = OpFAdd %22 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %29 = OpLoad %28 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %35 = OpSampledImage %29 %33 
                               f32_2 %39 = OpLoad vs_TEXCOORD0 
                               f32_4 %40 = OpImageSampleImplicitLod %35 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpLoad %25 
                               f32_4 %45 = OpFMul %43 %44 
                                             OpStore %42 %45 
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD1.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD1.w = u_xlat1.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _TintColor;
uniform 	float _InvFade;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD1.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat0 = u_xlat0 * _TintColor;
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
; Bound: 177
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %89 %91 %139 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 89 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate vs_TEXCOORD1 Location 139 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
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
                                              %87 = OpTypeVector %6 2 
                                              %88 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %90 = OpTypePointer Input %87 
                                 Input f32_2* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                                             %102 = OpTypePointer Private %6 
                                Private f32* %103 = OpVariable Private 
                                         u32 %106 = OpConstant 2 
                                             %107 = OpTypePointer Uniform %6 
                                         u32 %113 = OpConstant 0 
                                         u32 %131 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %143 = OpTypePointer Output %6 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_2 %158 = OpConstantComposite %153 %153 
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
                                                      OpStore %84 %86 
                                        f32_2 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %92 %96 
                               Uniform f32_4* %98 = OpAccessChain %21 %93 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore vs_TEXCOORD0 %101 
                                Private f32* %104 = OpAccessChain %9 %76 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %108 = OpAccessChain %21 %36 %23 %106 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %105 %109 
                                                      OpStore %103 %110 
                                Uniform f32* %111 = OpAccessChain %21 %36 %28 %106 
                                         f32 %112 = OpLoad %111 
                                Private f32* %114 = OpAccessChain %9 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFMul %112 %115 
                                         f32 %117 = OpLoad %103 
                                         f32 %118 = OpFAdd %116 %117 
                                Private f32* %119 = OpAccessChain %9 %113 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %21 %36 %36 %106 
                                         f32 %121 = OpLoad %120 
                                Private f32* %122 = OpAccessChain %9 %106 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %9 %113 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %9 %113 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %21 %36 %45 %106 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %9 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFMul %130 %133 
                                Private f32* %135 = OpAccessChain %9 %113 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFAdd %134 %136 
                                Private f32* %138 = OpAccessChain %9 %113 
                                                      OpStore %138 %137 
                                Private f32* %140 = OpAccessChain %9 %113 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFNegate %141 
                                 Output f32* %144 = OpAccessChain vs_TEXCOORD1 %106 
                                                      OpStore %144 %142 
                                Private f32* %145 = OpAccessChain %49 %76 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %21 %28 %113 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFMul %146 %148 
                                Private f32* %150 = OpAccessChain %9 %113 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %9 %113 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFMul %152 %153 
                                Private f32* %155 = OpAccessChain %9 %131 
                                                      OpStore %155 %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 3 
                                       f32_2 %159 = OpFMul %157 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 3 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %49 %131 
                                         f32 %163 = OpLoad %162 
                                 Output f32* %164 = OpAccessChain vs_TEXCOORD1 %131 
                                                      OpStore %164 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 2 
                                       f32_4 %167 = OpLoad %9 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 3 
                                       f32_2 %169 = OpFAdd %166 %168 
                                       f32_4 %170 = OpLoad vs_TEXCOORD1 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore vs_TEXCOORD1 %171 
                                 Output f32* %172 = OpAccessChain %80 %28 %76 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                 Output f32* %175 = OpAccessChain %80 %28 %76 
                                                      OpStore %175 %174 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 117
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %82 %108 %112 
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
                                              OpDecorate %38 Block 
                                              OpDecorate %40 DescriptorSet 40 
                                              OpDecorate %40 Binding 40 
                                              OpDecorate %82 Location 82 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate vs_TEXCOORD0 Location 108 
                                              OpDecorate %112 Location 112 
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
                                  i32 %93 = OpConstant 1 
                                      %94 = OpTypePointer Uniform %7 
                      Private f32_4* %101 = OpVariable Private 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                     %107 = OpTypePointer Input %12 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %111 = OpTypePointer Output %7 
                       Output f32_4* %112 = OpVariable Output 
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
                         Private f32* %60 = OpAccessChain %9 %34 
                                  f32 %61 = OpLoad %60 
                           Input f32* %63 = OpAccessChain vs_TEXCOORD1 %43 
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
                       Uniform f32_4* %95 = OpAccessChain %40 %93 
                                f32_4 %96 = OpLoad %95 
                                f32_4 %97 = OpFMul %92 %96 
                                              OpStore %9 %97 
                                f32_4 %98 = OpLoad %9 
                                f32_4 %99 = OpLoad %9 
                               f32_4 %100 = OpFAdd %98 %99 
                                              OpStore %9 %100 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %109 = OpLoad vs_TEXCOORD0 
                               f32_4 %110 = OpImageSampleImplicitLod %106 %109 
                                              OpStore %101 %110 
                               f32_4 %113 = OpLoad %9 
                               f32_4 %114 = OpLoad %101 
                               f32_4 %115 = OpFMul %113 %114 
                                              OpStore %112 %115 
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
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 103046
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
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
 vec4 phase0_Output0_1;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _TintColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
void main()
{
    u_xlat0 = vs_COLOR0 * _TintColor;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlatb1 = 0.00499999989>=u_xlat0.w;
    SV_Target0 = u_xlat0 + u_xlat0;
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 119
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %23 %45 %96 %107 %110 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %23 Location 23 
                                                     OpDecorate %28 ArrayStride 28 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpMemberDecorate %30 0 Offset 30 
                                                     OpMemberDecorate %30 1 Offset 30 
                                                     OpMemberDecorate %30 2 Offset 30 
                                                     OpDecorate %30 Block 
                                                     OpDecorate %32 DescriptorSet 32 
                                                     OpDecorate %32 Binding 32 
                                                     OpDecorate %45 Location 45 
                                                     OpMemberDecorate %94 0 BuiltIn 94 
                                                     OpMemberDecorate %94 1 BuiltIn 94 
                                                     OpMemberDecorate %94 2 BuiltIn 94 
                                                     OpDecorate %94 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 107 
                                                     OpDecorate vs_TEXCOORD1 Location 110 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Output %7 
                                Output f32_4* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                         f32 %14 = OpConstant 3.674022E-40 
                                         f32 %15 = OpConstant 3.674022E-40 
                                             %19 = OpTypePointer Private %7 
                              Private f32_4* %20 = OpVariable Private 
                                             %21 = OpTypeVector %6 3 
                                             %22 = OpTypePointer Input %21 
                                Input f32_3* %23 = OpVariable Input 
                                             %26 = OpTypeInt 32 0 
                                         u32 %27 = OpConstant 4 
                                             %28 = OpTypeArray %7 %27 
                                             %29 = OpTypeArray %7 %27 
                                             %30 = OpTypeStruct %28 %29 %7 
                                             %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %32 = OpVariable Uniform 
                                             %33 = OpTypeInt 32 1 
                                         i32 %34 = OpConstant 2 
                                             %35 = OpTypePointer Uniform %7 
                              Private f32_4* %44 = OpVariable Private 
                                Input f32_3* %45 = OpVariable Input 
                                         i32 %48 = OpConstant 0 
                                         i32 %49 = OpConstant 1 
                                         i32 %68 = OpConstant 3 
                              Private f32_4* %72 = OpVariable Private 
                                         u32 %92 = OpConstant 1 
                                             %93 = OpTypeArray %6 %92 
                                             %94 = OpTypeStruct %7 %6 %93 
                                             %95 = OpTypePointer Output %94 
        Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
                                            %105 = OpTypeVector %6 2 
                                            %106 = OpTypePointer Output %105 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                            %113 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %24 = OpLoad %23 
                                       f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
                              Uniform f32_4* %36 = OpAccessChain %32 %34 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpVectorShuffle %37 %37 0 1 0 1 
                                       f32_4 %39 = OpFMul %25 %38 
                              Uniform f32_4* %40 = OpAccessChain %32 %34 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
                                       f32_4 %43 = OpFAdd %39 %42 
                                                     OpStore %20 %43 
                                       f32_3 %46 = OpLoad %45 
                                       f32_4 %47 = OpVectorShuffle %46 %46 1 1 1 1 
                              Uniform f32_4* %50 = OpAccessChain %32 %48 %49 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpFMul %47 %51 
                                                     OpStore %44 %52 
                              Uniform f32_4* %53 = OpAccessChain %32 %48 %48 
                                       f32_4 %54 = OpLoad %53 
                                       f32_3 %55 = OpLoad %45 
                                       f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                                       f32_4 %57 = OpFMul %54 %56 
                                       f32_4 %58 = OpLoad %44 
                                       f32_4 %59 = OpFAdd %57 %58 
                                                     OpStore %44 %59 
                              Uniform f32_4* %60 = OpAccessChain %32 %48 %34 
                                       f32_4 %61 = OpLoad %60 
                                       f32_3 %62 = OpLoad %45 
                                       f32_4 %63 = OpVectorShuffle %62 %62 2 2 2 2 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %44 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %44 %66 
                                       f32_4 %67 = OpLoad %44 
                              Uniform f32_4* %69 = OpAccessChain %32 %48 %68 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpFAdd %67 %70 
                                                     OpStore %44 %71 
                                       f32_4 %73 = OpLoad %44 
                                       f32_4 %74 = OpVectorShuffle %73 %73 1 1 1 1 
                              Uniform f32_4* %75 = OpAccessChain %32 %49 %49 
                                       f32_4 %76 = OpLoad %75 
                                       f32_4 %77 = OpFMul %74 %76 
                                                     OpStore %72 %77 
                              Uniform f32_4* %78 = OpAccessChain %32 %49 %48 
                                       f32_4 %79 = OpLoad %78 
                                       f32_4 %80 = OpLoad %44 
                                       f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                       f32_4 %82 = OpFMul %79 %81 
                                       f32_4 %83 = OpLoad %72 
                                       f32_4 %84 = OpFAdd %82 %83 
                                                     OpStore %72 %84 
                              Uniform f32_4* %85 = OpAccessChain %32 %49 %34 
                                       f32_4 %86 = OpLoad %85 
                                       f32_4 %87 = OpLoad %44 
                                       f32_4 %88 = OpVectorShuffle %87 %87 2 2 2 2 
                                       f32_4 %89 = OpFMul %86 %88 
                                       f32_4 %90 = OpLoad %72 
                                       f32_4 %91 = OpFAdd %89 %90 
                                                     OpStore %72 %91 
                              Uniform f32_4* %97 = OpAccessChain %32 %49 %68 
                                       f32_4 %98 = OpLoad %97 
                                       f32_4 %99 = OpLoad %44 
                                      f32_4 %100 = OpVectorShuffle %99 %99 3 3 3 3 
                                      f32_4 %101 = OpFMul %98 %100 
                                      f32_4 %102 = OpLoad %72 
                                      f32_4 %103 = OpFAdd %101 %102 
                              Output f32_4* %104 = OpAccessChain %96 %48 
                                                     OpStore %104 %103 
                                      f32_4 %108 = OpLoad %20 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                                     OpStore vs_TEXCOORD0 %109 
                                      f32_4 %111 = OpLoad %20 
                                      f32_2 %112 = OpVectorShuffle %111 %111 2 3 
                                                     OpStore vs_TEXCOORD1 %112 
                                Output f32* %114 = OpAccessChain %96 %48 %92 
                                        f32 %115 = OpLoad %114 
                                        f32 %116 = OpFNegate %115 
                                Output f32* %117 = OpAccessChain %96 %48 %92 
                                                     OpStore %117 %116 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %35 %52 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %11 Location 11 
                                             OpMemberDecorate %13 0 Offset 13 
                                             OpDecorate %13 Block 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate vs_TEXCOORD1 Location 35 
                                             OpDecorate %52 Location 52 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                                     %13 = OpTypeStruct %7 
                                     %14 = OpTypePointer Uniform %13 
            Uniform struct {f32_4;}* %15 = OpVariable Uniform 
                                     %16 = OpTypeInt 32 1 
                                 i32 %17 = OpConstant 0 
                                     %18 = OpTypePointer Uniform %7 
                      Private f32_4* %22 = OpVariable Private 
                                     %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampler 
                                     %28 = OpTypePointer UniformConstant %27 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %31 = OpTypeSampledImage %23 
                                     %33 = OpTypeVector %6 2 
                                     %34 = OpTypePointer Input %33 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %41 = OpTypeBool 
                                     %42 = OpTypePointer Private %41 
                       Private bool* %43 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                     %45 = OpTypeInt 32 0 
                                 u32 %46 = OpConstant 3 
                                     %47 = OpTypePointer Private %6 
                                     %51 = OpTypePointer Output %7 
                       Output f32_4* %52 = OpVariable Output 
                                 i32 %57 = OpConstant 1 
                                 i32 %59 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                      Uniform f32_4* %19 = OpAccessChain %15 %17 
                               f32_4 %20 = OpLoad %19 
                               f32_4 %21 = OpFMul %12 %20 
                                             OpStore %9 %21 
                 read_only Texture2D %26 = OpLoad %25 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %32 = OpSampledImage %26 %30 
                               f32_2 %36 = OpLoad vs_TEXCOORD1 
                               f32_4 %37 = OpImageSampleImplicitLod %32 %36 
                                             OpStore %22 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_4 %39 = OpLoad %22 
                               f32_4 %40 = OpFMul %38 %39 
                                             OpStore %9 %40 
                        Private f32* %48 = OpAccessChain %9 %46 
                                 f32 %49 = OpLoad %48 
                                bool %50 = OpFOrdGreaterThanEqual %44 %49 
                                             OpStore %43 %50 
                               f32_4 %53 = OpLoad %9 
                               f32_4 %54 = OpLoad %9 
                               f32_4 %55 = OpFAdd %53 %54 
                                             OpStore %52 %55 
                                bool %56 = OpLoad %43 
                                 i32 %58 = OpSelect %56 %57 %17 
                                 i32 %60 = OpIMul %58 %59 
                                bool %61 = OpINotEqual %60 %17 
                                             OpSelectionMerge %63 None 
                                             OpBranchConditional %61 %62 %63 
                                     %62 = OpLabel 
                                             OpKill
                                     %63 = OpLabel 
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
 vec4 phase0_Output0_1;
out vec2 vs_TEXCOORD1;
out float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    vs_TEXCOORD2 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD2 = clamp(vs_TEXCOORD2, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _TintColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat6;
void main()
{
    u_xlat0 = vs_COLOR0 * _TintColor;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlatb1 = 0.00499999989>=u_xlat0.w;
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    u_xlat6 = u_xlat0.w + u_xlat0.w;
    SV_Target0.w = u_xlat6;
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat0.xyz + unity_FogColor.xyz;
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
; Bound: 361
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %11 %23 %97 %279 %339 %350 %353 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate vs_TEXCOORD2 Location 279 
                                                      OpMemberDecorate %337 0 BuiltIn 337 
                                                      OpMemberDecorate %337 1 BuiltIn 337 
                                                      OpMemberDecorate %337 2 BuiltIn 337 
                                                      OpDecorate %337 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 350 
                                                      OpDecorate vs_TEXCOORD1 Location 353 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %19 = OpTypePointer Private %7 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                              %22 = OpTypePointer Input %21 
                                 Input f32_3* %23 = OpVariable Input 
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeArray %7 %27 
                                              %31 = OpTypeStruct %28 %29 %30 %7 %7 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 4 
                                              %36 = OpTypePointer Uniform %7 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %46 = OpConstant 0 
                                          i32 %47 = OpConstant 1 
                                          i32 %69 = OpConstant 2 
                                          i32 %82 = OpConstant 3 
                                 Input f32_3* %97 = OpVariable Input 
                              Private f32_4* %103 = OpVariable Private 
                                         u32 %271 = OpConstant 0 
                                             %272 = OpTypePointer Private %6 
                                             %278 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %282 = OpConstant 2 
                                             %283 = OpTypePointer Uniform %6 
                                         u32 %287 = OpConstant 3 
                                         u32 %335 = OpConstant 1 
                                             %336 = OpTypeArray %6 %335 
                                             %337 = OpTypeStruct %7 %6 %336 
                                             %338 = OpTypePointer Output %337 
        Output struct {f32_4; f32; f32[1];}* %339 = OpVariable Output 
                                             %348 = OpTypeVector %6 2 
                                             %349 = OpTypePointer Output %348 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                                      OpStore %9 %12 
                                        f32_4 %13 = OpLoad %9 
                                        f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                        f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                        f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                      OpStore %9 %18 
                                        f32_3 %24 = OpLoad %23 
                                        f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
                               Uniform f32_4* %37 = OpAccessChain %33 %35 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpVectorShuffle %38 %38 0 1 0 1 
                                        f32_4 %40 = OpFMul %25 %39 
                               Uniform f32_4* %41 = OpAccessChain %33 %35 
                                        f32_4 %42 = OpLoad %41 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 3 2 3 
                                        f32_4 %44 = OpFAdd %40 %43 
                                                      OpStore %20 %44 
                               Uniform f32_4* %48 = OpAccessChain %33 %46 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %33 %47 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFMul %50 %53 
                                        f32_4 %55 = OpLoad %45 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %45 %56 
                               Uniform f32_4* %57 = OpAccessChain %33 %47 %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                               Uniform f32_4* %60 = OpAccessChain %33 %46 %47 
                                        f32_4 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                        f32_3 %63 = OpFMul %59 %62 
                                        f32_4 %64 = OpLoad %45 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %63 %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                      OpStore %45 %68 
                               Uniform f32_4* %70 = OpAccessChain %33 %47 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                               Uniform f32_4* %73 = OpAccessChain %33 %46 %47 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 2 2 2 
                                        f32_3 %76 = OpFMul %72 %75 
                                        f32_4 %77 = OpLoad %45 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFAdd %76 %78 
                                        f32_4 %80 = OpLoad %45 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %45 %81 
                               Uniform f32_4* %83 = OpAccessChain %33 %47 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %86 = OpAccessChain %33 %46 %47 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 3 3 3 
                                        f32_3 %89 = OpFMul %85 %88 
                                        f32_4 %90 = OpLoad %45 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFAdd %89 %91 
                                        f32_4 %93 = OpLoad %45 
                                        f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                                      OpStore %45 %94 
                                        f32_4 %95 = OpLoad %45 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 1 1 1 
                                       f32_3 %100 = OpFMul %96 %99 
                                       f32_4 %101 = OpLoad %45 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %45 %102 
                              Uniform f32_4* %104 = OpAccessChain %33 %46 %46 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 1 1 1 
                              Uniform f32_4* %107 = OpAccessChain %33 %47 %47 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %103 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %103 %112 
                              Uniform f32_4* %113 = OpAccessChain %33 %47 %46 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_4* %116 = OpAccessChain %33 %46 %46 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 0 0 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %103 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFAdd %119 %121 
                                       f32_4 %123 = OpLoad %103 
                                       f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                                      OpStore %103 %124 
                              Uniform f32_4* %125 = OpAccessChain %33 %47 %69 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                              Uniform f32_4* %128 = OpAccessChain %33 %46 %46 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 2 2 2 
                                       f32_3 %131 = OpFMul %127 %130 
                                       f32_4 %132 = OpLoad %103 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %103 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %103 %136 
                              Uniform f32_4* %137 = OpAccessChain %33 %47 %82 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                              Uniform f32_4* %140 = OpAccessChain %33 %46 %46 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 3 3 3 
                                       f32_3 %143 = OpFMul %139 %142 
                                       f32_4 %144 = OpLoad %103 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFAdd %143 %145 
                                       f32_4 %147 = OpLoad %103 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %103 %148 
                                       f32_4 %149 = OpLoad %103 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpLoad %97 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 0 0 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %45 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad %45 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %45 %158 
                              Uniform f32_4* %159 = OpAccessChain %33 %46 %69 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 1 1 1 
                              Uniform f32_4* %162 = OpAccessChain %33 %47 %47 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFMul %161 %164 
                                       f32_4 %166 = OpLoad %103 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %103 %167 
                              Uniform f32_4* %168 = OpAccessChain %33 %47 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %33 %46 %69 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad %103 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %103 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %103 %179 
                              Uniform f32_4* %180 = OpAccessChain %33 %47 %69 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_4* %183 = OpAccessChain %33 %46 %69 
                                       f32_4 %184 = OpLoad %183 
                                       f32_3 %185 = OpVectorShuffle %184 %184 2 2 2 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %103 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %186 %188 
                                       f32_4 %190 = OpLoad %103 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %103 %191 
                              Uniform f32_4* %192 = OpAccessChain %33 %47 %82 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_4* %195 = OpAccessChain %33 %46 %69 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 3 3 3 
                                       f32_3 %198 = OpFMul %194 %197 
                                       f32_4 %199 = OpLoad %103 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_3 %201 = OpFAdd %198 %200 
                                       f32_4 %202 = OpLoad %103 
                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
                                                      OpStore %103 %203 
                                       f32_4 %204 = OpLoad %103 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %97 
                                       f32_3 %207 = OpVectorShuffle %206 %206 2 2 2 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %45 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %45 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                                      OpStore %45 %213 
                              Uniform f32_4* %214 = OpAccessChain %33 %46 %82 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 1 1 1 
                              Uniform f32_4* %217 = OpAccessChain %33 %47 %47 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_4 %221 = OpLoad %103 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                                      OpStore %103 %222 
                              Uniform f32_4* %223 = OpAccessChain %33 %47 %46 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %33 %46 %82 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 0 0 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_4 %230 = OpLoad %103 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %232 = OpFAdd %229 %231 
                                       f32_4 %233 = OpLoad %103 
                                       f32_4 %234 = OpVectorShuffle %233 %232 4 5 6 3 
                                                      OpStore %103 %234 
                              Uniform f32_4* %235 = OpAccessChain %33 %47 %69 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %33 %46 %82 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 2 2 2 
                                       f32_3 %241 = OpFMul %237 %240 
                                       f32_4 %242 = OpLoad %103 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpFAdd %241 %243 
                                       f32_4 %245 = OpLoad %103 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                      OpStore %103 %246 
                              Uniform f32_4* %247 = OpAccessChain %33 %47 %82 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                              Uniform f32_4* %250 = OpAccessChain %33 %46 %82 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 3 3 3 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_4 %254 = OpLoad %103 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %103 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %103 %258 
                                       f32_4 %259 = OpLoad %45 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_4 %261 = OpLoad %103 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFAdd %260 %262 
                                       f32_4 %264 = OpLoad %45 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %45 %265 
                                       f32_4 %266 = OpLoad %45 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_4 %268 = OpLoad %45 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                         f32 %270 = OpDot %267 %269 
                                Private f32* %273 = OpAccessChain %45 %271 
                                                      OpStore %273 %270 
                                Private f32* %274 = OpAccessChain %45 %271 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpExtInst %1 31 %275 
                                Private f32* %277 = OpAccessChain %45 %271 
                                                      OpStore %277 %276 
                                Private f32* %280 = OpAccessChain %45 %271 
                                         f32 %281 = OpLoad %280 
                                Uniform f32* %284 = OpAccessChain %33 %82 %282 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFMul %281 %285 
                                Uniform f32* %288 = OpAccessChain %33 %82 %287 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFAdd %286 %289 
                                                      OpStore vs_TEXCOORD2 %290 
                                         f32 %291 = OpLoad vs_TEXCOORD2 
                                         f32 %292 = OpExtInst %1 43 %291 %14 %15 
                                                      OpStore vs_TEXCOORD2 %292 
                                       f32_3 %293 = OpLoad %97 
                                       f32_4 %294 = OpVectorShuffle %293 %293 1 1 1 1 
                              Uniform f32_4* %295 = OpAccessChain %33 %46 %47 
                                       f32_4 %296 = OpLoad %295 
                                       f32_4 %297 = OpFMul %294 %296 
                                                      OpStore %45 %297 
                              Uniform f32_4* %298 = OpAccessChain %33 %46 %46 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpLoad %97 
                                       f32_4 %301 = OpVectorShuffle %300 %300 0 0 0 0 
                                       f32_4 %302 = OpFMul %299 %301 
                                       f32_4 %303 = OpLoad %45 
                                       f32_4 %304 = OpFAdd %302 %303 
                                                      OpStore %45 %304 
                              Uniform f32_4* %305 = OpAccessChain %33 %46 %69 
                                       f32_4 %306 = OpLoad %305 
                                       f32_3 %307 = OpLoad %97 
                                       f32_4 %308 = OpVectorShuffle %307 %307 2 2 2 2 
                                       f32_4 %309 = OpFMul %306 %308 
                                       f32_4 %310 = OpLoad %45 
                                       f32_4 %311 = OpFAdd %309 %310 
                                                      OpStore %45 %311 
                                       f32_4 %312 = OpLoad %45 
                              Uniform f32_4* %313 = OpAccessChain %33 %46 %82 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpFAdd %312 %314 
                                                      OpStore %45 %315 
                                       f32_4 %316 = OpLoad %45 
                                       f32_4 %317 = OpVectorShuffle %316 %316 1 1 1 1 
                              Uniform f32_4* %318 = OpAccessChain %33 %69 %47 
                                       f32_4 %319 = OpLoad %318 
                                       f32_4 %320 = OpFMul %317 %319 
                                                      OpStore %103 %320 
                              Uniform f32_4* %321 = OpAccessChain %33 %69 %46 
                                       f32_4 %322 = OpLoad %321 
                                       f32_4 %323 = OpLoad %45 
                                       f32_4 %324 = OpVectorShuffle %323 %323 0 0 0 0 
                                       f32_4 %325 = OpFMul %322 %324 
                                       f32_4 %326 = OpLoad %103 
                                       f32_4 %327 = OpFAdd %325 %326 
                                                      OpStore %103 %327 
                              Uniform f32_4* %328 = OpAccessChain %33 %69 %69 
                                       f32_4 %329 = OpLoad %328 
                                       f32_4 %330 = OpLoad %45 
                                       f32_4 %331 = OpVectorShuffle %330 %330 2 2 2 2 
                                       f32_4 %332 = OpFMul %329 %331 
                                       f32_4 %333 = OpLoad %103 
                                       f32_4 %334 = OpFAdd %332 %333 
                                                      OpStore %103 %334 
                              Uniform f32_4* %340 = OpAccessChain %33 %69 %82 
                                       f32_4 %341 = OpLoad %340 
                                       f32_4 %342 = OpLoad %45 
                                       f32_4 %343 = OpVectorShuffle %342 %342 3 3 3 3 
                                       f32_4 %344 = OpFMul %341 %343 
                                       f32_4 %345 = OpLoad %103 
                                       f32_4 %346 = OpFAdd %344 %345 
                               Output f32_4* %347 = OpAccessChain %339 %46 
                                                      OpStore %347 %346 
                                       f32_4 %351 = OpLoad %20 
                                       f32_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore vs_TEXCOORD0 %352 
                                       f32_4 %354 = OpLoad %20 
                                       f32_2 %355 = OpVectorShuffle %354 %354 2 3 
                                                      OpStore vs_TEXCOORD1 %355 
                                 Output f32* %356 = OpAccessChain %339 %46 %335 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFNegate %357 
                                 Output f32* %359 = OpAccessChain %339 %46 %335 
                                                      OpStore %359 %358 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 98
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %35 %80 %85 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpDecorate %11 Location 11 
                                             OpMemberDecorate %13 0 Offset 13 
                                             OpMemberDecorate %13 1 Offset 13 
                                             OpDecorate %13 Block 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate vs_TEXCOORD1 Location 35 
                                             OpDecorate %80 Location 80 
                                             OpDecorate vs_TEXCOORD2 Location 85 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                                     %13 = OpTypeStruct %7 %7 
                                     %14 = OpTypePointer Uniform %13 
     Uniform struct {f32_4; f32_4;}* %15 = OpVariable Uniform 
                                     %16 = OpTypeInt 32 1 
                                 i32 %17 = OpConstant 1 
                                     %18 = OpTypePointer Uniform %7 
                      Private f32_4* %22 = OpVariable Private 
                                     %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampler 
                                     %28 = OpTypePointer UniformConstant %27 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %31 = OpTypeSampledImage %23 
                                     %33 = OpTypeVector %6 2 
                                     %34 = OpTypePointer Input %33 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %41 = OpTypeBool 
                                     %42 = OpTypePointer Private %41 
                       Private bool* %43 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                     %45 = OpTypeInt 32 0 
                                 u32 %46 = OpConstant 3 
                                     %47 = OpTypePointer Private %6 
                                 i32 %52 = OpConstant 0 
                                 i32 %54 = OpConstant -1 
                                     %60 = OpTypeVector %6 3 
                                 f32 %63 = OpConstant 3.674022E-40 
                               f32_3 %64 = OpConstantComposite %63 %63 %63 
                        Private f32* %73 = OpVariable Private 
                                     %79 = OpTypePointer Output %7 
                       Output f32_4* %80 = OpVariable Output 
                                     %82 = OpTypePointer Output %6 
                                     %84 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD2 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                      Uniform f32_4* %19 = OpAccessChain %15 %17 
                               f32_4 %20 = OpLoad %19 
                               f32_4 %21 = OpFMul %12 %20 
                                             OpStore %9 %21 
                 read_only Texture2D %26 = OpLoad %25 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %32 = OpSampledImage %26 %30 
                               f32_2 %36 = OpLoad vs_TEXCOORD1 
                               f32_4 %37 = OpImageSampleImplicitLod %32 %36 
                                             OpStore %22 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_4 %39 = OpLoad %22 
                               f32_4 %40 = OpFMul %38 %39 
                                             OpStore %9 %40 
                        Private f32* %48 = OpAccessChain %9 %46 
                                 f32 %49 = OpLoad %48 
                                bool %50 = OpFOrdGreaterThanEqual %44 %49 
                                             OpStore %43 %50 
                                bool %51 = OpLoad %43 
                                 i32 %53 = OpSelect %51 %17 %52 
                                 i32 %55 = OpIMul %53 %54 
                                bool %56 = OpINotEqual %55 %52 
                                             OpSelectionMerge %58 None 
                                             OpBranchConditional %56 %57 %58 
                                     %57 = OpLabel 
                                             OpKill
                                     %58 = OpLabel 
                               f32_4 %61 = OpLoad %9 
                               f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                               f32_3 %65 = OpFMul %62 %64 
                      Uniform f32_4* %66 = OpAccessChain %15 %52 
                               f32_4 %67 = OpLoad %66 
                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               f32_3 %69 = OpFNegate %68 
                               f32_3 %70 = OpFAdd %65 %69 
                               f32_4 %71 = OpLoad %9 
                               f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                             OpStore %9 %72 
                        Private f32* %74 = OpAccessChain %9 %46 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %9 %46 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFAdd %75 %77 
                                             OpStore %73 %78 
                                 f32 %81 = OpLoad %73 
                         Output f32* %83 = OpAccessChain %80 %46 
                                             OpStore %83 %81 
                                 f32 %86 = OpLoad vs_TEXCOORD2 
                               f32_3 %87 = OpCompositeConstruct %86 %86 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_3 %90 = OpFMul %87 %89 
                      Uniform f32_4* %91 = OpAccessChain %15 %52 
                               f32_4 %92 = OpLoad %91 
                               f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                               f32_3 %94 = OpFAdd %90 %93 
                               f32_4 %95 = OpLoad %80 
                               f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                             OpStore %80 %96 
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
Keywords { "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 161363
Program "vp" {
SubProgram "d3d11 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    vs_TEXCOORD1 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat0.w * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat0.xyz + unity_FogColor.xyz;
    u_xlatb0 = 0.00999999978>=u_xlat3;
    SV_Target0.w = u_xlat3;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
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
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %11 %84 %266 %282 %283 %341 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate vs_TEXCOORD1 Location 266 
                                                      OpDecorate vs_TEXCOORD0 Location 282 
                                                      OpDecorate %283 Location 283 
                                                      OpMemberDecorate %339 0 BuiltIn 339 
                                                      OpMemberDecorate %339 1 BuiltIn 339 
                                                      OpMemberDecorate %339 2 BuiltIn 339 
                                                      OpDecorate %339 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %19 = OpTypePointer Private %7 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeArray %7 %22 
                                              %25 = OpTypeArray %7 %22 
                                              %26 = OpTypeStruct %23 %24 %25 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 0 
                                          i32 %31 = OpConstant 1 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypePointer Uniform %7 
                                          i32 %55 = OpConstant 2 
                                          i32 %68 = OpConstant 3 
                                              %83 = OpTypePointer Input %32 
                                 Input f32_3* %84 = OpVariable Input 
                               Private f32_4* %90 = OpVariable Private 
                                         u32 %258 = OpConstant 0 
                                             %259 = OpTypePointer Private %6 
                                             %265 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %269 = OpConstant 2 
                                             %270 = OpTypePointer Uniform %6 
                                         u32 %274 = OpConstant 3 
                                             %280 = OpTypeVector %6 2 
                                             %281 = OpTypePointer Output %280 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %283 = OpVariable Input 
                                         i32 %286 = OpConstant 4 
                                         u32 %337 = OpConstant 1 
                                             %338 = OpTypeArray %6 %337 
                                             %339 = OpTypeStruct %7 %6 %338 
                                             %340 = OpTypePointer Output %339 
        Output struct {f32_4; f32; f32[1];}* %341 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                                      OpStore %9 %12 
                                        f32_4 %13 = OpLoad %9 
                                        f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                        f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                        f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                      OpStore %9 %18 
                               Uniform f32_4* %34 = OpAccessChain %28 %30 %31 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %28 %31 %31 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %36 %39 
                                        f32_4 %41 = OpLoad %20 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %20 %42 
                               Uniform f32_4* %43 = OpAccessChain %28 %31 %30 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                               Uniform f32_4* %46 = OpAccessChain %28 %30 %31 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %45 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %20 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %20 %54 
                               Uniform f32_4* %56 = OpAccessChain %28 %31 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                               Uniform f32_4* %59 = OpAccessChain %28 %30 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 2 2 2 
                                        f32_3 %62 = OpFMul %58 %61 
                                        f32_4 %63 = OpLoad %20 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %62 %64 
                                        f32_4 %66 = OpLoad %20 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %20 %67 
                               Uniform f32_4* %69 = OpAccessChain %28 %31 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                               Uniform f32_4* %72 = OpAccessChain %28 %30 %31 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 3 3 3 
                                        f32_3 %75 = OpFMul %71 %74 
                                        f32_4 %76 = OpLoad %20 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %20 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %20 %80 
                                        f32_4 %81 = OpLoad %20 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                                        f32_3 %87 = OpFMul %82 %86 
                                        f32_4 %88 = OpLoad %20 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %20 %89 
                               Uniform f32_4* %91 = OpAccessChain %28 %30 %30 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %28 %31 %31 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %90 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %90 %99 
                              Uniform f32_4* %100 = OpAccessChain %28 %31 %30 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %28 %30 %30 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %90 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %90 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %90 %111 
                              Uniform f32_4* %112 = OpAccessChain %28 %31 %55 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %28 %30 %30 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 2 2 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %90 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %90 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %90 %123 
                              Uniform f32_4* %124 = OpAccessChain %28 %31 %68 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %28 %30 %30 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 3 3 3 
                                       f32_3 %130 = OpFMul %126 %129 
                                       f32_4 %131 = OpLoad %90 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %90 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %90 %135 
                                       f32_4 %136 = OpLoad %90 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %84 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %20 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %20 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %20 %145 
                              Uniform f32_4* %146 = OpAccessChain %28 %30 %55 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 1 1 1 
                              Uniform f32_4* %149 = OpAccessChain %28 %31 %31 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %90 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %90 %154 
                              Uniform f32_4* %155 = OpAccessChain %28 %31 %30 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_4* %158 = OpAccessChain %28 %30 %55 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %90 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFAdd %161 %163 
                                       f32_4 %165 = OpLoad %90 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %90 %166 
                              Uniform f32_4* %167 = OpAccessChain %28 %31 %55 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %28 %30 %55 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 2 2 2 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_4 %174 = OpLoad %90 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFAdd %173 %175 
                                       f32_4 %177 = OpLoad %90 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %90 %178 
                              Uniform f32_4* %179 = OpAccessChain %28 %31 %68 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %28 %30 %55 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 3 3 3 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_4 %186 = OpLoad %90 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                       f32_3 %188 = OpFAdd %185 %187 
                                       f32_4 %189 = OpLoad %90 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 6 3 
                                                      OpStore %90 %190 
                                       f32_4 %191 = OpLoad %90 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                       f32_3 %193 = OpLoad %84 
                                       f32_3 %194 = OpVectorShuffle %193 %193 2 2 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %20 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpFAdd %195 %197 
                                       f32_4 %199 = OpLoad %20 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
                                                      OpStore %20 %200 
                              Uniform f32_4* %201 = OpAccessChain %28 %30 %68 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                              Uniform f32_4* %204 = OpAccessChain %28 %31 %31 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                                       f32_3 %207 = OpFMul %203 %206 
                                       f32_4 %208 = OpLoad %90 
                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
                                                      OpStore %90 %209 
                              Uniform f32_4* %210 = OpAccessChain %28 %31 %30 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                              Uniform f32_4* %213 = OpAccessChain %28 %30 %68 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 0 0 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_4 %217 = OpLoad %90 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %90 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %90 %221 
                              Uniform f32_4* %222 = OpAccessChain %28 %31 %55 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                              Uniform f32_4* %225 = OpAccessChain %28 %30 %68 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 2 2 2 
                                       f32_3 %228 = OpFMul %224 %227 
                                       f32_4 %229 = OpLoad %90 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_3 %231 = OpFAdd %228 %230 
                                       f32_4 %232 = OpLoad %90 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
                                                      OpStore %90 %233 
                              Uniform f32_4* %234 = OpAccessChain %28 %31 %68 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                              Uniform f32_4* %237 = OpAccessChain %28 %30 %68 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 3 3 3 
                                       f32_3 %240 = OpFMul %236 %239 
                                       f32_4 %241 = OpLoad %90 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFAdd %240 %242 
                                       f32_4 %244 = OpLoad %90 
                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                      OpStore %90 %245 
                                       f32_4 %246 = OpLoad %20 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_4 %248 = OpLoad %90 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFAdd %247 %249 
                                       f32_4 %251 = OpLoad %20 
                                       f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
                                                      OpStore %20 %252 
                                       f32_4 %253 = OpLoad %20 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_4 %255 = OpLoad %20 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                         f32 %257 = OpDot %254 %256 
                                Private f32* %260 = OpAccessChain %20 %258 
                                                      OpStore %260 %257 
                                Private f32* %261 = OpAccessChain %20 %258 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpExtInst %1 31 %262 
                                Private f32* %264 = OpAccessChain %20 %258 
                                                      OpStore %264 %263 
                                Private f32* %267 = OpAccessChain %20 %258 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %271 = OpAccessChain %28 %68 %269 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFMul %268 %272 
                                Uniform f32* %275 = OpAccessChain %28 %68 %274 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFAdd %273 %276 
                                                      OpStore vs_TEXCOORD1 %277 
                                         f32 %278 = OpLoad vs_TEXCOORD1 
                                         f32 %279 = OpExtInst %1 43 %278 %14 %15 
                                                      OpStore vs_TEXCOORD1 %279 
                                       f32_3 %284 = OpLoad %283 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 1 
                              Uniform f32_4* %287 = OpAccessChain %28 %286 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 0 1 
                                       f32_2 %290 = OpFMul %285 %289 
                              Uniform f32_4* %291 = OpAccessChain %28 %286 
                                       f32_4 %292 = OpLoad %291 
                                       f32_2 %293 = OpVectorShuffle %292 %292 2 3 
                                       f32_2 %294 = OpFAdd %290 %293 
                                                      OpStore vs_TEXCOORD0 %294 
                                       f32_3 %295 = OpLoad %84 
                                       f32_4 %296 = OpVectorShuffle %295 %295 1 1 1 1 
                              Uniform f32_4* %297 = OpAccessChain %28 %30 %31 
                                       f32_4 %298 = OpLoad %297 
                                       f32_4 %299 = OpFMul %296 %298 
                                                      OpStore %20 %299 
                              Uniform f32_4* %300 = OpAccessChain %28 %30 %30 
                                       f32_4 %301 = OpLoad %300 
                                       f32_3 %302 = OpLoad %84 
                                       f32_4 %303 = OpVectorShuffle %302 %302 0 0 0 0 
                                       f32_4 %304 = OpFMul %301 %303 
                                       f32_4 %305 = OpLoad %20 
                                       f32_4 %306 = OpFAdd %304 %305 
                                                      OpStore %20 %306 
                              Uniform f32_4* %307 = OpAccessChain %28 %30 %55 
                                       f32_4 %308 = OpLoad %307 
                                       f32_3 %309 = OpLoad %84 
                                       f32_4 %310 = OpVectorShuffle %309 %309 2 2 2 2 
                                       f32_4 %311 = OpFMul %308 %310 
                                       f32_4 %312 = OpLoad %20 
                                       f32_4 %313 = OpFAdd %311 %312 
                                                      OpStore %20 %313 
                                       f32_4 %314 = OpLoad %20 
                              Uniform f32_4* %315 = OpAccessChain %28 %30 %68 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpFAdd %314 %316 
                                                      OpStore %20 %317 
                                       f32_4 %318 = OpLoad %20 
                                       f32_4 %319 = OpVectorShuffle %318 %318 1 1 1 1 
                              Uniform f32_4* %320 = OpAccessChain %28 %55 %31 
                                       f32_4 %321 = OpLoad %320 
                                       f32_4 %322 = OpFMul %319 %321 
                                                      OpStore %90 %322 
                              Uniform f32_4* %323 = OpAccessChain %28 %55 %30 
                                       f32_4 %324 = OpLoad %323 
                                       f32_4 %325 = OpLoad %20 
                                       f32_4 %326 = OpVectorShuffle %325 %325 0 0 0 0 
                                       f32_4 %327 = OpFMul %324 %326 
                                       f32_4 %328 = OpLoad %90 
                                       f32_4 %329 = OpFAdd %327 %328 
                                                      OpStore %90 %329 
                              Uniform f32_4* %330 = OpAccessChain %28 %55 %55 
                                       f32_4 %331 = OpLoad %330 
                                       f32_4 %332 = OpLoad %20 
                                       f32_4 %333 = OpVectorShuffle %332 %332 2 2 2 2 
                                       f32_4 %334 = OpFMul %331 %333 
                                       f32_4 %335 = OpLoad %90 
                                       f32_4 %336 = OpFAdd %334 %335 
                                                      OpStore %90 %336 
                              Uniform f32_4* %342 = OpAccessChain %28 %55 %68 
                                       f32_4 %343 = OpLoad %342 
                                       f32_4 %344 = OpLoad %20 
                                       f32_4 %345 = OpVectorShuffle %344 %344 3 3 3 3 
                                       f32_4 %346 = OpFMul %343 %345 
                                       f32_4 %347 = OpLoad %90 
                                       f32_4 %348 = OpFAdd %346 %347 
                               Output f32_4* %349 = OpAccessChain %341 %30 
                                                      OpStore %349 %348 
                                 Output f32* %350 = OpAccessChain %341 %30 %337 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFNegate %351 
                                 Output f32* %353 = OpAccessChain %341 %30 %337 
                                                      OpStore %353 %352 
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
                                             OpEntryPoint Fragment %4 "main" %22 %32 %57 %58 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %32 Location 32 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %57 Location 57 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypePointer Input %7 
                        Input f32_4* %32 = OpVariable Input 
                                     %33 = OpTypePointer Input %6 
                                     %37 = OpTypeVector %6 3 
                                     %43 = OpTypeStruct %7 
                                     %44 = OpTypePointer Uniform %43 
            Uniform struct {f32_4;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %7 
                                     %56 = OpTypePointer Output %7 
                       Output f32_4* %57 = OpVariable Output 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                     %70 = OpTypeBool 
                                     %71 = OpTypePointer Private %70 
                       Private bool* %72 = OpVariable Private 
                                 f32 %73 = OpConstant 3.674022E-40 
                                     %77 = OpTypePointer Output %6 
                                 i32 %80 = OpConstant 1 
                                 i32 %82 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                          Input f32* %34 = OpAccessChain %32 %28 
                                 f32 %35 = OpLoad %34 
                                 f32 %36 = OpFMul %30 %35 
                                             OpStore %26 %36 
                               f32_4 %38 = OpLoad %9 
                               f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                               f32_4 %40 = OpLoad %32 
                               f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               f32_3 %42 = OpFMul %39 %41 
                      Uniform f32_4* %49 = OpAccessChain %45 %47 
                               f32_4 %50 = OpLoad %49 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                               f32_3 %52 = OpFNegate %51 
                               f32_3 %53 = OpFAdd %42 %52 
                               f32_4 %54 = OpLoad %9 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %9 %55 
                                 f32 %59 = OpLoad vs_TEXCOORD1 
                               f32_3 %60 = OpCompositeConstruct %59 %59 %59 
                               f32_4 %61 = OpLoad %9 
                               f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                               f32_3 %63 = OpFMul %60 %62 
                      Uniform f32_4* %64 = OpAccessChain %45 %47 
                               f32_4 %65 = OpLoad %64 
                               f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               f32_3 %67 = OpFAdd %63 %66 
                               f32_4 %68 = OpLoad %57 
                               f32_4 %69 = OpVectorShuffle %68 %67 4 5 6 3 
                                             OpStore %57 %69 
                                 f32 %74 = OpLoad %26 
                                bool %75 = OpFOrdGreaterThanEqual %73 %74 
                                             OpStore %72 %75 
                                 f32 %76 = OpLoad %26 
                         Output f32* %78 = OpAccessChain %57 %28 
                                             OpStore %78 %76 
                                bool %79 = OpLoad %72 
                                 i32 %81 = OpSelect %79 %80 %47 
                                 i32 %83 = OpIMul %81 %82 
                                bool %84 = OpINotEqual %83 %47 
                                             OpSelectionMerge %86 None 
                                             OpBranchConditional %84 %85 %86 
                                     %85 = OpLabel 
                                             OpKill
                                     %86 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
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
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
bool u_xlatb1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlatb1 = 0.00999999978>=u_xlat0.w;
    SV_Target0 = u_xlat0;
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate vs_TEXCOORD0 Location 21 
                                                     OpDecorate %24 Location 24 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpDecorate %30 ArrayStride 30 
                                                     OpMemberDecorate %31 0 Offset 31 
                                                     OpMemberDecorate %31 1 Offset 31 
                                                     OpMemberDecorate %31 2 Offset 31 
                                                     OpDecorate %31 Block 
                                                     OpDecorate %33 DescriptorSet 33 
                                                     OpDecorate %33 Binding 33 
                                                     OpDecorate %47 Location 47 
                                                     OpMemberDecorate %96 0 BuiltIn 96 
                                                     OpMemberDecorate %96 1 BuiltIn 96 
                                                     OpMemberDecorate %96 2 BuiltIn 96 
                                                     OpDecorate %96 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Output %7 
                                Output f32_4* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                         f32 %14 = OpConstant 3.674022E-40 
                                         f32 %15 = OpConstant 3.674022E-40 
                                             %19 = OpTypeVector %6 2 
                                             %20 = OpTypePointer Output %19 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %22 = OpTypeVector %6 3 
                                             %23 = OpTypePointer Input %22 
                                Input f32_3* %24 = OpVariable Input 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 4 
                                             %29 = OpTypeArray %7 %28 
                                             %30 = OpTypeArray %7 %28 
                                             %31 = OpTypeStruct %29 %30 %7 
                                             %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
                                             %34 = OpTypeInt 32 1 
                                         i32 %35 = OpConstant 2 
                                             %36 = OpTypePointer Uniform %7 
                                             %45 = OpTypePointer Private %7 
                              Private f32_4* %46 = OpVariable Private 
                                Input f32_3* %47 = OpVariable Input 
                                         i32 %50 = OpConstant 0 
                                         i32 %51 = OpConstant 1 
                                         i32 %70 = OpConstant 3 
                              Private f32_4* %74 = OpVariable Private 
                                         u32 %94 = OpConstant 1 
                                             %95 = OpTypeArray %6 %94 
                                             %96 = OpTypeStruct %7 %6 %95 
                                             %97 = OpTypePointer Output %96 
        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                              Uniform f32_4* %37 = OpAccessChain %33 %35 
                                       f32_4 %38 = OpLoad %37 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_2 %40 = OpFMul %26 %39 
                              Uniform f32_4* %41 = OpAccessChain %33 %35 
                                       f32_4 %42 = OpLoad %41 
                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                       f32_2 %44 = OpFAdd %40 %43 
                                                     OpStore vs_TEXCOORD0 %44 
                                       f32_3 %48 = OpLoad %47 
                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
                                       f32_4 %53 = OpLoad %52 
                                       f32_4 %54 = OpFMul %49 %53 
                                                     OpStore %46 %54 
                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
                                       f32_4 %56 = OpLoad %55 
                                       f32_3 %57 = OpLoad %47 
                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %46 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore %46 %61 
                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
                                       f32_4 %63 = OpLoad %62 
                                       f32_3 %64 = OpLoad %47 
                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %46 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %46 %68 
                                       f32_4 %69 = OpLoad %46 
                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFAdd %69 %72 
                                                     OpStore %46 %73 
                                       f32_4 %75 = OpLoad %46 
                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpFMul %76 %78 
                                                     OpStore %74 %79 
                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
                                       f32_4 %81 = OpLoad %80 
                                       f32_4 %82 = OpLoad %46 
                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                       f32_4 %84 = OpFMul %81 %83 
                                       f32_4 %85 = OpLoad %74 
                                       f32_4 %86 = OpFAdd %84 %85 
                                                     OpStore %74 %86 
                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %46 
                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %74 
                                       f32_4 %93 = OpFAdd %91 %92 
                                                     OpStore %74 %93 
                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %46 
                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %74 
                                      f32_4 %105 = OpFAdd %103 %104 
                              Output f32_4* %106 = OpAccessChain %98 %50 
                                                     OpStore %106 %105 
                                Output f32* %108 = OpAccessChain %98 %50 %94 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %98 %50 %94 
                                                     OpStore %111 %110 
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
                                             OpEntryPoint Fragment %4 "main" %22 %27 %41 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %27 Location 27 
                                             OpDecorate %41 Location 41 
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
                                     %26 = OpTypePointer Input %7 
                        Input f32_4* %27 = OpVariable Input 
                                     %30 = OpTypeBool 
                                     %31 = OpTypePointer Private %30 
                       Private bool* %32 = OpVariable Private 
                                 f32 %33 = OpConstant 3.674022E-40 
                                     %34 = OpTypeInt 32 0 
                                 u32 %35 = OpConstant 3 
                                     %36 = OpTypePointer Private %6 
                                     %40 = OpTypePointer Output %7 
                       Output f32_4* %41 = OpVariable Output 
                                     %44 = OpTypeInt 32 1 
                                 i32 %45 = OpConstant 0 
                                 i32 %46 = OpConstant 1 
                                 i32 %48 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %28 = OpLoad %27 
                               f32_4 %29 = OpFMul %25 %28 
                                             OpStore %9 %29 
                        Private f32* %37 = OpAccessChain %9 %35 
                                 f32 %38 = OpLoad %37 
                                bool %39 = OpFOrdGreaterThanEqual %33 %38 
                                             OpStore %32 %39 
                               f32_4 %42 = OpLoad %9 
                                             OpStore %41 %42 
                                bool %43 = OpLoad %32 
                                 i32 %47 = OpSelect %43 %46 %45 
                                 i32 %49 = OpIMul %47 %48 
                                bool %50 = OpINotEqual %49 %45 
                                             OpSelectionMerge %52 None 
                                             OpBranchConditional %50 %51 %52 
                                     %51 = OpLabel 
                                             OpKill
                                     %52 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
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
}
}
}
}