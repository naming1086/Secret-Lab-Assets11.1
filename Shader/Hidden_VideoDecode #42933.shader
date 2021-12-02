//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/VideoDecode" {
Properties {
_MainTex ("_MainTex (A)", 2D) = "black" { }
_SecondTex ("_SecondTex (A)", 2D) = "black" { }
_ThirdTex ("_ThirdTex (A)", 2D) = "black" { }
}
SubShader {
 Pass {
  Name "YCbCr_To_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 41610
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
UNITY_LOCATION(2) uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat0 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat0.xy = u_xlat0.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat0.x);
    u_xlat3 = u_xlat1.w * 1.15625 + u_xlat0.y;
    SV_Target0.z = u_xlat3 + -1.06861997;
    u_xlat2 = texture(_ThirdTex, vs_TEXCOORD0.xy);
    u_xlat0.x = (-u_xlat2.w) * 0.8125 + u_xlat0.x;
    u_xlat3 = u_xlat2.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
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
; Bound: 104
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %9 %29 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 Location 9 
                                             OpDecorate %20 DescriptorSet 20 
                                             OpDecorate %20 Binding 20 
                                             OpDecorate %24 DescriptorSet 24 
                                             OpDecorate %24 Binding 24 
                                             OpDecorate vs_TEXCOORD0 Location 29 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %73 DescriptorSet 73 
                                             OpDecorate %73 Binding 73 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Output %7 
                        Output f32_4* %9 = OpVariable Output 
                                 f32 %10 = OpConstant 3.674022E-40 
                                     %11 = OpTypeInt 32 0 
                                 u32 %12 = OpConstant 3 
                                     %13 = OpTypePointer Output %6 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Private %15 
                      Private f32_2* %17 = OpVariable Private 
                                     %18 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %19 = OpTypePointer UniformConstant %18 
UniformConstant read_only Texture2D* %20 = OpVariable UniformConstant 
                                     %22 = OpTypeSampler 
                                     %23 = OpTypePointer UniformConstant %22 
            UniformConstant sampler* %24 = OpVariable UniformConstant 
                                     %26 = OpTypeSampledImage %18 
                                     %28 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 u32 %33 = OpConstant 0 
                                     %34 = OpTypePointer Private %6 
                                 f32 %38 = OpConstant 3.674022E-40 
                                 f32 %39 = OpConstant 3.674022E-40 
                               f32_2 %40 = OpConstantComposite %38 %39 
                        Private f32* %42 = OpVariable Private 
UniformConstant read_only Texture2D* %43 = OpVariable UniformConstant 
            UniformConstant sampler* %45 = OpVariable UniformConstant 
                                 f32 %52 = OpConstant 3.674022E-40 
                        Private f32* %59 = OpVariable Private 
                                 u32 %62 = OpConstant 1 
                                 f32 %67 = OpConstant 3.674022E-40 
                                 u32 %69 = OpConstant 2 
UniformConstant read_only Texture2D* %71 = OpVariable UniformConstant 
            UniformConstant sampler* %73 = OpVariable UniformConstant 
                                 f32 %81 = OpConstant 3.674022E-40 
                                 f32 %88 = OpConstant 3.674022E-40 
                                 f32 %97 = OpConstant 3.674022E-40 
                                 f32 %98 = OpConstant 3.674022E-40 
                               f32_2 %99 = OpConstantComposite %97 %98 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                         Output f32* %14 = OpAccessChain %9 %12 
                                             OpStore %14 %10 
                 read_only Texture2D %21 = OpLoad %20 
                             sampler %25 = OpLoad %24 
          read_only Texture2DSampled %27 = OpSampledImage %21 %25 
                               f32_2 %30 = OpLoad vs_TEXCOORD0 
                               f32_4 %31 = OpImageSampleImplicitLod %27 %30 
                                 f32 %32 = OpCompositeExtract %31 3 
                        Private f32* %35 = OpAccessChain %17 %33 
                                             OpStore %35 %32 
                               f32_2 %36 = OpLoad %17 
                               f32_2 %37 = OpVectorShuffle %36 %36 0 0 
                               f32_2 %41 = OpFMul %37 %40 
                                             OpStore %17 %41 
                 read_only Texture2D %44 = OpLoad %43 
                             sampler %46 = OpLoad %45 
          read_only Texture2DSampled %47 = OpSampledImage %44 %46 
                               f32_2 %48 = OpLoad vs_TEXCOORD0 
                               f32_4 %49 = OpImageSampleImplicitLod %47 %48 
                                 f32 %50 = OpCompositeExtract %49 3 
                                             OpStore %42 %50 
                                 f32 %51 = OpLoad %42 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %17 %33 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFNegate %55 
                                 f32 %57 = OpFAdd %53 %56 
                        Private f32* %58 = OpAccessChain %17 %33 
                                             OpStore %58 %57 
                                 f32 %60 = OpLoad %42 
                                 f32 %61 = OpFMul %60 %52 
                        Private f32* %63 = OpAccessChain %17 %62 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFAdd %61 %64 
                                             OpStore %59 %65 
                                 f32 %66 = OpLoad %59 
                                 f32 %68 = OpFAdd %66 %67 
                         Output f32* %70 = OpAccessChain %9 %69 
                                             OpStore %70 %68 
                 read_only Texture2D %72 = OpLoad %71 
                             sampler %74 = OpLoad %73 
          read_only Texture2DSampled %75 = OpSampledImage %72 %74 
                               f32_2 %76 = OpLoad vs_TEXCOORD0 
                               f32_4 %77 = OpImageSampleImplicitLod %75 %76 
                                 f32 %78 = OpCompositeExtract %77 3 
                                             OpStore %59 %78 
                                 f32 %79 = OpLoad %59 
                                 f32 %80 = OpFNegate %79 
                                 f32 %82 = OpFMul %80 %81 
                        Private f32* %83 = OpAccessChain %17 %33 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFAdd %82 %84 
                        Private f32* %86 = OpAccessChain %17 %33 
                                             OpStore %86 %85 
                                 f32 %87 = OpLoad %59 
                                 f32 %89 = OpFMul %87 %88 
                                             OpStore %59 %89 
                                 f32 %90 = OpLoad %42 
                                 f32 %91 = OpFMul %90 %52 
                                 f32 %92 = OpLoad %59 
                                 f32 %93 = OpFAdd %91 %92 
                        Private f32* %94 = OpAccessChain %17 %62 
                                             OpStore %94 %93 
                               f32_2 %95 = OpLoad %17 
                               f32_2 %96 = OpVectorShuffle %95 %95 1 0 
                              f32_2 %100 = OpFAdd %96 %99 
                              f32_4 %101 = OpLoad %9 
                              f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                             OpStore %9 %102 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
UNITY_LOCATION(2) uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat0.xy = u_xlat0.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat0.x);
    u_xlat3 = u_xlat1.w * 1.15625 + u_xlat0.y;
    u_xlat1.z = u_xlat3 + -1.06861997;
    u_xlat2 = texture(_ThirdTex, vs_TEXCOORD0.xy);
    u_xlat0.x = (-u_xlat2.w) * 0.8125 + u_xlat0.x;
    u_xlat3 = u_xlat2.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3;
    u_xlat1.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
; Bound: 126
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %116 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate %70 DescriptorSet 70 
                                             OpDecorate %70 Binding 70 
                                             OpDecorate %72 DescriptorSet 72 
                                             OpDecorate %72 Binding 72 
                                             OpDecorate %116 Location 116 
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
                                 u32 %27 = OpConstant 3 
                                 u32 %29 = OpConstant 0 
                                     %30 = OpTypePointer Private %6 
                                 f32 %34 = OpConstant 3.674022E-40 
                                 f32 %35 = OpConstant 3.674022E-40 
                               f32_2 %36 = OpConstantComposite %34 %35 
                        Private f32* %40 = OpVariable Private 
UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
            UniformConstant sampler* %43 = OpVariable UniformConstant 
                                 f32 %50 = OpConstant 3.674022E-40 
                        Private f32* %57 = OpVariable Private 
                                 u32 %60 = OpConstant 1 
                      Private f32_3* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 u32 %68 = OpConstant 2 
UniformConstant read_only Texture2D* %70 = OpVariable UniformConstant 
            UniformConstant sampler* %72 = OpVariable UniformConstant 
                                 f32 %80 = OpConstant 3.674022E-40 
                                 f32 %87 = OpConstant 3.674022E-40 
                                 f32 %96 = OpConstant 3.674022E-40 
                                 f32 %97 = OpConstant 3.674022E-40 
                               f32_2 %98 = OpConstantComposite %96 %97 
                                f32 %103 = OpConstant 3.674022E-40 
                              f32_3 %104 = OpConstantComposite %103 %103 %103 
                                f32 %106 = OpConstant 3.674022E-40 
                              f32_3 %107 = OpConstantComposite %106 %106 %106 
                                f32 %112 = OpConstant 3.674022E-40 
                              f32_3 %113 = OpConstantComposite %112 %112 %112 
                                    %115 = OpTypePointer Output %24 
                      Output f32_4* %116 = OpVariable Output 
                                f32 %122 = OpConstant 3.674022E-40 
                                    %123 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                 f32 %28 = OpCompositeExtract %25 3 
                        Private f32* %31 = OpAccessChain %9 %29 
                                             OpStore %31 %28 
                               f32_3 %32 = OpLoad %9 
                               f32_2 %33 = OpVectorShuffle %32 %32 0 0 
                               f32_2 %37 = OpFMul %33 %36 
                               f32_3 %38 = OpLoad %9 
                               f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
                                             OpStore %9 %39 
                 read_only Texture2D %42 = OpLoad %41 
                             sampler %44 = OpLoad %43 
          read_only Texture2DSampled %45 = OpSampledImage %42 %44 
                               f32_2 %46 = OpLoad vs_TEXCOORD0 
                               f32_4 %47 = OpImageSampleImplicitLod %45 %46 
                                 f32 %48 = OpCompositeExtract %47 3 
                                             OpStore %40 %48 
                                 f32 %49 = OpLoad %40 
                                 f32 %51 = OpFMul %49 %50 
                        Private f32* %52 = OpAccessChain %9 %29 
                                 f32 %53 = OpLoad %52 
                                 f32 %54 = OpFNegate %53 
                                 f32 %55 = OpFAdd %51 %54 
                        Private f32* %56 = OpAccessChain %9 %29 
                                             OpStore %56 %55 
                                 f32 %58 = OpLoad %40 
                                 f32 %59 = OpFMul %58 %50 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFAdd %59 %62 
                                             OpStore %57 %63 
                                 f32 %65 = OpLoad %57 
                                 f32 %67 = OpFAdd %65 %66 
                        Private f32* %69 = OpAccessChain %64 %68 
                                             OpStore %69 %67 
                 read_only Texture2D %71 = OpLoad %70 
                             sampler %73 = OpLoad %72 
          read_only Texture2DSampled %74 = OpSampledImage %71 %73 
                               f32_2 %75 = OpLoad vs_TEXCOORD0 
                               f32_4 %76 = OpImageSampleImplicitLod %74 %75 
                                 f32 %77 = OpCompositeExtract %76 3 
                                             OpStore %57 %77 
                                 f32 %78 = OpLoad %57 
                                 f32 %79 = OpFNegate %78 
                                 f32 %81 = OpFMul %79 %80 
                        Private f32* %82 = OpAccessChain %9 %29 
                                 f32 %83 = OpLoad %82 
                                 f32 %84 = OpFAdd %81 %83 
                        Private f32* %85 = OpAccessChain %9 %29 
                                             OpStore %85 %84 
                                 f32 %86 = OpLoad %57 
                                 f32 %88 = OpFMul %86 %87 
                                             OpStore %57 %88 
                                 f32 %89 = OpLoad %40 
                                 f32 %90 = OpFMul %89 %50 
                                 f32 %91 = OpLoad %57 
                                 f32 %92 = OpFAdd %90 %91 
                        Private f32* %93 = OpAccessChain %9 %60 
                                             OpStore %93 %92 
                               f32_3 %94 = OpLoad %9 
                               f32_2 %95 = OpVectorShuffle %94 %94 1 0 
                               f32_2 %99 = OpFAdd %95 %98 
                              f32_3 %100 = OpLoad %64 
                              f32_3 %101 = OpVectorShuffle %100 %99 3 4 2 
                                             OpStore %64 %101 
                              f32_3 %102 = OpLoad %64 
                              f32_3 %105 = OpFMul %102 %104 
                              f32_3 %108 = OpFAdd %105 %107 
                                             OpStore %9 %108 
                              f32_3 %109 = OpLoad %64 
                              f32_3 %110 = OpLoad %9 
                              f32_3 %111 = OpFMul %109 %110 
                              f32_3 %114 = OpFAdd %111 %113 
                                             OpStore %9 %114 
                              f32_3 %117 = OpLoad %9 
                              f32_3 %118 = OpLoad %64 
                              f32_3 %119 = OpFMul %117 %118 
                              f32_4 %120 = OpLoad %116 
                              f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                             OpStore %116 %121 
                        Output f32* %124 = OpAccessChain %116 %27 
                                             OpStore %124 %122 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "YCbCrA_To_RGBAFull"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 114063
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
UNITY_LOCATION(2) uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.w = u_xlat0.w;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_SecondTex, u_xlat0.xy);
    u_xlat6.xy = u_xlat1.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = texture(_ThirdTex, u_xlat0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat6.x);
    u_xlat3 = u_xlat1.w * 1.15625 + u_xlat6.y;
    SV_Target0.z = u_xlat3 + -1.06861997;
    u_xlat0.x = (-u_xlat2.w) * 0.8125 + u_xlat0.x;
    u_xlat3 = u_xlat2.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
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
; Bound: 133
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %44 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %55 DescriptorSet 55 
                                             OpDecorate %55 Binding 55 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpDecorate %79 DescriptorSet 79 
                                             OpDecorate %79 Binding 79 
                                             OpDecorate %81 DescriptorSet 81 
                                             OpDecorate %81 Binding 81 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                 f32 %18 = OpConstant 3.674022E-40 
                               f32_2 %19 = OpConstantComposite %14 %18 
                                     %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampler 
                                     %28 = OpTypePointer UniformConstant %27 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %31 = OpTypeSampledImage %23 
                                     %35 = OpTypeVector %6 4 
                                     %37 = OpTypeInt 32 0 
                                 u32 %38 = OpConstant 3 
                                 u32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Private %6 
                                     %43 = OpTypePointer Output %35 
                       Output f32_4* %44 = OpVariable Output 
                                     %47 = OpTypePointer Output %6 
                                     %53 = OpTypePointer Private %10 
                      Private f32_2* %54 = OpVariable Private 
UniformConstant read_only Texture2D* %55 = OpVariable UniformConstant 
            UniformConstant sampler* %57 = OpVariable UniformConstant 
                                 f32 %67 = OpConstant 3.674022E-40 
                                 f32 %68 = OpConstant 3.674022E-40 
                               f32_2 %69 = OpConstantComposite %67 %68 
                        Private f32* %71 = OpVariable Private 
UniformConstant read_only Texture2D* %79 = OpVariable UniformConstant 
            UniformConstant sampler* %81 = OpVariable UniformConstant 
                        Private f32* %89 = OpVariable Private 
                                 f32 %91 = OpConstant 3.674022E-40 
                                 u32 %99 = OpConstant 1 
                                u32 %103 = OpConstant 2 
                                f32 %108 = OpConstant 3.674022E-40 
                                f32 %115 = OpConstant 3.674022E-40 
                                f32 %125 = OpConstant 3.674022E-40 
                                f32 %126 = OpConstant 3.674022E-40 
                                f32 %127 = OpConstant 3.674022E-40 
                              f32_3 %128 = OpConstantComposite %125 %126 %127 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_2 %20 = OpFAdd %17 %19 
                               f32_3 %21 = OpLoad %9 
                               f32_3 %22 = OpVectorShuffle %21 %20 3 4 2 
                                             OpStore %9 %22 
                 read_only Texture2D %26 = OpLoad %25 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %32 = OpSampledImage %26 %30 
                               f32_3 %33 = OpLoad %9 
                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               f32_4 %36 = OpImageSampleImplicitLod %32 %34 
                                 f32 %39 = OpCompositeExtract %36 3 
                        Private f32* %42 = OpAccessChain %9 %40 
                                             OpStore %42 %39 
                        Private f32* %45 = OpAccessChain %9 %40 
                                 f32 %46 = OpLoad %45 
                         Output f32* %48 = OpAccessChain %44 %38 
                                             OpStore %48 %46 
                               f32_2 %49 = OpLoad vs_TEXCOORD0 
                               f32_2 %50 = OpFMul %49 %16 
                               f32_3 %51 = OpLoad %9 
                               f32_3 %52 = OpVectorShuffle %51 %50 3 4 2 
                                             OpStore %9 %52 
                 read_only Texture2D %56 = OpLoad %55 
                             sampler %58 = OpLoad %57 
          read_only Texture2DSampled %59 = OpSampledImage %56 %58 
                               f32_3 %60 = OpLoad %9 
                               f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                               f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                 f32 %63 = OpCompositeExtract %62 3 
                        Private f32* %64 = OpAccessChain %54 %40 
                                             OpStore %64 %63 
                               f32_2 %65 = OpLoad %54 
                               f32_2 %66 = OpVectorShuffle %65 %65 0 0 
                               f32_2 %70 = OpFMul %66 %69 
                                             OpStore %54 %70 
                 read_only Texture2D %72 = OpLoad %25 
                             sampler %73 = OpLoad %29 
          read_only Texture2DSampled %74 = OpSampledImage %72 %73 
                               f32_3 %75 = OpLoad %9 
                               f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                               f32_4 %77 = OpImageSampleImplicitLod %74 %76 
                                 f32 %78 = OpCompositeExtract %77 3 
                                             OpStore %71 %78 
                 read_only Texture2D %80 = OpLoad %79 
                             sampler %82 = OpLoad %81 
          read_only Texture2DSampled %83 = OpSampledImage %80 %82 
                               f32_3 %84 = OpLoad %9 
                               f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                               f32_4 %86 = OpImageSampleImplicitLod %83 %85 
                                 f32 %87 = OpCompositeExtract %86 3 
                        Private f32* %88 = OpAccessChain %9 %40 
                                             OpStore %88 %87 
                                 f32 %90 = OpLoad %71 
                                 f32 %92 = OpFMul %90 %91 
                        Private f32* %93 = OpAccessChain %54 %40 
                                 f32 %94 = OpLoad %93 
                                 f32 %95 = OpFNegate %94 
                                 f32 %96 = OpFAdd %92 %95 
                                             OpStore %89 %96 
                                 f32 %97 = OpLoad %71 
                                 f32 %98 = OpFMul %97 %91 
                       Private f32* %100 = OpAccessChain %54 %99 
                                f32 %101 = OpLoad %100 
                                f32 %102 = OpFAdd %98 %101 
                       Private f32* %104 = OpAccessChain %9 %103 
                                             OpStore %104 %102 
                       Private f32* %105 = OpAccessChain %9 %40 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpFNegate %106 
                                f32 %109 = OpFMul %107 %108 
                                f32 %110 = OpLoad %89 
                                f32 %111 = OpFAdd %109 %110 
                       Private f32* %112 = OpAccessChain %9 %99 
                                             OpStore %112 %111 
                       Private f32* %113 = OpAccessChain %9 %40 
                                f32 %114 = OpLoad %113 
                                f32 %116 = OpFMul %114 %115 
                       Private f32* %117 = OpAccessChain %9 %40 
                                             OpStore %117 %116 
                                f32 %118 = OpLoad %71 
                                f32 %119 = OpFMul %118 %91 
                       Private f32* %120 = OpAccessChain %9 %40 
                                f32 %121 = OpLoad %120 
                                f32 %122 = OpFAdd %119 %121 
                       Private f32* %123 = OpAccessChain %9 %40 
                                             OpStore %123 %122 
                              f32_3 %124 = OpLoad %9 
                              f32_3 %129 = OpFAdd %124 %128 
                              f32_4 %130 = OpLoad %44 
                              f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                             OpStore %44 %131 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
