//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Colors_RgbClamp" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 56585
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	float _Value8;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.z = max(u_xlat0.z, _Value5);
    u_xlat0.xy = max(u_xlat0.xy, vec2(_Value, _Value3));
    SV_Target0.w = u_xlat0.w;
    u_xlat1.x = min(u_xlat0.x, _Value2);
    u_xlat1.yz = min(u_xlat0.yz, vec2(_Value4, _Value6));
    u_xlat0.xyz = max(u_xlat1.xyz, vec3(vec3(_Value7, _Value7, _Value7)));
    SV_Target0.xyz = min(u_xlat0.xyz, vec3(_Value8));
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
; Bound: 122
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %67 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate %67 Location 67 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 8 
                                              %19 = OpTypePointer Uniform %7 
                                              %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %31 = OpTypePointer UniformConstant %30 
         UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                              %34 = OpTypeSampler 
                                              %35 = OpTypePointer UniformConstant %34 
                     UniformConstant sampler* %36 = OpVariable UniformConstant 
                                              %38 = OpTypeSampledImage %30 
                                              %43 = OpTypeInt 32 0 
                                          u32 %44 = OpConstant 2 
                                              %45 = OpTypePointer Private %6 
                                          i32 %48 = OpConstant 4 
                                              %49 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 0 
                                          i32 %59 = OpConstant 2 
                                              %66 = OpTypePointer Output %7 
                                Output f32_4* %67 = OpVariable Output 
                                          u32 %68 = OpConstant 3 
                                              %71 = OpTypePointer Output %6 
                                              %73 = OpTypeVector %6 3 
                                              %74 = OpTypePointer Private %73 
                               Private f32_3* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 0 
                                          i32 %79 = OpConstant 1 
                                          i32 %86 = OpConstant 3 
                                          i32 %89 = OpConstant 5 
                                          i32 %97 = OpConstant 6 
                                         i32 %114 = OpConstant 7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %20 = OpAccessChain %16 %18 
                                        f32_4 %21 = OpLoad %20 
                                        f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                        f32_2 %23 = OpFMul %13 %22 
                               Uniform f32_4* %24 = OpAccessChain %16 %18 
                                        f32_4 %25 = OpLoad %24 
                                        f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                        f32_2 %27 = OpFAdd %23 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                          read_only Texture2D %33 = OpLoad %32 
                                      sampler %37 = OpLoad %36 
                   read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                                                      OpStore %9 %42 
                                 Private f32* %46 = OpAccessChain %9 %44 
                                          f32 %47 = OpLoad %46 
                                 Uniform f32* %50 = OpAccessChain %16 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpExtInst %1 40 %47 %51 
                                 Private f32* %53 = OpAccessChain %9 %44 
                                                      OpStore %53 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                 Uniform f32* %57 = OpAccessChain %16 %56 
                                          f32 %58 = OpLoad %57 
                                 Uniform f32* %60 = OpAccessChain %16 %59 
                                          f32 %61 = OpLoad %60 
                                        f32_2 %62 = OpCompositeConstruct %58 %61 
                                        f32_2 %63 = OpExtInst %1 40 %55 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 2 3 
                                                      OpStore %9 %65 
                                 Private f32* %69 = OpAccessChain %9 %68 
                                          f32 %70 = OpLoad %69 
                                  Output f32* %72 = OpAccessChain %67 %68 
                                                      OpStore %72 %70 
                                 Private f32* %77 = OpAccessChain %9 %76 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %80 = OpAccessChain %16 %79 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpExtInst %1 37 %78 %81 
                                 Private f32* %83 = OpAccessChain %75 %76 
                                                      OpStore %83 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_2 %85 = OpVectorShuffle %84 %84 1 2 
                                 Uniform f32* %87 = OpAccessChain %16 %86 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %90 = OpAccessChain %16 %89 
                                          f32 %91 = OpLoad %90 
                                        f32_2 %92 = OpCompositeConstruct %88 %91 
                                        f32_2 %93 = OpExtInst %1 37 %85 %92 
                                        f32_3 %94 = OpLoad %75 
                                        f32_3 %95 = OpVectorShuffle %94 %93 0 3 4 
                                                      OpStore %75 %95 
                                        f32_3 %96 = OpLoad %75 
                                 Uniform f32* %98 = OpAccessChain %16 %97 
                                          f32 %99 = OpLoad %98 
                                Uniform f32* %100 = OpAccessChain %16 %97 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %16 %97 
                                         f32 %103 = OpLoad %102 
                                       f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                         f32 %105 = OpCompositeExtract %104 0 
                                         f32 %106 = OpCompositeExtract %104 1 
                                         f32 %107 = OpCompositeExtract %104 2 
                                       f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                       f32_3 %109 = OpExtInst %1 40 %96 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                Uniform f32* %115 = OpAccessChain %16 %114 
                                         f32 %116 = OpLoad %115 
                                       f32_3 %117 = OpCompositeConstruct %116 %116 %116 
                                       f32_3 %118 = OpExtInst %1 37 %113 %117 
                                       f32_4 %119 = OpLoad %67 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %67 %120 
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