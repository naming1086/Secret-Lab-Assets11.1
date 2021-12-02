//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Image Effects/Cinematic/Bloom" {
Properties {
_MainTex ("", 2D) = "" { }
_BaseTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 57031
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat6 = max(u_xlat0.y, u_xlat0.x);
    u_xlat6 = max(u_xlat0.z, u_xlat6);
    u_xlat1 = u_xlat6 + (-_Curve.x);
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat1 = min(u_xlat1, _Curve.y);
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat1 * _Curve.z;
    u_xlat3 = u_xlat6 + (-_Threshold);
    u_xlat6 = max(u_xlat6, 9.99999975e-06);
    u_xlat1 = max(u_xlat3, u_xlat1);
    u_xlat6 = u_xlat1 / u_xlat6;
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %26 %103 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpMemberDecorate %11 0 Offset 11 
                                                  OpMemberDecorate %11 1 Offset 11 
                                                  OpMemberDecorate %11 2 Offset 11 
                                                  OpMemberDecorate %11 3 Offset 11 
                                                  OpDecorate %11 Block 
                                                  OpDecorate %13 DescriptorSet 13 
                                                  OpDecorate %13 Binding 13 
                                                  OpDecorate vs_TEXCOORD0 Location 26 
                                                  OpDecorate %33 DescriptorSet 33 
                                                  OpDecorate %33 Binding 33 
                                                  OpDecorate %37 DescriptorSet 37 
                                                  OpDecorate %37 Binding 37 
                                                  OpDecorate %103 Location 103 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 3 
                                           %8 = OpTypePointer Private %7 
                            Private f32_3* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 2 
                                          %11 = OpTypeStruct %10 %6 %6 %7 
                                          %12 = OpTypePointer Uniform %11 
Uniform struct {f32_2; f32; f32; f32_3;}* %13 = OpVariable Uniform 
                                          %14 = OpTypeInt 32 1 
                                      i32 %15 = OpConstant 0 
                                          %16 = OpTypePointer Uniform %10 
                                      i32 %19 = OpConstant 1 
                                          %20 = OpTypePointer Uniform %6 
                                          %25 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %32 = OpTypePointer UniformConstant %31 
     UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                          %35 = OpTypeSampler 
                                          %36 = OpTypePointer UniformConstant %35 
                 UniformConstant sampler* %37 = OpVariable UniformConstant 
                                          %39 = OpTypeSampledImage %31 
                                          %43 = OpTypeVector %6 4 
                                      f32 %47 = OpConstant 3.674022E-40 
                                    f32_3 %48 = OpConstantComposite %47 %47 %47 
                                          %50 = OpTypePointer Private %6 
                             Private f32* %51 = OpVariable Private 
                                          %52 = OpTypeInt 32 0 
                                      u32 %53 = OpConstant 1 
                                      u32 %56 = OpConstant 0 
                                      u32 %60 = OpConstant 2 
                             Private f32* %65 = OpVariable Private 
                                      i32 %67 = OpConstant 3 
                                      f32 %73 = OpConstant 3.674022E-40 
                             Private f32* %86 = OpVariable Private 
                                      i32 %88 = OpConstant 2 
                                      f32 %94 = OpConstant 3.674022E-40 
                                         %102 = OpTypePointer Output %43 
                           Output f32_4* %103 = OpVariable Output 
                                     u32 %110 = OpConstant 3 
                                         %111 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                           Uniform f32_2* %17 = OpAccessChain %13 %15 
                                    f32_2 %18 = OpLoad %17 
                             Uniform f32* %21 = OpAccessChain %13 %19 
                                      f32 %22 = OpLoad %21 
                                    f32_2 %23 = OpCompositeConstruct %22 %22 
                                    f32_2 %24 = OpFMul %18 %23 
                                    f32_2 %27 = OpLoad vs_TEXCOORD0 
                                    f32_2 %28 = OpFAdd %24 %27 
                                    f32_3 %29 = OpLoad %9 
                                    f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                  OpStore %9 %30 
                      read_only Texture2D %34 = OpLoad %33 
                                  sampler %38 = OpLoad %37 
               read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                                    f32_3 %41 = OpLoad %9 
                                    f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                    f32_4 %44 = OpImageSampleImplicitLod %40 %42 
                                    f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                                  OpStore %9 %45 
                                    f32_3 %46 = OpLoad %9 
                                    f32_3 %49 = OpExtInst %1 37 %46 %48 
                                                  OpStore %9 %49 
                             Private f32* %54 = OpAccessChain %9 %53 
                                      f32 %55 = OpLoad %54 
                             Private f32* %57 = OpAccessChain %9 %56 
                                      f32 %58 = OpLoad %57 
                                      f32 %59 = OpExtInst %1 40 %55 %58 
                                                  OpStore %51 %59 
                             Private f32* %61 = OpAccessChain %9 %60 
                                      f32 %62 = OpLoad %61 
                                      f32 %63 = OpLoad %51 
                                      f32 %64 = OpExtInst %1 40 %62 %63 
                                                  OpStore %51 %64 
                                      f32 %66 = OpLoad %51 
                             Uniform f32* %68 = OpAccessChain %13 %67 %56 
                                      f32 %69 = OpLoad %68 
                                      f32 %70 = OpFNegate %69 
                                      f32 %71 = OpFAdd %66 %70 
                                                  OpStore %65 %71 
                                      f32 %72 = OpLoad %65 
                                      f32 %74 = OpExtInst %1 40 %72 %73 
                                                  OpStore %65 %74 
                                      f32 %75 = OpLoad %65 
                             Uniform f32* %76 = OpAccessChain %13 %67 %53 
                                      f32 %77 = OpLoad %76 
                                      f32 %78 = OpExtInst %1 37 %75 %77 
                                                  OpStore %65 %78 
                                      f32 %79 = OpLoad %65 
                                      f32 %80 = OpLoad %65 
                                      f32 %81 = OpFMul %79 %80 
                                                  OpStore %65 %81 
                                      f32 %82 = OpLoad %65 
                             Uniform f32* %83 = OpAccessChain %13 %67 %60 
                                      f32 %84 = OpLoad %83 
                                      f32 %85 = OpFMul %82 %84 
                                                  OpStore %65 %85 
                                      f32 %87 = OpLoad %51 
                             Uniform f32* %89 = OpAccessChain %13 %88 
                                      f32 %90 = OpLoad %89 
                                      f32 %91 = OpFNegate %90 
                                      f32 %92 = OpFAdd %87 %91 
                                                  OpStore %86 %92 
                                      f32 %93 = OpLoad %51 
                                      f32 %95 = OpExtInst %1 40 %93 %94 
                                                  OpStore %51 %95 
                                      f32 %96 = OpLoad %86 
                                      f32 %97 = OpLoad %65 
                                      f32 %98 = OpExtInst %1 40 %96 %97 
                                                  OpStore %65 %98 
                                      f32 %99 = OpLoad %65 
                                     f32 %100 = OpLoad %51 
                                     f32 %101 = OpFDiv %99 %100 
                                                  OpStore %51 %101 
                                     f32 %104 = OpLoad %51 
                                   f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                   f32_3 %106 = OpLoad %9 
                                   f32_3 %107 = OpFMul %105 %106 
                                   f32_4 %108 = OpLoad %103 
                                   f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                  OpStore %103 %109 
                             Output f32* %112 = OpAccessChain %103 %110 
                                                  OpStore %112 %73 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat6 = max(u_xlat0.y, u_xlat0.x);
    u_xlat6 = max(u_xlat0.z, u_xlat6);
    u_xlat1.x = u_xlat6 + (-_Curve.x);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.y);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.z;
    u_xlat3 = u_xlat6 + (-_Threshold);
    u_xlat6 = max(u_xlat6, 9.99999975e-06);
    u_xlat1.x = max(u_xlat3, u_xlat1.x);
    u_xlat6 = u_xlat1.x / u_xlat6;
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 143
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %26 %132 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpMemberDecorate %11 0 Offset 11 
                                                  OpMemberDecorate %11 1 Offset 11 
                                                  OpMemberDecorate %11 2 Offset 11 
                                                  OpMemberDecorate %11 3 Offset 11 
                                                  OpDecorate %11 Block 
                                                  OpDecorate %13 DescriptorSet 13 
                                                  OpDecorate %13 Binding 13 
                                                  OpDecorate vs_TEXCOORD0 Location 26 
                                                  OpDecorate %33 DescriptorSet 33 
                                                  OpDecorate %33 Binding 33 
                                                  OpDecorate %37 DescriptorSet 37 
                                                  OpDecorate %37 Binding 37 
                                                  OpDecorate %132 Location 132 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 3 
                                           %8 = OpTypePointer Private %7 
                            Private f32_3* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 2 
                                          %11 = OpTypeStruct %10 %6 %6 %7 
                                          %12 = OpTypePointer Uniform %11 
