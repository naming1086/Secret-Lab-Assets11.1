//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blend2Camera_Saturation" {
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
  GpuProgramID 59006
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
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat6;
vec3 u_xlat7;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat2.x = (-_Value2) + 1.0;
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = texture(_MainTex2, u_xlat7.xy);
    u_xlat4 = texture(_MainTex, u_xlat7.xy);
    u_xlat7.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat3.xyw = u_xlat2.xxx * u_xlat7.yzx + u_xlat4.yzx;
    u_xlat2.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat7.xyz + u_xlat4.xyz;
    u_xlatb17 = u_xlat3.x>=u_xlat3.y;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.xy = u_xlat3.yx;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat3.xy;
    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
    u_xlat3.xyz = u_xlat0.xyw;
    u_xlatb1 = u_xlat3.w>=u_xlat3.x;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.xyw = u_xlat3.wyx;
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat3;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat1.x;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlatb1 = u_xlat2.y>=u_xlat2.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat6.xy = (-u_xlat2.zy) + u_xlat2.yz;
    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy + u_xlat2.zy;
    u_xlatb16 = u_xlat2.x>=u_xlat1.x;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat1.z = u_xlat2.x;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat6.x = min(u_xlat1.y, u_xlat1.z);
    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.00000001e-10;
    u_xlat1.x = u_xlat6.x / u_xlat1.x;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + (-u_xlat2.xyz);
    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat2.xyz;
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
; Bound: 363
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %41 %340 
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
                                                  OpDecorate %340 Location 340 
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
                             Private f32* %99 = OpVariable Private 
                                     i32 %100 = OpConstant 1 
                          Private f32_4* %105 = OpVariable Private 
                           Private bool* %131 = OpVariable Private 
                                     u32 %132 = OpConstant 0 
                           Private bool* %158 = OpVariable Private 
                                     f32 %200 = OpConstant 3.674022E-40 
                                     f32 %202 = OpConstant 3.674022E-40 
                          Private f32_3* %205 = OpVariable Private 
                                     f32 %228 = OpConstant 3.674022E-40 
                                   f32_3 %229 = OpConstantComposite %19 %15 %228 
                                   f32_3 %234 = OpConstantComposite %200 %200 %200 
                                     f32 %236 = OpConstant 3.674022E-40 
                                   f32_3 %237 = OpConstantComposite %236 %236 %236 
                                   f32_3 %241 = OpConstantComposite %10 %10 %10 
                                         %257 = OpTypePointer Private %25 
                          Private f32_2* %258 = OpVariable Private 
                           Private bool* %274 = OpVariable Private 
                            Private f32* %280 = OpVariable Private 
                                   f32_3 %328 = OpConstantComposite %19 %19 %19 
                                         %339 = OpTypePointer Output %7 
                           Output f32_4* %340 = OpVariable Output 
                                     i32 %341 = OpConstant 0 
                                         %360 = OpTypePointer Output %6 
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
                                     f32 %103 = OpFNegate %102 
                                     f32 %104 = OpFAdd %103 %19 
                                                  OpStore %99 %104 
                                     f32 %106 = OpLoad %99 
                                   f32_3 %107 = OpCompositeConstruct %106 %106 %106 
                                   f32_3 %108 = OpLoad %71 
                                   f32_3 %109 = OpVectorShuffle %108 %108 1 2 0 
                                   f32_3 %110 = OpFMul %107 %109 
                                   f32_3 %111 = OpLoad %39 
                                   f32_3 %112 = OpVectorShuffle %111 %111 1 2 0 
                                   f32_3 %113 = OpFAdd %110 %112 
                                   f32_4 %114 = OpLoad %105 
                                   f32_4 %115 = OpVectorShuffle %114 %113 4 5 2 6 
                                                  OpStore %105 %115 
                            Uniform f32* %116 = OpAccessChain %28 %100 
                                     f32 %117 = OpLoad %116 
                            Uniform f32* %118 = OpAccessChain %28 %100 
                                     f32 %119 = OpLoad %118 
                            Uniform f32* %120 = OpAccessChain %28 %100 
                                     f32 %121 = OpLoad %120 
                                   f32_3 %122 = OpCompositeConstruct %117 %119 %121 
                                     f32 %123 = OpCompositeExtract %122 0 
                                     f32 %124 = OpCompositeExtract %122 1 
                                     f32 %125 = OpCompositeExtract %122 2 
                                   f32_3 %126 = OpCompositeConstruct %123 %124 %125 
                                   f32_3 %127 = OpLoad %71 
                                   f32_3 %128 = OpFMul %126 %127 
                                   f32_3 %129 = OpLoad %39 
                                   f32_3 %130 = OpFAdd %128 %129 
                                                  OpStore %71 %130 
                            Private f32* %133 = OpAccessChain %105 %132 
                                     f32 %134 = OpLoad %133 
                            Private f32* %135 = OpAccessChain %105 %31 
                                     f32 %136 = OpLoad %135 
                                    bool %137 = OpFOrdGreaterThanEqual %134 %136 
                                                  OpStore %131 %137 
                                    bool %138 = OpLoad %131 
                                     f32 %139 = OpSelect %138 %19 %35 
                                                  OpStore %99 %139 
                                   f32_4 %140 = OpLoad %105 
                                   f32_2 %141 = OpVectorShuffle %140 %140 1 0 
                                   f32_4 %142 = OpLoad %9 
                                   f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                  OpStore %9 %143 
                                   f32_4 %144 = OpLoad %9 
                                   f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                   f32_2 %146 = OpFNegate %145 
                                   f32_4 %147 = OpLoad %105 
                                   f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                   f32_2 %149 = OpFAdd %146 %148 
                                   f32_4 %150 = OpLoad %18 
                                   f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                  OpStore %18 %151 
                                     f32 %152 = OpLoad %99 
                                   f32_4 %153 = OpCompositeConstruct %152 %152 %152 %152 
                                   f32_4 %154 = OpLoad %18 
                                   f32_4 %155 = OpFMul %153 %154 
                                   f32_4 %156 = OpLoad %9 
                                   f32_4 %157 = OpFAdd %155 %156 
                                                  OpStore %9 %157 
                            Private f32* %159 = OpAccessChain %105 %16 
                                     f32 %160 = OpLoad %159 
                            Private f32* %161 = OpAccessChain %9 %132 
                                     f32 %162 = OpLoad %161 
                                    bool %163 = OpFOrdGreaterThanEqual %160 %162 
                                                  OpStore %158 %163 
                                    bool %164 = OpLoad %158 
                                     f32 %165 = OpSelect %164 %19 %35 
                            Private f32* %166 = OpAccessChain %18 %132 
                                                  OpStore %166 %165 
                                   f32_4 %167 = OpLoad %9 
                                   f32_3 %168 = OpVectorShuffle %167 %167 0 1 3 
                                   f32_4 %169 = OpLoad %105 
                                   f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                  OpStore %105 %170 
                                   f32_4 %171 = OpLoad %105 
                                   f32_3 %172 = OpVectorShuffle %171 %171 3 1 0 
                                   f32_4 %173 = OpLoad %9 
                                   f32_4 %174 = OpVectorShuffle %173 %172 4 5 2 6 
                                                  OpStore %9 %174 
                                   f32_4 %175 = OpLoad %105 
                                   f32_4 %176 = OpFNegate %175 
                                   f32_4 %177 = OpLoad %9 
                                   f32_4 %178 = OpFAdd %176 %177 
                                                  OpStore %9 %178 
                                   f32_4 %179 = OpLoad %18 
                                   f32_4 %180 = OpVectorShuffle %179 %179 0 0 0 0 
                                   f32_4 %181 = OpLoad %9 
                                   f32_4 %182 = OpFMul %180 %181 
                                   f32_4 %183 = OpLoad %105 
                                   f32_4 %184 = OpFAdd %182 %183 
                                                  OpStore %9 %184 
                            Private f32* %185 = OpAccessChain %9 %31 
                                     f32 %186 = OpLoad %185 
                            Private f32* %187 = OpAccessChain %9 %16 
                                     f32 %188 = OpLoad %187 
                                     f32 %189 = OpExtInst %1 37 %186 %188 
                            Private f32* %190 = OpAccessChain %18 %132 
                                                  OpStore %190 %189 
                            Private f32* %191 = OpAccessChain %9 %132 
                                     f32 %192 = OpLoad %191 
                            Private f32* %193 = OpAccessChain %18 %132 
                                     f32 %194 = OpLoad %193 
                                     f32 %195 = OpFNegate %194 
                                     f32 %196 = OpFAdd %192 %195 
                            Private f32* %197 = OpAccessChain %18 %132 
                                                  OpStore %197 %196 
                            Private f32* %198 = OpAccessChain %18 %132 
                                     f32 %199 = OpLoad %198 
                                     f32 %201 = OpFMul %199 %200 
                                     f32 %203 = OpFAdd %201 %202 
                            Private f32* %204 = OpAccessChain %18 %132 
                                                  OpStore %204 %203 
                            Private f32* %206 = OpAccessChain %9 %31 
                                     f32 %207 = OpLoad %206 
                                     f32 %208 = OpFNegate %207 
                            Private f32* %209 = OpAccessChain %9 %16 
                                     f32 %210 = OpLoad %209 
                                     f32 %211 = OpFAdd %208 %210 
                            Private f32* %212 = OpAccessChain %205 %132 
                                                  OpStore %212 %211 
                            Private f32* %213 = OpAccessChain %205 %132 
                                     f32 %214 = OpLoad %213 
                            Private f32* %215 = OpAccessChain %18 %132 
                                     f32 %216 = OpLoad %215 
                                     f32 %217 = OpFDiv %214 %216 
                            Private f32* %218 = OpAccessChain %205 %132 
                                                  OpStore %218 %217 
                            Private f32* %219 = OpAccessChain %205 %132 
                                     f32 %220 = OpLoad %219 
                            Private f32* %221 = OpAccessChain %9 %12 
                                     f32 %222 = OpLoad %221 
                                     f32 %223 = OpFAdd %220 %222 
                            Private f32* %224 = OpAccessChain %205 %132 
                                                  OpStore %224 %223 
                                   f32_3 %225 = OpLoad %205 
                                   f32_3 %226 = OpVectorShuffle %225 %225 0 0 0 
                                   f32_3 %227 = OpExtInst %1 4 %226 
                                   f32_3 %230 = OpFAdd %227 %229 
                                                  OpStore %205 %230 
                                   f32_3 %231 = OpLoad %205 
                                   f32_3 %232 = OpExtInst %1 10 %231 
                                                  OpStore %205 %232 
                                   f32_3 %233 = OpLoad %205 
                                   f32_3 %235 = OpFMul %233 %234 
                                   f32_3 %238 = OpFAdd %235 %237 
                                                  OpStore %205 %238 
                                   f32_3 %239 = OpLoad %205 
                                   f32_3 %240 = OpExtInst %1 4 %239 
                                   f32_3 %242 = OpFAdd %240 %241 
                                                  OpStore %205 %242 
                                   f32_3 %243 = OpLoad %205 
                                   f32_3 %244 = OpCompositeConstruct %35 %35 %35 
                                   f32_3 %245 = OpCompositeConstruct %19 %19 %19 
                                   f32_3 %246 = OpExtInst %1 43 %243 %244 %245 
                                                  OpStore %205 %246 
                                   f32_3 %247 = OpLoad %205 
                                   f32_3 %248 = OpFAdd %247 %241 
                                                  OpStore %205 %248 
                            Private f32* %249 = OpAccessChain %71 %31 
                                     f32 %250 = OpLoad %249 
                            Private f32* %251 = OpAccessChain %71 %12 
                                     f32 %252 = OpLoad %251 
                                    bool %253 = OpFOrdGreaterThanEqual %250 %252 
                                                  OpStore %158 %253 
                                    bool %254 = OpLoad %158 
                                     f32 %255 = OpSelect %254 %19 %35 
                            Private f32* %256 = OpAccessChain %18 %132 
                                                  OpStore %256 %255 
                                   f32_3 %259 = OpLoad %71 
                                   f32_2 %260 = OpVectorShuffle %259 %259 2 1 
                                   f32_2 %261 = OpFNegate %260 
                                   f32_3 %262 = OpLoad %71 
                                   f32_2 %263 = OpVectorShuffle %262 %262 1 2 
                                   f32_2 %264 = OpFAdd %261 %263 
                                                  OpStore %258 %264 
                                   f32_4 %265 = OpLoad %18 
                                   f32_2 %266 = OpVectorShuffle %265 %265 0 0 
                                   f32_2 %267 = OpLoad %258 
                                   f32_2 %268 = OpFMul %266 %267 
                                   f32_3 %269 = OpLoad %71 
                                   f32_2 %270 = OpVectorShuffle %269 %269 2 1 
                                   f32_2 %271 = OpFAdd %268 %270 
                                   f32_4 %272 = OpLoad %18 
                                   f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                  OpStore %18 %273 
                            Private f32* %275 = OpAccessChain %71 %132 
                                     f32 %276 = OpLoad %275 
                            Private f32* %277 = OpAccessChain %18 %132 
                                     f32 %278 = OpLoad %277 
                                    bool %279 = OpFOrdGreaterThanEqual %276 %278 
                                                  OpStore %274 %279 
                                    bool %281 = OpLoad %274 
                                     f32 %282 = OpSelect %281 %19 %35 
                                                  OpStore %280 %282 
                            Private f32* %283 = OpAccessChain %71 %132 
                                     f32 %284 = OpLoad %283 
                            Private f32* %285 = OpAccessChain %18 %12 
                                                  OpStore %285 %284 
                                   f32_4 %286 = OpLoad %18 
                                   f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                   f32_3 %288 = OpFNegate %287 
                                   f32_4 %289 = OpLoad %18 
                                   f32_3 %290 = OpVectorShuffle %289 %289 2 1 0 
                                   f32_3 %291 = OpFAdd %288 %290 
                                                  OpStore %39 %291 
                                     f32 %292 = OpLoad %280 
                                   f32_3 %293 = OpCompositeConstruct %292 %292 %292 
                                   f32_3 %294 = OpLoad %39 
                                   f32_3 %295 = OpFMul %293 %294 
                                   f32_4 %296 = OpLoad %18 
                                   f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                                   f32_3 %298 = OpFAdd %295 %297 
                                   f32_4 %299 = OpLoad %18 
                                   f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
                                                  OpStore %18 %300 
                            Private f32* %301 = OpAccessChain %18 %31 
                                     f32 %302 = OpLoad %301 
                            Private f32* %303 = OpAccessChain %18 %12 
                                     f32 %304 = OpLoad %303 
                                     f32 %305 = OpExtInst %1 37 %302 %304 
                            Private f32* %306 = OpAccessChain %258 %132 
                                                  OpStore %306 %305 
                            Private f32* %307 = OpAccessChain %258 %132 
                                     f32 %308 = OpLoad %307 
                                     f32 %309 = OpFNegate %308 
                            Private f32* %310 = OpAccessChain %18 %132 
                                     f32 %311 = OpLoad %310 
                                     f32 %312 = OpFAdd %309 %311 
                            Private f32* %313 = OpAccessChain %258 %132 
                                                  OpStore %313 %312 
                            Private f32* %314 = OpAccessChain %18 %132 
                                     f32 %315 = OpLoad %314 
                                     f32 %316 = OpFAdd %315 %202 
                            Private f32* %317 = OpAccessChain %18 %132 
                                                  OpStore %317 %316 
                            Private f32* %318 = OpAccessChain %258 %132 
                                     f32 %319 = OpLoad %318 
                            Private f32* %320 = OpAccessChain %18 %132 
                                     f32 %321 = OpLoad %320 
                                     f32 %322 = OpFDiv %319 %321 
                            Private f32* %323 = OpAccessChain %18 %132 
                                                  OpStore %323 %322 
                                   f32_4 %324 = OpLoad %18 
                                   f32_3 %325 = OpVectorShuffle %324 %324 0 0 0 
                                   f32_3 %326 = OpLoad %205 
                                   f32_3 %327 = OpFMul %325 %326 
                                   f32_3 %329 = OpFAdd %327 %328 
                                                  OpStore %205 %329 
                                   f32_4 %330 = OpLoad %9 
                                   f32_3 %331 = OpVectorShuffle %330 %330 0 0 0 
                                   f32_3 %332 = OpLoad %205 
                                   f32_3 %333 = OpFMul %331 %332 
                                   f32_3 %334 = OpLoad %71 
                                   f32_3 %335 = OpFNegate %334 
                                   f32_3 %336 = OpFAdd %333 %335 
                                   f32_4 %337 = OpLoad %9 
                                   f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                                  OpStore %9 %338 
                            Uniform f32* %342 = OpAccessChain %28 %341 
                                     f32 %343 = OpLoad %342 
                            Uniform f32* %344 = OpAccessChain %28 %341 
                                     f32 %345 = OpLoad %344 
                            Uniform f32* %346 = OpAccessChain %28 %341 
                                     f32 %347 = OpLoad %346 
                                   f32_3 %348 = OpCompositeConstruct %343 %345 %347 
                                     f32 %349 = OpCompositeExtract %348 0 
                                     f32 %350 = OpCompositeExtract %348 1 
                                     f32 %351 = OpCompositeExtract %348 2 
                                   f32_3 %352 = OpCompositeConstruct %349 %350 %351 
                                   f32_4 %353 = OpLoad %9 
                                   f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
                                   f32_3 %355 = OpFMul %352 %354 
                                   f32_3 %356 = OpLoad %71 
                                   f32_3 %357 = OpFAdd %355 %356 
                                   f32_4 %358 = OpLoad %340 
                                   f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
                                                  OpStore %340 %359 
                             Output f32* %361 = OpAccessChain %340 %16 
                                                  OpStore %361 %19 
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