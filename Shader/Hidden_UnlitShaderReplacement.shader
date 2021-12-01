//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UnlitShaderReplacement" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_Cutoff ("Mask Clip Value", Float) = 0.5
_EmissionMap ("Emission", 2D) = "white" { }
_EmissionColor ("Color", Color) = (0,0,0,1)
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 59656
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
uniform 	vec4 _Color;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat3 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat3<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
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
; Bound: 74
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpMemberDecorate %26 1 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %50 Location 50 
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
                                     %26 = OpTypeStruct %7 %6 
                                     %27 = OpTypePointer Uniform %26 
       Uniform struct {f32_4; f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Private %6 
                        Private f32* %38 = OpVariable Private 
                                     %39 = OpTypeInt 32 0 
                                 u32 %40 = OpConstant 3 
                                 i32 %43 = OpConstant 1 
                                     %44 = OpTypePointer Uniform %6 
                                     %49 = OpTypePointer Output %7 
                       Output f32_4* %50 = OpVariable Output 
                                     %51 = OpTypeVector %6 3 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %64 = OpConstant -1 
                                 f32 %70 = OpConstant 3.674022E-40 
                                     %71 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFMul %25 %33 
                               f32_4 %35 = OpLoad %9 
                               f32_4 %36 = OpFAdd %34 %35 
                                             OpStore %9 %36 
                        Private f32* %41 = OpAccessChain %9 %40 
                                 f32 %42 = OpLoad %41 
                        Uniform f32* %45 = OpAccessChain %28 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                                 f32 %48 = OpFAdd %42 %47 
                                             OpStore %38 %48 
                               f32_4 %52 = OpLoad %9 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               f32_4 %54 = OpLoad %50 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %50 %55 
                                 f32 %59 = OpLoad %38 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %63 = OpSelect %62 %43 %30 
                                 i32 %65 = OpIMul %63 %64 
                                bool %66 = OpINotEqual %65 %30 
                                             OpSelectionMerge %68 None 
                                             OpBranchConditional %66 %67 %68 
                                     %67 = OpLabel 
                                             OpKill
                                     %68 = OpLabel 
                         Output f32* %72 = OpAccessChain %50 %40 
                                             OpStore %72 %70 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_EMISSION" }
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
uniform 	vec4 _Color;
uniform 	vec4 _EmissionColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissionMap;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * _EmissionColor + u_xlat0;
    u_xlat6 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat6<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "_EMISSION" }
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
; Bound: 89
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %65 
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
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %65 Location 65 
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
                                     %26 = OpTypeStruct %7 %7 %6 
                                     %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %7 
                      Private f32_4* %37 = OpVariable Private 
UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
            UniformConstant sampler* %40 = OpVariable UniformConstant 
                                 i32 %46 = OpConstant 1 
                                     %52 = OpTypePointer Private %6 
                        Private f32* %53 = OpVariable Private 
                                     %54 = OpTypeInt 32 0 
                                 u32 %55 = OpConstant 3 
                                 i32 %58 = OpConstant 2 
                                     %59 = OpTypePointer Uniform %6 
                                     %64 = OpTypePointer Output %7 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %71 = OpTypeBool 
                                     %72 = OpTypePointer Private %71 
                       Private bool* %73 = OpVariable Private 
                                 f32 %75 = OpConstant 3.674022E-40 
                                 i32 %79 = OpConstant -1 
                                 f32 %85 = OpConstant 3.674022E-40 
                                     %86 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFMul %25 %33 
                               f32_4 %35 = OpLoad %9 
                               f32_4 %36 = OpFAdd %34 %35 
                                             OpStore %9 %36 
                 read_only Texture2D %39 = OpLoad %38 
                             sampler %41 = OpLoad %40 
          read_only Texture2DSampled %42 = OpSampledImage %39 %41 
                               f32_2 %43 = OpLoad vs_TEXCOORD0 
                               f32_4 %44 = OpImageSampleImplicitLod %42 %43 
                                             OpStore %37 %44 
                               f32_4 %45 = OpLoad %37 
                      Uniform f32_4* %47 = OpAccessChain %28 %46 
                               f32_4 %48 = OpLoad %47 
                               f32_4 %49 = OpFMul %45 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_4 %51 = OpFAdd %49 %50 
                                             OpStore %9 %51 
                        Private f32* %56 = OpAccessChain %9 %55 
                                 f32 %57 = OpLoad %56 
                        Uniform f32* %60 = OpAccessChain %28 %58 
                                 f32 %61 = OpLoad %60 
                                 f32 %62 = OpFNegate %61 
                                 f32 %63 = OpFAdd %57 %62 
                                             OpStore %53 %63 
                               f32_4 %67 = OpLoad %9 
                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               f32_4 %69 = OpLoad %65 
                               f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                             OpStore %65 %70 
                                 f32 %74 = OpLoad %53 
                                bool %76 = OpFOrdLessThan %74 %75 
                                             OpStore %73 %76 
                                bool %77 = OpLoad %73 
                                 i32 %78 = OpSelect %77 %46 %30 
                                 i32 %80 = OpIMul %78 %79 
                                bool %81 = OpINotEqual %80 %30 
                                             OpSelectionMerge %83 None 
                                             OpBranchConditional %81 %82 %83 
                                     %82 = OpLabel 
                                             OpKill
                                     %83 = OpLabel 
                         Output f32* %87 = OpAccessChain %65 %55 
                                             OpStore %87 %85 
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat3 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlatb3 = u_xlat3<0.0;
    if(((int(u_xlatb3) * int(0xffffffffu)))!=0){discard;}
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat3) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
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
                                             OpEntryPoint Fragment %4 "main" %22 %75 %81 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpMemberDecorate %26 1 Offset 26 
                                             OpMemberDecorate %26 2 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate vs_TEXCOORD1 Location 75 
                                             OpDecorate %81 Location 81 
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
                                     %26 = OpTypeStruct %7 %7 %6 
                                     %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 1 
                                     %31 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Private %6 
                        Private f32* %38 = OpVariable Private 
                                     %39 = OpTypeInt 32 0 
                                 u32 %40 = OpConstant 3 
                                 i32 %43 = OpConstant 2 
                                     %44 = OpTypePointer Uniform %6 
                                     %49 = OpTypeVector %6 3 
                                 i32 %52 = OpConstant 0 
                                     %60 = OpTypeBool 
                                     %61 = OpTypePointer Private %60 
                       Private bool* %62 = OpVariable Private 
                                 f32 %64 = OpConstant 3.674022E-40 
                                 i32 %68 = OpConstant -1 
                                     %74 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %78 = OpConstant 3.674022E-40 
                                     %80 = OpTypePointer Output %7 
                       Output f32_4* %81 = OpVariable Output 
                                     %93 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFMul %25 %33 
                               f32_4 %35 = OpLoad %9 
                               f32_4 %36 = OpFAdd %34 %35 
                                             OpStore %9 %36 
                        Private f32* %41 = OpAccessChain %9 %40 
                                 f32 %42 = OpLoad %41 
                        Uniform f32* %45 = OpAccessChain %28 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                                 f32 %48 = OpFAdd %42 %47 
                                             OpStore %38 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                      Uniform f32_4* %53 = OpAccessChain %28 %52 
                               f32_4 %54 = OpLoad %53 
                               f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                               f32_3 %56 = OpFNegate %55 
                               f32_3 %57 = OpFAdd %51 %56 
                               f32_4 %58 = OpLoad %9 
                               f32_4 %59 = OpVectorShuffle %58 %57 4 5 6 3 
                                             OpStore %9 %59 
                                 f32 %63 = OpLoad %38 
                                bool %65 = OpFOrdLessThan %63 %64 
                                             OpStore %62 %65 
                                bool %66 = OpLoad %62 
                                 i32 %67 = OpSelect %66 %30 %52 
                                 i32 %69 = OpIMul %67 %68 
                                bool %70 = OpINotEqual %69 %52 
                                             OpSelectionMerge %72 None 
                                             OpBranchConditional %70 %71 %72 
                                     %71 = OpLabel 
                                             OpKill
                                     %72 = OpLabel 
                                 f32 %76 = OpLoad vs_TEXCOORD1 
                                             OpStore %38 %76 
                                 f32 %77 = OpLoad %38 
                                 f32 %79 = OpExtInst %1 43 %77 %64 %78 
                                             OpStore %38 %79 
                                 f32 %82 = OpLoad %38 
                               f32_3 %83 = OpCompositeConstruct %82 %82 %82 
                               f32_4 %84 = OpLoad %9 
                               f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               f32_3 %86 = OpFMul %83 %85 
                      Uniform f32_4* %87 = OpAccessChain %28 %52 
                               f32_4 %88 = OpLoad %87 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_3 %90 = OpFAdd %86 %89 
                               f32_4 %91 = OpLoad %81 
                               f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                             OpStore %81 %92 
                         Output f32* %94 = OpAccessChain %81 %40 
                                             OpStore %94 %78 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_EMISSION" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
