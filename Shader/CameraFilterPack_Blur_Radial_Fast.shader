//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blur_Radial_Fast" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 53989
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + (-vec2(_Value2, _Value3));
    u_xlat2 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.150000006, 0.300000012, 0.450000018, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat3 = u_xlat0.xyxy * u_xlat2.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
    u_xlat2 = u_xlat0.xyxy * u_xlat2.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat1 = u_xlat1 + u_xlat4;
    u_xlat1 = u_xlat3 + u_xlat1;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat2 + u_xlat1;
    u_xlat2.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.75, 0.900000036, 1.05000007) + vec3(1.0, 1.0, 1.0);
    u_xlat3 = u_xlat0.xyxy * u_xlat2.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.zz + vec2(_Value2, _Value3);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat1 = u_xlat3 + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(0.125, 0.125, 0.125, 0.125);
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
; Bound: 234
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %12 %228 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 12 
                                                OpMemberDecorate %14 0 Offset 14 
                                                OpMemberDecorate %14 1 Offset 14 
                                                OpMemberDecorate %14 2 Offset 14 
                                                OpMemberDecorate %14 3 Offset 14 
                                                OpDecorate %14 Block 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate %33 DescriptorSet 33 
                                                OpDecorate %33 Binding 33 
                                                OpDecorate %37 DescriptorSet 37 
                                                OpDecorate %37 Binding 37 
                                                OpDecorate %228 Location 228 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 2 
                                        %11 = OpTypePointer Input %10 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %14 = OpTypeStruct %6 %6 %6 %7 
                                        %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                        %17 = OpTypeInt 32 1 
                                    i32 %18 = OpConstant 3 
                                        %19 = OpTypePointer Uniform %7 
                         Private f32_4* %30 = OpVariable Private 
                                        %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %32 = OpTypePointer UniformConstant %31 
   UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                        %35 = OpTypeSampler 
                                        %36 = OpTypePointer UniformConstant %35 
               UniformConstant sampler* %37 = OpVariable UniformConstant 
                                        %39 = OpTypeSampledImage %31 
                                    i32 %46 = OpConstant 1 
                                        %47 = OpTypePointer Uniform %6 
                                    i32 %50 = OpConstant 2 
                         Private f32_4* %58 = OpVariable Private 
                                    i32 %59 = OpConstant 0 
                                    f32 %74 = OpConstant 3.674022E-40 
                                    f32 %75 = OpConstant 3.674022E-40 
                                    f32 %76 = OpConstant 3.674022E-40 
                                    f32 %77 = OpConstant 3.674022E-40 
                                  f32_4 %78 = OpConstantComposite %74 %75 %76 %77 
                                    f32 %80 = OpConstant 3.674022E-40 
                                  f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
                         Private f32_4* %83 = OpVariable Private 
                        Private f32_4* %114 = OpVariable Private 
                                       %157 = OpTypeVector %6 3 
                                   f32 %163 = OpConstant 3.674022E-40 
                                   f32 %164 = OpConstant 3.674022E-40 
                                   f32 %165 = OpConstant 3.674022E-40 
                                 f32_3 %166 = OpConstantComposite %163 %164 %165 
                                 f32_3 %168 = OpConstantComposite %80 %80 %80 
                                       %227 = OpTypePointer Output %7 
                         Output f32_4* %228 = OpVariable Output 
                                   f32 %230 = OpConstant 3.674022E-40 
                                 f32_4 %231 = OpConstantComposite %230 %230 %230 %230 
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
                    read_only Texture2D %34 = OpLoad %33 
                                sampler %38 = OpLoad %37 
             read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                                  f32_4 %41 = OpLoad %9 
                                  f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                  f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                                                OpStore %30 %43 
                                  f32_4 %44 = OpLoad %9 
                                  f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                           Uniform f32* %48 = OpAccessChain %16 %46 
                                    f32 %49 = OpLoad %48 
                           Uniform f32* %51 = OpAccessChain %16 %50 
                                    f32 %52 = OpLoad %51 
                                  f32_2 %53 = OpCompositeConstruct %49 %52 
                                  f32_2 %54 = OpFNegate %53 
                                  f32_2 %55 = OpFAdd %45 %54 
                                  f32_4 %56 = OpLoad %9 
                                  f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
                                                OpStore %9 %57 
                           Uniform f32* %60 = OpAccessChain %16 %59 
                                    f32 %61 = OpLoad %60 
                           Uniform f32* %62 = OpAccessChain %16 %59 
                                    f32 %63 = OpLoad %62 
                           Uniform f32* %64 = OpAccessChain %16 %59 
                                    f32 %65 = OpLoad %64 
                           Uniform f32* %66 = OpAccessChain %16 %59 
                                    f32 %67 = OpLoad %66 
                                  f32_4 %68 = OpCompositeConstruct %61 %63 %65 %67 
                                    f32 %69 = OpCompositeExtract %68 0 
                                    f32 %70 = OpCompositeExtract %68 1 
                                    f32 %71 = OpCompositeExtract %68 2 
                                    f32 %72 = OpCompositeExtract %68 3 
                                  f32_4 %73 = OpCompositeConstruct %69 %70 %71 %72 
                                  f32_4 %79 = OpFMul %73 %78 
                                  f32_4 %82 = OpFAdd %79 %81 
                                                OpStore %58 %82 
                                  f32_4 %84 = OpLoad %9 
                                  f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
                                  f32_4 %86 = OpLoad %58 
                                  f32_4 %87 = OpVectorShuffle %86 %86 0 0 1 1 
                                  f32_4 %88 = OpFMul %85 %87 
                           Uniform f32* %89 = OpAccessChain %16 %46 
                                    f32 %90 = OpLoad %89 
                           Uniform f32* %91 = OpAccessChain %16 %50 
                                    f32 %92 = OpLoad %91 
                           Uniform f32* %93 = OpAccessChain %16 %46 
                                    f32 %94 = OpLoad %93 
                           Uniform f32* %95 = OpAccessChain %16 %50 
                                    f32 %96 = OpLoad %95 
                                  f32_4 %97 = OpCompositeConstruct %90 %92 %94 %96 
                                  f32_4 %98 = OpFAdd %88 %97 
                                                OpStore %83 %98 
                                  f32_4 %99 = OpLoad %9 
                                 f32_4 %100 = OpVectorShuffle %99 %99 0 1 0 1 
                                 f32_4 %101 = OpLoad %58 
                                 f32_4 %102 = OpVectorShuffle %101 %101 2 2 3 3 
                                 f32_4 %103 = OpFMul %100 %102 
                          Uniform f32* %104 = OpAccessChain %16 %46 
                                   f32 %105 = OpLoad %104 
                          Uniform f32* %106 = OpAccessChain %16 %50 
                                   f32 %107 = OpLoad %106 
                          Uniform f32* %108 = OpAccessChain %16 %46 
                                   f32 %109 = OpLoad %108 
                          Uniform f32* %110 = OpAccessChain %16 %50 
                                   f32 %111 = OpLoad %110 
                                 f32_4 %112 = OpCompositeConstruct %105 %107 %109 %111 
                                 f32_4 %113 = OpFAdd %103 %112 
                                                OpStore %58 %113 
                   read_only Texture2D %115 = OpLoad %33 
                               sampler %116 = OpLoad %37 
            read_only Texture2DSampled %117 = OpSampledImage %115 %116 
                                 f32_4 %118 = OpLoad %83 
                                 f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                 f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                                OpStore %114 %120 
                   read_only Texture2D %121 = OpLoad %33 
                               sampler %122 = OpLoad %37 
            read_only Texture2DSampled %123 = OpSampledImage %121 %122 
                                 f32_4 %124 = OpLoad %83 
                                 f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                                 f32_4 %126 = OpImageSampleImplicitLod %123 %125 
                                                OpStore %83 %126 
                                 f32_4 %127 = OpLoad %30 
                                 f32_4 %128 = OpLoad %114 
                                 f32_4 %129 = OpFAdd %127 %128 
                                                OpStore %30 %129 
                                 f32_4 %130 = OpLoad %83 
                                 f32_4 %131 = OpLoad %30 
                                 f32_4 %132 = OpFAdd %130 %131 
                                                OpStore %30 %132 
                   read_only Texture2D %133 = OpLoad %33 
                               sampler %134 = OpLoad %37 
            read_only Texture2DSampled %135 = OpSampledImage %133 %134 
                                 f32_4 %136 = OpLoad %58 
                                 f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                                 f32_4 %138 = OpImageSampleImplicitLod %135 %137 
                                                OpStore %83 %138 
                   read_only Texture2D %139 = OpLoad %33 
                               sampler %140 = OpLoad %37 
            read_only Texture2DSampled %141 = OpSampledImage %139 %140 
                                 f32_4 %142 = OpLoad %58 
                                 f32_2 %143 = OpVectorShuffle %142 %142 2 3 
                                 f32_4 %144 = OpImageSampleImplicitLod %141 %143 
                                                OpStore %58 %144 
                                 f32_4 %145 = OpLoad %30 
                                 f32_4 %146 = OpLoad %83 
                                 f32_4 %147 = OpFAdd %145 %146 
                                                OpStore %30 %147 
                                 f32_4 %148 = OpLoad %58 
                                 f32_4 %149 = OpLoad %30 
                                 f32_4 %150 = OpFAdd %148 %149 
                                                OpStore %30 %150 
                          Uniform f32* %151 = OpAccessChain %16 %59 
                                   f32 %152 = OpLoad %151 
                          Uniform f32* %153 = OpAccessChain %16 %59 
                                   f32 %154 = OpLoad %153 
                          Uniform f32* %155 = OpAccessChain %16 %59 
                                   f32 %156 = OpLoad %155 
                                 f32_3 %158 = OpCompositeConstruct %152 %154 %156 
                                   f32 %159 = OpCompositeExtract %158 0 
                                   f32 %160 = OpCompositeExtract %158 1 
                                   f32 %161 = OpCompositeExtract %158 2 
                                 f32_3 %162 = OpCompositeConstruct %159 %160 %161 
                                 f32_3 %167 = OpFMul %162 %166 
                                 f32_3 %169 = OpFAdd %167 %168 
                                 f32_4 %170 = OpLoad %58 
                                 f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                OpStore %58 %171 
                                 f32_4 %172 = OpLoad %9 
                                 f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 1 
                                 f32_4 %174 = OpLoad %58 
                                 f32_4 %175 = OpVectorShuffle %174 %174 0 0 1 1 
                                 f32_4 %176 = OpFMul %173 %175 
                          Uniform f32* %177 = OpAccessChain %16 %46 
                                   f32 %178 = OpLoad %177 
                          Uniform f32* %179 = OpAccessChain %16 %50 
                                   f32 %180 = OpLoad %179 
                          Uniform f32* %181 = OpAccessChain %16 %46 
                                   f32 %182 = OpLoad %181 
                          Uniform f32* %183 = OpAccessChain %16 %50 
                                   f32 %184 = OpLoad %183 
                                 f32_4 %185 = OpCompositeConstruct %178 %180 %182 %184 
                                 f32_4 %186 = OpFAdd %176 %185 
                                                OpStore %83 %186 
                                 f32_4 %187 = OpLoad %9 
                                 f32_2 %188 = OpVectorShuffle %187 %187 0 1 
                                 f32_4 %189 = OpLoad %58 
                                 f32_2 %190 = OpVectorShuffle %189 %189 2 2 
                                 f32_2 %191 = OpFMul %188 %190 
                          Uniform f32* %192 = OpAccessChain %16 %46 
                                   f32 %193 = OpLoad %192 
                          Uniform f32* %194 = OpAccessChain %16 %50 
                                   f32 %195 = OpLoad %194 
                                 f32_2 %196 = OpCompositeConstruct %193 %195 
                                 f32_2 %197 = OpFAdd %191 %196 
                                 f32_4 %198 = OpLoad %9 
                                 f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                                OpStore %9 %199 
                   read_only Texture2D %200 = OpLoad %33 
                               sampler %201 = OpLoad %37 
            read_only Texture2DSampled %202 = OpSampledImage %200 %201 
                                 f32_4 %203 = OpLoad %9 
                                 f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                 f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                OpStore %9 %205 
                   read_only Texture2D %206 = OpLoad %33 
                               sampler %207 = OpLoad %37 
            read_only Texture2DSampled %208 = OpSampledImage %206 %207 
                                 f32_4 %209 = OpLoad %83 
                                 f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                 f32_4 %211 = OpImageSampleImplicitLod %208 %210 
                                                OpStore %58 %211 
                   read_only Texture2D %212 = OpLoad %33 
                               sampler %213 = OpLoad %37 
            read_only Texture2DSampled %214 = OpSampledImage %212 %213 
                                 f32_4 %215 = OpLoad %83 
                                 f32_2 %216 = OpVectorShuffle %215 %215 2 3 
                                 f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                                                OpStore %83 %217 
                                 f32_4 %218 = OpLoad %30 
                                 f32_4 %219 = OpLoad %58 
                                 f32_4 %220 = OpFAdd %218 %219 
                                                OpStore %30 %220 
                                 f32_4 %221 = OpLoad %83 
                                 f32_4 %222 = OpLoad %30 
                                 f32_4 %223 = OpFAdd %221 %222 
                                                OpStore %30 %223 
                                 f32_4 %224 = OpLoad %9 
                                 f32_4 %225 = OpLoad %30 
                                 f32_4 %226 = OpFAdd %224 %225 
                                                OpStore %9 %226 
                                 f32_4 %229 = OpLoad %9 
                                 f32_4 %232 = OpFMul %229 %231 
                                                OpStore %228 %232 
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