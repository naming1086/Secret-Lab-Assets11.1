//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/Splatmap/Standard-BaseGen" {
Properties {
_DstBlend ("DstBlend", Float) = 0
}
SubShader {
 Pass {
  Tags { "Format" = "RGBA32" "Name" = "_MainTex" "Size" = "1" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 17582
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
uniform 	vec4 _Control_ST;
uniform 	vec4 _Control_TexelSize;
uniform 	vec4 _Splat0_ST;
uniform 	vec4 _Splat1_ST;
uniform 	vec4 _Splat2_ST;
uniform 	vec4 _Splat3_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec2 vs_TEXCOORD3;
out vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.xy = _Control_TexelSize.zw + vec2(-1.0, -1.0);
    u_xlat4.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * _Control_TexelSize.xy;
    vs_TEXCOORD1.xy = u_xlat4.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD2.xy = u_xlat4.xy * _Splat1_ST.xy + _Splat1_ST.zw;
    vs_TEXCOORD3.xy = u_xlat4.xy * _Splat2_ST.xy + _Splat2_ST.zw;
    vs_TEXCOORD4.xy = u_xlat4.xy * _Splat3_ST.xy + _Splat3_ST.zw;
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
uniform 	float _Smoothness0;
uniform 	float _Smoothness1;
uniform 	float _Smoothness2;
uniform 	float _Smoothness3;
UNITY_LOCATION(0) uniform  sampler2D _Control;
UNITY_LOCATION(1) uniform  sampler2D _Splat0;
UNITY_LOCATION(2) uniform  sampler2D _Splat1;
UNITY_LOCATION(3) uniform  sampler2D _Splat2;
UNITY_LOCATION(4) uniform  sampler2D _Splat3;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec2 vs_TEXCOORD2;
in  vec2 vs_TEXCOORD3;
in  vec2 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = texture(_Splat0, vs_TEXCOORD1.xy);
    u_xlat0.w = u_xlat0.w * _Smoothness0;
    u_xlat1 = texture(_Splat1, vs_TEXCOORD2.xy);
    u_xlat1.w = u_xlat1.w * _Smoothness1;
    u_xlat2 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = texture(_Splat2, vs_TEXCOORD3.xy);
    u_xlat1.w = u_xlat1.w * _Smoothness2;
    u_xlat0 = u_xlat1 * u_xlat2.zzzz + u_xlat0;
    u_xlat1 = texture(_Splat3, vs_TEXCOORD4.xy);
    u_xlat1.w = u_xlat1.w * _Smoothness3;
    SV_Target0 = u_xlat1 * u_xlat2.wwww + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 171
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %94 %114 %121 %132 %143 %154 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD0 Location 114 
                                                      OpDecorate vs_TEXCOORD1 Location 121 
                                                      OpDecorate vs_TEXCOORD2 Location 132 
                                                      OpDecorate vs_TEXCOORD3 Location 143 
                                                      OpDecorate vs_TEXCOORD4 Location 154 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 %7 %7 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4;}* %20 = OpVariable Uniform 
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
                                          f32 %86 = OpConstant 3.674022E-40 
                                        f32_2 %87 = OpConstantComposite %86 %86 
                                              %91 = OpTypePointer Private %82 
                               Private f32_2* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %82 
                                 Input f32_2* %94 = OpVariable Input 
                                         f32 %108 = OpConstant 3.674022E-40 
                                       f32_2 %109 = OpConstantComposite %108 %108 
                                             %113 = OpTypePointer Output %82 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %123 = OpConstant 4 
                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %134 = OpConstant 5 
                       Output f32_2* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %145 = OpConstant 6 
                       Output f32_2* vs_TEXCOORD4 = OpVariable Output 
                                         i32 %156 = OpConstant 7 
                                             %165 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %20 %44 
                                        f32_4 %84 = OpLoad %83 
                                        f32_2 %85 = OpVectorShuffle %84 %84 2 3 
                                        f32_2 %88 = OpFAdd %85 %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                      OpStore %9 %90 
                                        f32_2 %95 = OpLoad %94 
                               Uniform f32_4* %96 = OpAccessChain %20 %35 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_2 %99 = OpFMul %95 %98 
                              Uniform f32_4* %100 = OpAccessChain %20 %35 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 2 3 
                                       f32_2 %103 = OpFAdd %99 %102 
                                                      OpStore %92 %103 
                                       f32_2 %104 = OpLoad %92 
                                       f32_4 %105 = OpLoad %9 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_2 %107 = OpFMul %104 %106 
                                       f32_2 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 2 3 
                                                      OpStore %9 %112 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                              Uniform f32_4* %117 = OpAccessChain %20 %44 
                                       f32_4 %118 = OpLoad %117 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_2 %120 = OpFMul %116 %119 
                                                      OpStore vs_TEXCOORD0 %120 
                                       f32_2 %122 = OpLoad %92 
                              Uniform f32_4* %124 = OpAccessChain %20 %123 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_2 %127 = OpFMul %122 %126 
                              Uniform f32_4* %128 = OpAccessChain %20 %123 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 2 3 
                                       f32_2 %131 = OpFAdd %127 %130 
                                                      OpStore vs_TEXCOORD1 %131 
                                       f32_2 %133 = OpLoad %92 
                              Uniform f32_4* %135 = OpAccessChain %20 %134 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                                       f32_2 %138 = OpFMul %133 %137 
                              Uniform f32_4* %139 = OpAccessChain %20 %134 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 2 3 
                                       f32_2 %142 = OpFAdd %138 %141 
                                                      OpStore vs_TEXCOORD2 %142 
                                       f32_2 %144 = OpLoad %92 
                              Uniform f32_4* %146 = OpAccessChain %20 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_2 %149 = OpFMul %144 %148 
                              Uniform f32_4* %150 = OpAccessChain %20 %145 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 2 3 
                                       f32_2 %153 = OpFAdd %149 %152 
                                                      OpStore vs_TEXCOORD3 %153 
                                       f32_2 %155 = OpLoad %92 
                              Uniform f32_4* %157 = OpAccessChain %20 %156 
                                       f32_4 %158 = OpLoad %157 
                                       f32_2 %159 = OpVectorShuffle %158 %158 0 1 
                                       f32_2 %160 = OpFMul %155 %159 
                              Uniform f32_4* %161 = OpAccessChain %20 %156 
                                       f32_4 %162 = OpLoad %161 
                                       f32_2 %163 = OpVectorShuffle %162 %162 2 3 
                                       f32_2 %164 = OpFAdd %160 %163 
                                                      OpStore vs_TEXCOORD4 %164 
                                 Output f32* %166 = OpAccessChain %72 %22 %68 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                 Output f32* %169 = OpAccessChain %72 %22 %68 
                                                      OpStore %169 %168 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 120
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %46 %62 %80 %101 %112 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                              OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD1 Location 22 
                                              OpMemberDecorate %30 0 Offset 30 
                                              OpMemberDecorate %30 1 Offset 30 
                                              OpMemberDecorate %30 2 Offset 30 
                                              OpMemberDecorate %30 3 Offset 30 
                                              OpDecorate %30 Block 
                                              OpDecorate %32 DescriptorSet 32 
                                              OpDecorate %32 Binding 32 
                                              OpDecorate %41 DescriptorSet 41 
                                              OpDecorate %41 Binding 41 
                                              OpDecorate %43 DescriptorSet 43 
                                              OpDecorate %43 Binding 43 
                                              OpDecorate vs_TEXCOORD2 Location 46 
                                              OpDecorate %57 DescriptorSet 57 
                                              OpDecorate %57 Binding 57 
                                              OpDecorate %59 DescriptorSet 59 
                                              OpDecorate %59 Binding 59 
                                              OpDecorate vs_TEXCOORD0 Location 62 
                                              OpDecorate %75 DescriptorSet 75 
                                              OpDecorate %75 Binding 75 
                                              OpDecorate %77 DescriptorSet 77 
                                              OpDecorate %77 Binding 77 
                                              OpDecorate vs_TEXCOORD3 Location 80 
                                              OpDecorate %96 DescriptorSet 96 
                                              OpDecorate %96 Binding 96 
                                              OpDecorate %98 DescriptorSet 98 
                                              OpDecorate %98 Binding 98 
                                              OpDecorate vs_TEXCOORD4 Location 101 
                                              OpDecorate %112 Location 112 
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
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                      %25 = OpTypeInt 32 0 
                                  u32 %26 = OpConstant 3 
                                      %27 = OpTypePointer Private %6 
                                      %30 = OpTypeStruct %6 %6 %6 %6 
                                      %31 = OpTypePointer Uniform %30 
Uniform struct {f32; f32; f32; f32;}* %32 = OpVariable Uniform 
                                      %33 = OpTypeInt 32 1 
                                  i32 %34 = OpConstant 0 
                                      %35 = OpTypePointer Uniform %6 
                       Private f32_4* %40 = OpVariable Private 
 UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
             UniformConstant sampler* %43 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD2 = OpVariable Input 
                                  i32 %51 = OpConstant 1 
                       Private f32_4* %56 = OpVariable Private 
 UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
             UniformConstant sampler* %59 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
 UniformConstant read_only Texture2D* %75 = OpVariable UniformConstant 
             UniformConstant sampler* %77 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD3 = OpVariable Input 
                                  i32 %85 = OpConstant 2 
 UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
             UniformConstant sampler* %98 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD4 = OpVariable Input 
                                 i32 %106 = OpConstant 3 
                                     %111 = OpTypePointer Output %7 
                       Output f32_4* %112 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD1 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                              OpStore %9 %24 
                         Private f32* %28 = OpAccessChain %9 %26 
                                  f32 %29 = OpLoad %28 
                         Uniform f32* %36 = OpAccessChain %32 %34 
                                  f32 %37 = OpLoad %36 
                                  f32 %38 = OpFMul %29 %37 
                         Private f32* %39 = OpAccessChain %9 %26 
                                              OpStore %39 %38 
                  read_only Texture2D %42 = OpLoad %41 
                              sampler %44 = OpLoad %43 
           read_only Texture2DSampled %45 = OpSampledImage %42 %44 
                                f32_2 %47 = OpLoad vs_TEXCOORD2 
                                f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                              OpStore %40 %48 
                         Private f32* %49 = OpAccessChain %40 %26 
                                  f32 %50 = OpLoad %49 
                         Uniform f32* %52 = OpAccessChain %32 %51 
                                  f32 %53 = OpLoad %52 
                                  f32 %54 = OpFMul %50 %53 
                         Private f32* %55 = OpAccessChain %40 %26 
                                              OpStore %55 %54 
                  read_only Texture2D %58 = OpLoad %57 
                              sampler %60 = OpLoad %59 
           read_only Texture2DSampled %61 = OpSampledImage %58 %60 
                                f32_2 %63 = OpLoad vs_TEXCOORD0 
                                f32_4 %64 = OpImageSampleImplicitLod %61 %63 
                                              OpStore %56 %64 
                                f32_4 %65 = OpLoad %40 
                                f32_4 %66 = OpLoad %56 
                                f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                                f32_4 %68 = OpFMul %65 %67 
                                              OpStore %40 %68 
                                f32_4 %69 = OpLoad %9 
                                f32_4 %70 = OpLoad %56 
                                f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %40 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                  read_only Texture2D %76 = OpLoad %75 
                              sampler %78 = OpLoad %77 
           read_only Texture2DSampled %79 = OpSampledImage %76 %78 
                                f32_2 %81 = OpLoad vs_TEXCOORD3 
                                f32_4 %82 = OpImageSampleImplicitLod %79 %81 
                                              OpStore %40 %82 
                         Private f32* %83 = OpAccessChain %40 %26 
                                  f32 %84 = OpLoad %83 
                         Uniform f32* %86 = OpAccessChain %32 %85 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFMul %84 %87 
                         Private f32* %89 = OpAccessChain %40 %26 
                                              OpStore %89 %88 
                                f32_4 %90 = OpLoad %40 
                                f32_4 %91 = OpLoad %56 
                                f32_4 %92 = OpVectorShuffle %91 %91 2 2 2 2 
                                f32_4 %93 = OpFMul %90 %92 
                                f32_4 %94 = OpLoad %9 
                                f32_4 %95 = OpFAdd %93 %94 
                                              OpStore %9 %95 
                  read_only Texture2D %97 = OpLoad %96 
                              sampler %99 = OpLoad %98 
          read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                               f32_2 %102 = OpLoad vs_TEXCOORD4 
                               f32_4 %103 = OpImageSampleImplicitLod %100 %102 
                                              OpStore %40 %103 
                        Private f32* %104 = OpAccessChain %40 %26 
                                 f32 %105 = OpLoad %104 
                        Uniform f32* %107 = OpAccessChain %32 %106 
                                 f32 %108 = OpLoad %107 
                                 f32 %109 = OpFMul %105 %108 
                        Private f32* %110 = OpAccessChain %40 %26 
                                              OpStore %110 %109 
                               f32_4 %113 = OpLoad %40 
                               f32_4 %114 = OpLoad %56 
                               f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                               f32_4 %116 = OpFMul %113 %115 
                               f32_4 %117 = OpLoad %9 
                               f32_4 %118 = OpFAdd %116 %117 
                                              OpStore %112 %118 
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
  Tags { "Format" = "A2R10G10B10" "Name" = "_NormalMap" "Size" = "1" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 76519
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
uniform 	vec4 _Control_ST;
uniform 	vec4 _Control_TexelSize;
uniform 	vec4 _Splat0_ST;
uniform 	vec4 _Splat1_ST;
uniform 	vec4 _Splat2_ST;
uniform 	vec4 _Splat3_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec2 vs_TEXCOORD3;
out vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.xy = _Control_TexelSize.zw + vec2(-1.0, -1.0);
    u_xlat4.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * _Control_TexelSize.xy;
    vs_TEXCOORD1.xy = u_xlat4.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD2.xy = u_xlat4.xy * _Splat1_ST.xy + _Splat1_ST.zw;
    vs_TEXCOORD3.xy = u_xlat4.xy * _Splat2_ST.xy + _Splat2_ST.zw;
    vs_TEXCOORD4.xy = u_xlat4.xy * _Splat3_ST.xy + _Splat3_ST.zw;
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
uniform 	float _NormalScale0;
uniform 	float _NormalScale1;
uniform 	float _NormalScale2;
uniform 	float _NormalScale3;
UNITY_LOCATION(0) uniform  sampler2D _Control;
UNITY_LOCATION(1) uniform  sampler2D _Normal0;
UNITY_LOCATION(2) uniform  sampler2D _Normal1;
UNITY_LOCATION(3) uniform  sampler2D _Normal2;
UNITY_LOCATION(4) uniform  sampler2D _Normal3;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec2 vs_TEXCOORD2;
in  vec2 vs_TEXCOORD3;
in  vec2 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = texture(_Normal0, vs_TEXCOORD1.xy);
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalScale0);
    u_xlat9 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat0.z = sqrt(u_xlat9);
    u_xlat1 = texture(_Normal1, vs_TEXCOORD2.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalScale1, _NormalScale1));
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.z = sqrt(u_xlat9);
    u_xlat2 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1 = texture(_Normal2, vs_TEXCOORD3.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalScale2, _NormalScale2));
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.z = sqrt(u_xlat9);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat1 = texture(_Normal3, vs_TEXCOORD4.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalScale3, _NormalScale3));
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.z = sqrt(u_xlat9);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
; Bound: 171
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %94 %114 %121 %132 %143 %154 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate vs_TEXCOORD0 Location 114 
                                                      OpDecorate vs_TEXCOORD1 Location 121 
                                                      OpDecorate vs_TEXCOORD2 Location 132 
                                                      OpDecorate vs_TEXCOORD3 Location 143 
                                                      OpDecorate vs_TEXCOORD4 Location 154 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 %7 %7 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4;}* %20 = OpVariable Uniform 
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
                                          f32 %86 = OpConstant 3.674022E-40 
                                        f32_2 %87 = OpConstantComposite %86 %86 
                                              %91 = OpTypePointer Private %82 
                               Private f32_2* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %82 
                                 Input f32_2* %94 = OpVariable Input 
                                         f32 %108 = OpConstant 3.674022E-40 
                                       f32_2 %109 = OpConstantComposite %108 %108 
                                             %113 = OpTypePointer Output %82 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %123 = OpConstant 4 
                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %134 = OpConstant 5 
                       Output f32_2* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %145 = OpConstant 6 
                       Output f32_2* vs_TEXCOORD4 = OpVariable Output 
                                         i32 %156 = OpConstant 7 
                                             %165 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %20 %44 
                                        f32_4 %84 = OpLoad %83 
                                        f32_2 %85 = OpVectorShuffle %84 %84 2 3 
                                        f32_2 %88 = OpFAdd %85 %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                      OpStore %9 %90 
                                        f32_2 %95 = OpLoad %94 
                               Uniform f32_4* %96 = OpAccessChain %20 %35 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_2 %99 = OpFMul %95 %98 
                              Uniform f32_4* %100 = OpAccessChain %20 %35 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 2 3 
                                       f32_2 %103 = OpFAdd %99 %102 
                                                      OpStore %92 %103 
                                       f32_2 %104 = OpLoad %92 
                                       f32_4 %105 = OpLoad %9 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_2 %107 = OpFMul %104 %106 
                                       f32_2 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 2 3 
                                                      OpStore %9 %112 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                              Uniform f32_4* %117 = OpAccessChain %20 %44 
                                       f32_4 %118 = OpLoad %117 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_2 %120 = OpFMul %116 %119 
                                                      OpStore vs_TEXCOORD0 %120 
                                       f32_2 %122 = OpLoad %92 
                              Uniform f32_4* %124 = OpAccessChain %20 %123 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_2 %127 = OpFMul %122 %126 
                              Uniform f32_4* %128 = OpAccessChain %20 %123 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 2 3 
                                       f32_2 %131 = OpFAdd %127 %130 
                                                      OpStore vs_TEXCOORD1 %131 
                                       f32_2 %133 = OpLoad %92 
                              Uniform f32_4* %135 = OpAccessChain %20 %134 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                                       f32_2 %138 = OpFMul %133 %137 
                              Uniform f32_4* %139 = OpAccessChain %20 %134 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 2 3 
                                       f32_2 %142 = OpFAdd %138 %141 
                                                      OpStore vs_TEXCOORD2 %142 
                                       f32_2 %144 = OpLoad %92 
                              Uniform f32_4* %146 = OpAccessChain %20 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_2 %149 = OpFMul %144 %148 
                              Uniform f32_4* %150 = OpAccessChain %20 %145 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 2 3 
                                       f32_2 %153 = OpFAdd %149 %152 
                                                      OpStore vs_TEXCOORD3 %153 
                                       f32_2 %155 = OpLoad %92 
                              Uniform f32_4* %157 = OpAccessChain %20 %156 
                                       f32_4 %158 = OpLoad %157 
                                       f32_2 %159 = OpVectorShuffle %158 %158 0 1 
                                       f32_2 %160 = OpFMul %155 %159 
                              Uniform f32_4* %161 = OpAccessChain %20 %156 
                                       f32_4 %162 = OpLoad %161 
                                       f32_2 %163 = OpVectorShuffle %162 %162 2 3 
                                       f32_2 %164 = OpFAdd %160 %163 
                                                      OpStore vs_TEXCOORD4 %164 
                                 Output f32* %166 = OpAccessChain %72 %22 %68 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                 Output f32* %169 = OpAccessChain %72 %22 %68 
                                                      OpStore %169 %168 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 266
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %82 %132 %150 %204 %254 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                              OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD1 Location 22 
                                              OpMemberDecorate %49 0 Offset 49 
                                              OpMemberDecorate %49 1 Offset 49 
                                              OpMemberDecorate %49 2 Offset 49 
                                              OpMemberDecorate %49 3 Offset 49 
                                              OpDecorate %49 Block 
                                              OpDecorate %51 DescriptorSet 51 
                                              OpDecorate %51 Binding 51 
                                              OpDecorate %77 DescriptorSet 77 
                                              OpDecorate %77 Binding 77 
                                              OpDecorate %79 DescriptorSet 79 
                                              OpDecorate %79 Binding 79 
                                              OpDecorate vs_TEXCOORD2 Location 82 
                                              OpDecorate %127 DescriptorSet 127 
                                              OpDecorate %127 Binding 127 
                                              OpDecorate %129 DescriptorSet 129 
                                              OpDecorate %129 Binding 129 
                                              OpDecorate vs_TEXCOORD0 Location 132 
                                              OpDecorate %145 DescriptorSet 145 
                                              OpDecorate %145 Binding 145 
                                              OpDecorate %147 DescriptorSet 147 
                                              OpDecorate %147 Binding 147 
                                              OpDecorate vs_TEXCOORD3 Location 150 
                                              OpDecorate %199 DescriptorSet 199 
                                              OpDecorate %199 Binding 199 
                                              OpDecorate %201 DescriptorSet 201 
                                              OpDecorate %201 Binding 201 
                                              OpDecorate vs_TEXCOORD4 Location 204 
                                              OpDecorate %254 Location 254 
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
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                      %24 = OpTypeVector %6 4 
                                      %27 = OpTypeInt 32 0 
                                  u32 %28 = OpConstant 2 
                                      %29 = OpTypePointer Private %6 
                                  u32 %32 = OpConstant 0 
                                  f32 %39 = OpConstant 3.674022E-40 
                                f32_2 %40 = OpConstantComposite %39 %39 
                                  f32 %42 = OpConstant 3.674022E-40 
                                f32_2 %43 = OpConstantComposite %42 %42 
                                      %49 = OpTypeStruct %6 %6 %6 %6 
                                      %50 = OpTypePointer Uniform %49 