UNITY_LOCATION(2) uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_SecondTex, u_xlat0.xy);
    u_xlat6.xy = u_xlat1.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = texture(_ThirdTex, u_xlat0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat6.x);
    u_xlat3 = u_xlat1.w * 1.15625 + u_xlat6.y;
    u_xlat1.z = u_xlat3 + -1.06861997;
    u_xlat0.x = (-u_xlat2.w) * 0.8125 + u_xlat0.x;
    u_xlat3 = u_xlat2.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3;
    u_xlat1.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
; Bound: 150
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %124 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %24 DescriptorSet 24 
                                             OpDecorate %24 Binding 24 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate %60 DescriptorSet 60 
                                             OpDecorate %60 Binding 60 
                                             OpDecorate %124 Location 124 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                     %20 = OpTypePointer Private %10 
                      Private f32_2* %21 = OpVariable Private 
                                     %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %23 = OpTypePointer UniformConstant %22 
UniformConstant read_only Texture2D* %24 = OpVariable UniformConstant 
                                     %26 = OpTypeSampler 
                                     %27 = OpTypePointer UniformConstant %26 
            UniformConstant sampler* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampledImage %22 
                                     %34 = OpTypeVector %6 4 
                                     %36 = OpTypeInt 32 0 
                                 u32 %37 = OpConstant 3 
                                 u32 %39 = OpConstant 0 
                                     %40 = OpTypePointer Private %6 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 f32 %45 = OpConstant 3.674022E-40 
                               f32_2 %46 = OpConstantComposite %44 %45 
                        Private f32* %48 = OpVariable Private 
UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
            UniformConstant sampler* %51 = OpVariable UniformConstant 
UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
            UniformConstant sampler* %60 = OpVariable UniformConstant 
                        Private f32* %68 = OpVariable Private 
                                 f32 %70 = OpConstant 3.674022E-40 
                                 u32 %78 = OpConstant 1 
                                 u32 %82 = OpConstant 2 
                                 f32 %87 = OpConstant 3.674022E-40 
                                 f32 %94 = OpConstant 3.674022E-40 
                     Private f32_3* %103 = OpVariable Private 
                                f32 %105 = OpConstant 3.674022E-40 
                                f32 %106 = OpConstant 3.674022E-40 
                                f32 %107 = OpConstant 3.674022E-40 
                              f32_3 %108 = OpConstantComposite %105 %106 %107 
                                f32 %111 = OpConstant 3.674022E-40 
                              f32_3 %112 = OpConstantComposite %111 %111 %111 
                                f32 %114 = OpConstant 3.674022E-40 
                              f32_3 %115 = OpConstantComposite %114 %114 %114 
                                f32 %120 = OpConstant 3.674022E-40 
                              f32_3 %121 = OpConstantComposite %120 %120 %120 
                                    %123 = OpTypePointer Output %34 
                      Output f32_4* %124 = OpVariable Output 
                                f32 %132 = OpConstant 3.674022E-40 
                              f32_2 %133 = OpConstantComposite %14 %132 
                                    %147 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_3 %18 = OpLoad %9 
                               f32_3 %19 = OpVectorShuffle %18 %17 3 4 2 
                                             OpStore %9 %19 
                 read_only Texture2D %25 = OpLoad %24 
                             sampler %29 = OpLoad %28 
          read_only Texture2DSampled %31 = OpSampledImage %25 %29 
                               f32_3 %32 = OpLoad %9 
                               f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                               f32_4 %35 = OpImageSampleImplicitLod %31 %33 
                                 f32 %38 = OpCompositeExtract %35 3 
                        Private f32* %41 = OpAccessChain %21 %39 
                                             OpStore %41 %38 
                               f32_2 %42 = OpLoad %21 
                               f32_2 %43 = OpVectorShuffle %42 %42 0 0 
                               f32_2 %47 = OpFMul %43 %46 
                                             OpStore %21 %47 
                 read_only Texture2D %50 = OpLoad %49 
                             sampler %52 = OpLoad %51 
          read_only Texture2DSampled %53 = OpSampledImage %50 %52 
                               f32_3 %54 = OpLoad %9 
                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                               f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                 f32 %57 = OpCompositeExtract %56 3 
                                             OpStore %48 %57 
                 read_only Texture2D %59 = OpLoad %58 
                             sampler %61 = OpLoad %60 
          read_only Texture2DSampled %62 = OpSampledImage %59 %61 
                               f32_3 %63 = OpLoad %9 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                               f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                 f32 %66 = OpCompositeExtract %65 3 
                        Private f32* %67 = OpAccessChain %9 %39 
                                             OpStore %67 %66 
                                 f32 %69 = OpLoad %48 
                                 f32 %71 = OpFMul %69 %70 
                        Private f32* %72 = OpAccessChain %21 %39 
                                 f32 %73 = OpLoad %72 
                                 f32 %74 = OpFNegate %73 
                                 f32 %75 = OpFAdd %71 %74 
                                             OpStore %68 %75 
                                 f32 %76 = OpLoad %48 
                                 f32 %77 = OpFMul %76 %70 
                        Private f32* %79 = OpAccessChain %21 %78 
                                 f32 %80 = OpLoad %79 
                                 f32 %81 = OpFAdd %77 %80 
                        Private f32* %83 = OpAccessChain %9 %82 
                                             OpStore %83 %81 
                        Private f32* %84 = OpAccessChain %9 %39 
                                 f32 %85 = OpLoad %84 
                                 f32 %86 = OpFNegate %85 
                                 f32 %88 = OpFMul %86 %87 
                                 f32 %89 = OpLoad %68 
                                 f32 %90 = OpFAdd %88 %89 
                        Private f32* %91 = OpAccessChain %9 %78 
                                             OpStore %91 %90 
                        Private f32* %92 = OpAccessChain %9 %39 
                                 f32 %93 = OpLoad %92 
                                 f32 %95 = OpFMul %93 %94 
                        Private f32* %96 = OpAccessChain %9 %39 
                                             OpStore %96 %95 
                                 f32 %97 = OpLoad %48 
                                 f32 %98 = OpFMul %97 %70 
                        Private f32* %99 = OpAccessChain %9 %39 
                                f32 %100 = OpLoad %99 
                                f32 %101 = OpFAdd %98 %100 
                       Private f32* %102 = OpAccessChain %9 %39 
                                             OpStore %102 %101 
                              f32_3 %104 = OpLoad %9 
                              f32_3 %109 = OpFAdd %104 %108 
                                             OpStore %103 %109 
                              f32_3 %110 = OpLoad %103 
                              f32_3 %113 = OpFMul %110 %112 
                              f32_3 %116 = OpFAdd %113 %115 
                                             OpStore %9 %116 
                              f32_3 %117 = OpLoad %103 
                              f32_3 %118 = OpLoad %9 
                              f32_3 %119 = OpFMul %117 %118 
                              f32_3 %122 = OpFAdd %119 %121 
                                             OpStore %9 %122 
                              f32_3 %125 = OpLoad %9 
                              f32_3 %126 = OpLoad %103 
                              f32_3 %127 = OpFMul %125 %126 
                              f32_4 %128 = OpLoad %124 
                              f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                             OpStore %124 %129 
                              f32_2 %130 = OpLoad vs_TEXCOORD0 
                              f32_2 %131 = OpFMul %130 %16 
                              f32_2 %134 = OpFAdd %131 %133 
                              f32_3 %135 = OpLoad %9 
                              f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
                                             OpStore %9 %136 
                read_only Texture2D %137 = OpLoad %49 
                            sampler %138 = OpLoad %51 
         read_only Texture2DSampled %139 = OpSampledImage %137 %138 
                              f32_3 %140 = OpLoad %9 
                              f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                              f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                f32 %143 = OpCompositeExtract %142 3 
                       Private f32* %144 = OpAccessChain %9 %39 
                                             OpStore %144 %143 
                       Private f32* %145 = OpAccessChain %9 %39 
                                f32 %146 = OpLoad %145 
                        Output f32* %148 = OpAccessChain %124 %37 
                                             OpStore %148 %146 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "YCbCrA_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 143641
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
UNITY_LOCATION(2) uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_SecondTex, u_xlat0.xy);
    u_xlat6.xy = u_xlat1.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = texture(_ThirdTex, u_xlat0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat6.x);
    u_xlat3 = u_xlat1.w * 1.15625 + u_xlat6.y;
    SV_Target0.z = u_xlat3 + -1.06861997;
    u_xlat0.x = (-u_xlat2.w) * 0.8125 + u_xlat0.x;
    u_xlat3 = u_xlat2.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
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
; Bound: 139
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %49 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %49 Location 49 
                                             OpDecorate %62 DescriptorSet 62 
                                             OpDecorate %62 Binding 62 
                                             OpDecorate %64 DescriptorSet 64 
                                             OpDecorate %64 Binding 64 
                                             OpDecorate %86 DescriptorSet 86 
                                             OpDecorate %86 Binding 86 
                                             OpDecorate %88 DescriptorSet 88 
                                             OpDecorate %88 Binding 88 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                 f32 %18 = OpConstant 3.674022E-40 
                               f32_2 %19 = OpConstantComposite %14 %18 
                                     %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampler 
                                     %28 = OpTypePointer UniformConstant %27 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %31 = OpTypeSampledImage %23 
                                     %35 = OpTypeVector %6 4 
                                     %37 = OpTypeInt 32 0 
                                 u32 %38 = OpConstant 3 
                                 u32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Private %6 
                                 f32 %45 = OpConstant 3.674022E-40 
                                     %48 = OpTypePointer Output %35 
                       Output f32_4* %49 = OpVariable Output 
                                 f32 %52 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Output %6 
                                     %60 = OpTypePointer Private %10 
                      Private f32_2* %61 = OpVariable Private 
UniformConstant read_only Texture2D* %62 = OpVariable UniformConstant 
            UniformConstant sampler* %64 = OpVariable UniformConstant 
                                 f32 %74 = OpConstant 3.674022E-40 
                                 f32 %75 = OpConstant 3.674022E-40 
                               f32_2 %76 = OpConstantComposite %74 %75 
                        Private f32* %78 = OpVariable Private 
UniformConstant read_only Texture2D* %86 = OpVariable UniformConstant 
            UniformConstant sampler* %88 = OpVariable UniformConstant 
                        Private f32* %96 = OpVariable Private 
                                u32 %105 = OpConstant 1 
                                u32 %109 = OpConstant 2 
                                f32 %114 = OpConstant 3.674022E-40 
                                f32 %121 = OpConstant 3.674022E-40 
                                f32 %131 = OpConstant 3.674022E-40 
                                f32 %132 = OpConstant 3.674022E-40 
                                f32 %133 = OpConstant 3.674022E-40 
                              f32_3 %134 = OpConstantComposite %131 %132 %133 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_2 %20 = OpFAdd %17 %19 
                               f32_3 %21 = OpLoad %9 
                               f32_3 %22 = OpVectorShuffle %21 %20 3 4 2 
                                             OpStore %9 %22 
                 read_only Texture2D %26 = OpLoad %25 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %32 = OpSampledImage %26 %30 
                               f32_3 %33 = OpLoad %9 
                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               f32_4 %36 = OpImageSampleImplicitLod %32 %34 
                                 f32 %39 = OpCompositeExtract %36 3 
                        Private f32* %42 = OpAccessChain %9 %40 
                                             OpStore %42 %39 
                        Private f32* %43 = OpAccessChain %9 %40 
                                 f32 %44 = OpLoad %43 
                                 f32 %46 = OpFAdd %44 %45 
                        Private f32* %47 = OpAccessChain %9 %40 
                                             OpStore %47 %46 
                        Private f32* %50 = OpAccessChain %9 %40 
                                 f32 %51 = OpLoad %50 
                                 f32 %53 = OpFMul %51 %52 
                         Output f32* %55 = OpAccessChain %49 %38 
                                             OpStore %55 %53 
                               f32_2 %56 = OpLoad vs_TEXCOORD0 
                               f32_2 %57 = OpFMul %56 %16 
                               f32_3 %58 = OpLoad %9 
                               f32_3 %59 = OpVectorShuffle %58 %57 3 4 2 
                                             OpStore %9 %59 
                 read_only Texture2D %63 = OpLoad %62 
                             sampler %65 = OpLoad %64 
          read_only Texture2DSampled %66 = OpSampledImage %63 %65 
                               f32_3 %67 = OpLoad %9 
                               f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                               f32_4 %69 = OpImageSampleImplicitLod %66 %68 
                                 f32 %70 = OpCompositeExtract %69 3 
                        Private f32* %71 = OpAccessChain %61 %40 
                                             OpStore %71 %70 
                               f32_2 %72 = OpLoad %61 
                               f32_2 %73 = OpVectorShuffle %72 %72 0 0 
                               f32_2 %77 = OpFMul %73 %76 
                                             OpStore %61 %77 
                 read_only Texture2D %79 = OpLoad %25 
                             sampler %80 = OpLoad %29 
          read_only Texture2DSampled %81 = OpSampledImage %79 %80 
                               f32_3 %82 = OpLoad %9 
                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                               f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                 f32 %85 = OpCompositeExtract %84 3 
                                             OpStore %78 %85 
                 read_only Texture2D %87 = OpLoad %86 
                             sampler %89 = OpLoad %88 
          read_only Texture2DSampled %90 = OpSampledImage %87 %89 
                               f32_3 %91 = OpLoad %9 
                               f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                               f32_4 %93 = OpImageSampleImplicitLod %90 %92 
                                 f32 %94 = OpCompositeExtract %93 3 
                        Private f32* %95 = OpAccessChain %9 %40 
                                             OpStore %95 %94 
                                 f32 %97 = OpLoad %78 
                                 f32 %98 = OpFMul %97 %52 
                        Private f32* %99 = OpAccessChain %61 %40 
                                f32 %100 = OpLoad %99 
                                f32 %101 = OpFNegate %100 
                                f32 %102 = OpFAdd %98 %101 
                                             OpStore %96 %102 
                                f32 %103 = OpLoad %78 
                                f32 %104 = OpFMul %103 %52 
                       Private f32* %106 = OpAccessChain %61 %105 
                                f32 %107 = OpLoad %106 
                                f32 %108 = OpFAdd %104 %107 
                       Private f32* %110 = OpAccessChain %9 %109 
                                             OpStore %110 %108 
                       Private f32* %111 = OpAccessChain %9 %40 
                                f32 %112 = OpLoad %111 
                                f32 %113 = OpFNegate %112 
                                f32 %115 = OpFMul %113 %114 
                                f32 %116 = OpLoad %96 
                                f32 %117 = OpFAdd %115 %116 
                       Private f32* %118 = OpAccessChain %9 %105 
                                             OpStore %118 %117 
                       Private f32* %119 = OpAccessChain %9 %40 
                                f32 %120 = OpLoad %119 
                                f32 %122 = OpFMul %120 %121 
                       Private f32* %123 = OpAccessChain %9 %40 
                                             OpStore %123 %122 
                                f32 %124 = OpLoad %78 
                                f32 %125 = OpFMul %124 %52 
                       Private f32* %126 = OpAccessChain %9 %40 
                                f32 %127 = OpLoad %126 
                                f32 %128 = OpFAdd %125 %127 
                       Private f32* %129 = OpAccessChain %9 %40 
                                             OpStore %129 %128 
                              f32_3 %130 = OpLoad %9 
                              f32_3 %135 = OpFAdd %130 %134 
                              f32_4 %136 = OpLoad %49 
                              f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                             OpStore %49 %137 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
UNITY_LOCATION(2) uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_SecondTex, u_xlat0.xy);
    u_xlat6.xy = u_xlat1.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = texture(_ThirdTex, u_xlat0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat6.x);
    u_xlat3 = u_xlat1.w * 1.15625 + u_xlat6.y;
    u_xlat1.z = u_xlat3 + -1.06861997;
    u_xlat0.x = (-u_xlat2.w) * 0.8125 + u_xlat0.x;
    u_xlat3 = u_xlat2.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3;
    u_xlat1.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