uniform 	vec4 _EmissionColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissionMap;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * _EmissionColor + u_xlat0;
    u_xlat6 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlatb6 = u_xlat6<0.0;
    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_EMISSION" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
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
                                                    OpEntryPoint Fragment %4 "main" %22 %90 %96 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %40 DescriptorSet 40 
                                                    OpDecorate %40 Binding 40 
                                                    OpDecorate vs_TEXCOORD1 Location 90 
                                                    OpDecorate %96 Location 96 
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
                                            %26 = OpTypeStruct %7 %7 %7 %6 
                                            %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32_4; f32;}* %28 = OpVariable Uniform 
                                            %29 = OpTypeInt 32 1 
                                        i32 %30 = OpConstant 1 
                                            %31 = OpTypePointer Uniform %7 
                             Private f32_4* %37 = OpVariable Private 
       UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                   UniformConstant sampler* %40 = OpVariable UniformConstant 
                                        i32 %46 = OpConstant 2 
                                            %52 = OpTypePointer Private %6 
                               Private f32* %53 = OpVariable Private 
                                            %54 = OpTypeInt 32 0 
                                        u32 %55 = OpConstant 3 
                                        i32 %58 = OpConstant 3 
                                            %59 = OpTypePointer Uniform %6 
                                            %64 = OpTypeVector %6 3 
                                        i32 %67 = OpConstant 0 
                                            %75 = OpTypeBool 
                                            %76 = OpTypePointer Private %75 
                              Private bool* %77 = OpVariable Private 
                                        f32 %79 = OpConstant 3.674022E-40 
                                        i32 %83 = OpConstant -1 
                                            %89 = OpTypePointer Input %6 
                        Input f32* vs_TEXCOORD1 = OpVariable Input 
                                        f32 %93 = OpConstant 3.674022E-40 
                                            %95 = OpTypePointer Output %7 
                              Output f32_4* %96 = OpVariable Output 
                                           %108 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                        read_only Texture2D %13 = OpLoad %12 
                                    sampler %17 = OpLoad %16 
                 read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                      f32_2 %23 = OpLoad vs_TEXCOORD0 
                                      f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                    OpStore %9 %24 
                                      f32_4 %25 = OpLoad %9 
                             Uniform f32_4* %32 = OpAccessChain %28 %30 
                                      f32_4 %33 = OpLoad %32 
                                      f32_4 %34 = OpFMul %25 %33 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpFAdd %34 %35 
                                                    OpStore %9 %36 
                        read_only Texture2D %39 = OpLoad %38 
                                    sampler %41 = OpLoad %40 
                 read_only Texture2DSampled %42 = OpSampledImage %39 %41 
                                      f32_2 %43 = OpLoad vs_TEXCOORD0 
                                      f32_4 %44 = OpImageSampleImplicitLod %42 %43 
                                                    OpStore %37 %44 
                                      f32_4 %45 = OpLoad %37 
                             Uniform f32_4* %47 = OpAccessChain %28 %46 
                                      f32_4 %48 = OpLoad %47 
                                      f32_4 %49 = OpFMul %45 %48 
                                      f32_4 %50 = OpLoad %9 
                                      f32_4 %51 = OpFAdd %49 %50 
                                                    OpStore %9 %51 
                               Private f32* %56 = OpAccessChain %9 %55 
                                        f32 %57 = OpLoad %56 
                               Uniform f32* %60 = OpAccessChain %28 %58 
                                        f32 %61 = OpLoad %60 
                                        f32 %62 = OpFNegate %61 
                                        f32 %63 = OpFAdd %57 %62 
                                                    OpStore %53 %63 
                                      f32_4 %65 = OpLoad %9 
                                      f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                             Uniform f32_4* %68 = OpAccessChain %28 %67 
                                      f32_4 %69 = OpLoad %68 
                                      f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                      f32_3 %71 = OpFNegate %70 
                                      f32_3 %72 = OpFAdd %66 %71 
                                      f32_4 %73 = OpLoad %9 
                                      f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                                    OpStore %9 %74 
                                        f32 %78 = OpLoad %53 
                                       bool %80 = OpFOrdLessThan %78 %79 
                                                    OpStore %77 %80 
                                       bool %81 = OpLoad %77 
                                        i32 %82 = OpSelect %81 %30 %67 
                                        i32 %84 = OpIMul %82 %83 
                                       bool %85 = OpINotEqual %84 %67 
                                                    OpSelectionMerge %87 None 
                                                    OpBranchConditional %85 %86 %87 
                                            %86 = OpLabel 
                                                    OpKill
                                            %87 = OpLabel 
                                        f32 %91 = OpLoad vs_TEXCOORD1 
                                                    OpStore %53 %91 
                                        f32 %92 = OpLoad %53 
                                        f32 %94 = OpExtInst %1 43 %92 %79 %93 
                                                    OpStore %53 %94 
                                        f32 %97 = OpLoad %53 
                                      f32_3 %98 = OpCompositeConstruct %97 %97 %97 
                                      f32_4 %99 = OpLoad %9 
                                     f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                     f32_3 %101 = OpFMul %98 %100 
                            Uniform f32_4* %102 = OpAccessChain %28 %67 
                                     f32_4 %103 = OpLoad %102 
                                     f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                     f32_3 %105 = OpFAdd %101 %104 
                                     f32_4 %106 = OpLoad %96 
                                     f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                    OpStore %96 %107 
                               Output f32* %109 = OpAccessChain %96 %55 
                                                    OpStore %109 %93 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "_DARKMODE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_DARKMODE" }
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
uniform 	vec4 _Color;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w * _Color.w + u_xlat0.w;
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "_DARKMODE" }
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
; Bound: 65
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %29 0 Offset 29 
                                             OpMemberDecorate %29 1 Offset 29 
                                             OpDecorate %29 Block 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %61 Location 61 
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
                                     %29 = OpTypeStruct %23 %6 
                                     %30 = OpTypePointer Uniform %29 
       Uniform struct {f32_4; f32;}* %31 = OpVariable Uniform 
                                     %32 = OpTypeInt 32 1 
                                 i32 %33 = OpConstant 0 
                                     %34 = OpTypePointer Uniform %6 
                                 i32 %41 = OpConstant 1 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %54 = OpConstant -1 
                                     %60 = OpTypePointer Output %23 
                       Output f32_4* %61 = OpVariable Output 
                                 f32 %62 = OpConstant 3.674022E-40 
                               f32_4 %63 = OpConstantComposite %50 %50 %50 %62 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %28 = OpLoad %8 
                        Uniform f32* %35 = OpAccessChain %31 %33 %26 
                                 f32 %36 = OpLoad %35 
                                 f32 %37 = OpFMul %28 %36 
                                 f32 %38 = OpLoad %8 
                                 f32 %39 = OpFAdd %37 %38 
                                             OpStore %8 %39 
                                 f32 %40 = OpLoad %8 
                        Uniform f32* %42 = OpAccessChain %31 %41 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %40 %44 
                                             OpStore %8 %45 
                                 f32 %49 = OpLoad %8 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %53 = OpSelect %52 %41 %33 
                                 i32 %55 = OpIMul %53 %54 
                                bool %56 = OpINotEqual %55 %33 
                                             OpSelectionMerge %58 None 
                                             OpBranchConditional %56 %57 %58 
                                     %57 = OpLabel 
                                             OpKill
                                     %58 = OpLabel 
                                             OpStore %61 %63 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "_DARKMODE" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_DARKMODE" "_EMISSION" }
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
uniform 	vec4 _Color;
uniform 	vec4 _EmissionColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissionMap;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.w = u_xlat0.w * _Color.w + u_xlat0.w;
    u_xlat1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0 = u_xlat1 * _EmissionColor + u_xlat0;
    u_xlat6 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat6<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "_DARKMODE" "_EMISSION" }
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
; Bound: 100
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %77 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpMemberDecorate %33 1 Offset 33 
                                             OpMemberDecorate %33 2 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %47 DescriptorSet 47 
                                             OpDecorate %47 Binding 47 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate %77 Location 77 
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
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %33 = OpTypeStruct %7 %7 %6 
                                     %34 = OpTypePointer Uniform %33 
