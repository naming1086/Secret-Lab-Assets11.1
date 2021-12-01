//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Lut_2_lut" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 24706
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
uniform 	float _Fade;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D _LutTex;
UNITY_LOCATION(2) uniform  sampler3D _LutTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_LutTex2, u_xlat0.xyz);
    u_xlat2 = texture(_LutTex, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 101
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %73 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpMemberDecorate %54 0 Offset 54 
                                             OpMemberDecorate %54 1 Offset 54 
                                             OpDecorate %54 Block 
                                             OpDecorate %56 DescriptorSet 56 
                                             OpDecorate %56 Binding 56 
                                             OpDecorate %73 Location 73 
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
                                     %28 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                     %29 = OpTypePointer UniformConstant %28 
UniformConstant read_only Texture3D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampledImage %28 
                      Private f32_3* %40 = OpVariable Private 
UniformConstant read_only Texture3D* %41 = OpVariable UniformConstant 
            UniformConstant sampler* %43 = OpVariable UniformConstant 
                                     %54 = OpTypeStruct %6 %6 
                                     %55 = OpTypePointer Uniform %54 
         Uniform struct {f32; f32;}* %56 = OpVariable Uniform 
                                     %57 = OpTypeInt 32 1 
                                 i32 %58 = OpConstant 0 
                                     %59 = OpTypePointer Uniform %6 
                                     %72 = OpTypePointer Output %7 
                       Output f32_4* %73 = OpVariable Output 
                                 i32 %74 = OpConstant 1 
                                     %93 = OpTypeInt 32 0 
                                 u32 %94 = OpConstant 3 
                                     %95 = OpTypePointer Private %6 
                                     %98 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                 read_only Texture3D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture3DSampled %35 = OpSampledImage %31 %33 
                               f32_4 %36 = OpLoad %9 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_4 %38 = OpImageSampleImplicitLod %35 %37 
                               f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                             OpStore %27 %39 
                 read_only Texture3D %42 = OpLoad %41 
                             sampler %44 = OpLoad %43 
          read_only Texture3DSampled %45 = OpSampledImage %42 %44 
                               f32_4 %46 = OpLoad %9 
                               f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                               f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                             OpStore %40 %49 
                               f32_3 %50 = OpLoad %27 
                               f32_3 %51 = OpLoad %40 
                               f32_3 %52 = OpFNegate %51 
                               f32_3 %53 = OpFAdd %50 %52 
                                             OpStore %27 %53 
                        Uniform f32* %60 = OpAccessChain %56 %58 
                                 f32 %61 = OpLoad %60 
                               f32_3 %62 = OpCompositeConstruct %61 %61 %61 
                               f32_3 %63 = OpLoad %27 
                               f32_3 %64 = OpFMul %62 %63 
                               f32_3 %65 = OpLoad %40 
                               f32_3 %66 = OpFAdd %64 %65 
                                             OpStore %27 %66 
                               f32_4 %67 = OpLoad %9 
                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               f32_3 %69 = OpFNegate %68 
                               f32_3 %70 = OpLoad %27 
                               f32_3 %71 = OpFAdd %69 %70 
                                             OpStore %27 %71 
                        Uniform f32* %75 = OpAccessChain %56 %74 
                                 f32 %76 = OpLoad %75 
                        Uniform f32* %77 = OpAccessChain %56 %74 
                                 f32 %78 = OpLoad %77 
                        Uniform f32* %79 = OpAccessChain %56 %74 
                                 f32 %80 = OpLoad %79 
                               f32_3 %81 = OpCompositeConstruct %76 %78 %80 
                                 f32 %82 = OpCompositeExtract %81 0 
                                 f32 %83 = OpCompositeExtract %81 1 
                                 f32 %84 = OpCompositeExtract %81 2 
                               f32_3 %85 = OpCompositeConstruct %82 %83 %84 
                               f32_3 %86 = OpLoad %27 
                               f32_3 %87 = OpFMul %85 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_3 %90 = OpFAdd %87 %89 
                               f32_4 %91 = OpLoad %73 
                               f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                             OpStore %73 %92 
                        Private f32* %96 = OpAccessChain %9 %94 
                                 f32 %97 = OpLoad %96 
                         Output f32* %99 = OpAccessChain %73 %94 
                                             OpStore %99 %97 
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
  GpuProgramID 97165
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
uniform 	float _Fade;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D _LutTex;
UNITY_LOCATION(2) uniform  sampler3D _LutTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = u_xlat0.w;
    u_xlat1 = texture(_LutTex2, u_xlat0.xyz);
    u_xlat2 = texture(_LutTex, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 113
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %55 DescriptorSet 55 
                                             OpDecorate %55 Binding 55 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpMemberDecorate %68 0 Offset 68 
                                             OpMemberDecorate %68 1 Offset 68 
                                             OpDecorate %68 Block 
                                             OpDecorate %70 DescriptorSet 70 
                                             OpDecorate %70 Binding 70 
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
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Private %6 
                                     %38 = OpTypePointer Output %6 
                                     %40 = OpTypePointer Private %25 
                      Private f32_3* %41 = OpVariable Private 
                                     %42 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                     %43 = OpTypePointer UniformConstant %42 
UniformConstant read_only Texture3D* %44 = OpVariable UniformConstant 
            UniformConstant sampler* %46 = OpVariable UniformConstant 
                                     %48 = OpTypeSampledImage %42 
                      Private f32_3* %54 = OpVariable Private 
UniformConstant read_only Texture3D* %55 = OpVariable UniformConstant 
            UniformConstant sampler* %57 = OpVariable UniformConstant 
                                     %68 = OpTypeStruct %6 %6 
                                     %69 = OpTypePointer Uniform %68 
         Uniform struct {f32; f32;}* %70 = OpVariable Uniform 
                                     %71 = OpTypeInt 32 1 
                                 i32 %72 = OpConstant 0 
                                     %73 = OpTypePointer Uniform %6 
                                 i32 %86 = OpConstant 1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                               f32_3 %28 = OpExtInst %1 31 %27 
                               f32_4 %29 = OpLoad %9 
                               f32_4 %30 = OpVectorShuffle %29 %28 4 5 6 3 
                                             OpStore %9 %30 
                        Private f32* %36 = OpAccessChain %9 %34 
                                 f32 %37 = OpLoad %36 
                         Output f32* %39 = OpAccessChain %32 %34 
                                             OpStore %39 %37 
                 read_only Texture3D %45 = OpLoad %44 
                             sampler %47 = OpLoad %46 
          read_only Texture3DSampled %49 = OpSampledImage %45 %47 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                             OpStore %41 %53 
                 read_only Texture3D %56 = OpLoad %55 
                             sampler %58 = OpLoad %57 
          read_only Texture3DSampled %59 = OpSampledImage %56 %58 
                               f32_4 %60 = OpLoad %9 
                               f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                               f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                             OpStore %54 %63 
                               f32_3 %64 = OpLoad %41 
                               f32_3 %65 = OpLoad %54 
                               f32_3 %66 = OpFNegate %65 
                               f32_3 %67 = OpFAdd %64 %66 
                                             OpStore %41 %67 
                        Uniform f32* %74 = OpAccessChain %70 %72 
                                 f32 %75 = OpLoad %74 
                               f32_3 %76 = OpCompositeConstruct %75 %75 %75 
                               f32_3 %77 = OpLoad %41 
                               f32_3 %78 = OpFMul %76 %77 
                               f32_3 %79 = OpLoad %54 
                               f32_3 %80 = OpFAdd %78 %79 
                                             OpStore %41 %80 
                               f32_4 %81 = OpLoad %9 
                               f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                               f32_3 %83 = OpFNegate %82 
                               f32_3 %84 = OpLoad %41 
                               f32_3 %85 = OpFAdd %83 %84 
                                             OpStore %41 %85 
                        Uniform f32* %87 = OpAccessChain %70 %86 
                                 f32 %88 = OpLoad %87 
                        Uniform f32* %89 = OpAccessChain %70 %86 
                                 f32 %90 = OpLoad %89 
                        Uniform f32* %91 = OpAccessChain %70 %86 
                                 f32 %92 = OpLoad %91 
                               f32_3 %93 = OpCompositeConstruct %88 %90 %92 
                                 f32 %94 = OpCompositeExtract %93 0 
                                 f32 %95 = OpCompositeExtract %93 1 
                                 f32 %96 = OpCompositeExtract %93 2 
                               f32_3 %97 = OpCompositeConstruct %94 %95 %96 
                               f32_3 %98 = OpLoad %41 
                               f32_3 %99 = OpFMul %97 %98 
                              f32_4 %100 = OpLoad %9 
                              f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                              f32_3 %102 = OpFAdd %99 %101 
                              f32_4 %103 = OpLoad %9 
                              f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                             OpStore %9 %104 
                              f32_4 %105 = OpLoad %9 
                              f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                              f32_4 %107 = OpLoad %9 
                              f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                              f32_3 %109 = OpFMul %106 %108 
                              f32_4 %110 = OpLoad %32 
                              f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                             OpStore %32 %111 
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