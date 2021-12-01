//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Lut_Mask" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1817
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
uniform 	float _Inverse;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
UNITY_LOCATION(2) uniform  sampler3D _LutTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat3.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _Inverse * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Blend;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = texture(_LutTex, u_xlat1.xyz);
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
; Bound: 98
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %82 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %37 0 Offset 37 
                                             OpMemberDecorate %37 1 Offset 37 
                                             OpDecorate %37 Block 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpDecorate %59 DescriptorSet 59 
                                             OpDecorate %59 Binding 59 
                                             OpDecorate %66 DescriptorSet 66 
                                             OpDecorate %66 Binding 66 
                                             OpDecorate %68 DescriptorSet 68 
                                             OpDecorate %68 Binding 68 
                                             OpDecorate %82 Location 82 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypeVector %6 3 
                                     %29 = OpTypePointer Private %28 
                      Private f32_3* %30 = OpVariable Private 
                                 f32 %32 = OpConstant 3.674022E-40 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %37 = OpTypeStruct %6 %6 
                                     %38 = OpTypePointer Uniform %37 
         Uniform struct {f32; f32;}* %39 = OpVariable Uniform 
                                     %40 = OpTypeInt 32 1 
                                 i32 %41 = OpConstant 1 
                                     %42 = OpTypePointer Uniform %6 
                                 i32 %51 = OpConstant 0 
                                     %55 = OpTypePointer Private %23 
                      Private f32_4* %56 = OpVariable Private 
UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
            UniformConstant sampler* %59 = OpVariable UniformConstant 
                                     %64 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                     %65 = OpTypePointer UniformConstant %64 
