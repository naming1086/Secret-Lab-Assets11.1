//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Glitch1" {
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
  GpuProgramID 62573
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
uniform 	float _Glitch;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
int u_xlati1;
vec3 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
int u_xlati5;
vec2 u_xlat8;
float u_xlat9;
void main()
{
    u_xlat0.xy = vec2(_TimeX) * vec2(4.0, 8.0);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(37.5, 0.125);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = u_xlat8.y * 16.0;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat0.x = u_xlat1.x * 0.0625 + u_xlat0.x;
    u_xlat4 = dot(u_xlat0.yy, vec2(12.9898005, 78.2330017));
    u_xlat4 = sin(u_xlat4);
    u_xlat4 = u_xlat4 * 43758.5469;
    u_xlat4 = fract(u_xlat4);
    u_xlatb4 = 0.99000001<u_xlat4;
    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat1.x = u_xlat0.x * _TimeX;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat0.x = u_xlat1.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 5.0 + u_xlat8.y;
    u_xlat1.xy = u_xlat0.xx * vec2(11.0, 7.0);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(0.0909090936, 0.142857149);
    u_xlat0.x = dot(u_xlat1.yy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = dot(u_xlat1.xx, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlati1 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati5 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
    u_xlat0.x = u_xlat0.x * 2.5;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlati1 = (-u_xlati1) + u_xlati5;
    u_xlat1.x = float(u_xlati1);
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat1.x = (-_Glitch) * u_xlat0.x + 0.5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * _Glitch;
    u_xlat0.x = _Glitch * u_xlat0.x + -0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9 = abs(u_xlat5) * 3.0;
    u_xlat2.xy = vec2(u_xlat5) * vec2(0.100000001, 0.125);
    u_xlat1.x = (-u_xlat9) * u_xlat1.x + 1.0;
    u_xlat2.z = 0.0;
    u_xlat3.xy = u_xlat8.xy + u_xlat2.xz;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat8.x = (-u_xlat3.y) + 1.0;
    u_xlat3.z = (u_xlatb4) ? u_xlat8.x : u_xlat3.y;
    u_xlat3 = texture(_MainTex, u_xlat3.xz);
    u_xlat4 = dot(u_xlat3.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat4 = dot(u_xlat3.xyz, vec3(0.61500001, -0.514989972, -0.10001));
    u_xlat1.y = u_xlat2.y * u_xlat0.x + u_xlat4;
    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat1.xy);
    u_xlat4 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    SV_Target0.w = u_xlat3.w;
    SV_Target0.y = u_xlat0.x + u_xlat4;
    SV_Target0.xz = u_xlat1.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat4);
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
; Bound: 403
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %33 %380 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpMemberDecorate %11 2 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 33 
                                              OpDecorate %328 DescriptorSet 328 
                                              OpDecorate %328 Binding 328 
                                              OpDecorate %332 DescriptorSet 332 
                                              OpDecorate %332 Binding 332 
                                              OpDecorate %380 Location 380 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypeStruct %6 %6 %10 
                                      %12 = OpTypePointer Uniform %11 
   Uniform struct {f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 0 
                                      %16 = OpTypePointer Uniform %6 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  f32 %21 = OpConstant 3.674022E-40 
                                f32_2 %22 = OpConstantComposite %20 %21 
                                  f32 %27 = OpConstant 3.674022E-40 
                                  f32 %28 = OpConstant 3.674022E-40 
                                f32_2 %29 = OpConstantComposite %27 %28 
                       Private f32_2* %31 = OpVariable Private 
                                      %32 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  i32 %35 = OpConstant 2 
                                      %36 = OpTypePointer Uniform %10 
                       Private f32_2* %45 = OpVariable Private 
                                      %46 = OpTypeInt 32 0 
                                  u32 %47 = OpConstant 1 
                                      %48 = OpTypePointer Private %6 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  u32 %53 = OpConstant 0 
                                  f32 %61 = OpConstant 3.674022E-40 
                         Private f32* %67 = OpVariable Private 
                                  f32 %70 = OpConstant 3.674022E-40 
                                  f32 %71 = OpConstant 3.674022E-40 
                                f32_2 %72 = OpConstantComposite %70 %71 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %81 = OpTypeBool 
                                      %82 = OpTypePointer Private %81 
                        Private bool* %83 = OpVariable Private 
                                  f32 %84 = OpConstant 3.674022E-40 
                                 f32 %125 = OpConstant 3.674022E-40 
                                 f32 %133 = OpConstant 3.674022E-40 
                                 f32 %134 = OpConstant 3.674022E-40 
                               f32_2 %135 = OpConstantComposite %133 %134 
                                 f32 %140 = OpConstant 3.674022E-40 
                                 f32 %141 = OpConstant 3.674022E-40 
                               f32_2 %142 = OpConstantComposite %140 %141 
                                 f32 %178 = OpConstant 3.674022E-40 
                                 f32 %190 = OpConstant 3.674022E-40 
                                 f32 %192 = OpConstant 3.674022E-40 
                                     %195 = OpTypePointer Private %14 
                        Private i32* %196 = OpVariable Private 
                                 f32 %197 = OpConstant 3.674022E-40 
                                 u32 %201 = OpConstant 4294967295 
                        Private i32* %204 = OpVariable Private 
                                 f32 %213 = OpConstant 3.674022E-40 
                                 f32 %218 = OpConstant 3.674022E-40 
                                 i32 %238 = OpConstant 1 
                                 f32 %249 = OpConstant 3.674022E-40 
                        Private f32* %252 = OpVariable Private 
                                 f32 %263 = OpConstant 3.674022E-40 
                        Private f32* %270 = OpVariable Private 
                                 f32 %273 = OpConstant 3.674022E-40 
                                     %275 = OpTypeVector %6 3 
                                     %276 = OpTypePointer Private %275 
                      Private f32_3* %277 = OpVariable Private 
                                 f32 %280 = OpConstant 3.674022E-40 
                               f32_2 %281 = OpConstantComposite %280 %28 
                                 u32 %292 = OpConstant 2 
                                     %294 = OpTypePointer Private %10 
                      Private f32_4* %295 = OpVariable Private 
                                     %315 = OpTypePointer Function %6 
                                     %326 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %327 = OpTypePointer UniformConstant %326 
UniformConstant read_only Texture2D* %328 = OpVariable UniformConstant 
                                     %330 = OpTypeSampler 
                                     %331 = OpTypePointer UniformConstant %330 
            UniformConstant sampler* %332 = OpVariable UniformConstant 
                                     %334 = OpTypeSampledImage %326 
                                 f32 %341 = OpConstant 3.674022E-40 
                                 f32 %342 = OpConstant 3.674022E-40 
                                 f32 %343 = OpConstant 3.674022E-40 
                               f32_3 %344 = OpConstantComposite %341 %342 %343 
                                 f32 %353 = OpConstant 3.674022E-40 
                                 f32 %354 = OpConstant 3.674022E-40 
                                 f32 %355 = OpConstant 3.674022E-40 
                               f32_3 %356 = OpConstantComposite %353 %354 %355 
                                 f32 %366 = OpConstant 3.674022E-40 
                                 f32 %367 = OpConstant 3.674022E-40 
                               f32_2 %368 = OpConstantComposite %366 %367 
                                 f32 %374 = OpConstant 3.674022E-40 
                                 f32 %375 = OpConstant 3.674022E-40 
                                 f32 %376 = OpConstant 3.674022E-40 
                               f32_3 %377 = OpConstantComposite %374 %375 %376 
                                     %379 = OpTypePointer Output %10 
                       Output f32_4* %380 = OpVariable Output 
                                 u32 %381 = OpConstant 3 
                                     %384 = OpTypePointer Output %6 
                                 f32 %393 = OpConstant 3.674022E-40 
                                 f32 %394 = OpConstant 3.674022E-40 
                               f32_2 %395 = OpConstantComposite %393 %394 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %316 = OpVariable Function 
                         Uniform f32* %17 = OpAccessChain %13 %15 
                                  f32 %18 = OpLoad %17 
                                f32_2 %19 = OpCompositeConstruct %18 %18 
                                f32_2 %23 = OpFMul %19 %22 
                                              OpStore %9 %23 
                                f32_2 %24 = OpLoad %9 
                                f32_2 %25 = OpExtInst %1 8 %24 
                                              OpStore %9 %25 
                                f32_2 %26 = OpLoad %9 
                                f32_2 %30 = OpFMul %26 %29 
                                              OpStore %9 %30 
                                f32_2 %34 = OpLoad vs_TEXCOORD0 
                       Uniform f32_4* %37 = OpAccessChain %13 %35 
                                f32_4 %38 = OpLoad %37 
                                f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                f32_2 %40 = OpFMul %34 %39 
                       Uniform f32_4* %41 = OpAccessChain %13 %35 
                                f32_4 %42 = OpLoad %41 
                                f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                f32_2 %44 = OpFAdd %40 %43 
                                              OpStore %31 %44 
                         Private f32* %49 = OpAccessChain %31 %47 
                                  f32 %50 = OpLoad %49 
                                  f32 %52 = OpFMul %50 %51 
                         Private f32* %54 = OpAccessChain %45 %53 
                                              OpStore %54 %52 
                         Private f32* %55 = OpAccessChain %45 %53 
                                  f32 %56 = OpLoad %55 
                                  f32 %57 = OpExtInst %1 8 %56 
                         Private f32* %58 = OpAccessChain %45 %53 
                                              OpStore %58 %57 
                         Private f32* %59 = OpAccessChain %45 %53 
                                  f32 %60 = OpLoad %59 
                                  f32 %62 = OpFMul %60 %61 
                         Private f32* %63 = OpAccessChain %9 %53 
                                  f32 %64 = OpLoad %63 
                                  f32 %65 = OpFAdd %62 %64 
                         Private f32* %66 = OpAccessChain %9 %53 
                                              OpStore %66 %65 
                                f32_2 %68 = OpLoad %9 
                                f32_2 %69 = OpVectorShuffle %68 %68 1 1 
                                  f32 %73 = OpDot %69 %72 
                                              OpStore %67 %73 
                                  f32 %74 = OpLoad %67 
                                  f32 %75 = OpExtInst %1 13 %74 
                                              OpStore %67 %75 
                                  f32 %76 = OpLoad %67 
                                  f32 %78 = OpFMul %76 %77 
                                              OpStore %67 %78 
                                  f32 %79 = OpLoad %67 
                                  f32 %80 = OpExtInst %1 10 %79 
                                              OpStore %67 %80 
                                  f32 %85 = OpLoad %67 
                                 bool %86 = OpFOrdLessThan %84 %85 
                                              OpStore %83 %86 
                                f32_2 %87 = OpLoad %9 
                                f32_2 %88 = OpVectorShuffle %87 %87 0 0 
                                  f32 %89 = OpDot %88 %72 
                         Private f32* %90 = OpAccessChain %9 %53 
                                              OpStore %90 %89 
                         Private f32* %91 = OpAccessChain %9 %53 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpExtInst %1 13 %92 
                         Private f32* %94 = OpAccessChain %9 %53 
                                              OpStore %94 %93 
                         Private f32* %95 = OpAccessChain %9 %53 
                                  f32 %96 = OpLoad %95 
                                  f32 %97 = OpFMul %96 %77 
                         Private f32* %98 = OpAccessChain %9 %53 
                                              OpStore %98 %97 
                         Private f32* %99 = OpAccessChain %9 %53 
                                 f32 %100 = OpLoad %99 
                                 f32 %101 = OpExtInst %1 10 %100 
                        Private f32* %102 = OpAccessChain %9 %53 
                                              OpStore %102 %101 
                        Private f32* %103 = OpAccessChain %9 %53 
                                 f32 %104 = OpLoad %103 
                                 f32 %105 = OpFMul %104 %51 
                        Private f32* %106 = OpAccessChain %9 %53 
                                              OpStore %106 %105 
                        Private f32* %107 = OpAccessChain %9 %53 
                                 f32 %108 = OpLoad %107 
                        Uniform f32* %109 = OpAccessChain %13 %15 
                                 f32 %110 = OpLoad %109 
                                 f32 %111 = OpFMul %108 %110 
                        Private f32* %112 = OpAccessChain %45 %53 
                                              OpStore %112 %111 
                        Private f32* %113 = OpAccessChain %45 %53 
                                 f32 %114 = OpLoad %113 
                                 f32 %115 = OpExtInst %1 8 %114 
                        Private f32* %116 = OpAccessChain %45 %53 
                                              OpStore %116 %115 
                        Private f32* %117 = OpAccessChain %45 %53 
                                 f32 %118 = OpLoad %117 
                        Private f32* %119 = OpAccessChain %9 %53 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFDiv %118 %120 
                        Private f32* %122 = OpAccessChain %9 %53 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %9 %53 
                                 f32 %124 = OpLoad %123 
                                 f32 %126 = OpFMul %124 %125 
                        Private f32* %127 = OpAccessChain %31 %47 
                                 f32 %128 = OpLoad %127 
                                 f32 %129 = OpFAdd %126 %128 
                        Private f32* %130 = OpAccessChain %9 %53 
                                              OpStore %130 %129 
                               f32_2 %131 = OpLoad %9 
                               f32_2 %132 = OpVectorShuffle %131 %131 0 0 
                               f32_2 %136 = OpFMul %132 %135 
                                              OpStore %45 %136 
                               f32_2 %137 = OpLoad %45 
                               f32_2 %138 = OpExtInst %1 8 %137 
                                              OpStore %45 %138 
                               f32_2 %139 = OpLoad %45 
                               f32_2 %143 = OpFMul %139 %142 
                                              OpStore %45 %143 
                               f32_2 %144 = OpLoad %45 
                               f32_2 %145 = OpVectorShuffle %144 %144 1 1 
                                 f32 %146 = OpDot %145 %72 
                        Private f32* %147 = OpAccessChain %9 %53 
                                              OpStore %147 %146 
                               f32_2 %148 = OpLoad %45 
                               f32_2 %149 = OpVectorShuffle %148 %148 0 0 
                                 f32 %150 = OpDot %149 %72 
                        Private f32* %151 = OpAccessChain %45 %53 
                                              OpStore %151 %150 
                        Private f32* %152 = OpAccessChain %45 %53 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpExtInst %1 13 %153 
                        Private f32* %155 = OpAccessChain %45 %53 
                                              OpStore %155 %154 
                        Private f32* %156 = OpAccessChain %45 %53 
                                 f32 %157 = OpLoad %156 
                                 f32 %158 = OpFMul %157 %77 
                        Private f32* %159 = OpAccessChain %45 %53 
                                              OpStore %159 %158 
                        Private f32* %160 = OpAccessChain %45 %53 
                                 f32 %161 = OpLoad %160 
                                 f32 %162 = OpExtInst %1 10 %161 
                        Private f32* %163 = OpAccessChain %45 %53 
                                              OpStore %163 %162 
                        Private f32* %164 = OpAccessChain %9 %53 
                                 f32 %165 = OpLoad %164 
                                 f32 %166 = OpExtInst %1 13 %165 
                        Private f32* %167 = OpAccessChain %9 %53 
                                              OpStore %167 %166 
                        Private f32* %168 = OpAccessChain %9 %53 
                                 f32 %169 = OpLoad %168 
                                 f32 %170 = OpFMul %169 %77 
                        Private f32* %171 = OpAccessChain %9 %53 
                                              OpStore %171 %170 
                        Private f32* %172 = OpAccessChain %9 %53 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpExtInst %1 10 %173 
                        Private f32* %175 = OpAccessChain %9 %53 
                                              OpStore %175 %174 
                        Private f32* %176 = OpAccessChain %9 %53 
                                 f32 %177 = OpLoad %176 
                                 f32 %179 = OpFMul %177 %178 
                        Private f32* %180 = OpAccessChain %9 %53 
                                              OpStore %180 %179 
                        Private f32* %181 = OpAccessChain %45 %53 
                                 f32 %182 = OpLoad %181 
                                 f32 %183 = OpFMul %182 %178 
                        Private f32* %184 = OpAccessChain %9 %53 
                                 f32 %185 = OpLoad %184 
                                 f32 %186 = OpFAdd %183 %185 
                        Private f32* %187 = OpAccessChain %9 %53 
                                              OpStore %187 %186 
                        Private f32* %188 = OpAccessChain %9 %53 
                                 f32 %189 = OpLoad %188 
                                 f32 %191 = OpFMul %189 %190 
                                 f32 %193 = OpFAdd %191 %192 
                        Private f32* %194 = OpAccessChain %9 %53 
                                              OpStore %194 %193 
                        Private f32* %198 = OpAccessChain %9 %53 
                                 f32 %199 = OpLoad %198 
                                bool %200 = OpFOrdLessThan %197 %199 
                                 u32 %202 = OpSelect %200 %201 %53 
                                 i32 %203 = OpBitcast %202 
                                              OpStore %196 %203 
                        Private f32* %205 = OpAccessChain %9 %53 
                                 f32 %206 = OpLoad %205 
                                bool %207 = OpFOrdLessThan %206 %197 
                                 u32 %208 = OpSelect %207 %201 %53 
                                 i32 %209 = OpBitcast %208 
                                              OpStore %204 %209 
                        Private f32* %210 = OpAccessChain %9 %53 
                                 f32 %211 = OpLoad %210 
                                 f32 %212 = OpExtInst %1 4 %211 
                                 f32 %214 = OpFAdd %212 %213 
                        Private f32* %215 = OpAccessChain %9 %53 
                                              OpStore %215 %214 
                        Private f32* %216 = OpAccessChain %9 %53 
                                 f32 %217 = OpLoad %216 
                                 f32 %219 = OpFMul %217 %218 
                        Private f32* %220 = OpAccessChain %9 %53 
                                              OpStore %220 %219 
                        Private f32* %221 = OpAccessChain %9 %53 
                                 f32 %222 = OpLoad %221 
                                 f32 %223 = OpExtInst %1 40 %222 %197 
                        Private f32* %224 = OpAccessChain %9 %53 
                                              OpStore %224 %223 
                                 i32 %225 = OpLoad %196 
                                 i32 %226 = OpSNegate %225 
                                 i32 %227 = OpLoad %204 
                                 i32 %228 = OpIAdd %226 %227 
                                              OpStore %196 %228 
                                 i32 %229 = OpLoad %196 
                                 f32 %230 = OpConvertSToF %229 
                        Private f32* %231 = OpAccessChain %45 %53 
                                              OpStore %231 %230 
                        Private f32* %232 = OpAccessChain %9 %53 
                                 f32 %233 = OpLoad %232 
                        Private f32* %234 = OpAccessChain %45 %53 
                                 f32 %235 = OpLoad %234 
                                 f32 %236 = OpFMul %233 %235 
                        Private f32* %237 = OpAccessChain %9 %53 
                                              OpStore %237 %236 
                        Uniform f32* %239 = OpAccessChain %13 %238 
                                 f32 %240 = OpLoad %239 
                                 f32 %241 = OpFNegate %240 
                        Private f32* %242 = OpAccessChain %9 %53 
                                 f32 %243 = OpLoad %242 
                                 f32 %244 = OpFMul %241 %243 
                                 f32 %245 = OpFAdd %244 %178 
                        Private f32* %246 = OpAccessChain %45 %53 
                                              OpStore %246 %245 
                        Private f32* %247 = OpAccessChain %45 %53 
                                 f32 %248 = OpLoad %247 
                                 f32 %250 = OpExtInst %1 43 %248 %197 %249 
                        Private f32* %251 = OpAccessChain %45 %53 
                                              OpStore %251 %250 
                        Private f32* %253 = OpAccessChain %9 %53 
                                 f32 %254 = OpLoad %253 
                        Uniform f32* %255 = OpAccessChain %13 %238 
                                 f32 %256 = OpLoad %255 
                                 f32 %257 = OpFMul %254 %256 
                                              OpStore %252 %257 
                        Uniform f32* %258 = OpAccessChain %13 %238 
                                 f32 %259 = OpLoad %258 
                        Private f32* %260 = OpAccessChain %9 %53 
                                 f32 %261 = OpLoad %260 
                                 f32 %262 = OpFMul %259 %261 
                                 f32 %264 = OpFAdd %262 %263 
                        Private f32* %265 = OpAccessChain %9 %53 
                                              OpStore %265 %264 
                        Private f32* %266 = OpAccessChain %9 %53 
                                 f32 %267 = OpLoad %266 
                                 f32 %268 = OpExtInst %1 43 %267 %197 %249 
                        Private f32* %269 = OpAccessChain %9 %53 
                                              OpStore %269 %268 
                                 f32 %271 = OpLoad %252 
                                 f32 %272 = OpExtInst %1 4 %271 
                                 f32 %274 = OpFMul %272 %273 
                                              OpStore %270 %274 
                                 f32 %278 = OpLoad %252 
                               f32_2 %279 = OpCompositeConstruct %278 %278 
                               f32_2 %282 = OpFMul %279 %281 
                               f32_3 %283 = OpLoad %277 
                               f32_3 %284 = OpVectorShuffle %283 %282 3 4 2 
                                              OpStore %277 %284 
                                 f32 %285 = OpLoad %270 
                                 f32 %286 = OpFNegate %285 
                        Private f32* %287 = OpAccessChain %45 %53 
                                 f32 %288 = OpLoad %287 
                                 f32 %289 = OpFMul %286 %288 
                                 f32 %290 = OpFAdd %289 %249 
                        Private f32* %291 = OpAccessChain %45 %53 
                                              OpStore %291 %290 
                        Private f32* %293 = OpAccessChain %277 %292 
                                              OpStore %293 %197 
                               f32_2 %296 = OpLoad %31 
                               f32_3 %297 = OpLoad %277 
                               f32_2 %298 = OpVectorShuffle %297 %297 0 2 
                               f32_2 %299 = OpFAdd %296 %298 
                               f32_4 %300 = OpLoad %295 
                               f32_4 %301 = OpVectorShuffle %300 %299 4 5 2 3 
                                              OpStore %295 %301 
                               f32_4 %302 = OpLoad %295 
                               f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                               f32_2 %304 = OpCompositeConstruct %197 %197 
                               f32_2 %305 = OpCompositeConstruct %249 %249 
                               f32_2 %306 = OpExtInst %1 43 %303 %304 %305 
                               f32_4 %307 = OpLoad %295 
                               f32_4 %308 = OpVectorShuffle %307 %306 4 5 2 3 
                                              OpStore %295 %308 
                        Private f32* %309 = OpAccessChain %295 %47 
                                 f32 %310 = OpLoad %309 
                                 f32 %311 = OpFNegate %310 
                                 f32 %312 = OpFAdd %311 %249 
                        Private f32* %313 = OpAccessChain %31 %53 
                                              OpStore %313 %312 
                                bool %314 = OpLoad %83 
                                              OpSelectionMerge %318 None 
                                              OpBranchConditional %314 %317 %321 
                                     %317 = OpLabel 
                        Private f32* %319 = OpAccessChain %31 %53 
                                 f32 %320 = OpLoad %319 
                                              OpStore %316 %320 
                                              OpBranch %318 
                                     %321 = OpLabel 
                        Private f32* %322 = OpAccessChain %295 %47 
                                 f32 %323 = OpLoad %322 
                                              OpStore %316 %323 
                                              OpBranch %318 
                                     %318 = OpLabel 
                                 f32 %324 = OpLoad %316 
                        Private f32* %325 = OpAccessChain %295 %292 
                                              OpStore %325 %324 
                 read_only Texture2D %329 = OpLoad %328 
                             sampler %333 = OpLoad %332 
          read_only Texture2DSampled %335 = OpSampledImage %329 %333 
                               f32_4 %336 = OpLoad %295 
                               f32_2 %337 = OpVectorShuffle %336 %336 0 2 
                               f32_4 %338 = OpImageSampleImplicitLod %335 %337 
                                              OpStore %295 %338 
                               f32_4 %339 = OpLoad %295 
                               f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
                                 f32 %345 = OpDot %340 %344 
                                              OpStore %67 %345 
                                 f32 %346 = OpLoad %67 
                        Private f32* %347 = OpAccessChain %45 %53 
                                 f32 %348 = OpLoad %347 
                                 f32 %349 = OpFDiv %346 %348 
                        Private f32* %350 = OpAccessChain %45 %53 
                                              OpStore %350 %349 
                               f32_4 %351 = OpLoad %295 
                               f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                 f32 %357 = OpDot %352 %356 
                                              OpStore %67 %357 
                        Private f32* %358 = OpAccessChain %277 %47 
                                 f32 %359 = OpLoad %358 
                        Private f32* %360 = OpAccessChain %9 %53 
                                 f32 %361 = OpLoad %360 
                                 f32 %362 = OpFMul %359 %361 
                                 f32 %363 = OpLoad %67 
                                 f32 %364 = OpFAdd %362 %363 
                        Private f32* %365 = OpAccessChain %45 %47 
                                              OpStore %365 %364 
                               f32_2 %369 = OpLoad %45 
                                 f32 %370 = OpDot %368 %369 
                        Private f32* %371 = OpAccessChain %9 %53 
                                              OpStore %371 %370 
                               f32_4 %372 = OpLoad %295 
                               f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                 f32 %378 = OpDot %373 %377 
                                              OpStore %67 %378 
                        Private f32* %382 = OpAccessChain %295 %381 
                                 f32 %383 = OpLoad %382 
                         Output f32* %385 = OpAccessChain %380 %381 
                                              OpStore %385 %383 
                        Private f32* %386 = OpAccessChain %9 %53 
                                 f32 %387 = OpLoad %386 
                                 f32 %388 = OpLoad %67 
                                 f32 %389 = OpFAdd %387 %388 
                         Output f32* %390 = OpAccessChain %380 %47 
                                              OpStore %390 %389 
                               f32_2 %391 = OpLoad %45 
                               f32_2 %392 = OpVectorShuffle %391 %391 1 0 
                               f32_2 %396 = OpFMul %392 %395 
                                 f32 %397 = OpLoad %67 
                               f32_2 %398 = OpCompositeConstruct %397 %397 
                               f32_2 %399 = OpFAdd %396 %398 
                               f32_4 %400 = OpLoad %380 
                               f32_4 %401 = OpVectorShuffle %400 %399 4 1 5 3 
                                              OpStore %380 %401 
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