; Bound: 156
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %124 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %24 DescriptorSet 24 
                                             OpDecorate %24 Binding 24 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate %60 DescriptorSet 60 
                                             OpDecorate %60 Binding 60 
                                             OpDecorate %124 Location 124 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                     %20 = OpTypePointer Private %10 
                      Private f32_2* %21 = OpVariable Private 
                                     %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %23 = OpTypePointer UniformConstant %22 
UniformConstant read_only Texture2D* %24 = OpVariable UniformConstant 
                                     %26 = OpTypeSampler 
                                     %27 = OpTypePointer UniformConstant %26 
            UniformConstant sampler* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampledImage %22 
                                     %34 = OpTypeVector %6 4 
                                     %36 = OpTypeInt 32 0 
                                 u32 %37 = OpConstant 3 
                                 u32 %39 = OpConstant 0 
                                     %40 = OpTypePointer Private %6 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 f32 %45 = OpConstant 3.674022E-40 
                               f32_2 %46 = OpConstantComposite %44 %45 
                        Private f32* %48 = OpVariable Private 
UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
            UniformConstant sampler* %51 = OpVariable UniformConstant 
UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
            UniformConstant sampler* %60 = OpVariable UniformConstant 
                        Private f32* %68 = OpVariable Private 
                                 f32 %70 = OpConstant 3.674022E-40 
                                 u32 %78 = OpConstant 1 
                                 u32 %82 = OpConstant 2 
                                 f32 %87 = OpConstant 3.674022E-40 
                                 f32 %94 = OpConstant 3.674022E-40 
                     Private f32_3* %103 = OpVariable Private 
                                f32 %105 = OpConstant 3.674022E-40 
                                f32 %106 = OpConstant 3.674022E-40 
                                f32 %107 = OpConstant 3.674022E-40 
                              f32_3 %108 = OpConstantComposite %105 %106 %107 
                                f32 %111 = OpConstant 3.674022E-40 
                              f32_3 %112 = OpConstantComposite %111 %111 %111 
                                f32 %114 = OpConstant 3.674022E-40 
                              f32_3 %115 = OpConstantComposite %114 %114 %114 
                                f32 %120 = OpConstant 3.674022E-40 
                              f32_3 %121 = OpConstantComposite %120 %120 %120 
                                    %123 = OpTypePointer Output %34 
                      Output f32_4* %124 = OpVariable Output 
                                f32 %132 = OpConstant 3.674022E-40 
                              f32_2 %133 = OpConstantComposite %14 %132 
                                f32 %147 = OpConstant 3.674022E-40 
                                    %153 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_3 %18 = OpLoad %9 
                               f32_3 %19 = OpVectorShuffle %18 %17 3 4 2 
                                             OpStore %9 %19 
                 read_only Texture2D %25 = OpLoad %24 
                             sampler %29 = OpLoad %28 
          read_only Texture2DSampled %31 = OpSampledImage %25 %29 
                               f32_3 %32 = OpLoad %9 
                               f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                               f32_4 %35 = OpImageSampleImplicitLod %31 %33 
                                 f32 %38 = OpCompositeExtract %35 3 
                        Private f32* %41 = OpAccessChain %21 %39 
                                             OpStore %41 %38 
                               f32_2 %42 = OpLoad %21 
                               f32_2 %43 = OpVectorShuffle %42 %42 0 0 
                               f32_2 %47 = OpFMul %43 %46 
                                             OpStore %21 %47 
                 read_only Texture2D %50 = OpLoad %49 
                             sampler %52 = OpLoad %51 
          read_only Texture2DSampled %53 = OpSampledImage %50 %52 
                               f32_3 %54 = OpLoad %9 
                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                               f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                 f32 %57 = OpCompositeExtract %56 3 
                                             OpStore %48 %57 
                 read_only Texture2D %59 = OpLoad %58 
                             sampler %61 = OpLoad %60 
          read_only Texture2DSampled %62 = OpSampledImage %59 %61 
                               f32_3 %63 = OpLoad %9 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                               f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                 f32 %66 = OpCompositeExtract %65 3 
                        Private f32* %67 = OpAccessChain %9 %39 
                                             OpStore %67 %66 
                                 f32 %69 = OpLoad %48 
                                 f32 %71 = OpFMul %69 %70 
                        Private f32* %72 = OpAccessChain %21 %39 
                                 f32 %73 = OpLoad %72 
                                 f32 %74 = OpFNegate %73 
                                 f32 %75 = OpFAdd %71 %74 
                                             OpStore %68 %75 
                                 f32 %76 = OpLoad %48 
                                 f32 %77 = OpFMul %76 %70 
                        Private f32* %79 = OpAccessChain %21 %78 
                                 f32 %80 = OpLoad %79 
                                 f32 %81 = OpFAdd %77 %80 
                        Private f32* %83 = OpAccessChain %9 %82 
                                             OpStore %83 %81 
                        Private f32* %84 = OpAccessChain %9 %39 
                                 f32 %85 = OpLoad %84 
                                 f32 %86 = OpFNegate %85 
                                 f32 %88 = OpFMul %86 %87 
                                 f32 %89 = OpLoad %68 
                                 f32 %90 = OpFAdd %88 %89 
                        Private f32* %91 = OpAccessChain %9 %78 
                                             OpStore %91 %90 
                        Private f32* %92 = OpAccessChain %9 %39 
                                 f32 %93 = OpLoad %92 
                                 f32 %95 = OpFMul %93 %94 
                        Private f32* %96 = OpAccessChain %9 %39 
                                             OpStore %96 %95 
                                 f32 %97 = OpLoad %48 
                                 f32 %98 = OpFMul %97 %70 
                        Private f32* %99 = OpAccessChain %9 %39 
                                f32 %100 = OpLoad %99 
                                f32 %101 = OpFAdd %98 %100 
                       Private f32* %102 = OpAccessChain %9 %39 
                                             OpStore %102 %101 
                              f32_3 %104 = OpLoad %9 
                              f32_3 %109 = OpFAdd %104 %108 
                                             OpStore %103 %109 
                              f32_3 %110 = OpLoad %103 
                              f32_3 %113 = OpFMul %110 %112 
                              f32_3 %116 = OpFAdd %113 %115 
                                             OpStore %9 %116 
                              f32_3 %117 = OpLoad %103 
                              f32_3 %118 = OpLoad %9 
                              f32_3 %119 = OpFMul %117 %118 
                              f32_3 %122 = OpFAdd %119 %121 
                                             OpStore %9 %122 
                              f32_3 %125 = OpLoad %9 
                              f32_3 %126 = OpLoad %103 
                              f32_3 %127 = OpFMul %125 %126 
                              f32_4 %128 = OpLoad %124 
                              f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                             OpStore %124 %129 
                              f32_2 %130 = OpLoad vs_TEXCOORD0 
                              f32_2 %131 = OpFMul %130 %16 
                              f32_2 %134 = OpFAdd %131 %133 
                              f32_3 %135 = OpLoad %9 
                              f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
                                             OpStore %9 %136 
                read_only Texture2D %137 = OpLoad %49 
                            sampler %138 = OpLoad %51 
         read_only Texture2DSampled %139 = OpSampledImage %137 %138 
                              f32_3 %140 = OpLoad %9 
                              f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                              f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                f32 %143 = OpCompositeExtract %142 3 
                       Private f32* %144 = OpAccessChain %9 %39 
                                             OpStore %144 %143 
                       Private f32* %145 = OpAccessChain %9 %39 
                                f32 %146 = OpLoad %145 
                                f32 %148 = OpFAdd %146 %147 
                       Private f32* %149 = OpAccessChain %9 %39 
                                             OpStore %149 %148 
                       Private f32* %150 = OpAccessChain %9 %39 
                                f32 %151 = OpLoad %150 
                                f32 %152 = OpFMul %151 %70 
                        Output f32* %154 = OpAccessChain %124 %37 
                                             OpStore %154 %152 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_RGBA_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 214152
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 26
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %9 %22 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 Location 9 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Output %7 
                        Output f32_4* %9 = OpVariable Output 
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
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 59
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %44 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %44 Location 44 
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
                                 f32 %30 = OpConstant 3.674022E-40 
                               f32_3 %31 = OpConstantComposite %30 %30 %30 
                                 f32 %33 = OpConstant 3.674022E-40 
                               f32_3 %34 = OpConstantComposite %33 %33 %33 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_3 %41 = OpConstantComposite %40 %40 %40 
                                     %43 = OpTypePointer Output %7 
                       Output f32_4* %44 = OpVariable Output 
                                     %51 = OpTypeInt 32 0 
                                 u32 %52 = OpConstant 3 
                                     %53 = OpTypePointer Private %6 
                                     %56 = OpTypePointer Output %6 
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
                               f32_3 %32 = OpFMul %29 %31 
                               f32_3 %35 = OpFAdd %32 %34 
                                             OpStore %27 %35 
                               f32_4 %36 = OpLoad %9 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpLoad %27 
                               f32_3 %39 = OpFMul %37 %38 
                               f32_3 %42 = OpFAdd %39 %41 
                                             OpStore %27 %42 
                               f32_4 %45 = OpLoad %9 
                               f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                               f32_3 %47 = OpLoad %27 
                               f32_3 %48 = OpFMul %46 %47 
                               f32_4 %49 = OpLoad %44 
                               f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                             OpStore %44 %50 
                        Private f32* %54 = OpAccessChain %9 %52 
                                 f32 %55 = OpLoad %54 
                         Output f32* %57 = OpAccessChain %44 %52 
                                             OpStore %57 %55 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_RGBASplit_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 307398
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.w = u_xlat0.y;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
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
                                             OpEntryPoint Fragment %4 "main" %12 %36 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate %36 Location 36 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                     %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %21 = OpTypePointer UniformConstant %20 
UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                     %24 = OpTypeSampler 
                                     %25 = OpTypePointer UniformConstant %24 
            UniformConstant sampler* %26 = OpVariable UniformConstant 
                                     %28 = OpTypeSampledImage %20 
                                     %32 = OpTypeVector %6 4 
                                     %35 = OpTypePointer Output %32 
                       Output f32_4* %36 = OpVariable Output 
                                 f32 %42 = OpConstant 3.674022E-40 
                               f32_2 %43 = OpConstantComposite %14 %42 
                                     %53 = OpTypeInt 32 0 
                                 u32 %54 = OpConstant 1 
                                 u32 %56 = OpConstant 0 
                                     %57 = OpTypePointer Private %6 
                                 u32 %61 = OpConstant 3 
                                     %62 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_3 %18 = OpLoad %9 
                               f32_3 %19 = OpVectorShuffle %18 %17 3 4 2 
                                             OpStore %9 %19 
                 read_only Texture2D %23 = OpLoad %22 
                             sampler %27 = OpLoad %26 
          read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                               f32_3 %30 = OpLoad %9 
                               f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                               f32_4 %33 = OpImageSampleImplicitLod %29 %31 
                               f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                             OpStore %9 %34 
                               f32_3 %37 = OpLoad %9 
                               f32_4 %38 = OpLoad %36 
                               f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                             OpStore %36 %39 
                               f32_2 %40 = OpLoad vs_TEXCOORD0 
                               f32_2 %41 = OpFMul %40 %16 
                               f32_2 %44 = OpFAdd %41 %43 
                               f32_3 %45 = OpLoad %9 
                               f32_3 %46 = OpVectorShuffle %45 %44 3 4 2 
                                             OpStore %9 %46 
                 read_only Texture2D %47 = OpLoad %22 
                             sampler %48 = OpLoad %26 
          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
                               f32_3 %50 = OpLoad %9 
                               f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                                 f32 %55 = OpCompositeExtract %52 1 
                        Private f32* %58 = OpAccessChain %9 %56 
                                             OpStore %58 %55 
                        Private f32* %59 = OpAccessChain %9 %56 
                                 f32 %60 = OpLoad %59 
                         Output f32* %63 = OpAccessChain %36 %61 
                                             OpStore %63 %60 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.w = u_xlat0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 81
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate %50 Location 50 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                     %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %21 = OpTypePointer UniformConstant %20 
UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                     %24 = OpTypeSampler 
                                     %25 = OpTypePointer UniformConstant %24 
            UniformConstant sampler* %26 = OpVariable UniformConstant 
                                     %28 = OpTypeSampledImage %20 
                                     %32 = OpTypeVector %6 4 
                      Private f32_3* %35 = OpVariable Private 
                                 f32 %37 = OpConstant 3.674022E-40 
                               f32_3 %38 = OpConstantComposite %37 %37 %37 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_3 %41 = OpConstantComposite %40 %40 %40 
                                 f32 %46 = OpConstant 3.674022E-40 
                               f32_3 %47 = OpConstantComposite %46 %46 %46 
                                     %49 = OpTypePointer Output %32 
                       Output f32_4* %50 = OpVariable Output 
                                 f32 %58 = OpConstant 3.674022E-40 
                               f32_2 %59 = OpConstantComposite %14 %58 
                                     %69 = OpTypeInt 32 0 
                                 u32 %70 = OpConstant 1 
                                 u32 %72 = OpConstant 0 
                                     %73 = OpTypePointer Private %6 
                                 u32 %77 = OpConstant 3 
                                     %78 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_3 %18 = OpLoad %9 
                               f32_3 %19 = OpVectorShuffle %18 %17 3 4 2 
                                             OpStore %9 %19 
                 read_only Texture2D %23 = OpLoad %22 
                             sampler %27 = OpLoad %26 
          read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                               f32_3 %30 = OpLoad %9 
                               f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                               f32_4 %33 = OpImageSampleImplicitLod %29 %31 
                               f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                             OpStore %9 %34 
                               f32_3 %36 = OpLoad %9 
                               f32_3 %39 = OpFMul %36 %38 
                               f32_3 %42 = OpFAdd %39 %41 
                                             OpStore %35 %42 
                               f32_3 %43 = OpLoad %9 
                               f32_3 %44 = OpLoad %35 
                               f32_3 %45 = OpFMul %43 %44 
                               f32_3 %48 = OpFAdd %45 %47 
                                             OpStore %35 %48 
                               f32_3 %51 = OpLoad %9 
                               f32_3 %52 = OpLoad %35 
                               f32_3 %53 = OpFMul %51 %52 
                               f32_4 %54 = OpLoad %50 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %50 %55 
                               f32_2 %56 = OpLoad vs_TEXCOORD0 
                               f32_2 %57 = OpFMul %56 %16 
                               f32_2 %60 = OpFAdd %57 %59 
                               f32_3 %61 = OpLoad %9 
                               f32_3 %62 = OpVectorShuffle %61 %60 3 4 2 
                                             OpStore %9 %62 
                 read_only Texture2D %63 = OpLoad %22 
                             sampler %64 = OpLoad %26 
          read_only Texture2DSampled %65 = OpSampledImage %63 %64 
                               f32_3 %66 = OpLoad %9 
                               f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                               f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                 f32 %71 = OpCompositeExtract %68 1 
                        Private f32* %74 = OpAccessChain %9 %72 
                                             OpStore %74 %71 
                        Private f32* %75 = OpAccessChain %9 %72 
                                 f32 %76 = OpLoad %75 
                         Output f32* %79 = OpAccessChain %50 %77 
                                             OpStore %79 %76 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_SemiPlanarYCbCr_To_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 384739
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
int u_xlati2;
float u_xlat4;
int u_xlati4;
bool u_xlatb4;
int u_xlati6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.z + -0.5;
    u_xlat2 = vs_TEXCOORD0.x * u_xlat0.x + 0.5;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = floor(u_xlat2);
    u_xlat4 = u_xlat2 * 0.5;
    u_xlati2 = int(u_xlat2);
    u_xlatb6 = u_xlat4>=(-u_xlat4);
    u_xlat4 = fract(abs(u_xlat4));
    u_xlat4 = (u_xlatb6) ? u_xlat4 : (-u_xlat4);
    u_xlatb4 = u_xlat4==0.0;
    u_xlati6 = u_xlati2 + int(0xFFFFFFFFu);
    u_xlati2 = (u_xlatb4) ? u_xlati2 : u_xlati6;
    u_xlati4 = u_xlati2 + 1;
    u_xlat2 = float(u_xlati2);
    u_xlat1.x = u_xlat0.x * u_xlat2;
    u_xlat2 = float(u_xlati4);
    u_xlat1.z = u_xlat0.x * u_xlat2;
    u_xlat1.yw = vs_TEXCOORD0.yy;
    u_xlat0 = texture(_SecondTex, u_xlat1.zw);
    u_xlat1 = texture(_SecondTex, u_xlat1.xy);
    u_xlat0.xy = u_xlat1.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat0.x);
    u_xlat2 = u_xlat1.w * 1.15625 + u_xlat0.y;
    SV_Target0.z = u_xlat2 + -1.06861997;
    u_xlat0.x = (-u_xlat0.w) * 0.8125 + u_xlat0.x;
    u_xlat2 = u_xlat0.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat2;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
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
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 205
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %30 %193 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate %120 DescriptorSet 120 
                                              OpDecorate %120 Binding 120 
                                              OpDecorate %124 DescriptorSet 124 
                                              OpDecorate %124 Binding 124 
                                              OpDecorate %149 DescriptorSet 149 
                                              OpDecorate %149 Binding 149 
                                              OpDecorate %151 DescriptorSet 151 
                                              OpDecorate %151 Binding 151 
                                              OpDecorate %193 Location 193 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypeStruct %10 
                                      %12 = OpTypePointer Uniform %11 
             Uniform struct {f32_4;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 2 
                                      %18 = OpTypePointer Uniform %6 
                                  f32 %21 = OpConstant 3.674022E-40 
                                  u32 %23 = OpConstant 0 
                                      %24 = OpTypePointer Private %6 
                                      %26 = OpTypeVector %6 2 
                                      %27 = OpTypePointer Private %26 
                       Private f32_2* %28 = OpVariable Private 
                                      %29 = OpTypePointer Input %26 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %31 = OpTypePointer Input %6 
                                  f32 %37 = OpConstant 3.674022E-40 
                                  f32 %40 = OpConstant 3.674022E-40 
                         Private f32* %49 = OpVariable Private 
                                      %53 = OpTypePointer Private %14 
                         Private i32* %54 = OpVariable Private 
                                      %58 = OpTypeBool 
                                      %59 = OpTypePointer Private %58 
                        Private bool* %60 = OpVariable Private 
                                      %69 = OpTypePointer Function %6 
                        Private bool* %78 = OpVariable Private 
                                  f32 %80 = OpConstant 3.674022E-40 
                         Private i32* %82 = OpVariable Private 
                                  i32 %84 = OpConstant -1 
                         Private i32* %90 = OpVariable Private 
                                  i32 %92 = OpConstant 1 
                                      %97 = OpTypePointer Private %10 
                       Private f32_4* %98 = OpVariable Private 
                                     %118 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %119 = OpTypePointer UniformConstant %118 
UniformConstant read_only Texture2D* %120 = OpVariable UniformConstant 
                                     %122 = OpTypeSampler 
                                     %123 = OpTypePointer UniformConstant %122 
            UniformConstant sampler* %124 = OpVariable UniformConstant 
                                     %126 = OpTypeSampledImage %118 
                                 u32 %131 = OpConstant 3 
                                 f32 %144 = OpConstant 3.674022E-40 
                                 f32 %145 = OpConstant 3.674022E-40 
                               f32_2 %146 = OpConstantComposite %144 %145 
                        Private f32* %148 = OpVariable Private 
UniformConstant read_only Texture2D* %149 = OpVariable UniformConstant 
            UniformConstant sampler* %151 = OpVariable UniformConstant 
                                 f32 %158 = OpConstant 3.674022E-40 
                                 u32 %167 = OpConstant 1 
                                 f32 %175 = OpConstant 3.674022E-40 
                                 f32 %183 = OpConstant 3.674022E-40 
                                     %192 = OpTypePointer Output %10 
                       Output f32_4* %193 = OpVariable Output 
                                 f32 %195 = OpConstant 3.674022E-40 
                                 f32 %196 = OpConstant 3.674022E-40 
                                 f32 %197 = OpConstant 3.674022E-40 
                               f32_3 %198 = OpConstantComposite %195 %196 %197 
                                     %202 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function f32* %70 = OpVariable Function 
                         Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %22 = OpFAdd %20 %21 
                         Private f32* %25 = OpAccessChain %9 %23 
                                              OpStore %25 %22 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD0 %23 
                                  f32 %33 = OpLoad %32 
                         Private f32* %34 = OpAccessChain %9 %23 
                                  f32 %35 = OpLoad %34 
                                  f32 %36 = OpFMul %33 %35 
                                  f32 %38 = OpFAdd %36 %37 
                         Private f32* %39 = OpAccessChain %28 %23 
                                              OpStore %39 %38 
                         Private f32* %41 = OpAccessChain %9 %23 
                                  f32 %42 = OpLoad %41 
                                  f32 %43 = OpFDiv %40 %42 
                         Private f32* %44 = OpAccessChain %9 %23 
                                              OpStore %44 %43 
                         Private f32* %45 = OpAccessChain %28 %23 
                                  f32 %46 = OpLoad %45 
                                  f32 %47 = OpExtInst %1 8 %46 
                         Private f32* %48 = OpAccessChain %28 %23 
                                              OpStore %48 %47 
                         Private f32* %50 = OpAccessChain %28 %23 
                                  f32 %51 = OpLoad %50 
                                  f32 %52 = OpFMul %51 %37 
                                              OpStore %49 %52 
                         Private f32* %55 = OpAccessChain %28 %23 
                                  f32 %56 = OpLoad %55 
                                  i32 %57 = OpConvertFToS %56 
                                              OpStore %54 %57 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpLoad %49 
                                  f32 %63 = OpFNegate %62 
                                 bool %64 = OpFOrdGreaterThanEqual %61 %63 
                                              OpStore %60 %64 
                                  f32 %65 = OpLoad %49 
                                  f32 %66 = OpExtInst %1 4 %65 
                                  f32 %67 = OpExtInst %1 10 %66 
                                              OpStore %49 %67 
                                 bool %68 = OpLoad %60 
                                              OpSelectionMerge %72 None 
                                              OpBranchConditional %68 %71 %74 
                                      %71 = OpLabel 
                                  f32 %73 = OpLoad %49 
                                              OpStore %70 %73 
                                              OpBranch %72 
                                      %74 = OpLabel 
                                  f32 %75 = OpLoad %49 
                                  f32 %76 = OpFNegate %75 
                                              OpStore %70 %76 
                                              OpBranch %72 
                                      %72 = OpLabel 
                                  f32 %77 = OpLoad %70 
                                              OpStore %49 %77 
                                  f32 %79 = OpLoad %49 
                                 bool %81 = OpFOrdEqual %79 %80 
                                              OpStore %78 %81 
                                  i32 %83 = OpLoad %54 
                                  i32 %85 = OpIAdd %83 %84 
                                              OpStore %82 %85 
                                 bool %86 = OpLoad %78 
                                  i32 %87 = OpLoad %54 
                                  i32 %88 = OpLoad %82 
                                  i32 %89 = OpSelect %86 %87 %88 
                                              OpStore %54 %89 
                                  i32 %91 = OpLoad %54 
                                  i32 %93 = OpIAdd %91 %92 
                                              OpStore %90 %93 
                                  i32 %94 = OpLoad %54 
                                  f32 %95 = OpConvertSToF %94 
                         Private f32* %96 = OpAccessChain %28 %23 
                                              OpStore %96 %95 
                         Private f32* %99 = OpAccessChain %9 %23 
                                 f32 %100 = OpLoad %99 
                        Private f32* %101 = OpAccessChain %28 %23 
                                 f32 %102 = OpLoad %101 
                                 f32 %103 = OpFMul %100 %102 
                        Private f32* %104 = OpAccessChain %98 %23 
                                              OpStore %104 %103 
                                 i32 %105 = OpLoad %90 
                                 f32 %106 = OpConvertSToF %105 
                        Private f32* %107 = OpAccessChain %28 %23 
                                              OpStore %107 %106 
                        Private f32* %108 = OpAccessChain %9 %23 
                                 f32 %109 = OpLoad %108 
                        Private f32* %110 = OpAccessChain %28 %23 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpFMul %109 %111 
                        Private f32* %113 = OpAccessChain %98 %17 
                                              OpStore %113 %112 
                               f32_2 %114 = OpLoad vs_TEXCOORD0 
                               f32_2 %115 = OpVectorShuffle %114 %114 1 1 
                               f32_4 %116 = OpLoad %98 
                               f32_4 %117 = OpVectorShuffle %116 %115 0 4 2 5 
                                              OpStore %98 %117 
                 read_only Texture2D %121 = OpLoad %120 
                             sampler %125 = OpLoad %124 
          read_only Texture2DSampled %127 = OpSampledImage %121 %125 
                               f32_4 %128 = OpLoad %98 
                               f32_2 %129 = OpVectorShuffle %128 %128 2 3 
                               f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                 f32 %132 = OpCompositeExtract %130 3 
                        Private f32* %133 = OpAccessChain %9 %23 
                                              OpStore %133 %132 
                 read_only Texture2D %134 = OpLoad %120 
                             sampler %135 = OpLoad %124 
          read_only Texture2DSampled %136 = OpSampledImage %134 %135 
                               f32_4 %137 = OpLoad %98 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                               f32_4 %139 = OpImageSampleImplicitLod %136 %138 
                                 f32 %140 = OpCompositeExtract %139 3 
                        Private f32* %141 = OpAccessChain %28 %23 
                                              OpStore %141 %140 
                               f32_2 %142 = OpLoad %28 
                               f32_2 %143 = OpVectorShuffle %142 %142 0 0 
                               f32_2 %147 = OpFMul %143 %146 
                                              OpStore %28 %147 
                 read_only Texture2D %150 = OpLoad %149 
                             sampler %152 = OpLoad %151 
          read_only Texture2DSampled %153 = OpSampledImage %150 %152 
                               f32_2 %154 = OpLoad vs_TEXCOORD0 
                               f32_4 %155 = OpImageSampleImplicitLod %153 %154 
                                 f32 %156 = OpCompositeExtract %155 3 
                                              OpStore %148 %156 
                                 f32 %157 = OpLoad %148 
                                 f32 %159 = OpFMul %157 %158 
                        Private f32* %160 = OpAccessChain %28 %23 
                                 f32 %161 = OpLoad %160 
                                 f32 %162 = OpFNegate %161 
                                 f32 %163 = OpFAdd %159 %162 
                        Private f32* %164 = OpAccessChain %28 %23 
                                              OpStore %164 %163 
                                 f32 %165 = OpLoad %148 
                                 f32 %166 = OpFMul %165 %158 
                        Private f32* %168 = OpAccessChain %28 %167 
                                 f32 %169 = OpLoad %168 
                                 f32 %170 = OpFAdd %166 %169 
                        Private f32* %171 = OpAccessChain %9 %17 
                                              OpStore %171 %170 
                        Private f32* %172 = OpAccessChain %9 %23 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpFNegate %173 
                                 f32 %176 = OpFMul %174 %175 
                        Private f32* %177 = OpAccessChain %28 %23 
                                 f32 %178 = OpLoad %177 
                                 f32 %179 = OpFAdd %176 %178 
                        Private f32* %180 = OpAccessChain %9 %167 
                                              OpStore %180 %179 
                        Private f32* %181 = OpAccessChain %9 %23 
                                 f32 %182 = OpLoad %181 
                                 f32 %184 = OpFMul %182 %183 
                        Private f32* %185 = OpAccessChain %9 %23 
                                              OpStore %185 %184 
                                 f32 %186 = OpLoad %148 
                                 f32 %187 = OpFMul %186 %158 
                        Private f32* %188 = OpAccessChain %9 %23 
                                 f32 %189 = OpLoad %188 
                                 f32 %190 = OpFAdd %187 %189 
                        Private f32* %191 = OpAccessChain %9 %23 
                                              OpStore %191 %190 
                               f32_3 %194 = OpLoad %9 
                               f32_3 %199 = OpFAdd %194 %198 
                               f32_4 %200 = OpLoad %193 
                               f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                              OpStore %193 %201 
                         Output f32* %203 = OpAccessChain %193 %131 
                                              OpStore %203 %40 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
int u_xlati2;
float u_xlat4;
int u_xlati4;
bool u_xlatb4;
int u_xlati6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.z + -0.5;
    u_xlat2 = vs_TEXCOORD0.x * u_xlat0.x + 0.5;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = floor(u_xlat2);
    u_xlat4 = u_xlat2 * 0.5;
    u_xlati2 = int(u_xlat2);
    u_xlatb6 = u_xlat4>=(-u_xlat4);
    u_xlat4 = fract(abs(u_xlat4));
    u_xlat4 = (u_xlatb6) ? u_xlat4 : (-u_xlat4);
    u_xlatb4 = u_xlat4==0.0;
    u_xlati6 = u_xlati2 + int(0xFFFFFFFFu);
    u_xlati2 = (u_xlatb4) ? u_xlati2 : u_xlati6;
    u_xlati4 = u_xlati2 + 1;
    u_xlat2 = float(u_xlati2);
    u_xlat1.x = u_xlat0.x * u_xlat2;
    u_xlat2 = float(u_xlati4);
    u_xlat1.z = u_xlat0.x * u_xlat2;
    u_xlat1.yw = vs_TEXCOORD0.yy;
    u_xlat0 = texture(_SecondTex, u_xlat1.zw);
    u_xlat1 = texture(_SecondTex, u_xlat1.xy);
    u_xlat0.xy = u_xlat1.ww * vec2(0.390625, 1.984375);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat0.x);
    u_xlat2 = u_xlat1.w * 1.15625 + u_xlat0.y;
    u_xlat1.z = u_xlat2 + -1.06861997;
    u_xlat0.x = (-u_xlat0.w) * 0.8125 + u_xlat0.x;
    u_xlat2 = u_xlat0.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat2;
    u_xlat1.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 226
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %30 %216 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate %120 DescriptorSet 120 
                                              OpDecorate %120 Binding 120 
                                              OpDecorate %124 DescriptorSet 124 
                                              OpDecorate %124 Binding 124 
                                              OpDecorate %149 DescriptorSet 149 
                                              OpDecorate %149 Binding 149 
                                              OpDecorate %151 DescriptorSet 151 
                                              OpDecorate %151 Binding 151 
                                              OpDecorate %216 Location 216 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypeStruct %10 
                                      %12 = OpTypePointer Uniform %11 
             Uniform struct {f32_4;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 2 
                                      %18 = OpTypePointer Uniform %6 
                                  f32 %21 = OpConstant 3.674022E-40 
                                  u32 %23 = OpConstant 0 
                                      %24 = OpTypePointer Private %6 
                                      %26 = OpTypeVector %6 2 
                                      %27 = OpTypePointer Private %26 
                       Private f32_2* %28 = OpVariable Private 
                                      %29 = OpTypePointer Input %26 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %31 = OpTypePointer Input %6 
                                  f32 %37 = OpConstant 3.674022E-40 
                                  f32 %40 = OpConstant 3.674022E-40 
                         Private f32* %49 = OpVariable Private 
                                      %53 = OpTypePointer Private %14 
                         Private i32* %54 = OpVariable Private 
                                      %58 = OpTypeBool 
                                      %59 = OpTypePointer Private %58 
                        Private bool* %60 = OpVariable Private 
                                      %69 = OpTypePointer Function %6 
                        Private bool* %78 = OpVariable Private 
                                  f32 %80 = OpConstant 3.674022E-40 
                         Private i32* %82 = OpVariable Private 
                                  i32 %84 = OpConstant -1 
                         Private i32* %90 = OpVariable Private 
                                  i32 %92 = OpConstant 1 
                                      %97 = OpTypePointer Private %10 
                       Private f32_4* %98 = OpVariable Private 
                                     %118 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %119 = OpTypePointer UniformConstant %118 
UniformConstant read_only Texture2D* %120 = OpVariable UniformConstant 
                                     %122 = OpTypeSampler 
                                     %123 = OpTypePointer UniformConstant %122 
            UniformConstant sampler* %124 = OpVariable UniformConstant 
                                     %126 = OpTypeSampledImage %118 
                                 u32 %131 = OpConstant 3 
                                 f32 %144 = OpConstant 3.674022E-40 
                                 f32 %145 = OpConstant 3.674022E-40 
                               f32_2 %146 = OpConstantComposite %144 %145 
                        Private f32* %148 = OpVariable Private 
UniformConstant read_only Texture2D* %149 = OpVariable UniformConstant 
            UniformConstant sampler* %151 = OpVariable UniformConstant 
                                 f32 %158 = OpConstant 3.674022E-40 
                                 u32 %167 = OpConstant 1 
                                 f32 %175 = OpConstant 3.674022E-40 
                                 f32 %183 = OpConstant 3.674022E-40 
                                 f32 %193 = OpConstant 3.674022E-40 
                                 f32 %194 = OpConstant 3.674022E-40 
                                 f32 %195 = OpConstant 3.674022E-40 
                               f32_3 %196 = OpConstantComposite %193 %194 %195 
                                 f32 %202 = OpConstant 3.674022E-40 
                               f32_3 %203 = OpConstantComposite %202 %202 %202 
                                 f32 %205 = OpConstant 3.674022E-40 
                               f32_3 %206 = OpConstantComposite %205 %205 %205 
                                 f32 %212 = OpConstant 3.674022E-40 
                               f32_3 %213 = OpConstantComposite %212 %212 %212 
                                     %215 = OpTypePointer Output %10 
                       Output f32_4* %216 = OpVariable Output 
                                     %223 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function f32* %70 = OpVariable Function 
                         Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %22 = OpFAdd %20 %21 
                         Private f32* %25 = OpAccessChain %9 %23 
                                              OpStore %25 %22 
                           Input f32* %32 = OpAccessChain vs_TEXCOORD0 %23 
                                  f32 %33 = OpLoad %32 
                         Private f32* %34 = OpAccessChain %9 %23 
                                  f32 %35 = OpLoad %34 
                                  f32 %36 = OpFMul %33 %35 
                                  f32 %38 = OpFAdd %36 %37 
                         Private f32* %39 = OpAccessChain %28 %23 
                                              OpStore %39 %38 
                         Private f32* %41 = OpAccessChain %9 %23 
                                  f32 %42 = OpLoad %41 
                                  f32 %43 = OpFDiv %40 %42 
                         Private f32* %44 = OpAccessChain %9 %23 
                                              OpStore %44 %43 
                         Private f32* %45 = OpAccessChain %28 %23 
                                  f32 %46 = OpLoad %45 
                                  f32 %47 = OpExtInst %1 8 %46 
                         Private f32* %48 = OpAccessChain %28 %23 
                                              OpStore %48 %47 
                         Private f32* %50 = OpAccessChain %28 %23 
                                  f32 %51 = OpLoad %50 
                                  f32 %52 = OpFMul %51 %37 
                                              OpStore %49 %52 
                         Private f32* %55 = OpAccessChain %28 %23 
                                  f32 %56 = OpLoad %55 
                                  i32 %57 = OpConvertFToS %56 
                                              OpStore %54 %57 
                                  f32 %61 = OpLoad %49 
                                  f32 %62 = OpLoad %49 
                                  f32 %63 = OpFNegate %62 
                                 bool %64 = OpFOrdGreaterThanEqual %61 %63 
                                              OpStore %60 %64 
                                  f32 %65 = OpLoad %49 
                                  f32 %66 = OpExtInst %1 4 %65 
                                  f32 %67 = OpExtInst %1 10 %66 
                                              OpStore %49 %67 
                                 bool %68 = OpLoad %60 
                                              OpSelectionMerge %72 None 
                                              OpBranchConditional %68 %71 %74 
                                      %71 = OpLabel 
                                  f32 %73 = OpLoad %49 
                                              OpStore %70 %73 
                                              OpBranch %72 
                                      %74 = OpLabel 
                                  f32 %75 = OpLoad %49 
                                  f32 %76 = OpFNegate %75 
                                              OpStore %70 %76 
                                              OpBranch %72 
                                      %72 = OpLabel 
                                  f32 %77 = OpLoad %70 
                                              OpStore %49 %77 
                                  f32 %79 = OpLoad %49 
                                 bool %81 = OpFOrdEqual %79 %80 
                                              OpStore %78 %81 
                                  i32 %83 = OpLoad %54 
                                  i32 %85 = OpIAdd %83 %84 
                                              OpStore %82 %85 
                                 bool %86 = OpLoad %78 
                                  i32 %87 = OpLoad %54 
                                  i32 %88 = OpLoad %82 
                                  i32 %89 = OpSelect %86 %87 %88 
                                              OpStore %54 %89 
                                  i32 %91 = OpLoad %54 
                                  i32 %93 = OpIAdd %91 %92 
                                              OpStore %90 %93 
                                  i32 %94 = OpLoad %54 
                                  f32 %95 = OpConvertSToF %94 
                         Private f32* %96 = OpAccessChain %28 %23 
                                              OpStore %96 %95 
                         Private f32* %99 = OpAccessChain %9 %23 
                                 f32 %100 = OpLoad %99 
                        Private f32* %101 = OpAccessChain %28 %23 
                                 f32 %102 = OpLoad %101 
                                 f32 %103 = OpFMul %100 %102 
                        Private f32* %104 = OpAccessChain %98 %23 
                                              OpStore %104 %103 
                                 i32 %105 = OpLoad %90 
                                 f32 %106 = OpConvertSToF %105 
                        Private f32* %107 = OpAccessChain %28 %23 
                                              OpStore %107 %106 
                        Private f32* %108 = OpAccessChain %9 %23 
                                 f32 %109 = OpLoad %108 
                        Private f32* %110 = OpAccessChain %28 %23 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpFMul %109 %111 
                        Private f32* %113 = OpAccessChain %98 %17 
                                              OpStore %113 %112 
                               f32_2 %114 = OpLoad vs_TEXCOORD0 
                               f32_2 %115 = OpVectorShuffle %114 %114 1 1 
                               f32_4 %116 = OpLoad %98 
                               f32_4 %117 = OpVectorShuffle %116 %115 0 4 2 5 
                                              OpStore %98 %117 
                 read_only Texture2D %121 = OpLoad %120 
                             sampler %125 = OpLoad %124 
          read_only Texture2DSampled %127 = OpSampledImage %121 %125 
                               f32_4 %128 = OpLoad %98 
                               f32_2 %129 = OpVectorShuffle %128 %128 2 3 
                               f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                 f32 %132 = OpCompositeExtract %130 3 
                        Private f32* %133 = OpAccessChain %9 %23 
                                              OpStore %133 %132 
                 read_only Texture2D %134 = OpLoad %120 
                             sampler %135 = OpLoad %124 
          read_only Texture2DSampled %136 = OpSampledImage %134 %135 
                               f32_4 %137 = OpLoad %98 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                               f32_4 %139 = OpImageSampleImplicitLod %136 %138 
                                 f32 %140 = OpCompositeExtract %139 3 
                        Private f32* %141 = OpAccessChain %28 %23 
                                              OpStore %141 %140 
                               f32_2 %142 = OpLoad %28 
                               f32_2 %143 = OpVectorShuffle %142 %142 0 0 
                               f32_2 %147 = OpFMul %143 %146 
                                              OpStore %28 %147 
                 read_only Texture2D %150 = OpLoad %149 
                             sampler %152 = OpLoad %151 
          read_only Texture2DSampled %153 = OpSampledImage %150 %152 
                               f32_2 %154 = OpLoad vs_TEXCOORD0 
                               f32_4 %155 = OpImageSampleImplicitLod %153 %154 
                                 f32 %156 = OpCompositeExtract %155 3 
                                              OpStore %148 %156 
                                 f32 %157 = OpLoad %148 
                                 f32 %159 = OpFMul %157 %158 
                        Private f32* %160 = OpAccessChain %28 %23 
                                 f32 %161 = OpLoad %160 
                                 f32 %162 = OpFNegate %161 
                                 f32 %163 = OpFAdd %159 %162 
                        Private f32* %164 = OpAccessChain %28 %23 
                                              OpStore %164 %163 
                                 f32 %165 = OpLoad %148 
                                 f32 %166 = OpFMul %165 %158 
                        Private f32* %168 = OpAccessChain %28 %167 
                                 f32 %169 = OpLoad %168 
                                 f32 %170 = OpFAdd %166 %169 
                        Private f32* %171 = OpAccessChain %9 %17 
                                              OpStore %171 %170 
                        Private f32* %172 = OpAccessChain %9 %23 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpFNegate %173 
                                 f32 %176 = OpFMul %174 %175 
                        Private f32* %177 = OpAccessChain %28 %23 
                                 f32 %178 = OpLoad %177 
                                 f32 %179 = OpFAdd %176 %178 
                        Private f32* %180 = OpAccessChain %9 %167 
                                              OpStore %180 %179 
                        Private f32* %181 = OpAccessChain %9 %23 
                                 f32 %182 = OpLoad %181 
                                 f32 %184 = OpFMul %182 %183 
                        Private f32* %185 = OpAccessChain %9 %23 
                                              OpStore %185 %184 
                                 f32 %186 = OpLoad %148 
                                 f32 %187 = OpFMul %186 %158 
                        Private f32* %188 = OpAccessChain %9 %23 
                                 f32 %189 = OpLoad %188 
                                 f32 %190 = OpFAdd %187 %189 
                        Private f32* %191 = OpAccessChain %9 %23 
                                              OpStore %191 %190 
                               f32_3 %192 = OpLoad %9 
                               f32_3 %197 = OpFAdd %192 %196 
                               f32_4 %198 = OpLoad %98 
                               f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                              OpStore %98 %199 
                               f32_4 %200 = OpLoad %98 
                               f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                               f32_3 %204 = OpFMul %201 %203 
                               f32_3 %207 = OpFAdd %204 %206 
                                              OpStore %9 %207 
                               f32_4 %208 = OpLoad %98 
                               f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                               f32_3 %210 = OpLoad %9 
                               f32_3 %211 = OpFMul %209 %210 
                               f32_3 %214 = OpFAdd %211 %213 
                                              OpStore %9 %214 
                               f32_3 %217 = OpLoad %9 
                               f32_4 %218 = OpLoad %98 
                               f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                               f32_3 %220 = OpFMul %217 %219 
                               f32_4 %221 = OpLoad %216 
                               f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                              OpStore %216 %222 
                         Output f32* %224 = OpAccessChain %216 %131 
                                              OpStore %224 %40 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_SemiPlanarYCbCrA_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 439144
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
int u_xlati3;
float u_xlat6;
int u_xlati6;
bool u_xlatb6;
int u_xlati9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.z + -0.5;
    u_xlat3.xyz = vs_TEXCOORD0.xxy * vec3(0.5, 0.5, 1.0);
    u_xlat3.x = u_xlat3.x * u_xlat0.x + 0.5;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat1 = texture(_MainTex, u_xlat3.yz);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat6 = u_xlat3.x * 0.5;
    u_xlati3 = int(u_xlat3.x);
    u_xlatb9 = u_xlat6>=(-u_xlat6);
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
    u_xlatb6 = u_xlat6==0.0;
    u_xlati9 = u_xlati3 + int(0xFFFFFFFFu);
    u_xlati3 = (u_xlatb6) ? u_xlati3 : u_xlati9;
    u_xlati6 = u_xlati3 + 1;
    u_xlat3.x = float(u_xlati3);
    u_xlat2.x = u_xlat0.x * u_xlat3.x;
    u_xlat3.x = float(u_xlati6);
    u_xlat2.z = u_xlat0.x * u_xlat3.x;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat0 = texture(_SecondTex, u_xlat2.zw);
    u_xlat2 = texture(_SecondTex, u_xlat2.xy);
    u_xlat0.xy = u_xlat2.ww * vec2(0.390625, 1.984375);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat0.x);
    u_xlat3.x = u_xlat1.w * 1.15625 + u_xlat0.y;
    SV_Target0.z = u_xlat3.x + -1.06861997;
    u_xlat0.x = (-u_xlat0.w) * 0.8125 + u_xlat0.x;
    u_xlat3.x = u_xlat0.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3.x;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 234
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %30 %198 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %10 0 Offset 10 
                                              OpDecorate %10 Block 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate %51 DescriptorSet 51 
                                              OpDecorate %51 Binding 51 
                                              OpDecorate %55 DescriptorSet 55 
                                              OpDecorate %55 Binding 55 
                                              OpDecorate %136 DescriptorSet 136 
                                              OpDecorate %136 Binding 136 
                                              OpDecorate %138 DescriptorSet 138 
                                              OpDecorate %138 Binding 138 
                                              OpDecorate %198 Location 198 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeStruct %7 
                                      %11 = OpTypePointer Uniform %10 
             Uniform struct {f32_4;}* %12 = OpVariable Uniform 
                                      %13 = OpTypeInt 32 1 
                                  i32 %14 = OpConstant 0 
                                      %15 = OpTypeInt 32 0 
                                  u32 %16 = OpConstant 2 
                                      %17 = OpTypePointer Uniform %6 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  u32 %22 = OpConstant 0 
                                      %23 = OpTypePointer Private %6 
                                      %25 = OpTypeVector %6 3 
                                      %26 = OpTypePointer Private %25 
                       Private f32_3* %27 = OpVariable Private 
                                      %28 = OpTypeVector %6 2 
                                      %29 = OpTypePointer Input %28 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %33 = OpConstant 3.674022E-40 
                                  f32 %34 = OpConstant 3.674022E-40 
                                f32_3 %35 = OpConstantComposite %33 %33 %34 
                         Private f32* %48 = OpVariable Private 
                                      %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %50 = OpTypePointer UniformConstant %49 
 UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                      %53 = OpTypeSampler 
                                      %54 = OpTypePointer UniformConstant %53 
             UniformConstant sampler* %55 = OpVariable UniformConstant 
                                      %57 = OpTypeSampledImage %49 
                                  u32 %62 = OpConstant 3 
                         Private f32* %68 = OpVariable Private 
                                      %72 = OpTypePointer Private %13 
                         Private i32* %73 = OpVariable Private 
                                      %77 = OpTypeBool 
                                      %78 = OpTypePointer Private %77 
                        Private bool* %79 = OpVariable Private 
                                      %88 = OpTypePointer Function %6 
                        Private bool* %97 = OpVariable Private 
                                  f32 %99 = OpConstant 3.674022E-40 
                        Private i32* %101 = OpVariable Private 
                                 i32 %103 = OpConstant -1 
                        Private i32* %109 = OpVariable Private 
                                 i32 %111 = OpConstant 1 
                      Private f32_4* %116 = OpVariable Private 
