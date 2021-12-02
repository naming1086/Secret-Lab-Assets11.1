//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Drunk" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value ("_Value", Range(0, 20)) = 6
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 14545
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Speed;
uniform 	float _Wavy;
uniform 	float _Distortion;
uniform 	float _DistortionWave;
uniform 	float _Fade;
uniform 	float _Colored;
uniform 	float _ColoredChange;
uniform 	float _ChangeRed;
uniform 	float _ChangeGreen;
uniform 	float _ChangeBlue;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = _TimeX * _Speed;
    u_xlat1 = u_xlat0.xxxx * vec4(1.20000005, 1.79999995, 1.79999995, 1.20000005);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.yz = sin(u_xlat0.xx);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(-0.199999988, 0.199999988, 0.0750000179, -0.0750000179) + vec4(1.25, 0.850000024, 0.949999988, 1.10000002);
    u_xlat0.x = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat0 = u_xlat0 / _ScreenResolution.xxxx;
    u_xlat1.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
    u_xlat0 = u_xlat0 + u_xlat1.yxyx;
    u_xlatb3 = greaterThanEqual(u_xlat0, (-u_xlat0));
    u_xlat0 = fract(abs(u_xlat0));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat0.y : (-u_xlat0.y);
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat0.z : (-u_xlat0.z);
        hlslcc_movcTemp.w = (u_xlatb3.w) ? u_xlat0.w : (-u_xlat0.w);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat1.yxyx) + u_xlat0;
    u_xlat0 = vec4(vec4(_Wavy, _Wavy, _Wavy, _Wavy)) * u_xlat0 + u_xlat1.yxyx;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat5.x = _Distortion * _Fade;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat3.xy = u_xlat0.xx * vec2(0.5, 0.5) + u_xlat0.zw;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = texture(_MainTex, u_xlat3.xy);
    u_xlat15 = u_xlat2.x * u_xlat3.y;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat10.x = u_xlat0.z * u_xlat15;
    u_xlat5.x = u_xlat5.x * u_xlat10.x;
    u_xlat0.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat5.xy = u_xlat1.xy + vec2(_TimeX);
    u_xlat10.xy = u_xlat5.yy * vec2(10.0, 30.0);
    u_xlat4 = u_xlat5.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
    u_xlat4 = sin(u_xlat4);
    u_xlat5.xy = sin(u_xlat10.xy);
    u_xlat5.x = u_xlat5.x * 0.0100000007;
    u_xlat5.x = u_xlat4.w * 0.0500000007 + u_xlat5.x;
    u_xlat5.x = u_xlat5.y * 0.00400000019 + u_xlat5.x;
    u_xlat10.x = _Fade * _DistortionWave;
    u_xlat6.x = u_xlat10.x * u_xlat5.x + u_xlat1.y;
    u_xlat5.xz = u_xlat4.xy * vec2(0.0265999995, 0.00300000003);
    u_xlat5.x = u_xlat5.z + u_xlat5.x;
    u_xlat5.x = u_xlat4.z * 0.00250000018 + u_xlat5.x;
    u_xlat6.y = u_xlat10.x * u_xlat5.x + u_xlat1.x;
    u_xlat0.xy = u_xlat0.xx + u_xlat6.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.x = _Colored + -0.200000003;
    u_xlat1.x = u_xlat1.w * 0.200000003 + u_xlat1.x;
    u_xlat2 = u_xlat1.xxxx * u_xlat3 + u_xlat2;
    u_xlat3 = u_xlat0 + (-u_xlat2);
    u_xlat2 = u_xlat3 * vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024) + u_xlat2;
    u_xlat1.xw = u_xlat2.yz + (-vec2(vec2(_ColoredChange, _ColoredChange)));
    u_xlat6.xy = (-u_xlat1.xw) + u_xlat6.xy;
    u_xlat2.yz = u_xlat6.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xw;
    u_xlat1 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat1 + u_xlat0;
    SV_Target0.xyz = u_xlat0.xyz + vec3(_ChangeRed, _ChangeGreen, _ChangeBlue);
    SV_Target0.w = u_xlat0.w;
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
; Bound: 498
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %77 %477 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpMemberDecorate %10 11 Offset 10 
                                                      OpMemberDecorate %10 12 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 77 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %204 DescriptorSet 204 
                                                      OpDecorate %204 Binding 204 
                                                      OpDecorate %477 Location 477 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %6 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 2 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Private %6 
                               Private f32_4* %26 = OpVariable Private 
                                          f32 %29 = OpConstant 3.674022E-40 
                                          f32 %30 = OpConstant 3.674022E-40 
                                        f32_4 %31 = OpConstantComposite %29 %30 %30 %29 
                                              %39 = OpTypeVector %6 2 
                                          f32 %48 = OpConstant 3.674022E-40 
                                        f32_4 %49 = OpConstantComposite %48 %48 %48 %48 
                               Private f32_4* %51 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                          f32 %54 = OpConstant 3.674022E-40 
                                          f32 %55 = OpConstant 3.674022E-40 
                                          f32 %56 = OpConstant 3.674022E-40 
                                        f32_4 %57 = OpConstantComposite %53 %54 %55 %56 
                                          f32 %59 = OpConstant 3.674022E-40 
                                          f32 %60 = OpConstant 3.674022E-40 
                                          f32 %61 = OpConstant 3.674022E-40 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_4 %63 = OpConstantComposite %59 %60 %61 %62 
                                          f32 %65 = OpConstant 3.674022E-40 
                                          u32 %67 = OpConstant 3 
                                          i32 %70 = OpConstant 1 
                                              %71 = OpTypePointer Uniform %7 
                                              %76 = OpTypePointer Input %39 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %80 = OpConstant 12 
                                              %95 = OpTypeBool 
                                              %96 = OpTypeVector %95 4 
                                              %97 = OpTypePointer Private %96 
                              Private bool_4* %98 = OpVariable Private 
                                             %106 = OpTypePointer Function %7 
                                             %109 = OpTypePointer Private %95 
                                             %112 = OpTypePointer Function %6 
                                         u32 %124 = OpConstant 1 
                                         u32 %138 = OpConstant 2 
                                         i32 %178 = OpConstant 3 
                                             %198 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %199 = OpTypePointer UniformConstant %198 
        UniformConstant read_only Texture2D* %200 = OpVariable UniformConstant 
                                             %202 = OpTypeSampler 
                                             %203 = OpTypePointer UniformConstant %202 
                    UniformConstant sampler* %204 = OpVariable UniformConstant 
                                             %206 = OpTypeSampledImage %198 
                                             %217 = OpTypeVector %6 3 
                                             %218 = OpTypePointer Private %217 
                              Private f32_3* %219 = OpVariable Private 
                                         i32 %220 = OpConstant 4 
                                         i32 %223 = OpConstant 6 
                              Private f32_4* %234 = OpVariable Private 
                                         f32 %237 = OpConstant 3.674022E-40 
                                       f32_2 %238 = OpConstantComposite %237 %237 
                                Private f32* %255 = OpVariable Private 
                                             %265 = OpTypePointer Private %39 
                              Private f32_2* %266 = OpVariable Private 
                                         f32 %295 = OpConstant 3.674022E-40 
                                         f32 %296 = OpConstant 3.674022E-40 
                                       f32_2 %297 = OpConstantComposite %295 %296 
                              Private f32_4* %299 = OpVariable Private 
                                         f32 %302 = OpConstant 3.674022E-40 
                                         f32 %303 = OpConstant 3.674022E-40 
                                         f32 %304 = OpConstant 3.674022E-40 
                                         f32 %305 = OpConstant 3.674022E-40 
                                       f32_4 %306 = OpConstantComposite %302 %303 %304 %305 
                                         f32 %316 = OpConstant 3.674022E-40 
                                         f32 %321 = OpConstant 3.674022E-40 
                                         f32 %329 = OpConstant 3.674022E-40 
                                         i32 %337 = OpConstant 5 
                              Private f32_2* %342 = OpVariable Private 
                                         f32 %354 = OpConstant 3.674022E-40 
                                         f32 %355 = OpConstant 3.674022E-40 
                                       f32_2 %356 = OpConstantComposite %354 %355 
                                         f32 %368 = OpConstant 3.674022E-40 
                                         i32 %395 = OpConstant 7 
                                         f32 %398 = OpConstant 3.674022E-40 
                                         f32 %403 = OpConstant 3.674022E-40 
                                         f32 %420 = OpConstant 3.674022E-40 
                                       f32_4 %421 = OpConstantComposite %420 %420 %420 %420 
                                         i32 %427 = OpConstant 8 
                                         f32 %446 = OpConstant 3.674022E-40 
                                       f32_2 %447 = OpConstantComposite %446 %446 
                                             %476 = OpTypePointer Output %7 
                               Output f32_4* %477 = OpVariable Output 
                                         i32 %480 = OpConstant 9 
                                         i32 %483 = OpConstant 10 
                                         i32 %486 = OpConstant 11 
                                             %495 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %107 = OpVariable Function 
                               Function f32* %113 = OpVariable Function 
                               Function f32* %127 = OpVariable Function 
                               Function f32* %141 = OpVariable Function 
                               Function f32* %154 = OpVariable Function 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFMul %17 %20 
                                 Private f32* %25 = OpAccessChain %9 %23 
                                                      OpStore %25 %21 
                                        f32_4 %27 = OpLoad %9 
                                        f32_4 %28 = OpVectorShuffle %27 %27 0 0 0 0 
                                        f32_4 %32 = OpFMul %28 %31 
                                                      OpStore %26 %32 
                                 Private f32* %33 = OpAccessChain %9 %23 
                                          f32 %34 = OpLoad %33 
                                 Private f32* %35 = OpAccessChain %9 %23 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFAdd %34 %36 
                                 Private f32* %38 = OpAccessChain %9 %23 
                                                      OpStore %38 %37 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 0 
                                        f32_2 %42 = OpExtInst %1 13 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 0 4 5 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %26 
                                        f32_4 %46 = OpExtInst %1 13 %45 
                                                      OpStore %26 %46 
                                        f32_4 %47 = OpLoad %26 
                                        f32_4 %50 = OpFAdd %47 %49 
                                                      OpStore %26 %50 
                                        f32_4 %52 = OpLoad %26 
                                        f32_4 %58 = OpFMul %52 %57 
                                        f32_4 %64 = OpFAdd %58 %63 
                                                      OpStore %51 %64 
                                 Private f32* %66 = OpAccessChain %9 %23 
                                                      OpStore %66 %65 
                                 Private f32* %68 = OpAccessChain %9 %67 
                                                      OpStore %68 %65 
                                        f32_4 %69 = OpLoad %9 
                               Uniform f32_4* %72 = OpAccessChain %12 %70 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpVectorShuffle %73 %73 0 0 0 0 
                                        f32_4 %75 = OpFDiv %69 %74 
                                                      OpStore %9 %75 
                                        f32_2 %78 = OpLoad vs_TEXCOORD0 
                                        f32_2 %79 = OpVectorShuffle %78 %78 1 0 
                               Uniform f32_4* %81 = OpAccessChain %12 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 1 0 
                                        f32_2 %84 = OpFMul %79 %83 
                               Uniform f32_4* %85 = OpAccessChain %12 %80 
                                        f32_4 %86 = OpLoad %85 
                                        f32_2 %87 = OpVectorShuffle %86 %86 3 2 
                                        f32_2 %88 = OpFAdd %84 %87 
                                        f32_4 %89 = OpLoad %26 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                      OpStore %26 %90 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpLoad %26 
                                        f32_4 %93 = OpVectorShuffle %92 %92 1 0 1 0 
                                        f32_4 %94 = OpFAdd %91 %93 
                                                      OpStore %9 %94 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpFNegate %100 
                                      bool_4 %102 = OpFOrdGreaterThanEqual %99 %101 
                                                      OpStore %98 %102 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpExtInst %1 4 %103 
                                       f32_4 %105 = OpExtInst %1 10 %104 
                                                      OpStore %9 %105 
                                       f32_4 %108 = OpLoad %9 
                                                      OpStore %107 %108 
                               Private bool* %110 = OpAccessChain %98 %23 
                                        bool %111 = OpLoad %110 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %111 %114 %118 
                                             %114 = OpLabel 
                                Private f32* %116 = OpAccessChain %9 %23 
                                         f32 %117 = OpLoad %116 
                                                      OpStore %113 %117 
                                                      OpBranch %115 
                                             %118 = OpLabel 
                                Private f32* %119 = OpAccessChain %9 %23 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                                      OpStore %113 %121 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                         f32 %122 = OpLoad %113 
                               Function f32* %123 = OpAccessChain %107 %23 
                                                      OpStore %123 %122 
                               Private bool* %125 = OpAccessChain %98 %124 
                                        bool %126 = OpLoad %125 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %126 %128 %132 
                                             %128 = OpLabel 
                                Private f32* %130 = OpAccessChain %9 %124 
                                         f32 %131 = OpLoad %130 
                                                      OpStore %127 %131 
                                                      OpBranch %129 
                                             %132 = OpLabel 
                                Private f32* %133 = OpAccessChain %9 %124 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                                      OpStore %127 %135 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                         f32 %136 = OpLoad %127 
                               Function f32* %137 = OpAccessChain %107 %124 
                                                      OpStore %137 %136 
                               Private bool* %139 = OpAccessChain %98 %138 
                                        bool %140 = OpLoad %139 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %140 %142 %146 
                                             %142 = OpLabel 
                                Private f32* %144 = OpAccessChain %9 %138 
                                         f32 %145 = OpLoad %144 
                                                      OpStore %141 %145 
                                                      OpBranch %143 
                                             %146 = OpLabel 
                                Private f32* %147 = OpAccessChain %9 %138 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                                      OpStore %141 %149 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                         f32 %150 = OpLoad %141 
                               Function f32* %151 = OpAccessChain %107 %138 
                                                      OpStore %151 %150 
                               Private bool* %152 = OpAccessChain %98 %67 
                                        bool %153 = OpLoad %152 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %153 %155 %159 
                                             %155 = OpLabel 
                                Private f32* %157 = OpAccessChain %9 %67 
                                         f32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private f32* %160 = OpAccessChain %9 %67 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpFNegate %161 
                                                      OpStore %154 %162 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         f32 %163 = OpLoad %154 
                               Function f32* %164 = OpAccessChain %107 %67 
                                                      OpStore %164 %163 
                                       f32_4 %165 = OpLoad %107 
                                                      OpStore %9 %165 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpExtInst %1 30 %166 
                                                      OpStore %9 %167 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpLoad %51 
                                       f32_4 %170 = OpFMul %168 %169 
                                                      OpStore %9 %170 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpExtInst %1 29 %171 
                                                      OpStore %9 %172 
                                       f32_4 %173 = OpLoad %26 
                                       f32_4 %174 = OpVectorShuffle %173 %173 1 0 1 0 
                                       f32_4 %175 = OpFNegate %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %9 %177 
                                Uniform f32* %179 = OpAccessChain %12 %178 
                                         f32 %180 = OpLoad %179 
                                Uniform f32* %181 = OpAccessChain %12 %178 
                                         f32 %182 = OpLoad %181 
                                Uniform f32* %183 = OpAccessChain %12 %178 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %12 %178 
                                         f32 %186 = OpLoad %185 
                                       f32_4 %187 = OpCompositeConstruct %180 %182 %184 %186 
                                         f32 %188 = OpCompositeExtract %187 0 
                                         f32 %189 = OpCompositeExtract %187 1 
                                         f32 %190 = OpCompositeExtract %187 2 
                                         f32 %191 = OpCompositeExtract %187 3 
                                       f32_4 %192 = OpCompositeConstruct %188 %189 %190 %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_4 %194 = OpFMul %192 %193 
                                       f32_4 %195 = OpLoad %26 
                                       f32_4 %196 = OpVectorShuffle %195 %195 1 0 1 0 
                                       f32_4 %197 = OpFAdd %194 %196 
                                                      OpStore %9 %197 
                         read_only Texture2D %201 = OpLoad %200 
                                     sampler %205 = OpLoad %204 
                  read_only Texture2DSampled %207 = OpSampledImage %201 %205 
                                       f32_4 %208 = OpLoad %9 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                                                      OpStore %51 %210 
                                Private f32* %211 = OpAccessChain %9 %23 
                                         f32 %212 = OpLoad %211 
                                Private f32* %213 = OpAccessChain %51 %23 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFMul %212 %214 
                                Private f32* %216 = OpAccessChain %9 %23 
                                                      OpStore %216 %215 
                                Uniform f32* %221 = OpAccessChain %12 %220 
                                         f32 %222 = OpLoad %221 
                                Uniform f32* %224 = OpAccessChain %12 %223 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFMul %222 %225 
                                Private f32* %227 = OpAccessChain %219 %23 
                                                      OpStore %227 %226 
                                Private f32* %228 = OpAccessChain %219 %23 
                                         f32 %229 = OpLoad %228 
                                Private f32* %230 = OpAccessChain %9 %23 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFMul %229 %231 
                                Private f32* %233 = OpAccessChain %9 %23 
                                                      OpStore %233 %232 
                                       f32_4 %235 = OpLoad %9 
                                       f32_2 %236 = OpVectorShuffle %235 %235 0 0 
                                       f32_2 %239 = OpFMul %236 %238 
                                       f32_4 %240 = OpLoad %9 
                                       f32_2 %241 = OpVectorShuffle %240 %240 2 3 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %234 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 2 3 
                                                      OpStore %234 %244 
                                Private f32* %245 = OpAccessChain %9 %23 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFMul %246 %237 
                                Private f32* %248 = OpAccessChain %9 %23 
                                                      OpStore %248 %247 
                         read_only Texture2D %249 = OpLoad %200 
                                     sampler %250 = OpLoad %204 
                  read_only Texture2DSampled %251 = OpSampledImage %249 %250 
                                       f32_4 %252 = OpLoad %234 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_4 %254 = OpImageSampleImplicitLod %251 %253 
                                                      OpStore %234 %254 
                                Private f32* %256 = OpAccessChain %51 %23 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %234 %124 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                                      OpStore %255 %260 
                                       f32_4 %261 = OpLoad %51 
                                       f32_4 %262 = OpFNegate %261 
                                       f32_4 %263 = OpLoad %234 
                                       f32_4 %264 = OpFAdd %262 %263 
                                                      OpStore %234 %264 
                                Private f32* %267 = OpAccessChain %9 %138 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %255 
                                         f32 %270 = OpFMul %268 %269 
                                Private f32* %271 = OpAccessChain %266 %23 
                                                      OpStore %271 %270 
                                Private f32* %272 = OpAccessChain %219 %23 
                                         f32 %273 = OpLoad %272 
                                Private f32* %274 = OpAccessChain %266 %23 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpFMul %273 %275 
                                Private f32* %277 = OpAccessChain %219 %23 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %219 %23 
                                         f32 %279 = OpLoad %278 
                                         f32 %280 = OpFMul %279 %237 
                                Private f32* %281 = OpAccessChain %9 %23 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFAdd %280 %282 
                                Private f32* %284 = OpAccessChain %9 %23 
                                                      OpStore %284 %283 
                                       f32_4 %285 = OpLoad %26 
                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                                Uniform f32* %287 = OpAccessChain %12 %14 
                                         f32 %288 = OpLoad %287 
                                       f32_2 %289 = OpCompositeConstruct %288 %288 
                                       f32_2 %290 = OpFAdd %286 %289 
                                       f32_3 %291 = OpLoad %219 
                                       f32_3 %292 = OpVectorShuffle %291 %290 3 4 2 
                                                      OpStore %219 %292 
                                       f32_3 %293 = OpLoad %219 
                                       f32_2 %294 = OpVectorShuffle %293 %293 1 1 
                                       f32_2 %298 = OpFMul %294 %297 
                                                      OpStore %266 %298 
                                       f32_3 %300 = OpLoad %219 
                                       f32_4 %301 = OpVectorShuffle %300 %300 0 0 0 0 
                                       f32_4 %307 = OpFMul %301 %306 
                                                      OpStore %299 %307 
                                       f32_4 %308 = OpLoad %299 
                                       f32_4 %309 = OpExtInst %1 13 %308 
                                                      OpStore %299 %309 
                                       f32_2 %310 = OpLoad %266 
                                       f32_2 %311 = OpExtInst %1 13 %310 
                                       f32_3 %312 = OpLoad %219 
                                       f32_3 %313 = OpVectorShuffle %312 %311 3 4 2 
                                                      OpStore %219 %313 
                                Private f32* %314 = OpAccessChain %219 %23 
                                         f32 %315 = OpLoad %314 
                                         f32 %317 = OpFMul %315 %316 
                                Private f32* %318 = OpAccessChain %219 %23 
                                                      OpStore %318 %317 
                                Private f32* %319 = OpAccessChain %299 %67 
                                         f32 %320 = OpLoad %319 
                                         f32 %322 = OpFMul %320 %321 
                                Private f32* %323 = OpAccessChain %219 %23 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFAdd %322 %324 
                                Private f32* %326 = OpAccessChain %219 %23 
                                                      OpStore %326 %325 
                                Private f32* %327 = OpAccessChain %219 %124 
                                         f32 %328 = OpLoad %327 
                                         f32 %330 = OpFMul %328 %329 
                                Private f32* %331 = OpAccessChain %219 %23 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFAdd %330 %332 
                                Private f32* %334 = OpAccessChain %219 %23 
                                                      OpStore %334 %333 
                                Uniform f32* %335 = OpAccessChain %12 %223 
                                         f32 %336 = OpLoad %335 
                                Uniform f32* %338 = OpAccessChain %12 %337 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFMul %336 %339 
                                Private f32* %341 = OpAccessChain %266 %23 
                                                      OpStore %341 %340 
                                Private f32* %343 = OpAccessChain %266 %23 
                                         f32 %344 = OpLoad %343 
                                Private f32* %345 = OpAccessChain %219 %23 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFMul %344 %346 
                                Private f32* %348 = OpAccessChain %26 %124 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %342 %23 
                                                      OpStore %351 %350 
                                       f32_4 %352 = OpLoad %299 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                                       f32_2 %357 = OpFMul %353 %356 
                                       f32_3 %358 = OpLoad %219 
                                       f32_3 %359 = OpVectorShuffle %358 %357 3 1 4 
                                                      OpStore %219 %359 
                                Private f32* %360 = OpAccessChain %219 %138 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %219 %23 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFAdd %361 %363 
                                Private f32* %365 = OpAccessChain %219 %23 
                                                      OpStore %365 %364 
                                Private f32* %366 = OpAccessChain %299 %138 
                                         f32 %367 = OpLoad %366 
                                         f32 %369 = OpFMul %367 %368 
                                Private f32* %370 = OpAccessChain %219 %23 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFAdd %369 %371 
                                Private f32* %373 = OpAccessChain %219 %23 
                                                      OpStore %373 %372 
                                Private f32* %374 = OpAccessChain %266 %23 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %219 %23 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFMul %375 %377 
                                Private f32* %379 = OpAccessChain %26 %23 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFAdd %378 %380 
                                Private f32* %382 = OpAccessChain %342 %124 
                                                      OpStore %382 %381 
                                       f32_4 %383 = OpLoad %9 
                                       f32_2 %384 = OpVectorShuffle %383 %383 0 0 
                                       f32_2 %385 = OpLoad %342 
                                       f32_2 %386 = OpFAdd %384 %385 
                                       f32_4 %387 = OpLoad %9 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 2 3 
                                                      OpStore %9 %388 
                         read_only Texture2D %389 = OpLoad %200 
                                     sampler %390 = OpLoad %204 
                  read_only Texture2DSampled %391 = OpSampledImage %389 %390 
                                       f32_4 %392 = OpLoad %9 
                                       f32_2 %393 = OpVectorShuffle %392 %392 0 1 
                                       f32_4 %394 = OpImageSampleImplicitLod %391 %393 
                                                      OpStore %9 %394 
                                Uniform f32* %396 = OpAccessChain %12 %395 
                                         f32 %397 = OpLoad %396 
                                         f32 %399 = OpFAdd %397 %398 
                                Private f32* %400 = OpAccessChain %26 %23 
                                                      OpStore %400 %399 
                                Private f32* %401 = OpAccessChain %26 %67 
                                         f32 %402 = OpLoad %401 
                                         f32 %404 = OpFMul %402 %403 
                                Private f32* %405 = OpAccessChain %26 %23 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpFAdd %404 %406 
                                Private f32* %408 = OpAccessChain %26 %23 
                                                      OpStore %408 %407 
                                       f32_4 %409 = OpLoad %26 
                                       f32_4 %410 = OpVectorShuffle %409 %409 0 0 0 0 
                                       f32_4 %411 = OpLoad %234 
                                       f32_4 %412 = OpFMul %410 %411 
                                       f32_4 %413 = OpLoad %51 
                                       f32_4 %414 = OpFAdd %412 %413 
                                                      OpStore %51 %414 
                                       f32_4 %415 = OpLoad %9 
                                       f32_4 %416 = OpLoad %51 
                                       f32_4 %417 = OpFNegate %416 
                                       f32_4 %418 = OpFAdd %415 %417 
                                                      OpStore %234 %418 
                                       f32_4 %419 = OpLoad %234 
                                       f32_4 %422 = OpFMul %419 %421 
                                       f32_4 %423 = OpLoad %51 
                                       f32_4 %424 = OpFAdd %422 %423 
                                                      OpStore %51 %424 
                                       f32_4 %425 = OpLoad %51 
                                       f32_2 %426 = OpVectorShuffle %425 %425 1 2 
                                Uniform f32* %428 = OpAccessChain %12 %427 
                                         f32 %429 = OpLoad %428 
                                Uniform f32* %430 = OpAccessChain %12 %427 
                                         f32 %431 = OpLoad %430 
                                       f32_2 %432 = OpCompositeConstruct %429 %431 
                                         f32 %433 = OpCompositeExtract %432 0 
                                         f32 %434 = OpCompositeExtract %432 1 
                                       f32_2 %435 = OpCompositeConstruct %433 %434 
                                       f32_2 %436 = OpFNegate %435 
                                       f32_2 %437 = OpFAdd %426 %436 
                                       f32_4 %438 = OpLoad %26 
                                       f32_4 %439 = OpVectorShuffle %438 %437 4 1 2 5 
                                                      OpStore %26 %439 
                                       f32_4 %440 = OpLoad %26 
                                       f32_2 %441 = OpVectorShuffle %440 %440 0 3 
                                       f32_2 %442 = OpFNegate %441 
                                       f32_2 %443 = OpLoad %342 
                                       f32_2 %444 = OpFAdd %442 %443 
                                                      OpStore %342 %444 
                                       f32_2 %445 = OpLoad %342 
                                       f32_2 %448 = OpFMul %445 %447 
                                       f32_4 %449 = OpLoad %26 
                                       f32_2 %450 = OpVectorShuffle %449 %449 0 3 
                                       f32_2 %451 = OpFAdd %448 %450 
                                       f32_4 %452 = OpLoad %51 
                                       f32_4 %453 = OpVectorShuffle %452 %451 0 4 5 3 
                                                      OpStore %51 %453 
                                       f32_4 %454 = OpLoad %9 
                                       f32_4 %455 = OpFNegate %454 
                                       f32_4 %456 = OpLoad %51 
                                       f32_4 %457 = OpFAdd %455 %456 
                                                      OpStore %26 %457 
                                Uniform f32* %458 = OpAccessChain %12 %223 
                                         f32 %459 = OpLoad %458 
                                Uniform f32* %460 = OpAccessChain %12 %223 
                                         f32 %461 = OpLoad %460 
                                Uniform f32* %462 = OpAccessChain %12 %223 
                                         f32 %463 = OpLoad %462 
                                Uniform f32* %464 = OpAccessChain %12 %223 
                                         f32 %465 = OpLoad %464 
                                       f32_4 %466 = OpCompositeConstruct %459 %461 %463 %465 
                                         f32 %467 = OpCompositeExtract %466 0 
                                         f32 %468 = OpCompositeExtract %466 1 
                                         f32 %469 = OpCompositeExtract %466 2 
                                         f32 %470 = OpCompositeExtract %466 3 
                                       f32_4 %471 = OpCompositeConstruct %467 %468 %469 %470 
                                       f32_4 %472 = OpLoad %26 
                                       f32_4 %473 = OpFMul %471 %472 
                                       f32_4 %474 = OpLoad %9 
                                       f32_4 %475 = OpFAdd %473 %474 
                                                      OpStore %9 %475 
                                       f32_4 %478 = OpLoad %9 
                                       f32_3 %479 = OpVectorShuffle %478 %478 0 1 2 
                                Uniform f32* %481 = OpAccessChain %12 %480 
                                         f32 %482 = OpLoad %481 
                                Uniform f32* %484 = OpAccessChain %12 %483 
                                         f32 %485 = OpLoad %484 
                                Uniform f32* %487 = OpAccessChain %12 %486 
                                         f32 %488 = OpLoad %487 
                                       f32_3 %489 = OpCompositeConstruct %482 %485 %488 
                                       f32_3 %490 = OpFAdd %479 %489 
                                       f32_4 %491 = OpLoad %477 
                                       f32_4 %492 = OpVectorShuffle %491 %490 4 5 6 3 
                                                      OpStore %477 %492 
                                Private f32* %493 = OpAccessChain %9 %67 
                                         f32 %494 = OpLoad %493 
                                 Output f32* %496 = OpAccessChain %477 %67 
                                                      OpStore %496 %494 
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