Uniform struct {f32_2; f32; f32; f32_3;}* %13 = OpVariable Uniform 
                                          %14 = OpTypeInt 32 1 
                                      i32 %15 = OpConstant 0 
                                          %16 = OpTypePointer Uniform %10 
                                      i32 %19 = OpConstant 1 
                                          %20 = OpTypePointer Uniform %6 
                                          %25 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %32 = OpTypePointer UniformConstant %31 
     UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                          %35 = OpTypeSampler 
                                          %36 = OpTypePointer UniformConstant %35 
                 UniformConstant sampler* %37 = OpVariable UniformConstant 
                                          %39 = OpTypeSampledImage %31 
                                          %43 = OpTypeVector %6 4 
                                      f32 %47 = OpConstant 3.674022E-40 
                                    f32_3 %48 = OpConstantComposite %47 %47 %47 
                           Private f32_3* %50 = OpVariable Private 
                                      f32 %52 = OpConstant 3.674022E-40 
                                    f32_3 %53 = OpConstantComposite %52 %52 %52 
                                      f32 %55 = OpConstant 3.674022E-40 
                                    f32_3 %56 = OpConstantComposite %55 %55 %55 
                                      f32 %61 = OpConstant 3.674022E-40 
                                    f32_3 %62 = OpConstantComposite %61 %61 %61 
                                          %67 = OpTypePointer Private %6 
                             Private f32* %68 = OpVariable Private 
                                          %69 = OpTypeInt 32 0 
                                      u32 %70 = OpConstant 1 
                                      u32 %73 = OpConstant 0 
                                      u32 %77 = OpConstant 2 
                                      i32 %83 = OpConstant 3 
                                      f32 %91 = OpConstant 3.674022E-40 
                            Private f32* %112 = OpVariable Private 
                                     i32 %114 = OpConstant 2 
                                     f32 %120 = OpConstant 3.674022E-40 
                                         %131 = OpTypePointer Output %43 
                           Output f32_4* %132 = OpVariable Output 
                                     u32 %139 = OpConstant 3 
                                         %140 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                           Uniform f32_2* %17 = OpAccessChain %13 %15 
                                    f32_2 %18 = OpLoad %17 
                             Uniform f32* %21 = OpAccessChain %13 %19 
                                      f32 %22 = OpLoad %21 
                                    f32_2 %23 = OpCompositeConstruct %22 %22 
                                    f32_2 %24 = OpFMul %18 %23 
                                    f32_2 %27 = OpLoad vs_TEXCOORD0 
                                    f32_2 %28 = OpFAdd %24 %27 
                                    f32_3 %29 = OpLoad %9 
                                    f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                  OpStore %9 %30 
                      read_only Texture2D %34 = OpLoad %33 
                                  sampler %38 = OpLoad %37 
               read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                                    f32_3 %41 = OpLoad %9 
                                    f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                    f32_4 %44 = OpImageSampleImplicitLod %40 %42 
                                    f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                                  OpStore %9 %45 
                                    f32_3 %46 = OpLoad %9 
                                    f32_3 %49 = OpExtInst %1 37 %46 %48 
                                                  OpStore %9 %49 
                                    f32_3 %51 = OpLoad %9 
                                    f32_3 %54 = OpFMul %51 %53 
                                    f32_3 %57 = OpFAdd %54 %56 
                                                  OpStore %50 %57 
                                    f32_3 %58 = OpLoad %9 
                                    f32_3 %59 = OpLoad %50 
                                    f32_3 %60 = OpFMul %58 %59 
                                    f32_3 %63 = OpFAdd %60 %62 
                                                  OpStore %50 %63 
                                    f32_3 %64 = OpLoad %9 
                                    f32_3 %65 = OpLoad %50 
                                    f32_3 %66 = OpFMul %64 %65 
                                                  OpStore %9 %66 
                             Private f32* %71 = OpAccessChain %9 %70 
                                      f32 %72 = OpLoad %71 
                             Private f32* %74 = OpAccessChain %9 %73 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpExtInst %1 40 %72 %75 
                                                  OpStore %68 %76 
                             Private f32* %78 = OpAccessChain %9 %77 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %68 
                                      f32 %81 = OpExtInst %1 40 %79 %80 
                                                  OpStore %68 %81 
                                      f32 %82 = OpLoad %68 
                             Uniform f32* %84 = OpAccessChain %13 %83 %73 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFNegate %85 
                                      f32 %87 = OpFAdd %82 %86 
                             Private f32* %88 = OpAccessChain %50 %73 
                                                  OpStore %88 %87 
                             Private f32* %89 = OpAccessChain %50 %73 
                                      f32 %90 = OpLoad %89 
                                      f32 %92 = OpExtInst %1 40 %90 %91 
                             Private f32* %93 = OpAccessChain %50 %73 
                                                  OpStore %93 %92 
                             Private f32* %94 = OpAccessChain %50 %73 
                                      f32 %95 = OpLoad %94 
                             Uniform f32* %96 = OpAccessChain %13 %83 %70 
                                      f32 %97 = OpLoad %96 
                                      f32 %98 = OpExtInst %1 37 %95 %97 
                             Private f32* %99 = OpAccessChain %50 %73 
                                                  OpStore %99 %98 
                            Private f32* %100 = OpAccessChain %50 %73 
                                     f32 %101 = OpLoad %100 
                            Private f32* %102 = OpAccessChain %50 %73 
                                     f32 %103 = OpLoad %102 
                                     f32 %104 = OpFMul %101 %103 
                            Private f32* %105 = OpAccessChain %50 %73 
                                                  OpStore %105 %104 
                            Private f32* %106 = OpAccessChain %50 %73 
                                     f32 %107 = OpLoad %106 
                            Uniform f32* %108 = OpAccessChain %13 %83 %77 
                                     f32 %109 = OpLoad %108 
                                     f32 %110 = OpFMul %107 %109 
                            Private f32* %111 = OpAccessChain %50 %73 
                                                  OpStore %111 %110 
                                     f32 %113 = OpLoad %68 
                            Uniform f32* %115 = OpAccessChain %13 %114 
                                     f32 %116 = OpLoad %115 
                                     f32 %117 = OpFNegate %116 
                                     f32 %118 = OpFAdd %113 %117 
                                                  OpStore %112 %118 
                                     f32 %119 = OpLoad %68 
                                     f32 %121 = OpExtInst %1 40 %119 %120 
                                                  OpStore %68 %121 
                                     f32 %122 = OpLoad %112 
                            Private f32* %123 = OpAccessChain %50 %73 
                                     f32 %124 = OpLoad %123 
                                     f32 %125 = OpExtInst %1 40 %122 %124 
                            Private f32* %126 = OpAccessChain %50 %73 
                                                  OpStore %126 %125 
                            Private f32* %127 = OpAccessChain %50 %73 
                                     f32 %128 = OpLoad %127 
                                     f32 %129 = OpLoad %68 
                                     f32 %130 = OpFDiv %128 %129 
                                                  OpStore %68 %130 
                                     f32 %133 = OpLoad %68 
                                   f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                   f32_3 %135 = OpLoad %9 
                                   f32_3 %136 = OpFMul %134 %135 
                                   f32_4 %137 = OpLoad %132 
                                   f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                  OpStore %132 %138 
                             Output f32* %141 = OpAccessChain %132 %139 
                                                  OpStore %141 %91 
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 89054
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat8;
float u_xlat21;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat3 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat3.xyz = min(u_xlat3.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat4.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat5 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat5.xyz = min(u_xlat5.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat6.xyz = min(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = max(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = max(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat3.xyz = min(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat4.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat4.xyz = min(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = max(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat3.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat21 = max(u_xlat0.y, u_xlat0.x);
    u_xlat21 = max(u_xlat0.z, u_xlat21);
    u_xlat1.x = u_xlat21 + (-_Curve.x);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.y);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.z;
    u_xlat8 = u_xlat21 + (-_Threshold);
    u_xlat21 = max(u_xlat21, 9.99999975e-06);
    u_xlat1.x = max(u_xlat8, u_xlat1.x);
    u_xlat21 = u_xlat1.x / u_xlat21;
    SV_Target0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 268
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %28 %256 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpMemberDecorate %12 0 Offset 12 
                                                  OpMemberDecorate %12 1 Offset 12 
                                                  OpMemberDecorate %12 2 Offset 12 
                                                  OpMemberDecorate %12 3 Offset 12 
                                                  OpDecorate %12 Block 
                                                  OpDecorate %14 DescriptorSet 14 
                                                  OpDecorate %14 Binding 14 
                                                  OpDecorate vs_TEXCOORD0 Location 28 
                                                  OpDecorate %48 DescriptorSet 48 
                                                  OpDecorate %48 Binding 48 
                                                  OpDecorate %52 DescriptorSet 52 
                                                  OpDecorate %52 Binding 52 
                                                  OpDecorate %256 Location 256 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 2 
                                          %11 = OpTypeVector %6 3 
                                          %12 = OpTypeStruct %10 %6 %6 %11 
                                          %13 = OpTypePointer Uniform %12 
Uniform struct {f32_2; f32; f32; f32_3;}* %14 = OpVariable Uniform 
                                          %15 = OpTypeInt 32 1 
                                      i32 %16 = OpConstant 0 
                                          %17 = OpTypePointer Uniform %10 
                                      i32 %21 = OpConstant 1 
                                          %22 = OpTypePointer Uniform %6 
                                          %27 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                           Private f32_4* %32 = OpVariable Private 
                                      f32 %37 = OpConstant 3.674022E-40 
                                      f32 %38 = OpConstant 3.674022E-40 
                                    f32_4 %39 = OpConstantComposite %37 %38 %38 %37 
                                          %44 = OpTypePointer Private %11 
                           Private f32_3* %45 = OpVariable Private 
                                          %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %47 = OpTypePointer UniformConstant %46 
     UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                          %50 = OpTypeSampler 
                                          %51 = OpTypePointer UniformConstant %50 
                 UniformConstant sampler* %52 = OpVariable UniformConstant 
                                          %54 = OpTypeSampledImage %46 
                                      f32 %71 = OpConstant 3.674022E-40 
                                    f32_3 %72 = OpConstantComposite %71 %71 %71 
                           Private f32_3* %78 = OpVariable Private 
                           Private f32_3* %94 = OpVariable Private 
                           Private f32_3* %98 = OpVariable Private 
                          Private f32_3* %125 = OpVariable Private 
                                         %192 = OpTypePointer Private %6 
                            Private f32* %193 = OpVariable Private 
                                         %194 = OpTypeInt 32 0 
                                     u32 %195 = OpConstant 1 
                                     u32 %198 = OpConstant 0 
                                     u32 %202 = OpConstant 2 
                                     i32 %208 = OpConstant 3 
                            Private f32* %236 = OpVariable Private 
                                     i32 %238 = OpConstant 2 
                                     f32 %244 = OpConstant 3.674022E-40 
                                         %255 = OpTypePointer Output %7 
                           Output f32_4* %256 = OpVariable Output 
                                     u32 %264 = OpConstant 3 
                                         %265 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                           Uniform f32_2* %18 = OpAccessChain %14 %16 
                                    f32_2 %19 = OpLoad %18 
                                    f32_4 %20 = OpVectorShuffle %19 %19 0 1 0 1 
                             Uniform f32* %23 = OpAccessChain %14 %21 
                                      f32 %24 = OpLoad %23 
                                    f32_4 %25 = OpCompositeConstruct %24 %24 %24 %24 
                                    f32_4 %26 = OpFMul %20 %25 
                                    f32_2 %29 = OpLoad vs_TEXCOORD0 
                                    f32_4 %30 = OpVectorShuffle %29 %29 0 1 0 1 
                                    f32_4 %31 = OpFAdd %26 %30 
                                                  OpStore %9 %31 
                           Uniform f32_2* %33 = OpAccessChain %14 %16 
                                    f32_2 %34 = OpLoad %33 
                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 1 
                                    f32_4 %36 = OpFNegate %35 
                                    f32_4 %40 = OpFMul %36 %39 
                                    f32_4 %41 = OpLoad %9 
                                    f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
                                    f32_4 %43 = OpFAdd %40 %42 
                                                  OpStore %32 %43 
                      read_only Texture2D %49 = OpLoad %48 
                                  sampler %53 = OpLoad %52 
               read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                    f32_4 %56 = OpLoad %32 
                                    f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                    f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                    f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                                  OpStore %45 %59 
                      read_only Texture2D %60 = OpLoad %48 
                                  sampler %61 = OpLoad %52 
               read_only Texture2DSampled %62 = OpSampledImage %60 %61 
                                    f32_4 %63 = OpLoad %32 
                                    f32_2 %64 = OpVectorShuffle %63 %63 2 3 
                                    f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                    f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                    f32_4 %67 = OpLoad %32 
                                    f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                  OpStore %32 %68 
                                    f32_4 %69 = OpLoad %32 
                                    f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                    f32_3 %73 = OpExtInst %1 37 %70 %72 
                                    f32_4 %74 = OpLoad %32 
                                    f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                  OpStore %32 %75 
                                    f32_3 %76 = OpLoad %45 
                                    f32_3 %77 = OpExtInst %1 37 %76 %72 
                                                  OpStore %45 %77 
                      read_only Texture2D %79 = OpLoad %48 
                                  sampler %80 = OpLoad %52 
               read_only Texture2DSampled %81 = OpSampledImage %79 %80 
                                    f32_4 %82 = OpLoad %9 
                                    f32_2 %83 = OpVectorShuffle %82 %82 2 3 
                                    f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                    f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                  OpStore %78 %85 
                           Uniform f32_2* %86 = OpAccessChain %14 %16 
                                    f32_2 %87 = OpLoad %86 
                                    f32_4 %88 = OpVectorShuffle %87 %87 0 0 0 1 
                                    f32_4 %89 = OpFMul %88 %39 
                                    f32_4 %90 = OpLoad %9 
                                    f32_4 %91 = OpFAdd %89 %90 
                                                  OpStore %9 %91 
                                    f32_3 %92 = OpLoad %78 
                                    f32_3 %93 = OpExtInst %1 37 %92 %72 
                                                  OpStore %78 %93 
                                    f32_3 %95 = OpLoad %45 
                                    f32_3 %96 = OpLoad %78 
                                    f32_3 %97 = OpFAdd %95 %96 
                                                  OpStore %94 %97 
                      read_only Texture2D %99 = OpLoad %48 
                                 sampler %100 = OpLoad %52 
              read_only Texture2DSampled %101 = OpSampledImage %99 %100 
                                   f32_4 %102 = OpLoad %9 
                                   f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                   f32_4 %104 = OpImageSampleImplicitLod %101 %103 
                                   f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                                  OpStore %98 %105 
                     read_only Texture2D %106 = OpLoad %48 
                                 sampler %107 = OpLoad %52 
              read_only Texture2DSampled %108 = OpSampledImage %106 %107 
                                   f32_4 %109 = OpLoad %9 
                                   f32_2 %110 = OpVectorShuffle %109 %109 2 3 
                                   f32_4 %111 = OpImageSampleImplicitLod %108 %110 
                                   f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                   f32_4 %113 = OpLoad %9 
                                   f32_4 %114 = OpVectorShuffle %113 %112 4 5 6 3 
                                                  OpStore %9 %114 
                                   f32_4 %115 = OpLoad %9 
                                   f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                   f32_3 %117 = OpExtInst %1 37 %116 %72 
                                   f32_4 %118 = OpLoad %9 
                                   f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                  OpStore %9 %119 
                                   f32_3 %120 = OpLoad %98 
                                   f32_3 %121 = OpExtInst %1 37 %120 %72 
                                                  OpStore %98 %121 
                                   f32_3 %122 = OpLoad %94 
                                   f32_3 %123 = OpLoad %98 
                                   f32_3 %124 = OpFAdd %122 %123 
                                                  OpStore %94 %124 
                                   f32_3 %126 = OpLoad %45 
                                   f32_3 %127 = OpLoad %78 
                                   f32_3 %128 = OpExtInst %1 37 %126 %127 
                                                  OpStore %125 %128 
                                   f32_3 %129 = OpLoad %45 
                                   f32_3 %130 = OpLoad %78 
                                   f32_3 %131 = OpExtInst %1 40 %129 %130 
                                                  OpStore %45 %131 
                                   f32_3 %132 = OpLoad %98 
                                   f32_3 %133 = OpLoad %45 
                                   f32_3 %134 = OpExtInst %1 40 %132 %133 
                                                  OpStore %45 %134 
                                   f32_3 %135 = OpLoad %98 
                                   f32_3 %136 = OpLoad %125 
                                   f32_3 %137 = OpExtInst %1 37 %135 %136 
                                                  OpStore %78 %137 
                                   f32_3 %138 = OpLoad %78 
                                   f32_3 %139 = OpFNegate %138 
                                   f32_3 %140 = OpLoad %94 
                                   f32_3 %141 = OpFAdd %139 %140 
                                                  OpStore %78 %141 
                                   f32_3 %142 = OpLoad %45 
                                   f32_3 %143 = OpFNegate %142 
                                   f32_3 %144 = OpLoad %78 
                                   f32_3 %145 = OpFAdd %143 %144 
                                                  OpStore %45 %145 
                                   f32_4 %146 = OpLoad %32 
                                   f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                   f32_3 %148 = OpLoad %45 
                                   f32_3 %149 = OpFAdd %147 %148 
                                                  OpStore %78 %149 
                                   f32_4 %150 = OpLoad %9 
                                   f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                   f32_3 %152 = OpLoad %78 
                                   f32_3 %153 = OpFAdd %151 %152 
                                                  OpStore %78 %153 
                                   f32_4 %154 = OpLoad %32 
                                   f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                   f32_3 %156 = OpLoad %45 
                                   f32_3 %157 = OpExtInst %1 37 %155 %156 
                                                  OpStore %94 %157 
                                   f32_4 %158 = OpLoad %32 
                                   f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                   f32_3 %160 = OpLoad %45 
                                   f32_3 %161 = OpExtInst %1 40 %159 %160 
                                   f32_4 %162 = OpLoad %32 
                                   f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                  OpStore %32 %163 
                                   f32_4 %164 = OpLoad %9 
                                   f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                   f32_4 %166 = OpLoad %32 
                                   f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                   f32_3 %168 = OpExtInst %1 40 %165 %167 
                                   f32_4 %169 = OpLoad %32 
                                   f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                  OpStore %32 %170 
                                   f32_4 %171 = OpLoad %9 
                                   f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                   f32_3 %173 = OpLoad %94 
                                   f32_3 %174 = OpExtInst %1 37 %172 %173 
                                   f32_4 %175 = OpLoad %9 
                                   f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                  OpStore %9 %176 
                                   f32_4 %177 = OpLoad %9 
                                   f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                   f32_3 %179 = OpFNegate %178 
                                   f32_3 %180 = OpLoad %78 
                                   f32_3 %181 = OpFAdd %179 %180 
                                   f32_4 %182 = OpLoad %9 
                                   f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                  OpStore %9 %183 
                                   f32_4 %184 = OpLoad %32 
                                   f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                   f32_3 %186 = OpFNegate %185 
                                   f32_4 %187 = OpLoad %9 
                                   f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                   f32_3 %189 = OpFAdd %186 %188 
                                   f32_4 %190 = OpLoad %9 
                                   f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                  OpStore %9 %191 
                            Private f32* %196 = OpAccessChain %9 %195 
                                     f32 %197 = OpLoad %196 
                            Private f32* %199 = OpAccessChain %9 %198 
                                     f32 %200 = OpLoad %199 
                                     f32 %201 = OpExtInst %1 40 %197 %200 
                                                  OpStore %193 %201 
                            Private f32* %203 = OpAccessChain %9 %202 
                                     f32 %204 = OpLoad %203 
                                     f32 %205 = OpLoad %193 
                                     f32 %206 = OpExtInst %1 40 %204 %205 
                                                  OpStore %193 %206 
                                     f32 %207 = OpLoad %193 
                            Uniform f32* %209 = OpAccessChain %14 %208 %198 
                                     f32 %210 = OpLoad %209 
                                     f32 %211 = OpFNegate %210 
                                     f32 %212 = OpFAdd %207 %211 
                            Private f32* %213 = OpAccessChain %32 %198 
                                                  OpStore %213 %212 
                            Private f32* %214 = OpAccessChain %32 %198 
                                     f32 %215 = OpLoad %214 
                                     f32 %216 = OpExtInst %1 40 %215 %38 
                            Private f32* %217 = OpAccessChain %32 %198 
                                                  OpStore %217 %216 
                            Private f32* %218 = OpAccessChain %32 %198 
                                     f32 %219 = OpLoad %218 
                            Uniform f32* %220 = OpAccessChain %14 %208 %195 
                                     f32 %221 = OpLoad %220 
                                     f32 %222 = OpExtInst %1 37 %219 %221 
                            Private f32* %223 = OpAccessChain %32 %198 
                                                  OpStore %223 %222 
                            Private f32* %224 = OpAccessChain %32 %198 
                                     f32 %225 = OpLoad %224 
                            Private f32* %226 = OpAccessChain %32 %198 
                                     f32 %227 = OpLoad %226 
                                     f32 %228 = OpFMul %225 %227 
                            Private f32* %229 = OpAccessChain %32 %198 
                                                  OpStore %229 %228 
                            Private f32* %230 = OpAccessChain %32 %198 
                                     f32 %231 = OpLoad %230 
                            Uniform f32* %232 = OpAccessChain %14 %208 %202 
                                     f32 %233 = OpLoad %232 
                                     f32 %234 = OpFMul %231 %233 
                            Private f32* %235 = OpAccessChain %32 %198 
                                                  OpStore %235 %234 
                                     f32 %237 = OpLoad %193 
                            Uniform f32* %239 = OpAccessChain %14 %238 
                                     f32 %240 = OpLoad %239 
                                     f32 %241 = OpFNegate %240 
                                     f32 %242 = OpFAdd %237 %241 
                                                  OpStore %236 %242 
                                     f32 %243 = OpLoad %193 
                                     f32 %245 = OpExtInst %1 40 %243 %244 
                                                  OpStore %193 %245 
                                     f32 %246 = OpLoad %236 
                            Private f32* %247 = OpAccessChain %32 %198 
                                     f32 %248 = OpLoad %247 
                                     f32 %249 = OpExtInst %1 40 %246 %248 
                            Private f32* %250 = OpAccessChain %32 %198 
                                                  OpStore %250 %249 
                            Private f32* %251 = OpAccessChain %32 %198 
                                     f32 %252 = OpLoad %251 
                                     f32 %253 = OpLoad %193 
                                     f32 %254 = OpFDiv %252 %253 
                                                  OpStore %193 %254 
                                     f32 %257 = OpLoad %193 
                                   f32_3 %258 = OpCompositeConstruct %257 %257 %257 
                                   f32_4 %259 = OpLoad %9 
                                   f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                   f32_3 %261 = OpFMul %258 %260 
                                   f32_4 %262 = OpLoad %256 
                                   f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                  OpStore %256 %263 
                             Output f32* %266 = OpAccessChain %256 %264 
                                                  OpStore %266 %38 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat8;
float u_xlat21;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat3 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat3.xyz = min(u_xlat3.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat4.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat5 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat5.xyz = min(u_xlat5.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat6.xyz = min(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = max(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = max(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat3.xyz = min(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat4.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat4.xyz = min(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = max(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat3.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat21 = max(u_xlat0.y, u_xlat0.x);
    u_xlat21 = max(u_xlat0.z, u_xlat21);
    u_xlat1.x = u_xlat21 + (-_Curve.x);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.y);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.z;
    u_xlat8 = u_xlat21 + (-_Threshold);
    u_xlat21 = max(u_xlat21, 9.99999975e-06);
    u_xlat1.x = max(u_xlat8, u_xlat1.x);
    u_xlat21 = u_xlat1.x / u_xlat21;
    SV_Target0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 295
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %28 %283 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpMemberDecorate %12 0 Offset 12 
                                                  OpMemberDecorate %12 1 Offset 12 
                                                  OpMemberDecorate %12 2 Offset 12 
                                                  OpMemberDecorate %12 3 Offset 12 
                                                  OpDecorate %12 Block 
                                                  OpDecorate %14 DescriptorSet 14 
                                                  OpDecorate %14 Binding 14 
                                                  OpDecorate vs_TEXCOORD0 Location 28 
                                                  OpDecorate %48 DescriptorSet 48 
                                                  OpDecorate %48 Binding 48 
                                                  OpDecorate %52 DescriptorSet 52 
                                                  OpDecorate %52 Binding 52 
                                                  OpDecorate %283 Location 283 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 2 
                                          %11 = OpTypeVector %6 3 
                                          %12 = OpTypeStruct %10 %6 %6 %11 
                                          %13 = OpTypePointer Uniform %12 
Uniform struct {f32_2; f32; f32; f32_3;}* %14 = OpVariable Uniform 
                                          %15 = OpTypeInt 32 1 
                                      i32 %16 = OpConstant 0 
                                          %17 = OpTypePointer Uniform %10 
                                      i32 %21 = OpConstant 1 
                                          %22 = OpTypePointer Uniform %6 
                                          %27 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                           Private f32_4* %32 = OpVariable Private 
                                      f32 %37 = OpConstant 3.674022E-40 
                                      f32 %38 = OpConstant 3.674022E-40 
                                    f32_4 %39 = OpConstantComposite %37 %38 %38 %37 
                                          %44 = OpTypePointer Private %11 
                           Private f32_3* %45 = OpVariable Private 
                                          %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %47 = OpTypePointer UniformConstant %46 
     UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                          %50 = OpTypeSampler 
                                          %51 = OpTypePointer UniformConstant %50 
                 UniformConstant sampler* %52 = OpVariable UniformConstant 
                                          %54 = OpTypeSampledImage %46 
                                      f32 %71 = OpConstant 3.674022E-40 
                                    f32_3 %72 = OpConstantComposite %71 %71 %71 
                           Private f32_3* %78 = OpVariable Private 
                           Private f32_3* %94 = OpVariable Private 
                           Private f32_3* %98 = OpVariable Private 
                          Private f32_3* %125 = OpVariable Private 
                                     f32 %194 = OpConstant 3.674022E-40 
                                   f32_3 %195 = OpConstantComposite %194 %194 %194 
                                     f32 %197 = OpConstant 3.674022E-40 
                                   f32_3 %198 = OpConstantComposite %197 %197 %197 
                                     f32 %207 = OpConstant 3.674022E-40 
                                   f32_3 %208 = OpConstantComposite %207 %207 %207 
                                         %219 = OpTypePointer Private %6 
                            Private f32* %220 = OpVariable Private 
                                         %221 = OpTypeInt 32 0 
                                     u32 %222 = OpConstant 1 
                                     u32 %225 = OpConstant 0 
                                     u32 %229 = OpConstant 2 
                                     i32 %235 = OpConstant 3 
                            Private f32* %263 = OpVariable Private 
                                     i32 %265 = OpConstant 2 
                                     f32 %271 = OpConstant 3.674022E-40 
                                         %282 = OpTypePointer Output %7 
                           Output f32_4* %283 = OpVariable Output 
                                     u32 %291 = OpConstant 3 
                                         %292 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                           Uniform f32_2* %18 = OpAccessChain %14 %16 
                                    f32_2 %19 = OpLoad %18 
                                    f32_4 %20 = OpVectorShuffle %19 %19 0 1 0 1 
                             Uniform f32* %23 = OpAccessChain %14 %21 
                                      f32 %24 = OpLoad %23 
                                    f32_4 %25 = OpCompositeConstruct %24 %24 %24 %24 
                                    f32_4 %26 = OpFMul %20 %25 
                                    f32_2 %29 = OpLoad vs_TEXCOORD0 
                                    f32_4 %30 = OpVectorShuffle %29 %29 0 1 0 1 
                                    f32_4 %31 = OpFAdd %26 %30 
                                                  OpStore %9 %31 
                           Uniform f32_2* %33 = OpAccessChain %14 %16 
                                    f32_2 %34 = OpLoad %33 
                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 1 
                                    f32_4 %36 = OpFNegate %35 
                                    f32_4 %40 = OpFMul %36 %39 
                                    f32_4 %41 = OpLoad %9 
                                    f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
                                    f32_4 %43 = OpFAdd %40 %42 
                                                  OpStore %32 %43 
                      read_only Texture2D %49 = OpLoad %48 
                                  sampler %53 = OpLoad %52 
               read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                    f32_4 %56 = OpLoad %32 
                                    f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                    f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                    f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                                  OpStore %45 %59 
                      read_only Texture2D %60 = OpLoad %48 
                                  sampler %61 = OpLoad %52 
               read_only Texture2DSampled %62 = OpSampledImage %60 %61 
                                    f32_4 %63 = OpLoad %32 
                                    f32_2 %64 = OpVectorShuffle %63 %63 2 3 
                                    f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                    f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                    f32_4 %67 = OpLoad %32 
                                    f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                  OpStore %32 %68 
                                    f32_4 %69 = OpLoad %32 
                                    f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                    f32_3 %73 = OpExtInst %1 37 %70 %72 
                                    f32_4 %74 = OpLoad %32 
                                    f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                  OpStore %32 %75 
                                    f32_3 %76 = OpLoad %45 
                                    f32_3 %77 = OpExtInst %1 37 %76 %72 
                                                  OpStore %45 %77 
                      read_only Texture2D %79 = OpLoad %48 
                                  sampler %80 = OpLoad %52 
               read_only Texture2DSampled %81 = OpSampledImage %79 %80 
                                    f32_4 %82 = OpLoad %9 
                                    f32_2 %83 = OpVectorShuffle %82 %82 2 3 
                                    f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                    f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                  OpStore %78 %85 
                           Uniform f32_2* %86 = OpAccessChain %14 %16 
                                    f32_2 %87 = OpLoad %86 
                                    f32_4 %88 = OpVectorShuffle %87 %87 0 0 0 1 
                                    f32_4 %89 = OpFMul %88 %39 
                                    f32_4 %90 = OpLoad %9 
                                    f32_4 %91 = OpFAdd %89 %90 
                                                  OpStore %9 %91 
                                    f32_3 %92 = OpLoad %78 
                                    f32_3 %93 = OpExtInst %1 37 %92 %72 
                                                  OpStore %78 %93 
                                    f32_3 %95 = OpLoad %45 
                                    f32_3 %96 = OpLoad %78 
                                    f32_3 %97 = OpFAdd %95 %96 
                                                  OpStore %94 %97 
                      read_only Texture2D %99 = OpLoad %48 
                                 sampler %100 = OpLoad %52 
              read_only Texture2DSampled %101 = OpSampledImage %99 %100 
                                   f32_4 %102 = OpLoad %9 
                                   f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                   f32_4 %104 = OpImageSampleImplicitLod %101 %103 
                                   f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                                  OpStore %98 %105 
                     read_only Texture2D %106 = OpLoad %48 
                                 sampler %107 = OpLoad %52 
              read_only Texture2DSampled %108 = OpSampledImage %106 %107 
                                   f32_4 %109 = OpLoad %9 
                                   f32_2 %110 = OpVectorShuffle %109 %109 2 3 
                                   f32_4 %111 = OpImageSampleImplicitLod %108 %110 
                                   f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                   f32_4 %113 = OpLoad %9 
                                   f32_4 %114 = OpVectorShuffle %113 %112 4 5 6 3 
                                                  OpStore %9 %114 
                                   f32_4 %115 = OpLoad %9 
                                   f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                   f32_3 %117 = OpExtInst %1 37 %116 %72 
                                   f32_4 %118 = OpLoad %9 
                                   f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                  OpStore %9 %119 
                                   f32_3 %120 = OpLoad %98 
                                   f32_3 %121 = OpExtInst %1 37 %120 %72 
                                                  OpStore %98 %121 
                                   f32_3 %122 = OpLoad %94 
                                   f32_3 %123 = OpLoad %98 
                                   f32_3 %124 = OpFAdd %122 %123 
                                                  OpStore %94 %124 
                                   f32_3 %126 = OpLoad %45 
                                   f32_3 %127 = OpLoad %78 
                                   f32_3 %128 = OpExtInst %1 37 %126 %127 
                                                  OpStore %125 %128 
                                   f32_3 %129 = OpLoad %45 
                                   f32_3 %130 = OpLoad %78 
                                   f32_3 %131 = OpExtInst %1 40 %129 %130 
                                                  OpStore %45 %131 
                                   f32_3 %132 = OpLoad %98 
                                   f32_3 %133 = OpLoad %45 
                                   f32_3 %134 = OpExtInst %1 40 %132 %133 
                                                  OpStore %45 %134 
                                   f32_3 %135 = OpLoad %98 
                                   f32_3 %136 = OpLoad %125 
                                   f32_3 %137 = OpExtInst %1 37 %135 %136 
                                                  OpStore %78 %137 
                                   f32_3 %138 = OpLoad %78 
                                   f32_3 %139 = OpFNegate %138 
                                   f32_3 %140 = OpLoad %94 
                                   f32_3 %141 = OpFAdd %139 %140 
                                                  OpStore %78 %141 
                                   f32_3 %142 = OpLoad %45 
                                   f32_3 %143 = OpFNegate %142 
                                   f32_3 %144 = OpLoad %78 
                                   f32_3 %145 = OpFAdd %143 %144 
                                                  OpStore %45 %145 
                                   f32_4 %146 = OpLoad %32 
                                   f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                   f32_3 %148 = OpLoad %45 
                                   f32_3 %149 = OpFAdd %147 %148 
                                                  OpStore %78 %149 
                                   f32_4 %150 = OpLoad %9 
                                   f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                   f32_3 %152 = OpLoad %78 
                                   f32_3 %153 = OpFAdd %151 %152 
                                                  OpStore %78 %153 
                                   f32_4 %154 = OpLoad %32 
                                   f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                   f32_3 %156 = OpLoad %45 
                                   f32_3 %157 = OpExtInst %1 37 %155 %156 
                                                  OpStore %94 %157 
                                   f32_4 %158 = OpLoad %32 
                                   f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                   f32_3 %160 = OpLoad %45 
                                   f32_3 %161 = OpExtInst %1 40 %159 %160 
                                   f32_4 %162 = OpLoad %32 
                                   f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                  OpStore %32 %163 
                                   f32_4 %164 = OpLoad %9 
                                   f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                   f32_4 %166 = OpLoad %32 
                                   f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                   f32_3 %168 = OpExtInst %1 40 %165 %167 
                                   f32_4 %169 = OpLoad %32 
                                   f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                  OpStore %32 %170 
                                   f32_4 %171 = OpLoad %9 
                                   f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                   f32_3 %173 = OpLoad %94 
                                   f32_3 %174 = OpExtInst %1 37 %172 %173 
                                   f32_4 %175 = OpLoad %9 
                                   f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                  OpStore %9 %176 
                                   f32_4 %177 = OpLoad %9 
                                   f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                   f32_3 %179 = OpFNegate %178 
                                   f32_3 %180 = OpLoad %78 
                                   f32_3 %181 = OpFAdd %179 %180 
                                   f32_4 %182 = OpLoad %9 
                                   f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                  OpStore %9 %183 
                                   f32_4 %184 = OpLoad %32 
                                   f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                   f32_3 %186 = OpFNegate %185 
                                   f32_4 %187 = OpLoad %9 
                                   f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                   f32_3 %189 = OpFAdd %186 %188 
                                   f32_4 %190 = OpLoad %9 
                                   f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                  OpStore %9 %191 
                                   f32_4 %192 = OpLoad %9 
                                   f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                   f32_3 %196 = OpFMul %193 %195 
                                   f32_3 %199 = OpFAdd %196 %198 
                                   f32_4 %200 = OpLoad %32 
                                   f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                                  OpStore %32 %201 
                                   f32_4 %202 = OpLoad %9 
                                   f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                   f32_4 %204 = OpLoad %32 
                                   f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                   f32_3 %206 = OpFMul %203 %205 
                                   f32_3 %209 = OpFAdd %206 %208 
                                   f32_4 %210 = OpLoad %32 
                                   f32_4 %211 = OpVectorShuffle %210 %209 4 5 6 3 
                                                  OpStore %32 %211 
                                   f32_4 %212 = OpLoad %9 
                                   f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                                   f32_4 %214 = OpLoad %32 
                                   f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                   f32_3 %216 = OpFMul %213 %215 
                                   f32_4 %217 = OpLoad %9 
                                   f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                                  OpStore %9 %218 
                            Private f32* %223 = OpAccessChain %9 %222 
                                     f32 %224 = OpLoad %223 
                            Private f32* %226 = OpAccessChain %9 %225 
                                     f32 %227 = OpLoad %226 
                                     f32 %228 = OpExtInst %1 40 %224 %227 
                                                  OpStore %220 %228 
                            Private f32* %230 = OpAccessChain %9 %229 
                                     f32 %231 = OpLoad %230 
                                     f32 %232 = OpLoad %220 
                                     f32 %233 = OpExtInst %1 40 %231 %232 
                                                  OpStore %220 %233 
                                     f32 %234 = OpLoad %220 
                            Uniform f32* %236 = OpAccessChain %14 %235 %225 
                                     f32 %237 = OpLoad %236 
                                     f32 %238 = OpFNegate %237 
                                     f32 %239 = OpFAdd %234 %238 
                            Private f32* %240 = OpAccessChain %32 %225 
                                                  OpStore %240 %239 
                            Private f32* %241 = OpAccessChain %32 %225 
                                     f32 %242 = OpLoad %241 
                                     f32 %243 = OpExtInst %1 40 %242 %38 
                            Private f32* %244 = OpAccessChain %32 %225 
                                                  OpStore %244 %243 
                            Private f32* %245 = OpAccessChain %32 %225 
                                     f32 %246 = OpLoad %245 
                            Uniform f32* %247 = OpAccessChain %14 %235 %222 
                                     f32 %248 = OpLoad %247 
                                     f32 %249 = OpExtInst %1 37 %246 %248 
                            Private f32* %250 = OpAccessChain %32 %225 
                                                  OpStore %250 %249 
                            Private f32* %251 = OpAccessChain %32 %225 
                                     f32 %252 = OpLoad %251 
                            Private f32* %253 = OpAccessChain %32 %225 
                                     f32 %254 = OpLoad %253 
                                     f32 %255 = OpFMul %252 %254 
                            Private f32* %256 = OpAccessChain %32 %225 
                                                  OpStore %256 %255 
                            Private f32* %257 = OpAccessChain %32 %225 
                                     f32 %258 = OpLoad %257 
                            Uniform f32* %259 = OpAccessChain %14 %235 %229 
                                     f32 %260 = OpLoad %259 
                                     f32 %261 = OpFMul %258 %260 
                            Private f32* %262 = OpAccessChain %32 %225 
                                                  OpStore %262 %261 
                                     f32 %264 = OpLoad %220 
                            Uniform f32* %266 = OpAccessChain %14 %265 
                                     f32 %267 = OpLoad %266 
                                     f32 %268 = OpFNegate %267 
                                     f32 %269 = OpFAdd %264 %268 
                                                  OpStore %263 %269 
                                     f32 %270 = OpLoad %220 
                                     f32 %272 = OpExtInst %1 40 %270 %271 
                                                  OpStore %220 %272 
                                     f32 %273 = OpLoad %263 
                            Private f32* %274 = OpAccessChain %32 %225 
                                     f32 %275 = OpLoad %274 
                                     f32 %276 = OpExtInst %1 40 %273 %275 
                            Private f32* %277 = OpAccessChain %32 %225 
                                                  OpStore %277 %276 
                            Private f32* %278 = OpAccessChain %32 %225 
                                     f32 %279 = OpLoad %278 
                                     f32 %280 = OpLoad %220 
                                     f32 %281 = OpFDiv %279 %280 
                                                  OpStore %220 %281 
                                     f32 %284 = OpLoad %220 
                                   f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                                   f32_4 %286 = OpLoad %9 
                                   f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                   f32_3 %288 = OpFMul %285 %287 
                                   f32_4 %289 = OpLoad %283 
                                   f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                  OpStore %283 %290 
                             Output f32* %293 = OpAccessChain %283 %291 
                                                  OpStore %293 %38 
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 143060
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
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
                                             OpEntryPoint Fragment %4 "main" %25 %103 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %103 Location 103 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypeStruct %10 
                                     %12 = OpTypePointer Uniform %11 
            Uniform struct {f32_2;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypePointer Uniform %10 
                                 f32 %20 = OpConstant 3.674022E-40 
                                 f32 %21 = OpConstant 3.674022E-40 
                               f32_4 %22 = OpConstantComposite %20 %20 %21 %20 
                                     %24 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                                     %43 = OpTypeVector %6 3 
                               f32_4 %66 = OpConstantComposite %20 %21 %21 %21 
                                     %71 = OpTypePointer Private %43 
                      Private f32_3* %72 = OpVariable Private 
                                    %102 = OpTypePointer Output %7 
                      Output f32_4* %103 = OpVariable Output 
                                f32 %106 = OpConstant 3.674022E-40 
                              f32_3 %107 = OpConstantComposite %106 %106 %106 
                                f32 %111 = OpConstant 3.674022E-40 
                                    %112 = OpTypeInt 32 0 
                                u32 %113 = OpConstant 3 
                                    %114 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_2* %17 = OpAccessChain %13 %15 
                               f32_2 %18 = OpLoad %17 
                               f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
                               f32_4 %23 = OpFMul %19 %22 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFAdd %23 %27 
                                             OpStore %9 %28 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                               f32_3 %44 = OpVectorShuffle %42 %42 0 1 2 
                               f32_4 %45 = OpLoad %29 
                               f32_4 %46 = OpVectorShuffle %45 %44 4 5 6 3 
                                             OpStore %29 %46 
                 read_only Texture2D %47 = OpLoad %32 
                             sampler %48 = OpLoad %36 
          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               f32_4 %54 = OpLoad %9 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %9 %55 
                               f32_4 %56 = OpLoad %9 
                               f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               f32_4 %58 = OpLoad %29 
                               f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                               f32_3 %60 = OpFAdd %57 %59 
                               f32_4 %61 = OpLoad %9 
                               f32_4 %62 = OpVectorShuffle %61 %60 4 5 6 3 
                                             OpStore %9 %62 
                      Uniform f32_2* %63 = OpAccessChain %13 %15 
                               f32_2 %64 = OpLoad %63 
                               f32_4 %65 = OpVectorShuffle %64 %64 0 1 0 1 
                               f32_4 %67 = OpFMul %65 %66 
                               f32_2 %68 = OpLoad vs_TEXCOORD0 
                               f32_4 %69 = OpVectorShuffle %68 %68 0 1 0 1 
                               f32_4 %70 = OpFAdd %67 %69 
                                             OpStore %29 %70 
                 read_only Texture2D %73 = OpLoad %32 
                             sampler %74 = OpLoad %36 
          read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                               f32_4 %76 = OpLoad %29 
                               f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                               f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                             OpStore %72 %79 
                 read_only Texture2D %80 = OpLoad %32 
                             sampler %81 = OpLoad %36 
          read_only Texture2DSampled %82 = OpSampledImage %80 %81 
                               f32_4 %83 = OpLoad %29 
                               f32_2 %84 = OpVectorShuffle %83 %83 2 3 
                               f32_4 %85 = OpImageSampleImplicitLod %82 %84 
                               f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                               f32_4 %87 = OpLoad %29 
                               f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                             OpStore %29 %88 
                               f32_4 %89 = OpLoad %9 
                               f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               f32_3 %91 = OpLoad %72 
                               f32_3 %92 = OpFAdd %90 %91 
                               f32_4 %93 = OpLoad %9 
                               f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                             OpStore %9 %94 
                               f32_4 %95 = OpLoad %29 
                               f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                               f32_4 %97 = OpLoad %9 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                               f32_3 %99 = OpFAdd %96 %98 
                              f32_4 %100 = OpLoad %9 
                              f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                             OpStore %9 %101 
                              f32_4 %104 = OpLoad %9 
                              f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              f32_3 %108 = OpFMul %105 %107 
                              f32_4 %109 = OpLoad %103 
                              f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                             OpStore %103 %110 
                        Output f32* %115 = OpAccessChain %103 %113 
                                             OpStore %115 %111 
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
  GpuProgramID 237995
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat9 = max(u_xlat1.y, u_xlat1.x);
    u_xlat9 = max(u_xlat1.z, u_xlat9);
    u_xlat9 = u_xlat9 + 1.0;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat10 = max(u_xlat0.y, u_xlat0.x);
    u_xlat10 = max(u_xlat0.z, u_xlat10);
    u_xlat10 = u_xlat10 + 1.0;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    u_xlat9 = u_xlat9 + u_xlat10;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat10 = max(u_xlat2.y, u_xlat2.x);
    u_xlat10 = max(u_xlat2.z, u_xlat10);
    u_xlat10 = u_xlat10 + 1.0;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    u_xlat9 = u_xlat9 + u_xlat10;
    u_xlat10 = max(u_xlat1.y, u_xlat1.x);
    u_xlat10 = max(u_xlat1.z, u_xlat10);
    u_xlat10 = u_xlat10 + 1.0;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    u_xlat9 = u_xlat9 + u_xlat10;
    u_xlat9 = float(1.0) / u_xlat9;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 202
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %25 %189 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %189 Location 189 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypeStruct %10 
                                     %12 = OpTypePointer Uniform %11 
            Uniform struct {f32_2;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypePointer Uniform %10 
                                 f32 %20 = OpConstant 3.674022E-40 
                                 f32 %21 = OpConstant 3.674022E-40 
                               f32_4 %22 = OpConstantComposite %20 %20 %21 %20 
                                     %24 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                                     %43 = OpTypeVector %6 3 
                                     %56 = OpTypePointer Private %6 
                        Private f32* %57 = OpVariable Private 
                                     %58 = OpTypeInt 32 0 
                                 u32 %59 = OpConstant 1 
                                 u32 %62 = OpConstant 0 
                                 u32 %66 = OpConstant 2 
                        Private f32* %82 = OpVariable Private 
                              f32_4 %112 = OpConstantComposite %20 %21 %21 %21 
                                    %117 = OpTypePointer Private %43 
                     Private f32_3* %118 = OpVariable Private 
                                    %188 = OpTypePointer Output %7 
                      Output f32_4* %189 = OpVariable Output 
                                f32 %197 = OpConstant 3.674022E-40 
                                u32 %198 = OpConstant 3 
                                    %199 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_2* %17 = OpAccessChain %13 %15 
                               f32_2 %18 = OpLoad %17 
                               f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
                               f32_4 %23 = OpFMul %19 %22 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFAdd %23 %27 
                                             OpStore %9 %28 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                               f32_3 %44 = OpVectorShuffle %42 %42 0 1 2 
                               f32_4 %45 = OpLoad %29 
                               f32_4 %46 = OpVectorShuffle %45 %44 4 5 6 3 
                                             OpStore %29 %46 
                 read_only Texture2D %47 = OpLoad %32 
                             sampler %48 = OpLoad %36 
          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               f32_4 %54 = OpLoad %9 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %9 %55 
                        Private f32* %60 = OpAccessChain %29 %59 
                                 f32 %61 = OpLoad %60 
                        Private f32* %63 = OpAccessChain %29 %62 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpExtInst %1 40 %61 %64 
                                             OpStore %57 %65 
                        Private f32* %67 = OpAccessChain %29 %66 
                                 f32 %68 = OpLoad %67 
                                 f32 %69 = OpLoad %57 
                                 f32 %70 = OpExtInst %1 40 %68 %69 
                                             OpStore %57 %70 
                                 f32 %71 = OpLoad %57 
                                 f32 %72 = OpFAdd %71 %21 
                                             OpStore %57 %72 
                                 f32 %73 = OpLoad %57 
                                 f32 %74 = OpFDiv %21 %73 
                                             OpStore %57 %74 
                                 f32 %75 = OpLoad %57 
                               f32_3 %76 = OpCompositeConstruct %75 %75 %75 
                               f32_4 %77 = OpLoad %29 
                               f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                               f32_3 %79 = OpFMul %76 %78 
                               f32_4 %80 = OpLoad %29 
                               f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                             OpStore %29 %81 
                        Private f32* %83 = OpAccessChain %9 %59 
                                 f32 %84 = OpLoad %83 
                        Private f32* %85 = OpAccessChain %9 %62 
                                 f32 %86 = OpLoad %85 
                                 f32 %87 = OpExtInst %1 40 %84 %86 
                                             OpStore %82 %87 
                        Private f32* %88 = OpAccessChain %9 %66 
                                 f32 %89 = OpLoad %88 
                                 f32 %90 = OpLoad %82 
                                 f32 %91 = OpExtInst %1 40 %89 %90 
                                             OpStore %82 %91 
                                 f32 %92 = OpLoad %82 
                                 f32 %93 = OpFAdd %92 %21 
                                             OpStore %82 %93 
                                 f32 %94 = OpLoad %82 
                                 f32 %95 = OpFDiv %21 %94 
                                             OpStore %82 %95 
                               f32_4 %96 = OpLoad %9 
                               f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                 f32 %98 = OpLoad %82 
                               f32_3 %99 = OpCompositeConstruct %98 %98 %98 
                              f32_3 %100 = OpFMul %97 %99 
                              f32_4 %101 = OpLoad %29 
                              f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              f32_3 %103 = OpFAdd %100 %102 
                              f32_4 %104 = OpLoad %9 
                              f32_4 %105 = OpVectorShuffle %104 %103 4 5 6 3 
                                             OpStore %9 %105 
                                f32 %106 = OpLoad %57 
                                f32 %107 = OpLoad %82 
                                f32 %108 = OpFAdd %106 %107 
                                             OpStore %57 %108 
                     Uniform f32_2* %109 = OpAccessChain %13 %15 
                              f32_2 %110 = OpLoad %109 
                              f32_4 %111 = OpVectorShuffle %110 %110 0 1 0 1 
                              f32_4 %113 = OpFMul %111 %112 
                              f32_2 %114 = OpLoad vs_TEXCOORD0 
                              f32_4 %115 = OpVectorShuffle %114 %114 0 1 0 1 
                              f32_4 %116 = OpFAdd %113 %115 
                                             OpStore %29 %116 
                read_only Texture2D %119 = OpLoad %32 
                            sampler %120 = OpLoad %36 
         read_only Texture2DSampled %121 = OpSampledImage %119 %120 
                              f32_4 %122 = OpLoad %29 
                              f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                              f32_4 %124 = OpImageSampleImplicitLod %121 %123 
                              f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                             OpStore %118 %125 
                read_only Texture2D %126 = OpLoad %32 
                            sampler %127 = OpLoad %36 
         read_only Texture2DSampled %128 = OpSampledImage %126 %127 
                              f32_4 %129 = OpLoad %29 
                              f32_2 %130 = OpVectorShuffle %129 %129 2 3 
                              f32_4 %131 = OpImageSampleImplicitLod %128 %130 
                              f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                              f32_4 %133 = OpLoad %29 
                              f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                             OpStore %29 %134 
                       Private f32* %135 = OpAccessChain %118 %59 
                                f32 %136 = OpLoad %135 
                       Private f32* %137 = OpAccessChain %118 %62 
                                f32 %138 = OpLoad %137 
                                f32 %139 = OpExtInst %1 40 %136 %138 
                                             OpStore %82 %139 
                       Private f32* %140 = OpAccessChain %118 %66 
                                f32 %141 = OpLoad %140 
                                f32 %142 = OpLoad %82 
                                f32 %143 = OpExtInst %1 40 %141 %142 
                                             OpStore %82 %143 
                                f32 %144 = OpLoad %82 
                                f32 %145 = OpFAdd %144 %21 
                                             OpStore %82 %145 
                                f32 %146 = OpLoad %82 
                                f32 %147 = OpFDiv %21 %146 
                                             OpStore %82 %147 
                              f32_3 %148 = OpLoad %118 
                                f32 %149 = OpLoad %82 
                              f32_3 %150 = OpCompositeConstruct %149 %149 %149 
                              f32_3 %151 = OpFMul %148 %150 
                              f32_4 %152 = OpLoad %9 
                              f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              f32_3 %154 = OpFAdd %151 %153 
                              f32_4 %155 = OpLoad %9 
                              f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                             OpStore %9 %156 
                                f32 %157 = OpLoad %57 
                                f32 %158 = OpLoad %82 
                                f32 %159 = OpFAdd %157 %158 
                                             OpStore %57 %159 
                       Private f32* %160 = OpAccessChain %29 %59 
                                f32 %161 = OpLoad %160 
                       Private f32* %162 = OpAccessChain %29 %62 
                                f32 %163 = OpLoad %162 
                                f32 %164 = OpExtInst %1 40 %161 %163 
                                             OpStore %82 %164 
                       Private f32* %165 = OpAccessChain %29 %66 
                                f32 %166 = OpLoad %165 
                                f32 %167 = OpLoad %82 
                                f32 %168 = OpExtInst %1 40 %166 %167 
                                             OpStore %82 %168 
                                f32 %169 = OpLoad %82 
                                f32 %170 = OpFAdd %169 %21 
                                             OpStore %82 %170 
                                f32 %171 = OpLoad %82 
                                f32 %172 = OpFDiv %21 %171 
                                             OpStore %82 %172 
                              f32_4 %173 = OpLoad %29 
                              f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                f32 %175 = OpLoad %82 
                              f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                              f32_3 %177 = OpFMul %174 %176 
                              f32_4 %178 = OpLoad %9 
                              f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              f32_3 %180 = OpFAdd %177 %179 
                              f32_4 %181 = OpLoad %9 
                              f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
                                             OpStore %9 %182 
                                f32 %183 = OpLoad %57 
                                f32 %184 = OpLoad %82 
                                f32 %185 = OpFAdd %183 %184 
                                             OpStore %57 %185 
                                f32 %186 = OpLoad %57 
                                f32 %187 = OpFDiv %21 %186 
                                             OpStore %57 %187 
                                f32 %190 = OpLoad %57 
                              f32_3 %191 = OpCompositeConstruct %190 %190 %190 
                              f32_4 %192 = OpLoad %9 
                              f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              f32_3 %194 = OpFMul %191 %193 
                              f32_4 %195 = OpLoad %189 
                              f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                             OpStore %189 %196 
                        Output f32* %200 = OpAccessChain %189 %198 
                                             OpStore %200 %197 
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
  GpuProgramID 268037
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
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
                                             OpEntryPoint Fragment %4 "main" %25 %103 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %103 Location 103 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypeStruct %10 
                                     %12 = OpTypePointer Uniform %11 
            Uniform struct {f32_2;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypePointer Uniform %10 
                                 f32 %20 = OpConstant 3.674022E-40 
                                 f32 %21 = OpConstant 3.674022E-40 
                               f32_4 %22 = OpConstantComposite %20 %20 %21 %20 
                                     %24 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                                     %43 = OpTypeVector %6 3 
                               f32_4 %66 = OpConstantComposite %20 %21 %21 %21 
                                     %71 = OpTypePointer Private %43 
                      Private f32_3* %72 = OpVariable Private 
                                    %102 = OpTypePointer Output %7 
                      Output f32_4* %103 = OpVariable Output 
                                f32 %106 = OpConstant 3.674022E-40 
                              f32_3 %107 = OpConstantComposite %106 %106 %106 
                                f32 %111 = OpConstant 3.674022E-40 
                                    %112 = OpTypeInt 32 0 
                                u32 %113 = OpConstant 3 
                                    %114 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_2* %17 = OpAccessChain %13 %15 
                               f32_2 %18 = OpLoad %17 
                               f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
                               f32_4 %23 = OpFMul %19 %22 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFAdd %23 %27 
                                             OpStore %9 %28 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                               f32_3 %44 = OpVectorShuffle %42 %42 0 1 2 
                               f32_4 %45 = OpLoad %29 
                               f32_4 %46 = OpVectorShuffle %45 %44 4 5 6 3 
                                             OpStore %29 %46 
                 read_only Texture2D %47 = OpLoad %32 
                             sampler %48 = OpLoad %36 
          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               f32_4 %54 = OpLoad %9 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %9 %55 
                               f32_4 %56 = OpLoad %9 
                               f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               f32_4 %58 = OpLoad %29 
                               f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                               f32_3 %60 = OpFAdd %57 %59 
                               f32_4 %61 = OpLoad %9 
                               f32_4 %62 = OpVectorShuffle %61 %60 4 5 6 3 
                                             OpStore %9 %62 
                      Uniform f32_2* %63 = OpAccessChain %13 %15 
                               f32_2 %64 = OpLoad %63 
                               f32_4 %65 = OpVectorShuffle %64 %64 0 1 0 1 
                               f32_4 %67 = OpFMul %65 %66 
                               f32_2 %68 = OpLoad vs_TEXCOORD0 
                               f32_4 %69 = OpVectorShuffle %68 %68 0 1 0 1 
                               f32_4 %70 = OpFAdd %67 %69 
                                             OpStore %29 %70 
                 read_only Texture2D %73 = OpLoad %32 
                             sampler %74 = OpLoad %36 
          read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                               f32_4 %76 = OpLoad %29 
                               f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                               f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                             OpStore %72 %79 
                 read_only Texture2D %80 = OpLoad %32 
                             sampler %81 = OpLoad %36 
          read_only Texture2DSampled %82 = OpSampledImage %80 %81 
                               f32_4 %83 = OpLoad %29 
                               f32_2 %84 = OpVectorShuffle %83 %83 2 3 
                               f32_4 %85 = OpImageSampleImplicitLod %82 %84 
                               f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                               f32_4 %87 = OpLoad %29 
                               f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                             OpStore %29 %88 
                               f32_4 %89 = OpLoad %9 
                               f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               f32_3 %91 = OpLoad %72 
                               f32_3 %92 = OpFAdd %90 %91 
                               f32_4 %93 = OpLoad %9 
                               f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                             OpStore %9 %94 
                               f32_4 %95 = OpLoad %29 
                               f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                               f32_4 %97 = OpLoad %9 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                               f32_3 %99 = OpFAdd %96 %98 
                              f32_4 %100 = OpLoad %9 
                              f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                             OpStore %9 %101 
                              f32_4 %104 = OpLoad %9 
                              f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              f32_3 %108 = OpFMul %105 %107 
                              f32_4 %109 = OpLoad %103 
                              f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                             OpStore %103 %110 
                        Output f32* %115 = OpAccessChain %103 %113 
                                             OpStore %115 %111 
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
  GpuProgramID 353098
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
uniform 	vec4 _BaseTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = texture(_BaseTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat1.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD1 Location 114 
                                                      OpDecorate vs_TEXCOORD0 Location 131 
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
                                              %18 = OpTypeVector %6 2 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.674022E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %18 
                                 Input f32_2* %94 = OpVariable Input 
                                              %95 = OpTypePointer Input %6 
                                          f32 %99 = OpConstant 3.674022E-40 
                                             %101 = OpTypePointer Private %18 
                              Private f32_2* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 4 
                                             %113 = OpTypePointer Output %18 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                             %116 = OpTypePointer Function %6 
                                             %125 = OpTypePointer Output %6 
                                         u32 %127 = OpConstant 0 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %117 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
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
                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %23 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %96 = OpAccessChain %94 %69 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %92 %100 
                                       f32_2 %103 = OpLoad %94 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %102 %112 
                                        bool %115 = OpLoad %85 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %115 %118 %121 
                                             %118 = OpLabel 
                                         f32 %120 = OpLoad %92 
                                                      OpStore %117 %120 
                                                      OpBranch %119 
                                             %121 = OpLabel 
                                Private f32* %122 = OpAccessChain %102 %69 
                                         f32 %123 = OpLoad %122 
                                                      OpStore %117 %123 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                         f32 %124 = OpLoad %117 
                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
                                                      OpStore %126 %124 
                                Private f32* %128 = OpAccessChain %102 %127 
                                         f32 %129 = OpLoad %128 
                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
                                                      OpStore %130 %129 
                                       f32_2 %132 = OpLoad %94 
                              Uniform f32_4* %133 = OpAccessChain %21 %45 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %132 %135 
                              Uniform f32_4* %137 = OpAccessChain %21 %45 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore vs_TEXCOORD0 %140 
                                 Output f32* %141 = OpAccessChain %73 %23 %69 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFNegate %142 
                                 Output f32* %144 = OpAccessChain %73 %23 %69 
                                                      OpStore %144 %143 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 136
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %44 %116 %121 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 44 
                                              OpDecorate %58 DescriptorSet 58 
                                              OpDecorate %58 Binding 58 
                                              OpDecorate %62 DescriptorSet 62 
                                              OpDecorate %62 Binding 62 
                                              OpDecorate %111 DescriptorSet 111 
                                              OpDecorate %111 Binding 111 
                                              OpDecorate %113 DescriptorSet 113 
                                              OpDecorate %113 Binding 113 
                                              OpDecorate vs_TEXCOORD1 Location 116 
                                              OpDecorate %121 Location 121 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypeStruct %10 %6 
                                      %12 = OpTypePointer Uniform %11 
        Uniform struct {f32_2; f32;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypePointer Uniform %10 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  f32 %21 = OpConstant 3.674022E-40 
                                f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
                                      %24 = OpTypeVector %6 3 
                                      %25 = OpTypePointer Private %24 
                       Private f32_3* %26 = OpVariable Private 
                                  i32 %27 = OpConstant 1 
                                      %28 = OpTypePointer Uniform %6 
                                  f32 %31 = OpConstant 3.674022E-40 
                                      %33 = OpTypeInt 32 0 
                                  u32 %34 = OpConstant 0 
                                      %35 = OpTypePointer Private %6 
                       Private f32_4* %37 = OpVariable Private 
                                      %43 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %57 = OpTypePointer UniformConstant %56 
 UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
                                      %60 = OpTypeSampler 
                                      %61 = OpTypePointer UniformConstant %60 
             UniformConstant sampler* %62 = OpVariable UniformConstant 
                                      %64 = OpTypeSampledImage %56 
UniformConstant read_only Texture2D* %111 = OpVariable UniformConstant 
            UniformConstant sampler* %113 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %120 = OpTypePointer Output %7 
                       Output f32_4* %121 = OpVariable Output 
                                 f32 %124 = OpConstant 3.674022E-40 
                               f32_3 %125 = OpConstantComposite %124 %124 %124 
                                 f32 %131 = OpConstant 3.674022E-40 
                                 u32 %132 = OpConstant 3 
                                     %133 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Uniform f32_2* %17 = OpAccessChain %13 %15 
                                f32_2 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
                                f32_4 %23 = OpFMul %19 %22 
                                              OpStore %9 %23 
                         Uniform f32* %29 = OpAccessChain %13 %27 
                                  f32 %30 = OpLoad %29 
                                  f32 %32 = OpFMul %30 %31 
                         Private f32* %36 = OpAccessChain %26 %34 
                                              OpStore %36 %32 
                                f32_4 %38 = OpLoad %9 
                                f32_4 %39 = OpVectorShuffle %38 %38 0 1 2 1 
                                f32_3 %40 = OpLoad %26 
                                f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                f32_4 %42 = OpFMul %39 %41 
                                f32_2 %45 = OpLoad vs_TEXCOORD0 
                                f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
                                f32_4 %47 = OpFAdd %42 %46 
                                              OpStore %37 %47 
                                f32_4 %48 = OpLoad %9 
                                f32_4 %49 = OpVectorShuffle %48 %48 0 3 2 3 
                                f32_3 %50 = OpLoad %26 
                                f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
                                f32_4 %52 = OpFMul %49 %51 
                                f32_2 %53 = OpLoad vs_TEXCOORD0 
                                f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
                                f32_4 %55 = OpFAdd %52 %54 
                                              OpStore %9 %55 
                  read_only Texture2D %59 = OpLoad %58 
                              sampler %63 = OpLoad %62 
           read_only Texture2DSampled %65 = OpSampledImage %59 %63 
                                f32_4 %66 = OpLoad %37 
                                f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                                f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                              OpStore %26 %69 
                  read_only Texture2D %70 = OpLoad %58 
                              sampler %71 = OpLoad %62 
           read_only Texture2DSampled %72 = OpSampledImage %70 %71 
                                f32_4 %73 = OpLoad %37 
                                f32_2 %74 = OpVectorShuffle %73 %73 2 3 
                                f32_4 %75 = OpImageSampleImplicitLod %72 %74 
                                f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                f32_4 %77 = OpLoad %37 
                                f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                              OpStore %37 %78 
                                f32_3 %79 = OpLoad %26 
                                f32_4 %80 = OpLoad %37 
                                f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                f32_3 %82 = OpFAdd %79 %81 
                                              OpStore %26 %82 
                  read_only Texture2D %83 = OpLoad %58 
                              sampler %84 = OpLoad %62 
           read_only Texture2DSampled %85 = OpSampledImage %83 %84 
                                f32_4 %86 = OpLoad %9 
                                f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                f32_4 %88 = OpImageSampleImplicitLod %85 %87 
                                f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                f32_4 %90 = OpLoad %37 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                              OpStore %37 %91 
                  read_only Texture2D %92 = OpLoad %58 
                              sampler %93 = OpLoad %62 
           read_only Texture2DSampled %94 = OpSampledImage %92 %93 
                                f32_4 %95 = OpLoad %9 
                                f32_2 %96 = OpVectorShuffle %95 %95 2 3 
                                f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                f32_4 %99 = OpLoad %9 
                               f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                              OpStore %9 %100 
                               f32_3 %101 = OpLoad %26 
                               f32_4 %102 = OpLoad %37 
                               f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                               f32_3 %104 = OpFAdd %101 %103 
                                              OpStore %26 %104 
                               f32_4 %105 = OpLoad %9 
                               f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                               f32_3 %107 = OpLoad %26 
                               f32_3 %108 = OpFAdd %106 %107 
                               f32_4 %109 = OpLoad %9 
                               f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                              OpStore %9 %110 
                 read_only Texture2D %112 = OpLoad %111 
                             sampler %114 = OpLoad %113 
          read_only Texture2DSampled %115 = OpSampledImage %112 %114 
                               f32_2 %117 = OpLoad vs_TEXCOORD1 
                               f32_4 %118 = OpImageSampleImplicitLod %115 %117 
                               f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                              OpStore %26 %119 
                               f32_4 %122 = OpLoad %9 
                               f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                               f32_3 %126 = OpFMul %123 %125 
                               f32_3 %127 = OpLoad %26 
                               f32_3 %128 = OpFAdd %126 %127 
                               f32_4 %129 = OpLoad %121 
                               f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                              OpStore %121 %130 
                         Output f32* %134 = OpAccessChain %121 %132 
                                              OpStore %134 %131 
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
  GpuProgramID 397241
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
uniform 	vec4 _BaseTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat3 = texture(_MainTex, u_xlat3.xy);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat2.xyz * vec3(4.0, 4.0, 4.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat2 = texture(_MainTex, u_xlat4.xy);
    u_xlat3 = texture(_MainTex, u_xlat4.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = texture(_BaseTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat1.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD1 Location 114 
                                                      OpDecorate vs_TEXCOORD0 Location 131 
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
                                              %18 = OpTypeVector %6 2 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.674022E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %18 
                                 Input f32_2* %94 = OpVariable Input 
                                              %95 = OpTypePointer Input %6 
                                          f32 %99 = OpConstant 3.674022E-40 
                                             %101 = OpTypePointer Private %18 
                              Private f32_2* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 4 
                                             %113 = OpTypePointer Output %18 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                             %116 = OpTypePointer Function %6 
                                             %125 = OpTypePointer Output %6 
                                         u32 %127 = OpConstant 0 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %117 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
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
                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %23 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %96 = OpAccessChain %94 %69 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %92 %100 
                                       f32_2 %103 = OpLoad %94 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %102 %112 
                                        bool %115 = OpLoad %85 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %115 %118 %121 
                                             %118 = OpLabel 
                                         f32 %120 = OpLoad %92 
                                                      OpStore %117 %120 
                                                      OpBranch %119 
                                             %121 = OpLabel 
                                Private f32* %122 = OpAccessChain %102 %69 
                                         f32 %123 = OpLoad %122 
                                                      OpStore %117 %123 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                         f32 %124 = OpLoad %117 
                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
                                                      OpStore %126 %124 
                                Private f32* %128 = OpAccessChain %102 %127 
                                         f32 %129 = OpLoad %128 
                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
                                                      OpStore %130 %129 
                                       f32_2 %132 = OpLoad %94 
                              Uniform f32_4* %133 = OpAccessChain %21 %45 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %132 %135 
                              Uniform f32_4* %137 = OpAccessChain %21 %45 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore vs_TEXCOORD0 %140 
                                 Output f32* %141 = OpAccessChain %73 %23 %69 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFNegate %142 
                                 Output f32* %144 = OpAccessChain %73 %23 %69 
                                                      OpStore %144 %143 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 271
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %51 %250 %257 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %16 0 Offset 16 
                                              OpMemberDecorate %16 1 Offset 16 
                                              OpDecorate %16 Block 
                                              OpDecorate %18 DescriptorSet 18 
                                              OpDecorate %18 Binding 18 
                                              OpDecorate vs_TEXCOORD0 Location 51 
                                              OpDecorate %58 DescriptorSet 58 
                                              OpDecorate %58 Binding 58 
                                              OpDecorate %62 DescriptorSet 62 
                                              OpDecorate %62 Binding 62 
                                              OpDecorate %245 DescriptorSet 245 
                                              OpDecorate %245 Binding 245 
                                              OpDecorate %247 DescriptorSet 247 
                                              OpDecorate %247 Binding 247 
                                              OpDecorate vs_TEXCOORD1 Location 250 
                                              OpDecorate %257 Location 257 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                  f32 %10 = OpConstant 3.674022E-40 
                                      %11 = OpTypeInt 32 0 
                                  u32 %12 = OpConstant 0 
                                      %13 = OpTypePointer Private %6 
                                      %15 = OpTypeVector %6 2 
                                      %16 = OpTypeStruct %15 %6 
                                      %17 = OpTypePointer Uniform %16 
        Uniform struct {f32_2; f32;}* %18 = OpVariable Uniform 
                                      %19 = OpTypeInt 32 1 
                                  i32 %20 = OpConstant 1 
                                      %21 = OpTypePointer Uniform %6 
                                  u32 %24 = OpConstant 2 
                                  i32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Uniform %15 
                       Private f32_4* %34 = OpVariable Private 
                                  f32 %35 = OpConstant 3.674022E-40 
                                  f32 %37 = OpConstant 3.674022E-40 
                                  u32 %38 = OpConstant 3 
                       Private f32_4* %43 = OpVariable Private 
                                      %50 = OpTypePointer Input %15 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                       Private f32_4* %55 = OpVariable Private 
                                      %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %57 = OpTypePointer UniformConstant %56 
 UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
                                      %60 = OpTypeSampler 
                                      %61 = OpTypePointer UniformConstant %60 
             UniformConstant sampler* %62 = OpVariable UniformConstant 
                                      %64 = OpTypeSampledImage %56 
                                      %69 = OpTypeVector %6 3 
                                  f32 %84 = OpConstant 3.674022E-40 
                                f32_3 %85 = OpConstantComposite %84 %84 %84 
                      Private f32_4* %126 = OpVariable Private 
                                 f32 %189 = OpConstant 3.674022E-40 
                               f32_3 %190 = OpConstantComposite %189 %189 %189 
UniformConstant read_only Texture2D* %245 = OpVariable UniformConstant 
            UniformConstant sampler* %247 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %256 = OpTypePointer Output %7 
                       Output f32_4* %257 = OpVariable Output 
                                 f32 %260 = OpConstant 3.674022E-40 
                               f32_3 %261 = OpConstantComposite %260 %260 %260 
                                     %268 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                         Private f32* %14 = OpAccessChain %9 %12 
                                              OpStore %14 %10 
                         Uniform f32* %22 = OpAccessChain %18 %20 
                                  f32 %23 = OpLoad %22 
                         Private f32* %25 = OpAccessChain %9 %24 
                                              OpStore %25 %23 
                                f32_4 %26 = OpLoad %9 
                                f32_4 %27 = OpVectorShuffle %26 %26 0 0 2 2 
                       Uniform f32_2* %30 = OpAccessChain %18 %28 
                                f32_2 %31 = OpLoad %30 
                                f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
                                f32_4 %33 = OpFMul %27 %32 
                                              OpStore %9 %33 
                         Private f32* %36 = OpAccessChain %34 %24 
                                              OpStore %36 %35 
                         Private f32* %39 = OpAccessChain %34 %38 
                                              OpStore %39 %37 
                         Uniform f32* %40 = OpAccessChain %18 %20 
                                  f32 %41 = OpLoad %40 
                         Private f32* %42 = OpAccessChain %34 %12 
                                              OpStore %42 %41 
                                f32_4 %44 = OpLoad %9 
                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 3 1 
                                f32_4 %46 = OpFNegate %45 
                                f32_4 %47 = OpLoad %34 
                                f32_4 %48 = OpVectorShuffle %47 %47 0 0 3 0 
                                f32_4 %49 = OpFMul %46 %48 
                                f32_2 %52 = OpLoad vs_TEXCOORD0 
                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
                                f32_4 %54 = OpFAdd %49 %53 
                                              OpStore %43 %54 
                  read_only Texture2D %59 = OpLoad %58 
                              sampler %63 = OpLoad %62 
           read_only Texture2DSampled %65 = OpSampledImage %59 %63 
                                f32_4 %66 = OpLoad %43 
                                f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                                f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                f32_3 %70 = OpVectorShuffle %68 %68 0 1 2 
                                f32_4 %71 = OpLoad %55 
                                f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                              OpStore %55 %72 
                  read_only Texture2D %73 = OpLoad %58 
                              sampler %74 = OpLoad %62 
           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                                f32_4 %76 = OpLoad %43 
                                f32_2 %77 = OpVectorShuffle %76 %76 2 3 
                                f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                                f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                f32_4 %80 = OpLoad %43 
                                f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                              OpStore %43 %81 
                                f32_4 %82 = OpLoad %43 
                                f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                f32_3 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %55 
                                f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                f32_3 %89 = OpFAdd %86 %88 
                                f32_4 %90 = OpLoad %43 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                              OpStore %43 %91 
                                f32_4 %92 = OpLoad %9 
                                f32_2 %93 = OpVectorShuffle %92 %92 2 1 
                                f32_2 %94 = OpFNegate %93 
                                f32_4 %95 = OpLoad %34 
                                f32_2 %96 = OpVectorShuffle %95 %95 2 0 
                                f32_2 %97 = OpFMul %94 %96 
                                f32_2 %98 = OpLoad vs_TEXCOORD0 
                                f32_2 %99 = OpFAdd %97 %98 
                               f32_4 %100 = OpLoad %55 
                               f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                              OpStore %55 %101 
                 read_only Texture2D %102 = OpLoad %58 
                             sampler %103 = OpLoad %62 
          read_only Texture2DSampled %104 = OpSampledImage %102 %103 
                               f32_4 %105 = OpLoad %55 
                               f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                               f32_4 %107 = OpImageSampleImplicitLod %104 %106 
                               f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                               f32_4 %109 = OpLoad %55 
                               f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                              OpStore %55 %110 
                               f32_4 %111 = OpLoad %43 
                               f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                               f32_4 %113 = OpLoad %55 
                               f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                               f32_3 %115 = OpFAdd %112 %114 
                               f32_4 %116 = OpLoad %43 
                               f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                              OpStore %43 %117 
                               f32_4 %118 = OpLoad %9 
                               f32_4 %119 = OpVectorShuffle %118 %118 2 3 0 3 
                               f32_4 %120 = OpLoad %34 
                               f32_4 %121 = OpVectorShuffle %120 %120 2 3 0 3 
                               f32_4 %122 = OpFMul %119 %121 
                               f32_2 %123 = OpLoad vs_TEXCOORD0 
                               f32_4 %124 = OpVectorShuffle %123 %123 0 1 0 1 
                               f32_4 %125 = OpFAdd %122 %124 
                                              OpStore %55 %125 
                               f32_4 %127 = OpLoad %9 
                               f32_4 %128 = OpVectorShuffle %127 %127 2 1 3 1 
                               f32_4 %129 = OpLoad %34 
                               f32_4 %130 = OpVectorShuffle %129 %129 2 0 3 0 
                               f32_4 %131 = OpFMul %128 %130 
                               f32_2 %132 = OpLoad vs_TEXCOORD0 
                               f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 1 
                               f32_4 %134 = OpFAdd %131 %133 
                                              OpStore %126 %134 
                               f32_4 %135 = OpLoad %9 
                               f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                               f32_4 %137 = OpLoad %34 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                               f32_2 %139 = OpFMul %136 %138 
                               f32_2 %140 = OpLoad vs_TEXCOORD0 
                               f32_2 %141 = OpFAdd %139 %140 
                               f32_4 %142 = OpLoad %9 
                               f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                              OpStore %9 %143 
                 read_only Texture2D %144 = OpLoad %58 
                             sampler %145 = OpLoad %62 
          read_only Texture2DSampled %146 = OpSampledImage %144 %145 
                               f32_4 %147 = OpLoad %9 
                               f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                               f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                               f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                               f32_4 %151 = OpLoad %9 
                               f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                              OpStore %9 %152 
                 read_only Texture2D %153 = OpLoad %58 
                             sampler %154 = OpLoad %62 
          read_only Texture2DSampled %155 = OpSampledImage %153 %154 
                               f32_4 %156 = OpLoad %55 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                               f32_4 %158 = OpImageSampleImplicitLod %155 %157 
                               f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                               f32_4 %160 = OpLoad %34 
                               f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
                                              OpStore %34 %161 
                 read_only Texture2D %162 = OpLoad %58 
                             sampler %163 = OpLoad %62 
          read_only Texture2DSampled %164 = OpSampledImage %162 %163 
                               f32_4 %165 = OpLoad %55 
                               f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                               f32_4 %167 = OpImageSampleImplicitLod %164 %166 
                               f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                               f32_4 %169 = OpLoad %55 
                               f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                              OpStore %55 %170 
                               f32_4 %171 = OpLoad %34 
                               f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                               f32_3 %173 = OpFMul %172 %85 
                               f32_4 %174 = OpLoad %43 
                               f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                               f32_3 %176 = OpFAdd %173 %175 
                               f32_4 %177 = OpLoad %34 
                               f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                              OpStore %34 %178 
                 read_only Texture2D %179 = OpLoad %58 
                             sampler %180 = OpLoad %62 
          read_only Texture2DSampled %181 = OpSampledImage %179 %180 
                               f32_2 %182 = OpLoad vs_TEXCOORD0 
                               f32_4 %183 = OpImageSampleImplicitLod %181 %182 
                               f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                               f32_4 %185 = OpLoad %43 
                               f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                              OpStore %43 %186 
                               f32_4 %187 = OpLoad %43 
                               f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                               f32_3 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %34 
                               f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                               f32_3 %194 = OpFAdd %191 %193 
                               f32_4 %195 = OpLoad %34 
                               f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                              OpStore %34 %196 
                               f32_4 %197 = OpLoad %55 
                               f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                               f32_3 %199 = OpFMul %198 %85 
                               f32_4 %200 = OpLoad %34 
                               f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                               f32_3 %202 = OpFAdd %199 %201 
                               f32_4 %203 = OpLoad %34 
                               f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                              OpStore %34 %204 
                 read_only Texture2D %205 = OpLoad %58 
                             sampler %206 = OpLoad %62 
          read_only Texture2DSampled %207 = OpSampledImage %205 %206 
                               f32_4 %208 = OpLoad %126 
                               f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                               f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                               f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                               f32_4 %212 = OpLoad %43 
                               f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                              OpStore %43 %213 
                 read_only Texture2D %214 = OpLoad %58 
                             sampler %215 = OpLoad %62 
          read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                               f32_4 %217 = OpLoad %126 
                               f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                               f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                               f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                               f32_4 %221 = OpLoad %55 
                               f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                              OpStore %55 %222 
                               f32_4 %223 = OpLoad %34 
                               f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                               f32_4 %225 = OpLoad %43 
                               f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                               f32_3 %227 = OpFAdd %224 %226 
                               f32_4 %228 = OpLoad %34 
                               f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                              OpStore %34 %229 
                               f32_4 %230 = OpLoad %55 
                               f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                               f32_3 %232 = OpFMul %231 %85 
                               f32_4 %233 = OpLoad %34 
                               f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                               f32_3 %235 = OpFAdd %232 %234 
                               f32_4 %236 = OpLoad %34 
                               f32_4 %237 = OpVectorShuffle %236 %235 4 5 6 3 
                                              OpStore %34 %237 
                               f32_4 %238 = OpLoad %9 
                               f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                               f32_4 %240 = OpLoad %34 
                               f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                               f32_3 %242 = OpFAdd %239 %241 
                               f32_4 %243 = OpLoad %9 
                               f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
                                              OpStore %9 %244 
                 read_only Texture2D %246 = OpLoad %245 
                             sampler %248 = OpLoad %247 
          read_only Texture2DSampled %249 = OpSampledImage %246 %248 
                               f32_2 %251 = OpLoad vs_TEXCOORD1 
                               f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                               f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                               f32_4 %254 = OpLoad %34 
                               f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                              OpStore %34 %255 
                               f32_4 %258 = OpLoad %9 
                               f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                               f32_3 %262 = OpFMul %259 %261 
                               f32_4 %263 = OpLoad %34 
                               f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                               f32_3 %265 = OpFAdd %262 %264 
                               f32_4 %266 = OpLoad %257 
                               f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                              OpStore %257 %267 
                         Output f32* %269 = OpAccessChain %257 %38 
                                              OpStore %269 %37 
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
  GpuProgramID 487298
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
uniform 	vec4 _BaseTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat1 = texture(_BaseTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat1.xyz;
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
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD1 Location 114 
                                                      OpDecorate vs_TEXCOORD0 Location 131 
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
                                              %18 = OpTypeVector %6 2 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.674022E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %18 
                                 Input f32_2* %94 = OpVariable Input 
                                              %95 = OpTypePointer Input %6 
                                          f32 %99 = OpConstant 3.674022E-40 
                                             %101 = OpTypePointer Private %18 
                              Private f32_2* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 4 
                                             %113 = OpTypePointer Output %18 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                             %116 = OpTypePointer Function %6 
                                             %125 = OpTypePointer Output %6 
                                         u32 %127 = OpConstant 0 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %117 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
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
                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %23 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %96 = OpAccessChain %94 %69 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %92 %100 
                                       f32_2 %103 = OpLoad %94 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %102 %112 
                                        bool %115 = OpLoad %85 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %115 %118 %121 
                                             %118 = OpLabel 
                                         f32 %120 = OpLoad %92 
                                                      OpStore %117 %120 
                                                      OpBranch %119 
                                             %121 = OpLabel 
                                Private f32* %122 = OpAccessChain %102 %69 
                                         f32 %123 = OpLoad %122 
                                                      OpStore %117 %123 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                         f32 %124 = OpLoad %117 
                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
                                                      OpStore %126 %124 
                                Private f32* %128 = OpAccessChain %102 %127 
                                         f32 %129 = OpLoad %128 
                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
                                                      OpStore %130 %129 
                                       f32_2 %132 = OpLoad %94 
                              Uniform f32_4* %133 = OpAccessChain %21 %45 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %132 %135 
                              Uniform f32_4* %137 = OpAccessChain %21 %45 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore vs_TEXCOORD0 %140 
                                 Output f32* %141 = OpAccessChain %73 %23 %69 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFNegate %142 
                                 Output f32* %144 = OpAccessChain %73 %23 %69 
                                                      OpStore %144 %143 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 154
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %42 %133 %137 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpMemberDecorate %11 2 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 42 
                                              OpDecorate %56 DescriptorSet 56 
                                              OpDecorate %56 Binding 56 
                                              OpDecorate %60 DescriptorSet 60 
                                              OpDecorate %60 Binding 60 
                                              OpDecorate %128 DescriptorSet 128 
                                              OpDecorate %128 Binding 128 
                                              OpDecorate %130 DescriptorSet 130 
                                              OpDecorate %130 Binding 130 
                                              OpDecorate vs_TEXCOORD1 Location 133 
                                              OpDecorate %137 Location 137 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypeStruct %10 %6 %6 
                                      %12 = OpTypePointer Uniform %11 
   Uniform struct {f32_2; f32; f32;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypePointer Uniform %10 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  f32 %21 = OpConstant 3.674022E-40 
                                f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
                       Private f32_4* %24 = OpVariable Private 
                                  i32 %25 = OpConstant 1 
                                      %26 = OpTypePointer Uniform %6 
                                  f32 %29 = OpConstant 3.674022E-40 
                                      %31 = OpTypeInt 32 0 
                                  u32 %32 = OpConstant 0 
                                      %33 = OpTypePointer Private %6 
                       Private f32_4* %35 = OpVariable Private 
                                      %41 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %55 = OpTypePointer UniformConstant %54 
 UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
                                      %58 = OpTypeSampler 
                                      %59 = OpTypePointer UniformConstant %58 
             UniformConstant sampler* %60 = OpVariable UniformConstant 
                                      %62 = OpTypeSampledImage %54 
                                      %67 = OpTypeVector %6 3 
                                 i32 %121 = OpConstant 2 
UniformConstant read_only Texture2D* %128 = OpVariable UniformConstant 
            UniformConstant sampler* %130 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %136 = OpTypePointer Output %7 
                       Output f32_4* %137 = OpVariable Output 
                                 f32 %140 = OpConstant 3.674022E-40 
                               f32_3 %141 = OpConstantComposite %140 %140 %140 
                                 u32 %148 = OpConstant 3 
                                     %151 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Uniform f32_2* %17 = OpAccessChain %13 %15 
                                f32_2 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
                                f32_4 %23 = OpFMul %19 %22 
                                              OpStore %9 %23 
                         Uniform f32* %27 = OpAccessChain %13 %25 
                                  f32 %28 = OpLoad %27 
                                  f32 %30 = OpFMul %28 %29 
                         Private f32* %34 = OpAccessChain %24 %32 
                                              OpStore %34 %30 
                                f32_4 %36 = OpLoad %9 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 1 2 1 
                                f32_4 %38 = OpLoad %24 
                                f32_4 %39 = OpVectorShuffle %38 %38 0 0 0 0 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_2 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
                                f32_4 %45 = OpFAdd %40 %44 
                                              OpStore %35 %45 
                                f32_4 %46 = OpLoad %9 
                                f32_4 %47 = OpVectorShuffle %46 %46 0 3 2 3 
                                f32_4 %48 = OpLoad %24 
                                f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
                                f32_4 %50 = OpFMul %47 %49 
                                f32_2 %51 = OpLoad vs_TEXCOORD0 
                                f32_4 %52 = OpVectorShuffle %51 %51 0 1 0 1 
                                f32_4 %53 = OpFAdd %50 %52 
                                              OpStore %9 %53 
                  read_only Texture2D %57 = OpLoad %56 
                              sampler %61 = OpLoad %60 
           read_only Texture2DSampled %63 = OpSampledImage %57 %61 
                                f32_4 %64 = OpLoad %35 
                                f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                                f32_3 %68 = OpVectorShuffle %66 %66 0 1 2 
                                f32_4 %69 = OpLoad %24 
                                f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                              OpStore %24 %70 
                  read_only Texture2D %71 = OpLoad %56 
                              sampler %72 = OpLoad %60 
           read_only Texture2DSampled %73 = OpSampledImage %71 %72 
                                f32_4 %74 = OpLoad %35 
                                f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                f32_4 %76 = OpImageSampleImplicitLod %73 %75 
                                f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                f32_4 %78 = OpLoad %35 
                                f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                              OpStore %35 %79 
                                f32_4 %80 = OpLoad %24 
                                f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                f32_4 %82 = OpLoad %35 
                                f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                f32_3 %84 = OpFAdd %81 %83 
                                f32_4 %85 = OpLoad %24 
                                f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                              OpStore %24 %86 
                  read_only Texture2D %87 = OpLoad %56 
                              sampler %88 = OpLoad %60 
           read_only Texture2DSampled %89 = OpSampledImage %87 %88 
                                f32_4 %90 = OpLoad %9 
                                f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                f32_4 %92 = OpImageSampleImplicitLod %89 %91 
                                f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                f32_4 %94 = OpLoad %35 
                                f32_4 %95 = OpVectorShuffle %94 %93 4 5 6 3 
                                              OpStore %35 %95 
                  read_only Texture2D %96 = OpLoad %56 
                              sampler %97 = OpLoad %60 
           read_only Texture2DSampled %98 = OpSampledImage %96 %97 
                                f32_4 %99 = OpLoad %9 
                               f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                               f32_4 %101 = OpImageSampleImplicitLod %98 %100 
                               f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                               f32_4 %103 = OpLoad %9 
                               f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                              OpStore %9 %104 
                               f32_4 %105 = OpLoad %24 
                               f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                               f32_4 %107 = OpLoad %35 
                               f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                               f32_3 %109 = OpFAdd %106 %108 
                               f32_4 %110 = OpLoad %24 
                               f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                              OpStore %24 %111 
                               f32_4 %112 = OpLoad %9 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                               f32_4 %114 = OpLoad %24 
                               f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                               f32_3 %116 = OpFAdd %113 %115 
                               f32_4 %117 = OpLoad %9 
                               f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                              OpStore %9 %118 
                               f32_4 %119 = OpLoad %9 
                               f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                        Uniform f32* %122 = OpAccessChain %13 %121 
                                 f32 %123 = OpLoad %122 
                               f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                               f32_3 %125 = OpFMul %120 %124 
                               f32_4 %126 = OpLoad %9 
                               f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                              OpStore %9 %127 
                 read_only Texture2D %129 = OpLoad %128 
                             sampler %131 = OpLoad %130 
          read_only Texture2DSampled %132 = OpSampledImage %129 %131 
                               f32_2 %134 = OpLoad vs_TEXCOORD1 
                               f32_4 %135 = OpImageSampleImplicitLod %132 %134 
                                              OpStore %24 %135 
                               f32_4 %138 = OpLoad %9 
                               f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                               f32_3 %142 = OpFMul %139 %141 
                               f32_4 %143 = OpLoad %24 
                               f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                               f32_3 %145 = OpFAdd %142 %144 
                               f32_4 %146 = OpLoad %137 
                               f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                              OpStore %137 %147 
                        Private f32* %149 = OpAccessChain %24 %148 
                                 f32 %150 = OpLoad %149 
                         Output f32* %152 = OpAccessChain %137 %148 
                                              OpStore %152 %150 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	vec4 _BaseTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat1 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD1 Location 114 
                                                      OpDecorate vs_TEXCOORD0 Location 131 
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
                                              %18 = OpTypeVector %6 2 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.674022E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %18 
                                 Input f32_2* %94 = OpVariable Input 
                                              %95 = OpTypePointer Input %6 
                                          f32 %99 = OpConstant 3.674022E-40 
                                             %101 = OpTypePointer Private %18 
                              Private f32_2* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 4 
                                             %113 = OpTypePointer Output %18 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                             %116 = OpTypePointer Function %6 
                                             %125 = OpTypePointer Output %6 
                                         u32 %127 = OpConstant 0 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %117 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
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
                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %23 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %96 = OpAccessChain %94 %69 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %92 %100 
                                       f32_2 %103 = OpLoad %94 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %102 %112 
                                        bool %115 = OpLoad %85 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %115 %118 %121 
                                             %118 = OpLabel 
                                         f32 %120 = OpLoad %92 
                                                      OpStore %117 %120 
                                                      OpBranch %119 
                                             %121 = OpLabel 
                                Private f32* %122 = OpAccessChain %102 %69 
                                         f32 %123 = OpLoad %122 
                                                      OpStore %117 %123 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                         f32 %124 = OpLoad %117 
                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
                                                      OpStore %126 %124 
                                Private f32* %128 = OpAccessChain %102 %127 
                                         f32 %129 = OpLoad %128 
                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
                                                      OpStore %130 %129 
                                       f32_2 %132 = OpLoad %94 
                              Uniform f32_4* %133 = OpAccessChain %21 %45 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %132 %135 
                              Uniform f32_4* %137 = OpAccessChain %21 %45 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore vs_TEXCOORD0 %140 
                                 Output f32* %141 = OpAccessChain %73 %23 %69 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFNegate %142 
                                 Output f32* %144 = OpAccessChain %73 %23 %69 
                                                      OpStore %144 %143 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 220
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %42 %140 %174 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpMemberDecorate %11 2 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 42 
                                              OpDecorate %56 DescriptorSet 56 
                                              OpDecorate %56 Binding 56 
                                              OpDecorate %60 DescriptorSet 60 
                                              OpDecorate %60 Binding 60 
                                              OpDecorate %135 DescriptorSet 135 
                                              OpDecorate %135 Binding 135 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate vs_TEXCOORD1 Location 140 
                                              OpDecorate %174 Location 174 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypeStruct %10 %6 %6 
                                      %12 = OpTypePointer Uniform %11 
   Uniform struct {f32_2; f32; f32;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypePointer Uniform %10 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  f32 %21 = OpConstant 3.674022E-40 
                                f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
                       Private f32_4* %24 = OpVariable Private 
                                  i32 %25 = OpConstant 1 
                                      %26 = OpTypePointer Uniform %6 
                                  f32 %29 = OpConstant 3.674022E-40 
                                      %31 = OpTypeInt 32 0 
                                  u32 %32 = OpConstant 0 
                                      %33 = OpTypePointer Private %6 
                       Private f32_4* %35 = OpVariable Private 
                                      %41 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %55 = OpTypePointer UniformConstant %54 
 UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
                                      %58 = OpTypeSampler 
                                      %59 = OpTypePointer UniformConstant %58 
             UniformConstant sampler* %60 = OpVariable UniformConstant 
                                      %62 = OpTypeSampledImage %54 
                                      %67 = OpTypeVector %6 3 
                                 i32 %121 = OpConstant 2 
                                 f32 %130 = OpConstant 3.674022E-40 
                               f32_3 %131 = OpConstantComposite %130 %130 %130 
UniformConstant read_only Texture2D* %135 = OpVariable UniformConstant 
            UniformConstant sampler* %137 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %145 = OpConstant 3.674022E-40 
                               f32_3 %146 = OpConstantComposite %145 %145 %145 
                                 f32 %148 = OpConstant 3.674022E-40 
                               f32_3 %149 = OpConstantComposite %148 %148 %148 
                                 f32 %158 = OpConstant 3.674022E-40 
                               f32_3 %159 = OpConstantComposite %158 %158 %158 
                                     %173 = OpTypePointer Output %7 
                       Output f32_4* %174 = OpVariable Output 
                                 u32 %175 = OpConstant 3 
                                     %178 = OpTypePointer Output %6 
                                 f32 %182 = OpConstant 3.674022E-40 
                               f32_3 %183 = OpConstantComposite %182 %182 %182 
                                 f32 %194 = OpConstant 3.674022E-40 
                               f32_3 %195 = OpConstantComposite %194 %194 %194 
                                 f32 %206 = OpConstant 3.674022E-40 
                               f32_3 %207 = OpConstantComposite %206 %206 %206 
                                 f32 %209 = OpConstant 3.674022E-40 
                               f32_3 %210 = OpConstantComposite %209 %209 %209 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Uniform f32_2* %17 = OpAccessChain %13 %15 
                                f32_2 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
                                f32_4 %23 = OpFMul %19 %22 
                                              OpStore %9 %23 
                         Uniform f32* %27 = OpAccessChain %13 %25 
                                  f32 %28 = OpLoad %27 
                                  f32 %30 = OpFMul %28 %29 
                         Private f32* %34 = OpAccessChain %24 %32 
                                              OpStore %34 %30 
                                f32_4 %36 = OpLoad %9 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 1 2 1 
                                f32_4 %38 = OpLoad %24 
                                f32_4 %39 = OpVectorShuffle %38 %38 0 0 0 0 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_2 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
                                f32_4 %45 = OpFAdd %40 %44 
                                              OpStore %35 %45 
                                f32_4 %46 = OpLoad %9 
                                f32_4 %47 = OpVectorShuffle %46 %46 0 3 2 3 
                                f32_4 %48 = OpLoad %24 
                                f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
                                f32_4 %50 = OpFMul %47 %49 
                                f32_2 %51 = OpLoad vs_TEXCOORD0 
                                f32_4 %52 = OpVectorShuffle %51 %51 0 1 0 1 
                                f32_4 %53 = OpFAdd %50 %52 
                                              OpStore %9 %53 
                  read_only Texture2D %57 = OpLoad %56 
                              sampler %61 = OpLoad %60 
           read_only Texture2DSampled %63 = OpSampledImage %57 %61 
                                f32_4 %64 = OpLoad %35 
                                f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                                f32_3 %68 = OpVectorShuffle %66 %66 0 1 2 
                                f32_4 %69 = OpLoad %24 
                                f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                              OpStore %24 %70 
                  read_only Texture2D %71 = OpLoad %56 
                              sampler %72 = OpLoad %60 
           read_only Texture2DSampled %73 = OpSampledImage %71 %72 
                                f32_4 %74 = OpLoad %35 
                                f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                f32_4 %76 = OpImageSampleImplicitLod %73 %75 
                                f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                f32_4 %78 = OpLoad %35 
                                f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                              OpStore %35 %79 
                                f32_4 %80 = OpLoad %24 
                                f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                f32_4 %82 = OpLoad %35 
                                f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                f32_3 %84 = OpFAdd %81 %83 
                                f32_4 %85 = OpLoad %24 
                                f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                              OpStore %24 %86 
                  read_only Texture2D %87 = OpLoad %56 
                              sampler %88 = OpLoad %60 
           read_only Texture2DSampled %89 = OpSampledImage %87 %88 
                                f32_4 %90 = OpLoad %9 
                                f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                f32_4 %92 = OpImageSampleImplicitLod %89 %91 
                                f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                f32_4 %94 = OpLoad %35 
                                f32_4 %95 = OpVectorShuffle %94 %93 4 5 6 3 
                                              OpStore %35 %95 
                  read_only Texture2D %96 = OpLoad %56 
                              sampler %97 = OpLoad %60 
           read_only Texture2DSampled %98 = OpSampledImage %96 %97 
                                f32_4 %99 = OpLoad %9 
                               f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                               f32_4 %101 = OpImageSampleImplicitLod %98 %100 
                               f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                               f32_4 %103 = OpLoad %9 
                               f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                              OpStore %9 %104 
                               f32_4 %105 = OpLoad %24 
                               f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                               f32_4 %107 = OpLoad %35 
                               f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                               f32_3 %109 = OpFAdd %106 %108 
                               f32_4 %110 = OpLoad %24 
                               f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                              OpStore %24 %111 
                               f32_4 %112 = OpLoad %9 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                               f32_4 %114 = OpLoad %24 
                               f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                               f32_3 %116 = OpFAdd %113 %115 
                               f32_4 %117 = OpLoad %9 
                               f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                              OpStore %9 %118 
                               f32_4 %119 = OpLoad %9 
                               f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                        Uniform f32* %122 = OpAccessChain %13 %121 
                                 f32 %123 = OpLoad %122 
                               f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                               f32_3 %125 = OpFMul %120 %124 
                               f32_4 %126 = OpLoad %9 
                               f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                              OpStore %9 %127 
                               f32_4 %128 = OpLoad %9 
                               f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                               f32_3 %132 = OpFMul %129 %131 
                               f32_4 %133 = OpLoad %9 
                               f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                              OpStore %9 %134 
                 read_only Texture2D %136 = OpLoad %135 
                             sampler %138 = OpLoad %137 
          read_only Texture2DSampled %139 = OpSampledImage %136 %138 
                               f32_2 %141 = OpLoad vs_TEXCOORD1 
                               f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                              OpStore %24 %142 
                               f32_4 %143 = OpLoad %24 
                               f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                               f32_3 %147 = OpFMul %144 %146 
                               f32_3 %150 = OpFAdd %147 %149 
                               f32_4 %151 = OpLoad %35 
                               f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                              OpStore %35 %152 
                               f32_4 %153 = OpLoad %24 
                               f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                               f32_4 %155 = OpLoad %35 
                               f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                               f32_3 %157 = OpFMul %154 %156 
                               f32_3 %160 = OpFAdd %157 %159 
                               f32_4 %161 = OpLoad %35 
                               f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                              OpStore %35 %162 
                               f32_4 %163 = OpLoad %24 
                               f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                               f32_4 %165 = OpLoad %35 
                               f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                               f32_3 %167 = OpFMul %164 %166 
                               f32_4 %168 = OpLoad %9 
                               f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                               f32_3 %170 = OpFAdd %167 %169 
                               f32_4 %171 = OpLoad %9 
                               f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                              OpStore %9 %172 
                        Private f32* %176 = OpAccessChain %24 %175 
                                 f32 %177 = OpLoad %176 
                         Output f32* %179 = OpAccessChain %174 %175 
                                              OpStore %179 %177 
                               f32_4 %180 = OpLoad %9 
                               f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                               f32_3 %184 = OpExtInst %1 40 %181 %183 
                               f32_4 %185 = OpLoad %9 
                               f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                              OpStore %9 %186 
                               f32_4 %187 = OpLoad %9 
                               f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                               f32_3 %189 = OpExtInst %1 30 %188 
                               f32_4 %190 = OpLoad %9 
                               f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                              OpStore %9 %191 
                               f32_4 %192 = OpLoad %9 
                               f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                               f32_3 %196 = OpFMul %193 %195 
                               f32_4 %197 = OpLoad %9 
                               f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                              OpStore %9 %198 
                               f32_4 %199 = OpLoad %9 
                               f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                               f32_3 %201 = OpExtInst %1 29 %200 
                               f32_4 %202 = OpLoad %9 
                               f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
                                              OpStore %9 %203 
                               f32_4 %204 = OpLoad %9 
                               f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                               f32_3 %208 = OpFMul %205 %207 
                               f32_3 %211 = OpFAdd %208 %210 
                               f32_4 %212 = OpLoad %9 
                               f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                              OpStore %9 %213 
                               f32_4 %214 = OpLoad %9 
                               f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                               f32_3 %216 = OpExtInst %1 40 %215 %183 
                               f32_4 %217 = OpLoad %174 
                               f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                              OpStore %174 %218 
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 560196
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
uniform 	vec4 _BaseTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat3 = texture(_MainTex, u_xlat3.xy);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat2.xyz * vec3(4.0, 4.0, 4.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat2 = texture(_MainTex, u_xlat4.xy);
    u_xlat3 = texture(_MainTex, u_xlat4.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat1 = texture(_BaseTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat1.xyz;
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
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD1 Location 114 
                                                      OpDecorate vs_TEXCOORD0 Location 131 
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
                                              %18 = OpTypeVector %6 2 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.674022E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %18 
                                 Input f32_2* %94 = OpVariable Input 
                                              %95 = OpTypePointer Input %6 
                                          f32 %99 = OpConstant 3.674022E-40 
                                             %101 = OpTypePointer Private %18 
                              Private f32_2* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 4 
                                             %113 = OpTypePointer Output %18 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                             %116 = OpTypePointer Function %6 
                                             %125 = OpTypePointer Output %6 
                                         u32 %127 = OpConstant 0 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %117 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
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
                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %23 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %96 = OpAccessChain %94 %69 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %92 %100 
                                       f32_2 %103 = OpLoad %94 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %102 %112 
                                        bool %115 = OpLoad %85 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %115 %118 %121 
                                             %118 = OpLabel 
                                         f32 %120 = OpLoad %92 
                                                      OpStore %117 %120 
                                                      OpBranch %119 
                                             %121 = OpLabel 
                                Private f32* %122 = OpAccessChain %102 %69 
                                         f32 %123 = OpLoad %122 
                                                      OpStore %117 %123 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                         f32 %124 = OpLoad %117 
                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
                                                      OpStore %126 %124 
                                Private f32* %128 = OpAccessChain %102 %127 
                                         f32 %129 = OpLoad %128 
                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
                                                      OpStore %130 %129 
                                       f32_2 %132 = OpLoad %94 
                              Uniform f32_4* %133 = OpAccessChain %21 %45 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %132 %135 
                              Uniform f32_4* %137 = OpAccessChain %21 %45 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore vs_TEXCOORD0 %140 
                                 Output f32* %141 = OpAccessChain %73 %23 %69 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFNegate %142 
                                 Output f32* %144 = OpAccessChain %73 %23 %69 
                                                      OpStore %144 %143 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 279
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %51 %259 %263 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %16 0 Offset 16 
                                              OpMemberDecorate %16 1 Offset 16 
                                              OpMemberDecorate %16 2 Offset 16 
                                              OpDecorate %16 Block 
                                              OpDecorate %18 DescriptorSet 18 
                                              OpDecorate %18 Binding 18 
                                              OpDecorate vs_TEXCOORD0 Location 51 
                                              OpDecorate %58 DescriptorSet 58 
                                              OpDecorate %58 Binding 58 
                                              OpDecorate %62 DescriptorSet 62 
                                              OpDecorate %62 Binding 62 
                                              OpDecorate %254 DescriptorSet 254 
                                              OpDecorate %254 Binding 254 
                                              OpDecorate %256 DescriptorSet 256 
                                              OpDecorate %256 Binding 256 
                                              OpDecorate vs_TEXCOORD1 Location 259 
                                              OpDecorate %263 Location 263 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                  f32 %10 = OpConstant 3.674022E-40 
                                      %11 = OpTypeInt 32 0 
                                  u32 %12 = OpConstant 0 
                                      %13 = OpTypePointer Private %6 
                                      %15 = OpTypeVector %6 2 
                                      %16 = OpTypeStruct %15 %6 %6 
                                      %17 = OpTypePointer Uniform %16 
   Uniform struct {f32_2; f32; f32;}* %18 = OpVariable Uniform 
                                      %19 = OpTypeInt 32 1 
                                  i32 %20 = OpConstant 1 
                                      %21 = OpTypePointer Uniform %6 
                                  u32 %24 = OpConstant 2 
                                  i32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Uniform %15 
                       Private f32_4* %34 = OpVariable Private 
                                  f32 %35 = OpConstant 3.674022E-40 
                                  f32 %37 = OpConstant 3.674022E-40 
                                  u32 %38 = OpConstant 3 
                       Private f32_4* %43 = OpVariable Private 
                                      %50 = OpTypePointer Input %15 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                       Private f32_4* %55 = OpVariable Private 
                                      %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %57 = OpTypePointer UniformConstant %56 
 UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
                                      %60 = OpTypeSampler 
                                      %61 = OpTypePointer UniformConstant %60 
             UniformConstant sampler* %62 = OpVariable UniformConstant 
                                      %64 = OpTypeSampledImage %56 
                                      %69 = OpTypeVector %6 3 
                                  f32 %84 = OpConstant 3.674022E-40 
                                f32_3 %85 = OpConstantComposite %84 %84 %84 
                      Private f32_4* %126 = OpVariable Private 
                                 f32 %189 = OpConstant 3.674022E-40 
                               f32_3 %190 = OpConstantComposite %189 %189 %189 
                                 i32 %247 = OpConstant 2 
UniformConstant read_only Texture2D* %254 = OpVariable UniformConstant 
            UniformConstant sampler* %256 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %262 = OpTypePointer Output %7 
                       Output f32_4* %263 = OpVariable Output 
                                 f32 %266 = OpConstant 3.674022E-40 
                               f32_3 %267 = OpConstantComposite %266 %266 %266 
                                     %276 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                         Private f32* %14 = OpAccessChain %9 %12 
                                              OpStore %14 %10 
                         Uniform f32* %22 = OpAccessChain %18 %20 
                                  f32 %23 = OpLoad %22 
                         Private f32* %25 = OpAccessChain %9 %24 
                                              OpStore %25 %23 
                                f32_4 %26 = OpLoad %9 
                                f32_4 %27 = OpVectorShuffle %26 %26 0 0 2 2 
                       Uniform f32_2* %30 = OpAccessChain %18 %28 
                                f32_2 %31 = OpLoad %30 
                                f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
                                f32_4 %33 = OpFMul %27 %32 
                                              OpStore %9 %33 
                         Private f32* %36 = OpAccessChain %34 %24 
                                              OpStore %36 %35 
                         Private f32* %39 = OpAccessChain %34 %38 
                                              OpStore %39 %37 
                         Uniform f32* %40 = OpAccessChain %18 %20 
                                  f32 %41 = OpLoad %40 
                         Private f32* %42 = OpAccessChain %34 %12 
                                              OpStore %42 %41 
                                f32_4 %44 = OpLoad %9 
                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 3 1 
                                f32_4 %46 = OpFNegate %45 
                                f32_4 %47 = OpLoad %34 
                                f32_4 %48 = OpVectorShuffle %47 %47 0 0 3 0 
                                f32_4 %49 = OpFMul %46 %48 
                                f32_2 %52 = OpLoad vs_TEXCOORD0 
                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
                                f32_4 %54 = OpFAdd %49 %53 
                                              OpStore %43 %54 
                  read_only Texture2D %59 = OpLoad %58 
                              sampler %63 = OpLoad %62 
           read_only Texture2DSampled %65 = OpSampledImage %59 %63 
                                f32_4 %66 = OpLoad %43 
                                f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                                f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                f32_3 %70 = OpVectorShuffle %68 %68 0 1 2 
                                f32_4 %71 = OpLoad %55 
                                f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                              OpStore %55 %72 
                  read_only Texture2D %73 = OpLoad %58 
                              sampler %74 = OpLoad %62 
           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                                f32_4 %76 = OpLoad %43 
                                f32_2 %77 = OpVectorShuffle %76 %76 2 3 
                                f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                                f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                f32_4 %80 = OpLoad %43 
                                f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                              OpStore %43 %81 
                                f32_4 %82 = OpLoad %43 
                                f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                f32_3 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %55 
                                f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                f32_3 %89 = OpFAdd %86 %88 
                                f32_4 %90 = OpLoad %43 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                              OpStore %43 %91 
                                f32_4 %92 = OpLoad %9 
                                f32_2 %93 = OpVectorShuffle %92 %92 2 1 
                                f32_2 %94 = OpFNegate %93 
                                f32_4 %95 = OpLoad %34 
                                f32_2 %96 = OpVectorShuffle %95 %95 2 0 
                                f32_2 %97 = OpFMul %94 %96 
                                f32_2 %98 = OpLoad vs_TEXCOORD0 
                                f32_2 %99 = OpFAdd %97 %98 
                               f32_4 %100 = OpLoad %55 
                               f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                              OpStore %55 %101 
                 read_only Texture2D %102 = OpLoad %58 
                             sampler %103 = OpLoad %62 
          read_only Texture2DSampled %104 = OpSampledImage %102 %103 
                               f32_4 %105 = OpLoad %55 
                               f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                               f32_4 %107 = OpImageSampleImplicitLod %104 %106 
                               f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                               f32_4 %109 = OpLoad %55 
                               f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                              OpStore %55 %110 
                               f32_4 %111 = OpLoad %43 
                               f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                               f32_4 %113 = OpLoad %55 
                               f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                               f32_3 %115 = OpFAdd %112 %114 
                               f32_4 %116 = OpLoad %43 
                               f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                              OpStore %43 %117 
                               f32_4 %118 = OpLoad %9 
                               f32_4 %119 = OpVectorShuffle %118 %118 2 3 0 3 
                               f32_4 %120 = OpLoad %34 
                               f32_4 %121 = OpVectorShuffle %120 %120 2 3 0 3 
                               f32_4 %122 = OpFMul %119 %121 
                               f32_2 %123 = OpLoad vs_TEXCOORD0 
                               f32_4 %124 = OpVectorShuffle %123 %123 0 1 0 1 
                               f32_4 %125 = OpFAdd %122 %124 
                                              OpStore %55 %125 
                               f32_4 %127 = OpLoad %9 
                               f32_4 %128 = OpVectorShuffle %127 %127 2 1 3 1 
                               f32_4 %129 = OpLoad %34 
                               f32_4 %130 = OpVectorShuffle %129 %129 2 0 3 0 
                               f32_4 %131 = OpFMul %128 %130 
                               f32_2 %132 = OpLoad vs_TEXCOORD0 
                               f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 1 
                               f32_4 %134 = OpFAdd %131 %133 
                                              OpStore %126 %134 
                               f32_4 %135 = OpLoad %9 
                               f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                               f32_4 %137 = OpLoad %34 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                               f32_2 %139 = OpFMul %136 %138 
                               f32_2 %140 = OpLoad vs_TEXCOORD0 
                               f32_2 %141 = OpFAdd %139 %140 
                               f32_4 %142 = OpLoad %9 
                               f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                              OpStore %9 %143 
                 read_only Texture2D %144 = OpLoad %58 
                             sampler %145 = OpLoad %62 
          read_only Texture2DSampled %146 = OpSampledImage %144 %145 
                               f32_4 %147 = OpLoad %9 
                               f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                               f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                               f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                               f32_4 %151 = OpLoad %9 
                               f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                              OpStore %9 %152 
                 read_only Texture2D %153 = OpLoad %58 
                             sampler %154 = OpLoad %62 
          read_only Texture2DSampled %155 = OpSampledImage %153 %154 
                               f32_4 %156 = OpLoad %55 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                               f32_4 %158 = OpImageSampleImplicitLod %155 %157 
                               f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                               f32_4 %160 = OpLoad %34 
                               f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
                                              OpStore %34 %161 
                 read_only Texture2D %162 = OpLoad %58 
                             sampler %163 = OpLoad %62 
          read_only Texture2DSampled %164 = OpSampledImage %162 %163 
                               f32_4 %165 = OpLoad %55 
                               f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                               f32_4 %167 = OpImageSampleImplicitLod %164 %166 
                               f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                               f32_4 %169 = OpLoad %55 
                               f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                              OpStore %55 %170 
                               f32_4 %171 = OpLoad %34 
                               f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                               f32_3 %173 = OpFMul %172 %85 
                               f32_4 %174 = OpLoad %43 
                               f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                               f32_3 %176 = OpFAdd %173 %175 
                               f32_4 %177 = OpLoad %34 
                               f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                              OpStore %34 %178 
                 read_only Texture2D %179 = OpLoad %58 
                             sampler %180 = OpLoad %62 
          read_only Texture2DSampled %181 = OpSampledImage %179 %180 
                               f32_2 %182 = OpLoad vs_TEXCOORD0 
                               f32_4 %183 = OpImageSampleImplicitLod %181 %182 
                               f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                               f32_4 %185 = OpLoad %43 
                               f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                              OpStore %43 %186 
                               f32_4 %187 = OpLoad %43 
                               f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                               f32_3 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %34 
                               f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                               f32_3 %194 = OpFAdd %191 %193 
                               f32_4 %195 = OpLoad %34 
                               f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                              OpStore %34 %196 
                               f32_4 %197 = OpLoad %55 
                               f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                               f32_3 %199 = OpFMul %198 %85 
                               f32_4 %200 = OpLoad %34 
                               f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                               f32_3 %202 = OpFAdd %199 %201 
                               f32_4 %203 = OpLoad %34 
                               f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                              OpStore %34 %204 
                 read_only Texture2D %205 = OpLoad %58 
                             sampler %206 = OpLoad %62 
          read_only Texture2DSampled %207 = OpSampledImage %205 %206 
                               f32_4 %208 = OpLoad %126 
                               f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                               f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                               f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                               f32_4 %212 = OpLoad %43 
                               f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                              OpStore %43 %213 
                 read_only Texture2D %214 = OpLoad %58 
                             sampler %215 = OpLoad %62 
          read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                               f32_4 %217 = OpLoad %126 
                               f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                               f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                               f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                               f32_4 %221 = OpLoad %55 
                               f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                              OpStore %55 %222 
                               f32_4 %223 = OpLoad %34 
                               f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                               f32_4 %225 = OpLoad %43 
                               f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                               f32_3 %227 = OpFAdd %224 %226 
                               f32_4 %228 = OpLoad %34 
                               f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                              OpStore %34 %229 
                               f32_4 %230 = OpLoad %55 
                               f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                               f32_3 %232 = OpFMul %231 %85 
                               f32_4 %233 = OpLoad %34 
                               f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                               f32_3 %235 = OpFAdd %232 %234 
                               f32_4 %236 = OpLoad %34 
                               f32_4 %237 = OpVectorShuffle %236 %235 4 5 6 3 
                                              OpStore %34 %237 
                               f32_4 %238 = OpLoad %9 
                               f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                               f32_4 %240 = OpLoad %34 
                               f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                               f32_3 %242 = OpFAdd %239 %241 
                               f32_4 %243 = OpLoad %9 
                               f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
                                              OpStore %9 %244 
                               f32_4 %245 = OpLoad %9 
                               f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                        Uniform f32* %248 = OpAccessChain %18 %247 
                                 f32 %249 = OpLoad %248 
                               f32_3 %250 = OpCompositeConstruct %249 %249 %249 
                               f32_3 %251 = OpFMul %246 %250 
                               f32_4 %252 = OpLoad %9 
                               f32_4 %253 = OpVectorShuffle %252 %251 4 5 6 3 
                                              OpStore %9 %253 
                 read_only Texture2D %255 = OpLoad %254 
                             sampler %257 = OpLoad %256 
          read_only Texture2DSampled %258 = OpSampledImage %255 %257 
                               f32_2 %260 = OpLoad vs_TEXCOORD1 
                               f32_4 %261 = OpImageSampleImplicitLod %258 %260 
                                              OpStore %34 %261 
                               f32_4 %264 = OpLoad %9 
                               f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                               f32_3 %268 = OpFMul %265 %267 
                               f32_4 %269 = OpLoad %34 
                               f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                               f32_3 %271 = OpFAdd %268 %270 
                               f32_4 %272 = OpLoad %263 
                               f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                              OpStore %263 %273 
                        Private f32* %274 = OpAccessChain %34 %38 
                                 f32 %275 = OpLoad %274 
                         Output f32* %277 = OpAccessChain %263 %38 
                                              OpStore %277 %275 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	vec4 _BaseTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat6;
void main()
{
    u_xlat0.x = float(1.0);
    u_xlat0.w = float(0.0);
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzw * _MainTex_TexelSize.xyxy;
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
    u_xlat1.z = -1.0;
    u_xlat6.xz = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat3 = texture(_MainTex, u_xlat6.xz);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zxxx + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxxx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat2.xyz * vec3(4.0, 4.0, 4.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat2 = texture(_MainTex, u_xlat4.xy);
    u_xlat3 = texture(_MainTex, u_xlat4.zw);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat1 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 146
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD1 Location 114 
                                                      OpDecorate vs_TEXCOORD0 Location 131 
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
                                              %18 = OpTypeVector %6 2 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.674022E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %18 
                                 Input f32_2* %94 = OpVariable Input 
                                              %95 = OpTypePointer Input %6 
                                          f32 %99 = OpConstant 3.674022E-40 
                                             %101 = OpTypePointer Private %18 
                              Private f32_2* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 4 
                                             %113 = OpTypePointer Output %18 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                             %116 = OpTypePointer Function %6 
                                             %125 = OpTypePointer Output %6 
                                         u32 %127 = OpConstant 0 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %117 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
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
                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %23 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %96 = OpAccessChain %94 %69 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %92 %100 
                                       f32_2 %103 = OpLoad %94 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %102 %112 
                                        bool %115 = OpLoad %85 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %115 %118 %121 
                                             %118 = OpLabel 
                                         f32 %120 = OpLoad %92 
                                                      OpStore %117 %120 
                                                      OpBranch %119 
                                             %121 = OpLabel 
                                Private f32* %122 = OpAccessChain %102 %69 
                                         f32 %123 = OpLoad %122 
                                                      OpStore %117 %123 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                         f32 %124 = OpLoad %117 
                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
                                                      OpStore %126 %124 
                                Private f32* %128 = OpAccessChain %102 %127 
                                         f32 %129 = OpLoad %128 
                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
                                                      OpStore %130 %129 
                                       f32_2 %132 = OpLoad %94 
                              Uniform f32_4* %133 = OpAccessChain %21 %45 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %132 %135 
                              Uniform f32_4* %137 = OpAccessChain %21 %45 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore vs_TEXCOORD0 %140 
                                 Output f32* %141 = OpAccessChain %73 %23 %69 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFNegate %142 
                                 Output f32* %144 = OpAccessChain %73 %23 %69 
                                                      OpStore %144 %143 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 344
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %51 %266 %300 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %16 0 Offset 16 
                                              OpMemberDecorate %16 1 Offset 16 
                                              OpMemberDecorate %16 2 Offset 16 
                                              OpDecorate %16 Block 
                                              OpDecorate %18 DescriptorSet 18 
                                              OpDecorate %18 Binding 18 
                                              OpDecorate vs_TEXCOORD0 Location 51 
                                              OpDecorate %58 DescriptorSet 58 
                                              OpDecorate %58 Binding 58 
                                              OpDecorate %62 DescriptorSet 62 
                                              OpDecorate %62 Binding 62 
                                              OpDecorate %261 DescriptorSet 261 
                                              OpDecorate %261 Binding 261 
                                              OpDecorate %263 DescriptorSet 263 
                                              OpDecorate %263 Binding 263 
                                              OpDecorate vs_TEXCOORD1 Location 266 
                                              OpDecorate %300 Location 300 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                  f32 %10 = OpConstant 3.674022E-40 
                                      %11 = OpTypeInt 32 0 
                                  u32 %12 = OpConstant 0 
                                      %13 = OpTypePointer Private %6 
                                      %15 = OpTypeVector %6 2 
                                      %16 = OpTypeStruct %15 %6 %6 
                                      %17 = OpTypePointer Uniform %16 
   Uniform struct {f32_2; f32; f32;}* %18 = OpVariable Uniform 
                                      %19 = OpTypeInt 32 1 
                                  i32 %20 = OpConstant 1 
                                      %21 = OpTypePointer Uniform %6 
                                  u32 %24 = OpConstant 2 
                                  i32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Uniform %15 
                       Private f32_4* %34 = OpVariable Private 
                                  f32 %35 = OpConstant 3.674022E-40 
                                  f32 %37 = OpConstant 3.674022E-40 
                                  u32 %38 = OpConstant 3 
                       Private f32_4* %43 = OpVariable Private 
                                      %50 = OpTypePointer Input %15 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                       Private f32_4* %55 = OpVariable Private 
                                      %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %57 = OpTypePointer UniformConstant %56 
 UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
                                      %60 = OpTypeSampler 
                                      %61 = OpTypePointer UniformConstant %60 
             UniformConstant sampler* %62 = OpVariable UniformConstant 
                                      %64 = OpTypeSampledImage %56 
                                      %69 = OpTypeVector %6 3 
                                  f32 %84 = OpConstant 3.674022E-40 
                                f32_3 %85 = OpConstantComposite %84 %84 %84 
                      Private f32_4* %126 = OpVariable Private 
                                 f32 %189 = OpConstant 3.674022E-40 
                               f32_3 %190 = OpConstantComposite %189 %189 %189 
                                 i32 %247 = OpConstant 2 
                                 f32 %256 = OpConstant 3.674022E-40 
                               f32_3 %257 = OpConstantComposite %256 %256 %256 
UniformConstant read_only Texture2D* %261 = OpVariable UniformConstant 
            UniformConstant sampler* %263 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %271 = OpConstant 3.674022E-40 
                               f32_3 %272 = OpConstantComposite %271 %271 %271 
                                 f32 %274 = OpConstant 3.674022E-40 
                               f32_3 %275 = OpConstantComposite %274 %274 %274 
                                 f32 %284 = OpConstant 3.674022E-40 
                               f32_3 %285 = OpConstantComposite %284 %284 %284 
                                     %299 = OpTypePointer Output %7 
                       Output f32_4* %300 = OpVariable Output 
                                     %303 = OpTypePointer Output %6 
                               f32_3 %307 = OpConstantComposite %37 %37 %37 
                                 f32 %318 = OpConstant 3.674022E-40 
                               f32_3 %319 = OpConstantComposite %318 %318 %318 
                                 f32 %330 = OpConstant 3.674022E-40 
                               f32_3 %331 = OpConstantComposite %330 %330 %330 
                                 f32 %333 = OpConstant 3.674022E-40 
                               f32_3 %334 = OpConstantComposite %333 %333 %333 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                         Private f32* %14 = OpAccessChain %9 %12 
                                              OpStore %14 %10 
                         Uniform f32* %22 = OpAccessChain %18 %20 
                                  f32 %23 = OpLoad %22 
                         Private f32* %25 = OpAccessChain %9 %24 
                                              OpStore %25 %23 
                                f32_4 %26 = OpLoad %9 
                                f32_4 %27 = OpVectorShuffle %26 %26 0 0 2 2 
                       Uniform f32_2* %30 = OpAccessChain %18 %28 
                                f32_2 %31 = OpLoad %30 
                                f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
                                f32_4 %33 = OpFMul %27 %32 
                                              OpStore %9 %33 
                         Private f32* %36 = OpAccessChain %34 %24 
                                              OpStore %36 %35 
                         Private f32* %39 = OpAccessChain %34 %38 
                                              OpStore %39 %37 
                         Uniform f32* %40 = OpAccessChain %18 %20 
                                  f32 %41 = OpLoad %40 
                         Private f32* %42 = OpAccessChain %34 %12 
                                              OpStore %42 %41 
                                f32_4 %44 = OpLoad %9 
                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 3 1 
                                f32_4 %46 = OpFNegate %45 
                                f32_4 %47 = OpLoad %34 
                                f32_4 %48 = OpVectorShuffle %47 %47 0 0 3 0 
                                f32_4 %49 = OpFMul %46 %48 
                                f32_2 %52 = OpLoad vs_TEXCOORD0 
                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
                                f32_4 %54 = OpFAdd %49 %53 
                                              OpStore %43 %54 
                  read_only Texture2D %59 = OpLoad %58 
                              sampler %63 = OpLoad %62 
           read_only Texture2DSampled %65 = OpSampledImage %59 %63 
                                f32_4 %66 = OpLoad %43 
                                f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                                f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                f32_3 %70 = OpVectorShuffle %68 %68 0 1 2 
                                f32_4 %71 = OpLoad %55 
                                f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                              OpStore %55 %72 
                  read_only Texture2D %73 = OpLoad %58 
                              sampler %74 = OpLoad %62 
           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                                f32_4 %76 = OpLoad %43 
                                f32_2 %77 = OpVectorShuffle %76 %76 2 3 
                                f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                                f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                f32_4 %80 = OpLoad %43 
                                f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                              OpStore %43 %81 
                                f32_4 %82 = OpLoad %43 
                                f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                f32_3 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %55 
                                f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                f32_3 %89 = OpFAdd %86 %88 
                                f32_4 %90 = OpLoad %43 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                              OpStore %43 %91 
                                f32_4 %92 = OpLoad %9 
                                f32_2 %93 = OpVectorShuffle %92 %92 2 1 
                                f32_2 %94 = OpFNegate %93 
                                f32_4 %95 = OpLoad %34 
                                f32_2 %96 = OpVectorShuffle %95 %95 2 0 
                                f32_2 %97 = OpFMul %94 %96 
                                f32_2 %98 = OpLoad vs_TEXCOORD0 
                                f32_2 %99 = OpFAdd %97 %98 
                               f32_4 %100 = OpLoad %55 
                               f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                              OpStore %55 %101 
                 read_only Texture2D %102 = OpLoad %58 
                             sampler %103 = OpLoad %62 
          read_only Texture2DSampled %104 = OpSampledImage %102 %103 
                               f32_4 %105 = OpLoad %55 
                               f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                               f32_4 %107 = OpImageSampleImplicitLod %104 %106 
                               f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                               f32_4 %109 = OpLoad %55 
                               f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                              OpStore %55 %110 
                               f32_4 %111 = OpLoad %43 
                               f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                               f32_4 %113 = OpLoad %55 
                               f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                               f32_3 %115 = OpFAdd %112 %114 
                               f32_4 %116 = OpLoad %43 
                               f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                              OpStore %43 %117 
                               f32_4 %118 = OpLoad %9 
                               f32_4 %119 = OpVectorShuffle %118 %118 2 3 0 3 
                               f32_4 %120 = OpLoad %34 
                               f32_4 %121 = OpVectorShuffle %120 %120 2 3 0 3 
                               f32_4 %122 = OpFMul %119 %121 
                               f32_2 %123 = OpLoad vs_TEXCOORD0 
                               f32_4 %124 = OpVectorShuffle %123 %123 0 1 0 1 
                               f32_4 %125 = OpFAdd %122 %124 
                                              OpStore %55 %125 
                               f32_4 %127 = OpLoad %9 
                               f32_4 %128 = OpVectorShuffle %127 %127 2 1 3 1 
                               f32_4 %129 = OpLoad %34 
                               f32_4 %130 = OpVectorShuffle %129 %129 2 0 3 0 
                               f32_4 %131 = OpFMul %128 %130 
                               f32_2 %132 = OpLoad vs_TEXCOORD0 
                               f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 1 
                               f32_4 %134 = OpFAdd %131 %133 
                                              OpStore %126 %134 
                               f32_4 %135 = OpLoad %9 
                               f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                               f32_4 %137 = OpLoad %34 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                               f32_2 %139 = OpFMul %136 %138 
                               f32_2 %140 = OpLoad vs_TEXCOORD0 
                               f32_2 %141 = OpFAdd %139 %140 
                               f32_4 %142 = OpLoad %9 
                               f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                              OpStore %9 %143 
                 read_only Texture2D %144 = OpLoad %58 
                             sampler %145 = OpLoad %62 
          read_only Texture2DSampled %146 = OpSampledImage %144 %145 
                               f32_4 %147 = OpLoad %9 
                               f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                               f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                               f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                               f32_4 %151 = OpLoad %9 
                               f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                              OpStore %9 %152 
                 read_only Texture2D %153 = OpLoad %58 
                             sampler %154 = OpLoad %62 
          read_only Texture2DSampled %155 = OpSampledImage %153 %154 
                               f32_4 %156 = OpLoad %55 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                               f32_4 %158 = OpImageSampleImplicitLod %155 %157 
                               f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                               f32_4 %160 = OpLoad %34 
                               f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
                                              OpStore %34 %161 
                 read_only Texture2D %162 = OpLoad %58 
                             sampler %163 = OpLoad %62 
          read_only Texture2DSampled %164 = OpSampledImage %162 %163 
                               f32_4 %165 = OpLoad %55 
                               f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                               f32_4 %167 = OpImageSampleImplicitLod %164 %166 
                               f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                               f32_4 %169 = OpLoad %55 
                               f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                              OpStore %55 %170 
                               f32_4 %171 = OpLoad %34 
                               f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                               f32_3 %173 = OpFMul %172 %85 
                               f32_4 %174 = OpLoad %43 
                               f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                               f32_3 %176 = OpFAdd %173 %175 
                               f32_4 %177 = OpLoad %34 
                               f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                              OpStore %34 %178 
                 read_only Texture2D %179 = OpLoad %58 
                             sampler %180 = OpLoad %62 
          read_only Texture2DSampled %181 = OpSampledImage %179 %180 
                               f32_2 %182 = OpLoad vs_TEXCOORD0 
                               f32_4 %183 = OpImageSampleImplicitLod %181 %182 
                               f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                               f32_4 %185 = OpLoad %43 
                               f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                              OpStore %43 %186 
                               f32_4 %187 = OpLoad %43 
                               f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                               f32_3 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %34 
                               f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                               f32_3 %194 = OpFAdd %191 %193 
                               f32_4 %195 = OpLoad %34 
                               f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                              OpStore %34 %196 
                               f32_4 %197 = OpLoad %55 
                               f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                               f32_3 %199 = OpFMul %198 %85 
                               f32_4 %200 = OpLoad %34 
                               f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                               f32_3 %202 = OpFAdd %199 %201 
                               f32_4 %203 = OpLoad %34 
                               f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                              OpStore %34 %204 
                 read_only Texture2D %205 = OpLoad %58 
                             sampler %206 = OpLoad %62 
          read_only Texture2DSampled %207 = OpSampledImage %205 %206 
                               f32_4 %208 = OpLoad %126 
                               f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                               f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                               f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                               f32_4 %212 = OpLoad %43 
                               f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                              OpStore %43 %213 
                 read_only Texture2D %214 = OpLoad %58 
                             sampler %215 = OpLoad %62 
          read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                               f32_4 %217 = OpLoad %126 
                               f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                               f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                               f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                               f32_4 %221 = OpLoad %55 
                               f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                              OpStore %55 %222 
                               f32_4 %223 = OpLoad %34 
                               f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                               f32_4 %225 = OpLoad %43 
                               f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                               f32_3 %227 = OpFAdd %224 %226 
                               f32_4 %228 = OpLoad %34 
                               f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                              OpStore %34 %229 
                               f32_4 %230 = OpLoad %55 
                               f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                               f32_3 %232 = OpFMul %231 %85 
                               f32_4 %233 = OpLoad %34 
                               f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                               f32_3 %235 = OpFAdd %232 %234 
                               f32_4 %236 = OpLoad %34 
                               f32_4 %237 = OpVectorShuffle %236 %235 4 5 6 3 
                                              OpStore %34 %237 
                               f32_4 %238 = OpLoad %9 
                               f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                               f32_4 %240 = OpLoad %34 
                               f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                               f32_3 %242 = OpFAdd %239 %241 
                               f32_4 %243 = OpLoad %9 
                               f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
                                              OpStore %9 %244 
                               f32_4 %245 = OpLoad %9 
                               f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                        Uniform f32* %248 = OpAccessChain %18 %247 
                                 f32 %249 = OpLoad %248 
                               f32_3 %250 = OpCompositeConstruct %249 %249 %249 
                               f32_3 %251 = OpFMul %246 %250 
                               f32_4 %252 = OpLoad %9 
                               f32_4 %253 = OpVectorShuffle %252 %251 4 5 6 3 
                                              OpStore %9 %253 
                               f32_4 %254 = OpLoad %9 
                               f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                               f32_3 %258 = OpFMul %255 %257 
                               f32_4 %259 = OpLoad %9 
                               f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                              OpStore %9 %260 
                 read_only Texture2D %262 = OpLoad %261 
                             sampler %264 = OpLoad %263 
          read_only Texture2DSampled %265 = OpSampledImage %262 %264 
                               f32_2 %267 = OpLoad vs_TEXCOORD1 
                               f32_4 %268 = OpImageSampleImplicitLod %265 %267 
                                              OpStore %34 %268 
                               f32_4 %269 = OpLoad %34 
                               f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                               f32_3 %273 = OpFMul %270 %272 
                               f32_3 %276 = OpFAdd %273 %275 
                               f32_4 %277 = OpLoad %43 
                               f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
                                              OpStore %43 %278 
                               f32_4 %279 = OpLoad %34 
                               f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                               f32_4 %281 = OpLoad %43 
                               f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                               f32_3 %283 = OpFMul %280 %282 
                               f32_3 %286 = OpFAdd %283 %285 
                               f32_4 %287 = OpLoad %43 
                               f32_4 %288 = OpVectorShuffle %287 %286 4 5 6 3 
                                              OpStore %43 %288 
                               f32_4 %289 = OpLoad %34 
                               f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
                               f32_4 %291 = OpLoad %43 
                               f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                               f32_3 %293 = OpFMul %290 %292 
                               f32_4 %294 = OpLoad %9 
                               f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                               f32_3 %296 = OpFAdd %293 %295 
                               f32_4 %297 = OpLoad %9 
                               f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                              OpStore %9 %298 
                        Private f32* %301 = OpAccessChain %34 %38 
                                 f32 %302 = OpLoad %301 
                         Output f32* %304 = OpAccessChain %300 %38 
                                              OpStore %304 %302 
                               f32_4 %305 = OpLoad %9 
                               f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                               f32_3 %308 = OpExtInst %1 40 %306 %307 
                               f32_4 %309 = OpLoad %9 
                               f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                              OpStore %9 %310 
                               f32_4 %311 = OpLoad %9 
                               f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                               f32_3 %313 = OpExtInst %1 30 %312 
                               f32_4 %314 = OpLoad %9 
                               f32_4 %315 = OpVectorShuffle %314 %313 4 5 6 3 
                                              OpStore %9 %315 
                               f32_4 %316 = OpLoad %9 
                               f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                               f32_3 %320 = OpFMul %317 %319 
                               f32_4 %321 = OpLoad %9 
                               f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                              OpStore %9 %322 
                               f32_4 %323 = OpLoad %9 
                               f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                               f32_3 %325 = OpExtInst %1 29 %324 
                               f32_4 %326 = OpLoad %9 
                               f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
                                              OpStore %9 %327 
                               f32_4 %328 = OpLoad %9 
                               f32_3 %329 = OpVectorShuffle %328 %328 0 1 2 
                               f32_3 %332 = OpFMul %329 %331 
                               f32_3 %335 = OpFAdd %332 %334 
                               f32_4 %336 = OpLoad %9 
                               f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                              OpStore %9 %337 
                               f32_4 %338 = OpLoad %9 
                               f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                               f32_3 %340 = OpExtInst %1 40 %339 %307 
                               f32_4 %341 = OpLoad %300 
                               f32_4 %342 = OpVectorShuffle %341 %340 4 5 6 3 
                                              OpStore %300 %342 
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
}
}