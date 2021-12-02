//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Screens" {
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
  GpuProgramID 41546
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
uniform 	float _TimeX;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	vec4 _color;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat5;
vec2 u_xlat8;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.xy = u_xlat0.xy * vec2(vec2(_Value, _Value));
    u_xlat8.xy = floor(u_xlat8.xy);
    u_xlat1.x = u_xlat0.x * _Value + (-u_xlat8.x);
    u_xlat8.xy = u_xlat8.xy / vec2(vec2(_Value, _Value));
    u_xlat2 = texture(_MainTex, u_xlat8.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.x = u_xlat1.x + -0.5;
    u_xlat3.x = (-_Value3);
    u_xlat3.y = (-_Value4);
    u_xlat1.xy = u_xlat1.xx * u_xlat1.xx + u_xlat3.xy;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = u_xlat1.x * 12.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat5 = u_xlat2.y + u_xlat2.x;
    u_xlat5 = u_xlat2.z + u_xlat5;
    u_xlat5 = _TimeX * _Value2 + u_xlat5;
    u_xlat9 = floor(u_xlat5);
    u_xlat5 = (-u_xlat9) + u_xlat5;
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat5 = u_xlat5 * 3.0 + -1.79999995;
    u_xlat5 = max(u_xlat5, 0.100000001);
    u_xlat5 = min(u_xlat5, 2.0);
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat1.y = float(1.0);
    u_xlat1.z = float(1.10000002);
    u_xlat2 = u_xlat1.xxxy * _color;
    SV_Target0 = u_xlat2 * u_xlat1.zzzx + u_xlat0;
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
; Bound: 224
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %216 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %216 Location 216 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 6 
                                              %19 = OpTypePointer Uniform %7 
                                              %30 = OpTypePointer Private %10 
                               Private f32_2* %31 = OpVariable Private 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %6 
                                              %47 = OpTypeVector %6 3 
                                              %48 = OpTypePointer Private %47 
                               Private f32_3* %49 = OpVariable Private 
                                              %50 = OpTypeInt 32 0 
                                          u32 %51 = OpConstant 0 
                                              %52 = OpTypePointer Private %6 
                               Private f32_3* %73 = OpVariable Private 
                                              %74 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %75 = OpTypePointer UniformConstant %74 
         UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
                                              %78 = OpTypeSampler 
                                              %79 = OpTypePointer UniformConstant %78 
                     UniformConstant sampler* %80 = OpVariable UniformConstant 
                                              %82 = OpTypeSampledImage %74 
                                          f32 %95 = OpConstant 3.674022E-40 
                               Private f32_4* %98 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         i32 %104 = OpConstant 4 
                                         u32 %108 = OpConstant 1 
                                         f32 %128 = OpConstant 3.674022E-40 
                                         f32 %133 = OpConstant 3.674022E-40 
                                         u32 %150 = OpConstant 2 
                                         i32 %157 = OpConstant 0 
                                         i32 %160 = OpConstant 2 
                                Private f32* %168 = OpVariable Private 
                                         f32 %185 = OpConstant 3.674022E-40 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %192 = OpConstant 3.674022E-40 
                                         f32 %197 = OpConstant 3.674022E-40 
                                         f32 %207 = OpConstant 3.674022E-40 
                                         i32 %211 = OpConstant 5 
                                             %215 = OpTypePointer Output %7 
                               Output f32_4* %216 = OpVariable Output 
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
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %16 %34 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %38 = OpAccessChain %16 %34 
                                          f32 %39 = OpLoad %38 
                                        f32_2 %40 = OpCompositeConstruct %37 %39 
                                          f32 %41 = OpCompositeExtract %40 0 
                                          f32 %42 = OpCompositeExtract %40 1 
                                        f32_2 %43 = OpCompositeConstruct %41 %42 
                                        f32_2 %44 = OpFMul %33 %43 
                                                      OpStore %31 %44 
                                        f32_2 %45 = OpLoad %31 
                                        f32_2 %46 = OpExtInst %1 8 %45 
                                                      OpStore %31 %46 
                                 Private f32* %53 = OpAccessChain %9 %51 
                                          f32 %54 = OpLoad %53 
                                 Uniform f32* %55 = OpAccessChain %16 %34 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpFMul %54 %56 
                                 Private f32* %58 = OpAccessChain %31 %51 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFNegate %59 
                                          f32 %61 = OpFAdd %57 %60 
                                 Private f32* %62 = OpAccessChain %49 %51 
                                                      OpStore %62 %61 
                                        f32_2 %63 = OpLoad %31 
                                 Uniform f32* %64 = OpAccessChain %16 %34 
                                          f32 %65 = OpLoad %64 
                                 Uniform f32* %66 = OpAccessChain %16 %34 
                                          f32 %67 = OpLoad %66 
                                        f32_2 %68 = OpCompositeConstruct %65 %67 
                                          f32 %69 = OpCompositeExtract %68 0 
                                          f32 %70 = OpCompositeExtract %68 1 
                                        f32_2 %71 = OpCompositeConstruct %69 %70 
                                        f32_2 %72 = OpFDiv %63 %71 
                                                      OpStore %31 %72 
                          read_only Texture2D %77 = OpLoad %76 
                                      sampler %81 = OpLoad %80 
                   read_only Texture2DSampled %83 = OpSampledImage %77 %81 
                                        f32_2 %84 = OpLoad %31 
                                        f32_4 %85 = OpImageSampleImplicitLod %83 %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                                      OpStore %73 %86 
                          read_only Texture2D %87 = OpLoad %76 
                                      sampler %88 = OpLoad %80 
                   read_only Texture2DSampled %89 = OpSampledImage %87 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_4 %92 = OpImageSampleImplicitLod %89 %91 
                                                      OpStore %9 %92 
                                 Private f32* %93 = OpAccessChain %49 %51 
                                          f32 %94 = OpLoad %93 
                                          f32 %96 = OpFAdd %94 %95 
                                 Private f32* %97 = OpAccessChain %49 %51 
                                                      OpStore %97 %96 
                                Uniform f32* %100 = OpAccessChain %16 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                Private f32* %103 = OpAccessChain %98 %51 
                                                      OpStore %103 %102 
                                Uniform f32* %105 = OpAccessChain %16 %104 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFNegate %106 
                                Private f32* %109 = OpAccessChain %98 %108 
                                                      OpStore %109 %107 
                                       f32_3 %110 = OpLoad %49 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 0 
                                       f32_3 %112 = OpLoad %49 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 0 
                                       f32_2 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %98 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %98 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
                                                      OpStore %98 %119 
                                       f32_4 %120 = OpLoad %98 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
                                       f32_4 %122 = OpLoad %98 
                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                         f32 %124 = OpDot %121 %123 
                                Private f32* %125 = OpAccessChain %49 %51 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %49 %51 
                                         f32 %127 = OpLoad %126 
                                         f32 %129 = OpFMul %127 %128 
                                Private f32* %130 = OpAccessChain %49 %51 
                                                      OpStore %130 %129 
                                Private f32* %131 = OpAccessChain %49 %51 
                                         f32 %132 = OpLoad %131 
                                         f32 %134 = OpExtInst %1 37 %132 %133 
                                Private f32* %135 = OpAccessChain %49 %51 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %49 %51 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                Private f32* %139 = OpAccessChain %49 %51 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFMul %138 %140 
                                         f32 %142 = OpFAdd %141 %133 
                                Private f32* %143 = OpAccessChain %49 %51 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %73 %108 
                                         f32 %145 = OpLoad %144 
                                Private f32* %146 = OpAccessChain %73 %51 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFAdd %145 %147 
                                Private f32* %149 = OpAccessChain %73 %51 
                                                      OpStore %149 %148 
                                Private f32* %151 = OpAccessChain %73 %150 
                                         f32 %152 = OpLoad %151 
                                Private f32* %153 = OpAccessChain %73 %51 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFAdd %152 %154 
                                Private f32* %156 = OpAccessChain %73 %51 
                                                      OpStore %156 %155 
                                Uniform f32* %158 = OpAccessChain %16 %157 
                                         f32 %159 = OpLoad %158 
                                Uniform f32* %161 = OpAccessChain %16 %160 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFMul %159 %162 
                                Private f32* %164 = OpAccessChain %73 %51 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFAdd %163 %165 
                                Private f32* %167 = OpAccessChain %73 %51 
                                                      OpStore %167 %166 
                                Private f32* %169 = OpAccessChain %73 %51 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpExtInst %1 8 %170 
                                                      OpStore %168 %171 
                                         f32 %172 = OpLoad %168 
                                         f32 %173 = OpFNegate %172 
                                Private f32* %174 = OpAccessChain %73 %51 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                Private f32* %177 = OpAccessChain %73 %51 
                                                      OpStore %177 %176 
                                Private f32* %178 = OpAccessChain %73 %51 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFNegate %179 
                                         f32 %181 = OpFAdd %180 %133 
                                Private f32* %182 = OpAccessChain %73 %51 
                                                      OpStore %182 %181 
                                Private f32* %183 = OpAccessChain %73 %51 
                                         f32 %184 = OpLoad %183 
                                         f32 %186 = OpFMul %184 %185 
                                         f32 %188 = OpFAdd %186 %187 
                                Private f32* %189 = OpAccessChain %73 %51 
                                                      OpStore %189 %188 
                                Private f32* %190 = OpAccessChain %73 %51 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpExtInst %1 40 %191 %192 
                                Private f32* %194 = OpAccessChain %73 %51 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %73 %51 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpExtInst %1 37 %196 %197 
                                Private f32* %199 = OpAccessChain %73 %51 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %49 %51 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %73 %51 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %205 = OpAccessChain %49 %51 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %49 %108 
                                                      OpStore %206 %133 
                                Private f32* %208 = OpAccessChain %49 %150 
                                                      OpStore %208 %207 
                                       f32_3 %209 = OpLoad %49 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 1 
                              Uniform f32_4* %212 = OpAccessChain %16 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_4 %214 = OpFMul %210 %213 
                                                      OpStore %98 %214 
                                       f32_4 %217 = OpLoad %98 
                                       f32_3 %218 = OpLoad %49 
                                       f32_4 %219 = OpVectorShuffle %218 %218 2 2 2 0 
                                       f32_4 %220 = OpFMul %217 %219 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpFAdd %220 %221 
                                                      OpStore %216 %222 
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