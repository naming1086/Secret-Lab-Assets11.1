//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Edge_Edge_filter" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_RedAmplifier ("_RedAmplifier", Range(0, 10)) = 0
_GreenAmplifier ("_GreenAmplifier", Range(0, 10)) = 2
_BlueAmplifier ("_BlueAmplifier", Range(0, 10)) = 0
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 65196
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
uniform 	vec4 _ScreenResolution;
uniform 	float _RedAmplifier;
uniform 	float _GreenAmplifier;
uniform 	float _BlueAmplifier;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat1 = (-u_xlat1) + u_xlat2;
    u_xlat2 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = u_xlat2 / _ScreenResolution.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2 = (-u_xlat2) + u_xlat3;
    u_xlat1 = abs(u_xlat1) + abs(u_xlat2);
    u_xlat1 = u_xlat1 * vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.x = dot(u_xlat1, u_xlat1);
    u_xlat1.x = sqrt(u_xlat1.x);
    SV_Target0.xyz = u_xlat1.xxx * vec3(_RedAmplifier, _GreenAmplifier, _BlueAmplifier) + u_xlat0.xyz;
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
; Bound: 172
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %145 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %145 Location 145 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeStruct %7 %6 %6 %6 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 4 
                                              %19 = OpTypePointer Uniform %7 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          f32 %38 = OpConstant 3.674022E-40 
                                          f32 %39 = OpConstant 3.674022E-40 
                                          f32 %40 = OpConstant 3.674022E-40 
                                        f32_4 %41 = OpConstantComposite %38 %39 %38 %40 
                               Private f32_4* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                        f32_4 %78 = OpConstantComposite %39 %38 %40 %38 
                              Private f32_4* %107 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                       f32_4 %131 = OpConstantComposite %130 %130 %130 %130 
                                             %136 = OpTypeInt 32 0 
                                         u32 %137 = OpConstant 0 
                                             %138 = OpTypePointer Private %6 
                                             %144 = OpTypePointer Output %7 
                               Output f32_4* %145 = OpVariable Output 
                                             %146 = OpTypeVector %6 3 
                                         i32 %149 = OpConstant 1 
                                             %150 = OpTypePointer Uniform %6 
                                         i32 %153 = OpConstant 2 
                                         i32 %156 = OpConstant 3 
                                         u32 %166 = OpConstant 3 
                                             %169 = OpTypePointer Output %6 
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
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
                               Uniform f32_4* %34 = OpAccessChain %16 %33 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 1 0 1 
                                        f32_4 %37 = OpFMul %32 %36 
                                        f32_4 %42 = OpFAdd %37 %41 
                                                      OpStore %30 %42 
                                        f32_4 %43 = OpLoad %30 
                               Uniform f32_4* %44 = OpAccessChain %16 %33 
                                        f32_4 %45 = OpLoad %44 
                                        f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
                                        f32_4 %47 = OpFDiv %43 %46 
                                                      OpStore %30 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_4 %59 = OpLoad %30 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                                      OpStore %48 %61 
                          read_only Texture2D %62 = OpLoad %51 
                                      sampler %63 = OpLoad %55 
                   read_only Texture2DSampled %64 = OpSampledImage %62 %63 
                                        f32_4 %65 = OpLoad %30 
                                        f32_2 %66 = OpVectorShuffle %65 %65 2 3 
                                        f32_4 %67 = OpImageSampleImplicitLod %64 %66 
                                                      OpStore %30 %67 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFNegate %68 
                                        f32_4 %70 = OpLoad %48 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %30 %71 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 1 0 1 
                               Uniform f32_4* %74 = OpAccessChain %16 %33 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpVectorShuffle %75 %75 0 1 0 1 
                                        f32_4 %77 = OpFMul %73 %76 
                                        f32_4 %79 = OpFAdd %77 %78 
                                                      OpStore %48 %79 
                                        f32_4 %80 = OpLoad %9 
                                        f32_2 %81 = OpVectorShuffle %80 %80 0 1 
                               Uniform f32_4* %82 = OpAccessChain %16 %33 
                                        f32_4 %83 = OpLoad %82 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                                        f32_2 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 2 3 
                                                      OpStore %9 %87 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                               Uniform f32_4* %90 = OpAccessChain %16 %33 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFDiv %89 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %9 %95 
                          read_only Texture2D %96 = OpLoad %51 
                                      sampler %97 = OpLoad %55 
                   read_only Texture2DSampled %98 = OpSampledImage %96 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                       f32_4 %101 = OpImageSampleImplicitLod %98 %100 
                                                      OpStore %9 %101 
                                       f32_4 %102 = OpLoad %48 
                              Uniform f32_4* %103 = OpAccessChain %16 %33 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
                                       f32_4 %106 = OpFDiv %102 %105 
                                                      OpStore %48 %106 
                         read_only Texture2D %108 = OpLoad %51 
                                     sampler %109 = OpLoad %55 
                  read_only Texture2DSampled %110 = OpSampledImage %108 %109 
                                       f32_4 %111 = OpLoad %48 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_4 %113 = OpImageSampleImplicitLod %110 %112 
                                                      OpStore %107 %113 
                         read_only Texture2D %114 = OpLoad %51 
                                     sampler %115 = OpLoad %55 
                  read_only Texture2DSampled %116 = OpSampledImage %114 %115 
                                       f32_4 %117 = OpLoad %48 
                                       f32_2 %118 = OpVectorShuffle %117 %117 2 3 
                                       f32_4 %119 = OpImageSampleImplicitLod %116 %118 
                                                      OpStore %48 %119 
                                       f32_4 %120 = OpLoad %48 
                                       f32_4 %121 = OpFNegate %120 
                                       f32_4 %122 = OpLoad %107 
                                       f32_4 %123 = OpFAdd %121 %122 
                                                      OpStore %48 %123 
                                       f32_4 %124 = OpLoad %30 
                                       f32_4 %125 = OpExtInst %1 4 %124 
                                       f32_4 %126 = OpLoad %48 
                                       f32_4 %127 = OpExtInst %1 4 %126 
                                       f32_4 %128 = OpFAdd %125 %127 
                                                      OpStore %30 %128 
                                       f32_4 %129 = OpLoad %30 
                                       f32_4 %132 = OpFMul %129 %131 
                                                      OpStore %30 %132 
                                       f32_4 %133 = OpLoad %30 
                                       f32_4 %134 = OpLoad %30 
                                         f32 %135 = OpDot %133 %134 
                                Private f32* %139 = OpAccessChain %30 %137 
                                                      OpStore %139 %135 
                                Private f32* %140 = OpAccessChain %30 %137 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpExtInst %1 31 %141 
                                Private f32* %143 = OpAccessChain %30 %137 
                                                      OpStore %143 %142 
                                       f32_4 %147 = OpLoad %30 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 0 0 
                                Uniform f32* %151 = OpAccessChain %16 %149 
                                         f32 %152 = OpLoad %151 
                                Uniform f32* %154 = OpAccessChain %16 %153 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %16 %156 
                                         f32 %158 = OpLoad %157 
                                       f32_3 %159 = OpCompositeConstruct %152 %155 %158 
                                       f32_3 %160 = OpFMul %148 %159 
                                       f32_4 %161 = OpLoad %9 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpFAdd %160 %162 
                                       f32_4 %164 = OpLoad %145 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %145 %165 
                                Private f32* %167 = OpAccessChain %9 %166 
                                         f32 %168 = OpLoad %167 
                                 Output f32* %170 = OpAccessChain %145 %166 
                                                      OpStore %170 %168 
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