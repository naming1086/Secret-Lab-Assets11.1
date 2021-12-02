//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_BrokenGlass" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 28299
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat1 = texture(_MainTex2, u_xlat8.xy);
    u_xlat2 = u_xlat0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.0, 0.5, 0.5);
    u_xlat3 = texture(_MainTex2, u_xlat2.xy);
    u_xlat2 = texture(_MainTex2, u_xlat2.zw);
    u_xlat3.xyz = u_xlat3.xyz * vec3(_Value3);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Value4, _Value4, _Value4)) + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(vec3(_Value5, _Value5, _Value5)) + u_xlat1.xyz;
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.0, 0.5);
    u_xlat2 = texture(_MainTex2, u_xlat8.xy);
    u_xlat1.xyz = u_xlat2.xyz * vec3(vec3(_Value2, _Value2, _Value2)) + u_xlat1.xyz;
    u_xlat0.xy = u_xlat1.xx * vec2(0.001953125, 0.001953125) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat1.xyz * vec3(vec3(_Value, _Value, _Value)) + u_xlat0.xyz;
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
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %28 %197 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %12 0 Offset 12 
                                                      OpMemberDecorate %12 1 Offset 12 
                                                      OpMemberDecorate %12 2 Offset 12 
                                                      OpMemberDecorate %12 3 Offset 12 
                                                      OpMemberDecorate %12 4 Offset 12 
                                                      OpMemberDecorate %12 5 Offset 12 
                                                      OpMemberDecorate %12 6 Offset 12 
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 28 
                                                      OpDecorate %71 DescriptorSet 71 
                                                      OpDecorate %71 Binding 71 
                                                      OpDecorate %75 DescriptorSet 75 
                                                      OpDecorate %75 Binding 75 
                                                      OpDecorate %187 DescriptorSet 187 
                                                      OpDecorate %187 Binding 187 
                                                      OpDecorate %189 DescriptorSet 189 
                                                      OpDecorate %189 Binding 189 
                                                      OpDecorate %197 Location 197 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                              %10 = OpTypeVector %9 2 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %10 %11 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 5 
                                              %17 = OpTypeInt 32 0 
                                          u32 %18 = OpConstant 1 
                                              %19 = OpTypePointer Uniform %9 
                                          f32 %22 = OpConstant 3.674022E-40 
                                              %24 = OpTypeVector %9 3 
                                              %25 = OpTypePointer Private %24 
                               Private f32_3* %26 = OpVariable Private 
                                              %27 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %30 = OpConstant 6 
                                              %31 = OpTypePointer Uniform %11 
                                              %42 = OpTypePointer Private %9 
                                 Private f32* %43 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                              %50 = OpTypePointer Function %9 
                                          u32 %59 = OpConstant 2 
                               Private f32_3* %61 = OpVariable Private 
                                          f32 %64 = OpConstant 3.674022E-40 
                                        f32_2 %65 = OpConstantComposite %64 %64 
                                              %69 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                              %70 = OpTypePointer UniformConstant %69 
         UniformConstant read_only Texture2D* %71 = OpVariable UniformConstant 
                                              %73 = OpTypeSampler 
                                              %74 = OpTypePointer UniformConstant %73 
                     UniformConstant sampler* %75 = OpVariable UniformConstant 
                                              %77 = OpTypeSampledImage %69 
                                              %83 = OpTypePointer Private %11 
                               Private f32_4* %84 = OpVariable Private 
                                        f32_4 %87 = OpConstantComposite %64 %64 %64 %64 
                                        f32_4 %89 = OpConstantComposite %64 %22 %64 %64 
                                              %91 = OpTypePointer Private %10 
                               Private f32_2* %92 = OpVariable Private 
                                        f32_2 %96 = OpConstantComposite %22 %64 
                               Private f32_3* %98 = OpVariable Private 
                              Private f32_3* %105 = OpVariable Private 
                                         i32 %123 = OpConstant 2 
                                         i32 %129 = OpConstant 3 
                                         i32 %146 = OpConstant 4 
                                         i32 %162 = OpConstant 1 
                                         f32 %179 = OpConstant 3.674022E-40 
                                       f32_2 %180 = OpConstantComposite %179 %179 
        UniformConstant read_only Texture2D* %187 = OpVariable UniformConstant 
                    UniformConstant sampler* %189 = OpVariable UniformConstant 
                                             %196 = OpTypePointer Output %11 
                               Output f32_4* %197 = OpVariable Output 
                                         i32 %199 = OpConstant 0 
                                         u32 %216 = OpConstant 3 
                                             %217 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %51 = OpVariable Function 
                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
                                          f32 %21 = OpLoad %20 
                                         bool %23 = OpFOrdLessThan %21 %22 
                                                      OpStore %8 %23 
                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %32 = OpAccessChain %14 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFMul %29 %34 
                               Uniform f32_4* %36 = OpAccessChain %14 %30 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                        f32_2 %39 = OpFAdd %35 %38 
                                        f32_3 %40 = OpLoad %26 
                                        f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
                                                      OpStore %26 %41 
                                 Private f32* %44 = OpAccessChain %26 %18 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFNegate %45 
                                          f32 %48 = OpFAdd %46 %47 
                                                      OpStore %43 %48 
                                         bool %49 = OpLoad %8 
                                                      OpSelectionMerge %53 None 
                                                      OpBranchConditional %49 %52 %55 
                                              %52 = OpLabel 
                                          f32 %54 = OpLoad %43 
                                                      OpStore %51 %54 
                                                      OpBranch %53 
                                              %55 = OpLabel 
                                 Private f32* %56 = OpAccessChain %26 %18 
                                          f32 %57 = OpLoad %56 
                                                      OpStore %51 %57 
                                                      OpBranch %53 
                                              %53 = OpLabel 
                                          f32 %58 = OpLoad %51 
                                 Private f32* %60 = OpAccessChain %26 %59 
                                                      OpStore %60 %58 
                                        f32_3 %62 = OpLoad %26 
                                        f32_2 %63 = OpVectorShuffle %62 %62 0 2 
                                        f32_2 %66 = OpFMul %63 %65 
                                        f32_3 %67 = OpLoad %61 
                                        f32_3 %68 = OpVectorShuffle %67 %66 3 4 2 
                                                      OpStore %61 %68 
                          read_only Texture2D %72 = OpLoad %71 
                                      sampler %76 = OpLoad %75 
                   read_only Texture2DSampled %78 = OpSampledImage %72 %76 
                                        f32_3 %79 = OpLoad %61 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_4 %81 = OpImageSampleImplicitLod %78 %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                                      OpStore %61 %82 
                                        f32_3 %85 = OpLoad %26 
                                        f32_4 %86 = OpVectorShuffle %85 %85 0 2 0 2 
                                        f32_4 %88 = OpFMul %86 %87 
                                        f32_4 %90 = OpFAdd %88 %89 
                                                      OpStore %84 %90 
                                        f32_3 %93 = OpLoad %26 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 2 
                                        f32_2 %95 = OpFMul %94 %65 
                                        f32_2 %97 = OpFAdd %95 %96 
                                                      OpStore %92 %97 
                          read_only Texture2D %99 = OpLoad %71 
                                     sampler %100 = OpLoad %75 
                  read_only Texture2DSampled %101 = OpSampledImage %99 %100 
                                       f32_2 %102 = OpLoad %92 
                                       f32_4 %103 = OpImageSampleImplicitLod %101 %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                                      OpStore %98 %104 
                         read_only Texture2D %106 = OpLoad %71 
                                     sampler %107 = OpLoad %75 
                  read_only Texture2DSampled %108 = OpSampledImage %106 %107 
                                       f32_4 %109 = OpLoad %84 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_4 %111 = OpImageSampleImplicitLod %108 %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                                      OpStore %105 %112 
                         read_only Texture2D %113 = OpLoad %71 
                                     sampler %114 = OpLoad %75 
                  read_only Texture2DSampled %115 = OpSampledImage %113 %114 
                                       f32_4 %116 = OpLoad %84 
                                       f32_2 %117 = OpVectorShuffle %116 %116 2 3 
                                       f32_4 %118 = OpImageSampleImplicitLod %115 %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_4 %120 = OpLoad %84 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %84 %121 
                                       f32_3 %122 = OpLoad %105 
                                Uniform f32* %124 = OpAccessChain %14 %123 
                                         f32 %125 = OpLoad %124 
                                       f32_3 %126 = OpCompositeConstruct %125 %125 %125 
                                       f32_3 %127 = OpFMul %122 %126 
                                                      OpStore %105 %127 
                                       f32_3 %128 = OpLoad %61 
                                Uniform f32* %130 = OpAccessChain %14 %129 
                                         f32 %131 = OpLoad %130 
                                Uniform f32* %132 = OpAccessChain %14 %129 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %134 = OpAccessChain %14 %129 
                                         f32 %135 = OpLoad %134 
                                       f32_3 %136 = OpCompositeConstruct %131 %133 %135 
                                         f32 %137 = OpCompositeExtract %136 0 
                                         f32 %138 = OpCompositeExtract %136 1 
                                         f32 %139 = OpCompositeExtract %136 2 
                                       f32_3 %140 = OpCompositeConstruct %137 %138 %139 
                                       f32_3 %141 = OpFMul %128 %140 
                                       f32_3 %142 = OpLoad %105 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %61 %143 
                                       f32_4 %144 = OpLoad %84 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                Uniform f32* %147 = OpAccessChain %14 %146 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %149 = OpAccessChain %14 %146 
                                         f32 %150 = OpLoad %149 
                                Uniform f32* %151 = OpAccessChain %14 %146 
                                         f32 %152 = OpLoad %151 
                                       f32_3 %153 = OpCompositeConstruct %148 %150 %152 
                                         f32 %154 = OpCompositeExtract %153 0 
                                         f32 %155 = OpCompositeExtract %153 1 
                                         f32 %156 = OpCompositeExtract %153 2 
                                       f32_3 %157 = OpCompositeConstruct %154 %155 %156 
                                       f32_3 %158 = OpFMul %145 %157 
                                       f32_3 %159 = OpLoad %61 
                                       f32_3 %160 = OpFAdd %158 %159 
                                                      OpStore %61 %160 
                                       f32_3 %161 = OpLoad %98 
                                Uniform f32* %163 = OpAccessChain %14 %162 
                                         f32 %164 = OpLoad %163 
                                Uniform f32* %165 = OpAccessChain %14 %162 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %167 = OpAccessChain %14 %162 
                                         f32 %168 = OpLoad %167 
                                       f32_3 %169 = OpCompositeConstruct %164 %166 %168 
                                         f32 %170 = OpCompositeExtract %169 0 
                                         f32 %171 = OpCompositeExtract %169 1 
                                         f32 %172 = OpCompositeExtract %169 2 
                                       f32_3 %173 = OpCompositeConstruct %170 %171 %172 
                                       f32_3 %174 = OpFMul %161 %173 
                                       f32_3 %175 = OpLoad %61 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %61 %176 
                                       f32_3 %177 = OpLoad %61 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 0 
                                       f32_2 %181 = OpFMul %178 %180 
                                       f32_3 %182 = OpLoad %26 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                       f32_2 %184 = OpFAdd %181 %183 
                                       f32_3 %185 = OpLoad %26 
                                       f32_3 %186 = OpVectorShuffle %185 %184 3 4 2 
                                                      OpStore %26 %186 
                         read_only Texture2D %188 = OpLoad %187 
                                     sampler %190 = OpLoad %189 
                  read_only Texture2DSampled %191 = OpSampledImage %188 %190 
                                       f32_3 %192 = OpLoad %26 
                                       f32_2 %193 = OpVectorShuffle %192 %192 0 1 
                                       f32_4 %194 = OpImageSampleImplicitLod %191 %193 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                                                      OpStore %26 %195 
                                       f32_3 %198 = OpLoad %61 
                                Uniform f32* %200 = OpAccessChain %14 %199 
                                         f32 %201 = OpLoad %200 
                                Uniform f32* %202 = OpAccessChain %14 %199 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %14 %199 
                                         f32 %205 = OpLoad %204 
                                       f32_3 %206 = OpCompositeConstruct %201 %203 %205 
                                         f32 %207 = OpCompositeExtract %206 0 
                                         f32 %208 = OpCompositeExtract %206 1 
                                         f32 %209 = OpCompositeExtract %206 2 
                                       f32_3 %210 = OpCompositeConstruct %207 %208 %209 
                                       f32_3 %211 = OpFMul %198 %210 
                                       f32_3 %212 = OpLoad %26 
                                       f32_3 %213 = OpFAdd %211 %212 
                                       f32_4 %214 = OpLoad %197 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %197 %215 
                                 Output f32* %218 = OpAccessChain %197 %216 
                                                      OpStore %218 %47 
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