UniformConstant read_only Texture2D* %136 = OpVariable UniformConstant 
            UniformConstant sampler* %138 = OpVariable UniformConstant 
                                 f32 %156 = OpConstant 3.674022E-40 
                                 f32 %157 = OpConstant 3.674022E-40 
                               f32_2 %158 = OpConstantComposite %156 %157 
                                 f32 %163 = OpConstant 3.674022E-40 
                                 f32 %179 = OpConstant 3.674022E-40 
                                 u32 %184 = OpConstant 1 
                                 f32 %188 = OpConstant 3.674022E-40 
                                     %197 = OpTypePointer Output %7 
                       Output f32_4* %198 = OpVariable Output 
                                 f32 %201 = OpConstant 3.674022E-40 
                                 f32 %202 = OpConstant 3.674022E-40 
                                 f32 %203 = OpConstant 3.674022E-40 
                               f32_3 %204 = OpConstantComposite %201 %202 %203 
                               f32_2 %209 = OpConstantComposite %33 %34 
                               f32_2 %211 = OpConstantComposite %33 %99 
                                 f32 %225 = OpConstant 3.674022E-40 
                                     %231 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function f32* %89 = OpVariable Function 
                         Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                  f32 %19 = OpLoad %18 
                                  f32 %21 = OpFAdd %19 %20 
                         Private f32* %24 = OpAccessChain %9 %22 
                                              OpStore %24 %21 
                                f32_2 %31 = OpLoad vs_TEXCOORD0 
                                f32_3 %32 = OpVectorShuffle %31 %31 0 0 1 
                                f32_3 %36 = OpFMul %32 %35 
                                              OpStore %27 %36 
                         Private f32* %37 = OpAccessChain %27 %22 
                                  f32 %38 = OpLoad %37 
                         Private f32* %39 = OpAccessChain %9 %22 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpFMul %38 %40 
                                  f32 %42 = OpFAdd %41 %33 
                         Private f32* %43 = OpAccessChain %27 %22 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %22 
                                  f32 %45 = OpLoad %44 
                                  f32 %46 = OpFDiv %34 %45 
                         Private f32* %47 = OpAccessChain %9 %22 
                                              OpStore %47 %46 
                  read_only Texture2D %52 = OpLoad %51 
                              sampler %56 = OpLoad %55 
           read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                f32_3 %59 = OpLoad %27 
                                f32_2 %60 = OpVectorShuffle %59 %59 1 2 
                                f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                  f32 %63 = OpCompositeExtract %61 3 
                                              OpStore %48 %63 
                         Private f32* %64 = OpAccessChain %27 %22 
                                  f32 %65 = OpLoad %64 
                                  f32 %66 = OpExtInst %1 8 %65 
                         Private f32* %67 = OpAccessChain %27 %22 
                                              OpStore %67 %66 
                         Private f32* %69 = OpAccessChain %27 %22 
                                  f32 %70 = OpLoad %69 
                                  f32 %71 = OpFMul %70 %33 
                                              OpStore %68 %71 
                         Private f32* %74 = OpAccessChain %27 %22 
                                  f32 %75 = OpLoad %74 
                                  i32 %76 = OpConvertFToS %75 
                                              OpStore %73 %76 
                                  f32 %80 = OpLoad %68 
                                  f32 %81 = OpLoad %68 
                                  f32 %82 = OpFNegate %81 
                                 bool %83 = OpFOrdGreaterThanEqual %80 %82 
                                              OpStore %79 %83 
                                  f32 %84 = OpLoad %68 
                                  f32 %85 = OpExtInst %1 4 %84 
                                  f32 %86 = OpExtInst %1 10 %85 
                                              OpStore %68 %86 
                                 bool %87 = OpLoad %79 
                                              OpSelectionMerge %91 None 
                                              OpBranchConditional %87 %90 %93 
                                      %90 = OpLabel 
                                  f32 %92 = OpLoad %68 
                                              OpStore %89 %92 
                                              OpBranch %91 
                                      %93 = OpLabel 
                                  f32 %94 = OpLoad %68 
                                  f32 %95 = OpFNegate %94 
                                              OpStore %89 %95 
                                              OpBranch %91 
                                      %91 = OpLabel 
                                  f32 %96 = OpLoad %89 
                                              OpStore %68 %96 
                                  f32 %98 = OpLoad %68 
                                bool %100 = OpFOrdEqual %98 %99 
                                              OpStore %97 %100 
                                 i32 %102 = OpLoad %73 
                                 i32 %104 = OpIAdd %102 %103 
                                              OpStore %101 %104 
                                bool %105 = OpLoad %97 
                                 i32 %106 = OpLoad %73 
                                 i32 %107 = OpLoad %101 
                                 i32 %108 = OpSelect %105 %106 %107 
                                              OpStore %73 %108 
                                 i32 %110 = OpLoad %73 
                                 i32 %112 = OpIAdd %110 %111 
                                              OpStore %109 %112 
                                 i32 %113 = OpLoad %73 
                                 f32 %114 = OpConvertSToF %113 
                        Private f32* %115 = OpAccessChain %27 %22 
                                              OpStore %115 %114 
                        Private f32* %117 = OpAccessChain %9 %22 
                                 f32 %118 = OpLoad %117 
                        Private f32* %119 = OpAccessChain %27 %22 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFMul %118 %120 
                        Private f32* %122 = OpAccessChain %116 %22 
                                              OpStore %122 %121 
                                 i32 %123 = OpLoad %109 
                                 f32 %124 = OpConvertSToF %123 
                        Private f32* %125 = OpAccessChain %27 %22 
                                              OpStore %125 %124 
                        Private f32* %126 = OpAccessChain %9 %22 
                                 f32 %127 = OpLoad %126 
                        Private f32* %128 = OpAccessChain %27 %22 
                                 f32 %129 = OpLoad %128 
                                 f32 %130 = OpFMul %127 %129 
                        Private f32* %131 = OpAccessChain %116 %16 
                                              OpStore %131 %130 
                               f32_2 %132 = OpLoad vs_TEXCOORD0 
                               f32_2 %133 = OpVectorShuffle %132 %132 1 1 
                               f32_4 %134 = OpLoad %116 
                               f32_4 %135 = OpVectorShuffle %134 %133 0 4 2 5 
                                              OpStore %116 %135 
                 read_only Texture2D %137 = OpLoad %136 
                             sampler %139 = OpLoad %138 
          read_only Texture2DSampled %140 = OpSampledImage %137 %139 
                               f32_4 %141 = OpLoad %116 
                               f32_2 %142 = OpVectorShuffle %141 %141 2 3 
                               f32_4 %143 = OpImageSampleImplicitLod %140 %142 
                                 f32 %144 = OpCompositeExtract %143 3 
                        Private f32* %145 = OpAccessChain %9 %22 
                                              OpStore %145 %144 
                 read_only Texture2D %146 = OpLoad %136 
                             sampler %147 = OpLoad %138 
          read_only Texture2DSampled %148 = OpSampledImage %146 %147 
                               f32_4 %149 = OpLoad %116 
                               f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                               f32_4 %151 = OpImageSampleImplicitLod %148 %150 
                                 f32 %152 = OpCompositeExtract %151 3 
                        Private f32* %153 = OpAccessChain %27 %22 
                                              OpStore %153 %152 
                               f32_3 %154 = OpLoad %27 
                               f32_2 %155 = OpVectorShuffle %154 %154 0 0 
                               f32_2 %159 = OpFMul %155 %158 
                               f32_3 %160 = OpLoad %27 
                               f32_3 %161 = OpVectorShuffle %160 %159 3 1 4 
                                              OpStore %27 %161 
                                 f32 %162 = OpLoad %48 
                                 f32 %164 = OpFMul %162 %163 
                        Private f32* %165 = OpAccessChain %27 %22 
                                 f32 %166 = OpLoad %165 
                                 f32 %167 = OpFNegate %166 
                                 f32 %168 = OpFAdd %164 %167 
                        Private f32* %169 = OpAccessChain %27 %22 
                                              OpStore %169 %168 
                                 f32 %170 = OpLoad %48 
                                 f32 %171 = OpFMul %170 %163 
                        Private f32* %172 = OpAccessChain %27 %16 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpFAdd %171 %173 
                        Private f32* %175 = OpAccessChain %9 %62 
                                              OpStore %175 %174 
                        Private f32* %176 = OpAccessChain %9 %22 
                                 f32 %177 = OpLoad %176 
                                 f32 %178 = OpFNegate %177 
                                 f32 %180 = OpFMul %178 %179 
                        Private f32* %181 = OpAccessChain %27 %22 
                                 f32 %182 = OpLoad %181 
                                 f32 %183 = OpFAdd %180 %182 
                        Private f32* %185 = OpAccessChain %9 %184 
                                              OpStore %185 %183 
                        Private f32* %186 = OpAccessChain %9 %22 
                                 f32 %187 = OpLoad %186 
                                 f32 %189 = OpFMul %187 %188 
                        Private f32* %190 = OpAccessChain %9 %22 
                                              OpStore %190 %189 
                                 f32 %191 = OpLoad %48 
                                 f32 %192 = OpFMul %191 %163 
                        Private f32* %193 = OpAccessChain %9 %22 
                                 f32 %194 = OpLoad %193 
                                 f32 %195 = OpFAdd %192 %194 
                        Private f32* %196 = OpAccessChain %9 %22 
                                              OpStore %196 %195 
                               f32_4 %199 = OpLoad %9 
                               f32_3 %200 = OpVectorShuffle %199 %199 0 1 3 
                               f32_3 %205 = OpFAdd %200 %204 
                               f32_4 %206 = OpLoad %198 
                               f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                              OpStore %198 %207 
                               f32_2 %208 = OpLoad vs_TEXCOORD0 
                               f32_2 %210 = OpFMul %208 %209 
                               f32_2 %212 = OpFAdd %210 %211 
                               f32_4 %213 = OpLoad %9 
                               f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                              OpStore %9 %214 
                 read_only Texture2D %215 = OpLoad %51 
                             sampler %216 = OpLoad %55 
          read_only Texture2DSampled %217 = OpSampledImage %215 %216 
                               f32_4 %218 = OpLoad %9 
                               f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                               f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                 f32 %221 = OpCompositeExtract %220 3 
                        Private f32* %222 = OpAccessChain %9 %22 
                                              OpStore %222 %221 
                        Private f32* %223 = OpAccessChain %9 %22 
                                 f32 %224 = OpLoad %223 
                                 f32 %226 = OpFAdd %224 %225 
                        Private f32* %227 = OpAccessChain %9 %22 
                                              OpStore %227 %226 
                        Private f32* %228 = OpAccessChain %9 %22 
                                 f32 %229 = OpLoad %228 
                                 f32 %230 = OpFMul %229 %163 
                         Output f32* %232 = OpAccessChain %198 %62 
                                              OpStore %232 %230 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
