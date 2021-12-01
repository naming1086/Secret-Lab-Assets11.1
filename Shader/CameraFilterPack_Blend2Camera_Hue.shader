//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blend2Camera_Hue" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 36537
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = texture(_MainTex2, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat4.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlatb17 = u_xlat4.y>=u_xlat4.z;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.xy = u_xlat4.zy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat4.yz;
    u_xlat0 = vec4(u_xlat17) * u_xlat1.xywz + u_xlat0.xywz;
    u_xlat1.z = u_xlat0.w;
    u_xlatb17 = u_xlat4.x>=u_xlat0.x;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.w = u_xlat4.x;
    u_xlat1.xyw = u_xlat0.wyx;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat0.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat5 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat0.x = u_xlat5 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + u_xlat0.z;
    u_xlat0.xyz = abs(u_xlat0.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = (-_Value2) + 1.0;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat3.yzx + u_xlat2.yzx;
    u_xlatb15 = u_xlat1.x>=u_xlat1.y;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.xy = (-u_xlat1.yx) + u_xlat1.xy;
    u_xlat1.xy = vec2(u_xlat15) * u_xlat2.xy + u_xlat1.yx;
    u_xlatb15 = u_xlat1.z>=u_xlat1.x;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat15 = min(u_xlat1.y, u_xlat1.z);
    u_xlat15 = (-u_xlat15) + u_xlat1.x;
    u_xlat6 = u_xlat1.x + 1.00000001e-10;
    u_xlat15 = u_xlat15 / u_xlat6;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + (-u_xlat4.xyz);
    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat4.xyz;
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
; Bound: 375
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %41 %352 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpMemberDecorate %26 0 Offset 26 
                                                  OpMemberDecorate %26 1 Offset 26 
                                                  OpMemberDecorate %26 2 Offset 26 
                                                  OpMemberDecorate %26 3 Offset 26 
                                                  OpDecorate %26 Block 
                                                  OpDecorate %28 DescriptorSet 28 
                                                  OpDecorate %28 Binding 28 
                                                  OpDecorate vs_TEXCOORD0 Location 41 
                                                  OpDecorate %74 DescriptorSet 74 
                                                  OpDecorate %74 Binding 74 
                                                  OpDecorate %78 DescriptorSet 78 
                                                  OpDecorate %78 Binding 78 
                                                  OpDecorate %86 DescriptorSet 86 
                                                  OpDecorate %86 Binding 86 
                                                  OpDecorate %88 DescriptorSet 88 
                                                  OpDecorate %88 Binding 88 
                                                  OpDecorate %352 Location 352 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                      f32 %10 = OpConstant 3.674022E-40 
                                          %11 = OpTypeInt 32 0 
                                      u32 %12 = OpConstant 2 
                                          %13 = OpTypePointer Private %6 
                                      f32 %15 = OpConstant 3.674022E-40 
                                      u32 %16 = OpConstant 3 
                           Private f32_4* %18 = OpVariable Private 
                                      f32 %19 = OpConstant 3.674022E-40 
                                          %22 = OpTypeBool 
                                          %23 = OpTypePointer Private %22 
                            Private bool* %24 = OpVariable Private 
                                          %25 = OpTypeVector %6 2 
                                          %26 = OpTypeStruct %6 %6 %25 %7 
                                          %27 = OpTypePointer Uniform %26 
Uniform struct {f32; f32; f32_2; f32_4;}* %28 = OpVariable Uniform 
                                          %29 = OpTypeInt 32 1 
                                      i32 %30 = OpConstant 2 
                                      u32 %31 = OpConstant 1 
                                          %32 = OpTypePointer Uniform %6 
                                      f32 %35 = OpConstant 3.674022E-40 
                                          %37 = OpTypeVector %6 3 
                                          %38 = OpTypePointer Private %37 
                           Private f32_3* %39 = OpVariable Private 
                                          %40 = OpTypePointer Input %25 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      i32 %43 = OpConstant 3 
                                          %44 = OpTypePointer Uniform %7 
                             Private f32* %55 = OpVariable Private 
                                          %61 = OpTypePointer Function %6 
                           Private f32_3* %71 = OpVariable Private 
                                          %72 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %73 = OpTypePointer UniformConstant %72 
     UniformConstant read_only Texture2D* %74 = OpVariable UniformConstant 
                                          %76 = OpTypeSampler 
                                          %77 = OpTypePointer UniformConstant %76 
                 UniformConstant sampler* %78 = OpVariable UniformConstant 
                                          %80 = OpTypeSampledImage %72 
     UniformConstant read_only Texture2D* %86 = OpVariable UniformConstant 
                 UniformConstant sampler* %88 = OpVariable UniformConstant 
                           Private f32_3* %99 = OpVariable Private 
                                     i32 %100 = OpConstant 1 
                           Private bool* %116 = OpVariable Private 
                            Private f32* %122 = OpVariable Private 
                                     u32 %148 = OpConstant 0 
                                     f32 %188 = OpConstant 3.674022E-40 
                                     f32 %190 = OpConstant 3.674022E-40 
                            Private f32* %193 = OpVariable Private 
                                     f32 %214 = OpConstant 3.674022E-40 
                                   f32_3 %215 = OpConstantComposite %19 %15 %214 
                                   f32_3 %226 = OpConstantComposite %188 %188 %188 
                                     f32 %228 = OpConstant 3.674022E-40 
                                   f32_3 %229 = OpConstantComposite %228 %228 %228 
                                   f32_3 %236 = OpConstantComposite %10 %10 %10 
                            Private f32* %252 = OpVariable Private 
                           Private bool* %267 = OpVariable Private 
                            Private f32* %325 = OpVariable Private 
                                   f32_3 %337 = OpConstantComposite %19 %19 %19 
                                         %351 = OpTypePointer Output %7 
                           Output f32_4* %352 = OpVariable Output 
                                     i32 %353 = OpConstant 0 
                                         %372 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                            Function f32* %62 = OpVariable Function 
                             Private f32* %14 = OpAccessChain %9 %12 
                                                  OpStore %14 %10 
                             Private f32* %17 = OpAccessChain %9 %16 
                                                  OpStore %17 %15 
                             Private f32* %20 = OpAccessChain %18 %12 
                                                  OpStore %20 %19 
                             Private f32* %21 = OpAccessChain %18 %16 
                                                  OpStore %21 %10 
                             Uniform f32* %33 = OpAccessChain %28 %30 %31 
                                      f32 %34 = OpLoad %33 
                                     bool %36 = OpFOrdLessThan %34 %35 
                                                  OpStore %24 %36 
                                    f32_2 %42 = OpLoad vs_TEXCOORD0 
                           Uniform f32_4* %45 = OpAccessChain %28 %43 
                                    f32_4 %46 = OpLoad %45 
                                    f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                    f32_2 %48 = OpFMul %42 %47 
                           Uniform f32_4* %49 = OpAccessChain %28 %43 
                                    f32_4 %50 = OpLoad %49 
                                    f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                                    f32_2 %52 = OpFAdd %48 %51 
                                    f32_3 %53 = OpLoad %39 
                                    f32_3 %54 = OpVectorShuffle %53 %52 3 4 2 
                                                  OpStore %39 %54 
                             Private f32* %56 = OpAccessChain %39 %31 
                                      f32 %57 = OpLoad %56 
                                      f32 %58 = OpFNegate %57 
                                      f32 %59 = OpFAdd %58 %19 
                                                  OpStore %55 %59 
                                     bool %60 = OpLoad %24 
                                                  OpSelectionMerge %64 None 
                                                  OpBranchConditional %60 %63 %66 
                                          %63 = OpLabel 
                                      f32 %65 = OpLoad %55 
                                                  OpStore %62 %65 
                                                  OpBranch %64 
                                          %66 = OpLabel 
                             Private f32* %67 = OpAccessChain %39 %31 
                                      f32 %68 = OpLoad %67 
                                                  OpStore %62 %68 
                                                  OpBranch %64 
                                          %64 = OpLabel 
                                      f32 %69 = OpLoad %62 
                             Private f32* %70 = OpAccessChain %39 %12 
                                                  OpStore %70 %69 
                      read_only Texture2D %75 = OpLoad %74 
                                  sampler %79 = OpLoad %78 
               read_only Texture2DSampled %81 = OpSampledImage %75 %79 
                                    f32_3 %82 = OpLoad %39 
                                    f32_2 %83 = OpVectorShuffle %82 %82 0 2 
                                    f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                    f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                  OpStore %71 %85 
                      read_only Texture2D %87 = OpLoad %86 
                                  sampler %89 = OpLoad %88 
               read_only Texture2DSampled %90 = OpSampledImage %87 %89 
                                    f32_3 %91 = OpLoad %39 
                                    f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                    f32_4 %93 = OpImageSampleImplicitLod %90 %92 
                                    f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                                  OpStore %39 %94 
                                    f32_3 %95 = OpLoad %71 
                                    f32_3 %96 = OpLoad %39 
                                    f32_3 %97 = OpFNegate %96 
                                    f32_3 %98 = OpFAdd %95 %97 
                                                  OpStore %71 %98 
                            Uniform f32* %101 = OpAccessChain %28 %100 
                                     f32 %102 = OpLoad %101 
                            Uniform f32* %103 = OpAccessChain %28 %100 
                                     f32 %104 = OpLoad %103 
                            Uniform f32* %105 = OpAccessChain %28 %100 
                                     f32 %106 = OpLoad %105 
                                   f32_3 %107 = OpCompositeConstruct %102 %104 %106 
                                     f32 %108 = OpCompositeExtract %107 0 
                                     f32 %109 = OpCompositeExtract %107 1 
                                     f32 %110 = OpCompositeExtract %107 2 
                                   f32_3 %111 = OpCompositeConstruct %108 %109 %110 
                                   f32_3 %112 = OpLoad %71 
                                   f32_3 %113 = OpFMul %111 %112 
                                   f32_3 %114 = OpLoad %39 
                                   f32_3 %115 = OpFAdd %113 %114 
                                                  OpStore %99 %115 
                            Private f32* %117 = OpAccessChain %99 %31 
                                     f32 %118 = OpLoad %117 
                            Private f32* %119 = OpAccessChain %99 %12 
                                     f32 %120 = OpLoad %119 
                                    bool %121 = OpFOrdGreaterThanEqual %118 %120 
                                                  OpStore %116 %121 
                                    bool %123 = OpLoad %116 
                                     f32 %124 = OpSelect %123 %19 %35 
                                                  OpStore %122 %124 
                                   f32_3 %125 = OpLoad %99 
                                   f32_2 %126 = OpVectorShuffle %125 %125 2 1 
                                   f32_4 %127 = OpLoad %9 
                                   f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                  OpStore %9 %128 
                                   f32_4 %129 = OpLoad %9 
                                   f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                   f32_2 %131 = OpFNegate %130 
                                   f32_3 %132 = OpLoad %99 
                                   f32_2 %133 = OpVectorShuffle %132 %132 1 2 
                                   f32_2 %134 = OpFAdd %131 %133 
                                   f32_4 %135 = OpLoad %18 
                                   f32_4 %136 = OpVectorShuffle %135 %134 4 5 2 3 
                                                  OpStore %18 %136 
                                     f32 %137 = OpLoad %122 
                                   f32_4 %138 = OpCompositeConstruct %137 %137 %137 %137 
                                   f32_4 %139 = OpLoad %18 
                                   f32_4 %140 = OpVectorShuffle %139 %139 0 1 3 2 
                                   f32_4 %141 = OpFMul %138 %140 
                                   f32_4 %142 = OpLoad %9 
                                   f32_4 %143 = OpVectorShuffle %142 %142 0 1 3 2 
                                   f32_4 %144 = OpFAdd %141 %143 
                                                  OpStore %9 %144 
                            Private f32* %145 = OpAccessChain %9 %16 
                                     f32 %146 = OpLoad %145 
                            Private f32* %147 = OpAccessChain %18 %12 
                                                  OpStore %147 %146 
                            Private f32* %149 = OpAccessChain %99 %148 
                                     f32 %150 = OpLoad %149 
                            Private f32* %151 = OpAccessChain %9 %148 
                                     f32 %152 = OpLoad %151 
                                    bool %153 = OpFOrdGreaterThanEqual %150 %152 
                                                  OpStore %116 %153 
                                    bool %154 = OpLoad %116 
                                     f32 %155 = OpSelect %154 %19 %35 
                                                  OpStore %122 %155 
                            Private f32* %156 = OpAccessChain %99 %148 
                                     f32 %157 = OpLoad %156 
                            Private f32* %158 = OpAccessChain %9 %16 
                                                  OpStore %158 %157 
                                   f32_4 %159 = OpLoad %9 
                                   f32_3 %160 = OpVectorShuffle %159 %159 3 1 0 
                                   f32_4 %161 = OpLoad %18 
                                   f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 6 
                                                  OpStore %18 %162 
                                   f32_4 %163 = OpLoad %9 
                                   f32_4 %164 = OpFNegate %163 
                                   f32_4 %165 = OpLoad %18 
                                   f32_4 %166 = OpFAdd %164 %165 
                                                  OpStore %18 %166 
                                     f32 %167 = OpLoad %122 
                                   f32_4 %168 = OpCompositeConstruct %167 %167 %167 %167 
                                   f32_4 %169 = OpLoad %18 
                                   f32_4 %170 = OpFMul %168 %169 
                                   f32_4 %171 = OpLoad %9 
                                   f32_4 %172 = OpFAdd %170 %171 
                                                  OpStore %9 %172 
                            Private f32* %173 = OpAccessChain %9 %31 
                                     f32 %174 = OpLoad %173 
                            Private f32* %175 = OpAccessChain %9 %16 
                                     f32 %176 = OpLoad %175 
                                     f32 %177 = OpExtInst %1 37 %174 %176 
                            Private f32* %178 = OpAccessChain %18 %148 
                                                  OpStore %178 %177 
                            Private f32* %179 = OpAccessChain %9 %148 
                                     f32 %180 = OpLoad %179 
                            Private f32* %181 = OpAccessChain %18 %148 
                                     f32 %182 = OpLoad %181 
                                     f32 %183 = OpFNegate %182 
                                     f32 %184 = OpFAdd %180 %183 
                            Private f32* %185 = OpAccessChain %9 %148 
                                                  OpStore %185 %184 
                            Private f32* %186 = OpAccessChain %9 %148 
                                     f32 %187 = OpLoad %186 
                                     f32 %189 = OpFMul %187 %188 
                                     f32 %191 = OpFAdd %189 %190 
                            Private f32* %192 = OpAccessChain %9 %148 
                                                  OpStore %192 %191 
                            Private f32* %194 = OpAccessChain %9 %31 
                                     f32 %195 = OpLoad %194 
                                     f32 %196 = OpFNegate %195 
                            Private f32* %197 = OpAccessChain %9 %16 
                                     f32 %198 = OpLoad %197 
                                     f32 %199 = OpFAdd %196 %198 
                                                  OpStore %193 %199 
                                     f32 %200 = OpLoad %193 
                            Private f32* %201 = OpAccessChain %9 %148 
                                     f32 %202 = OpLoad %201 
                                     f32 %203 = OpFDiv %200 %202 
                            Private f32* %204 = OpAccessChain %9 %148 
                                                  OpStore %204 %203 
                            Private f32* %205 = OpAccessChain %9 %148 
                                     f32 %206 = OpLoad %205 
                            Private f32* %207 = OpAccessChain %9 %12 
                                     f32 %208 = OpLoad %207 
                                     f32 %209 = OpFAdd %206 %208 
                            Private f32* %210 = OpAccessChain %9 %148 
                                                  OpStore %210 %209 
                                   f32_4 %211 = OpLoad %9 
                                   f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                   f32_3 %213 = OpExtInst %1 4 %212 
                                   f32_3 %216 = OpFAdd %213 %215 
                                   f32_4 %217 = OpLoad %9 
                                   f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                                  OpStore %9 %218 
                                   f32_4 %219 = OpLoad %9 
                                   f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                   f32_3 %221 = OpExtInst %1 10 %220 
                                   f32_4 %222 = OpLoad %9 
                                   f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                  OpStore %9 %223 
                                   f32_4 %224 = OpLoad %9 
                                   f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                   f32_3 %227 = OpFMul %225 %226 
                                   f32_3 %230 = OpFAdd %227 %229 
                                   f32_4 %231 = OpLoad %9 
                                   f32_4 %232 = OpVectorShuffle %231 %230 4 5 6 3 
                                                  OpStore %9 %232 
                                   f32_4 %233 = OpLoad %9 
                                   f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                   f32_3 %235 = OpExtInst %1 4 %234 
                                   f32_3 %237 = OpFAdd %235 %236 
                                   f32_4 %238 = OpLoad %9 
                                   f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                  OpStore %9 %239 
                                   f32_4 %240 = OpLoad %9 
                                   f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                   f32_3 %242 = OpCompositeConstruct %35 %35 %35 
                                   f32_3 %243 = OpCompositeConstruct %19 %19 %19 
                                   f32_3 %244 = OpExtInst %1 43 %241 %242 %243 
                                   f32_4 %245 = OpLoad %9 
                                   f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                  OpStore %9 %246 
                                   f32_4 %247 = OpLoad %9 
                                   f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                   f32_3 %249 = OpFAdd %248 %236 
                                   f32_4 %250 = OpLoad %9 
                                   f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                  OpStore %9 %251 
                            Uniform f32* %253 = OpAccessChain %28 %100 
                                     f32 %254 = OpLoad %253 
                                     f32 %255 = OpFNegate %254 
                                     f32 %256 = OpFAdd %255 %19 
                                                  OpStore %252 %256 
                                     f32 %257 = OpLoad %252 
                                   f32_3 %258 = OpCompositeConstruct %257 %257 %257 
                                   f32_3 %259 = OpLoad %71 
                                   f32_3 %260 = OpVectorShuffle %259 %259 1 2 0 
                                   f32_3 %261 = OpFMul %258 %260 
                                   f32_3 %262 = OpLoad %39 
                                   f32_3 %263 = OpVectorShuffle %262 %262 1 2 0 
                                   f32_3 %264 = OpFAdd %261 %263 
                                   f32_4 %265 = OpLoad %18 
                                   f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                  OpStore %18 %266 
                            Private f32* %268 = OpAccessChain %18 %148 
                                     f32 %269 = OpLoad %268 
                            Private f32* %270 = OpAccessChain %18 %31 
                                     f32 %271 = OpLoad %270 
                                    bool %272 = OpFOrdGreaterThanEqual %269 %271 
                                                  OpStore %267 %272 
                                    bool %273 = OpLoad %267 
                                     f32 %274 = OpSelect %273 %19 %35 
                                                  OpStore %252 %274 
                                   f32_4 %275 = OpLoad %18 
                                   f32_2 %276 = OpVectorShuffle %275 %275 1 0 
                                   f32_2 %277 = OpFNegate %276 
                                   f32_4 %278 = OpLoad %18 
                                   f32_2 %279 = OpVectorShuffle %278 %278 0 1 
                                   f32_2 %280 = OpFAdd %277 %279 
                                   f32_3 %281 = OpLoad %71 
                                   f32_3 %282 = OpVectorShuffle %281 %280 3 4 2 
                                                  OpStore %71 %282 
                                     f32 %283 = OpLoad %252 
                                   f32_2 %284 = OpCompositeConstruct %283 %283 
                                   f32_3 %285 = OpLoad %71 
                                   f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                                   f32_2 %287 = OpFMul %284 %286 
                                   f32_4 %288 = OpLoad %18 
                                   f32_2 %289 = OpVectorShuffle %288 %288 1 0 
                                   f32_2 %290 = OpFAdd %287 %289 
                                   f32_4 %291 = OpLoad %18 
                                   f32_4 %292 = OpVectorShuffle %291 %290 4 5 2 3 
                                                  OpStore %18 %292 
                            Private f32* %293 = OpAccessChain %18 %12 
                                     f32 %294 = OpLoad %293 
                            Private f32* %295 = OpAccessChain %18 %148 
                                     f32 %296 = OpLoad %295 
                                    bool %297 = OpFOrdGreaterThanEqual %294 %296 
                                                  OpStore %267 %297 
                                    bool %298 = OpLoad %267 
                                     f32 %299 = OpSelect %298 %19 %35 
                                                  OpStore %252 %299 
                                   f32_4 %300 = OpLoad %18 
                                   f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                   f32_3 %302 = OpFNegate %301 
                                   f32_4 %303 = OpLoad %18 
                                   f32_3 %304 = OpVectorShuffle %303 %303 2 1 0 
                                   f32_3 %305 = OpFAdd %302 %304 
                                                  OpStore %71 %305 
                                     f32 %306 = OpLoad %252 
                                   f32_3 %307 = OpCompositeConstruct %306 %306 %306 
                                   f32_3 %308 = OpLoad %71 
                                   f32_3 %309 = OpFMul %307 %308 
                                   f32_4 %310 = OpLoad %18 
                                   f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                   f32_3 %312 = OpFAdd %309 %311 
                                   f32_4 %313 = OpLoad %18 
                                   f32_4 %314 = OpVectorShuffle %313 %312 4 5 6 3 
                                                  OpStore %18 %314 
                            Private f32* %315 = OpAccessChain %18 %31 
                                     f32 %316 = OpLoad %315 
                            Private f32* %317 = OpAccessChain %18 %12 
                                     f32 %318 = OpLoad %317 
                                     f32 %319 = OpExtInst %1 37 %316 %318 
                                                  OpStore %252 %319 
                                     f32 %320 = OpLoad %252 
                                     f32 %321 = OpFNegate %320 
                            Private f32* %322 = OpAccessChain %18 %148 
                                     f32 %323 = OpLoad %322 
                                     f32 %324 = OpFAdd %321 %323 
                                                  OpStore %252 %324 
                            Private f32* %326 = OpAccessChain %18 %148 
                                     f32 %327 = OpLoad %326 
                                     f32 %328 = OpFAdd %327 %190 
                                                  OpStore %325 %328 
                                     f32 %329 = OpLoad %252 
                                     f32 %330 = OpLoad %325 
                                     f32 %331 = OpFDiv %329 %330 
                                                  OpStore %252 %331 
                                     f32 %332 = OpLoad %252 
                                   f32_3 %333 = OpCompositeConstruct %332 %332 %332 
                                   f32_4 %334 = OpLoad %9 
                                   f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                                   f32_3 %336 = OpFMul %333 %335 
                                   f32_3 %338 = OpFAdd %336 %337 
                                   f32_4 %339 = OpLoad %9 
                                   f32_4 %340 = OpVectorShuffle %339 %338 4 5 6 3 
                                                  OpStore %9 %340 
                                   f32_4 %341 = OpLoad %18 
                                   f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                   f32_4 %343 = OpLoad %9 
                                   f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
                                   f32_3 %345 = OpFMul %342 %344 
                                   f32_3 %346 = OpLoad %99 
                                   f32_3 %347 = OpFNegate %346 
                                   f32_3 %348 = OpFAdd %345 %347 
                                   f32_4 %349 = OpLoad %9 
                                   f32_4 %350 = OpVectorShuffle %349 %348 4 5 6 3 
                                                  OpStore %9 %350 
                            Uniform f32* %354 = OpAccessChain %28 %353 
                                     f32 %355 = OpLoad %354 
                            Uniform f32* %356 = OpAccessChain %28 %353 
                                     f32 %357 = OpLoad %356 
                            Uniform f32* %358 = OpAccessChain %28 %353 
                                     f32 %359 = OpLoad %358 
                                   f32_3 %360 = OpCompositeConstruct %355 %357 %359 
                                     f32 %361 = OpCompositeExtract %360 0 
                                     f32 %362 = OpCompositeExtract %360 1 
                                     f32 %363 = OpCompositeExtract %360 2 
                                   f32_3 %364 = OpCompositeConstruct %361 %362 %363 
                                   f32_4 %365 = OpLoad %9 
                                   f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                   f32_3 %367 = OpFMul %364 %366 
                                   f32_3 %368 = OpLoad %99 
                                   f32_3 %369 = OpFAdd %367 %368 
                                   f32_4 %370 = OpLoad %352 
                                   f32_4 %371 = OpVectorShuffle %370 %369 4 5 6 3 
                                                  OpStore %352 %371 
                             Output f32* %373 = OpAccessChain %352 %16 
                                                  OpStore %373 %19 
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