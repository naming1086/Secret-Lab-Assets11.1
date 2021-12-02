//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Atmosphere_Rain" {
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
  GpuProgramID 22162
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
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D Texture2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10.xy = u_xlat0.xy * vec2(vec2(_Value5, _Value5));
    u_xlat10.x = _Value3 * u_xlat10.y + u_xlat10.x;
    u_xlat1.x = u_xlat10.x * 3.0 + 0.100000001;
    u_xlat2.x = u_xlat1.x * 0.649999976 + 0.100000001;
    u_xlat10.x = _TimeX * _Value4;
    u_xlat3.xyz = u_xlat10.xxx * vec3(0.800000012, 1.20000005, 0.400000006);
    u_xlat1.y = u_xlat10.y * 3.0 + u_xlat3.x;
    u_xlat2.y = u_xlat1.y * 0.649999976 + u_xlat10.x;
    u_xlat1 = texture(Texture2, u_xlat1.xy);
    u_xlat10.x = u_xlat1.x * _Value2;
    u_xlat1 = texture(Texture2, u_xlat2.xy);
    u_xlat4.x = u_xlat2.x * 0.649999976 + 0.100000001;
    u_xlat4.y = u_xlat2.y * 0.649999976 + u_xlat3.y;
    u_xlat15 = u_xlat1.x * _Value2;
    u_xlat15 = u_xlat15 * 0.5;
    u_xlat10.x = u_xlat10.x * 0.300000012 + u_xlat15;
    u_xlat1 = texture(Texture2, u_xlat4.xy);
    u_xlat2.x = u_xlat4.x * 0.5 + 0.100000001;
    u_xlat2.y = u_xlat4.y * 0.5 + u_xlat3.y;
    u_xlat15 = u_xlat1.x * _Value2;
    u_xlat10.x = u_xlat15 * 0.699999988 + u_xlat10.x;
    u_xlat1 = texture(Texture2, u_xlat2.xy);
    u_xlat4.x = u_xlat2.x * 0.400000006 + 0.100000001;
    u_xlat4.y = u_xlat2.y * 0.400000006 + u_xlat3.y;
    u_xlat2.x = u_xlat0.x * 0.00100000005 + u_xlat3.z;
    u_xlat3 = texture(Texture2, u_xlat4.xy);
    u_xlat15 = u_xlat3.x * _Value2;
    u_xlat1.x = u_xlat1.x * _Value2;
    u_xlat10.x = u_xlat1.x * 0.899999976 + u_xlat10.x;
    u_xlat10.x = u_xlat15 * 0.899999976 + u_xlat10.x;
    u_xlat1.xy = u_xlat10.xx * vec2(vec2(_Value6, _Value6)) + u_xlat0.xy;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat10.xxxx + u_xlat1;
    u_xlat0 = (-u_xlat3) + u_xlat0;
    u_xlat0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat3;
    u_xlat2.y = 0.0;
    u_xlat1 = texture(Texture2, u_xlat2.xy);
    u_xlat1.x = u_xlat1.y * _Value2;
    u_xlat1.x = u_xlat1.x * _Value7;
    u_xlat0 = u_xlat1.xxxx * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat0;
    u_xlat0 = (-u_xlat3) + u_xlat0;
    SV_Target0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat3;
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
; Bound: 397
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %27 %377 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %12 0 Offset 12 
                                                      OpMemberDecorate %12 1 Offset 12 
                                                      OpMemberDecorate %12 2 Offset 12 
                                                      OpMemberDecorate %12 3 Offset 12 
                                                      OpMemberDecorate %12 4 Offset 12 
                                                      OpMemberDecorate %12 5 Offset 12 
                                                      OpMemberDecorate %12 6 Offset 12 
                                                      OpMemberDecorate %12 7 Offset 12 
                                                      OpMemberDecorate %12 8 Offset 12 
                                                      OpMemberDecorate %12 9 Offset 12 
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 27 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %142 DescriptorSet 142 
                                                      OpDecorate %142 Binding 142 
                                                      OpDecorate %305 DescriptorSet 305 
                                                      OpDecorate %305 Binding 305 
                                                      OpDecorate %307 DescriptorSet 307 
                                                      OpDecorate %307 Binding 307 
                                                      OpDecorate %377 Location 377 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                              %10 = OpTypeVector %9 2 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %9 %9 %9 %10 %11 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 8 
                                              %17 = OpTypeInt 32 0 
                                          u32 %18 = OpConstant 1 
                                              %19 = OpTypePointer Uniform %9 
                                          f32 %22 = OpConstant 3.674022E-40 
                                              %24 = OpTypePointer Private %11 
                               Private f32_4* %25 = OpVariable Private 
                                              %26 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %29 = OpConstant 9 
                                              %30 = OpTypePointer Uniform %11 
                                              %41 = OpTypePointer Private %10 
                               Private f32_2* %42 = OpVariable Private 
                                              %43 = OpTypePointer Private %9 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          u32 %49 = OpConstant 0 
                                              %52 = OpTypePointer Function %9 
                                          u32 %62 = OpConstant 2 
                               Private f32_4* %64 = OpVariable Private 
                                          i32 %67 = OpConstant 5 
                                          i32 %79 = OpConstant 3 
                               Private f32_4* %89 = OpVariable Private 
                                          f32 %92 = OpConstant 3.674022E-40 
                                          f32 %94 = OpConstant 3.674022E-40 
                               Private f32_2* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.674022E-40 
                                         i32 %104 = OpConstant 0 
                                         i32 %107 = OpConstant 4 
                                             %112 = OpTypeVector %9 3 
                                             %113 = OpTypePointer Private %112 
                              Private f32_3* %114 = OpVariable Private 
                                         f32 %117 = OpConstant 3.674022E-40 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                       f32_3 %120 = OpConstantComposite %117 %118 %119 
                                             %136 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                             %137 = OpTypePointer UniformConstant %136 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                                             %140 = OpTypeSampler 
                                             %141 = OpTypePointer UniformConstant %140 
                    UniformConstant sampler* %142 = OpVariable UniformConstant 
                                             %144 = OpTypeSampledImage %136 
                                         i32 %153 = OpConstant 2 
                                         f32 %185 = OpConstant 3.674022E-40 
                                         f32 %190 = OpConstant 3.674022E-40 
                                         f32 %224 = OpConstant 3.674022E-40 
                                         f32 %251 = OpConstant 3.674022E-40 
                                         f32 %277 = OpConstant 3.674022E-40 
                                         i32 %292 = OpConstant 6 
        UniformConstant read_only Texture2D* %305 = OpVariable UniformConstant 
                    UniformConstant sampler* %307 = OpVariable UniformConstant 
                                         i32 %326 = OpConstant 1 
                                         i32 %361 = OpConstant 7 
                                       f32_4 %368 = OpConstantComposite %277 %277 %277 %277 
                                             %376 = OpTypePointer Output %11 
                               Output f32_4* %377 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %53 = OpVariable Function 
                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
                                          f32 %21 = OpLoad %20 
                                         bool %23 = OpFOrdLessThan %21 %22 
                                                      OpStore %8 %23 
                                        f32_2 %28 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %31 = OpAccessChain %14 %29 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %34 = OpFMul %28 %33 
                               Uniform f32_4* %35 = OpAccessChain %14 %29 
                                        f32_4 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 2 3 
                                        f32_2 %38 = OpFAdd %34 %37 
                                        f32_4 %39 = OpLoad %25 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                                      OpStore %25 %40 
                                 Private f32* %44 = OpAccessChain %25 %18 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFNegate %45 
                                          f32 %48 = OpFAdd %46 %47 
                                 Private f32* %50 = OpAccessChain %42 %49 
                                                      OpStore %50 %48 
                                         bool %51 = OpLoad %8 
                                                      OpSelectionMerge %55 None 
                                                      OpBranchConditional %51 %54 %58 
                                              %54 = OpLabel 
                                 Private f32* %56 = OpAccessChain %42 %49 
                                          f32 %57 = OpLoad %56 
                                                      OpStore %53 %57 
                                                      OpBranch %55 
                                              %58 = OpLabel 
                                 Private f32* %59 = OpAccessChain %25 %18 
                                          f32 %60 = OpLoad %59 
                                                      OpStore %53 %60 
                                                      OpBranch %55 
                                              %55 = OpLabel 
                                          f32 %61 = OpLoad %53 
                                 Private f32* %63 = OpAccessChain %25 %62 
                                                      OpStore %63 %61 
                                        f32_4 %65 = OpLoad %25 
                                        f32_2 %66 = OpVectorShuffle %65 %65 0 2 
                                 Uniform f32* %68 = OpAccessChain %14 %67 
                                          f32 %69 = OpLoad %68 
                                 Uniform f32* %70 = OpAccessChain %14 %67 
                                          f32 %71 = OpLoad %70 
                                        f32_2 %72 = OpCompositeConstruct %69 %71 
                                          f32 %73 = OpCompositeExtract %72 0 
                                          f32 %74 = OpCompositeExtract %72 1 
                                        f32_2 %75 = OpCompositeConstruct %73 %74 
                                        f32_2 %76 = OpFMul %66 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 2 3 
                                                      OpStore %64 %78 
                                 Uniform f32* %80 = OpAccessChain %14 %79 
                                          f32 %81 = OpLoad %80 
                                 Private f32* %82 = OpAccessChain %64 %18 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFMul %81 %83 
                                 Private f32* %85 = OpAccessChain %64 %49 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFAdd %84 %86 
                                 Private f32* %88 = OpAccessChain %64 %49 
                                                      OpStore %88 %87 
                                 Private f32* %90 = OpAccessChain %64 %49 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFMul %91 %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %89 %49 
                                                      OpStore %96 %95 
                                 Private f32* %98 = OpAccessChain %89 %49 
                                          f32 %99 = OpLoad %98 
                                         f32 %101 = OpFMul %99 %100 
                                         f32 %102 = OpFAdd %101 %94 
                                Private f32* %103 = OpAccessChain %97 %49 
                                                      OpStore %103 %102 
                                Uniform f32* %105 = OpAccessChain %14 %104 
                                         f32 %106 = OpLoad %105 
                                Uniform f32* %108 = OpAccessChain %14 %107 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %106 %109 
                                Private f32* %111 = OpAccessChain %64 %49 
                                                      OpStore %111 %110 
                                       f32_4 %115 = OpLoad %64 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 0 0 
                                       f32_3 %121 = OpFMul %116 %120 
                                                      OpStore %114 %121 
                                Private f32* %122 = OpAccessChain %64 %18 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %123 %92 
                                Private f32* %125 = OpAccessChain %114 %49 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %89 %18 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %89 %18 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %130 %100 
                                Private f32* %132 = OpAccessChain %64 %49 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFAdd %131 %133 
                                Private f32* %135 = OpAccessChain %97 %18 
                                                      OpStore %135 %134 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %143 = OpLoad %142 
                  read_only Texture2DSampled %145 = OpSampledImage %139 %143 
                                       f32_4 %146 = OpLoad %89 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_4 %148 = OpImageSampleImplicitLod %145 %147 
                                         f32 %149 = OpCompositeExtract %148 0 
                                Private f32* %150 = OpAccessChain %64 %49 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %64 %49 
                                         f32 %152 = OpLoad %151 
                                Uniform f32* %154 = OpAccessChain %14 %153 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %152 %155 
                                Private f32* %157 = OpAccessChain %64 %49 
                                                      OpStore %157 %156 
                         read_only Texture2D %158 = OpLoad %138 
                                     sampler %159 = OpLoad %142 
                  read_only Texture2DSampled %160 = OpSampledImage %158 %159 
                                       f32_2 %161 = OpLoad %97 
                                       f32_4 %162 = OpImageSampleImplicitLod %160 %161 
                                         f32 %163 = OpCompositeExtract %162 0 
                                Private f32* %164 = OpAccessChain %42 %49 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %97 %49 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %166 %100 
                                         f32 %168 = OpFAdd %167 %94 
                                Private f32* %169 = OpAccessChain %89 %49 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %97 %18 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFMul %171 %100 
                                Private f32* %173 = OpAccessChain %114 %18 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFAdd %172 %174 
                                Private f32* %176 = OpAccessChain %89 %18 
                                                      OpStore %176 %175 
                                Private f32* %177 = OpAccessChain %42 %49 
                                         f32 %178 = OpLoad %177 
                                Uniform f32* %179 = OpAccessChain %14 %153 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFMul %178 %180 
                                Private f32* %182 = OpAccessChain %42 %49 
                                                      OpStore %182 %181 
                                Private f32* %183 = OpAccessChain %42 %49 
                                         f32 %184 = OpLoad %183 
                                         f32 %186 = OpFMul %184 %185 
                                Private f32* %187 = OpAccessChain %42 %49 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %64 %49 
                                         f32 %189 = OpLoad %188 
                                         f32 %191 = OpFMul %189 %190 
                                Private f32* %192 = OpAccessChain %42 %49 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %64 %49 
                                                      OpStore %195 %194 
                         read_only Texture2D %196 = OpLoad %138 
                                     sampler %197 = OpLoad %142 
                  read_only Texture2DSampled %198 = OpSampledImage %196 %197 
                                       f32_4 %199 = OpLoad %89 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                       f32_4 %201 = OpImageSampleImplicitLod %198 %200 
                                         f32 %202 = OpCompositeExtract %201 0 
                                Private f32* %203 = OpAccessChain %42 %49 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %89 %49 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %205 %185 
                                         f32 %207 = OpFAdd %206 %94 
                                Private f32* %208 = OpAccessChain %97 %49 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %89 %18 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFMul %210 %185 
                                Private f32* %212 = OpAccessChain %114 %18 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFAdd %211 %213 
                                Private f32* %215 = OpAccessChain %97 %18 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %42 %49 
                                         f32 %217 = OpLoad %216 
                                Uniform f32* %218 = OpAccessChain %14 %153 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %217 %219 
                                Private f32* %221 = OpAccessChain %42 %49 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %42 %49 
                                         f32 %223 = OpLoad %222 
                                         f32 %225 = OpFMul %223 %224 
                                Private f32* %226 = OpAccessChain %64 %49 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpFAdd %225 %227 
                                Private f32* %229 = OpAccessChain %64 %49 
                                                      OpStore %229 %228 
                         read_only Texture2D %230 = OpLoad %138 
                                     sampler %231 = OpLoad %142 
                  read_only Texture2DSampled %232 = OpSampledImage %230 %231 
                                       f32_2 %233 = OpLoad %97 
                                       f32_4 %234 = OpImageSampleImplicitLod %232 %233 
                                         f32 %235 = OpCompositeExtract %234 0 
                                Private f32* %236 = OpAccessChain %42 %49 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %97 %49 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFMul %238 %119 
                                         f32 %240 = OpFAdd %239 %94 
                                Private f32* %241 = OpAccessChain %89 %49 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %97 %18 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %243 %119 
                                Private f32* %245 = OpAccessChain %114 %18 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFAdd %244 %246 
                                Private f32* %248 = OpAccessChain %89 %18 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %25 %49 
                                         f32 %250 = OpLoad %249 
                                         f32 %252 = OpFMul %250 %251 
                                Private f32* %253 = OpAccessChain %114 %62 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpFAdd %252 %254 
                                Private f32* %256 = OpAccessChain %97 %49 
                                                      OpStore %256 %255 
                         read_only Texture2D %257 = OpLoad %138 
                                     sampler %258 = OpLoad %142 
                  read_only Texture2DSampled %259 = OpSampledImage %257 %258 
                                       f32_4 %260 = OpLoad %89 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_4 %262 = OpImageSampleImplicitLod %259 %261 
                                         f32 %263 = OpCompositeExtract %262 0 
                                Private f32* %264 = OpAccessChain %42 %18 
                                                      OpStore %264 %263 
                                       f32_2 %265 = OpLoad %42 
                                Uniform f32* %266 = OpAccessChain %14 %153 
                                         f32 %267 = OpLoad %266 
                                Uniform f32* %268 = OpAccessChain %14 %153 
                                         f32 %269 = OpLoad %268 
                                       f32_2 %270 = OpCompositeConstruct %267 %269 
                                         f32 %271 = OpCompositeExtract %270 0 
                                         f32 %272 = OpCompositeExtract %270 1 
                                       f32_2 %273 = OpCompositeConstruct %271 %272 
                                       f32_2 %274 = OpFMul %265 %273 
                                                      OpStore %42 %274 
                                Private f32* %275 = OpAccessChain %42 %49 
                                         f32 %276 = OpLoad %275 
                                         f32 %278 = OpFMul %276 %277 
                                Private f32* %279 = OpAccessChain %64 %49 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFAdd %278 %280 
                                Private f32* %282 = OpAccessChain %64 %49 
                                                      OpStore %282 %281 
                                Private f32* %283 = OpAccessChain %42 %18 
                                         f32 %284 = OpLoad %283 
                                         f32 %285 = OpFMul %284 %277 
                                Private f32* %286 = OpAccessChain %64 %49 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpFAdd %285 %287 
                                Private f32* %289 = OpAccessChain %64 %49 
                                                      OpStore %289 %288 
                                       f32_4 %290 = OpLoad %64 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 0 
                                Uniform f32* %293 = OpAccessChain %14 %292 
                                         f32 %294 = OpLoad %293 
                                Uniform f32* %295 = OpAccessChain %14 %292 
                                         f32 %296 = OpLoad %295 
                                       f32_2 %297 = OpCompositeConstruct %294 %296 
                                         f32 %298 = OpCompositeExtract %297 0 
                                         f32 %299 = OpCompositeExtract %297 1 
                                       f32_2 %300 = OpCompositeConstruct %298 %299 
                                       f32_2 %301 = OpFMul %291 %300 
                                       f32_4 %302 = OpLoad %25 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_2 %304 = OpFAdd %301 %303 
                                                      OpStore %42 %304 
                         read_only Texture2D %306 = OpLoad %305 
                                     sampler %308 = OpLoad %307 
                  read_only Texture2DSampled %309 = OpSampledImage %306 %308 
                                       f32_4 %310 = OpLoad %25 
                                       f32_2 %311 = OpVectorShuffle %310 %310 0 1 
                                       f32_4 %312 = OpImageSampleImplicitLod %309 %311 
                                                      OpStore %25 %312 
                         read_only Texture2D %313 = OpLoad %305 
                                     sampler %314 = OpLoad %307 
                  read_only Texture2DSampled %315 = OpSampledImage %313 %314 
                                       f32_2 %316 = OpLoad %42 
                                       f32_4 %317 = OpImageSampleImplicitLod %315 %316 
                                                      OpStore %89 %317 
                                       f32_4 %318 = OpLoad %64 
                                       f32_4 %319 = OpVectorShuffle %318 %318 0 0 0 0 
                                       f32_4 %320 = OpLoad %89 
                                       f32_4 %321 = OpFAdd %319 %320 
                                                      OpStore %64 %321 
                                       f32_4 %322 = OpLoad %25 
                                       f32_4 %323 = OpFNegate %322 
                                       f32_4 %324 = OpLoad %64 
                                       f32_4 %325 = OpFAdd %323 %324 
                                                      OpStore %64 %325 
                                Uniform f32* %327 = OpAccessChain %14 %326 
                                         f32 %328 = OpLoad %327 
                                Uniform f32* %329 = OpAccessChain %14 %326 
                                         f32 %330 = OpLoad %329 
                                Uniform f32* %331 = OpAccessChain %14 %326 
                                         f32 %332 = OpLoad %331 
                                Uniform f32* %333 = OpAccessChain %14 %326 
                                         f32 %334 = OpLoad %333 
                                       f32_4 %335 = OpCompositeConstruct %328 %330 %332 %334 
                                         f32 %336 = OpCompositeExtract %335 0 
                                         f32 %337 = OpCompositeExtract %335 1 
                                         f32 %338 = OpCompositeExtract %335 2 
                                         f32 %339 = OpCompositeExtract %335 3 
                                       f32_4 %340 = OpCompositeConstruct %336 %337 %338 %339 
                                       f32_4 %341 = OpLoad %64 
                                       f32_4 %342 = OpFMul %340 %341 
                                       f32_4 %343 = OpLoad %25 
                                       f32_4 %344 = OpFAdd %342 %343 
                                                      OpStore %64 %344 
                                Private f32* %345 = OpAccessChain %97 %18 
                                                      OpStore %345 %22 
                         read_only Texture2D %346 = OpLoad %138 
                                     sampler %347 = OpLoad %142 
                  read_only Texture2DSampled %348 = OpSampledImage %346 %347 
                                       f32_2 %349 = OpLoad %97 
                                       f32_4 %350 = OpImageSampleImplicitLod %348 %349 
                                         f32 %351 = OpCompositeExtract %350 1 
                                Private f32* %352 = OpAccessChain %89 %49 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %89 %49 
                                         f32 %354 = OpLoad %353 
                                Uniform f32* %355 = OpAccessChain %14 %153 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFMul %354 %356 
                                Private f32* %358 = OpAccessChain %89 %49 
                                                      OpStore %358 %357 
                                Private f32* %359 = OpAccessChain %89 %49 
                                         f32 %360 = OpLoad %359 
                                Uniform f32* %362 = OpAccessChain %14 %361 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFMul %360 %363 
                                Private f32* %365 = OpAccessChain %89 %49 
                                                      OpStore %365 %364 
                                       f32_4 %366 = OpLoad %89 
                                       f32_4 %367 = OpVectorShuffle %366 %366 0 0 0 0 
                                       f32_4 %369 = OpFMul %367 %368 
                                       f32_4 %370 = OpLoad %64 
                                       f32_4 %371 = OpFAdd %369 %370 
                                                      OpStore %64 %371 
                                       f32_4 %372 = OpLoad %25 
                                       f32_4 %373 = OpFNegate %372 
                                       f32_4 %374 = OpLoad %64 
                                       f32_4 %375 = OpFAdd %373 %374 
                                                      OpStore %64 %375 
                                Uniform f32* %378 = OpAccessChain %14 %326 
                                         f32 %379 = OpLoad %378 
                                Uniform f32* %380 = OpAccessChain %14 %326 
                                         f32 %381 = OpLoad %380 
                                Uniform f32* %382 = OpAccessChain %14 %326 
                                         f32 %383 = OpLoad %382 
                                Uniform f32* %384 = OpAccessChain %14 %326 
                                         f32 %385 = OpLoad %384 
                                       f32_4 %386 = OpCompositeConstruct %379 %381 %383 %385 
                                         f32 %387 = OpCompositeExtract %386 0 
                                         f32 %388 = OpCompositeExtract %386 1 
                                         f32 %389 = OpCompositeExtract %386 2 
                                         f32 %390 = OpCompositeExtract %386 3 
                                       f32_4 %391 = OpCompositeConstruct %387 %388 %389 %390 
                                       f32_4 %392 = OpLoad %64 
                                       f32_4 %393 = OpFMul %391 %392 
                                       f32_4 %394 = OpLoad %25 
                                       f32_4 %395 = OpFAdd %393 %394 
                                                      OpStore %377 %395 
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