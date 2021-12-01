//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/CubeBlend" {
Properties {
_TexA ("Cubemap", Cube) = "grey" { }
_TexB ("Cubemap", Cube) = "grey" { }
_value ("Value", Range(0, 1)) = 0.5
}
SubShader {
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZTest Always
  ZWrite Off
  Fog {
   Mode Off
  }
  GpuProgramID 54436
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
in  vec3 in_TEXCOORD0;
out vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
uniform 	vec4 _TexA_HDR;
uniform 	vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform  samplerCube _TexA;
UNITY_LOCATION(1) uniform  samplerCube _TexB;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat6 = u_xlat0.w + -1.0;
    u_xlat6 = _TexA_HDR.w * u_xlat6 + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexA_HDR.y;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexA_HDR.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6);
    u_xlat1 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat6 = u_xlat1.w + -1.0;
    u_xlat6 = _TexB_HDR.w * u_xlat6 + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexB_HDR.y;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexB_HDR.x;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat1.xyz + u_xlat0.xyz;
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
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
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
                                f32_3 %87 = OpLoad %86 
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
; Bound: 136
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %112 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate %12 DescriptorSet 12 
                                                  OpDecorate %12 Binding 12 
                                                  OpDecorate %16 DescriptorSet 16 
                                                  OpDecorate %16 Binding 16 
                                                  OpDecorate vs_TEXCOORD0 Location 22 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %70 DescriptorSet 70 
                                                  OpDecorate %70 Binding 70 
                                                  OpDecorate %72 DescriptorSet 72 
                                                  OpDecorate %72 Binding 72 
                                                  OpDecorate %112 Location 112 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                          %11 = OpTypePointer UniformConstant %10 
   UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                          %14 = OpTypeSampler 
                                          %15 = OpTypePointer UniformConstant %14 
                 UniformConstant sampler* %16 = OpVariable UniformConstant 
                                          %18 = OpTypeSampledImage %10 
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %6 
                             Private f32* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                      f32 %39 = OpConstant 3.674022E-40 
                                      i32 %41 = OpConstant 0 
                                      f32 %46 = OpConstant 3.674022E-40 
                                      u32 %51 = OpConstant 1 
                                      u32 %58 = OpConstant 0 
                           Private f32_4* %69 = OpVariable Private 
   UniformConstant read_only TextureCube* %70 = OpVariable UniformConstant 
                 UniformConstant sampler* %72 = OpVariable UniformConstant 
                                      i32 %82 = OpConstant 1 
                                         %111 = OpTypePointer Output %7 
                           Output f32_4* %112 = OpVariable Output 
                                     i32 %113 = OpConstant 3 
                                         %133 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %37 = OpAccessChain %9 %36 
                                      f32 %38 = OpLoad %37 
                                      f32 %40 = OpFAdd %38 %39 
                                                  OpStore %34 %40 
                             Uniform f32* %42 = OpAccessChain %26 %41 %36 
                                      f32 %43 = OpLoad %42 
                                      f32 %44 = OpLoad %34 
                                      f32 %45 = OpFMul %43 %44 
                                      f32 %47 = OpFAdd %45 %46 
                                                  OpStore %34 %47 
                                      f32 %48 = OpLoad %34 
                                      f32 %49 = OpExtInst %1 30 %48 
                                                  OpStore %34 %49 
                                      f32 %50 = OpLoad %34 
                             Uniform f32* %52 = OpAccessChain %26 %41 %51 
                                      f32 %53 = OpLoad %52 
                                      f32 %54 = OpFMul %50 %53 
                                                  OpStore %34 %54 
                                      f32 %55 = OpLoad %34 
                                      f32 %56 = OpExtInst %1 29 %55 
                                                  OpStore %34 %56 
                                      f32 %57 = OpLoad %34 
                             Uniform f32* %59 = OpAccessChain %26 %41 %58 
                                      f32 %60 = OpLoad %59 
                                      f32 %61 = OpFMul %57 %60 
                                                  OpStore %34 %61 
                                    f32_4 %62 = OpLoad %9 
                                    f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                      f32 %64 = OpLoad %34 
                                    f32_3 %65 = OpCompositeConstruct %64 %64 %64 
                                    f32_3 %66 = OpFMul %63 %65 
                                    f32_4 %67 = OpLoad %9 
                                    f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                  OpStore %9 %68 
                    read_only TextureCube %71 = OpLoad %70 
                                  sampler %73 = OpLoad %72 
             read_only TextureCubeSampled %74 = OpSampledImage %71 %73 
                                    f32_3 %75 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %76 = OpAccessChain %26 %28 
                                      f32 %77 = OpLoad %76 
                                    f32_4 %78 = OpImageSampleExplicitLod %74 %75 Lod %7 
                                                  OpStore %69 %78 
                             Private f32* %79 = OpAccessChain %69 %36 
                                      f32 %80 = OpLoad %79 
                                      f32 %81 = OpFAdd %80 %39 
                                                  OpStore %34 %81 
                             Uniform f32* %83 = OpAccessChain %26 %82 %36 
                                      f32 %84 = OpLoad %83 
                                      f32 %85 = OpLoad %34 
                                      f32 %86 = OpFMul %84 %85 
                                      f32 %87 = OpFAdd %86 %46 
                                                  OpStore %34 %87 
                                      f32 %88 = OpLoad %34 
                                      f32 %89 = OpExtInst %1 30 %88 
                                                  OpStore %34 %89 
                                      f32 %90 = OpLoad %34 
                             Uniform f32* %91 = OpAccessChain %26 %82 %51 
                                      f32 %92 = OpLoad %91 
                                      f32 %93 = OpFMul %90 %92 
                                                  OpStore %34 %93 
                                      f32 %94 = OpLoad %34 
                                      f32 %95 = OpExtInst %1 29 %94 
                                                  OpStore %34 %95 
                                      f32 %96 = OpLoad %34 
                             Uniform f32* %97 = OpAccessChain %26 %82 %58 
                                      f32 %98 = OpLoad %97 
                                      f32 %99 = OpFMul %96 %98 
                                                  OpStore %34 %99 
                                     f32 %100 = OpLoad %34 
                                   f32_3 %101 = OpCompositeConstruct %100 %100 %100 
                                   f32_4 %102 = OpLoad %69 
                                   f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                   f32_3 %104 = OpFMul %101 %103 
                                   f32_4 %105 = OpLoad %9 
                                   f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                   f32_3 %107 = OpFNegate %106 
                                   f32_3 %108 = OpFAdd %104 %107 
                                   f32_4 %109 = OpLoad %69 
                                   f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                  OpStore %69 %110 
                            Uniform f32* %114 = OpAccessChain %26 %113 
                                     f32 %115 = OpLoad %114 
                            Uniform f32* %116 = OpAccessChain %26 %113 
                                     f32 %117 = OpLoad %116 
                            Uniform f32* %118 = OpAccessChain %26 %113 
                                     f32 %119 = OpLoad %118 
                                   f32_3 %120 = OpCompositeConstruct %115 %117 %119 
                                     f32 %121 = OpCompositeExtract %120 0 
                                     f32 %122 = OpCompositeExtract %120 1 
                                     f32 %123 = OpCompositeExtract %120 2 
                                   f32_3 %124 = OpCompositeConstruct %121 %122 %123 
                                   f32_4 %125 = OpLoad %69 
                                   f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                   f32_3 %127 = OpFMul %124 %126 
                                   f32_4 %128 = OpLoad %9 
                                   f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                   f32_3 %130 = OpFAdd %127 %129 
                                   f32_4 %131 = OpLoad %112 
                                   f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                  OpStore %112 %132 
                             Output f32* %134 = OpAccessChain %112 %36 
                                                  OpStore %134 %46 
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
SubShader {
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZTest Always
  ZWrite Off
  Fog {
   Mode Off
  }
  GpuProgramID 120266
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
in  vec3 in_TEXCOORD0;
out vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
uniform 	vec4 _TexA_HDR;
uniform 	vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform  samplerCube _TexA;
UNITY_LOCATION(1) uniform  samplerCube _TexB;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat6 = u_xlat0.w + -1.0;
    u_xlat6 = _TexA_HDR.w * u_xlat6 + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexA_HDR.y;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexA_HDR.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6);
    u_xlat1 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat6 = u_xlat1.w + -1.0;
    u_xlat6 = _TexB_HDR.w * u_xlat6 + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexB_HDR.y;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * _TexB_HDR.x;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat1.xyz + u_xlat0.xyz;
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
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
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
                                f32_3 %87 = OpLoad %86 
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
; Bound: 136
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %112 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate %12 DescriptorSet 12 
                                                  OpDecorate %12 Binding 12 
                                                  OpDecorate %16 DescriptorSet 16 
                                                  OpDecorate %16 Binding 16 
                                                  OpDecorate vs_TEXCOORD0 Location 22 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %70 DescriptorSet 70 
                                                  OpDecorate %70 Binding 70 
                                                  OpDecorate %72 DescriptorSet 72 
                                                  OpDecorate %72 Binding 72 
                                                  OpDecorate %112 Location 112 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                          %11 = OpTypePointer UniformConstant %10 
   UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                          %14 = OpTypeSampler 
                                          %15 = OpTypePointer UniformConstant %14 
                 UniformConstant sampler* %16 = OpVariable UniformConstant 
                                          %18 = OpTypeSampledImage %10 
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %6 
                             Private f32* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                      f32 %39 = OpConstant 3.674022E-40 
                                      i32 %41 = OpConstant 0 
                                      f32 %46 = OpConstant 3.674022E-40 
                                      u32 %51 = OpConstant 1 
                                      u32 %58 = OpConstant 0 
                           Private f32_4* %69 = OpVariable Private 
   UniformConstant read_only TextureCube* %70 = OpVariable UniformConstant 
                 UniformConstant sampler* %72 = OpVariable UniformConstant 
                                      i32 %82 = OpConstant 1 
                                         %111 = OpTypePointer Output %7 
                           Output f32_4* %112 = OpVariable Output 
                                     i32 %113 = OpConstant 3 
                                         %133 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %37 = OpAccessChain %9 %36 
                                      f32 %38 = OpLoad %37 
                                      f32 %40 = OpFAdd %38 %39 
                                                  OpStore %34 %40 
                             Uniform f32* %42 = OpAccessChain %26 %41 %36 
                                      f32 %43 = OpLoad %42 
                                      f32 %44 = OpLoad %34 
                                      f32 %45 = OpFMul %43 %44 
                                      f32 %47 = OpFAdd %45 %46 
                                                  OpStore %34 %47 
                                      f32 %48 = OpLoad %34 
                                      f32 %49 = OpExtInst %1 30 %48 
                                                  OpStore %34 %49 
                                      f32 %50 = OpLoad %34 
                             Uniform f32* %52 = OpAccessChain %26 %41 %51 
                                      f32 %53 = OpLoad %52 
                                      f32 %54 = OpFMul %50 %53 
                                                  OpStore %34 %54 
                                      f32 %55 = OpLoad %34 
                                      f32 %56 = OpExtInst %1 29 %55 
                                                  OpStore %34 %56 
                                      f32 %57 = OpLoad %34 
                             Uniform f32* %59 = OpAccessChain %26 %41 %58 
                                      f32 %60 = OpLoad %59 
                                      f32 %61 = OpFMul %57 %60 
                                                  OpStore %34 %61 
                                    f32_4 %62 = OpLoad %9 
                                    f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                      f32 %64 = OpLoad %34 
                                    f32_3 %65 = OpCompositeConstruct %64 %64 %64 
                                    f32_3 %66 = OpFMul %63 %65 
                                    f32_4 %67 = OpLoad %9 
                                    f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                  OpStore %9 %68 
                    read_only TextureCube %71 = OpLoad %70 
                                  sampler %73 = OpLoad %72 
             read_only TextureCubeSampled %74 = OpSampledImage %71 %73 
                                    f32_3 %75 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %76 = OpAccessChain %26 %28 
                                      f32 %77 = OpLoad %76 
                                    f32_4 %78 = OpImageSampleExplicitLod %74 %75 Lod %7 
                                                  OpStore %69 %78 
                             Private f32* %79 = OpAccessChain %69 %36 
                                      f32 %80 = OpLoad %79 
                                      f32 %81 = OpFAdd %80 %39 
                                                  OpStore %34 %81 
                             Uniform f32* %83 = OpAccessChain %26 %82 %36 
                                      f32 %84 = OpLoad %83 
                                      f32 %85 = OpLoad %34 
                                      f32 %86 = OpFMul %84 %85 
                                      f32 %87 = OpFAdd %86 %46 
                                                  OpStore %34 %87 
                                      f32 %88 = OpLoad %34 
                                      f32 %89 = OpExtInst %1 30 %88 
                                                  OpStore %34 %89 
                                      f32 %90 = OpLoad %34 
                             Uniform f32* %91 = OpAccessChain %26 %82 %51 
                                      f32 %92 = OpLoad %91 
                                      f32 %93 = OpFMul %90 %92 
                                                  OpStore %34 %93 
                                      f32 %94 = OpLoad %34 
                                      f32 %95 = OpExtInst %1 29 %94 
                                                  OpStore %34 %95 
                                      f32 %96 = OpLoad %34 
                             Uniform f32* %97 = OpAccessChain %26 %82 %58 
                                      f32 %98 = OpLoad %97 
                                      f32 %99 = OpFMul %96 %98 
                                                  OpStore %34 %99 
                                     f32 %100 = OpLoad %34 
                                   f32_3 %101 = OpCompositeConstruct %100 %100 %100 
                                   f32_4 %102 = OpLoad %69 
                                   f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                   f32_3 %104 = OpFMul %101 %103 
                                   f32_4 %105 = OpLoad %9 
                                   f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                   f32_3 %107 = OpFNegate %106 
                                   f32_3 %108 = OpFAdd %104 %107 
                                   f32_4 %109 = OpLoad %69 
                                   f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                  OpStore %69 %110 
                            Uniform f32* %114 = OpAccessChain %26 %113 
                                     f32 %115 = OpLoad %114 
                            Uniform f32* %116 = OpAccessChain %26 %113 
                                     f32 %117 = OpLoad %116 
                            Uniform f32* %118 = OpAccessChain %26 %113 
                                     f32 %119 = OpLoad %118 
                                   f32_3 %120 = OpCompositeConstruct %115 %117 %119 
                                     f32 %121 = OpCompositeExtract %120 0 
                                     f32 %122 = OpCompositeExtract %120 1 
                                     f32 %123 = OpCompositeExtract %120 2 
                                   f32_3 %124 = OpCompositeConstruct %121 %122 %123 
                                   f32_4 %125 = OpLoad %69 
                                   f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                   f32_3 %127 = OpFMul %124 %126 
                                   f32_4 %128 = OpLoad %9 
                                   f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                   f32_3 %130 = OpFAdd %127 %129 
                                   f32_4 %131 = OpLoad %112 
                                   f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                  OpStore %112 %132 
                             Output f32* %134 = OpAccessChain %112 %36 
                                                  OpStore %134 %46 
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