Uniform struct {f32_4; f32_4; f32;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %6 
                      Private f32_4* %46 = OpVariable Private 
UniformConstant read_only Texture2D* %47 = OpVariable UniformConstant 
            UniformConstant sampler* %49 = OpVariable UniformConstant 
                                 f32 %54 = OpConstant 3.674022E-40 
                                 u32 %56 = OpConstant 1 
                                 u32 %58 = OpConstant 2 
                                 i32 %61 = OpConstant 1 
                                     %62 = OpTypePointer Uniform %7 
                        Private f32* %68 = OpVariable Private 
                                 i32 %71 = OpConstant 2 
                                     %76 = OpTypePointer Output %7 
                       Output f32_4* %77 = OpVariable Output 
                                     %78 = OpTypeVector %6 3 
                                     %83 = OpTypeBool 
                                     %84 = OpTypePointer Private %83 
                       Private bool* %85 = OpVariable Private 
                                 i32 %90 = OpConstant -1 
                                 f32 %96 = OpConstant 3.674022E-40 
                                     %97 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                 f32 %27 = OpCompositeExtract %24 3 
                        Private f32* %30 = OpAccessChain %9 %28 
                                             OpStore %30 %27 
                        Private f32* %31 = OpAccessChain %9 %28 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 %26 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFMul %32 %40 
                        Private f32* %42 = OpAccessChain %9 %28 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFAdd %41 %43 
                        Private f32* %45 = OpAccessChain %9 %26 
                                             OpStore %45 %44 
                 read_only Texture2D %48 = OpLoad %47 
                             sampler %50 = OpLoad %49 
          read_only Texture2DSampled %51 = OpSampledImage %48 %50 
                               f32_2 %52 = OpLoad vs_TEXCOORD0 
                               f32_4 %53 = OpImageSampleImplicitLod %51 %52 
                                             OpStore %46 %53 
                        Private f32* %55 = OpAccessChain %9 %28 
                                             OpStore %55 %54 
                        Private f32* %57 = OpAccessChain %9 %56 
                                             OpStore %57 %54 
                        Private f32* %59 = OpAccessChain %9 %58 
                                             OpStore %59 %54 
                               f32_4 %60 = OpLoad %46 
                      Uniform f32_4* %63 = OpAccessChain %35 %61 
                               f32_4 %64 = OpLoad %63 
                               f32_4 %65 = OpFMul %60 %64 
                               f32_4 %66 = OpLoad %9 
                               f32_4 %67 = OpFAdd %65 %66 
                                             OpStore %9 %67 
                        Private f32* %69 = OpAccessChain %9 %26 
                                 f32 %70 = OpLoad %69 
                        Uniform f32* %72 = OpAccessChain %35 %71 
                                 f32 %73 = OpLoad %72 
                                 f32 %74 = OpFNegate %73 
                                 f32 %75 = OpFAdd %70 %74 
                                             OpStore %68 %75 
                               f32_4 %79 = OpLoad %9 
                               f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                               f32_4 %81 = OpLoad %77 
                               f32_4 %82 = OpVectorShuffle %81 %80 4 5 6 3 
                                             OpStore %77 %82 
                                 f32 %86 = OpLoad %68 
                                bool %87 = OpFOrdLessThan %86 %54 
                                             OpStore %85 %87 
                                bool %88 = OpLoad %85 
                                 i32 %89 = OpSelect %88 %61 %37 
                                 i32 %91 = OpIMul %89 %90 
                                bool %92 = OpINotEqual %91 %37 
                                             OpSelectionMerge %94 None 
                                             OpBranchConditional %92 %93 %94 
                                     %93 = OpLabel 
                                             OpKill
                                     %94 = OpLabel 
                         Output f32* %98 = OpAccessChain %77 %26 
                                             OpStore %98 %96 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "_DARKMODE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_DARKMODE" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.w * _Color.w + u_xlat0.w;
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = vs_TEXCOORD1;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xxx * (-unity_FogColor.xyz) + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_DARKMODE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 87
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %62 %68 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %29 0 Offset 29 
                                             OpMemberDecorate %29 1 Offset 29 
                                             OpMemberDecorate %29 2 Offset 29 
                                             OpDecorate %29 Block 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate vs_TEXCOORD1 Location 62 
                                             OpDecorate %68 Location 68 
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
                                     %29 = OpTypeStruct %23 %23 %6 
                                     %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32;}* %31 = OpVariable Uniform 
                                     %32 = OpTypeInt 32 1 
                                 i32 %33 = OpConstant 1 
                                     %34 = OpTypePointer Uniform %6 
                                 i32 %41 = OpConstant 2 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 0 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %65 = OpConstant 3.674022E-40 
                                     %67 = OpTypePointer Output %23 
                       Output f32_4* %68 = OpVariable Output 
                                     %70 = OpTypeVector %6 3 
                                     %72 = OpTypePointer Uniform %23 
                                     %84 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %28 = OpLoad %8 
                        Uniform f32* %35 = OpAccessChain %31 %33 %26 
                                 f32 %36 = OpLoad %35 
                                 f32 %37 = OpFMul %28 %36 
                                 f32 %38 = OpLoad %8 
                                 f32 %39 = OpFAdd %37 %38 
                                             OpStore %8 %39 
                                 f32 %40 = OpLoad %8 
                        Uniform f32* %42 = OpAccessChain %31 %41 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %40 %44 
                                             OpStore %8 %45 
                                 f32 %49 = OpLoad %8 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %33 %53 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %53 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                                 f32 %63 = OpLoad vs_TEXCOORD1 
                                             OpStore %8 %63 
                                 f32 %64 = OpLoad %8 
                                 f32 %66 = OpExtInst %1 43 %64 %50 %65 
                                             OpStore %8 %66 
                                 f32 %69 = OpLoad %8 
                               f32_3 %71 = OpCompositeConstruct %69 %69 %69 
                      Uniform f32_4* %73 = OpAccessChain %31 %53 
                               f32_4 %74 = OpLoad %73 
                               f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                               f32_3 %76 = OpFNegate %75 
                               f32_3 %77 = OpFMul %71 %76 
                      Uniform f32_4* %78 = OpAccessChain %31 %53 
                               f32_4 %79 = OpLoad %78 
                               f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                               f32_3 %81 = OpFAdd %77 %80 
                               f32_4 %82 = OpLoad %68 
                               f32_4 %83 = OpVectorShuffle %82 %81 4 5 6 3 
                                             OpStore %68 %83 
                         Output f32* %85 = OpAccessChain %68 %26 
                                             OpStore %85 %65 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "_DARKMODE" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_DARKMODE" "_EMISSION" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