int u_xlati3;
float u_xlat6;
int u_xlati6;
bool u_xlatb6;
int u_xlati9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.z + -0.5;
    u_xlat3.xyz = vs_TEXCOORD0.xxy * vec3(0.5, 0.5, 1.0);
    u_xlat3.x = u_xlat3.x * u_xlat0.x + 0.5;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat1 = texture(_MainTex, u_xlat3.yz);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat6 = u_xlat3.x * 0.5;
    u_xlati3 = int(u_xlat3.x);
    u_xlatb9 = u_xlat6>=(-u_xlat6);
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
    u_xlatb6 = u_xlat6==0.0;
    u_xlati9 = u_xlati3 + int(0xFFFFFFFFu);
    u_xlati3 = (u_xlatb6) ? u_xlati3 : u_xlati9;
    u_xlati6 = u_xlati3 + 1;
    u_xlat3.x = float(u_xlati3);
    u_xlat2.x = u_xlat0.x * u_xlat3.x;
    u_xlat3.x = float(u_xlati6);
    u_xlat2.z = u_xlat0.x * u_xlat3.x;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat0 = texture(_SecondTex, u_xlat2.zw);
    u_xlat2 = texture(_SecondTex, u_xlat2.xy);
    u_xlat0.xy = u_xlat2.ww * vec2(0.390625, 1.984375);
    u_xlat0.x = u_xlat1.w * 1.15625 + (-u_xlat0.x);
    u_xlat3.x = u_xlat1.w * 1.15625 + u_xlat0.y;
    u_xlat1.z = u_xlat3.x + -1.06861997;
    u_xlat0.x = (-u_xlat0.w) * 0.8125 + u_xlat0.x;
    u_xlat3.x = u_xlat0.w * 1.59375;
    u_xlat0.y = u_xlat1.w * 1.15625 + u_xlat3.x;
    u_xlat1.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 261
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %30 %227 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %10 0 Offset 10 
                                              OpDecorate %10 Block 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate %51 DescriptorSet 51 
                                              OpDecorate %51 Binding 51 
                                              OpDecorate %55 DescriptorSet 55 
                                              OpDecorate %55 Binding 55 
                                              OpDecorate %136 DescriptorSet 136 
                                              OpDecorate %136 Binding 136 
                                              OpDecorate %138 DescriptorSet 138 
                                              OpDecorate %138 Binding 138 
                                              OpDecorate %227 Location 227 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeStruct %7 
                                      %11 = OpTypePointer Uniform %10 
             Uniform struct {f32_4;}* %12 = OpVariable Uniform 
                                      %13 = OpTypeInt 32 1 
                                  i32 %14 = OpConstant 0 
                                      %15 = OpTypeInt 32 0 
                                  u32 %16 = OpConstant 2 
                                      %17 = OpTypePointer Uniform %6 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  u32 %22 = OpConstant 0 
                                      %23 = OpTypePointer Private %6 
                                      %25 = OpTypeVector %6 3 
                                      %26 = OpTypePointer Private %25 
                       Private f32_3* %27 = OpVariable Private 
                                      %28 = OpTypeVector %6 2 
                                      %29 = OpTypePointer Input %28 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %33 = OpConstant 3.674022E-40 
                                  f32 %34 = OpConstant 3.674022E-40 
                                f32_3 %35 = OpConstantComposite %33 %33 %34 
                         Private f32* %48 = OpVariable Private 
                                      %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %50 = OpTypePointer UniformConstant %49 
 UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                      %53 = OpTypeSampler 
                                      %54 = OpTypePointer UniformConstant %53 
             UniformConstant sampler* %55 = OpVariable UniformConstant 
                                      %57 = OpTypeSampledImage %49 
                                  u32 %62 = OpConstant 3 
                         Private f32* %68 = OpVariable Private 
                                      %72 = OpTypePointer Private %13 
                         Private i32* %73 = OpVariable Private 
                                      %77 = OpTypeBool 
                                      %78 = OpTypePointer Private %77 
                        Private bool* %79 = OpVariable Private 
                                      %88 = OpTypePointer Function %6 
                        Private bool* %97 = OpVariable Private 
                                  f32 %99 = OpConstant 3.674022E-40 
                        Private i32* %101 = OpVariable Private 
                                 i32 %103 = OpConstant -1 
                        Private i32* %109 = OpVariable Private 
                                 i32 %111 = OpConstant 1 
                      Private f32_4* %116 = OpVariable Private 
