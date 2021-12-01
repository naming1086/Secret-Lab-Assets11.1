//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Knife/SpecSmoothnessBlitter" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 38995
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
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.x = u_xlat0.w;
    SV_Target0.yzw = vec3(0.0, 0.0, 1.0);
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
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %86 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpMemberDecorate %84 0 BuiltIn 84 
                                                     OpMemberDecorate %84 1 BuiltIn 84 
                                                     OpMemberDecorate %84 2 BuiltIn 84 
                                                     OpDecorate %84 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                                         i32 %58 = OpConstant 3 
                              Private f32_4* %62 = OpVariable Private 
                                         u32 %82 = OpConstant 1 
                                             %83 = OpTypeArray %6 %82 
                                             %84 = OpTypeStruct %13 %6 %83 
                                             %85 = OpTypePointer Output %84 
        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
                                             %94 = OpTypePointer Output %13 
                                             %96 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %57 = OpLoad %33 
                              Uniform f32_4* %59 = OpAccessChain %20 %38 %58 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFAdd %57 %60 
                                                     OpStore %33 %61 
                                       f32_4 %63 = OpLoad %33 
                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                              Uniform f32_4* %65 = OpAccessChain %20 %39 %39 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpFMul %64 %66 
                                                     OpStore %62 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %39 %38 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %62 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %62 %74 
                              Uniform f32_4* %75 = OpAccessChain %20 %39 %22 
                                       f32_4 %76 = OpLoad %75 
                                       f32_4 %77 = OpLoad %33 
                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                       f32_4 %79 = OpFMul %76 %78 
                                       f32_4 %80 = OpLoad %62 
                                       f32_4 %81 = OpFAdd %79 %80 
                                                     OpStore %62 %81 
                              Uniform f32_4* %87 = OpAccessChain %20 %39 %58 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %62 
                                       f32_4 %93 = OpFAdd %91 %92 
                               Output f32_4* %95 = OpAccessChain %86 %38 
                                                     OpStore %95 %93 
                                 Output f32* %97 = OpAccessChain %86 %38 %82 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %86 %38 %82 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 41
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %29 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %29 Location 29 
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
                                 u32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Output %6 
                                     %34 = OpTypeVector %6 3 
                                 f32 %35 = OpConstant 3.674022E-40 
                                 f32 %36 = OpConstant 3.674022E-40 
                               f32_3 %37 = OpConstantComposite %35 %35 %36 
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
                         Output f32* %33 = OpAccessChain %29 %31 
                                             OpStore %33 %30 
                               f32_4 %38 = OpLoad %29 
                               f32_4 %39 = OpVectorShuffle %38 %37 0 4 5 6 
                                             OpStore %29 %39 
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
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 95164
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
UNITY_LOCATION(1) uniform  sampler2D _Alpha;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0 = texture(_Alpha, vs_TEXCOORD0.xy);
    SV_Target0.w = u_xlat0.x;
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
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %86 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpMemberDecorate %84 0 BuiltIn 84 
                                                     OpMemberDecorate %84 1 BuiltIn 84 
                                                     OpMemberDecorate %84 2 BuiltIn 84 
                                                     OpDecorate %84 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                                         i32 %58 = OpConstant 3 
                              Private f32_4* %62 = OpVariable Private 
                                         u32 %82 = OpConstant 1 
                                             %83 = OpTypeArray %6 %82 
                                             %84 = OpTypeStruct %13 %6 %83 
                                             %85 = OpTypePointer Output %84 
        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
                                             %94 = OpTypePointer Output %13 
                                             %96 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore vs_TEXCOORD0 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %57 = OpLoad %33 
                              Uniform f32_4* %59 = OpAccessChain %20 %38 %58 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFAdd %57 %60 
                                                     OpStore %33 %61 
                                       f32_4 %63 = OpLoad %33 
                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                              Uniform f32_4* %65 = OpAccessChain %20 %39 %39 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpFMul %64 %66 
                                                     OpStore %62 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %39 %38 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %62 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %62 %74 
                              Uniform f32_4* %75 = OpAccessChain %20 %39 %22 
                                       f32_4 %76 = OpLoad %75 
                                       f32_4 %77 = OpLoad %33 
                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                       f32_4 %79 = OpFMul %76 %78 
                                       f32_4 %80 = OpLoad %62 
                                       f32_4 %81 = OpFAdd %79 %80 
                                                     OpStore %62 %81 
                              Uniform f32_4* %87 = OpAccessChain %20 %39 %58 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %62 
                                       f32_4 %93 = OpFAdd %91 %92 
                               Output f32_4* %95 = OpAccessChain %86 %38 
                                                     OpStore %95 %93 
                                 Output f32* %97 = OpAccessChain %86 %38 %82 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %86 %38 %82 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 50
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %34 DescriptorSet 34 
                                             OpDecorate %34 Binding 34 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
            UniformConstant sampler* %34 = OpVariable UniformConstant 
                                     %39 = OpTypeInt 32 0 
                                 u32 %40 = OpConstant 0 
                                     %42 = OpTypePointer Private %6 
                                 u32 %46 = OpConstant 3 
                                     %47 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %35 = OpLoad %34 
          read_only Texture2DSampled %36 = OpSampledImage %33 %35 
                               f32_2 %37 = OpLoad vs_TEXCOORD0 
                               f32_4 %38 = OpImageSampleImplicitLod %36 %37 
                                 f32 %41 = OpCompositeExtract %38 0 
                        Private f32* %43 = OpAccessChain %9 %40 
                                             OpStore %43 %41 
                        Private f32* %44 = OpAccessChain %9 %40 
                                 f32 %45 = OpLoad %44 
                         Output f32* %48 = OpAccessChain %28 %46 
                                             OpStore %48 %45 
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