uniform 	vec4 _EmissionColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissionMap;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.w = u_xlat0.w * _Color.w + u_xlat0.w;
    u_xlat1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0 = u_xlat1 * _EmissionColor + u_xlat0;
    u_xlat6 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlatb6 = u_xlat6<0.0;
    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_DARKMODE" "_EMISSION" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
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
                                                    OpEntryPoint Fragment %4 "main" %22 %101 %107 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %16 DescriptorSet 16 
                                                    OpDecorate %16 Binding 16 
                                                    OpDecorate vs_TEXCOORD0 Location 22 
                                                    OpMemberDecorate %33 0 Offset 33 
                                                    OpMemberDecorate %33 1 Offset 33 
                                                    OpMemberDecorate %33 2 Offset 33 
                                                    OpMemberDecorate %33 3 Offset 33 
                                                    OpDecorate %33 Block 
                                                    OpDecorate %35 DescriptorSet 35 
                                                    OpDecorate %35 Binding 35 
                                                    OpDecorate %47 DescriptorSet 47 
                                                    OpDecorate %47 Binding 47 
                                                    OpDecorate %49 DescriptorSet 49 
                                                    OpDecorate %49 Binding 49 
                                                    OpDecorate vs_TEXCOORD1 Location 101 
                                                    OpDecorate %107 Location 107 
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
                                            %25 = OpTypeInt 32 0 
                                        u32 %26 = OpConstant 3 
                                        u32 %28 = OpConstant 0 
                                            %29 = OpTypePointer Private %6 
                                            %33 = OpTypeStruct %7 %7 %7 %6 
                                            %34 = OpTypePointer Uniform %33 