UniformConstant read_only Texture2D* %136 = OpVariable UniformConstant 
            UniformConstant sampler* %138 = OpVariable UniformConstant 
                                 f32 %156 = OpConstant 3.674022E-40 
                                 f32 %157 = OpConstant 3.674022E-40 
                               f32_2 %158 = OpConstantComposite %156 %157 
                                 f32 %163 = OpConstant 3.674022E-40 
                                 f32 %179 = OpConstant 3.674022E-40 
                                 u32 %184 = OpConstant 1 
                                 f32 %188 = OpConstant 3.674022E-40 
                                 f32 %199 = OpConstant 3.674022E-40 
                                 f32 %200 = OpConstant 3.674022E-40 
                                 f32 %201 = OpConstant 3.674022E-40 
                               f32_3 %202 = OpConstantComposite %199 %200 %201 
                                 f32 %208 = OpConstant 3.674022E-40 
                               f32_3 %209 = OpConstantComposite %208 %208 %208 
                                 f32 %211 = OpConstant 3.674022E-40 
                               f32_3 %212 = OpConstantComposite %211 %211 %211 
                                 f32 %221 = OpConstant 3.674022E-40 
                               f32_3 %222 = OpConstantComposite %221 %221 %221 
                                     %226 = OpTypePointer Output %7 
                       Output f32_4* %227 = OpVariable Output 
                               f32_2 %236 = OpConstantComposite %33 %34 
                               f32_2 %238 = OpConstantComposite %33 %99 
                                 f32 %252 = OpConstant 3.674022E-40 
                                     %258 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function f32* %89 = OpVariable Function 
                         Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                  f32 %19 = OpLoad %18 
                                  f32 %21 = OpFAdd %19 %20 
                         Private f32* %24 = OpAccessChain %9 %22 
                                              OpStore %24 %21 
                                f32_2 %31 = OpLoad vs_TEXCOORD0 
                                f32_3 %32 = OpVectorShuffle %31 %31 0 0 1 
                                f32_3 %36 = OpFMul %32 %35 
                                              OpStore %27 %36 
                         Private f32* %37 = OpAccessChain %27 %22 
                                  f32 %38 = OpLoad %37 
                         Private f32* %39 = OpAccessChain %9 %22 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpFMul %38 %40 
                                  f32 %42 = OpFAdd %41 %33 
                         Private f32* %43 = OpAccessChain %27 %22 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %22 
                                  f32 %45 = OpLoad %44 
                                  f32 %46 = OpFDiv %34 %45 
                         Private f32* %47 = OpAccessChain %9 %22 
                                              OpStore %47 %46 
                  read_only Texture2D %52 = OpLoad %51 
                              sampler %56 = OpLoad %55 
           read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                f32_3 %59 = OpLoad %27 
                                f32_2 %60 = OpVectorShuffle %59 %59 1 2 
                                f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                  f32 %63 = OpCompositeExtract %61 3 
                                              OpStore %48 %63 
                         Private f32* %64 = OpAccessChain %27 %22 
                                  f32 %65 = OpLoad %64 
                                  f32 %66 = OpExtInst %1 8 %65 
                         Private f32* %67 = OpAccessChain %27 %22 
                                              OpStore %67 %66 
                         Private f32* %69 = OpAccessChain %27 %22 
                                  f32 %70 = OpLoad %69 
                                  f32 %71 = OpFMul %70 %33 
                                              OpStore %68 %71 
                         Private f32* %74 = OpAccessChain %27 %22 
                                  f32 %75 = OpLoad %74 
                                  i32 %76 = OpConvertFToS %75 
                                              OpStore %73 %76 
                                  f32 %80 = OpLoad %68 
                                  f32 %81 = OpLoad %68 
                                  f32 %82 = OpFNegate %81 
                                 bool %83 = OpFOrdGreaterThanEqual %80 %82 
                                              OpStore %79 %83 
                                  f32 %84 = OpLoad %68 
                                  f32 %85 = OpExtInst %1 4 %84 
                                  f32 %86 = OpExtInst %1 10 %85 
                                              OpStore %68 %86 
                                 bool %87 = OpLoad %79 
                                              OpSelectionMerge %91 None 
                                              OpBranchConditional %87 %90 %93 
                                      %90 = OpLabel 
                                  f32 %92 = OpLoad %68 
                                              OpStore %89 %92 
                                              OpBranch %91 
                                      %93 = OpLabel 
                                  f32 %94 = OpLoad %68 
                                  f32 %95 = OpFNegate %94 
                                              OpStore %89 %95 
                                              OpBranch %91 
                                      %91 = OpLabel 
                                  f32 %96 = OpLoad %89 
                                              OpStore %68 %96 
                                  f32 %98 = OpLoad %68 
                                bool %100 = OpFOrdEqual %98 %99 
                                              OpStore %97 %100 
                                 i32 %102 = OpLoad %73 
                                 i32 %104 = OpIAdd %102 %103 
                                              OpStore %101 %104 
                                bool %105 = OpLoad %97 
                                 i32 %106 = OpLoad %73 
                                 i32 %107 = OpLoad %101 
                                 i32 %108 = OpSelect %105 %106 %107 
                                              OpStore %73 %108 
                                 i32 %110 = OpLoad %73 
                                 i32 %112 = OpIAdd %110 %111 
                                              OpStore %109 %112 
                                 i32 %113 = OpLoad %73 
                                 f32 %114 = OpConvertSToF %113 
                        Private f32* %115 = OpAccessChain %27 %22 
                                              OpStore %115 %114 
                        Private f32* %117 = OpAccessChain %9 %22 
                                 f32 %118 = OpLoad %117 
                        Private f32* %119 = OpAccessChain %27 %22 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFMul %118 %120 
                        Private f32* %122 = OpAccessChain %116 %22 
                                              OpStore %122 %121 
                                 i32 %123 = OpLoad %109 
                                 f32 %124 = OpConvertSToF %123 
                        Private f32* %125 = OpAccessChain %27 %22 
                                              OpStore %125 %124 
                        Private f32* %126 = OpAccessChain %9 %22 
                                 f32 %127 = OpLoad %126 
                        Private f32* %128 = OpAccessChain %27 %22 
                                 f32 %129 = OpLoad %128 
                                 f32 %130 = OpFMul %127 %129 
                        Private f32* %131 = OpAccessChain %116 %16 
                                              OpStore %131 %130 
                               f32_2 %132 = OpLoad vs_TEXCOORD0 
                               f32_2 %133 = OpVectorShuffle %132 %132 1 1 
                               f32_4 %134 = OpLoad %116 
                               f32_4 %135 = OpVectorShuffle %134 %133 0 4 2 5 
                                              OpStore %116 %135 
                 read_only Texture2D %137 = OpLoad %136 
                             sampler %139 = OpLoad %138 
          read_only Texture2DSampled %140 = OpSampledImage %137 %139 
                               f32_4 %141 = OpLoad %116 
                               f32_2 %142 = OpVectorShuffle %141 %141 2 3 
                               f32_4 %143 = OpImageSampleImplicitLod %140 %142 
                                 f32 %144 = OpCompositeExtract %143 3 
                        Private f32* %145 = OpAccessChain %9 %22 
                                              OpStore %145 %144 
                 read_only Texture2D %146 = OpLoad %136 
                             sampler %147 = OpLoad %138 
          read_only Texture2DSampled %148 = OpSampledImage %146 %147 
                               f32_4 %149 = OpLoad %116 
                               f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                               f32_4 %151 = OpImageSampleImplicitLod %148 %150 
                                 f32 %152 = OpCompositeExtract %151 3 
                        Private f32* %153 = OpAccessChain %27 %22 
                                              OpStore %153 %152 
                               f32_3 %154 = OpLoad %27 
                               f32_2 %155 = OpVectorShuffle %154 %154 0 0 
                               f32_2 %159 = OpFMul %155 %158 
                               f32_3 %160 = OpLoad %27 
                               f32_3 %161 = OpVectorShuffle %160 %159 3 1 4 
                                              OpStore %27 %161 
                                 f32 %162 = OpLoad %48 
                                 f32 %164 = OpFMul %162 %163 
                        Private f32* %165 = OpAccessChain %27 %22 
                                 f32 %166 = OpLoad %165 
                                 f32 %167 = OpFNegate %166 
                                 f32 %168 = OpFAdd %164 %167 
                        Private f32* %169 = OpAccessChain %27 %22 
                                              OpStore %169 %168 
                                 f32 %170 = OpLoad %48 
                                 f32 %171 = OpFMul %170 %163 
                        Private f32* %172 = OpAccessChain %27 %16 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpFAdd %171 %173 
                        Private f32* %175 = OpAccessChain %9 %62 
                                              OpStore %175 %174 
                        Private f32* %176 = OpAccessChain %9 %22 
                                 f32 %177 = OpLoad %176 
                                 f32 %178 = OpFNegate %177 
                                 f32 %180 = OpFMul %178 %179 
                        Private f32* %181 = OpAccessChain %27 %22 
                                 f32 %182 = OpLoad %181 
                                 f32 %183 = OpFAdd %180 %182 
                        Private f32* %185 = OpAccessChain %9 %184 
                                              OpStore %185 %183 
                        Private f32* %186 = OpAccessChain %9 %22 
                                 f32 %187 = OpLoad %186 
                                 f32 %189 = OpFMul %187 %188 
                        Private f32* %190 = OpAccessChain %9 %22 
                                              OpStore %190 %189 
                                 f32 %191 = OpLoad %48 
                                 f32 %192 = OpFMul %191 %163 
                        Private f32* %193 = OpAccessChain %9 %22 
                                 f32 %194 = OpLoad %193 
                                 f32 %195 = OpFAdd %192 %194 
                        Private f32* %196 = OpAccessChain %9 %22 
                                              OpStore %196 %195 
                               f32_4 %197 = OpLoad %9 
                               f32_3 %198 = OpVectorShuffle %197 %197 0 1 3 
                               f32_3 %203 = OpFAdd %198 %202 
                               f32_4 %204 = OpLoad %116 
                               f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
                                              OpStore %116 %205 
                               f32_4 %206 = OpLoad %116 
                               f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                               f32_3 %210 = OpFMul %207 %209 
                               f32_3 %213 = OpFAdd %210 %212 
                               f32_4 %214 = OpLoad %9 
                               f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                              OpStore %9 %215 
                               f32_4 %216 = OpLoad %116 
                               f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                               f32_4 %218 = OpLoad %9 
                               f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                               f32_3 %220 = OpFMul %217 %219 
                               f32_3 %223 = OpFAdd %220 %222 
                               f32_4 %224 = OpLoad %9 
                               f32_4 %225 = OpVectorShuffle %224 %223 4 5 6 3 
                                              OpStore %9 %225 
                               f32_4 %228 = OpLoad %9 
                               f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                               f32_4 %230 = OpLoad %116 
                               f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                               f32_3 %232 = OpFMul %229 %231 
                               f32_4 %233 = OpLoad %227 
                               f32_4 %234 = OpVectorShuffle %233 %232 4 5 6 3 
                                              OpStore %227 %234 
                               f32_2 %235 = OpLoad vs_TEXCOORD0 
                               f32_2 %237 = OpFMul %235 %236 
                               f32_2 %239 = OpFAdd %237 %238 
                               f32_4 %240 = OpLoad %9 
                               f32_4 %241 = OpVectorShuffle %240 %239 4 5 2 3 
                                              OpStore %9 %241 
                 read_only Texture2D %242 = OpLoad %51 
                             sampler %243 = OpLoad %55 
          read_only Texture2DSampled %244 = OpSampledImage %242 %243 
                               f32_4 %245 = OpLoad %9 
                               f32_2 %246 = OpVectorShuffle %245 %245 0 1 
                               f32_4 %247 = OpImageSampleImplicitLod %244 %246 
                                 f32 %248 = OpCompositeExtract %247 3 
                        Private f32* %249 = OpAccessChain %9 %22 
                                              OpStore %249 %248 
                        Private f32* %250 = OpAccessChain %9 %22 
                                 f32 %251 = OpLoad %250 
                                 f32 %253 = OpFAdd %251 %252 
                        Private f32* %254 = OpAccessChain %9 %22 
                                              OpStore %254 %253 
                        Private f32* %255 = OpAccessChain %9 %22 
                                 f32 %256 = OpLoad %255 
                                 f32 %257 = OpFMul %256 %163 
                         Output f32* %259 = OpAccessChain %227 %62 
                                              OpStore %259 %257 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_NV12_To_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 495367
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat1.yxx * vec3(1.59375, 0.390625, 1.984375);
    u_xlat2 = u_xlat0.w * 1.15625 + (-u_xlat0.y);
    u_xlat0.xz = u_xlat0.ww * vec2(1.15625, 1.15625) + u_xlat0.xz;
    SV_Target0.xz = u_xlat0.xz + vec2(-0.872539997, -1.06861997);
    u_xlat0.x = (-u_xlat1.y) * 0.8125 + u_xlat2;
    SV_Target0.y = u_xlat0.x + 0.531369984;
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
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
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
                                             OpEntryPoint Fragment %4 "main" %22 %71 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %71 Location 71 
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
                                     %31 = OpTypePointer Private %20 
                      Private f32_2* %32 = OpVariable Private 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
            UniformConstant sampler* %35 = OpVariable UniformConstant 
                                     %41 = OpTypeVector %6 3 
                                     %42 = OpTypePointer Private %41 
                      Private f32_3* %43 = OpVariable Private 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                               f32_3 %49 = OpConstantComposite %46 %47 %48 
                                 f32 %53 = OpConstant 3.674022E-40 
                                 u32 %55 = OpConstant 1 
                               f32_2 %63 = OpConstantComposite %53 %53 
                                     %70 = OpTypePointer Output %7 
                       Output f32_4* %71 = OpVariable Output 
                                 f32 %74 = OpConstant 3.674022E-40 
                                 f32 %75 = OpConstant 3.674022E-40 
                               f32_2 %76 = OpConstantComposite %74 %75 
                                 f32 %83 = OpConstant 3.674022E-40 
                                 f32 %91 = OpConstant 3.674022E-40 
                                     %93 = OpTypePointer Output %6 
                                 f32 %95 = OpConstant 3.674022E-40 
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
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %36 = OpLoad %35 
          read_only Texture2DSampled %37 = OpSampledImage %34 %36 
                               f32_2 %38 = OpLoad vs_TEXCOORD0 
                               f32_4 %39 = OpImageSampleImplicitLod %37 %38 
                               f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                             OpStore %32 %40 
                               f32_2 %44 = OpLoad %32 
                               f32_3 %45 = OpVectorShuffle %44 %44 1 0 0 
                               f32_3 %50 = OpFMul %45 %49 
                                             OpStore %43 %50 
                        Private f32* %51 = OpAccessChain %9 %28 
                                 f32 %52 = OpLoad %51 
                                 f32 %54 = OpFMul %52 %53 
                        Private f32* %56 = OpAccessChain %43 %55 
                                 f32 %57 = OpLoad %56 
                                 f32 %58 = OpFNegate %57 
                                 f32 %59 = OpFAdd %54 %58 
                        Private f32* %60 = OpAccessChain %32 %28 
                                             OpStore %60 %59 
                               f32_4 %61 = OpLoad %9 
                               f32_2 %62 = OpVectorShuffle %61 %61 0 0 
                               f32_2 %64 = OpFMul %62 %63 
                               f32_3 %65 = OpLoad %43 
                               f32_2 %66 = OpVectorShuffle %65 %65 0 2 
                               f32_2 %67 = OpFAdd %64 %66 
                               f32_4 %68 = OpLoad %9 
                               f32_4 %69 = OpVectorShuffle %68 %67 4 1 2 5 
                                             OpStore %9 %69 
                               f32_4 %72 = OpLoad %9 
                               f32_2 %73 = OpVectorShuffle %72 %72 0 3 
                               f32_2 %77 = OpFAdd %73 %76 
                               f32_4 %78 = OpLoad %71 
                               f32_4 %79 = OpVectorShuffle %78 %77 4 1 5 3 
                                             OpStore %71 %79 
                        Private f32* %80 = OpAccessChain %32 %55 
                                 f32 %81 = OpLoad %80 
                                 f32 %82 = OpFNegate %81 
                                 f32 %84 = OpFMul %82 %83 
                        Private f32* %85 = OpAccessChain %32 %28 
                                 f32 %86 = OpLoad %85 
                                 f32 %87 = OpFAdd %84 %86 
                        Private f32* %88 = OpAccessChain %9 %28 
                                             OpStore %88 %87 
                        Private f32* %89 = OpAccessChain %9 %28 
                                 f32 %90 = OpLoad %89 
                                 f32 %92 = OpFAdd %90 %91 
                         Output f32* %94 = OpAccessChain %71 %55 
                                             OpStore %94 %92 
                         Output f32* %96 = OpAccessChain %71 %26 
                                             OpStore %96 %95 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat1.yxx * vec3(1.59375, 0.390625, 1.984375);
    u_xlat3 = u_xlat0.w * 1.15625 + (-u_xlat0.y);
    u_xlat0.xz = u_xlat0.ww * vec2(1.15625, 1.15625) + u_xlat0.xz;
    u_xlat2.xz = u_xlat0.xz + vec2(-0.872539997, -1.06861997);
    u_xlat0.x = (-u_xlat1.y) * 0.8125 + u_xlat3;
    u_xlat2.y = u_xlat0.x + 0.531369984;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
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
                                             OpEntryPoint Fragment %4 "main" %22 %111 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %111 Location 111 
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
                                     %31 = OpTypePointer Private %20 
                      Private f32_2* %32 = OpVariable Private 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
            UniformConstant sampler* %35 = OpVariable UniformConstant 
                                     %41 = OpTypeVector %6 3 
                                     %42 = OpTypePointer Private %41 
                      Private f32_3* %43 = OpVariable Private 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                               f32_3 %49 = OpConstantComposite %46 %47 %48 
                                 f32 %53 = OpConstant 3.674022E-40 
                                 u32 %55 = OpConstant 1 
                               f32_2 %63 = OpConstantComposite %53 %53 
                                 f32 %72 = OpConstant 3.674022E-40 
                                 f32 %73 = OpConstant 3.674022E-40 
                               f32_2 %74 = OpConstantComposite %72 %73 
                                 f32 %81 = OpConstant 3.674022E-40 
                                 f32 %89 = OpConstant 3.674022E-40 
                                 f32 %93 = OpConstant 3.674022E-40 
                               f32_3 %94 = OpConstantComposite %93 %93 %93 
                                 f32 %96 = OpConstant 3.674022E-40 
                               f32_3 %97 = OpConstantComposite %96 %96 %96 
                                f32 %105 = OpConstant 3.674022E-40 
                              f32_3 %106 = OpConstantComposite %105 %105 %105 
                                    %110 = OpTypePointer Output %7 
                      Output f32_4* %111 = OpVariable Output 
                                f32 %118 = OpConstant 3.674022E-40 
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
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %36 = OpLoad %35 
          read_only Texture2DSampled %37 = OpSampledImage %34 %36 
                               f32_2 %38 = OpLoad vs_TEXCOORD0 
                               f32_4 %39 = OpImageSampleImplicitLod %37 %38 
                               f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                             OpStore %32 %40 
                               f32_2 %44 = OpLoad %32 
                               f32_3 %45 = OpVectorShuffle %44 %44 1 0 0 
                               f32_3 %50 = OpFMul %45 %49 
                                             OpStore %43 %50 
                        Private f32* %51 = OpAccessChain %9 %28 
                                 f32 %52 = OpLoad %51 
                                 f32 %54 = OpFMul %52 %53 
                        Private f32* %56 = OpAccessChain %43 %55 
                                 f32 %57 = OpLoad %56 
                                 f32 %58 = OpFNegate %57 
                                 f32 %59 = OpFAdd %54 %58 
                        Private f32* %60 = OpAccessChain %32 %28 
                                             OpStore %60 %59 
                               f32_4 %61 = OpLoad %9 
                               f32_2 %62 = OpVectorShuffle %61 %61 0 0 
                               f32_2 %64 = OpFMul %62 %63 
                               f32_3 %65 = OpLoad %43 
                               f32_2 %66 = OpVectorShuffle %65 %65 0 2 
                               f32_2 %67 = OpFAdd %64 %66 
                               f32_4 %68 = OpLoad %9 
                               f32_4 %69 = OpVectorShuffle %68 %67 4 1 2 5 
                                             OpStore %9 %69 
                               f32_4 %70 = OpLoad %9 
                               f32_2 %71 = OpVectorShuffle %70 %70 0 3 
                               f32_2 %75 = OpFAdd %71 %74 
                               f32_3 %76 = OpLoad %43 
                               f32_3 %77 = OpVectorShuffle %76 %75 3 1 4 
                                             OpStore %43 %77 
                        Private f32* %78 = OpAccessChain %32 %55 
                                 f32 %79 = OpLoad %78 
                                 f32 %80 = OpFNegate %79 
                                 f32 %82 = OpFMul %80 %81 
                        Private f32* %83 = OpAccessChain %32 %28 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFAdd %82 %84 
                        Private f32* %86 = OpAccessChain %9 %28 
                                             OpStore %86 %85 
                        Private f32* %87 = OpAccessChain %9 %28 
                                 f32 %88 = OpLoad %87 
                                 f32 %90 = OpFAdd %88 %89 
                        Private f32* %91 = OpAccessChain %43 %55 
                                             OpStore %91 %90 
                               f32_3 %92 = OpLoad %43 
                               f32_3 %95 = OpFMul %92 %94 
                               f32_3 %98 = OpFAdd %95 %97 
                               f32_4 %99 = OpLoad %9 
                              f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                             OpStore %9 %100 
                              f32_3 %101 = OpLoad %43 
                              f32_4 %102 = OpLoad %9 
                              f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                              f32_3 %104 = OpFMul %101 %103 
                              f32_3 %107 = OpFAdd %104 %106 
                              f32_4 %108 = OpLoad %9 
                              f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                             OpStore %9 %109 
                              f32_4 %112 = OpLoad %9 
                              f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                              f32_3 %114 = OpLoad %43 
                              f32_3 %115 = OpFMul %113 %114 
                              f32_4 %116 = OpLoad %111 
                              f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                             OpStore %111 %117 
                        Output f32* %120 = OpAccessChain %111 %26 
                                             OpStore %120 %118 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_NV12_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 556898
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_SecondTex, u_xlat0.xy);
    u_xlat0.xzw = u_xlat0.yxx * vec3(1.59375, 0.390625, 1.984375);
    u_xlat4 = u_xlat1.w * 1.15625 + (-u_xlat0.z);
    u_xlat0.xw = u_xlat1.ww * vec2(1.15625, 1.15625) + u_xlat0.xw;
    SV_Target0.xz = u_xlat0.xw + vec2(-0.872539997, -1.06861997);
    u_xlat0.x = (-u_xlat0.y) * 0.8125 + u_xlat4;
    SV_Target0.y = u_xlat0.x + 0.531369984;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 124
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %48 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %48 Location 48 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %69 DescriptorSet 69 
                                             OpDecorate %69 Binding 69 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                 f32 %18 = OpConstant 3.674022E-40 
                               f32_2 %19 = OpConstantComposite %14 %18 
                                     %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampler 
                                     %28 = OpTypePointer UniformConstant %27 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %31 = OpTypeSampledImage %23 
                                     %36 = OpTypeInt 32 0 
                                 u32 %37 = OpConstant 3 
                                 u32 %39 = OpConstant 0 
                                     %40 = OpTypePointer Private %6 
                                 f32 %44 = OpConstant 3.674022E-40 
                                     %47 = OpTypePointer Output %7 
                       Output f32_4* %48 = OpVariable Output 
                                 f32 %51 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %6 
                        Private f32* %59 = OpVariable Private 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
            UniformConstant sampler* %69 = OpVariable UniformConstant 
                                     %78 = OpTypeVector %6 3 
                                     %79 = OpTypePointer Private %78 
                      Private f32_3* %80 = OpVariable Private 
                                 f32 %83 = OpConstant 3.674022E-40 
                                 f32 %84 = OpConstant 3.674022E-40 
                                 f32 %85 = OpConstant 3.674022E-40 
                               f32_3 %86 = OpConstantComposite %83 %84 %85 
                                 u32 %90 = OpConstant 1 
                               f32_2 %98 = OpConstantComposite %51 %51 
                                f32 %108 = OpConstant 3.674022E-40 
                                f32 %116 = OpConstant 3.674022E-40 
                                f32 %117 = OpConstant 3.674022E-40 
                                f32 %118 = OpConstant 3.674022E-40 
                              f32_3 %119 = OpConstantComposite %116 %117 %118 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_2 %20 = OpFAdd %17 %19 
                               f32_4 %21 = OpLoad %9 
                               f32_4 %22 = OpVectorShuffle %21 %20 4 5 2 3 
                                             OpStore %9 %22 
                 read_only Texture2D %26 = OpLoad %25 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %32 = OpSampledImage %26 %30 
                               f32_4 %33 = OpLoad %9 
                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               f32_4 %35 = OpImageSampleImplicitLod %32 %34 
                                 f32 %38 = OpCompositeExtract %35 3 
                        Private f32* %41 = OpAccessChain %9 %39 
                                             OpStore %41 %38 
                        Private f32* %42 = OpAccessChain %9 %39 
                                 f32 %43 = OpLoad %42 
                                 f32 %45 = OpFAdd %43 %44 
                        Private f32* %46 = OpAccessChain %9 %39 
                                             OpStore %46 %45 
                        Private f32* %49 = OpAccessChain %9 %39 
                                 f32 %50 = OpLoad %49 
                                 f32 %52 = OpFMul %50 %51 
                         Output f32* %54 = OpAccessChain %48 %37 
                                             OpStore %54 %52 
                               f32_2 %55 = OpLoad vs_TEXCOORD0 
                               f32_2 %56 = OpFMul %55 %16 
                               f32_4 %57 = OpLoad %9 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 2 3 
                                             OpStore %9 %58 
                 read_only Texture2D %60 = OpLoad %25 
                             sampler %61 = OpLoad %29 
          read_only Texture2DSampled %62 = OpSampledImage %60 %61 
                               f32_4 %63 = OpLoad %9 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                               f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                 f32 %66 = OpCompositeExtract %65 3 
                                             OpStore %59 %66 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %70 = OpLoad %69 
          read_only Texture2DSampled %71 = OpSampledImage %68 %70 
                               f32_4 %72 = OpLoad %9 
                               f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                               f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                               f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                               f32_4 %76 = OpLoad %9 
                               f32_4 %77 = OpVectorShuffle %76 %75 4 5 2 3 
                                             OpStore %9 %77 
                               f32_4 %81 = OpLoad %9 
                               f32_3 %82 = OpVectorShuffle %81 %81 1 0 0 
                               f32_3 %87 = OpFMul %82 %86 
                                             OpStore %80 %87 
                                 f32 %88 = OpLoad %59 
                                 f32 %89 = OpFMul %88 %51 
                        Private f32* %91 = OpAccessChain %80 %90 
                                 f32 %92 = OpLoad %91 
                                 f32 %93 = OpFNegate %92 
                                 f32 %94 = OpFAdd %89 %93 
                        Private f32* %95 = OpAccessChain %9 %39 
                                             OpStore %95 %94 
                                 f32 %96 = OpLoad %59 
                               f32_2 %97 = OpCompositeConstruct %96 %96 
                               f32_2 %99 = OpFMul %97 %98 
                              f32_3 %100 = OpLoad %80 
                              f32_2 %101 = OpVectorShuffle %100 %100 0 2 
                              f32_2 %102 = OpFAdd %99 %101 
                              f32_4 %103 = OpLoad %9 
                              f32_4 %104 = OpVectorShuffle %103 %102 0 1 4 5 
                                             OpStore %9 %104 
                       Private f32* %105 = OpAccessChain %9 %90 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpFNegate %106 
                                f32 %109 = OpFMul %107 %108 
                       Private f32* %110 = OpAccessChain %9 %39 
                                f32 %111 = OpLoad %110 
                                f32 %112 = OpFAdd %109 %111 
                       Private f32* %113 = OpAccessChain %9 %39 
                                             OpStore %113 %112 
                              f32_4 %114 = OpLoad %9 
                              f32_3 %115 = OpVectorShuffle %114 %114 2 0 3 
                              f32_3 %120 = OpFAdd %115 %119 
                              f32_4 %121 = OpLoad %48 
                              f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                             OpStore %48 %122 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_SecondTex, u_xlat0.xy);
    u_xlat0.xzw = u_xlat0.yxx * vec3(1.59375, 0.390625, 1.984375);
    u_xlat4 = u_xlat1.w * 1.15625 + (-u_xlat0.z);
    u_xlat0.xw = u_xlat1.ww * vec2(1.15625, 1.15625) + u_xlat0.xw;
    u_xlat1.xz = u_xlat0.xw + vec2(-0.872539997, -1.06861997);
    u_xlat0.x = (-u_xlat0.y) * 0.8125 + u_xlat4;
    u_xlat1.y = u_xlat0.x + 0.531369984;
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 146
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %113 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %24 DescriptorSet 24 
                                             OpDecorate %24 Binding 24 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %113 Location 113 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                     %20 = OpTypePointer Private %6 
                        Private f32* %21 = OpVariable Private 
                                     %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %23 = OpTypePointer UniformConstant %22 