UniformConstant read_only Texture3D* %66 = OpVariable UniformConstant 
            UniformConstant sampler* %68 = OpVariable UniformConstant 
                                     %70 = OpTypeSampledImage %64 
                                     %81 = OpTypePointer Output %23 
                       Output f32_4* %82 = OpVariable Output 
                                 u32 %92 = OpConstant 3 
                                     %95 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                                 f32 %31 = OpLoad %8 
                                 f32 %33 = OpFMul %31 %32 
                                 f32 %35 = OpFAdd %33 %34 
                        Private f32* %36 = OpAccessChain %30 %26 
                                             OpStore %36 %35 
                        Uniform f32* %43 = OpAccessChain %39 %41 
                                 f32 %44 = OpLoad %43 
                        Private f32* %45 = OpAccessChain %30 %26 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %44 %46 
                                 f32 %48 = OpLoad %8 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %8 %49 
                                 f32 %50 = OpLoad %8 
                        Uniform f32* %52 = OpAccessChain %39 %51 
                                 f32 %53 = OpLoad %52 
                                 f32 %54 = OpFMul %50 %53 
                                             OpStore %8 %54 
                 read_only Texture2D %58 = OpLoad %57 
                             sampler %60 = OpLoad %59 
          read_only Texture2DSampled %61 = OpSampledImage %58 %60 
                               f32_2 %62 = OpLoad vs_TEXCOORD0 
                               f32_4 %63 = OpImageSampleImplicitLod %61 %62 
                                             OpStore %56 %63 
                 read_only Texture3D %67 = OpLoad %66 
                             sampler %69 = OpLoad %68 
          read_only Texture3DSampled %71 = OpSampledImage %67 %69 
                               f32_4 %72 = OpLoad %56 
                               f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                               f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                               f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                             OpStore %30 %75 
                               f32_4 %76 = OpLoad %56 
                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                               f32_3 %78 = OpFNegate %77 
                               f32_3 %79 = OpLoad %30 
                               f32_3 %80 = OpFAdd %78 %79 
                                             OpStore %30 %80 
                                 f32 %83 = OpLoad %8 
                               f32_3 %84 = OpCompositeConstruct %83 %83 %83 
                               f32_3 %85 = OpLoad %30 
                               f32_3 %86 = OpFMul %84 %85 
                               f32_4 %87 = OpLoad %56 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               f32_3 %89 = OpFAdd %86 %88 
                               f32_4 %90 = OpLoad %82 
                               f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                             OpStore %82 %91 
                        Private f32* %93 = OpAccessChain %56 %92 
                                 f32 %94 = OpLoad %93 
                         Output f32* %96 = OpAccessChain %82 %92 
                                             OpStore %96 %94 
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
  GpuProgramID 129977
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
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
UNITY_LOCATION(2) uniform  sampler3D _LutTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x * _Blend;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = sqrt(u_xlat1.xyz);
    SV_Target0.w = u_xlat1.w;
    u_xlat1 = texture(_LutTex, u_xlat2.xyz);
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
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
; Bound: 96
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %57 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %47 DescriptorSet 47 
                                             OpDecorate %47 Binding 47 
                                             OpDecorate %57 Location 57 
                                             OpDecorate %65 DescriptorSet 65 
                                             OpDecorate %65 Binding 65 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
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
                                     %24 = OpTypeVector %6 4 
                                     %26 = OpTypeInt 32 0 
                                 u32 %27 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypeStruct %6 
                                     %34 = OpTypePointer Uniform %33 
              Uniform struct {f32;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %6 
                                     %43 = OpTypePointer Private %24 
                      Private f32_4* %44 = OpVariable Private 
UniformConstant read_only Texture2D* %45 = OpVariable UniformConstant 
            UniformConstant sampler* %47 = OpVariable UniformConstant 
                      Private f32_3* %52 = OpVariable Private 
                                     %56 = OpTypePointer Output %24 
                       Output f32_4* %57 = OpVariable Output 
                                 u32 %58 = OpConstant 3 
                                     %61 = OpTypePointer Output %6 
                                     %63 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                     %64 = OpTypePointer UniformConstant %63 
UniformConstant read_only Texture3D* %65 = OpVariable UniformConstant 
            UniformConstant sampler* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampledImage %63 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                 f32 %28 = OpCompositeExtract %25 0 
                        Private f32* %30 = OpAccessChain %9 %27 
                                             OpStore %30 %28 
                        Private f32* %31 = OpAccessChain %9 %27 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFMul %32 %40 
                        Private f32* %42 = OpAccessChain %9 %27 
                                             OpStore %42 %41 
                 read_only Texture2D %46 = OpLoad %45 
                             sampler %48 = OpLoad %47 
          read_only Texture2DSampled %49 = OpSampledImage %46 %48 
                               f32_2 %50 = OpLoad vs_TEXCOORD0 
                               f32_4 %51 = OpImageSampleImplicitLod %49 %50 
                                             OpStore %44 %51 
                               f32_4 %53 = OpLoad %44 
                               f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               f32_3 %55 = OpExtInst %1 31 %54 
                                             OpStore %52 %55 
                        Private f32* %59 = OpAccessChain %44 %58 
                                 f32 %60 = OpLoad %59 
                         Output f32* %62 = OpAccessChain %57 %58 
                                             OpStore %62 %60 
                 read_only Texture3D %66 = OpLoad %65 
                             sampler %68 = OpLoad %67 
          read_only Texture3DSampled %70 = OpSampledImage %66 %68 
                               f32_3 %71 = OpLoad %52 
                               f32_4 %72 = OpImageSampleImplicitLod %70 %71 
                               f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                               f32_4 %74 = OpLoad %44 
                               f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                             OpStore %44 %75 
                               f32_3 %76 = OpLoad %52 
                               f32_3 %77 = OpFNegate %76 
                               f32_4 %78 = OpLoad %44 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               f32_3 %80 = OpFAdd %77 %79 
                               f32_4 %81 = OpLoad %44 
                               f32_4 %82 = OpVectorShuffle %81 %80 4 5 6 3 
                                             OpStore %44 %82 
                               f32_3 %83 = OpLoad %9 
                               f32_3 %84 = OpVectorShuffle %83 %83 0 0 0 
                               f32_4 %85 = OpLoad %44 
                               f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                               f32_3 %87 = OpFMul %84 %86 
                               f32_3 %88 = OpLoad %52 
                               f32_3 %89 = OpFAdd %87 %88 
                                             OpStore %9 %89 
                               f32_3 %90 = OpLoad %9 
                               f32_3 %91 = OpLoad %9 
                               f32_3 %92 = OpFMul %90 %91 
                               f32_4 %93 = OpLoad %57 
                               f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                             OpStore %57 %94 
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