Uniform struct {f32_4; f32_4; f32_4; f32;}* %35 = OpVariable Uniform 
                                            %36 = OpTypeInt 32 1 
                                        i32 %37 = OpConstant 1 
                                            %38 = OpTypePointer Uniform %6 
                             Private f32_4* %46 = OpVariable Private 
       UniformConstant read_only Texture2D* %47 = OpVariable UniformConstant 
                   UniformConstant sampler* %49 = OpVariable UniformConstant 
                                        f32 %54 = OpConstant 3.674022E-40 
                                        u32 %56 = OpConstant 1 
                                        u32 %58 = OpConstant 2 
                                        i32 %61 = OpConstant 2 
                                            %62 = OpTypePointer Uniform %7 
                               Private f32* %68 = OpVariable Private 
                                        i32 %71 = OpConstant 3 
                                            %76 = OpTypeVector %6 3 
                                        i32 %79 = OpConstant 0 
                                            %87 = OpTypeBool 
                                            %88 = OpTypePointer Private %87 
                              Private bool* %89 = OpVariable Private 
                                        i32 %94 = OpConstant -1 
                                           %100 = OpTypePointer Input %6 
                        Input f32* vs_TEXCOORD1 = OpVariable Input 
                                       f32 %104 = OpConstant 3.674022E-40 
                                           %106 = OpTypePointer Output %7 
                             Output f32_4* %107 = OpVariable Output 
                                           %119 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                        read_only Texture2D %13 = OpLoad %12 
                                    sampler %17 = OpLoad %16 
                 read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                      f32_2 %23 = OpLoad vs_TEXCOORD0 
                                      f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                        f32 %27 = OpCompositeExtract %24 3 
                               Private f32* %30 = OpAccessChain %9 %28 
                                                    OpStore %30 %27 
                               Private f32* %31 = OpAccessChain %9 %28 
                                        f32 %32 = OpLoad %31 
                               Uniform f32* %39 = OpAccessChain %35 %37 %26 
                                        f32 %40 = OpLoad %39 
                                        f32 %41 = OpFMul %32 %40 
                               Private f32* %42 = OpAccessChain %9 %28 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpFAdd %41 %43 
                               Private f32* %45 = OpAccessChain %9 %26 
                                                    OpStore %45 %44 
                        read_only Texture2D %48 = OpLoad %47 
                                    sampler %50 = OpLoad %49 
                 read_only Texture2DSampled %51 = OpSampledImage %48 %50 
                                      f32_2 %52 = OpLoad vs_TEXCOORD0 
                                      f32_4 %53 = OpImageSampleImplicitLod %51 %52 
                                                    OpStore %46 %53 
                               Private f32* %55 = OpAccessChain %9 %28 
                                                    OpStore %55 %54 
                               Private f32* %57 = OpAccessChain %9 %56 
                                                    OpStore %57 %54 
                               Private f32* %59 = OpAccessChain %9 %58 
                                                    OpStore %59 %54 
                                      f32_4 %60 = OpLoad %46 
                             Uniform f32_4* %63 = OpAccessChain %35 %61 
                                      f32_4 %64 = OpLoad %63 
                                      f32_4 %65 = OpFMul %60 %64 
                                      f32_4 %66 = OpLoad %9 
                                      f32_4 %67 = OpFAdd %65 %66 
                                                    OpStore %9 %67 
                               Private f32* %69 = OpAccessChain %9 %26 
                                        f32 %70 = OpLoad %69 
                               Uniform f32* %72 = OpAccessChain %35 %71 
                                        f32 %73 = OpLoad %72 
                                        f32 %74 = OpFNegate %73 
                                        f32 %75 = OpFAdd %70 %74 
                                                    OpStore %68 %75 
                                      f32_4 %77 = OpLoad %9 
                                      f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                             Uniform f32_4* %80 = OpAccessChain %35 %79 
                                      f32_4 %81 = OpLoad %80 
                                      f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                      f32_3 %83 = OpFNegate %82 
                                      f32_3 %84 = OpFAdd %78 %83 
                                      f32_4 %85 = OpLoad %9 
                                      f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                    OpStore %9 %86 
                                        f32 %90 = OpLoad %68 
                                       bool %91 = OpFOrdLessThan %90 %54 
                                                    OpStore %89 %91 
                                       bool %92 = OpLoad %89 
                                        i32 %93 = OpSelect %92 %37 %79 
                                        i32 %95 = OpIMul %93 %94 
                                       bool %96 = OpINotEqual %95 %79 
                                                    OpSelectionMerge %98 None 
                                                    OpBranchConditional %96 %97 %98 
                                            %97 = OpLabel 
                                                    OpKill
                                            %98 = OpLabel 
                                       f32 %102 = OpLoad vs_TEXCOORD1 
                                                    OpStore %68 %102 
                                       f32 %103 = OpLoad %68 
                                       f32 %105 = OpExtInst %1 43 %103 %54 %104 
                                                    OpStore %68 %105 
                                       f32 %108 = OpLoad %68 
                                     f32_3 %109 = OpCompositeConstruct %108 %108 %108 
                                     f32_4 %110 = OpLoad %9 
                                     f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                     f32_3 %112 = OpFMul %109 %111 
                            Uniform f32_4* %113 = OpAccessChain %35 %79 
                                     f32_4 %114 = OpLoad %113 
                                     f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                     f32_3 %116 = OpFAdd %112 %115 
                                     f32_4 %117 = OpLoad %107 
                                     f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                    OpStore %107 %118 
                               Output f32* %120 = OpAccessChain %107 %26 
                                                    OpStore %120 %104 
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
Keywords { "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_EMISSION" }
""
}
SubProgram "vulkan " {
Keywords { "_EMISSION" }
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
Keywords { "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_EMISSION" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_EMISSION" }
""
}
SubProgram "d3d11 " {
Keywords { "_DARKMODE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_DARKMODE" }
""
}
SubProgram "vulkan " {
Keywords { "_DARKMODE" }
""
}
SubProgram "d3d11 " {
Keywords { "_DARKMODE" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_DARKMODE" "_EMISSION" }
""
}
SubProgram "vulkan " {
Keywords { "_DARKMODE" "_EMISSION" }
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "_DARKMODE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_DARKMODE" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_DARKMODE" }
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "_DARKMODE" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_DARKMODE" "_EMISSION" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_DARKMODE" "_EMISSION" }
""
}
}
}
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "AlphaTest+0" "RenderType" = "TransparentCutout" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "AlphaTest+0" "RenderType" = "TransparentCutout" }
  GpuProgramID 70483
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
uniform 	vec4 _Color;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat3 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat3<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
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
; Bound: 74
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpMemberDecorate %26 1 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %50 Location 50 
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
                                     %26 = OpTypeStruct %7 %6 
                                     %27 = OpTypePointer Uniform %26 
       Uniform struct {f32_4; f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Private %6 
                        Private f32* %38 = OpVariable Private 
                                     %39 = OpTypeInt 32 0 
                                 u32 %40 = OpConstant 3 
                                 i32 %43 = OpConstant 1 
                                     %44 = OpTypePointer Uniform %6 
                                     %49 = OpTypePointer Output %7 
                       Output f32_4* %50 = OpVariable Output 
                                     %51 = OpTypeVector %6 3 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %64 = OpConstant -1 
                                 f32 %70 = OpConstant 3.674022E-40 
                                     %71 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFMul %25 %33 
                               f32_4 %35 = OpLoad %9 
                               f32_4 %36 = OpFAdd %34 %35 
                                             OpStore %9 %36 
                        Private f32* %41 = OpAccessChain %9 %40 
                                 f32 %42 = OpLoad %41 
                        Uniform f32* %45 = OpAccessChain %28 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                                 f32 %48 = OpFAdd %42 %47 
                                             OpStore %38 %48 
                               f32_4 %52 = OpLoad %9 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               f32_4 %54 = OpLoad %50 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %50 %55 
                                 f32 %59 = OpLoad %38 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %63 = OpSelect %62 %43 %30 
                                 i32 %65 = OpIMul %63 %64 
                                bool %66 = OpINotEqual %65 %30 
                                             OpSelectionMerge %68 None 
                                             OpBranchConditional %66 %67 %68 
                                     %67 = OpLabel 
                                             OpKill
                                     %68 = OpLabel 
                         Output f32* %72 = OpAccessChain %50 %40 
                                             OpStore %72 %70 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_EMISSION" }
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
uniform 	vec4 _Color;
uniform 	vec4 _EmissionColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissionMap;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * _EmissionColor + u_xlat0;
    u_xlat6 = u_xlat0.w + (-_Cutoff);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat6<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "_EMISSION" }
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
; Bound: 89
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %65 
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
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %65 Location 65 
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
                                     %26 = OpTypeStruct %7 %7 %6 
                                     %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %7 
                      Private f32_4* %37 = OpVariable Private 
UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
            UniformConstant sampler* %40 = OpVariable UniformConstant 
                                 i32 %46 = OpConstant 1 
                                     %52 = OpTypePointer Private %6 
                        Private f32* %53 = OpVariable Private 
                                     %54 = OpTypeInt 32 0 
                                 u32 %55 = OpConstant 3 
                                 i32 %58 = OpConstant 2 
                                     %59 = OpTypePointer Uniform %6 
                                     %64 = OpTypePointer Output %7 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %71 = OpTypeBool 
                                     %72 = OpTypePointer Private %71 
                       Private bool* %73 = OpVariable Private 
                                 f32 %75 = OpConstant 3.674022E-40 
                                 i32 %79 = OpConstant -1 
                                 f32 %85 = OpConstant 3.674022E-40 
                                     %86 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFMul %25 %33 
                               f32_4 %35 = OpLoad %9 
                               f32_4 %36 = OpFAdd %34 %35 
                                             OpStore %9 %36 
                 read_only Texture2D %39 = OpLoad %38 
                             sampler %41 = OpLoad %40 
          read_only Texture2DSampled %42 = OpSampledImage %39 %41 
                               f32_2 %43 = OpLoad vs_TEXCOORD0 
                               f32_4 %44 = OpImageSampleImplicitLod %42 %43 
                                             OpStore %37 %44 
                               f32_4 %45 = OpLoad %37 
                      Uniform f32_4* %47 = OpAccessChain %28 %46 
                               f32_4 %48 = OpLoad %47 
                               f32_4 %49 = OpFMul %45 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_4 %51 = OpFAdd %49 %50 
                                             OpStore %9 %51 
                        Private f32* %56 = OpAccessChain %9 %55 
                                 f32 %57 = OpLoad %56 
                        Uniform f32* %60 = OpAccessChain %28 %58 
                                 f32 %61 = OpLoad %60 
                                 f32 %62 = OpFNegate %61 
                                 f32 %63 = OpFAdd %57 %62 
                                             OpStore %53 %63 
                               f32_4 %67 = OpLoad %9 
                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               f32_4 %69 = OpLoad %65 
                               f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                             OpStore %65 %70 
                                 f32 %74 = OpLoad %53 
                                bool %76 = OpFOrdLessThan %74 %75 
                                             OpStore %73 %76 
                                bool %77 = OpLoad %73 
                                 i32 %78 = OpSelect %77 %46 %30 
                                 i32 %80 = OpIMul %78 %79 
                                bool %81 = OpINotEqual %80 %30 
                                             OpSelectionMerge %83 None 
                                             OpBranchConditional %81 %82 %83 
                                     %82 = OpLabel 
                                             OpKill
                                     %83 = OpLabel 
                         Output f32* %87 = OpAccessChain %65 %55 
                                             OpStore %87 %85 
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat3 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlatb3 = u_xlat3<0.0;
    if(((int(u_xlatb3) * int(0xffffffffu)))!=0){discard;}
    u_xlat3 = vs_TEXCOORD1;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat3) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
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
                                             OpEntryPoint Fragment %4 "main" %22 %75 %81 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpMemberDecorate %26 1 Offset 26 
                                             OpMemberDecorate %26 2 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate vs_TEXCOORD1 Location 75 
                                             OpDecorate %81 Location 81 
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
                                     %26 = OpTypeStruct %7 %7 %6 
                                     %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 1 
                                     %31 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Private %6 
                        Private f32* %38 = OpVariable Private 
                                     %39 = OpTypeInt 32 0 
                                 u32 %40 = OpConstant 3 
                                 i32 %43 = OpConstant 2 
                                     %44 = OpTypePointer Uniform %6 
                                     %49 = OpTypeVector %6 3 
                                 i32 %52 = OpConstant 0 
                                     %60 = OpTypeBool 
                                     %61 = OpTypePointer Private %60 
                       Private bool* %62 = OpVariable Private 
                                 f32 %64 = OpConstant 3.674022E-40 
                                 i32 %68 = OpConstant -1 
                                     %74 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %78 = OpConstant 3.674022E-40 
                                     %80 = OpTypePointer Output %7 
                       Output f32_4* %81 = OpVariable Output 
                                     %93 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFMul %25 %33 
                               f32_4 %35 = OpLoad %9 
                               f32_4 %36 = OpFAdd %34 %35 
                                             OpStore %9 %36 
                        Private f32* %41 = OpAccessChain %9 %40 
                                 f32 %42 = OpLoad %41 
                        Uniform f32* %45 = OpAccessChain %28 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                                 f32 %48 = OpFAdd %42 %47 
                                             OpStore %38 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                      Uniform f32_4* %53 = OpAccessChain %28 %52 
                               f32_4 %54 = OpLoad %53 
                               f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                               f32_3 %56 = OpFNegate %55 
                               f32_3 %57 = OpFAdd %51 %56 
                               f32_4 %58 = OpLoad %9 
                               f32_4 %59 = OpVectorShuffle %58 %57 4 5 6 3 
                                             OpStore %9 %59 
                                 f32 %63 = OpLoad %38 
                                bool %65 = OpFOrdLessThan %63 %64 
                                             OpStore %62 %65 
                                bool %66 = OpLoad %62 
                                 i32 %67 = OpSelect %66 %30 %52 
                                 i32 %69 = OpIMul %67 %68 
                                bool %70 = OpINotEqual %69 %52 
                                             OpSelectionMerge %72 None 
                                             OpBranchConditional %70 %71 %72 
                                     %71 = OpLabel 
                                             OpKill
                                     %72 = OpLabel 
                                 f32 %76 = OpLoad vs_TEXCOORD1 
                                             OpStore %38 %76 
                                 f32 %77 = OpLoad %38 
                                 f32 %79 = OpExtInst %1 43 %77 %64 %78 
                                             OpStore %38 %79 
                                 f32 %82 = OpLoad %38 
                               f32_3 %83 = OpCompositeConstruct %82 %82 %82 
                               f32_4 %84 = OpLoad %9 
                               f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               f32_3 %86 = OpFMul %83 %85 
                      Uniform f32_4* %87 = OpAccessChain %28 %52 
                               f32_4 %88 = OpLoad %87 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_3 %90 = OpFAdd %86 %89 
                               f32_4 %91 = OpLoad %81 
                               f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                             OpStore %81 %92 
                         Output f32* %94 = OpAccessChain %81 %40 
                                             OpStore %94 %78 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_EMISSION" }
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
uniform 	vec4 _EmissionColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissionMap;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * _Color + u_xlat0;
    u_xlat1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * _EmissionColor + u_xlat0;
    u_xlat6 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlatb6 = u_xlat6<0.0;
    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_EMISSION" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
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
                                                    OpEntryPoint Fragment %4 "main" %22 %90 %96 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %40 DescriptorSet 40 
                                                    OpDecorate %40 Binding 40 
                                                    OpDecorate vs_TEXCOORD1 Location 90 
                                                    OpDecorate %96 Location 96 
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
                                            %26 = OpTypeStruct %7 %7 %7 %6 
                                            %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32_4; f32;}* %28 = OpVariable Uniform 
                                            %29 = OpTypeInt 32 1 
                                        i32 %30 = OpConstant 1 
                                            %31 = OpTypePointer Uniform %7 
                             Private f32_4* %37 = OpVariable Private 
       UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                   UniformConstant sampler* %40 = OpVariable UniformConstant 
                                        i32 %46 = OpConstant 2 
                                            %52 = OpTypePointer Private %6 
                               Private f32* %53 = OpVariable Private 
                                            %54 = OpTypeInt 32 0 
                                        u32 %55 = OpConstant 3 
                                        i32 %58 = OpConstant 3 
                                            %59 = OpTypePointer Uniform %6 
                                            %64 = OpTypeVector %6 3 
                                        i32 %67 = OpConstant 0 
                                            %75 = OpTypeBool 
                                            %76 = OpTypePointer Private %75 
                              Private bool* %77 = OpVariable Private 
                                        f32 %79 = OpConstant 3.674022E-40 
                                        i32 %83 = OpConstant -1 
                                            %89 = OpTypePointer Input %6 
                        Input f32* vs_TEXCOORD1 = OpVariable Input 
                                        f32 %93 = OpConstant 3.674022E-40 
                                            %95 = OpTypePointer Output %7 
                              Output f32_4* %96 = OpVariable Output 
                                           %108 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                        read_only Texture2D %13 = OpLoad %12 
                                    sampler %17 = OpLoad %16 
                 read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                      f32_2 %23 = OpLoad vs_TEXCOORD0 
                                      f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                    OpStore %9 %24 
                                      f32_4 %25 = OpLoad %9 
                             Uniform f32_4* %32 = OpAccessChain %28 %30 
                                      f32_4 %33 = OpLoad %32 
                                      f32_4 %34 = OpFMul %25 %33 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpFAdd %34 %35 
                                                    OpStore %9 %36 
                        read_only Texture2D %39 = OpLoad %38 
                                    sampler %41 = OpLoad %40 
                 read_only Texture2DSampled %42 = OpSampledImage %39 %41 
                                      f32_2 %43 = OpLoad vs_TEXCOORD0 
                                      f32_4 %44 = OpImageSampleImplicitLod %42 %43 
                                                    OpStore %37 %44 
                                      f32_4 %45 = OpLoad %37 
                             Uniform f32_4* %47 = OpAccessChain %28 %46 
                                      f32_4 %48 = OpLoad %47 
                                      f32_4 %49 = OpFMul %45 %48 
                                      f32_4 %50 = OpLoad %9 
                                      f32_4 %51 = OpFAdd %49 %50 
                                                    OpStore %9 %51 
                               Private f32* %56 = OpAccessChain %9 %55 
                                        f32 %57 = OpLoad %56 
                               Uniform f32* %60 = OpAccessChain %28 %58 
                                        f32 %61 = OpLoad %60 
                                        f32 %62 = OpFNegate %61 
                                        f32 %63 = OpFAdd %57 %62 
                                                    OpStore %53 %63 
                                      f32_4 %65 = OpLoad %9 
                                      f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                             Uniform f32_4* %68 = OpAccessChain %28 %67 
                                      f32_4 %69 = OpLoad %68 
                                      f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                      f32_3 %71 = OpFNegate %70 
                                      f32_3 %72 = OpFAdd %66 %71 
                                      f32_4 %73 = OpLoad %9 
                                      f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                                    OpStore %9 %74 
                                        f32 %78 = OpLoad %53 
                                       bool %80 = OpFOrdLessThan %78 %79 
                                                    OpStore %77 %80 
                                       bool %81 = OpLoad %77 
                                        i32 %82 = OpSelect %81 %30 %67 
                                        i32 %84 = OpIMul %82 %83 
                                       bool %85 = OpINotEqual %84 %67 
                                                    OpSelectionMerge %87 None 
                                                    OpBranchConditional %85 %86 %87 
                                            %86 = OpLabel 
                                                    OpKill
                                            %87 = OpLabel 
                                        f32 %91 = OpLoad vs_TEXCOORD1 
                                                    OpStore %53 %91 
                                        f32 %92 = OpLoad %53 
                                        f32 %94 = OpExtInst %1 43 %92 %79 %93 
                                                    OpStore %53 %94 
                                        f32 %97 = OpLoad %53 
                                      f32_3 %98 = OpCompositeConstruct %97 %97 %97 
                                      f32_4 %99 = OpLoad %9 
                                     f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                     f32_3 %101 = OpFMul %98 %100 
                            Uniform f32_4* %102 = OpAccessChain %28 %67 
                                     f32_4 %103 = OpLoad %102 
                                     f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                     f32_3 %105 = OpFAdd %101 %104 
                                     f32_4 %106 = OpLoad %96 
                                     f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                    OpStore %96 %107 
                               Output f32* %109 = OpAccessChain %96 %55 
                                                    OpStore %109 %93 
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
Keywords { "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "_EMISSION" }
""
}
SubProgram "vulkan " {
Keywords { "_EMISSION" }
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
Keywords { "FOG_LINEAR" "_EMISSION" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "_EMISSION" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "_EMISSION" }
""
}
}
}
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 169582
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat0 * _Color;
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
; Bound: 38
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %26 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 Location 26 
                                             OpMemberDecorate %28 0 Offset 28 
                                             OpDecorate %28 Block 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
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
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                     %28 = OpTypeStruct %7 
                                     %29 = OpTypePointer Uniform %28 
            Uniform struct {f32_4;}* %30 = OpVariable Uniform 
                                     %31 = OpTypeInt 32 1 
                                 i32 %32 = OpConstant 0 
                                     %33 = OpTypePointer Uniform %7 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                      Uniform f32_4* %34 = OpAccessChain %30 %32 
                               f32_4 %35 = OpLoad %34 
                               f32_4 %36 = OpFMul %27 %35 
                                             OpStore %26 %36 
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
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
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.xyz * _Color.xyz + (-unity_FogColor.xyz);
    u_xlat1.x = u_xlat1.w * _Color.w;
    SV_Target0.w = u_xlat1.x;
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat2.xyz + unity_FogColor.xyz;
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
; Bound: 141
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %111 %123 %125 
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
                                                      OpDecorate vs_TEXCOORD0 Location 123 
                                                      OpDecorate %125 Location 125 
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
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %124 = OpTypePointer Input %121 
                                Input f32_2* %125 = OpVariable Input 
                                         i32 %127 = OpConstant 4 
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
                                       f32_2 %126 = OpLoad %125 
                              Uniform f32_4* %128 = OpAccessChain %20 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %20 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore vs_TEXCOORD0 %135 
                                 Output f32* %136 = OpAccessChain %79 %27 %75 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                 Output f32* %139 = OpAccessChain %79 %27 %75 
                                                      OpStore %139 %138 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 82
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %10 %31 %66 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 10 
                                             OpDecorate %21 DescriptorSet 21 
                                             OpDecorate %21 Binding 21 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate vs_TEXCOORD0 Location 31 
                                             OpMemberDecorate %39 0 Offset 39 
                                             OpMemberDecorate %39 1 Offset 39 
                                             OpDecorate %39 Block 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate %66 Location 66 
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
                                     %19 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %20 = OpTypePointer UniformConstant %19 