Uniform struct {f32; f32; f32; f32;}* %51 = OpVariable Uniform 
                                      %52 = OpTypeInt 32 1 
                                  i32 %53 = OpConstant 0 
                                      %54 = OpTypePointer Uniform %6 
                         Private f32* %61 = OpVariable Private 
                                  f32 %68 = OpConstant 3.674022E-40 
                       Private f32_3* %76 = OpVariable Private 
 UniformConstant read_only Texture2D* %77 = OpVariable UniformConstant 
             UniformConstant sampler* %79 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD2 = OpVariable Input 
                                 i32 %100 = OpConstant 1 
                                     %125 = OpTypePointer Private %24 
                      Private f32_4* %126 = OpVariable Private 
UniformConstant read_only Texture2D* %127 = OpVariable UniformConstant 
            UniformConstant sampler* %129 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
UniformConstant read_only Texture2D* %145 = OpVariable UniformConstant 
            UniformConstant sampler* %147 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD3 = OpVariable Input 
                                 i32 %168 = OpConstant 2 
UniformConstant read_only Texture2D* %199 = OpVariable UniformConstant 
            UniformConstant sampler* %201 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD4 = OpVariable Input 
                                 i32 %222 = OpConstant 3 
                                     %253 = OpTypePointer Output %24 
                       Output f32_4* %254 = OpVariable Output 
                                 f32 %256 = OpConstant 3.674022E-40 
                               f32_3 %257 = OpConstantComposite %256 %256 %256 
                                 u32 %262 = OpConstant 3 
                                     %263 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD1 
                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 3 
                                              OpStore %9 %26 
                         Private f32* %30 = OpAccessChain %9 %28 
                                  f32 %31 = OpLoad %30 
                         Private f32* %33 = OpAccessChain %9 %32 
                                  f32 %34 = OpLoad %33 
                                  f32 %35 = OpFMul %31 %34 
                         Private f32* %36 = OpAccessChain %9 %32 
                                              OpStore %36 %35 
                                f32_3 %37 = OpLoad %9 
                                f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                f32_2 %41 = OpFMul %38 %40 
                                f32_2 %44 = OpFAdd %41 %43 
                                f32_3 %45 = OpLoad %9 
                                f32_3 %46 = OpVectorShuffle %45 %44 3 4 2 
                                              OpStore %9 %46 
                                f32_3 %47 = OpLoad %9 
                                f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                         Uniform f32* %55 = OpAccessChain %51 %53 
                                  f32 %56 = OpLoad %55 
                                f32_2 %57 = OpCompositeConstruct %56 %56 
                                f32_2 %58 = OpFMul %48 %57 
                                f32_3 %59 = OpLoad %9 
                                f32_3 %60 = OpVectorShuffle %59 %58 3 4 2 
                                              OpStore %9 %60 
                                f32_3 %62 = OpLoad %9 
                                f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                f32_3 %64 = OpLoad %9 
                                f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                  f32 %66 = OpDot %63 %65 
                                              OpStore %61 %66 
                                  f32 %67 = OpLoad %61 
                                  f32 %69 = OpExtInst %1 37 %67 %68 
                                              OpStore %61 %69 
                                  f32 %70 = OpLoad %61 
                                  f32 %71 = OpFNegate %70 
                                  f32 %72 = OpFAdd %71 %68 
                                              OpStore %61 %72 
                                  f32 %73 = OpLoad %61 
                                  f32 %74 = OpExtInst %1 31 %73 
                         Private f32* %75 = OpAccessChain %9 %28 
                                              OpStore %75 %74 
                  read_only Texture2D %78 = OpLoad %77 
                              sampler %80 = OpLoad %79 
           read_only Texture2DSampled %81 = OpSampledImage %78 %80 
                                f32_2 %83 = OpLoad vs_TEXCOORD2 
                                f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                f32_3 %85 = OpVectorShuffle %84 %84 0 1 3 
                                              OpStore %76 %85 
                         Private f32* %86 = OpAccessChain %76 %28 
                                  f32 %87 = OpLoad %86 
                         Private f32* %88 = OpAccessChain %76 %32 
                                  f32 %89 = OpLoad %88 
                                  f32 %90 = OpFMul %87 %89 
                         Private f32* %91 = OpAccessChain %76 %32 
                                              OpStore %91 %90 
                                f32_3 %92 = OpLoad %76 
                                f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                f32_2 %94 = OpFMul %93 %40 
                                f32_2 %95 = OpFAdd %94 %43 
                                f32_3 %96 = OpLoad %76 
                                f32_3 %97 = OpVectorShuffle %96 %95 3 4 2 
                                              OpStore %76 %97 
                                f32_3 %98 = OpLoad %76 
                                f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                        Uniform f32* %101 = OpAccessChain %51 %100 
                                 f32 %102 = OpLoad %101 
                        Uniform f32* %103 = OpAccessChain %51 %100 
                                 f32 %104 = OpLoad %103 
                               f32_2 %105 = OpCompositeConstruct %102 %104 
                                 f32 %106 = OpCompositeExtract %105 0 
                                 f32 %107 = OpCompositeExtract %105 1 
                               f32_2 %108 = OpCompositeConstruct %106 %107 
                               f32_2 %109 = OpFMul %99 %108 
                               f32_3 %110 = OpLoad %76 
                               f32_3 %111 = OpVectorShuffle %110 %109 3 4 2 
                                              OpStore %76 %111 
                               f32_3 %112 = OpLoad %76 
                               f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                               f32_3 %114 = OpLoad %76 
                               f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                 f32 %116 = OpDot %113 %115 
                                              OpStore %61 %116 
                                 f32 %117 = OpLoad %61 
                                 f32 %118 = OpExtInst %1 37 %117 %68 
                                              OpStore %61 %118 
                                 f32 %119 = OpLoad %61 
                                 f32 %120 = OpFNegate %119 
                                 f32 %121 = OpFAdd %120 %68 
                                              OpStore %61 %121 
                                 f32 %122 = OpLoad %61 
                                 f32 %123 = OpExtInst %1 31 %122 
                        Private f32* %124 = OpAccessChain %76 %28 
                                              OpStore %124 %123 
                 read_only Texture2D %128 = OpLoad %127 
                             sampler %130 = OpLoad %129 
          read_only Texture2DSampled %131 = OpSampledImage %128 %130 
                               f32_2 %133 = OpLoad vs_TEXCOORD0 
                               f32_4 %134 = OpImageSampleImplicitLod %131 %133 
                                              OpStore %126 %134 
                               f32_3 %135 = OpLoad %76 
                               f32_4 %136 = OpLoad %126 
                               f32_3 %137 = OpVectorShuffle %136 %136 1 1 1 
                               f32_3 %138 = OpFMul %135 %137 
                                              OpStore %76 %138 
                               f32_3 %139 = OpLoad %9 
                               f32_4 %140 = OpLoad %126 
                               f32_3 %141 = OpVectorShuffle %140 %140 0 0 0 
                               f32_3 %142 = OpFMul %139 %141 
                               f32_3 %143 = OpLoad %76 
                               f32_3 %144 = OpFAdd %142 %143 
                                              OpStore %9 %144 
                 read_only Texture2D %146 = OpLoad %145 
                             sampler %148 = OpLoad %147 
          read_only Texture2DSampled %149 = OpSampledImage %146 %148 
                               f32_2 %151 = OpLoad vs_TEXCOORD3 
                               f32_4 %152 = OpImageSampleImplicitLod %149 %151 
                               f32_3 %153 = OpVectorShuffle %152 %152 0 1 3 
                                              OpStore %76 %153 
                        Private f32* %154 = OpAccessChain %76 %28 
                                 f32 %155 = OpLoad %154 
                        Private f32* %156 = OpAccessChain %76 %32 
                                 f32 %157 = OpLoad %156 
                                 f32 %158 = OpFMul %155 %157 
                        Private f32* %159 = OpAccessChain %76 %32 
                                              OpStore %159 %158 
                               f32_3 %160 = OpLoad %76 
                               f32_2 %161 = OpVectorShuffle %160 %160 0 1 
                               f32_2 %162 = OpFMul %161 %40 
                               f32_2 %163 = OpFAdd %162 %43 
                               f32_3 %164 = OpLoad %76 
                               f32_3 %165 = OpVectorShuffle %164 %163 3 4 2 
                                              OpStore %76 %165 
                               f32_3 %166 = OpLoad %76 
                               f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                        Uniform f32* %169 = OpAccessChain %51 %168 
                                 f32 %170 = OpLoad %169 
                        Uniform f32* %171 = OpAccessChain %51 %168 
                                 f32 %172 = OpLoad %171 
                               f32_2 %173 = OpCompositeConstruct %170 %172 
                                 f32 %174 = OpCompositeExtract %173 0 
                                 f32 %175 = OpCompositeExtract %173 1 
                               f32_2 %176 = OpCompositeConstruct %174 %175 
                               f32_2 %177 = OpFMul %167 %176 
                               f32_3 %178 = OpLoad %76 
                               f32_3 %179 = OpVectorShuffle %178 %177 3 4 2 
                                              OpStore %76 %179 
                               f32_3 %180 = OpLoad %76 
                               f32_2 %181 = OpVectorShuffle %180 %180 0 1 
                               f32_3 %182 = OpLoad %76 
                               f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                 f32 %184 = OpDot %181 %183 
                                              OpStore %61 %184 
                                 f32 %185 = OpLoad %61 
                                 f32 %186 = OpExtInst %1 37 %185 %68 
                                              OpStore %61 %186 
                                 f32 %187 = OpLoad %61 
                                 f32 %188 = OpFNegate %187 
                                 f32 %189 = OpFAdd %188 %68 
                                              OpStore %61 %189 
                                 f32 %190 = OpLoad %61 
                                 f32 %191 = OpExtInst %1 31 %190 
                        Private f32* %192 = OpAccessChain %76 %28 
                                              OpStore %192 %191 
                               f32_3 %193 = OpLoad %76 
                               f32_4 %194 = OpLoad %126 
                               f32_3 %195 = OpVectorShuffle %194 %194 2 2 2 
                               f32_3 %196 = OpFMul %193 %195 
                               f32_3 %197 = OpLoad %9 
                               f32_3 %198 = OpFAdd %196 %197 
                                              OpStore %9 %198 
                 read_only Texture2D %200 = OpLoad %199 
                             sampler %202 = OpLoad %201 
          read_only Texture2DSampled %203 = OpSampledImage %200 %202 
                               f32_2 %205 = OpLoad vs_TEXCOORD4 
                               f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                               f32_3 %207 = OpVectorShuffle %206 %206 0 1 3 
                                              OpStore %76 %207 
                        Private f32* %208 = OpAccessChain %76 %28 
                                 f32 %209 = OpLoad %208 
                        Private f32* %210 = OpAccessChain %76 %32 
                                 f32 %211 = OpLoad %210 
                                 f32 %212 = OpFMul %209 %211 
                        Private f32* %213 = OpAccessChain %76 %32 
                                              OpStore %213 %212 
                               f32_3 %214 = OpLoad %76 
                               f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                               f32_2 %216 = OpFMul %215 %40 
                               f32_2 %217 = OpFAdd %216 %43 
                               f32_3 %218 = OpLoad %76 
                               f32_3 %219 = OpVectorShuffle %218 %217 3 4 2 
                                              OpStore %76 %219 
                               f32_3 %220 = OpLoad %76 
                               f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                        Uniform f32* %223 = OpAccessChain %51 %222 
                                 f32 %224 = OpLoad %223 
                        Uniform f32* %225 = OpAccessChain %51 %222 
                                 f32 %226 = OpLoad %225 
                               f32_2 %227 = OpCompositeConstruct %224 %226 
                                 f32 %228 = OpCompositeExtract %227 0 
                                 f32 %229 = OpCompositeExtract %227 1 
                               f32_2 %230 = OpCompositeConstruct %228 %229 
                               f32_2 %231 = OpFMul %221 %230 
                               f32_3 %232 = OpLoad %76 
                               f32_3 %233 = OpVectorShuffle %232 %231 3 4 2 
                                              OpStore %76 %233 
                               f32_3 %234 = OpLoad %76 
                               f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                               f32_3 %236 = OpLoad %76 
                               f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                 f32 %238 = OpDot %235 %237 
                                              OpStore %61 %238 
                                 f32 %239 = OpLoad %61 
                                 f32 %240 = OpExtInst %1 37 %239 %68 
                                              OpStore %61 %240 
                                 f32 %241 = OpLoad %61 
                                 f32 %242 = OpFNegate %241 
                                 f32 %243 = OpFAdd %242 %68 
                                              OpStore %61 %243 
                                 f32 %244 = OpLoad %61 
                                 f32 %245 = OpExtInst %1 31 %244 
                        Private f32* %246 = OpAccessChain %76 %28 
                                              OpStore %246 %245 
                               f32_3 %247 = OpLoad %76 
                               f32_4 %248 = OpLoad %126 
                               f32_3 %249 = OpVectorShuffle %248 %248 3 3 3 
                               f32_3 %250 = OpFMul %247 %249 
                               f32_3 %251 = OpLoad %9 
                               f32_3 %252 = OpFAdd %250 %251 
                                              OpStore %9 %252 
                               f32_3 %255 = OpLoad %9 
                               f32_3 %258 = OpFMul %255 %257 
                               f32_3 %259 = OpFAdd %258 %257 
                               f32_4 %260 = OpLoad %254 
                               f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                              OpStore %254 %261 
                         Output f32* %264 = OpAccessChain %254 %262 
                                              OpStore %264 %68 
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
  Tags { "Format" = "R8" "Name" = "_MetallicTex" "Size" = "1/4" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 174286
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
uniform 	vec4 _Control_ST;
uniform 	vec4 _Control_TexelSize;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
    u_xlat4.xy = _Control_TexelSize.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * _Control_TexelSize.xy;
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
uniform 	float _Metallic0;
uniform 	float _Metallic1;
uniform 	float _Metallic2;
uniform 	float _Metallic3;
UNITY_LOCATION(0) uniform  sampler2D _Control;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_Control, vs_TEXCOORD0.xy);
    SV_Target0.x = dot(vec4(_Metallic0, _Metallic1, _Metallic2, _Metallic3), u_xlat0);
    SV_Target0.yzw = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 127
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %114 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate vs_TEXCOORD0 Location 114 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
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
                                              %96 = OpTypePointer Private %82 
                               Private f32_2* %97 = OpVariable Private 
                                         f32 %101 = OpConstant 3.674022E-40 
                                       f32_2 %102 = OpConstantComposite %101 %101 
                                         f32 %108 = OpConstant 3.674022E-40 
                                       f32_2 %109 = OpConstantComposite %108 %108 
                                             %113 = OpTypePointer Output %82 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %121 = OpTypePointer Output %6 
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
                               Uniform f32_4* %86 = OpAccessChain %20 %35 
                                        f32_4 %87 = OpLoad %86 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_2 %89 = OpFMul %85 %88 
                               Uniform f32_4* %90 = OpAccessChain %20 %35 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 2 3 
                                        f32_2 %93 = OpFAdd %89 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %9 %95 
                               Uniform f32_4* %98 = OpAccessChain %20 %44 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %103 = OpFAdd %100 %102 
                                                      OpStore %97 %103 
                                       f32_4 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpLoad %97 
                                       f32_2 %107 = OpFMul %105 %106 
                                       f32_2 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 2 3 
                                                      OpStore %9 %112 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                              Uniform f32_4* %117 = OpAccessChain %20 %44 
                                       f32_4 %118 = OpLoad %117 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_2 %120 = OpFMul %116 %119 
                                                      OpStore vs_TEXCOORD0 %120 
                                 Output f32* %122 = OpAccessChain %72 %22 %68 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFNegate %123 
                                 Output f32* %125 = OpAccessChain %72 %22 %68 
                                                      OpStore %125 %124 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 57
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
                                              OpMemberDecorate %27 0 Offset 27 
                                              OpMemberDecorate %27 1 Offset 27 
                                              OpMemberDecorate %27 2 Offset 27 
                                              OpMemberDecorate %27 3 Offset 27 
                                              OpDecorate %27 Block 
                                              OpDecorate %29 DescriptorSet 29 
                                              OpDecorate %29 Binding 29 
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
                                      %27 = OpTypeStruct %6 %6 %6 %6 
                                      %28 = OpTypePointer Uniform %27 
