//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-Halo" {
Properties {
}
SubShader {
 Tags { "RenderType" = "Overlay" }
 Pass {
  Tags { "RenderType" = "Overlay" }
  Blend OneMinusDstColor One, OneMinusDstColor One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 55344
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
uniform 	vec4 _HaloFalloff_ST;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _HaloFalloff_ST.xy + _HaloFalloff_ST.zw;
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
UNITY_LOCATION(0) uniform  sampler2D _HaloFalloff;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_HaloFalloff, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat0.www * vs_COLOR0.xyz;
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
; Bound: 44
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %29 %34 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %34 Location 34 
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
                                 u32 %26 = OpConstant 3 
                                     %28 = OpTypePointer Output %23 
                       Output f32_4* %29 = OpVariable Output 
                                     %31 = OpTypeVector %6 3 
                                     %33 = OpTypePointer Input %23 
                        Input f32_4* %34 = OpVariable Input 
                                     %41 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %30 = OpLoad %8 
                               f32_3 %32 = OpCompositeConstruct %30 %30 %30 
                               f32_4 %35 = OpLoad %34 
                               f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                               f32_3 %37 = OpFMul %32 %36 
                               f32_4 %38 = OpLoad %29 
                               f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                             OpStore %29 %39 
                                 f32 %40 = OpLoad %8 
                         Output f32* %42 = OpAccessChain %29 %26 
                                             OpStore %42 %40 
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
uniform 	vec4 _HaloFalloff_ST;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _HaloFalloff_ST.xy + _HaloFalloff_ST.zw;
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
UNITY_LOCATION(0) uniform  sampler2D _HaloFalloff;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = texture(_HaloFalloff, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.www * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat1.w;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0);
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
; Bound: 144
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %121 %122 %126 %128 
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
                                                      OpDecorate vs_TEXCOORD0 Location 126 
                                                      OpDecorate %128 Location 128 
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
                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
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
                                             %124 = OpTypeVector %6 2 
                                             %125 = OpTypePointer Output %124 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %127 = OpTypePointer Input %124 
                                Input f32_2* %128 = OpVariable Input 
                                         i32 %130 = OpConstant 4 
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
                                                      OpStore %121 %123 
                                       f32_2 %129 = OpLoad %128 
                              Uniform f32_4* %131 = OpAccessChain %20 %130 
                                       f32_4 %132 = OpLoad %131 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                       f32_2 %134 = OpFMul %129 %133 
                              Uniform f32_4* %135 = OpAccessChain %20 %130 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 2 3 
                                       f32_2 %138 = OpFAdd %134 %137 
                                                      OpStore vs_TEXCOORD0 %138 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                 Output f32* %142 = OpAccessChain %79 %27 %75 
                                                      OpStore %142 %141 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 58
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %10 %29 %42 %47 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 10 
                                             OpDecorate %19 DescriptorSet 19 
                                             OpDecorate %19 Binding 19 
                                             OpDecorate %23 DescriptorSet 23 
                                             OpDecorate %23 Binding 23 
                                             OpDecorate vs_TEXCOORD0 Location 29 
                                             OpDecorate %42 Location 42 
                                             OpDecorate %47 Location 47 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %13 = OpConstant 3.674022E-40 
                                 f32 %14 = OpConstant 3.674022E-40 
                        Private f32* %16 = OpVariable Private 
                                     %17 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %18 = OpTypePointer UniformConstant %17 
UniformConstant read_only Texture2D* %19 = OpVariable UniformConstant 
                                     %21 = OpTypeSampler 
                                     %22 = OpTypePointer UniformConstant %21 
            UniformConstant sampler* %23 = OpVariable UniformConstant 
                                     %25 = OpTypeSampledImage %17 
                                     %27 = OpTypeVector %6 2 
                                     %28 = OpTypePointer Input %27 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %31 = OpTypeVector %6 4 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %36 = OpTypeVector %6 3 
                                     %37 = OpTypePointer Private %36 
                      Private f32_3* %38 = OpVariable Private 
                                     %41 = OpTypePointer Input %31 
                        Input f32_4* %42 = OpVariable Input 
                                     %46 = OpTypePointer Output %31 
                       Output f32_4* %47 = OpVariable Output 
                                     %49 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                                 f32 %11 = OpLoad vs_TEXCOORD1 
                                             OpStore %8 %11 
                                 f32 %12 = OpLoad %8 
                                 f32 %15 = OpExtInst %1 43 %12 %13 %14 
                                             OpStore %8 %15 
                 read_only Texture2D %20 = OpLoad %19 
                             sampler %24 = OpLoad %23 
          read_only Texture2DSampled %26 = OpSampledImage %20 %24 
                               f32_2 %30 = OpLoad vs_TEXCOORD0 
                               f32_4 %32 = OpImageSampleImplicitLod %26 %30 
                                 f32 %35 = OpCompositeExtract %32 3 
                                             OpStore %16 %35 
                                 f32 %39 = OpLoad %16 
                               f32_3 %40 = OpCompositeConstruct %39 %39 %39 
                               f32_4 %43 = OpLoad %42 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               f32_3 %45 = OpFMul %40 %44 
                                             OpStore %38 %45 
                                 f32 %48 = OpLoad %16 
                         Output f32* %50 = OpAccessChain %47 %34 
                                             OpStore %50 %48 
                                 f32 %51 = OpLoad %8 
                               f32_3 %52 = OpCompositeConstruct %51 %51 %51 
                               f32_3 %53 = OpLoad %38 
                               f32_3 %54 = OpFMul %52 %53 
                               f32_4 %55 = OpLoad %47 
                               f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                             OpStore %47 %56 
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