UniformConstant read_only Texture2D* %21 = OpVariable UniformConstant 
                                     %23 = OpTypeSampler 
                                     %24 = OpTypePointer UniformConstant %23 
            UniformConstant sampler* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampledImage %19 
                                     %29 = OpTypeVector %6 2 
                                     %30 = OpTypePointer Input %29 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %34 = OpTypeVector %6 3 
                                     %35 = OpTypePointer Private %34 
                      Private f32_3* %36 = OpVariable Private 
                                     %39 = OpTypeStruct %16 %16 
                                     %40 = OpTypePointer Uniform %39 
     Uniform struct {f32_4; f32_4;}* %41 = OpVariable Uniform 
                                     %42 = OpTypeInt 32 1 
                                 i32 %43 = OpConstant 1 
                                     %44 = OpTypePointer Uniform %16 
                                 i32 %49 = OpConstant 0 
                                     %55 = OpTypeInt 32 0 
                                 u32 %56 = OpConstant 3 
                                     %59 = OpTypePointer Uniform %6 
                                 u32 %63 = OpConstant 0 
                                     %65 = OpTypePointer Output %16 
                       Output f32_4* %66 = OpVariable Output 
                                     %69 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                                 f32 %11 = OpLoad vs_TEXCOORD1 
                                             OpStore %8 %11 
                                 f32 %12 = OpLoad %8 
                                 f32 %15 = OpExtInst %1 43 %12 %13 %14 
                                             OpStore %8 %15 
                 read_only Texture2D %22 = OpLoad %21 
                             sampler %26 = OpLoad %25 
          read_only Texture2DSampled %28 = OpSampledImage %22 %26 
                               f32_2 %32 = OpLoad vs_TEXCOORD0 
                               f32_4 %33 = OpImageSampleImplicitLod %28 %32 
                                             OpStore %18 %33 
                               f32_4 %37 = OpLoad %18 
                               f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                      Uniform f32_4* %45 = OpAccessChain %41 %43 
                               f32_4 %46 = OpLoad %45 
                               f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                               f32_3 %48 = OpFMul %38 %47 
                      Uniform f32_4* %50 = OpAccessChain %41 %49 
                               f32_4 %51 = OpLoad %50 
                               f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                               f32_3 %53 = OpFNegate %52 
                               f32_3 %54 = OpFAdd %48 %53 
                                             OpStore %36 %54 
                        Private f32* %57 = OpAccessChain %18 %56 
                                 f32 %58 = OpLoad %57 
                        Uniform f32* %60 = OpAccessChain %41 %43 %56 
                                 f32 %61 = OpLoad %60 
                                 f32 %62 = OpFMul %58 %61 
                        Private f32* %64 = OpAccessChain %18 %63 
                                             OpStore %64 %62 
                        Private f32* %67 = OpAccessChain %18 %63 
                                 f32 %68 = OpLoad %67 
                         Output f32* %70 = OpAccessChain %66 %56 
                                             OpStore %70 %68 
                                 f32 %71 = OpLoad %8 
                               f32_3 %72 = OpCompositeConstruct %71 %71 %71 
                               f32_3 %73 = OpLoad %36 
                               f32_3 %74 = OpFMul %72 %73 
                      Uniform f32_4* %75 = OpAccessChain %41 %49 
                               f32_4 %76 = OpLoad %75 
                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                               f32_3 %78 = OpFAdd %74 %77 
                               f32_4 %79 = OpLoad %66 
                               f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                             OpStore %66 %80 
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
Fallback "VertexLit"
}