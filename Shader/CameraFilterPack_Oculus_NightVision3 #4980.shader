//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Oculus_NightVision3" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_BinocularSize ("_BinocularSize", Range(0, 1)) = 0.5
_BinocularDistance ("_BinocularDistance", Range(0, 1)) = 0.5
_Greenness ("_Greenness", Range(0, 1)) = 0.4
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2973
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
uniform 	float _Greenness;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0 = vec4(_TimeX) * vec4(80.0, 0.25, 0.230000004, 10.0);
    u_xlat10 = sin(u_xlat0.z);
    u_xlat10 = u_xlat10 + _TimeX;
    u_xlat10 = sin(u_xlat10);
    u_xlat1.yz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5 = u_xlat1.z * 2.0 + u_xlat0.y;
    u_xlat5 = u_xlat10 + u_xlat5;
    u_xlat10 = floor(u_xlat5);
    u_xlat5 = (-u_xlat10) + u_xlat5;
    u_xlatb2.xy = greaterThanEqual(vec4(u_xlat5), vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
    u_xlat5 = u_xlat5 + -0.400000006;
    u_xlat10 = u_xlatb2.x ? 1.0 : float(0.0);
    u_xlat16 = (u_xlatb2.y) ? -1.0 : -0.0;
    u_xlat10 = u_xlat10 + u_xlat16;
    u_xlat5 = u_xlat10 * u_xlat5;
    u_xlat5 = (-u_xlat5) * 4.99999952 + 1.0;
    u_xlat5 = u_xlat10 * u_xlat5;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10 = u_xlat1.z * 300.0 + u_xlat0.w;
    u_xlat10 = sin(u_xlat10);
    u_xlat10 = u_xlat10 * 0.100000001 + 0.899999976;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat15 = _TimeX + _TimeX;
    u_xlat15 = cos(u_xlat15);
    u_xlat15 = u_xlat15 * 2.0 + _TimeX;
    u_xlat15 = sin(u_xlat15);
    u_xlatb15 = u_xlat15>=0.899999976;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zz * vec2(20.0, 30.0) + vec2(_TimeX);
    u_xlat16 = sin(u_xlat2.x);
    u_xlat16 = u_xlat16 * 0.00400000019;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat1.x = u_xlat15 * u_xlat0.x + u_xlat1.y;
    u_xlat3 = texture(_MainTex, u_xlat1.xz);
    u_xlat0.x = cos(_TimeX);
    u_xlat4.y = u_xlat0.x * _TimeX;
    u_xlat4.x = _TimeX;
    u_xlat0.xw = u_xlat1.yz * vec2(0.5, 1.0) + vec2(1.0, 3.0);
    u_xlat0.xw = u_xlat4.xy * vec2(8.0, 16.0) + u_xlat0.xw;
    u_xlat4 = texture(_MainTex, u_xlat0.xw);
    u_xlat0.x = u_xlat4.x * u_xlat4.x;
    u_xlat0.x = u_xlat5 * u_xlat0.x + u_xlat3.x;
    u_xlat5 = floor(u_xlat2.y);
    u_xlat5 = (-u_xlat5) + u_xlat2.y;
    u_xlat5 = u_xlat5 + 12.0;
    u_xlat0.x = u_xlat0.x * u_xlat5;
    u_xlat0.y = u_xlat1.y * u_xlat1.z;
    u_xlat1.xy = (-u_xlat1.yz) + vec2(1.5, 1.5);
    u_xlat0.xy = u_xlat0.xy * vec2(0.0769230798, 6.0);
    u_xlat5 = u_xlat1.x * u_xlat0.y;
    u_xlat5 = u_xlat1.y * u_xlat5;
    u_xlat5 = u_xlat5 * _Greenness + 0.5;
    u_xlat1.x = u_xlat5 * u_xlat0.x;
    u_xlat1.y = _Greenness * 0.25 + 1.54999995;
    u_xlat0.xyw = u_xlat1.xyx * vec3(_Greenness);
    u_xlat1.z = 0.550000012;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.zxz;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
    u_xlat15 = _TimeX * 110.0;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 * 0.00999999978 + 0.790000021;
    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
                                              OpEntryPoint Fragment %4 "main" %41 %352 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %10 0 Offset 10 
                                              OpMemberDecorate %10 1 Offset 10 
                                              OpMemberDecorate %10 2 Offset 10 
                                              OpDecorate %10 Block 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate vs_TEXCOORD0 Location 41 
                                              OpDecorate %189 DescriptorSet 189 
                                              OpDecorate %189 Binding 189 
                                              OpDecorate %193 DescriptorSet 193 
                                              OpDecorate %193 Binding 193 
                                              OpDecorate %352 Location 352 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeStruct %6 %6 %7 
                                      %11 = OpTypePointer Uniform %10 
   Uniform struct {f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                      %13 = OpTypeInt 32 1 
                                  i32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Uniform %6 
                                  f32 %19 = OpConstant 3.674022E-40 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  f32 %21 = OpConstant 3.674022E-40 
                                  f32 %22 = OpConstant 3.674022E-40 
                                f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
                                      %25 = OpTypePointer Private %6 
                         Private f32* %26 = OpVariable Private 
                                      %27 = OpTypeInt 32 0 
                                  u32 %28 = OpConstant 2 
                       Private f32_4* %38 = OpVariable Private 
                                      %39 = OpTypeVector %6 2 
                                      %40 = OpTypePointer Input %39 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  i32 %43 = OpConstant 2 
                                      %44 = OpTypePointer Uniform %7 
                         Private f32* %55 = OpVariable Private 
                                  f32 %58 = OpConstant 3.674022E-40 
                                  u32 %60 = OpConstant 1 
                                      %73 = OpTypeBool 
                                      %74 = OpTypeVector %73 2 
                                      %75 = OpTypePointer Private %74 
                      Private bool_2* %76 = OpVariable Private 
                                  f32 %79 = OpConstant 3.674022E-40 
                                  f32 %80 = OpConstant 3.674022E-40 
                                  f32 %81 = OpConstant 3.674022E-40 
                                f32_4 %82 = OpConstantComposite %79 %80 %81 %81 
                                      %83 = OpTypeVector %73 4 
                                  f32 %87 = OpConstant 3.674022E-40 
                                  u32 %89 = OpConstant 0 
                                      %90 = OpTypePointer Private %73 
                                  f32 %93 = OpConstant 3.674022E-40 
                         Private f32* %95 = OpVariable Private 
                                  f32 %98 = OpConstant 3.674022E-40 
                                  f32 %99 = OpConstant 3.674022E-40 
                                 f32 %109 = OpConstant 3.674022E-40 
                                 f32 %121 = OpConstant 3.674022E-40 
                                 u32 %123 = OpConstant 3 
                                 f32 %130 = OpConstant 3.674022E-40 
                                 f32 %132 = OpConstant 3.674022E-40 
                        Private f32* %138 = OpVariable Private 
                       Private bool* %153 = OpVariable Private 
                                     %158 = OpTypePointer Private %39 
                      Private f32_2* %159 = OpVariable Private 
                                 f32 %162 = OpConstant 3.674022E-40 
                                 f32 %163 = OpConstant 3.674022E-40 
                               f32_2 %164 = OpConstantComposite %162 %163 
                                 f32 %174 = OpConstant 3.674022E-40 
                                     %187 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %188 = OpTypePointer UniformConstant %187 
UniformConstant read_only Texture2D* %189 = OpVariable UniformConstant 
                                     %191 = OpTypeSampler 
                                     %192 = OpTypePointer UniformConstant %191 
            UniformConstant sampler* %193 = OpVariable UniformConstant 
                                     %195 = OpTypeSampledImage %187 
                      Private f32_2* %205 = OpVariable Private 
                                 f32 %216 = OpConstant 3.674022E-40 
                               f32_2 %217 = OpConstantComposite %216 %93 
                                 f32 %219 = OpConstant 3.674022E-40 
                               f32_2 %220 = OpConstantComposite %93 %219 
                                 f32 %225 = OpConstant 3.674022E-40 
                                 f32 %226 = OpConstant 3.674022E-40 
                               f32_2 %227 = OpConstantComposite %225 %226 
                                 f32 %260 = OpConstant 3.674022E-40 
                                 f32 %276 = OpConstant 3.674022E-40 
                               f32_2 %277 = OpConstantComposite %276 %276 
                                 f32 %283 = OpConstant 3.674022E-40 
                                 f32 %284 = OpConstant 3.674022E-40 
                               f32_2 %285 = OpConstantComposite %283 %284 
                                 i32 %299 = OpConstant 1 
                                 f32 %312 = OpConstant 3.674022E-40 
                                     %315 = OpTypeVector %6 3 
                                 f32 %324 = OpConstant 3.674022E-40 
                                 f32 %342 = OpConstant 3.674022E-40 
                                 f32 %347 = OpConstant 3.674022E-40 
                                 f32 %349 = OpConstant 3.674022E-40 
                                     %351 = OpTypePointer Output %7 
                       Output f32_4* %352 = OpVariable Output 
                                     %360 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                         Uniform f32* %16 = OpAccessChain %12 %14 
                                  f32 %17 = OpLoad %16 
                                f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
                                f32_4 %24 = OpFMul %18 %23 
                                              OpStore %9 %24 
                         Private f32* %29 = OpAccessChain %9 %28 
                                  f32 %30 = OpLoad %29 
                                  f32 %31 = OpExtInst %1 13 %30 
                                              OpStore %26 %31 
                                  f32 %32 = OpLoad %26 
                         Uniform f32* %33 = OpAccessChain %12 %14 
                                  f32 %34 = OpLoad %33 
                                  f32 %35 = OpFAdd %32 %34 
                                              OpStore %26 %35 
                                  f32 %36 = OpLoad %26 
                                  f32 %37 = OpExtInst %1 13 %36 
                                              OpStore %26 %37 
                                f32_2 %42 = OpLoad vs_TEXCOORD0 
                       Uniform f32_4* %45 = OpAccessChain %12 %43 
                                f32_4 %46 = OpLoad %45 
                                f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                f32_2 %48 = OpFMul %42 %47 
                       Uniform f32_4* %49 = OpAccessChain %12 %43 
                                f32_4 %50 = OpLoad %49 
                                f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                                f32_2 %52 = OpFAdd %48 %51 
                                f32_4 %53 = OpLoad %38 
                                f32_4 %54 = OpVectorShuffle %53 %52 0 4 5 3 
                                              OpStore %38 %54 
                         Private f32* %56 = OpAccessChain %38 %28 
                                  f32 %57 = OpLoad %56 
                                  f32 %59 = OpFMul %57 %58 
                         Private f32* %61 = OpAccessChain %9 %60 
                                  f32 %62 = OpLoad %61 
                                  f32 %63 = OpFAdd %59 %62 
                                              OpStore %55 %63 
                                  f32 %64 = OpLoad %26 
                                  f32 %65 = OpLoad %55 
                                  f32 %66 = OpFAdd %64 %65 
                                              OpStore %55 %66 
                                  f32 %67 = OpLoad %55 
                                  f32 %68 = OpExtInst %1 8 %67 
                                              OpStore %26 %68 
                                  f32 %69 = OpLoad %26 
                                  f32 %70 = OpFNegate %69 
                                  f32 %71 = OpLoad %55 
                                  f32 %72 = OpFAdd %70 %71 
                                              OpStore %55 %72 
                                  f32 %77 = OpLoad %55 
                                f32_4 %78 = OpCompositeConstruct %77 %77 %77 %77 
                               bool_4 %84 = OpFOrdGreaterThanEqual %78 %82 
                               bool_2 %85 = OpVectorShuffle %84 %84 0 1 
                                              OpStore %76 %85 
                                  f32 %86 = OpLoad %55 
                                  f32 %88 = OpFAdd %86 %87 
                                              OpStore %55 %88 
                        Private bool* %91 = OpAccessChain %76 %89 
                                 bool %92 = OpLoad %91 
                                  f32 %94 = OpSelect %92 %93 %81 
                                              OpStore %26 %94 
                        Private bool* %96 = OpAccessChain %76 %60 
                                 bool %97 = OpLoad %96 
                                 f32 %100 = OpSelect %97 %98 %99 
                                              OpStore %95 %100 
                                 f32 %101 = OpLoad %26 
                                 f32 %102 = OpLoad %95 
                                 f32 %103 = OpFAdd %101 %102 
                                              OpStore %26 %103 
                                 f32 %104 = OpLoad %26 
                                 f32 %105 = OpLoad %55 
                                 f32 %106 = OpFMul %104 %105 
                                              OpStore %55 %106 
                                 f32 %107 = OpLoad %55 
                                 f32 %108 = OpFNegate %107 
                                 f32 %110 = OpFMul %108 %109 
                                 f32 %111 = OpFAdd %110 %93 
                                              OpStore %55 %111 
                                 f32 %112 = OpLoad %26 
                                 f32 %113 = OpLoad %55 
                                 f32 %114 = OpFMul %112 %113 
                                              OpStore %55 %114 
                        Private f32* %115 = OpAccessChain %9 %89 
                                 f32 %116 = OpLoad %115 
                                 f32 %117 = OpExtInst %1 14 %116 
                        Private f32* %118 = OpAccessChain %9 %89 
                                              OpStore %118 %117 
                        Private f32* %119 = OpAccessChain %38 %28 
                                 f32 %120 = OpLoad %119 
                                 f32 %122 = OpFMul %120 %121 
                        Private f32* %124 = OpAccessChain %9 %123 
                                 f32 %125 = OpLoad %124 
                                 f32 %126 = OpFAdd %122 %125 
                                              OpStore %26 %126 
                                 f32 %127 = OpLoad %26 
                                 f32 %128 = OpExtInst %1 13 %127 
                                              OpStore %26 %128 
                                 f32 %129 = OpLoad %26 
                                 f32 %131 = OpFMul %129 %130 
                                 f32 %133 = OpFAdd %131 %132 
                                              OpStore %26 %133 
                        Private f32* %134 = OpAccessChain %9 %89 
                                 f32 %135 = OpLoad %134 
                                 f32 %136 = OpFAdd %135 %93 
                        Private f32* %137 = OpAccessChain %9 %89 
                                              OpStore %137 %136 
                        Uniform f32* %139 = OpAccessChain %12 %14 
                                 f32 %140 = OpLoad %139 
                        Uniform f32* %141 = OpAccessChain %12 %14 
                                 f32 %142 = OpLoad %141 
                                 f32 %143 = OpFAdd %140 %142 
                                              OpStore %138 %143 
                                 f32 %144 = OpLoad %138 
                                 f32 %145 = OpExtInst %1 14 %144 
                                              OpStore %138 %145 
                                 f32 %146 = OpLoad %138 
                                 f32 %147 = OpFMul %146 %58 
                        Uniform f32* %148 = OpAccessChain %12 %14 
                                 f32 %149 = OpLoad %148 
                                 f32 %150 = OpFAdd %147 %149 
                                              OpStore %138 %150 
                                 f32 %151 = OpLoad %138 
                                 f32 %152 = OpExtInst %1 13 %151 
                                              OpStore %138 %152 
                                 f32 %154 = OpLoad %138 
                                bool %155 = OpFOrdGreaterThanEqual %154 %132 
                                              OpStore %153 %155 
                                bool %156 = OpLoad %153 
                                 f32 %157 = OpSelect %156 %93 %81 
                                              OpStore %138 %157 
                               f32_4 %160 = OpLoad %38 
                               f32_2 %161 = OpVectorShuffle %160 %160 2 2 
                               f32_2 %165 = OpFMul %161 %164 
                        Uniform f32* %166 = OpAccessChain %12 %14 
                                 f32 %167 = OpLoad %166 
                               f32_2 %168 = OpCompositeConstruct %167 %167 
                               f32_2 %169 = OpFAdd %165 %168 
                                              OpStore %159 %169 
                        Private f32* %170 = OpAccessChain %159 %89 
                                 f32 %171 = OpLoad %170 
                                 f32 %172 = OpExtInst %1 13 %171 
                                              OpStore %95 %172 
                                 f32 %173 = OpLoad %95 
                                 f32 %175 = OpFMul %173 %174 
                                              OpStore %95 %175 
                                 f32 %176 = OpLoad %138 
                                 f32 %177 = OpLoad %95 
                                 f32 %178 = OpFMul %176 %177 
                                              OpStore %138 %178 
                                 f32 %179 = OpLoad %138 
                        Private f32* %180 = OpAccessChain %9 %89 
                                 f32 %181 = OpLoad %180 
                                 f32 %182 = OpFMul %179 %181 
                        Private f32* %183 = OpAccessChain %38 %60 
                                 f32 %184 = OpLoad %183 
                                 f32 %185 = OpFAdd %182 %184 
                        Private f32* %186 = OpAccessChain %38 %89 
                                              OpStore %186 %185 
                 read_only Texture2D %190 = OpLoad %189 
                             sampler %194 = OpLoad %193 
          read_only Texture2DSampled %196 = OpSampledImage %190 %194 
                               f32_4 %197 = OpLoad %38 
                               f32_2 %198 = OpVectorShuffle %197 %197 0 2 
                               f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                 f32 %200 = OpCompositeExtract %199 0 
                        Private f32* %201 = OpAccessChain %9 %89 
                                              OpStore %201 %200 
                        Uniform f32* %202 = OpAccessChain %12 %14 
                                 f32 %203 = OpLoad %202 
                                 f32 %204 = OpExtInst %1 14 %203 
                                              OpStore %138 %204 
                                 f32 %206 = OpLoad %138 
                        Uniform f32* %207 = OpAccessChain %12 %14 
                                 f32 %208 = OpLoad %207 
                                 f32 %209 = OpFMul %206 %208 
                        Private f32* %210 = OpAccessChain %205 %60 
                                              OpStore %210 %209 
                        Uniform f32* %211 = OpAccessChain %12 %14 
                                 f32 %212 = OpLoad %211 
                        Private f32* %213 = OpAccessChain %205 %89 
                                              OpStore %213 %212 
                               f32_4 %214 = OpLoad %38 
                               f32_2 %215 = OpVectorShuffle %214 %214 1 2 
                               f32_2 %218 = OpFMul %215 %217 
                               f32_2 %221 = OpFAdd %218 %220 
                               f32_4 %222 = OpLoad %38 
                               f32_4 %223 = OpVectorShuffle %222 %221 4 1 2 5 
                                              OpStore %38 %223 
                               f32_2 %224 = OpLoad %205 
                               f32_2 %228 = OpFMul %224 %227 
                               f32_4 %229 = OpLoad %38 
                               f32_2 %230 = OpVectorShuffle %229 %229 0 3 
                               f32_2 %231 = OpFAdd %228 %230 
                               f32_4 %232 = OpLoad %38 
                               f32_4 %233 = OpVectorShuffle %232 %231 4 1 2 5 
                                              OpStore %38 %233 
                 read_only Texture2D %234 = OpLoad %189 
                             sampler %235 = OpLoad %193 
          read_only Texture2DSampled %236 = OpSampledImage %234 %235 
                               f32_4 %237 = OpLoad %38 
                               f32_2 %238 = OpVectorShuffle %237 %237 0 3 
                               f32_4 %239 = OpImageSampleImplicitLod %236 %238 
                                 f32 %240 = OpCompositeExtract %239 0 
                                              OpStore %138 %240 
                                 f32 %241 = OpLoad %138 
                                 f32 %242 = OpLoad %138 
                                 f32 %243 = OpFMul %241 %242 
                                              OpStore %138 %243 
                                 f32 %244 = OpLoad %55 
                                 f32 %245 = OpLoad %138 
                                 f32 %246 = OpFMul %244 %245 
                        Private f32* %247 = OpAccessChain %9 %89 
                                 f32 %248 = OpLoad %247 
                                 f32 %249 = OpFAdd %246 %248 
                        Private f32* %250 = OpAccessChain %9 %89 
                                              OpStore %250 %249 
                        Private f32* %251 = OpAccessChain %159 %60 
                                 f32 %252 = OpLoad %251 
                                 f32 %253 = OpExtInst %1 8 %252 
                                              OpStore %55 %253 
                                 f32 %254 = OpLoad %55 
                                 f32 %255 = OpFNegate %254 
                        Private f32* %256 = OpAccessChain %159 %60 
                                 f32 %257 = OpLoad %256 
                                 f32 %258 = OpFAdd %255 %257 
                                              OpStore %55 %258 
                                 f32 %259 = OpLoad %55 
                                 f32 %261 = OpFAdd %259 %260 
                                              OpStore %55 %261 
                        Private f32* %262 = OpAccessChain %9 %89 
                                 f32 %263 = OpLoad %262 
                                 f32 %264 = OpLoad %55 
                                 f32 %265 = OpFMul %263 %264 
                        Private f32* %266 = OpAccessChain %9 %89 
                                              OpStore %266 %265 
                        Private f32* %267 = OpAccessChain %38 %60 
                                 f32 %268 = OpLoad %267 
                        Private f32* %269 = OpAccessChain %38 %28 
                                 f32 %270 = OpLoad %269 
                                 f32 %271 = OpFMul %268 %270 
                        Private f32* %272 = OpAccessChain %9 %60 
                                              OpStore %272 %271 
                               f32_4 %273 = OpLoad %38 
                               f32_2 %274 = OpVectorShuffle %273 %273 1 2 
                               f32_2 %275 = OpFNegate %274 
                               f32_2 %278 = OpFAdd %275 %277 
                               f32_4 %279 = OpLoad %38 
                               f32_4 %280 = OpVectorShuffle %279 %278 4 5 2 3 
                                              OpStore %38 %280 
                               f32_4 %281 = OpLoad %9 
                               f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                               f32_2 %286 = OpFMul %282 %285 
                               f32_4 %287 = OpLoad %9 
                               f32_4 %288 = OpVectorShuffle %287 %286 4 5 2 3 
                                              OpStore %9 %288 
                        Private f32* %289 = OpAccessChain %38 %89 
                                 f32 %290 = OpLoad %289 
                        Private f32* %291 = OpAccessChain %9 %60 
                                 f32 %292 = OpLoad %291 
                                 f32 %293 = OpFMul %290 %292 
                                              OpStore %55 %293 
                        Private f32* %294 = OpAccessChain %38 %60 
                                 f32 %295 = OpLoad %294 
                                 f32 %296 = OpLoad %55 
                                 f32 %297 = OpFMul %295 %296 
                                              OpStore %55 %297 
                                 f32 %298 = OpLoad %55 
                        Uniform f32* %300 = OpAccessChain %12 %299 
                                 f32 %301 = OpLoad %300 
                                 f32 %302 = OpFMul %298 %301 
                                 f32 %303 = OpFAdd %302 %216 
                                              OpStore %55 %303 
                                 f32 %304 = OpLoad %55 
                        Private f32* %305 = OpAccessChain %9 %89 
                                 f32 %306 = OpLoad %305 
                                 f32 %307 = OpFMul %304 %306 
                        Private f32* %308 = OpAccessChain %38 %89 
                                              OpStore %308 %307 
                        Uniform f32* %309 = OpAccessChain %12 %299 
                                 f32 %310 = OpLoad %309 
                                 f32 %311 = OpFMul %310 %20 
                                 f32 %313 = OpFAdd %311 %312 
                        Private f32* %314 = OpAccessChain %38 %60 
                                              OpStore %314 %313 
                               f32_4 %316 = OpLoad %38 
                               f32_3 %317 = OpVectorShuffle %316 %316 0 1 0 
                        Uniform f32* %318 = OpAccessChain %12 %299 
                                 f32 %319 = OpLoad %318 
                               f32_3 %320 = OpCompositeConstruct %319 %319 %319 
                               f32_3 %321 = OpFMul %317 %320 
                               f32_4 %322 = OpLoad %9 
                               f32_4 %323 = OpVectorShuffle %322 %321 4 5 2 6 
                                              OpStore %9 %323 
                        Private f32* %325 = OpAccessChain %38 %28 
                                              OpStore %325 %324 
                               f32_4 %326 = OpLoad %9 
                               f32_3 %327 = OpVectorShuffle %326 %326 0 1 3 
                               f32_4 %328 = OpLoad %38 
                               f32_3 %329 = OpVectorShuffle %328 %328 2 0 2 
                               f32_3 %330 = OpFMul %327 %329 
                               f32_4 %331 = OpLoad %9 
                               f32_4 %332 = OpVectorShuffle %331 %330 4 5 2 6 
                                              OpStore %9 %332 
                                 f32 %333 = OpLoad %26 
                               f32_3 %334 = OpCompositeConstruct %333 %333 %333 
                               f32_4 %335 = OpLoad %9 
                               f32_3 %336 = OpVectorShuffle %335 %335 0 1 3 
                               f32_3 %337 = OpFMul %334 %336 
                               f32_4 %338 = OpLoad %9 
                               f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                              OpStore %9 %339 
                        Uniform f32* %340 = OpAccessChain %12 %14 
                                 f32 %341 = OpLoad %340 
                                 f32 %343 = OpFMul %341 %342 
                                              OpStore %138 %343 
                                 f32 %344 = OpLoad %138 
                                 f32 %345 = OpExtInst %1 13 %344 
                                              OpStore %138 %345 
                                 f32 %346 = OpLoad %138 
                                 f32 %348 = OpFMul %346 %347 
                                 f32 %350 = OpFAdd %348 %349 
                                              OpStore %138 %350 
                                 f32 %353 = OpLoad %138 
                               f32_3 %354 = OpCompositeConstruct %353 %353 %353 
                               f32_4 %355 = OpLoad %9 
                               f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                               f32_3 %357 = OpFMul %354 %356 
                               f32_4 %358 = OpLoad %352 
                               f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
                                              OpStore %352 %359 
                         Output f32* %361 = OpAccessChain %352 %123 
                                              OpStore %361 %93 
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