Uniform struct {f32; f32; f32; f32;}* %29 = OpVariable Uniform 
                                      %30 = OpTypeInt 32 1 
                                  i32 %31 = OpConstant 0 
                                      %32 = OpTypePointer Uniform %6 
                                  i32 %35 = OpConstant 1 
                                  i32 %38 = OpConstant 2 
                                  i32 %41 = OpConstant 3 
                                      %47 = OpTypeInt 32 0 
                                  u32 %48 = OpConstant 0 
                                      %49 = OpTypePointer Output %6 
                                      %51 = OpTypeVector %6 3 
                                  f32 %52 = OpConstant 3.674022E-40 
                                f32_3 %53 = OpConstantComposite %52 %52 %52 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                              OpStore %9 %24 
                         Uniform f32* %33 = OpAccessChain %29 %31 
                                  f32 %34 = OpLoad %33 
                         Uniform f32* %36 = OpAccessChain %29 %35 
                                  f32 %37 = OpLoad %36 
                         Uniform f32* %39 = OpAccessChain %29 %38 
                                  f32 %40 = OpLoad %39 
                         Uniform f32* %42 = OpAccessChain %29 %41 
                                  f32 %43 = OpLoad %42 
                                f32_4 %44 = OpCompositeConstruct %34 %37 %40 %43 
                                f32_4 %45 = OpLoad %9 
                                  f32 %46 = OpDot %44 %45 
                          Output f32* %50 = OpAccessChain %26 %48 
                                              OpStore %50 %46 
                                f32_4 %54 = OpLoad %26 
                                f32_4 %55 = OpVectorShuffle %54 %53 0 4 5 6 
                                              OpStore %26 %55 
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