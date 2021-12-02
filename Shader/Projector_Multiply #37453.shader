//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Projector/Multiply" {
Properties {
_ShadowTex ("Cookie", 2D) = "gray" { }
_FalloffTex ("FallOff", 2D) = "white" { }
}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" }
  Blend DstColor Zero, DstColor Zero
  ColorMask RGB 0
  ZWrite Off
  Offset -1, -1
  GpuProgramID 10212
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
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in  vec4 in_POSITION0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
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
UNITY_LOCATION(0) uniform  sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform  sampler2D _FalloffTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0 = texture(_ShadowTex, u_xlat0.xy);
    u_xlat0 = u_xlat0 * vec4(1.0, 1.0, 1.0, -1.0) + vec4(-1.0, -1.0, -1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1 = texture(_FalloffTex, u_xlat1.xy);
    SV_Target0 = u_xlat1.wwww * u_xlat0 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 144
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %46 %74 %129 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate vs_TEXCOORD0 Location 46 
                                                      OpDecorate vs_TEXCOORD1 Location 74 
                                                      OpMemberDecorate %127 0 BuiltIn 127 
                                                      OpMemberDecorate %127 1 BuiltIn 127 
                                                      OpMemberDecorate %127 2 BuiltIn 127 
                                                      OpDecorate %127 Block 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %30 = OpConstant 0 
                                              %45 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                          i32 %47 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                              Private f32_4* %105 = OpVariable Private 
                                         u32 %125 = OpConstant 1 
                                             %126 = OpTypeArray %6 %125 
                                             %127 = OpTypeStruct %7 %6 %126 
                                             %128 = OpTypePointer Output %127 
        Output struct {f32_4; f32; f32[1];}* %129 = OpVariable Output 
                                             %138 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %22 %24 %30 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %24 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                               Uniform f32_4* %48 = OpAccessChain %22 %24 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %11 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore vs_TEXCOORD0 %54 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                               Uniform f32_4* %57 = OpAccessChain %22 %47 %25 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFMul %56 %58 
                                                      OpStore %9 %59 
                               Uniform f32_4* %60 = OpAccessChain %22 %47 %30 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpLoad %11 
                                        f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpFAdd %64 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %22 %47 %24 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %11 
                                        f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %75 = OpAccessChain %22 %47 %47 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %11 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore vs_TEXCOORD1 %81 
                                        f32_4 %82 = OpLoad %11 
                                        f32_4 %83 = OpVectorShuffle %82 %82 1 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %22 %30 %25 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %83 %85 
                                                      OpStore %9 %86 
                               Uniform f32_4* %87 = OpAccessChain %22 %30 %30 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %11 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %9 %93 
                               Uniform f32_4* %94 = OpAccessChain %22 %30 %24 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %11 
                                        f32_4 %97 = OpVectorShuffle %96 %96 2 2 2 2 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %9 %100 
                                       f32_4 %101 = OpLoad %9 
                              Uniform f32_4* %102 = OpAccessChain %22 %30 %47 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpFAdd %101 %103 
                                                      OpStore %9 %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %106 1 1 1 1 
                              Uniform f32_4* %108 = OpAccessChain %22 %25 %25 
                                       f32_4 %109 = OpLoad %108 
                                       f32_4 %110 = OpFMul %107 %109 
                                                      OpStore %105 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %30 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_4 %114 = OpVectorShuffle %113 %113 0 0 0 0 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %105 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %105 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %24 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %120 2 2 2 2 
                                       f32_4 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %105 
                                       f32_4 %124 = OpFAdd %122 %123 
                                                      OpStore %105 %124 
                              Uniform f32_4* %130 = OpAccessChain %22 %25 %47 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_4 %133 = OpVectorShuffle %132 %132 3 3 3 3 
                                       f32_4 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %105 
                                       f32_4 %136 = OpFAdd %134 %135 
                               Output f32_4* %137 = OpAccessChain %129 %30 
                                                      OpStore %137 %136 
                                 Output f32* %139 = OpAccessChain %129 %30 %125 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                 Output f32* %142 = OpAccessChain %129 %30 %125 
                                                      OpStore %142 %141 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 71
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %42 %62 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate vs_TEXCOORD1 Location 42 
                                             OpDecorate %48 DescriptorSet 48 
                                             OpDecorate %48 Binding 48 
                                             OpDecorate %50 DescriptorSet 50 
                                             OpDecorate %50 Binding 50 
                                             OpDecorate %62 Location 62 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %12 = OpTypeVector %6 2 
                                     %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %21 = OpTypePointer UniformConstant %20 
UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                     %24 = OpTypeSampler 
                                     %25 = OpTypePointer UniformConstant %24 
            UniformConstant sampler* %26 = OpVariable UniformConstant 
                                     %28 = OpTypeSampledImage %20 
                                 f32 %34 = OpConstant 3.674022E-40 
                                 f32 %35 = OpConstant 3.674022E-40 
                               f32_4 %36 = OpConstantComposite %34 %34 %34 %35 
                               f32_4 %38 = OpConstantComposite %35 %35 %35 %34 
                                     %40 = OpTypePointer Private %12 
                      Private f32_2* %41 = OpVariable Private 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
            UniformConstant sampler* %50 = OpVariable UniformConstant 
                                     %55 = OpTypeInt 32 0 
                                 u32 %56 = OpConstant 3 
                                 u32 %58 = OpConstant 0 
                                     %59 = OpTypePointer Private %6 
                                     %61 = OpTypePointer Output %7 
                       Output f32_4* %62 = OpVariable Output 
                                 f32 %67 = OpConstant 3.674022E-40 
                               f32_4 %68 = OpConstantComposite %34 %34 %34 %67 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD0 
                               f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                               f32_2 %17 = OpFDiv %14 %16 
                               f32_4 %18 = OpLoad %9 
                               f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                             OpStore %9 %19 
                 read_only Texture2D %23 = OpLoad %22 
                             sampler %27 = OpLoad %26 
          read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                               f32_4 %30 = OpLoad %9 
                               f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                               f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                             OpStore %9 %32 
                               f32_4 %33 = OpLoad %9 
                               f32_4 %37 = OpFMul %33 %36 
                               f32_4 %39 = OpFAdd %37 %38 
                                             OpStore %9 %39 
                               f32_4 %43 = OpLoad vs_TEXCOORD1 
                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                               f32_4 %45 = OpLoad vs_TEXCOORD1 
                               f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                               f32_2 %47 = OpFDiv %44 %46 
                                             OpStore %41 %47 
                 read_only Texture2D %49 = OpLoad %48 
                             sampler %51 = OpLoad %50 
          read_only Texture2DSampled %52 = OpSampledImage %49 %51 
                               f32_2 %53 = OpLoad %41 
                               f32_4 %54 = OpImageSampleImplicitLod %52 %53 
                                 f32 %57 = OpCompositeExtract %54 3 
                        Private f32* %60 = OpAccessChain %41 %58 
                                             OpStore %60 %57 
                               f32_2 %63 = OpLoad %41 
                               f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                               f32_4 %65 = OpLoad %9 
                               f32_4 %66 = OpFMul %64 %65 
                               f32_4 %69 = OpFAdd %66 %68 
                                             OpStore %62 %69 
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
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in  vec4 in_POSITION0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
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
UNITY_LOCATION(0) uniform  sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform  sampler2D _FalloffTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0 = texture(_ShadowTex, u_xlat0.xy);
    u_xlat0 = u_xlat0 * vec4(1.0, 1.0, 1.0, -1.0) + vec4(-1.0, -1.0, -1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1 = texture(_FalloffTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat1.wwww;
    u_xlat1.x = vs_TEXCOORD2;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat0.w;
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
; Bound: 184
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %47 %76 %148 %169 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate vs_TEXCOORD0 Location 47 
                                                      OpDecorate vs_TEXCOORD1 Location 76 
                                                      OpMemberDecorate %146 0 BuiltIn 146 
                                                      OpMemberDecorate %146 1 BuiltIn 146 
                                                      OpMemberDecorate %146 2 BuiltIn 146 
                                                      OpDecorate %146 Block 
                                                      OpDecorate vs_TEXCOORD2 Location 169 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %7 %16 %17 %7 %18 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 4 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %30 = OpConstant 0 
                                          i32 %38 = OpConstant 2 
                                              %46 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                          i32 %48 = OpConstant 3 
                                          i32 %58 = OpConstant 5 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                              Private f32_4* %107 = OpVariable Private 
                                         u32 %134 = OpConstant 2 
                                             %135 = OpTypePointer Private %6 
                                         u32 %138 = OpConstant 1 
                                             %139 = OpTypePointer Uniform %6 
                                         u32 %143 = OpConstant 0 
                                             %145 = OpTypeArray %6 %138 
                                             %146 = OpTypeStruct %7 %6 %145 
                                             %147 = OpTypePointer Output %146 
        Output struct {f32_4; f32; f32[1];}* %148 = OpVariable Output 
                                         f32 %154 = OpConstant 3.674022E-40 
                                         f32 %165 = OpConstant 3.674022E-40 
                                             %168 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %175 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %22 %24 %30 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %22 %24 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %49 = OpAccessChain %22 %24 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_4 %51 = OpLoad %11 
                                        f32_4 %52 = OpVectorShuffle %51 %51 3 3 3 3 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore vs_TEXCOORD0 %55 
                                        f32_4 %56 = OpLoad %11 
                                        f32_4 %57 = OpVectorShuffle %56 %56 1 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %22 %58 %25 
                                        f32_4 %60 = OpLoad %59 
                                        f32_4 %61 = OpFMul %57 %60 
                                                      OpStore %9 %61 
                               Uniform f32_4* %62 = OpAccessChain %22 %58 %30 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %11 
                                        f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %69 = OpAccessChain %22 %58 %38 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %11 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %22 %58 %48 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %11 
                                        f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore vs_TEXCOORD1 %83 
                                        f32_4 %84 = OpLoad %11 
                                        f32_4 %85 = OpVectorShuffle %84 %84 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %22 %25 %25 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %85 %87 
                                                      OpStore %9 %88 
                               Uniform f32_4* %89 = OpAccessChain %22 %25 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %11 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %9 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %38 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %11 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                              Uniform f32_4* %104 = OpAccessChain %22 %25 %48 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFAdd %103 %105 
                                                      OpStore %9 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpVectorShuffle %108 %108 1 1 1 1 
                              Uniform f32_4* %110 = OpAccessChain %22 %38 %25 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpFMul %109 %111 
                                                      OpStore %107 %112 
                              Uniform f32_4* %113 = OpAccessChain %22 %38 %30 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 0 0 0 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %107 
                                       f32_4 %119 = OpFAdd %117 %118 
                                                      OpStore %107 %119 
                              Uniform f32_4* %120 = OpAccessChain %22 %38 %38 
                                       f32_4 %121 = OpLoad %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %122 2 2 2 2 
                                       f32_4 %124 = OpFMul %121 %123 
                                       f32_4 %125 = OpLoad %107 
                                       f32_4 %126 = OpFAdd %124 %125 
                                                      OpStore %107 %126 
                              Uniform f32_4* %127 = OpAccessChain %22 %38 %48 
                                       f32_4 %128 = OpLoad %127 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpVectorShuffle %129 %129 3 3 3 3 
                                       f32_4 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %107 
                                       f32_4 %133 = OpFAdd %131 %132 
                                                      OpStore %9 %133 
                                Private f32* %136 = OpAccessChain %9 %134 
                                         f32 %137 = OpLoad %136 
                                Uniform f32* %140 = OpAccessChain %22 %30 %138 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFDiv %137 %141 
                                Private f32* %144 = OpAccessChain %107 %143 
                                                      OpStore %144 %142 
                                       f32_4 %149 = OpLoad %9 
                               Output f32_4* %150 = OpAccessChain %148 %30 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %107 %143 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %9 %143 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %9 %143 
                                         f32 %158 = OpLoad %157 
                                Uniform f32* %159 = OpAccessChain %22 %30 %134 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFMul %158 %160 
                                Private f32* %162 = OpAccessChain %9 %143 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %9 %143 
                                         f32 %164 = OpLoad %163 
                                         f32 %166 = OpExtInst %1 40 %164 %165 
                                Private f32* %167 = OpAccessChain %9 %143 
                                                      OpStore %167 %166 
                                Private f32* %170 = OpAccessChain %9 %143 
                                         f32 %171 = OpLoad %170 
                                Uniform f32* %172 = OpAccessChain %22 %48 %134 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %171 %173 
                                Uniform f32* %176 = OpAccessChain %22 %48 %175 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFAdd %174 %177 
                                                      OpStore vs_TEXCOORD2 %178 
                                 Output f32* %179 = OpAccessChain %148 %30 %138 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFNegate %180 
                                 Output f32* %182 = OpAccessChain %148 %30 %138 
                                                      OpStore %182 %181 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 91
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %42 %66 %75 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate vs_TEXCOORD1 Location 42 
                                             OpDecorate %48 DescriptorSet 48 
                                             OpDecorate %48 Binding 48 
                                             OpDecorate %50 DescriptorSet 50 
                                             OpDecorate %50 Binding 50 
                                             OpDecorate vs_TEXCOORD2 Location 66 
                                             OpDecorate %75 Location 75 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %12 = OpTypeVector %6 2 
                                     %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %21 = OpTypePointer UniformConstant %20 
UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                     %24 = OpTypeSampler 
                                     %25 = OpTypePointer UniformConstant %24 
            UniformConstant sampler* %26 = OpVariable UniformConstant 
                                     %28 = OpTypeSampledImage %20 
                                 f32 %34 = OpConstant 3.674022E-40 
                                 f32 %35 = OpConstant 3.674022E-40 
                               f32_4 %36 = OpConstantComposite %34 %34 %34 %35 
                               f32_4 %38 = OpConstantComposite %35 %35 %35 %34 
                                     %40 = OpTypePointer Private %12 
                      Private f32_2* %41 = OpVariable Private 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
            UniformConstant sampler* %50 = OpVariable UniformConstant 
                                     %55 = OpTypeInt 32 0 
                                 u32 %56 = OpConstant 3 
                                 u32 %58 = OpConstant 0 
                                     %59 = OpTypePointer Private %6 
                                     %65 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %71 = OpConstant 3.674022E-40 
                                     %74 = OpTypePointer Output %7 
                       Output f32_4* %75 = OpVariable Output 
                                     %76 = OpTypeVector %6 3 
                               f32_3 %82 = OpConstantComposite %34 %34 %34 
                                     %88 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD0 
                               f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                               f32_2 %17 = OpFDiv %14 %16 
                               f32_4 %18 = OpLoad %9 
                               f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                             OpStore %9 %19 
                 read_only Texture2D %23 = OpLoad %22 
                             sampler %27 = OpLoad %26 
          read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                               f32_4 %30 = OpLoad %9 
                               f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                               f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                             OpStore %9 %32 
                               f32_4 %33 = OpLoad %9 
                               f32_4 %37 = OpFMul %33 %36 
                               f32_4 %39 = OpFAdd %37 %38 
                                             OpStore %9 %39 
                               f32_4 %43 = OpLoad vs_TEXCOORD1 
                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                               f32_4 %45 = OpLoad vs_TEXCOORD1 
                               f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                               f32_2 %47 = OpFDiv %44 %46 
                                             OpStore %41 %47 
                 read_only Texture2D %49 = OpLoad %48 
                             sampler %51 = OpLoad %50 
          read_only Texture2DSampled %52 = OpSampledImage %49 %51 
                               f32_2 %53 = OpLoad %41 
                               f32_4 %54 = OpImageSampleImplicitLod %52 %53 
                                 f32 %57 = OpCompositeExtract %54 3 
                        Private f32* %60 = OpAccessChain %41 %58 
                                             OpStore %60 %57 
                               f32_4 %61 = OpLoad %9 
                               f32_2 %62 = OpLoad %41 
                               f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                               f32_4 %64 = OpFMul %61 %63 
                                             OpStore %9 %64 
                                 f32 %67 = OpLoad vs_TEXCOORD2 
                        Private f32* %68 = OpAccessChain %41 %58 
                                             OpStore %68 %67 
                        Private f32* %69 = OpAccessChain %41 %58 
                                 f32 %70 = OpLoad %69 
                                 f32 %72 = OpExtInst %1 43 %70 %71 %34 
                        Private f32* %73 = OpAccessChain %41 %58 
                                             OpStore %73 %72 
                               f32_2 %77 = OpLoad %41 
                               f32_3 %78 = OpVectorShuffle %77 %77 0 0 0 
                               f32_4 %79 = OpLoad %9 
                               f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                               f32_3 %81 = OpFMul %78 %80 
                               f32_3 %83 = OpFAdd %81 %82 
                               f32_4 %84 = OpLoad %75 
                               f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                             OpStore %75 %85 
                        Private f32* %86 = OpAccessChain %9 %56 
                                 f32 %87 = OpLoad %86 
                         Output f32* %89 = OpAccessChain %75 %56 
                                             OpStore %89 %87 
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