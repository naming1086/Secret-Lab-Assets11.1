//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Atmosphere_Rain_Pro" {
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
  GpuProgramID 52215
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
uniform 	float _Value8;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D Texture2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat7;
float u_xlat9;
vec2 u_xlat12;
float u_xlat13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy * vec2(vec2(_Value5, _Value5));
    u_xlat12.x = _Value3 * u_xlat12.y + u_xlat12.x;
    u_xlat1.x = u_xlat12.x * 3.0 + 0.100000001;
    u_xlat2.x = u_xlat1.x * 0.649999976 + 0.100000001;
    u_xlat12.x = _TimeX * _Value4;
    u_xlat3 = u_xlat12.xxxx * vec4(0.800000012, 0.00999999978, 1.20000005, 0.200000003);
    u_xlat1.y = u_xlat12.y * 3.0 + u_xlat3.x;
    u_xlat2.y = u_xlat1.y * 0.649999976 + u_xlat12.x;
    u_xlat1 = texture(Texture2, u_xlat1.xy);
    u_xlat4 = texture(Texture2, u_xlat2.xy);
    u_xlat5.x = u_xlat2.x * 0.649999976 + 0.100000001;
    u_xlat5.y = u_xlat2.y * 0.649999976 + u_xlat3.z;
    u_xlat18 = _Value2 * 0.25;
    u_xlat7.x = u_xlat18 * u_xlat4.x;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat1.x = u_xlat18 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.300000012 + u_xlat7.x;
    u_xlat2 = texture(Texture2, u_xlat5.xy);
    u_xlat4.x = u_xlat5.x * 0.5 + 0.100000001;
    u_xlat4.y = u_xlat5.y * 0.5 + u_xlat3.z;
    u_xlat7.x = u_xlat18 * u_xlat2.x;
    u_xlat1.x = u_xlat7.x * 0.699999988 + u_xlat1.x;
    u_xlat2 = texture(Texture2, u_xlat4.xy);
    u_xlat5.x = u_xlat4.x * 0.400000006 + 0.100000001;
    u_xlat5.y = u_xlat4.y * 0.400000006 + u_xlat3.z;
    u_xlat4 = texture(Texture2, u_xlat5.xy);
    u_xlat7.x = u_xlat18 * u_xlat4.x;
    u_xlat13 = u_xlat18 * u_xlat2.x;
    u_xlat1.x = u_xlat13 * 0.899999976 + u_xlat1.x;
    u_xlat1.x = u_xlat7.x * 0.899999976 + u_xlat1.x;
    u_xlat7.xy = u_xlat1.xx * vec2(vec2(_Value6, _Value6)) + u_xlat0.xy;
    u_xlat2 = texture(_MainTex, u_xlat7.xy);
    u_xlat1 = u_xlat1.xxxx + u_xlat2;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = u_xlat1 + (-u_xlat2);
    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat1 + u_xlat2;
    u_xlat3.x = u_xlat0.x * 0.00100000005 + u_xlat3.w;
    u_xlat3 = texture(Texture2, u_xlat3.xy);
    u_xlat18 = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(vec2(u_xlat18), vec2(vec2(_Value7, _Value7)));
    u_xlat1 = vec4(u_xlat18) + u_xlat1;
    u_xlat18 = u_xlat12.x * _Value3;
    u_xlat3.x = u_xlat12.x * 32.0;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat9 = u_xlat3.x * 0.0625;
    u_xlat3.x = u_xlat3.x * 0.055555556 + u_xlat0.y;
    u_xlat4.y = u_xlat12.x * 0.150000006 + u_xlat3.x;
    u_xlat12.x = u_xlat0.x * 2.0 + u_xlat9;
    u_xlat4.x = (-u_xlat18) * 0.550000012 + u_xlat12.x;
    u_xlat3 = texture(Texture2, u_xlat4.xy);
    u_xlat12.xy = u_xlat0.xy * _ScreenResolution.xy + vec2(-3.0, 3.0);
    u_xlat4 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(3.0, 3.0, 3.0, -3.0);
    u_xlat4 = u_xlat4 / _ScreenResolution.xyxy;
    u_xlat0.xy = u_xlat12.xy / _ScreenResolution.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat4 = (-u_xlat4) + u_xlat5;
    u_xlat0 = (-u_xlat0) + u_xlat5;
    u_xlat0 = abs(u_xlat0) + abs(u_xlat4);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0.x = dot(u_xlat0, u_xlat0);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat3.z * u_xlat0.x;
    u_xlat0 = vec4(_Value8) * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    SV_Target0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat2;
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
; Bound: 534
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %27 %514 
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
                                                      OpMemberDecorate %12 10 Offset 12 
                                                      OpMemberDecorate %12 11 Offset 12 
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 27 
                                                      OpDecorate %137 DescriptorSet 137 
                                                      OpDecorate %137 Binding 137 
                                                      OpDecorate %141 DescriptorSet 141 
                                                      OpDecorate %141 Binding 141 
                                                      OpDecorate %285 DescriptorSet 285 
                                                      OpDecorate %285 Binding 285 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate %514 Location 514 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                              %10 = OpTypeVector %9 4 
                                              %11 = OpTypeVector %9 2 
                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %9 %9 %9 %9 %10 %11 %10 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 10 
                                              %17 = OpTypeInt 32 0 
                                          u32 %18 = OpConstant 1 
                                              %19 = OpTypePointer Uniform %9 
                                          f32 %22 = OpConstant 3.674022E-40 
                                              %24 = OpTypePointer Private %10 
                               Private f32_4* %25 = OpVariable Private 
                                              %26 = OpTypePointer Input %11 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %29 = OpConstant 11 
                                              %30 = OpTypePointer Uniform %10 
                                              %41 = OpTypePointer Private %11 
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
                               Private f32_4* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.674022E-40 
                                         i32 %104 = OpConstant 0 
                                         i32 %107 = OpConstant 4 
                              Private f32_4* %112 = OpVariable Private 
                                         f32 %115 = OpConstant 3.674022E-40 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         f32 %117 = OpConstant 3.674022E-40 
                                         f32 %118 = OpConstant 3.674022E-40 
                                       f32_4 %119 = OpConstantComposite %115 %116 %117 %118 
                                             %135 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                             %136 = OpTypePointer UniformConstant %135 
        UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                             %139 = OpTypeSampler 
                                             %140 = OpTypePointer UniformConstant %139 
                    UniformConstant sampler* %141 = OpVariable UniformConstant 
                                             %143 = OpTypeSampledImage %135 
                                Private f32* %170 = OpVariable Private 
                                         i32 %171 = OpConstant 2 
                                         f32 %174 = OpConstant 3.674022E-40 
                                Private f32* %180 = OpVariable Private 
                                         f32 %183 = OpConstant 3.674022E-40 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %215 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                Private f32* %241 = OpVariable Private 
                                         f32 %256 = OpConstant 3.674022E-40 
                                         i32 %270 = OpConstant 6 
        UniformConstant read_only Texture2D* %285 = OpVariable UniformConstant 
                    UniformConstant sampler* %287 = OpVariable UniformConstant 
                                         i32 %307 = OpConstant 1 
                                         f32 %328 = OpConstant 3.674022E-40 
                                         u32 %330 = OpConstant 3 
                                         i32 %350 = OpConstant 7 
                                         f32 %367 = OpConstant 3.674022E-40 
                                         f32 %376 = OpConstant 3.674022E-40 
                                         f32 %380 = OpConstant 3.674022E-40 
                                         f32 %388 = OpConstant 3.674022E-40 
                                         f32 %402 = OpConstant 3.674022E-40 
                                         f32 %410 = OpConstant 3.674022E-40 
                                         i32 %426 = OpConstant 9 
                                         f32 %431 = OpConstant 3.674022E-40 
                                       f32_2 %432 = OpConstantComposite %431 %92 
                                       f32_4 %440 = OpConstantComposite %92 %92 %92 %431 
                              Private f32_4* %457 = OpVariable Private 
                                       f32_4 %484 = OpConstantComposite %183 %183 %183 %183 
                                         i32 %500 = OpConstant 8 
                                             %513 = OpTypePointer Output %10 
                               Output f32_4* %514 = OpVariable Output 
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
                                       f32_4 %113 = OpLoad %64 
                                       f32_4 %114 = OpVectorShuffle %113 %113 0 0 0 0 
                                       f32_4 %120 = OpFMul %114 %119 
                                                      OpStore %112 %120 
                                Private f32* %121 = OpAccessChain %64 %18 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFMul %122 %92 
                                Private f32* %124 = OpAccessChain %112 %49 
                                         f32 %125 = OpLoad %124 
                                         f32 %126 = OpFAdd %123 %125 
                                Private f32* %127 = OpAccessChain %89 %18 
                                                      OpStore %127 %126 
                                Private f32* %128 = OpAccessChain %89 %18 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %129 %100 
                                Private f32* %131 = OpAccessChain %64 %49 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFAdd %130 %132 
                                Private f32* %134 = OpAccessChain %97 %18 
                                                      OpStore %134 %133 
                         read_only Texture2D %138 = OpLoad %137 
                                     sampler %142 = OpLoad %141 
                  read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                                       f32_4 %145 = OpLoad %89 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                         f32 %148 = OpCompositeExtract %147 0 
                                Private f32* %149 = OpAccessChain %42 %49 
                                                      OpStore %149 %148 
                         read_only Texture2D %150 = OpLoad %137 
                                     sampler %151 = OpLoad %141 
                  read_only Texture2DSampled %152 = OpSampledImage %150 %151 
                                       f32_4 %153 = OpLoad %97 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_4 %155 = OpImageSampleImplicitLod %152 %154 
                                         f32 %156 = OpCompositeExtract %155 0 
                                Private f32* %157 = OpAccessChain %42 %18 
                                                      OpStore %157 %156 
                                Private f32* %158 = OpAccessChain %97 %49 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFMul %159 %100 
                                         f32 %161 = OpFAdd %160 %94 
                                Private f32* %162 = OpAccessChain %89 %49 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %97 %18 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %164 %100 
                                Private f32* %166 = OpAccessChain %112 %62 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %165 %167 
                                Private f32* %169 = OpAccessChain %89 %18 
                                                      OpStore %169 %168 
                                Uniform f32* %172 = OpAccessChain %14 %171 
                                         f32 %173 = OpLoad %172 
                                         f32 %175 = OpFMul %173 %174 
                                                      OpStore %170 %175 
                                         f32 %176 = OpLoad %170 
                                       f32_2 %177 = OpCompositeConstruct %176 %176 
                                       f32_2 %178 = OpLoad %42 
                                       f32_2 %179 = OpFMul %177 %178 
                                                      OpStore %42 %179 
                                Private f32* %181 = OpAccessChain %42 %18 
                                         f32 %182 = OpLoad %181 
                                         f32 %184 = OpFMul %182 %183 
                                                      OpStore %180 %184 
                                Private f32* %185 = OpAccessChain %42 %49 
                                         f32 %186 = OpLoad %185 
                                         f32 %188 = OpFMul %186 %187 
                                         f32 %189 = OpLoad %180 
                                         f32 %190 = OpFAdd %188 %189 
                                Private f32* %191 = OpAccessChain %42 %49 
                                                      OpStore %191 %190 
                         read_only Texture2D %192 = OpLoad %137 
                                     sampler %193 = OpLoad %141 
                  read_only Texture2DSampled %194 = OpSampledImage %192 %193 
                                       f32_4 %195 = OpLoad %89 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_4 %197 = OpImageSampleImplicitLod %194 %196 
                                         f32 %198 = OpCompositeExtract %197 0 
                                                      OpStore %180 %198 
                                Private f32* %199 = OpAccessChain %89 %49 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %200 %183 
                                         f32 %202 = OpFAdd %201 %94 
                                Private f32* %203 = OpAccessChain %97 %49 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %89 %18 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %205 %183 
                                Private f32* %207 = OpAccessChain %112 %62 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFAdd %206 %208 
                                Private f32* %210 = OpAccessChain %97 %18 
                                                      OpStore %210 %209 
                                         f32 %211 = OpLoad %170 
                                         f32 %212 = OpLoad %180 
                                         f32 %213 = OpFMul %211 %212 
                                                      OpStore %180 %213 
                                         f32 %214 = OpLoad %180 
                                         f32 %216 = OpFMul %214 %215 
                                Private f32* %217 = OpAccessChain %42 %49 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFAdd %216 %218 
                                Private f32* %220 = OpAccessChain %42 %49 
                                                      OpStore %220 %219 
                         read_only Texture2D %221 = OpLoad %137 
                                     sampler %222 = OpLoad %141 
                  read_only Texture2DSampled %223 = OpSampledImage %221 %222 
                                       f32_4 %224 = OpLoad %97 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                         f32 %227 = OpCompositeExtract %226 0 
                                                      OpStore %180 %227 
                                Private f32* %228 = OpAccessChain %97 %49 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFMul %229 %230 
                                         f32 %232 = OpFAdd %231 %94 
                                Private f32* %233 = OpAccessChain %89 %49 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %97 %18 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %235 %230 
                                Private f32* %237 = OpAccessChain %112 %62 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %89 %18 
                                                      OpStore %240 %239 
                         read_only Texture2D %242 = OpLoad %137 
                                     sampler %243 = OpLoad %141 
                  read_only Texture2DSampled %244 = OpSampledImage %242 %243 
                                       f32_4 %245 = OpLoad %89 
                                       f32_2 %246 = OpVectorShuffle %245 %245 0 1 
                                       f32_4 %247 = OpImageSampleImplicitLod %244 %246 
                                         f32 %248 = OpCompositeExtract %247 0 
                                                      OpStore %241 %248 
                                         f32 %249 = OpLoad %170 
                                         f32 %250 = OpLoad %241 
                                         f32 %251 = OpFMul %249 %250 
                                                      OpStore %241 %251 
                                         f32 %252 = OpLoad %170 
                                         f32 %253 = OpLoad %180 
                                         f32 %254 = OpFMul %252 %253 
                                                      OpStore %180 %254 
                                         f32 %255 = OpLoad %180 
                                         f32 %257 = OpFMul %255 %256 
                                Private f32* %258 = OpAccessChain %42 %49 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFAdd %257 %259 
                                Private f32* %261 = OpAccessChain %42 %49 
                                                      OpStore %261 %260 
                                         f32 %262 = OpLoad %241 
                                         f32 %263 = OpFMul %262 %256 
                                Private f32* %264 = OpAccessChain %42 %49 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFAdd %263 %265 
                                Private f32* %267 = OpAccessChain %42 %49 
                                                      OpStore %267 %266 
                                       f32_2 %268 = OpLoad %42 
                                       f32_2 %269 = OpVectorShuffle %268 %268 0 0 
                                Uniform f32* %271 = OpAccessChain %14 %270 
                                         f32 %272 = OpLoad %271 
                                Uniform f32* %273 = OpAccessChain %14 %270 
                                         f32 %274 = OpLoad %273 
                                       f32_2 %275 = OpCompositeConstruct %272 %274 
                                         f32 %276 = OpCompositeExtract %275 0 
                                         f32 %277 = OpCompositeExtract %275 1 
                                       f32_2 %278 = OpCompositeConstruct %276 %277 
                                       f32_2 %279 = OpFMul %269 %278 
                                       f32_4 %280 = OpLoad %25 
                                       f32_2 %281 = OpVectorShuffle %280 %280 0 1 
                                       f32_2 %282 = OpFAdd %279 %281 
                                       f32_4 %283 = OpLoad %89 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 2 3 
                                                      OpStore %89 %284 
                         read_only Texture2D %286 = OpLoad %285 
                                     sampler %288 = OpLoad %287 
                  read_only Texture2DSampled %289 = OpSampledImage %286 %288 
                                       f32_4 %290 = OpLoad %89 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 1 
                                       f32_4 %292 = OpImageSampleImplicitLod %289 %291 
                                                      OpStore %89 %292 
                                       f32_2 %293 = OpLoad %42 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
                                       f32_4 %295 = OpLoad %89 
                                       f32_4 %296 = OpFAdd %294 %295 
                                                      OpStore %89 %296 
                         read_only Texture2D %297 = OpLoad %285 
                                     sampler %298 = OpLoad %287 
                  read_only Texture2DSampled %299 = OpSampledImage %297 %298 
                                       f32_4 %300 = OpLoad %25 
                                       f32_2 %301 = OpVectorShuffle %300 %300 0 1 
                                       f32_4 %302 = OpImageSampleImplicitLod %299 %301 
                                                      OpStore %97 %302 
                                       f32_4 %303 = OpLoad %89 
                                       f32_4 %304 = OpLoad %97 
                                       f32_4 %305 = OpFNegate %304 
                                       f32_4 %306 = OpFAdd %303 %305 
                                                      OpStore %89 %306 
                                Uniform f32* %308 = OpAccessChain %14 %307 
                                         f32 %309 = OpLoad %308 
                                Uniform f32* %310 = OpAccessChain %14 %307 
                                         f32 %311 = OpLoad %310 
                                Uniform f32* %312 = OpAccessChain %14 %307 
                                         f32 %313 = OpLoad %312 
                                Uniform f32* %314 = OpAccessChain %14 %307 
                                         f32 %315 = OpLoad %314 
                                       f32_4 %316 = OpCompositeConstruct %309 %311 %313 %315 
                                         f32 %317 = OpCompositeExtract %316 0 
                                         f32 %318 = OpCompositeExtract %316 1 
                                         f32 %319 = OpCompositeExtract %316 2 
                                         f32 %320 = OpCompositeExtract %316 3 
                                       f32_4 %321 = OpCompositeConstruct %317 %318 %319 %320 
                                       f32_4 %322 = OpLoad %89 
                                       f32_4 %323 = OpFMul %321 %322 
                                       f32_4 %324 = OpLoad %97 
                                       f32_4 %325 = OpFAdd %323 %324 
                                                      OpStore %89 %325 
                                Private f32* %326 = OpAccessChain %25 %49 
                                         f32 %327 = OpLoad %326 
                                         f32 %329 = OpFMul %327 %328 
                                Private f32* %331 = OpAccessChain %112 %330 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFAdd %329 %332 
                                Private f32* %334 = OpAccessChain %112 %49 
                                                      OpStore %334 %333 
                         read_only Texture2D %335 = OpLoad %137 
                                     sampler %336 = OpLoad %141 
                  read_only Texture2DSampled %337 = OpSampledImage %335 %336 
                                       f32_4 %338 = OpLoad %112 
                                       f32_2 %339 = OpVectorShuffle %338 %338 0 1 
                                       f32_4 %340 = OpImageSampleImplicitLod %337 %339 
                                         f32 %341 = OpCompositeExtract %340 1 
                                Private f32* %342 = OpAccessChain %42 %49 
                                                      OpStore %342 %341 
                                         f32 %343 = OpLoad %170 
                                Private f32* %344 = OpAccessChain %42 %49 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFMul %343 %345 
                                Private f32* %347 = OpAccessChain %42 %49 
                                                      OpStore %347 %346 
                                       f32_2 %348 = OpLoad %42 
                                       f32_2 %349 = OpVectorShuffle %348 %348 0 0 
                                Uniform f32* %351 = OpAccessChain %14 %350 
                                         f32 %352 = OpLoad %351 
                                Uniform f32* %353 = OpAccessChain %14 %350 
                                         f32 %354 = OpLoad %353 
                                       f32_2 %355 = OpCompositeConstruct %352 %354 
                                         f32 %356 = OpCompositeExtract %355 0 
                                         f32 %357 = OpCompositeExtract %355 1 
                                       f32_2 %358 = OpCompositeConstruct %356 %357 
                                         f32 %359 = OpDot %349 %358 
                                Private f32* %360 = OpAccessChain %42 %49 
                                                      OpStore %360 %359 
                                       f32_2 %361 = OpLoad %42 
                                       f32_4 %362 = OpVectorShuffle %361 %361 0 0 0 0 
                                       f32_4 %363 = OpLoad %89 
                                       f32_4 %364 = OpFAdd %362 %363 
                                                      OpStore %89 %364 
                                Private f32* %365 = OpAccessChain %64 %49 
                                         f32 %366 = OpLoad %365 
                                         f32 %368 = OpFMul %366 %367 
                                Private f32* %369 = OpAccessChain %42 %49 
                                                      OpStore %369 %368 
                                Private f32* %370 = OpAccessChain %42 %49 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpExtInst %1 8 %371 
                                Private f32* %373 = OpAccessChain %42 %49 
                                                      OpStore %373 %372 
                                Private f32* %374 = OpAccessChain %42 %49 
                                         f32 %375 = OpLoad %374 
                                         f32 %377 = OpFMul %375 %376 
                                                      OpStore %180 %377 
                                Private f32* %378 = OpAccessChain %42 %49 
                                         f32 %379 = OpLoad %378 
                                         f32 %381 = OpFMul %379 %380 
                                Private f32* %382 = OpAccessChain %25 %62 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFAdd %381 %383 
                                Private f32* %385 = OpAccessChain %42 %49 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %64 %49 
                                         f32 %387 = OpLoad %386 
                                         f32 %389 = OpFMul %387 %388 
                                Private f32* %390 = OpAccessChain %42 %49 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                Private f32* %393 = OpAccessChain %112 %18 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %64 %49 
                                         f32 %395 = OpLoad %394 
                                Uniform f32* %396 = OpAccessChain %14 %79 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFMul %395 %397 
                                Private f32* %399 = OpAccessChain %64 %49 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %25 %49 
                                         f32 %401 = OpLoad %400 
                                         f32 %403 = OpFMul %401 %402 
                                         f32 %404 = OpLoad %180 
                                         f32 %405 = OpFAdd %403 %404 
                                Private f32* %406 = OpAccessChain %42 %49 
                                                      OpStore %406 %405 
                                Private f32* %407 = OpAccessChain %64 %49 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFNegate %408 
                                         f32 %411 = OpFMul %409 %410 
                                Private f32* %412 = OpAccessChain %42 %49 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFAdd %411 %413 
                                Private f32* %415 = OpAccessChain %112 %49 
                                                      OpStore %415 %414 
                         read_only Texture2D %416 = OpLoad %137 
                                     sampler %417 = OpLoad %141 
                  read_only Texture2DSampled %418 = OpSampledImage %416 %417 
                                       f32_4 %419 = OpLoad %112 
                                       f32_2 %420 = OpVectorShuffle %419 %419 0 1 
                                       f32_4 %421 = OpImageSampleImplicitLod %418 %420 
                                         f32 %422 = OpCompositeExtract %421 2 
                                Private f32* %423 = OpAccessChain %64 %49 
                                                      OpStore %423 %422 
                                       f32_4 %424 = OpLoad %25 
                                       f32_2 %425 = OpVectorShuffle %424 %424 0 1 
                              Uniform f32_4* %427 = OpAccessChain %14 %426 
                                       f32_4 %428 = OpLoad %427 
                                       f32_2 %429 = OpVectorShuffle %428 %428 0 1 
                                       f32_2 %430 = OpFMul %425 %429 
                                       f32_2 %433 = OpFAdd %430 %432 
                                                      OpStore %42 %433 
                                       f32_4 %434 = OpLoad %25 
                                       f32_4 %435 = OpVectorShuffle %434 %434 0 1 0 1 
                              Uniform f32_4* %436 = OpAccessChain %14 %426 
                                       f32_4 %437 = OpLoad %436 
                                       f32_4 %438 = OpVectorShuffle %437 %437 0 1 0 1 
                                       f32_4 %439 = OpFMul %435 %438 
                                       f32_4 %441 = OpFAdd %439 %440 
                                                      OpStore %25 %441 
                                       f32_4 %442 = OpLoad %25 
                              Uniform f32_4* %443 = OpAccessChain %14 %426 
                                       f32_4 %444 = OpLoad %443 
                                       f32_4 %445 = OpVectorShuffle %444 %444 0 1 0 1 
                                       f32_4 %446 = OpFDiv %442 %445 
                                                      OpStore %25 %446 
                                       f32_2 %447 = OpLoad %42 
                              Uniform f32_4* %448 = OpAccessChain %14 %426 
                                       f32_4 %449 = OpLoad %448 
                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
                                       f32_2 %451 = OpFDiv %447 %450 
                                                      OpStore %42 %451 
                         read_only Texture2D %452 = OpLoad %285 
                                     sampler %453 = OpLoad %287 
                  read_only Texture2DSampled %454 = OpSampledImage %452 %453 
                                       f32_2 %455 = OpLoad %42 
                                       f32_4 %456 = OpImageSampleImplicitLod %454 %455 
                                                      OpStore %112 %456 
                         read_only Texture2D %458 = OpLoad %285 
                                     sampler %459 = OpLoad %287 
                  read_only Texture2DSampled %460 = OpSampledImage %458 %459 
                                       f32_4 %461 = OpLoad %25 
                                       f32_2 %462 = OpVectorShuffle %461 %461 0 1 
                                       f32_4 %463 = OpImageSampleImplicitLod %460 %462 
                                                      OpStore %457 %463 
                         read_only Texture2D %464 = OpLoad %285 
                                     sampler %465 = OpLoad %287 
                  read_only Texture2DSampled %466 = OpSampledImage %464 %465 
                                       f32_4 %467 = OpLoad %25 
                                       f32_2 %468 = OpVectorShuffle %467 %467 2 3 
                                       f32_4 %469 = OpImageSampleImplicitLod %466 %468 
                                                      OpStore %25 %469 
                                       f32_4 %470 = OpLoad %25 
                                       f32_4 %471 = OpFNegate %470 
                                       f32_4 %472 = OpLoad %457 
                                       f32_4 %473 = OpFAdd %471 %472 
                                                      OpStore %25 %473 
                                       f32_4 %474 = OpLoad %112 
                                       f32_4 %475 = OpFNegate %474 
                                       f32_4 %476 = OpLoad %457 
                                       f32_4 %477 = OpFAdd %475 %476 
                                                      OpStore %112 %477 
                                       f32_4 %478 = OpLoad %25 
                                       f32_4 %479 = OpExtInst %1 4 %478 
                                       f32_4 %480 = OpLoad %112 
                                       f32_4 %481 = OpExtInst %1 4 %480 
                                       f32_4 %482 = OpFAdd %479 %481 
                                                      OpStore %25 %482 
                                       f32_4 %483 = OpLoad %25 
                                       f32_4 %485 = OpFMul %483 %484 
                                                      OpStore %25 %485 
                                       f32_4 %486 = OpLoad %25 
                                       f32_4 %487 = OpLoad %25 
                                         f32 %488 = OpDot %486 %487 
                                Private f32* %489 = OpAccessChain %42 %49 
                                                      OpStore %489 %488 
                                Private f32* %490 = OpAccessChain %42 %49 
                                         f32 %491 = OpLoad %490 
                                         f32 %492 = OpExtInst %1 31 %491 
                                Private f32* %493 = OpAccessChain %42 %49 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %64 %49 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %42 %49 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %64 %49 
                                                      OpStore %499 %498 
                                Uniform f32* %501 = OpAccessChain %14 %500 
                                         f32 %502 = OpLoad %501 
                                       f32_4 %503 = OpCompositeConstruct %502 %502 %502 %502 
                                       f32_4 %504 = OpLoad %64 
                                       f32_4 %505 = OpVectorShuffle %504 %504 0 0 0 0 
                                       f32_4 %506 = OpFMul %503 %505 
                                       f32_4 %507 = OpLoad %89 
                                       f32_4 %508 = OpFAdd %506 %507 
                                                      OpStore %64 %508 
                                       f32_4 %509 = OpLoad %97 
                                       f32_4 %510 = OpFNegate %509 
                                       f32_4 %511 = OpLoad %64 
                                       f32_4 %512 = OpFAdd %510 %511 
                                                      OpStore %64 %512 
                                Uniform f32* %515 = OpAccessChain %14 %307 
                                         f32 %516 = OpLoad %515 
                                Uniform f32* %517 = OpAccessChain %14 %307 
                                         f32 %518 = OpLoad %517 
                                Uniform f32* %519 = OpAccessChain %14 %307 
                                         f32 %520 = OpLoad %519 
                                Uniform f32* %521 = OpAccessChain %14 %307 
                                         f32 %522 = OpLoad %521 
                                       f32_4 %523 = OpCompositeConstruct %516 %518 %520 %522 
                                         f32 %524 = OpCompositeExtract %523 0 
                                         f32 %525 = OpCompositeExtract %523 1 
                                         f32 %526 = OpCompositeExtract %523 2 
                                         f32 %527 = OpCompositeExtract %523 3 
                                       f32_4 %528 = OpCompositeConstruct %524 %525 %526 %527 
                                       f32_4 %529 = OpLoad %64 
                                       f32_4 %530 = OpFMul %528 %529 
                                       f32_4 %531 = OpLoad %97 
                                       f32_4 %532 = OpFAdd %530 %531 
                                                      OpStore %514 %532 
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