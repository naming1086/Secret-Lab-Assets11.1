//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_ARCADE_Fast" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 59279
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
uniform 	float Fade;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = _Value2 * _TimeX;
    u_xlat0.x = u_xlat0.x * 0.666666687;
    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat4.xy);
    u_xlat12 = u_xlat0.x * 1.5 + (-u_xlat1.y);
    u_xlat1.xw = vec2(u_xlat12) * vec2(50.0, -50.0);
    u_xlat1.xw = clamp(u_xlat1.xw, 0.0, 1.0);
    u_xlat2.xy = u_xlat1.xw * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat1.xw = u_xlat1.xw * u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * u_xlat2.xy;
    u_xlat12 = u_xlat1.w + u_xlat1.x;
    u_xlat1.x = u_xlat1.y + 0.0399999991;
    u_xlat5 = u_xlat1.z * _Value3;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat1.x);
    u_xlat1.xz = u_xlat0.xx * vec2(50.0, -50.0);
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
    u_xlat2.xy = u_xlat1.xz * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat1.xz = u_xlat1.xz * u_xlat1.xz;
    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat12;
    u_xlat0.x = u_xlat2.y * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat0.x = u_xlat0.x * _Value;
    u_xlat2.x = u_xlat0.x * Fade + u_xlat4.x;
    u_xlat0.x = abs(u_xlat4.x) * 0.25;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * Fade + 1.0;
    u_xlat2.y = u_xlat0.x * u_xlat4.y;
    u_xlat0.xy = u_xlat2.xy + vec2(0.0187500007, -0.0149999997);
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat8 = u_xlat2.y * _ScreenResolution.y;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyw = u_xlat3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyw = u_xlat2.xyz * vec3(0.180000007, 0.150000006, 0.180000007) + u_xlat0.xyw;
    u_xlat0.xyw = vec3(u_xlat5) * u_xlat0.xyw;
    u_xlat0.xyw = u_xlat0.xyw * vec3(3.46000004, 3.94000006, 3.46000004);
    u_xlat1.x = _TimeX + _TimeX;
    u_xlat8 = u_xlat8 * 1.79999995 + u_xlat1.x;
    u_xlat8 = sin(u_xlat8);
    u_xlat8 = u_xlat8 * 0.174999997 + 0.400000006;
    u_xlat0.xyz = u_xlat0.xyw * vec3(u_xlat8) + (-u_xlat3.xyz);
    SV_Target0.xyz = vec3(Fade) * u_xlat0.xyz + u_xlat3.xyz;
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
; Bound: 359
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %62 %343 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 62 
                                                      OpDecorate %77 DescriptorSet 77 
                                                      OpDecorate %77 Binding 77 
                                                      OpDecorate %81 DescriptorSet 81 
                                                      OpDecorate %81 Binding 81 
                                                      OpDecorate %257 DescriptorSet 257 
                                                      OpDecorate %257 Binding 257 
                                                      OpDecorate %259 DescriptorSet 259 
                                                      OpDecorate %259 Binding 259 
                                                      OpDecorate %343 Location 343 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %7 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 2 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 0 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.674022E-40 
                                              %31 = OpTypeBool 
                                              %32 = OpTypePointer Private %31 
                                Private bool* %33 = OpVariable Private 
                                              %46 = OpTypePointer Function %6 
                                              %58 = OpTypeVector %6 2 
                                              %59 = OpTypePointer Private %58 
                               Private f32_2* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %58 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %64 = OpConstant 6 
                                              %65 = OpTypePointer Uniform %7 
                               Private f32_4* %74 = OpVariable Private 
                                              %75 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %76 = OpTypePointer UniformConstant %75 
         UniformConstant read_only Texture2D* %77 = OpVariable UniformConstant 
                                              %79 = OpTypeSampler 
                                              %80 = OpTypePointer UniformConstant %79 
                     UniformConstant sampler* %81 = OpVariable UniformConstant 
                                              %83 = OpTypeSampledImage %75 
                                 Private f32* %90 = OpVariable Private 
                                          f32 %93 = OpConstant 3.674022E-40 
                               Private f32_2* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.674022E-40 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_2 %104 = OpConstantComposite %102 %103 
                                         f32 %107 = OpConstant 3.674022E-40 
                                         f32 %108 = OpConstant 3.674022E-40 
                                             %112 = OpTypeVector %6 3 
                                             %113 = OpTypePointer Private %112 
                              Private f32_3* %114 = OpVariable Private 
                                         f32 %116 = OpConstant 3.674022E-40 
                                       f32_2 %117 = OpConstantComposite %116 %116 
                                         f32 %119 = OpConstant 3.674022E-40 
                                       f32_2 %120 = OpConstantComposite %119 %119 
                                         u32 %131 = OpConstant 1 
                                         f32 %139 = OpConstant 3.674022E-40 
                                Private f32* %142 = OpVariable Private 
                                         i32 %145 = OpConstant 3 
                                         u32 %192 = OpConstant 2 
                                         f32 %203 = OpConstant 3.674022E-40 
                                         i32 %209 = OpConstant 1 
                                         i32 %216 = OpConstant 4 
                                         f32 %227 = OpConstant 3.674022E-40 
                                         f32 %251 = OpConstant 3.674022E-40 
                                         f32 %252 = OpConstant 3.674022E-40 
                                       f32_2 %253 = OpConstantComposite %251 %252 
        UniformConstant read_only Texture2D* %257 = OpVariable UniformConstant 
                    UniformConstant sampler* %259 = OpVariable UniformConstant 
                                Private f32* %268 = OpVariable Private 
                                         i32 %271 = OpConstant 5 
                                         f32 %286 = OpConstant 3.674022E-40 
                                       f32_3 %287 = OpConstantComposite %286 %286 %286 
                                         f32 %291 = OpConstant 3.674022E-40 
                                         f32 %292 = OpConstant 3.674022E-40 
                                       f32_3 %293 = OpConstantComposite %291 %292 %291 
                                         f32 %308 = OpConstant 3.674022E-40 
                                         f32 %309 = OpConstant 3.674022E-40 
                                       f32_3 %310 = OpConstantComposite %308 %309 %308 
                                         f32 %320 = OpConstant 3.674022E-40 
                                         f32 %327 = OpConstant 3.674022E-40 
                                         f32 %329 = OpConstant 3.674022E-40 
                                             %342 = OpTypePointer Output %7 
                               Output f32_4* %343 = OpVariable Output 
                                         u32 %355 = OpConstant 3 
                                             %356 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %47 = OpVariable Function 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFMul %17 %20 
                                 Private f32* %25 = OpAccessChain %9 %23 
                                                      OpStore %25 %21 
                                 Private f32* %26 = OpAccessChain %9 %23 
                                          f32 %27 = OpLoad %26 
                                          f32 %29 = OpFMul %27 %28 
                                 Private f32* %30 = OpAccessChain %9 %23 
                                                      OpStore %30 %29 
                                 Private f32* %34 = OpAccessChain %9 %23 
                                          f32 %35 = OpLoad %34 
                                 Private f32* %36 = OpAccessChain %9 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                         bool %39 = OpFOrdGreaterThanEqual %35 %38 
                                                      OpStore %33 %39 
                                 Private f32* %40 = OpAccessChain %9 %23 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpExtInst %1 4 %41 
                                          f32 %43 = OpExtInst %1 10 %42 
                                 Private f32* %44 = OpAccessChain %9 %23 
                                                      OpStore %44 %43 
                                         bool %45 = OpLoad %33 
                                                      OpSelectionMerge %49 None 
                                                      OpBranchConditional %45 %48 %52 
                                              %48 = OpLabel 
                                 Private f32* %50 = OpAccessChain %9 %23 
                                          f32 %51 = OpLoad %50 
                                                      OpStore %47 %51 
                                                      OpBranch %49 
                                              %52 = OpLabel 
                                 Private f32* %53 = OpAccessChain %9 %23 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFNegate %54 
                                                      OpStore %47 %55 
                                                      OpBranch %49 
                                              %49 = OpLabel 
                                          f32 %56 = OpLoad %47 
                                 Private f32* %57 = OpAccessChain %9 %23 
                                                      OpStore %57 %56 
                                        f32_2 %63 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %66 = OpAccessChain %12 %64 
                                        f32_4 %67 = OpLoad %66 
                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                        f32_2 %69 = OpFMul %63 %68 
                               Uniform f32_4* %70 = OpAccessChain %12 %64 
                                        f32_4 %71 = OpLoad %70 
                                        f32_2 %72 = OpVectorShuffle %71 %71 2 3 
                                        f32_2 %73 = OpFAdd %69 %72 
                                                      OpStore %60 %73 
                          read_only Texture2D %78 = OpLoad %77 
                                      sampler %82 = OpLoad %81 
                   read_only Texture2DSampled %84 = OpSampledImage %78 %82 
                                        f32_2 %85 = OpLoad %60 
                                        f32_4 %86 = OpImageSampleImplicitLod %84 %85 
                                        f32_2 %87 = OpVectorShuffle %86 %86 1 2 
                                        f32_4 %88 = OpLoad %74 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                                      OpStore %74 %89 
                                 Private f32* %91 = OpAccessChain %9 %23 
                                          f32 %92 = OpLoad %91 
                                          f32 %94 = OpFMul %92 %93 
                                 Private f32* %95 = OpAccessChain %74 %23 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFNegate %96 
                                          f32 %98 = OpFAdd %94 %97 
                                                      OpStore %90 %98 
                                         f32 %100 = OpLoad %90 
                                       f32_2 %101 = OpCompositeConstruct %100 %100 
                                       f32_2 %105 = OpFMul %101 %104 
                                                      OpStore %99 %105 
                                       f32_2 %106 = OpLoad %99 
                                       f32_2 %109 = OpCompositeConstruct %107 %107 
                                       f32_2 %110 = OpCompositeConstruct %108 %108 
                                       f32_2 %111 = OpExtInst %1 43 %106 %109 %110 
                                                      OpStore %99 %111 
                                       f32_2 %115 = OpLoad %99 
                                       f32_2 %118 = OpFMul %115 %117 
                                       f32_2 %121 = OpFAdd %118 %120 
                                       f32_3 %122 = OpLoad %114 
                                       f32_3 %123 = OpVectorShuffle %122 %121 3 4 2 
                                                      OpStore %114 %123 
                                       f32_2 %124 = OpLoad %99 
                                       f32_2 %125 = OpLoad %99 
                                       f32_2 %126 = OpFMul %124 %125 
                                                      OpStore %99 %126 
                                       f32_2 %127 = OpLoad %99 
                                       f32_3 %128 = OpLoad %114 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFMul %127 %129 
                                                      OpStore %99 %130 
                                Private f32* %132 = OpAccessChain %99 %131 
                                         f32 %133 = OpLoad %132 
                                Private f32* %134 = OpAccessChain %99 %23 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFAdd %133 %135 
                                                      OpStore %90 %136 
                                Private f32* %137 = OpAccessChain %74 %23 
                                         f32 %138 = OpLoad %137 
                                         f32 %140 = OpFAdd %138 %139 
                                Private f32* %141 = OpAccessChain %74 %23 
                                                      OpStore %141 %140 
                                Private f32* %143 = OpAccessChain %74 %131 
                                         f32 %144 = OpLoad %143 
                                Uniform f32* %146 = OpAccessChain %12 %145 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                Private f32* %149 = OpAccessChain %9 %23 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %150 %93 
                                Private f32* %152 = OpAccessChain %74 %23 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFNegate %153 
                                         f32 %155 = OpFAdd %151 %154 
                                Private f32* %156 = OpAccessChain %9 %23 
                                                      OpStore %156 %155 
                                       f32_4 %157 = OpLoad %9 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 0 
                                       f32_2 %159 = OpFMul %158 %104 
                                       f32_4 %160 = OpLoad %74 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 3 
                                                      OpStore %74 %161 
                                       f32_4 %162 = OpLoad %74 
                                       f32_2 %163 = OpVectorShuffle %162 %162 0 2 
                                       f32_2 %164 = OpCompositeConstruct %107 %107 
                                       f32_2 %165 = OpCompositeConstruct %108 %108 
                                       f32_2 %166 = OpExtInst %1 43 %163 %164 %165 
                                       f32_4 %167 = OpLoad %74 
                                       f32_4 %168 = OpVectorShuffle %167 %166 4 1 5 3 
                                                      OpStore %74 %168 
                                       f32_4 %169 = OpLoad %74 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 2 
                                       f32_2 %171 = OpFMul %170 %117 
                                       f32_2 %172 = OpFAdd %171 %120 
                                       f32_3 %173 = OpLoad %114 
                                       f32_3 %174 = OpVectorShuffle %173 %172 3 4 2 
                                                      OpStore %114 %174 
                                       f32_4 %175 = OpLoad %74 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 2 
                                       f32_4 %177 = OpLoad %74 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 2 
                                       f32_2 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %74 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 1 5 3 
                                                      OpStore %74 %181 
                                Private f32* %182 = OpAccessChain %114 %23 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %74 %23 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                         f32 %187 = OpLoad %90 
                                         f32 %188 = OpFAdd %186 %187 
                                Private f32* %189 = OpAccessChain %9 %23 
                                                      OpStore %189 %188 
                                Private f32* %190 = OpAccessChain %114 %131 
                                         f32 %191 = OpLoad %190 
                                Private f32* %193 = OpAccessChain %74 %192 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFMul %191 %194 
                                Private f32* %196 = OpAccessChain %9 %23 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFAdd %195 %197 
                                Private f32* %199 = OpAccessChain %9 %23 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %9 %23 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFNegate %201 
                                         f32 %204 = OpFMul %202 %203 
                                         f32 %205 = OpFAdd %204 %108 
                                Private f32* %206 = OpAccessChain %9 %23 
                                                      OpStore %206 %205 
                                Private f32* %207 = OpAccessChain %9 %23 
                                         f32 %208 = OpLoad %207 
                                Uniform f32* %210 = OpAccessChain %12 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFMul %208 %211 
                                Private f32* %213 = OpAccessChain %9 %23 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %9 %23 
                                         f32 %215 = OpLoad %214 
                                Uniform f32* %217 = OpAccessChain %12 %216 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %215 %218 
                                Private f32* %220 = OpAccessChain %60 %23 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFAdd %219 %221 
                                Private f32* %223 = OpAccessChain %114 %23 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %60 %23 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpExtInst %1 4 %225 
                                         f32 %228 = OpFMul %226 %227 
                                Private f32* %229 = OpAccessChain %9 %23 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %9 %23 
                                         f32 %231 = OpLoad %230 
                                Private f32* %232 = OpAccessChain %9 %23 
                                         f32 %233 = OpLoad %232 
                                         f32 %234 = OpFMul %231 %233 
                                Private f32* %235 = OpAccessChain %9 %23 
                                                      OpStore %235 %234 
                                Private f32* %236 = OpAccessChain %9 %23 
                                         f32 %237 = OpLoad %236 
                                Uniform f32* %238 = OpAccessChain %12 %216 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFMul %237 %239 
                                         f32 %241 = OpFAdd %240 %108 
                                Private f32* %242 = OpAccessChain %9 %23 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %9 %23 
                                         f32 %244 = OpLoad %243 
                                Private f32* %245 = OpAccessChain %60 %131 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFMul %244 %246 
                                Private f32* %248 = OpAccessChain %114 %131 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %114 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                       f32_2 %254 = OpFAdd %250 %253 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                                      OpStore %9 %256 
                         read_only Texture2D %258 = OpLoad %257 
                                     sampler %260 = OpLoad %259 
                  read_only Texture2DSampled %261 = OpSampledImage %258 %260 
                                       f32_3 %262 = OpLoad %114 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_4 %264 = OpImageSampleImplicitLod %261 %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_4 %266 = OpLoad %74 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 1 5 6 
                                                      OpStore %74 %267 
                                Private f32* %269 = OpAccessChain %114 %131 
                                         f32 %270 = OpLoad %269 
                                Uniform f32* %272 = OpAccessChain %12 %271 %131 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFMul %270 %273 
                                                      OpStore %268 %274 
                         read_only Texture2D %275 = OpLoad %257 
                                     sampler %276 = OpLoad %259 
                  read_only Texture2DSampled %277 = OpSampledImage %275 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_2 %279 = OpVectorShuffle %278 %278 0 1 
                                       f32_4 %280 = OpImageSampleImplicitLod %277 %279 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 2 6 
                                                      OpStore %9 %283 
                                       f32_4 %284 = OpLoad %74 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 2 3 
                                       f32_3 %288 = OpFAdd %285 %287 
                                                      OpStore %114 %288 
                                       f32_4 %289 = OpLoad %9 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 1 3 
                                       f32_3 %294 = OpFMul %290 %293 
                                       f32_3 %295 = OpLoad %114 
                                       f32_3 %296 = OpFAdd %294 %295 
                                       f32_4 %297 = OpLoad %9 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 2 6 
                                                      OpStore %9 %298 
                                         f32 %299 = OpLoad %142 
                                       f32_3 %300 = OpCompositeConstruct %299 %299 %299 
                                       f32_4 %301 = OpLoad %9 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 3 
                                       f32_3 %303 = OpFMul %300 %302 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpVectorShuffle %304 %303 4 5 2 6 
                                                      OpStore %9 %305 
                                       f32_4 %306 = OpLoad %9 
                                       f32_3 %307 = OpVectorShuffle %306 %306 0 1 3 
                                       f32_3 %311 = OpFMul %307 %310 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 2 6 
                                                      OpStore %9 %313 
                                Uniform f32* %314 = OpAccessChain %12 %18 
                                         f32 %315 = OpLoad %314 
                                Uniform f32* %316 = OpAccessChain %12 %18 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFAdd %315 %317 
                                                      OpStore %142 %318 
                                         f32 %319 = OpLoad %268 
                                         f32 %321 = OpFMul %319 %320 
                                         f32 %322 = OpLoad %142 
                                         f32 %323 = OpFAdd %321 %322 
                                                      OpStore %268 %323 
                                         f32 %324 = OpLoad %268 
                                         f32 %325 = OpExtInst %1 13 %324 
                                                      OpStore %268 %325 
                                         f32 %326 = OpLoad %268 
                                         f32 %328 = OpFMul %326 %327 
                                         f32 %330 = OpFAdd %328 %329 
                                                      OpStore %268 %330 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 3 
                                         f32 %333 = OpLoad %268 
                                       f32_3 %334 = OpCompositeConstruct %333 %333 %333 
                                       f32_3 %335 = OpFMul %332 %334 
                                       f32_4 %336 = OpLoad %74 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 2 3 
                                       f32_3 %338 = OpFNegate %337 
                                       f32_3 %339 = OpFAdd %335 %338 
                                       f32_4 %340 = OpLoad %9 
                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
                                                      OpStore %9 %341 
                                Uniform f32* %344 = OpAccessChain %12 %216 
                                         f32 %345 = OpLoad %344 
                                       f32_3 %346 = OpCompositeConstruct %345 %345 %345 
                                       f32_4 %347 = OpLoad %9 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_4 %350 = OpLoad %74 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 2 3 
                                       f32_3 %352 = OpFAdd %349 %351 
                                       f32_4 %353 = OpLoad %343 
                                       f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                      OpStore %343 %354 
                                 Output f32* %357 = OpAccessChain %343 %355 
                                                      OpStore %357 %108 
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