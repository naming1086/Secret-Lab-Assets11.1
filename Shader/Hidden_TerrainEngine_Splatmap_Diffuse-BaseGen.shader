//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/Splatmap/Diffuse-BaseGen" {
Properties {
_DstBlend ("DstBlend", Float) = 0
}
SubShader {
 Tags { "Format" = "RGBA32" "Name" = "_MainTex" "Size" = "1" }
 Pass {
  Tags { "Format" = "RGBA32" "Name" = "_MainTex" "Size" = "1" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 49929
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
    u_xlat0.xy = in_TEXCOORD0.xy * u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * _Control_TexelSize.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _Splat3_ST.xy + _Splat3_ST.zw;
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
vec4 u_xlat3;
void main()
{
    u_xlat0 = texture(_Splat2, vs_TEXCOORD3.xy);
    u_xlat1 = texture(_Splat0, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_Splat1, vs_TEXCOORD2.xy);
    u_xlat3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat2 * u_xlat3.yyyy;
    u_xlat1 = u_xlat3.xxxx * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat3.zzzz * u_xlat0 + u_xlat1;
    u_xlat1 = texture(_Splat3, vs_TEXCOORD4.xy);
    SV_Target0 = u_xlat3.wwww * u_xlat1 + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 159
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %92 %103 %110 %120 %131 %142 
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
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %92 Location 92 
                                                      OpDecorate vs_TEXCOORD0 Location 103 
                                                      OpDecorate vs_TEXCOORD1 Location 110 
                                                      OpDecorate vs_TEXCOORD2 Location 120 
                                                      OpDecorate vs_TEXCOORD3 Location 131 
                                                      OpDecorate vs_TEXCOORD4 Location 142 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 %7 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4;}* %20 = OpVariable Uniform 
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
                                              %91 = OpTypePointer Input %82 
                                 Input f32_2* %92 = OpVariable Input 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_2 %98 = OpConstantComposite %97 %97 
                                             %102 = OpTypePointer Output %82 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %122 = OpConstant 4 
                       Output f32_2* vs_TEXCOORD3 = OpVariable Output 
                                         i32 %133 = OpConstant 5 
                       Output f32_2* vs_TEXCOORD4 = OpVariable Output 
                                         i32 %144 = OpConstant 6 
                                             %153 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %20 %35 
                                        f32_4 %84 = OpLoad %83 
                                        f32_2 %85 = OpVectorShuffle %84 %84 2 3 
                                        f32_2 %88 = OpFAdd %85 %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                      OpStore %9 %90 
                                        f32_2 %93 = OpLoad %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %93 %95 
                                        f32_2 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                                      OpStore %9 %101 
                                       f32_4 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                              Uniform f32_4* %106 = OpAccessChain %20 %35 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFMul %105 %108 
                                                      OpStore vs_TEXCOORD0 %109 
                                       f32_2 %111 = OpLoad %92 
                              Uniform f32_4* %112 = OpAccessChain %20 %44 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFMul %111 %114 
                              Uniform f32_4* %116 = OpAccessChain %20 %44 
                                       f32_4 %117 = OpLoad %116 
                                       f32_2 %118 = OpVectorShuffle %117 %117 2 3 
                                       f32_2 %119 = OpFAdd %115 %118 
                                                      OpStore vs_TEXCOORD1 %119 
                                       f32_2 %121 = OpLoad %92 
                              Uniform f32_4* %123 = OpAccessChain %20 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFMul %121 %125 
                              Uniform f32_4* %127 = OpAccessChain %20 %122 
                                       f32_4 %128 = OpLoad %127 
                                       f32_2 %129 = OpVectorShuffle %128 %128 2 3 
                                       f32_2 %130 = OpFAdd %126 %129 
                                                      OpStore vs_TEXCOORD2 %130 
                                       f32_2 %132 = OpLoad %92 
                              Uniform f32_4* %134 = OpAccessChain %20 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                              Uniform f32_4* %138 = OpAccessChain %20 %133 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 2 3 
                                       f32_2 %141 = OpFAdd %137 %140 
                                                      OpStore vs_TEXCOORD3 %141 
                                       f32_2 %143 = OpLoad %92 
                              Uniform f32_4* %145 = OpAccessChain %20 %144 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFMul %143 %147 
                              Uniform f32_4* %149 = OpAccessChain %20 %144 
                                       f32_4 %150 = OpLoad %149 
                                       f32_2 %151 = OpVectorShuffle %150 %150 2 3 
                                       f32_2 %152 = OpFAdd %148 %151 
                                                      OpStore vs_TEXCOORD4 %152 
                                 Output f32* %154 = OpAccessChain %72 %22 %68 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFNegate %155 
                                 Output f32* %157 = OpAccessChain %72 %22 %68 
                                                      OpStore %157 %156 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 85
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %31 %40 %49 %73 %77 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD3 Location 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate vs_TEXCOORD1 Location 31 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate vs_TEXCOORD2 Location 40 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate vs_TEXCOORD0 Location 49 
                                             OpDecorate %68 DescriptorSet 68 
                                             OpDecorate %68 Binding 68 
                                             OpDecorate %70 DescriptorSet 70 
                                             OpDecorate %70 Binding 70 
                                             OpDecorate vs_TEXCOORD4 Location 73 
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
               Input f32_2* vs_TEXCOORD3 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
UniformConstant read_only Texture2D* %26 = OpVariable UniformConstant 
            UniformConstant sampler* %28 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %34 = OpVariable Private 
UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
            UniformConstant sampler* %37 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD2 = OpVariable Input 
                      Private f32_4* %43 = OpVariable Private 
UniformConstant read_only Texture2D* %44 = OpVariable UniformConstant 
            UniformConstant sampler* %46 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
UniformConstant read_only Texture2D* %68 = OpVariable UniformConstant 
            UniformConstant sampler* %70 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD4 = OpVariable Input 
                                     %76 = OpTypePointer Output %7 
                       Output f32_4* %77 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD3 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %27 = OpLoad %26 
                             sampler %29 = OpLoad %28 
          read_only Texture2DSampled %30 = OpSampledImage %27 %29 
                               f32_2 %32 = OpLoad vs_TEXCOORD1 
                               f32_4 %33 = OpImageSampleImplicitLod %30 %32 
                                             OpStore %25 %33 
                 read_only Texture2D %36 = OpLoad %35 
                             sampler %38 = OpLoad %37 
          read_only Texture2DSampled %39 = OpSampledImage %36 %38 
                               f32_2 %41 = OpLoad vs_TEXCOORD2 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                                             OpStore %34 %42 
                 read_only Texture2D %45 = OpLoad %44 
                             sampler %47 = OpLoad %46 
          read_only Texture2DSampled %48 = OpSampledImage %45 %47 
                               f32_2 %50 = OpLoad vs_TEXCOORD0 
                               f32_4 %51 = OpImageSampleImplicitLod %48 %50 
                                             OpStore %43 %51 
                               f32_4 %52 = OpLoad %34 
                               f32_4 %53 = OpLoad %43 
                               f32_4 %54 = OpVectorShuffle %53 %53 1 1 1 1 
                               f32_4 %55 = OpFMul %52 %54 
                                             OpStore %34 %55 
                               f32_4 %56 = OpLoad %43 
                               f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                               f32_4 %58 = OpLoad %25 
                               f32_4 %59 = OpFMul %57 %58 
                               f32_4 %60 = OpLoad %34 
                               f32_4 %61 = OpFAdd %59 %60 
                                             OpStore %25 %61 
                               f32_4 %62 = OpLoad %43 
                               f32_4 %63 = OpVectorShuffle %62 %62 2 2 2 2 
                               f32_4 %64 = OpLoad %9 
                               f32_4 %65 = OpFMul %63 %64 
                               f32_4 %66 = OpLoad %25 
                               f32_4 %67 = OpFAdd %65 %66 
                                             OpStore %9 %67 
                 read_only Texture2D %69 = OpLoad %68 
                             sampler %71 = OpLoad %70 
          read_only Texture2DSampled %72 = OpSampledImage %69 %71 
                               f32_2 %74 = OpLoad vs_TEXCOORD4 
                               f32_4 %75 = OpImageSampleImplicitLod %72 %74 
                                             OpStore %25 %75 
                               f32_4 %78 = OpLoad %43 
                               f32_4 %79 = OpVectorShuffle %78 %78 3 3 3 3 
                               f32_4 %80 = OpLoad %25 
                               f32_4 %81 = OpFMul %79 %80 
                               f32_4 %82 = OpLoad %9 
                               f32_4 %83 = OpFAdd %81 %82 
                                             OpStore %77 %83 
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