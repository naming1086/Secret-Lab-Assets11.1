//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Lut_PlayWith" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 53989
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
in  vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _Blend;
uniform 	float _Intensity;
uniform 	float _Extra;
uniform 	float _Extra2;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D _LutTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity)) + vec3(vec3(_Extra, _Extra, _Extra));
    u_xlat1 = texture(_LutTex, u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
    u_xlat1.xyz = (-u_xlat0.xyz) * vec3(vec3(_Intensity, _Intensity, _Intensity)) + u_xlat1.xyz;
    u_xlat0 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
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
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %120 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpMemberDecorate %30 0 Offset 30 
                                              OpMemberDecorate %30 1 Offset 30 
                                              OpMemberDecorate %30 2 Offset 30 
                                              OpMemberDecorate %30 3 Offset 30 
                                              OpDecorate %30 Block 
                                              OpDecorate %32 DescriptorSet 32 
                                              OpDecorate %32 Binding 32 
                                              OpDecorate %63 DescriptorSet 63 
                                              OpDecorate %63 Binding 63 
                                              OpDecorate %65 DescriptorSet 65 
                                              OpDecorate %65 Binding 65 
                                              OpDecorate %120 Location 120 
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
                                      %25 = OpTypeVector %6 3 
                                      %26 = OpTypePointer Private %25 
                       Private f32_3* %27 = OpVariable Private 
                                      %30 = OpTypeStruct %6 %6 %6 %6 
                                      %31 = OpTypePointer Uniform %30 
Uniform struct {f32; f32; f32; f32;}* %32 = OpVariable Uniform 
                                      %33 = OpTypeInt 32 1 
                                  i32 %34 = OpConstant 1 
                                      %35 = OpTypePointer Uniform %6 
                                  i32 %48 = OpConstant 2 
                                      %61 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                      %62 = OpTypePointer UniformConstant %61 
 UniformConstant read_only Texture3D* %63 = OpVariable UniformConstant 
             UniformConstant sampler* %65 = OpVariable UniformConstant 
                                      %67 = OpTypeSampledImage %61 
                                  i32 %73 = OpConstant 3 
                                     %119 = OpTypePointer Output %7 
                       Output f32_4* %120 = OpVariable Output 
                                 i32 %121 = OpConstant 0 
                                     %132 = OpTypeInt 32 0 
                                 u32 %133 = OpConstant 3 
                                     %134 = OpTypePointer Private %6 
                                     %137 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                              OpStore %9 %24 
                                f32_4 %28 = OpLoad %9 
                                f32_3 %29 = OpVectorShuffle %28 %28 0 1 2 
                         Uniform f32* %36 = OpAccessChain %32 %34 
                                  f32 %37 = OpLoad %36 
                         Uniform f32* %38 = OpAccessChain %32 %34 
                                  f32 %39 = OpLoad %38 
                         Uniform f32* %40 = OpAccessChain %32 %34 
                                  f32 %41 = OpLoad %40 
                                f32_3 %42 = OpCompositeConstruct %37 %39 %41 
                                  f32 %43 = OpCompositeExtract %42 0 
                                  f32 %44 = OpCompositeExtract %42 1 
                                  f32 %45 = OpCompositeExtract %42 2 
                                f32_3 %46 = OpCompositeConstruct %43 %44 %45 
                                f32_3 %47 = OpFMul %29 %46 
                         Uniform f32* %49 = OpAccessChain %32 %48 
                                  f32 %50 = OpLoad %49 
                         Uniform f32* %51 = OpAccessChain %32 %48 
                                  f32 %52 = OpLoad %51 
                         Uniform f32* %53 = OpAccessChain %32 %48 
                                  f32 %54 = OpLoad %53 
                                f32_3 %55 = OpCompositeConstruct %50 %52 %54 
                                  f32 %56 = OpCompositeExtract %55 0 
                                  f32 %57 = OpCompositeExtract %55 1 
                                  f32 %58 = OpCompositeExtract %55 2 
                                f32_3 %59 = OpCompositeConstruct %56 %57 %58 
                                f32_3 %60 = OpFAdd %47 %59 
                                              OpStore %27 %60 
                  read_only Texture3D %64 = OpLoad %63 
                              sampler %66 = OpLoad %65 
           read_only Texture3DSampled %68 = OpSampledImage %64 %66 
                                f32_3 %69 = OpLoad %27 
                                f32_4 %70 = OpImageSampleImplicitLod %68 %69 
                                f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                              OpStore %27 %71 
                                f32_3 %72 = OpLoad %27 
                         Uniform f32* %74 = OpAccessChain %32 %73 
                                  f32 %75 = OpLoad %74 
                         Uniform f32* %76 = OpAccessChain %32 %73 
                                  f32 %77 = OpLoad %76 
                         Uniform f32* %78 = OpAccessChain %32 %73 
                                  f32 %79 = OpLoad %78 
                                f32_3 %80 = OpCompositeConstruct %75 %77 %79 
                                  f32 %81 = OpCompositeExtract %80 0 
                                  f32 %82 = OpCompositeExtract %80 1 
                                  f32 %83 = OpCompositeExtract %80 2 
                                f32_3 %84 = OpCompositeConstruct %81 %82 %83 
                                f32_3 %85 = OpFAdd %72 %84 
                                              OpStore %27 %85 
                                f32_4 %86 = OpLoad %9 
                                f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                f32_3 %88 = OpFNegate %87 
                         Uniform f32* %89 = OpAccessChain %32 %34 
                                  f32 %90 = OpLoad %89 
                         Uniform f32* %91 = OpAccessChain %32 %34 
                                  f32 %92 = OpLoad %91 
                         Uniform f32* %93 = OpAccessChain %32 %34 
                                  f32 %94 = OpLoad %93 
                                f32_3 %95 = OpCompositeConstruct %90 %92 %94 
                                  f32 %96 = OpCompositeExtract %95 0 
                                  f32 %97 = OpCompositeExtract %95 1 
                                  f32 %98 = OpCompositeExtract %95 2 
                                f32_3 %99 = OpCompositeConstruct %96 %97 %98 
                               f32_3 %100 = OpFMul %88 %99 
                               f32_3 %101 = OpLoad %27 
                               f32_3 %102 = OpFAdd %100 %101 
                                              OpStore %27 %102 
                               f32_4 %103 = OpLoad %9 
                        Uniform f32* %104 = OpAccessChain %32 %34 
                                 f32 %105 = OpLoad %104 
                        Uniform f32* %106 = OpAccessChain %32 %34 
                                 f32 %107 = OpLoad %106 
                        Uniform f32* %108 = OpAccessChain %32 %34 
                                 f32 %109 = OpLoad %108 
                        Uniform f32* %110 = OpAccessChain %32 %34 
                                 f32 %111 = OpLoad %110 
                               f32_4 %112 = OpCompositeConstruct %105 %107 %109 %111 
                                 f32 %113 = OpCompositeExtract %112 0 
                                 f32 %114 = OpCompositeExtract %112 1 
                                 f32 %115 = OpCompositeExtract %112 2 
                                 f32 %116 = OpCompositeExtract %112 3 
                               f32_4 %117 = OpCompositeConstruct %113 %114 %115 %116 
                               f32_4 %118 = OpFMul %103 %117 
                                              OpStore %9 %118 
                        Uniform f32* %122 = OpAccessChain %32 %121 
                                 f32 %123 = OpLoad %122 
                               f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                               f32_3 %125 = OpLoad %27 
                               f32_3 %126 = OpFMul %124 %125 
                               f32_4 %127 = OpLoad %9 
                               f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                               f32_3 %129 = OpFAdd %126 %128 
                               f32_4 %130 = OpLoad %120 
                               f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                              OpStore %120 %131 
                        Private f32* %135 = OpAccessChain %9 %133 
                                 f32 %136 = OpLoad %135 
                         Output f32* %138 = OpAccessChain %120 %133 
                                              OpStore %138 %136 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 111919
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
in  vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _Blend;
uniform 	float _Intensity;
uniform 	float _Extra;
uniform 	float _Extra2;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D _LutTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = u_xlat0.w;
    u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
    u_xlat1 = texture(_LutTex, u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
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
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 128
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %54 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpMemberDecorate %26 0 Offset 26 
                                              OpMemberDecorate %26 1 Offset 26 
                                              OpMemberDecorate %26 2 Offset 26 
                                              OpMemberDecorate %26 3 Offset 26 
                                              OpDecorate %26 Block 
                                              OpDecorate %28 DescriptorSet 28 
                                              OpDecorate %28 Binding 28 
                                              OpDecorate %54 Location 54 
                                              OpDecorate %81 DescriptorSet 81 
                                              OpDecorate %81 Binding 81 
                                              OpDecorate %83 DescriptorSet 83 
                                              OpDecorate %83 Binding 83 
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
                                      %26 = OpTypeStruct %6 %6 %6 %6 
                                      %27 = OpTypePointer Uniform %26 
Uniform struct {f32; f32; f32; f32;}* %28 = OpVariable Uniform 
                                      %29 = OpTypeInt 32 1 
                                  i32 %30 = OpConstant 1 
                                      %31 = OpTypePointer Uniform %6 
                                      %47 = OpTypeVector %6 3 
                                      %53 = OpTypePointer Output %7 
                        Output f32_4* %54 = OpVariable Output 
                                      %55 = OpTypeInt 32 0 
                                  u32 %56 = OpConstant 3 
                                      %57 = OpTypePointer Private %6 
                                      %60 = OpTypePointer Output %6 
                                      %62 = OpTypePointer Private %47 
                       Private f32_3* %63 = OpVariable Private 
                                  i32 %66 = OpConstant 2 
                                      %79 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                      %80 = OpTypePointer UniformConstant %79 
 UniformConstant read_only Texture3D* %81 = OpVariable UniformConstant 
             UniformConstant sampler* %83 = OpVariable UniformConstant 
                                      %85 = OpTypeSampledImage %79 
                                  i32 %91 = OpConstant 3 
                                 i32 %109 = OpConstant 0 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                              OpStore %9 %24 
                                f32_4 %25 = OpLoad %9 
                         Uniform f32* %32 = OpAccessChain %28 %30 
                                  f32 %33 = OpLoad %32 
                         Uniform f32* %34 = OpAccessChain %28 %30 
                                  f32 %35 = OpLoad %34 
                         Uniform f32* %36 = OpAccessChain %28 %30 
                                  f32 %37 = OpLoad %36 
                         Uniform f32* %38 = OpAccessChain %28 %30 
                                  f32 %39 = OpLoad %38 
                                f32_4 %40 = OpCompositeConstruct %33 %35 %37 %39 
                                  f32 %41 = OpCompositeExtract %40 0 
                                  f32 %42 = OpCompositeExtract %40 1 
                                  f32 %43 = OpCompositeExtract %40 2 
                                  f32 %44 = OpCompositeExtract %40 3 
                                f32_4 %45 = OpCompositeConstruct %41 %42 %43 %44 
                                f32_4 %46 = OpFMul %25 %45 
                                              OpStore %9 %46 
                                f32_4 %48 = OpLoad %9 
                                f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                f32_3 %50 = OpExtInst %1 31 %49 
                                f32_4 %51 = OpLoad %9 
                                f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                              OpStore %9 %52 
                         Private f32* %58 = OpAccessChain %9 %56 
                                  f32 %59 = OpLoad %58 
                          Output f32* %61 = OpAccessChain %54 %56 
                                              OpStore %61 %59 
                                f32_4 %64 = OpLoad %9 
                                f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                         Uniform f32* %67 = OpAccessChain %28 %66 
                                  f32 %68 = OpLoad %67 
                         Uniform f32* %69 = OpAccessChain %28 %66 
                                  f32 %70 = OpLoad %69 
                         Uniform f32* %71 = OpAccessChain %28 %66 
                                  f32 %72 = OpLoad %71 
                                f32_3 %73 = OpCompositeConstruct %68 %70 %72 
                                  f32 %74 = OpCompositeExtract %73 0 
                                  f32 %75 = OpCompositeExtract %73 1 
                                  f32 %76 = OpCompositeExtract %73 2 
                                f32_3 %77 = OpCompositeConstruct %74 %75 %76 
                                f32_3 %78 = OpFAdd %65 %77 
                                              OpStore %63 %78 
                  read_only Texture3D %82 = OpLoad %81 
                              sampler %84 = OpLoad %83 
           read_only Texture3DSampled %86 = OpSampledImage %82 %84 
                                f32_3 %87 = OpLoad %63 
                                f32_4 %88 = OpImageSampleImplicitLod %86 %87 
                                f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                              OpStore %63 %89 
                                f32_3 %90 = OpLoad %63 
                         Uniform f32* %92 = OpAccessChain %28 %91 
                                  f32 %93 = OpLoad %92 
                         Uniform f32* %94 = OpAccessChain %28 %91 
                                  f32 %95 = OpLoad %94 
                         Uniform f32* %96 = OpAccessChain %28 %91 
                                  f32 %97 = OpLoad %96 
                                f32_3 %98 = OpCompositeConstruct %93 %95 %97 
                                  f32 %99 = OpCompositeExtract %98 0 
                                 f32 %100 = OpCompositeExtract %98 1 
                                 f32 %101 = OpCompositeExtract %98 2 
                               f32_3 %102 = OpCompositeConstruct %99 %100 %101 
                               f32_3 %103 = OpFAdd %90 %102 
                                              OpStore %63 %103 
                               f32_4 %104 = OpLoad %9 
                               f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                               f32_3 %106 = OpFNegate %105 
                               f32_3 %107 = OpLoad %63 
                               f32_3 %108 = OpFAdd %106 %107 
                                              OpStore %63 %108 
                        Uniform f32* %110 = OpAccessChain %28 %109 
                                 f32 %111 = OpLoad %110 
                               f32_3 %112 = OpCompositeConstruct %111 %111 %111 
                               f32_3 %113 = OpLoad %63 
                               f32_3 %114 = OpFMul %112 %113 
                               f32_4 %115 = OpLoad %9 
                               f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                               f32_3 %117 = OpFAdd %114 %116 
                               f32_4 %118 = OpLoad %9 
                               f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                              OpStore %9 %119 
                               f32_4 %120 = OpLoad %9 
                               f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                               f32_4 %122 = OpLoad %9 
                               f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                               f32_3 %124 = OpFMul %121 %123 
                               f32_4 %125 = OpLoad %54 
                               f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                              OpStore %54 %126 
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