UniformConstant read_only Texture2D* %24 = OpVariable UniformConstant 
                                     %26 = OpTypeSampler 
                                     %27 = OpTypePointer UniformConstant %26 
            UniformConstant sampler* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampledImage %22 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
            UniformConstant sampler* %40 = OpVariable UniformConstant 
                                     %49 = OpTypeVector %6 3 
                                     %50 = OpTypePointer Private %49 
                      Private f32_3* %51 = OpVariable Private 
                                 f32 %54 = OpConstant 3.674022E-40 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 f32 %56 = OpConstant 3.674022E-40 
                               f32_3 %57 = OpConstantComposite %54 %55 %56 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 u32 %62 = OpConstant 1 
                                 u32 %67 = OpConstant 0 
                               f32_2 %71 = OpConstantComposite %60 %60 
                                 f32 %81 = OpConstant 3.674022E-40 
                                 f32 %89 = OpConstant 3.674022E-40 
                                 f32 %90 = OpConstant 3.674022E-40 
                                 f32 %91 = OpConstant 3.674022E-40 
                               f32_3 %92 = OpConstantComposite %89 %90 %91 
                                 f32 %95 = OpConstant 3.674022E-40 
                               f32_3 %96 = OpConstantComposite %95 %95 %95 
                                 f32 %98 = OpConstant 3.674022E-40 
                               f32_3 %99 = OpConstantComposite %98 %98 %98 
                                f32 %107 = OpConstant 3.674022E-40 
                              f32_3 %108 = OpConstantComposite %107 %107 %107 
                                    %112 = OpTypePointer Output %7 
                      Output f32_4* %113 = OpVariable Output 
                                f32 %122 = OpConstant 3.674022E-40 
                              f32_2 %123 = OpConstantComposite %14 %122 
                                f32 %137 = OpConstant 3.674022E-40 
                                    %143 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_4 %18 = OpLoad %9 
                               f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                             OpStore %9 %19 
                 read_only Texture2D %25 = OpLoad %24 
                             sampler %29 = OpLoad %28 
          read_only Texture2DSampled %31 = OpSampledImage %25 %29 
                               f32_4 %32 = OpLoad %9 
                               f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                               f32_4 %34 = OpImageSampleImplicitLod %31 %33 
                                 f32 %37 = OpCompositeExtract %34 3 
                                             OpStore %21 %37 
                 read_only Texture2D %39 = OpLoad %38 
                             sampler %41 = OpLoad %40 
          read_only Texture2DSampled %42 = OpSampledImage %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_4 %47 = OpLoad %9 
                               f32_4 %48 = OpVectorShuffle %47 %46 4 5 2 3 
                                             OpStore %9 %48 
                               f32_4 %52 = OpLoad %9 
                               f32_3 %53 = OpVectorShuffle %52 %52 1 0 0 
                               f32_3 %58 = OpFMul %53 %57 
                                             OpStore %51 %58 
                                 f32 %59 = OpLoad %21 
                                 f32 %61 = OpFMul %59 %60 
                        Private f32* %63 = OpAccessChain %51 %62 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFNegate %64 
                                 f32 %66 = OpFAdd %61 %65 
                        Private f32* %68 = OpAccessChain %9 %67 
                                             OpStore %68 %66 
                                 f32 %69 = OpLoad %21 
                               f32_2 %70 = OpCompositeConstruct %69 %69 
                               f32_2 %72 = OpFMul %70 %71 
                               f32_3 %73 = OpLoad %51 
                               f32_2 %74 = OpVectorShuffle %73 %73 0 2 
                               f32_2 %75 = OpFAdd %72 %74 
                               f32_4 %76 = OpLoad %9 
                               f32_4 %77 = OpVectorShuffle %76 %75 0 1 4 5 
                                             OpStore %9 %77 
                        Private f32* %78 = OpAccessChain %9 %62 
                                 f32 %79 = OpLoad %78 
                                 f32 %80 = OpFNegate %79 
                                 f32 %82 = OpFMul %80 %81 
                        Private f32* %83 = OpAccessChain %9 %67 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFAdd %82 %84 
                        Private f32* %86 = OpAccessChain %9 %67 
                                             OpStore %86 %85 
                               f32_4 %87 = OpLoad %9 
                               f32_3 %88 = OpVectorShuffle %87 %87 2 0 3 
                               f32_3 %93 = OpFAdd %88 %92 
                                             OpStore %51 %93 
                               f32_3 %94 = OpLoad %51 
                               f32_3 %97 = OpFMul %94 %96 
                              f32_3 %100 = OpFAdd %97 %99 
                              f32_4 %101 = OpLoad %9 
                              f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                             OpStore %9 %102 
                              f32_3 %103 = OpLoad %51 
                              f32_4 %104 = OpLoad %9 
                              f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              f32_3 %106 = OpFMul %103 %105 
                              f32_3 %109 = OpFAdd %106 %108 
                              f32_4 %110 = OpLoad %9 
                              f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                             OpStore %9 %111 
                              f32_4 %114 = OpLoad %9 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              f32_3 %116 = OpLoad %51 
                              f32_3 %117 = OpFMul %115 %116 
                              f32_4 %118 = OpLoad %113 
                              f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                             OpStore %113 %119 
                              f32_2 %120 = OpLoad vs_TEXCOORD0 
                              f32_2 %121 = OpFMul %120 %16 
                              f32_2 %124 = OpFAdd %121 %123 
                              f32_4 %125 = OpLoad %9 
                              f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
                                             OpStore %9 %126 
                read_only Texture2D %127 = OpLoad %24 
                            sampler %128 = OpLoad %28 
         read_only Texture2DSampled %129 = OpSampledImage %127 %128 
                              f32_4 %130 = OpLoad %9 
                              f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              f32_4 %132 = OpImageSampleImplicitLod %129 %131 
                                f32 %133 = OpCompositeExtract %132 3 
                       Private f32* %134 = OpAccessChain %9 %67 
                                             OpStore %134 %133 
                       Private f32* %135 = OpAccessChain %9 %67 
                                f32 %136 = OpLoad %135 
                                f32 %138 = OpFAdd %136 %137 
                       Private f32* %139 = OpAccessChain %9 %67 
                                             OpStore %139 %138 
                       Private f32* %140 = OpAccessChain %9 %67 
                                f32 %141 = OpLoad %140 
                                f32 %142 = OpFMul %141 %60 
                        Output f32* %144 = OpAccessChain %113 %36 
                                             OpStore %144 %142 
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
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
SubProgram "vulkan " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
""
}
}
}
 Pass {
  Name "Flip_P010_To_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 628868
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat0.yz = u_xlat1.xy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(64.0615845, 64.0615845, 64.0615845) + vec3(-0.0625, -0.5, -0.5);
    SV_Target0.x = dot(vec2(1.16439998, 1.79270005), u_xlat0.xz);
    SV_Target0.y = dot(vec3(1.16439998, -0.213300005, -0.532899976), u_xlat0.xyz);
    SV_Target0.z = dot(vec2(1.16439998, 2.11240005), u_xlat0.xy);
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
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 77
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
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %50 Location 50 
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
UniformConstant read_only Texture2D* %31 = OpVariable UniformConstant 
            UniformConstant sampler* %33 = OpVariable UniformConstant 
                                 f32 %42 = OpConstant 3.674022E-40 
                               f32_3 %43 = OpConstantComposite %42 %42 %42 
                                 f32 %45 = OpConstant 3.674022E-40 
                                 f32 %46 = OpConstant 3.674022E-40 
                               f32_3 %47 = OpConstantComposite %45 %46 %46 
                                     %49 = OpTypePointer Output %24 
                       Output f32_4* %50 = OpVariable Output 
                                 f32 %51 = OpConstant 3.674022E-40 
                                 f32 %52 = OpConstant 3.674022E-40 
                               f32_2 %53 = OpConstantComposite %51 %52 
                                     %57 = OpTypePointer Output %6 
                                 f32 %59 = OpConstant 3.674022E-40 
                                 f32 %60 = OpConstant 3.674022E-40 
                               f32_3 %61 = OpConstantComposite %51 %59 %60 
                                 u32 %64 = OpConstant 1 
                                 f32 %66 = OpConstant 3.674022E-40 
                               f32_2 %67 = OpConstantComposite %51 %66 
                                 u32 %71 = OpConstant 2 
                                 f32 %73 = OpConstant 3.674022E-40 
                                 u32 %74 = OpConstant 3 
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
                 read_only Texture2D %32 = OpLoad %31 
                             sampler %34 = OpLoad %33 
          read_only Texture2DSampled %35 = OpSampledImage %32 %34 
                               f32_2 %36 = OpLoad vs_TEXCOORD0 
                               f32_4 %37 = OpImageSampleImplicitLod %35 %36 
                               f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                               f32_3 %39 = OpLoad %9 
                               f32_3 %40 = OpVectorShuffle %39 %38 0 3 4 
                                             OpStore %9 %40 
                               f32_3 %41 = OpLoad %9 
                               f32_3 %44 = OpFMul %41 %43 
                               f32_3 %48 = OpFAdd %44 %47 
                                             OpStore %9 %48 
                               f32_3 %54 = OpLoad %9 
                               f32_2 %55 = OpVectorShuffle %54 %54 0 2 
                                 f32 %56 = OpDot %53 %55 
                         Output f32* %58 = OpAccessChain %50 %27 
                                             OpStore %58 %56 
                               f32_3 %62 = OpLoad %9 
                                 f32 %63 = OpDot %61 %62 
                         Output f32* %65 = OpAccessChain %50 %64 
                                             OpStore %65 %63 
                               f32_3 %68 = OpLoad %9 
                               f32_2 %69 = OpVectorShuffle %68 %68 0 1 
                                 f32 %70 = OpDot %67 %69 
                         Output f32* %72 = OpAccessChain %50 %71 
                                             OpStore %72 %70 
                         Output f32* %75 = OpAccessChain %50 %74 
                                             OpStore %75 %73 
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
  Name "Flip_P010_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 666010
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(1) uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w + -0.0627449974;
    SV_Target0.w = u_xlat0.x * 1.15625;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_SecondTex, u_xlat0.xy);
    u_xlat0.xzw = u_xlat0.yxx * vec3(1.59375, 0.390625, 1.984375);
    u_xlat4 = u_xlat1.w * 1.15625 + (-u_xlat0.z);
    u_xlat0.xw = u_xlat1.ww * vec2(1.15625, 1.15625) + u_xlat0.xw;
    SV_Target0.xz = u_xlat0.xw + vec2(-0.872539997, -1.06861997);
    u_xlat0.x = (-u_xlat0.y) * 0.8125 + u_xlat4;
    SV_Target0.y = u_xlat0.x + 0.531369984;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 96 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.674022E-40 
                                         f32 %87 = OpConstant 3.674022E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.674022E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore vs_TEXCOORD0 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 124
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %48 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %25 DescriptorSet 25 
                                             OpDecorate %25 Binding 25 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %48 Location 48 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %69 DescriptorSet 69 
                                             OpDecorate %69 Binding 69 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %14 = OpConstant 3.674022E-40 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %14 %15 
                                 f32 %18 = OpConstant 3.674022E-40 
                               f32_2 %19 = OpConstantComposite %14 %18 
                                     %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
                                     %27 = OpTypeSampler 
                                     %28 = OpTypePointer UniformConstant %27 
            UniformConstant sampler* %29 = OpVariable UniformConstant 
                                     %31 = OpTypeSampledImage %23 
                                     %36 = OpTypeInt 32 0 
                                 u32 %37 = OpConstant 3 
                                 u32 %39 = OpConstant 0 
                                     %40 = OpTypePointer Private %6 
                                 f32 %44 = OpConstant 3.674022E-40 
                                     %47 = OpTypePointer Output %7 
                       Output f32_4* %48 = OpVariable Output 
                                 f32 %51 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %6 
                        Private f32* %59 = OpVariable Private 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
            UniformConstant sampler* %69 = OpVariable UniformConstant 
                                     %78 = OpTypeVector %6 3 
                                     %79 = OpTypePointer Private %78 
                      Private f32_3* %80 = OpVariable Private 
                                 f32 %83 = OpConstant 3.674022E-40 
                                 f32 %84 = OpConstant 3.674022E-40 
                                 f32 %85 = OpConstant 3.674022E-40 
                               f32_3 %86 = OpConstantComposite %83 %84 %85 
                                 u32 %90 = OpConstant 1 
                               f32_2 %98 = OpConstantComposite %51 %51 
                                f32 %108 = OpConstant 3.674022E-40 
                                f32 %116 = OpConstant 3.674022E-40 
                                f32 %117 = OpConstant 3.674022E-40 
                                f32 %118 = OpConstant 3.674022E-40 
                              f32_3 %119 = OpConstantComposite %116 %117 %118 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %17 = OpFMul %13 %16 
                               f32_2 %20 = OpFAdd %17 %19 
                               f32_4 %21 = OpLoad %9 
                               f32_4 %22 = OpVectorShuffle %21 %20 4 5 2 3 
                                             OpStore %9 %22 
                 read_only Texture2D %26 = OpLoad %25 
                             sampler %30 = OpLoad %29 
          read_only Texture2DSampled %32 = OpSampledImage %26 %30 
                               f32_4 %33 = OpLoad %9 
                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               f32_4 %35 = OpImageSampleImplicitLod %32 %34 
                                 f32 %38 = OpCompositeExtract %35 3 
                        Private f32* %41 = OpAccessChain %9 %39 
                                             OpStore %41 %38 
                        Private f32* %42 = OpAccessChain %9 %39 
                                 f32 %43 = OpLoad %42 
                                 f32 %45 = OpFAdd %43 %44 
                        Private f32* %46 = OpAccessChain %9 %39 
                                             OpStore %46 %45 
                        Private f32* %49 = OpAccessChain %9 %39 
                                 f32 %50 = OpLoad %49 
                                 f32 %52 = OpFMul %50 %51 
                         Output f32* %54 = OpAccessChain %48 %37 
                                             OpStore %54 %52 
                               f32_2 %55 = OpLoad vs_TEXCOORD0 
                               f32_2 %56 = OpFMul %55 %16 
                               f32_4 %57 = OpLoad %9 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 2 3 
                                             OpStore %9 %58 
                 read_only Texture2D %60 = OpLoad %25 
                             sampler %61 = OpLoad %29 
          read_only Texture2DSampled %62 = OpSampledImage %60 %61 
                               f32_4 %63 = OpLoad %9 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                               f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                 f32 %66 = OpCompositeExtract %65 3 
                                             OpStore %59 %66 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %70 = OpLoad %69 
          read_only Texture2DSampled %71 = OpSampledImage %68 %70 
                               f32_4 %72 = OpLoad %9 
                               f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                               f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                               f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                               f32_4 %76 = OpLoad %9 
                               f32_4 %77 = OpVectorShuffle %76 %75 4 5 2 3 
                                             OpStore %9 %77 
                               f32_4 %81 = OpLoad %9 
                               f32_3 %82 = OpVectorShuffle %81 %81 1 0 0 
                               f32_3 %87 = OpFMul %82 %86 
                                             OpStore %80 %87 
                                 f32 %88 = OpLoad %59 
                                 f32 %89 = OpFMul %88 %51 
                        Private f32* %91 = OpAccessChain %80 %90 
                                 f32 %92 = OpLoad %91 
                                 f32 %93 = OpFNegate %92 
                                 f32 %94 = OpFAdd %89 %93 
                        Private f32* %95 = OpAccessChain %9 %39 
                                             OpStore %95 %94 
                                 f32 %96 = OpLoad %59 
                               f32_2 %97 = OpCompositeConstruct %96 %96 
                               f32_2 %99 = OpFMul %97 %98 
                              f32_3 %100 = OpLoad %80 
                              f32_2 %101 = OpVectorShuffle %100 %100 0 2 
                              f32_2 %102 = OpFAdd %99 %101 
                              f32_4 %103 = OpLoad %9 
                              f32_4 %104 = OpVectorShuffle %103 %102 0 1 4 5 
                                             OpStore %9 %104 
                       Private f32* %105 = OpAccessChain %9 %90 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpFNegate %106 
                                f32 %109 = OpFMul %107 %108 
                       Private f32* %110 = OpAccessChain %9 %39 
                                f32 %111 = OpLoad %110 
                                f32 %112 = OpFAdd %109 %111 
                       Private f32* %113 = OpAccessChain %9 %39 
                                             OpStore %113 %112 
                              f32_4 %114 = OpLoad %9 
                              f32_3 %115 = OpVectorShuffle %114 %114 2 0 3 
                              f32_3 %120 = OpFAdd %115 %119 
                              f32_4 %121 = OpLoad %48 
                              f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                             OpStore %48 %122 
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