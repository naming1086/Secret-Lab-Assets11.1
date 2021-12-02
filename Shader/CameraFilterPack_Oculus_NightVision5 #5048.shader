//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Oculus_NightVision5" {
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
  GpuProgramID 56463
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
uniform 	float _Red_R;
uniform 	float _Red_G;
uniform 	float _Red_B;
uniform 	float _Green_R;
uniform 	float _Green_G;
uniform 	float _Green_B;
uniform 	float _Blue_R;
uniform 	float _Blue_G;
uniform 	float _Blue_B;
uniform 	float _Red_C;
uniform 	float _Green_C;
uniform 	float _Blue_C;
uniform 	float _FadeFX;
uniform 	float _Size;
uniform 	float _Dist;
uniform 	float _Smooth;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat6;
float u_xlat10;
vec2 u_xlat12;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = vec4(_TimeX) * vec4(0.25, 0.230000004, 10.0, 110.0);
    u_xlat5.xz = sin(u_xlat0.yw);
    u_xlat5.x = u_xlat5.x + _TimeX;
    u_xlat15 = u_xlat5.z * 0.00999999978 + 0.790000021;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = u_xlat1.y * 2.0 + u_xlat0.x;
    u_xlat5.y = u_xlat1.y * 250.0 + u_xlat0.z;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat10 = u_xlat5.y * 0.100000001 + 0.899999976;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat5.x = floor(u_xlat0.x);
    u_xlat0.x = (-u_xlat5.x) + u_xlat0.x;
    u_xlatb2.xy = greaterThanEqual(u_xlat0.xxxx, vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
    u_xlat0.x = u_xlat0.x + -0.400000006;
    u_xlat5.x = u_xlatb2.x ? 1.0 : float(0.0);
    u_xlat16 = (u_xlatb2.y) ? -1.0 : -0.0;
    u_xlat5.x = u_xlat5.x + u_xlat16;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 4.99999952 + 1.0;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat5.x = cos(_TimeX);
    u_xlat2.y = u_xlat5.x * _TimeX;
    u_xlat2.x = _TimeX;
    u_xlat12.xy = u_xlat1.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * vec2(8.0, 16.0) + u_xlat12.xy;
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat5.x = u_xlat2.x * u_xlat2.x;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat2.y = _Blue_G + (-_Smooth);
    u_xlat2.x = _Blue_R;
    u_xlat2.z = _Blue_B;
    u_xlat3 = texture(_MainTex, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.z = u_xlat5.x + _Blue_C;
    u_xlat4.y = _Red_G + (-_Smooth);
    u_xlat4.xz = vec2(_Red_R, _Red_B);
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat2.x = u_xlat5.x + _Red_C;
    u_xlat4.y = _Green_G + (-_Smooth);
    u_xlat4.xz = vec2(_Green_R, _Green_B);
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat2.y = u_xlat5.x + _Green_C;
    u_xlat2.xyz = u_xlat0.xxx * vec3(0.125, 0.125, 0.125) + u_xlat2.xyz;
    u_xlat0.x = u_xlat1.y * 30.0 + _TimeX;
    u_xlat5.x = floor(u_xlat0.x);
    u_xlat0.x = (-u_xlat5.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 12.0;
    u_xlat0.x = u_xlat0.x * 0.0769230798;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = u_xlat1.x * u_xlat1.y;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat4.xy = (-u_xlat1.xy) + vec2(1.5, 1.5);
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + 0.5;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.z = u_xlat1.x * 1.38888884;
    u_xlat2.yz = (-u_xlat1.zy);
    u_xlat2.x = (-u_xlat1.x) * 1.38888884 + (-_Dist);
    u_xlat1.xy = u_xlat2.xz + vec2(0.694000006, 0.5);
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_Size);
    u_xlat1.x = float(1.0) / (-_Smooth);
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat6.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = (-u_xlat6.x) * u_xlat15 + 1.0;
    u_xlat4.x = _Dist + 0.694000006;
    u_xlat4.y = 0.5;
    u_xlat6.xy = u_xlat2.yz + u_xlat4.xy;
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + (-_Size);
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat6.x) * u_xlat1.x + 1.0;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat15) * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat3.xyz;
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
; Bound: 577
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %53 %553 
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
                                                      OpMemberDecorate %10 13 Offset 10 
                                                      OpMemberDecorate %10 14 Offset 10 
                                                      OpMemberDecorate %10 15 Offset 10 
                                                      OpMemberDecorate %10 16 Offset 10 
                                                      OpMemberDecorate %10 17 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 53 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %207 DescriptorSet 207 
                                                      OpDecorate %207 Binding 207 
                                                      OpDecorate %553 Location 553 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Uniform %6 
                                          f32 %19 = OpConstant 3.674022E-40 
                                          f32 %20 = OpConstant 3.674022E-40 
                                          f32 %21 = OpConstant 3.674022E-40 
                                          f32 %22 = OpConstant 3.674022E-40 
                                        f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypePointer Private %25 
                               Private f32_3* %27 = OpVariable Private 
                                              %28 = OpTypeVector %6 2 
                                              %34 = OpTypeInt 32 0 
                                          u32 %35 = OpConstant 0 
                                              %36 = OpTypePointer Private %6 
                                 Private f32* %43 = OpVariable Private 
                                          u32 %44 = OpConstant 2 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          f32 %49 = OpConstant 3.674022E-40 
                               Private f32_3* %51 = OpVariable Private 
                                              %52 = OpTypePointer Input %28 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %55 = OpConstant 17 
                                              %56 = OpTypePointer Uniform %7 
                                          u32 %67 = OpConstant 1 
                                          f32 %70 = OpConstant 3.674022E-40 
                                          f32 %78 = OpConstant 3.674022E-40 
                                 Private f32* %89 = OpVariable Private 
                                          f32 %92 = OpConstant 3.674022E-40 
                                          f32 %94 = OpConstant 3.674022E-40 
                                             %113 = OpTypeBool 
                                             %114 = OpTypeVector %113 2 
                                             %115 = OpTypePointer Private %114 
                             Private bool_2* %116 = OpVariable Private 
                                         f32 %119 = OpConstant 3.674022E-40 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                       f32_4 %122 = OpConstantComposite %119 %120 %121 %121 
                                             %123 = OpTypeVector %113 4 
                                         f32 %128 = OpConstant 3.674022E-40 
                                             %131 = OpTypePointer Private %113 
                                         f32 %134 = OpConstant 3.674022E-40 
                                Private f32* %137 = OpVariable Private 
                                         f32 %140 = OpConstant 3.674022E-40 
                                         f32 %141 = OpConstant 3.674022E-40 
                                         f32 %157 = OpConstant 3.674022E-40 
                              Private f32_3* %171 = OpVariable Private 
                                             %181 = OpTypePointer Private %28 
                              Private f32_2* %182 = OpVariable Private 
                                         f32 %185 = OpConstant 3.674022E-40 
                                       f32_2 %186 = OpConstantComposite %185 %134 
                                         f32 %188 = OpConstant 3.674022E-40 
                                       f32_2 %189 = OpConstantComposite %134 %188 
                                         f32 %193 = OpConstant 3.674022E-40 
                                         f32 %194 = OpConstant 3.674022E-40 
                                       f32_2 %195 = OpConstantComposite %193 %194 
                                             %201 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %202 = OpTypePointer UniformConstant %201 
        UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
                                             %205 = OpTypeSampler 
                                             %206 = OpTypePointer UniformConstant %205 
                    UniformConstant sampler* %207 = OpVariable UniformConstant 
                                             %209 = OpTypeSampledImage %201 
                                         i32 %228 = OpConstant 8 
                                         i32 %231 = OpConstant 16 
                                         i32 %237 = OpConstant 7 
                                         i32 %241 = OpConstant 9 
                              Private f32_3* %245 = OpVariable Private 
                                         i32 %259 = OpConstant 12 
                              Private f32_3* %264 = OpVariable Private 
                                         i32 %265 = OpConstant 2 
                                         i32 %273 = OpConstant 1 
                                         i32 %276 = OpConstant 3 
                                         i32 %288 = OpConstant 10 
                                         i32 %293 = OpConstant 5 
                                         i32 %301 = OpConstant 4 
                                         i32 %304 = OpConstant 6 
                                         i32 %316 = OpConstant 11 
                                         f32 %323 = OpConstant 3.674022E-40 
                                       f32_3 %324 = OpConstantComposite %323 %323 %323 
                                         f32 %330 = OpConstant 3.674022E-40 
                                         f32 %349 = OpConstant 3.674022E-40 
                                         f32 %354 = OpConstant 3.674022E-40 
                                         f32 %369 = OpConstant 3.674022E-40 
                                         f32 %375 = OpConstant 3.674022E-40 
                                       f32_2 %376 = OpConstantComposite %375 %375 
                                         f32 %412 = OpConstant 3.674022E-40 
                                         i32 %424 = OpConstant 15 
                                         f32 %432 = OpConstant 3.674022E-40 
                                       f32_2 %433 = OpConstantComposite %432 %185 
                                         i32 %445 = OpConstant 14 
                              Private f32_2* %461 = OpVariable Private 
                                         f32 %463 = OpConstant 3.674022E-40 
                                             %552 = OpTypePointer Output %7 
                               Output f32_4* %553 = OpVariable Output 
                                         i32 %554 = OpConstant 13 
                                         u32 %573 = OpConstant 3 
                                             %574 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                        f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
                                        f32_4 %24 = OpFMul %18 %23 
                                                      OpStore %9 %24 
                                        f32_4 %29 = OpLoad %9 
                                        f32_2 %30 = OpVectorShuffle %29 %29 1 3 
                                        f32_2 %31 = OpExtInst %1 13 %30 
                                        f32_3 %32 = OpLoad %27 
                                        f32_3 %33 = OpVectorShuffle %32 %31 3 1 4 
                                                      OpStore %27 %33 
                                 Private f32* %37 = OpAccessChain %27 %35 
                                          f32 %38 = OpLoad %37 
                                 Uniform f32* %39 = OpAccessChain %12 %14 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFAdd %38 %40 
                                 Private f32* %42 = OpAccessChain %27 %35 
                                                      OpStore %42 %41 
                                 Private f32* %45 = OpAccessChain %27 %44 
                                          f32 %46 = OpLoad %45 
                                          f32 %48 = OpFMul %46 %47 
                                          f32 %50 = OpFAdd %48 %49 
                                                      OpStore %43 %50 
                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %57 = OpAccessChain %12 %55 
                                        f32_4 %58 = OpLoad %57 
                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                        f32_2 %60 = OpFMul %54 %59 
                               Uniform f32_4* %61 = OpAccessChain %12 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_2 %63 = OpVectorShuffle %62 %62 2 3 
                                        f32_2 %64 = OpFAdd %60 %63 
                                        f32_3 %65 = OpLoad %51 
                                        f32_3 %66 = OpVectorShuffle %65 %64 3 4 2 
                                                      OpStore %51 %66 
                                 Private f32* %68 = OpAccessChain %51 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %71 = OpFMul %69 %70 
                                 Private f32* %72 = OpAccessChain %9 %35 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFAdd %71 %73 
                                 Private f32* %75 = OpAccessChain %9 %35 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %51 %67 
                                          f32 %77 = OpLoad %76 
                                          f32 %79 = OpFMul %77 %78 
                                 Private f32* %80 = OpAccessChain %9 %44 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFAdd %79 %81 
                                 Private f32* %83 = OpAccessChain %27 %67 
                                                      OpStore %83 %82 
                                        f32_3 %84 = OpLoad %27 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %86 = OpExtInst %1 13 %85 
                                        f32_3 %87 = OpLoad %27 
                                        f32_3 %88 = OpVectorShuffle %87 %86 3 4 2 
                                                      OpStore %27 %88 
                                 Private f32* %90 = OpAccessChain %27 %67 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFMul %91 %92 
                                          f32 %95 = OpFAdd %93 %94 
                                                      OpStore %89 %95 
                                 Private f32* %96 = OpAccessChain %27 %35 
                                          f32 %97 = OpLoad %96 
                                 Private f32* %98 = OpAccessChain %9 %35 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFAdd %97 %99 
                                Private f32* %101 = OpAccessChain %9 %35 
                                                      OpStore %101 %100 
                                Private f32* %102 = OpAccessChain %9 %35 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpExtInst %1 8 %103 
                                Private f32* %105 = OpAccessChain %27 %35 
                                                      OpStore %105 %104 
                                Private f32* %106 = OpAccessChain %27 %35 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFNegate %107 
                                Private f32* %109 = OpAccessChain %9 %35 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %108 %110 
                                Private f32* %112 = OpAccessChain %9 %35 
                                                      OpStore %112 %111 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %117 0 0 0 0 
                                      bool_4 %124 = OpFOrdGreaterThanEqual %118 %122 
                                      bool_2 %125 = OpVectorShuffle %124 %124 0 1 
                                                      OpStore %116 %125 
                                Private f32* %126 = OpAccessChain %9 %35 
                                         f32 %127 = OpLoad %126 
                                         f32 %129 = OpFAdd %127 %128 
                                Private f32* %130 = OpAccessChain %9 %35 
                                                      OpStore %130 %129 
                               Private bool* %132 = OpAccessChain %116 %35 
                                        bool %133 = OpLoad %132 
                                         f32 %135 = OpSelect %133 %134 %121 
                                Private f32* %136 = OpAccessChain %27 %35 
                                                      OpStore %136 %135 
                               Private bool* %138 = OpAccessChain %116 %67 
                                        bool %139 = OpLoad %138 
                                         f32 %142 = OpSelect %139 %140 %141 
                                                      OpStore %137 %142 
                                Private f32* %143 = OpAccessChain %27 %35 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpLoad %137 
                                         f32 %146 = OpFAdd %144 %145 
                                Private f32* %147 = OpAccessChain %27 %35 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %27 %35 
                                         f32 %149 = OpLoad %148 
                                Private f32* %150 = OpAccessChain %9 %35 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFMul %149 %151 
                                Private f32* %153 = OpAccessChain %9 %35 
                                                      OpStore %153 %152 
                                Private f32* %154 = OpAccessChain %9 %35 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFNegate %155 
                                         f32 %158 = OpFMul %156 %157 
                                         f32 %159 = OpFAdd %158 %134 
                                Private f32* %160 = OpAccessChain %9 %35 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %27 %35 
                                         f32 %162 = OpLoad %161 
                                Private f32* %163 = OpAccessChain %9 %35 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %162 %164 
                                Private f32* %166 = OpAccessChain %9 %35 
                                                      OpStore %166 %165 
                                Uniform f32* %167 = OpAccessChain %12 %14 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpExtInst %1 14 %168 
                                Private f32* %170 = OpAccessChain %27 %35 
                                                      OpStore %170 %169 
                                Private f32* %172 = OpAccessChain %27 %35 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %174 = OpAccessChain %12 %14 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %173 %175 
                                Private f32* %177 = OpAccessChain %171 %67 
                                                      OpStore %177 %176 
                                Uniform f32* %178 = OpAccessChain %12 %14 
                                         f32 %179 = OpLoad %178 
                                Private f32* %180 = OpAccessChain %171 %35 
                                                      OpStore %180 %179 
                                       f32_3 %183 = OpLoad %51 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                       f32_2 %187 = OpFMul %184 %186 
                                       f32_2 %190 = OpFAdd %187 %189 
                                                      OpStore %182 %190 
                                       f32_3 %191 = OpLoad %171 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %196 = OpFMul %192 %195 
                                       f32_2 %197 = OpLoad %182 
                                       f32_2 %198 = OpFAdd %196 %197 
                                       f32_3 %199 = OpLoad %171 
                                       f32_3 %200 = OpVectorShuffle %199 %198 3 4 2 
                                                      OpStore %171 %200 
                         read_only Texture2D %204 = OpLoad %203 
                                     sampler %208 = OpLoad %207 
                  read_only Texture2DSampled %210 = OpSampledImage %204 %208 
                                       f32_3 %211 = OpLoad %171 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                         f32 %214 = OpCompositeExtract %213 0 
                                Private f32* %215 = OpAccessChain %27 %35 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %27 %35 
                                         f32 %217 = OpLoad %216 
                                Private f32* %218 = OpAccessChain %27 %35 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %217 %219 
                                Private f32* %221 = OpAccessChain %27 %35 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %27 %35 
                                         f32 %223 = OpLoad %222 
                                Private f32* %224 = OpAccessChain %9 %35 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFMul %223 %225 
                                Private f32* %227 = OpAccessChain %9 %35 
                                                      OpStore %227 %226 
                                Uniform f32* %229 = OpAccessChain %12 %228 
                                         f32 %230 = OpLoad %229 
                                Uniform f32* %232 = OpAccessChain %12 %231 
                                         f32 %233 = OpLoad %232 
                                         f32 %234 = OpFNegate %233 
                                         f32 %235 = OpFAdd %230 %234 
                                Private f32* %236 = OpAccessChain %171 %67 
                                                      OpStore %236 %235 
                                Uniform f32* %238 = OpAccessChain %12 %237 
                                         f32 %239 = OpLoad %238 
                                Private f32* %240 = OpAccessChain %171 %35 
                                                      OpStore %240 %239 
                                Uniform f32* %242 = OpAccessChain %12 %241 
                                         f32 %243 = OpLoad %242 
                                Private f32* %244 = OpAccessChain %171 %44 
                                                      OpStore %244 %243 
                         read_only Texture2D %246 = OpLoad %203 
                                     sampler %247 = OpLoad %207 
                  read_only Texture2DSampled %248 = OpSampledImage %246 %247 
                                       f32_3 %249 = OpLoad %51 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                       f32_4 %251 = OpImageSampleImplicitLod %248 %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                                      OpStore %245 %252 
                                       f32_3 %253 = OpLoad %245 
                                       f32_3 %254 = OpLoad %171 
                                         f32 %255 = OpDot %253 %254 
                                Private f32* %256 = OpAccessChain %27 %35 
                                                      OpStore %256 %255 
                                Private f32* %257 = OpAccessChain %27 %35 
                                         f32 %258 = OpLoad %257 
                                Uniform f32* %260 = OpAccessChain %12 %259 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpFAdd %258 %261 
                                Private f32* %263 = OpAccessChain %171 %44 
                                                      OpStore %263 %262 
                                Uniform f32* %266 = OpAccessChain %12 %265 
                                         f32 %267 = OpLoad %266 
                                Uniform f32* %268 = OpAccessChain %12 %231 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFNegate %269 
                                         f32 %271 = OpFAdd %267 %270 
                                Private f32* %272 = OpAccessChain %264 %67 
                                                      OpStore %272 %271 
                                Uniform f32* %274 = OpAccessChain %12 %273 
                                         f32 %275 = OpLoad %274 
                                Uniform f32* %277 = OpAccessChain %12 %276 
                                         f32 %278 = OpLoad %277 
                                       f32_2 %279 = OpCompositeConstruct %275 %278 
                                       f32_3 %280 = OpLoad %264 
                                       f32_3 %281 = OpVectorShuffle %280 %279 3 1 4 
                                                      OpStore %264 %281 
                                       f32_3 %282 = OpLoad %245 
                                       f32_3 %283 = OpLoad %264 
                                         f32 %284 = OpDot %282 %283 
                                Private f32* %285 = OpAccessChain %27 %35 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %27 %35 
                                         f32 %287 = OpLoad %286 
                                Uniform f32* %289 = OpAccessChain %12 %288 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFAdd %287 %290 
                                Private f32* %292 = OpAccessChain %171 %35 
                                                      OpStore %292 %291 
                                Uniform f32* %294 = OpAccessChain %12 %293 
                                         f32 %295 = OpLoad %294 
                                Uniform f32* %296 = OpAccessChain %12 %231 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFNegate %297 
                                         f32 %299 = OpFAdd %295 %298 
                                Private f32* %300 = OpAccessChain %264 %67 
                                                      OpStore %300 %299 
                                Uniform f32* %302 = OpAccessChain %12 %301 
                                         f32 %303 = OpLoad %302 
                                Uniform f32* %305 = OpAccessChain %12 %304 
                                         f32 %306 = OpLoad %305 
                                       f32_2 %307 = OpCompositeConstruct %303 %306 
                                       f32_3 %308 = OpLoad %264 
                                       f32_3 %309 = OpVectorShuffle %308 %307 3 1 4 
                                                      OpStore %264 %309 
                                       f32_3 %310 = OpLoad %245 
                                       f32_3 %311 = OpLoad %264 
                                         f32 %312 = OpDot %310 %311 
                                Private f32* %313 = OpAccessChain %27 %35 
                                                      OpStore %313 %312 
                                Private f32* %314 = OpAccessChain %27 %35 
                                         f32 %315 = OpLoad %314 
                                Uniform f32* %317 = OpAccessChain %12 %316 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpFAdd %315 %318 
                                Private f32* %320 = OpAccessChain %171 %67 
                                                      OpStore %320 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 0 0 
                                       f32_3 %325 = OpFMul %322 %324 
                                       f32_3 %326 = OpLoad %171 
                                       f32_3 %327 = OpFAdd %325 %326 
                                                      OpStore %171 %327 
                                Private f32* %328 = OpAccessChain %51 %67 
                                         f32 %329 = OpLoad %328 
                                         f32 %331 = OpFMul %329 %330 
                                Uniform f32* %332 = OpAccessChain %12 %14 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFAdd %331 %333 
                                Private f32* %335 = OpAccessChain %9 %35 
                                                      OpStore %335 %334 
                                Private f32* %336 = OpAccessChain %9 %35 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpExtInst %1 8 %337 
                                Private f32* %339 = OpAccessChain %27 %35 
                                                      OpStore %339 %338 
                                Private f32* %340 = OpAccessChain %27 %35 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpFNegate %341 
                                Private f32* %343 = OpAccessChain %9 %35 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                Private f32* %346 = OpAccessChain %9 %35 
                                                      OpStore %346 %345 
                                Private f32* %347 = OpAccessChain %9 %35 
                                         f32 %348 = OpLoad %347 
                                         f32 %350 = OpFAdd %348 %349 
                                Private f32* %351 = OpAccessChain %9 %35 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %9 %35 
                                         f32 %353 = OpLoad %352 
                                         f32 %355 = OpFMul %353 %354 
                                Private f32* %356 = OpAccessChain %9 %35 
                                                      OpStore %356 %355 
                                       f32_4 %357 = OpLoad %9 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 0 0 
                                       f32_3 %359 = OpLoad %171 
                                       f32_3 %360 = OpFMul %358 %359 
                                                      OpStore %171 %360 
                                Private f32* %361 = OpAccessChain %51 %35 
                                         f32 %362 = OpLoad %361 
                                Private f32* %363 = OpAccessChain %51 %67 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFMul %362 %364 
                                Private f32* %366 = OpAccessChain %9 %35 
                                                      OpStore %366 %365 
                                Private f32* %367 = OpAccessChain %9 %35 
                                         f32 %368 = OpLoad %367 
                                         f32 %370 = OpFMul %368 %369 
                                Private f32* %371 = OpAccessChain %9 %35 
                                                      OpStore %371 %370 
                                       f32_3 %372 = OpLoad %51 
                                       f32_2 %373 = OpVectorShuffle %372 %372 0 1 
                                       f32_2 %374 = OpFNegate %373 
                                       f32_2 %377 = OpFAdd %374 %376 
                                       f32_3 %378 = OpLoad %264 
                                       f32_3 %379 = OpVectorShuffle %378 %377 3 4 2 
                                                      OpStore %264 %379 
                                Private f32* %380 = OpAccessChain %9 %35 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %264 %35 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFMul %381 %383 
                                Private f32* %385 = OpAccessChain %9 %35 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %9 %35 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %264 %67 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFMul %387 %389 
                                         f32 %391 = OpFAdd %390 %185 
                                Private f32* %392 = OpAccessChain %9 %35 
                                                      OpStore %392 %391 
                                       f32_4 %393 = OpLoad %9 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 0 0 
                                       f32_3 %395 = OpLoad %171 
                                       f32_3 %396 = OpFMul %394 %395 
                                                      OpStore %171 %396 
                                         f32 %397 = OpLoad %89 
                                       f32_3 %398 = OpCompositeConstruct %397 %397 %397 
                                       f32_3 %399 = OpLoad %171 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_4 %401 = OpLoad %9 
                                       f32_4 %402 = OpVectorShuffle %401 %400 4 5 6 3 
                                                      OpStore %9 %402 
                                         f32 %403 = OpLoad %43 
                                       f32_3 %404 = OpCompositeConstruct %403 %403 %403 
                                       f32_4 %405 = OpLoad %9 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 1 2 
                                       f32_3 %407 = OpFMul %404 %406 
                                       f32_4 %408 = OpLoad %9 
                                       f32_4 %409 = OpVectorShuffle %408 %407 4 5 6 3 
                                                      OpStore %9 %409 
                                Private f32* %410 = OpAccessChain %51 %35 
                                         f32 %411 = OpLoad %410 
                                         f32 %413 = OpFMul %411 %412 
                                Private f32* %414 = OpAccessChain %51 %44 
                                                      OpStore %414 %413 
                                       f32_3 %415 = OpLoad %51 
                                       f32_2 %416 = OpVectorShuffle %415 %415 2 1 
                                       f32_2 %417 = OpFNegate %416 
                                       f32_3 %418 = OpLoad %171 
                                       f32_3 %419 = OpVectorShuffle %418 %417 0 3 4 
                                                      OpStore %171 %419 
                                Private f32* %420 = OpAccessChain %51 %35 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFNegate %421 
                                         f32 %423 = OpFMul %422 %412 
                                Uniform f32* %425 = OpAccessChain %12 %424 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpFNegate %426 
                                         f32 %428 = OpFAdd %423 %427 
                                Private f32* %429 = OpAccessChain %171 %35 
                                                      OpStore %429 %428 
                                       f32_3 %430 = OpLoad %171 
                                       f32_2 %431 = OpVectorShuffle %430 %430 0 2 
                                       f32_2 %434 = OpFAdd %431 %433 
                                       f32_3 %435 = OpLoad %51 
                                       f32_3 %436 = OpVectorShuffle %435 %434 3 4 2 
                                                      OpStore %51 %436 
                                       f32_3 %437 = OpLoad %51 
                                       f32_2 %438 = OpVectorShuffle %437 %437 0 1 
                                       f32_3 %439 = OpLoad %51 
                                       f32_2 %440 = OpVectorShuffle %439 %439 0 1 
                                         f32 %441 = OpDot %438 %440 
                                                      OpStore %43 %441 
                                         f32 %442 = OpLoad %43 
                                         f32 %443 = OpExtInst %1 31 %442 
                                                      OpStore %43 %443 
                                         f32 %444 = OpLoad %43 
                                Uniform f32* %446 = OpAccessChain %12 %445 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpFNegate %447 
                                         f32 %449 = OpFAdd %444 %448 
                                                      OpStore %43 %449 
                                Uniform f32* %450 = OpAccessChain %12 %231 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFNegate %451 
                                         f32 %453 = OpFDiv %134 %452 
                                Private f32* %454 = OpAccessChain %51 %35 
                                                      OpStore %454 %453 
                                         f32 %455 = OpLoad %43 
                                Private f32* %456 = OpAccessChain %51 %35 
                                         f32 %457 = OpLoad %456 
                                         f32 %458 = OpFMul %455 %457 
                                                      OpStore %43 %458 
                                         f32 %459 = OpLoad %43 
                                         f32 %460 = OpExtInst %1 43 %459 %121 %134 
                                                      OpStore %43 %460 
                                         f32 %462 = OpLoad %43 
                                         f32 %464 = OpFMul %462 %463 
                                         f32 %465 = OpFAdd %464 %188 
                                Private f32* %466 = OpAccessChain %461 %35 
                                                      OpStore %466 %465 
                                         f32 %467 = OpLoad %43 
                                         f32 %468 = OpLoad %43 
                                         f32 %469 = OpFMul %467 %468 
                                                      OpStore %43 %469 
                                Private f32* %470 = OpAccessChain %461 %35 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                         f32 %473 = OpLoad %43 
                                         f32 %474 = OpFMul %472 %473 
                                         f32 %475 = OpFAdd %474 %134 
                                                      OpStore %43 %475 
                                Uniform f32* %476 = OpAccessChain %12 %424 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFAdd %477 %432 
                                Private f32* %479 = OpAccessChain %264 %35 
                                                      OpStore %479 %478 
                                Private f32* %480 = OpAccessChain %264 %67 
                                                      OpStore %480 %185 
                                       f32_3 %481 = OpLoad %171 
                                       f32_2 %482 = OpVectorShuffle %481 %481 1 2 
                                       f32_3 %483 = OpLoad %264 
                                       f32_2 %484 = OpVectorShuffle %483 %483 0 1 
                                       f32_2 %485 = OpFAdd %482 %484 
                                                      OpStore %461 %485 
                                       f32_2 %486 = OpLoad %461 
                                       f32_2 %487 = OpLoad %461 
                                         f32 %488 = OpDot %486 %487 
                                Private f32* %489 = OpAccessChain %461 %35 
                                                      OpStore %489 %488 
                                Private f32* %490 = OpAccessChain %461 %35 
                                         f32 %491 = OpLoad %490 
                                         f32 %492 = OpExtInst %1 31 %491 
                                Private f32* %493 = OpAccessChain %461 %35 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %461 %35 
                                         f32 %495 = OpLoad %494 
                                Uniform f32* %496 = OpAccessChain %12 %445 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFNegate %497 
                                         f32 %499 = OpFAdd %495 %498 
                                Private f32* %500 = OpAccessChain %461 %35 
                                                      OpStore %500 %499 
                                Private f32* %501 = OpAccessChain %51 %35 
                                         f32 %502 = OpLoad %501 
                                Private f32* %503 = OpAccessChain %461 %35 
                                         f32 %504 = OpLoad %503 
                                         f32 %505 = OpFMul %502 %504 
                                Private f32* %506 = OpAccessChain %51 %35 
                                                      OpStore %506 %505 
                                Private f32* %507 = OpAccessChain %51 %35 
                                         f32 %508 = OpLoad %507 
                                         f32 %509 = OpExtInst %1 43 %508 %121 %134 
                                Private f32* %510 = OpAccessChain %51 %35 
                                                      OpStore %510 %509 
                                Private f32* %511 = OpAccessChain %51 %35 
                                         f32 %512 = OpLoad %511 
                                         f32 %513 = OpFMul %512 %463 
                                         f32 %514 = OpFAdd %513 %188 
                                Private f32* %515 = OpAccessChain %461 %35 
                                                      OpStore %515 %514 
                                Private f32* %516 = OpAccessChain %51 %35 
                                         f32 %517 = OpLoad %516 
                                Private f32* %518 = OpAccessChain %51 %35 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpFMul %517 %519 
                                Private f32* %521 = OpAccessChain %51 %35 
                                                      OpStore %521 %520 
                                Private f32* %522 = OpAccessChain %461 %35 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpFNegate %523 
                                Private f32* %525 = OpAccessChain %51 %35 
                                         f32 %526 = OpLoad %525 
                                         f32 %527 = OpFMul %524 %526 
                                         f32 %528 = OpFAdd %527 %134 
                                Private f32* %529 = OpAccessChain %51 %35 
                                                      OpStore %529 %528 
                                         f32 %530 = OpLoad %43 
                                Private f32* %531 = OpAccessChain %51 %35 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFMul %530 %532 
                                                      OpStore %43 %533 
                                         f32 %534 = OpLoad %43 
                                       f32_3 %535 = OpCompositeConstruct %534 %534 %534 
                                       f32_4 %536 = OpLoad %9 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
                                       f32_3 %538 = OpFNegate %537 
                                       f32_3 %539 = OpFMul %535 %538 
                                       f32_4 %540 = OpLoad %9 
                                       f32_3 %541 = OpVectorShuffle %540 %540 0 1 2 
                                       f32_3 %542 = OpFAdd %539 %541 
                                       f32_4 %543 = OpLoad %9 
                                       f32_4 %544 = OpVectorShuffle %543 %542 4 5 6 3 
                                                      OpStore %9 %544 
                                       f32_3 %545 = OpLoad %245 
                                       f32_3 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %9 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %9 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 5 6 3 
                                                      OpStore %9 %551 
                                Uniform f32* %555 = OpAccessChain %12 %554 
                                         f32 %556 = OpLoad %555 
                                Uniform f32* %557 = OpAccessChain %12 %554 
                                         f32 %558 = OpLoad %557 
                                Uniform f32* %559 = OpAccessChain %12 %554 
                                         f32 %560 = OpLoad %559 
                                       f32_3 %561 = OpCompositeConstruct %556 %558 %560 
                                         f32 %562 = OpCompositeExtract %561 0 
                                         f32 %563 = OpCompositeExtract %561 1 
                                         f32 %564 = OpCompositeExtract %561 2 
                                       f32_3 %565 = OpCompositeConstruct %562 %563 %564 
                                       f32_4 %566 = OpLoad %9 
                                       f32_3 %567 = OpVectorShuffle %566 %566 0 1 2 
                                       f32_3 %568 = OpFMul %565 %567 
                                       f32_3 %569 = OpLoad %245 
                                       f32_3 %570 = OpFAdd %568 %569 
                                       f32_4 %571 = OpLoad %553 
                                       f32_4 %572 = OpVectorShuffle %571 %570 4 5 6 3 
                                                      OpStore %553 %572 
                                 Output f32* %575 = OpAccessChain %553 %573 
                                                      OpStore %575 %134 
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