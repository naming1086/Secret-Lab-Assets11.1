//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Pixelisation_OilPaint" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value ("_Value", Range(0, 5)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 56490
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
float u_xlat9;
bool u_xlatb9;
vec2 u_xlat18;
float u_xlat28;
void main()
{
    u_xlat0.xy = vec2(_Value) / _ScreenResolution.xy;
    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = u_xlat0.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat18.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat4 = texture(_MainTex, u_xlat18.xy);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat4.xyz;
    u_xlat4 = u_xlat0.xyxy * vec4(2.0, 0.0, -4.0, -3.0) + u_xlat18.xyxy;
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat3.xyz = u_xlat5.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat5.xyz;
    u_xlat5 = u_xlat0.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat18.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat5.xy);
    u_xlat5 = texture(_MainTex, u_xlat5.zw);
    u_xlat3.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat6.xyz;
    u_xlat6.xy = u_xlat0.xy + u_xlat18.xy;
    u_xlat6 = texture(_MainTex, u_xlat6.xy);
    u_xlat3.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat6.xyz;
    u_xlat6 = u_xlat0.xyxy * vec4(2.0, 1.0, -4.0, -2.0) + u_xlat18.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat3.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat7.xyz;
    u_xlat7 = u_xlat0.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat18.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat7.xy);
    u_xlat7 = texture(_MainTex, u_xlat7.zw);
    u_xlat3.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat8.xyz;
    u_xlat8.xy = u_xlat0.xy * vec2(1.0, 2.0) + u_xlat18.xy;
    u_xlat8 = texture(_MainTex, u_xlat8.xy);
    u_xlat3.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat8.xyz;
    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + u_xlat18.xy;
    u_xlat0 = u_xlat0.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat18.xyxy;
    u_xlat8 = texture(_MainTex, u_xlat8.xy);
    u_xlat3.xyz = u_xlat8.xyz * u_xlat8.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat8.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
    u_xlat8.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat8.xyz);
    u_xlat28 = abs(u_xlat3.y) + abs(u_xlat3.x);
    u_xlat28 = abs(u_xlat3.z) + u_xlat28;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat8.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat8.xyz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat5.xyz + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
    u_xlat1.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat1.xyz);
    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
    u_xlat9 = min(u_xlat0.x, 100.0);
    u_xlatb0 = u_xlat0.x<100.0;
    u_xlatb9 = u_xlat28<u_xlat9;
    u_xlat3.w = 1.0;
    u_xlat1 = bool(u_xlatb0) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat2.w = 1.0;
    SV_Target0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat1;
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
; Bound: 643
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %31 %636 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpMemberDecorate %10 2 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 31 
                                             OpDecorate %56 DescriptorSet 56 
                                             OpDecorate %56 Binding 56 
                                             OpDecorate %60 DescriptorSet 60 
                                             OpDecorate %60 Binding 60 
                                             OpDecorate %636 Location 636 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %6 %7 
                                     %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypePointer Uniform %6 
                                     %18 = OpTypeVector %6 2 
                                 i32 %20 = OpConstant 0 
                                     %21 = OpTypePointer Uniform %7 
                                     %28 = OpTypePointer Private %18 
                      Private f32_2* %29 = OpVariable Private 
                                     %30 = OpTypePointer Input %18 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %33 = OpConstant 2 
                      Private f32_4* %42 = OpVariable Private 
                                 f32 %45 = OpConstant 3.674022E-40 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                               f32_4 %48 = OpConstantComposite %45 %46 %47 %47 
                      Private f32_4* %53 = OpVariable Private 
                                     %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %55 = OpTypePointer UniformConstant %54 
UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
                                     %58 = OpTypeSampler 
                                     %59 = OpTypePointer UniformConstant %58 
            UniformConstant sampler* %60 = OpVariable UniformConstant 
                                     %62 = OpTypeSampledImage %54 
                                     %67 = OpTypeVector %6 3 
                      Private f32_4* %80 = OpVariable Private 
                      Private f32_4* %88 = OpVariable Private 
                                f32 %116 = OpConstant 3.674022E-40 
                                f32 %117 = OpConstant 3.674022E-40 
                                f32 %118 = OpConstant 3.674022E-40 
                              f32_4 %119 = OpConstantComposite %116 %46 %117 %118 
                     Private f32_4* %124 = OpVariable Private 
                              f32_4 %162 = OpConstantComposite %46 %45 %47 %118 
                     Private f32_4* %167 = OpVariable Private 
                              f32_4 %237 = OpConstantComposite %116 %45 %117 %47 
                     Private f32_4* %242 = OpVariable Private 
                              f32_4 %280 = OpConstantComposite %46 %116 %118 %47 
                                    %285 = OpTypePointer Private %67 
                     Private f32_3* %286 = OpVariable Private 
                              f32_2 %319 = OpConstantComposite %45 %116 
                              f32_2 %348 = OpConstantComposite %116 %116 
                              f32_4 %356 = OpConstantComposite %117 %117 %118 %118 
                                f32 %384 = OpConstant 3.674022E-40 
                              f32_3 %385 = OpConstantComposite %384 %384 %384 
                                    %402 = OpTypePointer Private %6 
                       Private f32* %403 = OpVariable Private 
                                    %404 = OpTypeInt 32 0 
                                u32 %405 = OpConstant 1 
                                u32 %409 = OpConstant 0 
                                u32 %414 = OpConstant 2 
                       Private f32* %611 = OpVariable Private 
                                f32 %614 = OpConstant 3.674022E-40 
                                    %616 = OpTypeBool 
                                    %617 = OpTypePointer Private %616 
                      Private bool* %618 = OpVariable Private 
                      Private bool* %622 = OpVariable Private 
                                u32 %626 = OpConstant 3 
                              f32_4 %630 = OpConstantComposite %46 %46 %46 %46 
                                    %631 = OpTypeVector %616 4 
                                    %635 = OpTypePointer Output %7 
                      Output f32_4* %636 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %16 = OpAccessChain %12 %14 
                                 f32 %17 = OpLoad %16 
                               f32_2 %19 = OpCompositeConstruct %17 %17 
                      Uniform f32_4* %22 = OpAccessChain %12 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                               f32_2 %25 = OpFDiv %19 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
                                             OpStore %9 %27 
                               f32_2 %32 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %34 = OpAccessChain %12 %33 
                               f32_4 %35 = OpLoad %34 
                               f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                               f32_2 %37 = OpFMul %32 %36 
                      Uniform f32_4* %38 = OpAccessChain %12 %33 
                               f32_4 %39 = OpLoad %38 
                               f32_2 %40 = OpVectorShuffle %39 %39 2 3 
                               f32_2 %41 = OpFAdd %37 %40 
                                             OpStore %29 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
                               f32_4 %49 = OpFMul %44 %48 
                               f32_2 %50 = OpLoad %29 
                               f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 1 
                               f32_4 %52 = OpFAdd %49 %51 
                                             OpStore %42 %52 
                 read_only Texture2D %57 = OpLoad %56 
                             sampler %61 = OpLoad %60 
          read_only Texture2DSampled %63 = OpSampledImage %57 %61 
                               f32_4 %64 = OpLoad %42 
                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                               f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                               f32_3 %68 = OpVectorShuffle %66 %66 0 1 2 
                               f32_4 %69 = OpLoad %53 
                               f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                             OpStore %53 %70 
                 read_only Texture2D %71 = OpLoad %56 
                             sampler %72 = OpLoad %60 
          read_only Texture2DSampled %73 = OpSampledImage %71 %72 
                               f32_4 %74 = OpLoad %42 
                               f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                               f32_4 %76 = OpImageSampleImplicitLod %73 %75 
                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                               f32_4 %78 = OpLoad %42 
                               f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                             OpStore %42 %79 
                               f32_4 %81 = OpLoad %53 
                               f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                               f32_4 %83 = OpLoad %53 
                               f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                               f32_3 %85 = OpFMul %82 %84 
                               f32_4 %86 = OpLoad %80 
                               f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                             OpStore %80 %87 
                 read_only Texture2D %89 = OpLoad %56 
                             sampler %90 = OpLoad %60 
          read_only Texture2DSampled %91 = OpSampledImage %89 %90 
                               f32_2 %92 = OpLoad %29 
                               f32_4 %93 = OpImageSampleImplicitLod %91 %92 
                               f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                               f32_4 %95 = OpLoad %88 
                               f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                             OpStore %88 %96 
                               f32_4 %97 = OpLoad %88 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                               f32_4 %99 = OpLoad %88 
                              f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                              f32_3 %101 = OpFMul %98 %100 
                              f32_4 %102 = OpLoad %80 
                              f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                              f32_3 %104 = OpFAdd %101 %103 
                              f32_4 %105 = OpLoad %80 
                              f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                             OpStore %80 %106 
                              f32_4 %107 = OpLoad %53 
                              f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                              f32_4 %109 = OpLoad %88 
                              f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                              f32_3 %111 = OpFAdd %108 %110 
                              f32_4 %112 = OpLoad %53 
                              f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                             OpStore %53 %113 
                              f32_4 %114 = OpLoad %9 
                              f32_4 %115 = OpVectorShuffle %114 %114 0 1 0 1 
                              f32_4 %120 = OpFMul %115 %119 
                              f32_2 %121 = OpLoad %29 
                              f32_4 %122 = OpVectorShuffle %121 %121 0 1 0 1 
                              f32_4 %123 = OpFAdd %120 %122 
                                             OpStore %88 %123 
                read_only Texture2D %125 = OpLoad %56 
                            sampler %126 = OpLoad %60 
         read_only Texture2DSampled %127 = OpSampledImage %125 %126 
                              f32_4 %128 = OpLoad %88 
                              f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                              f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                              f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              f32_4 %132 = OpLoad %124 
                              f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                             OpStore %124 %133 
                read_only Texture2D %134 = OpLoad %56 
                            sampler %135 = OpLoad %60 
         read_only Texture2DSampled %136 = OpSampledImage %134 %135 
                              f32_4 %137 = OpLoad %88 
                              f32_2 %138 = OpVectorShuffle %137 %137 2 3 
                              f32_4 %139 = OpImageSampleImplicitLod %136 %138 
                              f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              f32_4 %141 = OpLoad %88 
                              f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                             OpStore %88 %142 
                              f32_4 %143 = OpLoad %124 
                              f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              f32_4 %145 = OpLoad %124 
                              f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              f32_3 %147 = OpFMul %144 %146 
                              f32_4 %148 = OpLoad %80 
                              f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                              f32_3 %150 = OpFAdd %147 %149 
                              f32_4 %151 = OpLoad %80 
                              f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                             OpStore %80 %152 
                              f32_4 %153 = OpLoad %53 
                              f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                              f32_4 %155 = OpLoad %124 
                              f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              f32_3 %157 = OpFAdd %154 %156 
                              f32_4 %158 = OpLoad %53 
                              f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                             OpStore %53 %159 
                              f32_4 %160 = OpLoad %9 
                              f32_4 %161 = OpVectorShuffle %160 %160 0 1 0 1 
                              f32_4 %163 = OpFMul %161 %162 
                              f32_2 %164 = OpLoad %29 
                              f32_4 %165 = OpVectorShuffle %164 %164 0 1 0 1 
                              f32_4 %166 = OpFAdd %163 %165 
                                             OpStore %124 %166 
                read_only Texture2D %168 = OpLoad %56 
                            sampler %169 = OpLoad %60 
         read_only Texture2DSampled %170 = OpSampledImage %168 %169 
                              f32_4 %171 = OpLoad %124 
                              f32_2 %172 = OpVectorShuffle %171 %171 0 1 
                              f32_4 %173 = OpImageSampleImplicitLod %170 %172 
                              f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                              f32_4 %175 = OpLoad %167 
                              f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                             OpStore %167 %176 
                read_only Texture2D %177 = OpLoad %56 
                            sampler %178 = OpLoad %60 
         read_only Texture2DSampled %179 = OpSampledImage %177 %178 
                              f32_4 %180 = OpLoad %124 
                              f32_2 %181 = OpVectorShuffle %180 %180 2 3 
                              f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                              f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              f32_4 %184 = OpLoad %124 
                              f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                             OpStore %124 %185 
                              f32_4 %186 = OpLoad %167 
                              f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                              f32_4 %188 = OpLoad %167 
                              f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                              f32_3 %190 = OpFMul %187 %189 
                              f32_4 %191 = OpLoad %80 
                              f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                              f32_3 %193 = OpFAdd %190 %192 
                              f32_4 %194 = OpLoad %80 
                              f32_4 %195 = OpVectorShuffle %194 %193 4 5 6 3 
                                             OpStore %80 %195 
                              f32_4 %196 = OpLoad %53 
                              f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                              f32_4 %198 = OpLoad %167 
                              f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              f32_3 %200 = OpFAdd %197 %199 
                              f32_4 %201 = OpLoad %53 
                              f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
                                             OpStore %53 %202 
                              f32_4 %203 = OpLoad %9 
                              f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                              f32_2 %205 = OpLoad %29 
                              f32_2 %206 = OpFAdd %204 %205 
                              f32_4 %207 = OpLoad %167 
                              f32_4 %208 = OpVectorShuffle %207 %206 4 5 2 3 
                                             OpStore %167 %208 
                read_only Texture2D %209 = OpLoad %56 
                            sampler %210 = OpLoad %60 
         read_only Texture2DSampled %211 = OpSampledImage %209 %210 
                              f32_4 %212 = OpLoad %167 
                              f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                              f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                              f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                              f32_4 %216 = OpLoad %167 
                              f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                             OpStore %167 %217 
                              f32_4 %218 = OpLoad %167 
                              f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                              f32_4 %220 = OpLoad %167 
                              f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                              f32_3 %222 = OpFMul %219 %221 
                              f32_4 %223 = OpLoad %80 
                              f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                              f32_3 %225 = OpFAdd %222 %224 
                              f32_4 %226 = OpLoad %80 
                              f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                             OpStore %80 %227 
                              f32_4 %228 = OpLoad %53 
                              f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                              f32_4 %230 = OpLoad %167 
                              f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              f32_3 %232 = OpFAdd %229 %231 
                              f32_4 %233 = OpLoad %53 
                              f32_4 %234 = OpVectorShuffle %233 %232 4 5 6 3 
                                             OpStore %53 %234 
                              f32_4 %235 = OpLoad %9 
                              f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 1 
                              f32_4 %238 = OpFMul %236 %237 
                              f32_2 %239 = OpLoad %29 
                              f32_4 %240 = OpVectorShuffle %239 %239 0 1 0 1 
                              f32_4 %241 = OpFAdd %238 %240 
                                             OpStore %167 %241 
                read_only Texture2D %243 = OpLoad %56 
                            sampler %244 = OpLoad %60 
         read_only Texture2DSampled %245 = OpSampledImage %243 %244 
                              f32_4 %246 = OpLoad %167 
                              f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                              f32_4 %248 = OpImageSampleImplicitLod %245 %247 
                              f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                              f32_4 %250 = OpLoad %242 
                              f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                             OpStore %242 %251 
                read_only Texture2D %252 = OpLoad %56 
                            sampler %253 = OpLoad %60 
         read_only Texture2DSampled %254 = OpSampledImage %252 %253 
                              f32_4 %255 = OpLoad %167 
                              f32_2 %256 = OpVectorShuffle %255 %255 2 3 
                              f32_4 %257 = OpImageSampleImplicitLod %254 %256 
                              f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                              f32_4 %259 = OpLoad %167 
                              f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                             OpStore %167 %260 
                              f32_4 %261 = OpLoad %242 
                              f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              f32_4 %263 = OpLoad %242 
                              f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                              f32_3 %265 = OpFMul %262 %264 
                              f32_4 %266 = OpLoad %80 
                              f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                              f32_3 %268 = OpFAdd %265 %267 
                              f32_4 %269 = OpLoad %80 
                              f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                             OpStore %80 %270 
                              f32_4 %271 = OpLoad %53 
                              f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              f32_4 %273 = OpLoad %242 
                              f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                              f32_3 %275 = OpFAdd %272 %274 
                              f32_4 %276 = OpLoad %53 
                              f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                             OpStore %53 %277 
                              f32_4 %278 = OpLoad %9 
                              f32_4 %279 = OpVectorShuffle %278 %278 0 1 0 1 
                              f32_4 %281 = OpFMul %279 %280 
                              f32_2 %282 = OpLoad %29 
                              f32_4 %283 = OpVectorShuffle %282 %282 0 1 0 1 
                              f32_4 %284 = OpFAdd %281 %283 
                                             OpStore %242 %284 
                read_only Texture2D %287 = OpLoad %56 
                            sampler %288 = OpLoad %60 
         read_only Texture2DSampled %289 = OpSampledImage %287 %288 
                              f32_4 %290 = OpLoad %242 
                              f32_2 %291 = OpVectorShuffle %290 %290 0 1 
                              f32_4 %292 = OpImageSampleImplicitLod %289 %291 
                              f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                             OpStore %286 %293 
                read_only Texture2D %294 = OpLoad %56 
                            sampler %295 = OpLoad %60 
         read_only Texture2DSampled %296 = OpSampledImage %294 %295 
                              f32_4 %297 = OpLoad %242 
                              f32_2 %298 = OpVectorShuffle %297 %297 2 3 
                              f32_4 %299 = OpImageSampleImplicitLod %296 %298 
                              f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                              f32_4 %301 = OpLoad %242 
                              f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                             OpStore %242 %302 
                              f32_3 %303 = OpLoad %286 
                              f32_3 %304 = OpLoad %286 
                              f32_3 %305 = OpFMul %303 %304 
                              f32_4 %306 = OpLoad %80 
                              f32_3 %307 = OpVectorShuffle %306 %306 0 1 2 
                              f32_3 %308 = OpFAdd %305 %307 
                              f32_4 %309 = OpLoad %80 
                              f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                             OpStore %80 %310 
                              f32_4 %311 = OpLoad %53 
                              f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                              f32_3 %313 = OpLoad %286 
                              f32_3 %314 = OpFAdd %312 %313 
                              f32_4 %315 = OpLoad %53 
                              f32_4 %316 = OpVectorShuffle %315 %314 4 5 6 3 
                                             OpStore %53 %316 
                              f32_4 %317 = OpLoad %9 
                              f32_2 %318 = OpVectorShuffle %317 %317 0 1 
                              f32_2 %320 = OpFMul %318 %319 
                              f32_2 %321 = OpLoad %29 
                              f32_2 %322 = OpFAdd %320 %321 
                              f32_3 %323 = OpLoad %286 
                              f32_3 %324 = OpVectorShuffle %323 %322 3 4 2 
                                             OpStore %286 %324 
                read_only Texture2D %325 = OpLoad %56 
                            sampler %326 = OpLoad %60 
         read_only Texture2DSampled %327 = OpSampledImage %325 %326 
                              f32_3 %328 = OpLoad %286 
                              f32_2 %329 = OpVectorShuffle %328 %328 0 1 
                              f32_4 %330 = OpImageSampleImplicitLod %327 %329 
                              f32_3 %331 = OpVectorShuffle %330 %330 0 1 2 
                                             OpStore %286 %331 
                              f32_3 %332 = OpLoad %286 
                              f32_3 %333 = OpLoad %286 
                              f32_3 %334 = OpFMul %332 %333 
                              f32_4 %335 = OpLoad %80 
                              f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                              f32_3 %337 = OpFAdd %334 %336 
                              f32_4 %338 = OpLoad %80 
                              f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                             OpStore %80 %339 
                              f32_4 %340 = OpLoad %53 
                              f32_3 %341 = OpVectorShuffle %340 %340 0 1 2 
                              f32_3 %342 = OpLoad %286 
                              f32_3 %343 = OpFAdd %341 %342 
                              f32_4 %344 = OpLoad %53 
                              f32_4 %345 = OpVectorShuffle %344 %343 4 5 6 3 
                                             OpStore %53 %345 
                              f32_4 %346 = OpLoad %9 
                              f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                              f32_2 %349 = OpFMul %347 %348 
                              f32_2 %350 = OpLoad %29 
                              f32_2 %351 = OpFAdd %349 %350 
                              f32_3 %352 = OpLoad %286 
                              f32_3 %353 = OpVectorShuffle %352 %351 3 4 2 
                                             OpStore %286 %353 
                              f32_4 %354 = OpLoad %9 
                              f32_4 %355 = OpVectorShuffle %354 %354 0 1 0 1 
                              f32_4 %357 = OpFMul %355 %356 
                              f32_2 %358 = OpLoad %29 
                              f32_4 %359 = OpVectorShuffle %358 %358 0 1 0 1 
                              f32_4 %360 = OpFAdd %357 %359 
                                             OpStore %9 %360 
                read_only Texture2D %361 = OpLoad %56 
                            sampler %362 = OpLoad %60 
         read_only Texture2DSampled %363 = OpSampledImage %361 %362 
                              f32_3 %364 = OpLoad %286 
                              f32_2 %365 = OpVectorShuffle %364 %364 0 1 
                              f32_4 %366 = OpImageSampleImplicitLod %363 %365 
                              f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                             OpStore %286 %367 
                              f32_3 %368 = OpLoad %286 
                              f32_3 %369 = OpLoad %286 
                              f32_3 %370 = OpFMul %368 %369 
                              f32_4 %371 = OpLoad %80 
                              f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                              f32_3 %373 = OpFAdd %370 %372 
                              f32_4 %374 = OpLoad %80 
                              f32_4 %375 = OpVectorShuffle %374 %373 4 5 6 3 
                                             OpStore %80 %375 
                              f32_4 %376 = OpLoad %53 
                              f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                              f32_3 %378 = OpLoad %286 
                              f32_3 %379 = OpFAdd %377 %378 
                              f32_4 %380 = OpLoad %53 
                              f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
                                             OpStore %53 %381 
                              f32_4 %382 = OpLoad %53 
                              f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                              f32_3 %386 = OpFMul %383 %385 
                              f32_4 %387 = OpLoad %53 
                              f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                             OpStore %53 %388 
                              f32_4 %389 = OpLoad %53 
                              f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                              f32_4 %391 = OpLoad %53 
                              f32_3 %392 = OpVectorShuffle %391 %391 0 1 2 
                              f32_3 %393 = OpFMul %390 %392 
                                             OpStore %286 %393 
                              f32_4 %394 = OpLoad %80 
                              f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                              f32_3 %396 = OpFMul %395 %385 
                              f32_3 %397 = OpLoad %286 
                              f32_3 %398 = OpFNegate %397 
                              f32_3 %399 = OpFAdd %396 %398 
                              f32_4 %400 = OpLoad %80 
                              f32_4 %401 = OpVectorShuffle %400 %399 4 5 6 3 
                                             OpStore %80 %401 
                       Private f32* %406 = OpAccessChain %80 %405 
                                f32 %407 = OpLoad %406 
                                f32 %408 = OpExtInst %1 4 %407 
                       Private f32* %410 = OpAccessChain %80 %409 
                                f32 %411 = OpLoad %410 
                                f32 %412 = OpExtInst %1 4 %411 
                                f32 %413 = OpFAdd %408 %412 
                                             OpStore %403 %413 
                       Private f32* %415 = OpAccessChain %80 %414 
                                f32 %416 = OpLoad %415 
                                f32 %417 = OpExtInst %1 4 %416 
                                f32 %418 = OpLoad %403 
                                f32 %419 = OpFAdd %417 %418 
                                             OpStore %403 %419 
                read_only Texture2D %420 = OpLoad %56 
                            sampler %421 = OpLoad %60 
         read_only Texture2DSampled %422 = OpSampledImage %420 %421 
                              f32_4 %423 = OpLoad %9 
                              f32_2 %424 = OpVectorShuffle %423 %423 0 1 
                              f32_4 %425 = OpImageSampleImplicitLod %422 %424 
                              f32_3 %426 = OpVectorShuffle %425 %425 0 1 2 
                              f32_4 %427 = OpLoad %80 
                              f32_4 %428 = OpVectorShuffle %427 %426 4 5 6 3 
                                             OpStore %80 %428 
                read_only Texture2D %429 = OpLoad %56 
                            sampler %430 = OpLoad %60 
         read_only Texture2DSampled %431 = OpSampledImage %429 %430 
                              f32_4 %432 = OpLoad %9 
                              f32_2 %433 = OpVectorShuffle %432 %432 2 3 
                              f32_4 %434 = OpImageSampleImplicitLod %431 %433 
                              f32_3 %435 = OpVectorShuffle %434 %434 0 1 2 
                              f32_4 %436 = OpLoad %9 
                              f32_4 %437 = OpVectorShuffle %436 %435 4 5 6 3 
                                             OpStore %9 %437 
                              f32_4 %438 = OpLoad %9 
                              f32_3 %439 = OpVectorShuffle %438 %438 0 1 2 
                              f32_4 %440 = OpLoad %9 
                              f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                              f32_3 %442 = OpFMul %439 %441 
                                             OpStore %286 %442 
                              f32_4 %443 = OpLoad %80 
                              f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
                              f32_4 %445 = OpLoad %80 
                              f32_3 %446 = OpVectorShuffle %445 %445 0 1 2 
                              f32_3 %447 = OpFMul %444 %446 
                              f32_3 %448 = OpLoad %286 
                              f32_3 %449 = OpFAdd %447 %448 
                                             OpStore %286 %449 
                              f32_4 %450 = OpLoad %9 
                              f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                              f32_4 %452 = OpLoad %80 
                              f32_3 %453 = OpVectorShuffle %452 %452 0 1 2 
                              f32_3 %454 = OpFAdd %451 %453 
                              f32_4 %455 = OpLoad %80 
                              f32_4 %456 = OpVectorShuffle %455 %454 4 5 6 3 
                                             OpStore %80 %456 
                              f32_4 %457 = OpLoad %42 
                              f32_3 %458 = OpVectorShuffle %457 %457 0 1 2 
                              f32_4 %459 = OpLoad %80 
                              f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                              f32_3 %461 = OpFAdd %458 %460 
                              f32_4 %462 = OpLoad %80 
                              f32_4 %463 = OpVectorShuffle %462 %461 4 5 6 3 
                                             OpStore %80 %463 
                              f32_4 %464 = OpLoad %42 
                              f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                              f32_4 %466 = OpLoad %42 
                              f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
                              f32_3 %468 = OpFMul %465 %467 
                              f32_3 %469 = OpLoad %286 
                              f32_3 %470 = OpFAdd %468 %469 
                              f32_4 %471 = OpLoad %42 
                              f32_4 %472 = OpVectorShuffle %471 %470 4 5 6 3 
                                             OpStore %42 %472 
                              f32_4 %473 = OpLoad %88 
                              f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
                              f32_4 %475 = OpLoad %88 
                              f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                              f32_3 %477 = OpFMul %474 %476 
                              f32_4 %478 = OpLoad %42 
                              f32_3 %479 = OpVectorShuffle %478 %478 0 1 2 
                              f32_3 %480 = OpFAdd %477 %479 
                              f32_4 %481 = OpLoad %42 
                              f32_4 %482 = OpVectorShuffle %481 %480 4 5 6 3 
                                             OpStore %42 %482 
                              f32_4 %483 = OpLoad %88 
                              f32_3 %484 = OpVectorShuffle %483 %483 0 1 2 
                              f32_4 %485 = OpLoad %80 
                              f32_3 %486 = OpVectorShuffle %485 %485 0 1 2 
                              f32_3 %487 = OpFAdd %484 %486 
                              f32_4 %488 = OpLoad %80 
                              f32_4 %489 = OpVectorShuffle %488 %487 4 5 6 3 
                                             OpStore %80 %489 
                              f32_4 %490 = OpLoad %9 
                              f32_3 %491 = OpVectorShuffle %490 %490 0 1 2 
                              f32_4 %492 = OpLoad %80 
                              f32_3 %493 = OpVectorShuffle %492 %492 0 1 2 
                              f32_3 %494 = OpFAdd %491 %493 
                              f32_4 %495 = OpLoad %80 
                              f32_4 %496 = OpVectorShuffle %495 %494 4 5 6 3 
                                             OpStore %80 %496 
                              f32_4 %497 = OpLoad %9 
                              f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
                              f32_4 %499 = OpLoad %9 
                              f32_3 %500 = OpVectorShuffle %499 %499 0 1 2 
                              f32_3 %501 = OpFMul %498 %500 
                              f32_4 %502 = OpLoad %42 
                              f32_3 %503 = OpVectorShuffle %502 %502 0 1 2 
                              f32_3 %504 = OpFAdd %501 %503 
                              f32_4 %505 = OpLoad %9 
                              f32_4 %506 = OpVectorShuffle %505 %504 4 5 6 3 
                                             OpStore %9 %506 
                              f32_4 %507 = OpLoad %124 
                              f32_3 %508 = OpVectorShuffle %507 %507 0 1 2 
                              f32_4 %509 = OpLoad %124 
                              f32_3 %510 = OpVectorShuffle %509 %509 0 1 2 
                              f32_3 %511 = OpFMul %508 %510 
                              f32_4 %512 = OpLoad %9 
                              f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                              f32_3 %514 = OpFAdd %511 %513 
                              f32_4 %515 = OpLoad %9 
                              f32_4 %516 = OpVectorShuffle %515 %514 4 5 6 3 
                                             OpStore %9 %516 
                              f32_4 %517 = OpLoad %167 
                              f32_3 %518 = OpVectorShuffle %517 %517 0 1 2 
                              f32_4 %519 = OpLoad %167 
                              f32_3 %520 = OpVectorShuffle %519 %519 0 1 2 
                              f32_3 %521 = OpFMul %518 %520 
                              f32_4 %522 = OpLoad %9 
                              f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                              f32_3 %524 = OpFAdd %521 %523 
                              f32_4 %525 = OpLoad %9 
                              f32_4 %526 = OpVectorShuffle %525 %524 4 5 6 3 
                                             OpStore %9 %526 
                              f32_4 %527 = OpLoad %242 
                              f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                              f32_4 %529 = OpLoad %242 
                              f32_3 %530 = OpVectorShuffle %529 %529 0 1 2 
                              f32_3 %531 = OpFMul %528 %530 
                              f32_4 %532 = OpLoad %9 
                              f32_3 %533 = OpVectorShuffle %532 %532 0 1 2 
                              f32_3 %534 = OpFAdd %531 %533 
                              f32_4 %535 = OpLoad %9 
                              f32_4 %536 = OpVectorShuffle %535 %534 4 5 6 3 
                                             OpStore %9 %536 
                              f32_4 %537 = OpLoad %124 
                              f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
                              f32_4 %539 = OpLoad %124 
                              f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                              f32_3 %541 = OpFMul %538 %540 
                              f32_4 %542 = OpLoad %9 
                              f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                              f32_3 %544 = OpFAdd %541 %543 
                              f32_4 %545 = OpLoad %9 
                              f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                             OpStore %9 %546 
                              f32_4 %547 = OpLoad %124 
                              f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                              f32_4 %549 = OpLoad %80 
                              f32_3 %550 = OpVectorShuffle %549 %549 0 1 2 
                              f32_3 %551 = OpFAdd %548 %550 
                              f32_4 %552 = OpLoad %42 
                              f32_4 %553 = OpVectorShuffle %552 %551 4 5 6 3 
                                             OpStore %42 %553 
                              f32_4 %554 = OpLoad %167 
                              f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                              f32_4 %556 = OpLoad %42 
                              f32_3 %557 = OpVectorShuffle %556 %556 0 1 2 
                              f32_3 %558 = OpFAdd %555 %557 
                              f32_4 %559 = OpLoad %42 
                              f32_4 %560 = OpVectorShuffle %559 %558 4 5 6 3 
                                             OpStore %42 %560 
                              f32_4 %561 = OpLoad %242 
                              f32_3 %562 = OpVectorShuffle %561 %561 0 1 2 
                              f32_4 %563 = OpLoad %42 
                              f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
                              f32_3 %565 = OpFAdd %562 %564 
                              f32_4 %566 = OpLoad %42 
                              f32_4 %567 = OpVectorShuffle %566 %565 4 5 6 3 
                                             OpStore %42 %567 
                              f32_4 %568 = OpLoad %124 
                              f32_3 %569 = OpVectorShuffle %568 %568 0 1 2 
                              f32_4 %570 = OpLoad %42 
                              f32_3 %571 = OpVectorShuffle %570 %570 0 1 2 
                              f32_3 %572 = OpFAdd %569 %571 
                              f32_4 %573 = OpLoad %42 
                              f32_4 %574 = OpVectorShuffle %573 %572 4 5 6 3 
                                             OpStore %42 %574 
                              f32_4 %575 = OpLoad %42 
                              f32_3 %576 = OpVectorShuffle %575 %575 0 1 2 
                              f32_3 %577 = OpFMul %576 %385 
                              f32_4 %578 = OpLoad %80 
                              f32_4 %579 = OpVectorShuffle %578 %577 4 5 6 3 
                                             OpStore %80 %579 
                              f32_4 %580 = OpLoad %80 
                              f32_3 %581 = OpVectorShuffle %580 %580 0 1 2 
                              f32_4 %582 = OpLoad %80 
                              f32_3 %583 = OpVectorShuffle %582 %582 0 1 2 
                              f32_3 %584 = OpFMul %581 %583 
                              f32_4 %585 = OpLoad %42 
                              f32_4 %586 = OpVectorShuffle %585 %584 4 5 6 3 
                                             OpStore %42 %586 
                              f32_4 %587 = OpLoad %9 
                              f32_3 %588 = OpVectorShuffle %587 %587 0 1 2 
                              f32_3 %589 = OpFMul %588 %385 
                              f32_4 %590 = OpLoad %42 
                              f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                              f32_3 %592 = OpFNegate %591 
                              f32_3 %593 = OpFAdd %589 %592 
                              f32_4 %594 = OpLoad %9 
                              f32_4 %595 = OpVectorShuffle %594 %593 4 5 6 3 
                                             OpStore %9 %595 
                       Private f32* %596 = OpAccessChain %9 %405 
                                f32 %597 = OpLoad %596 
                                f32 %598 = OpExtInst %1 4 %597 
                       Private f32* %599 = OpAccessChain %9 %409 
                                f32 %600 = OpLoad %599 
                                f32 %601 = OpExtInst %1 4 %600 
                                f32 %602 = OpFAdd %598 %601 
                       Private f32* %603 = OpAccessChain %9 %409 
                                             OpStore %603 %602 
                       Private f32* %604 = OpAccessChain %9 %414 
                                f32 %605 = OpLoad %604 
                                f32 %606 = OpExtInst %1 4 %605 
                       Private f32* %607 = OpAccessChain %9 %409 
                                f32 %608 = OpLoad %607 
                                f32 %609 = OpFAdd %606 %608 
                       Private f32* %610 = OpAccessChain %9 %409 
                                             OpStore %610 %609 
                       Private f32* %612 = OpAccessChain %9 %409 
                                f32 %613 = OpLoad %612 
                                f32 %615 = OpExtInst %1 37 %613 %614 
                                             OpStore %611 %615 
                       Private f32* %619 = OpAccessChain %9 %409 
                                f32 %620 = OpLoad %619 
                               bool %621 = OpFOrdLessThan %620 %614 
                                             OpStore %618 %621 
                                f32 %623 = OpLoad %403 
                                f32 %624 = OpLoad %611 
                               bool %625 = OpFOrdLessThan %623 %624 
                                             OpStore %622 %625 
                       Private f32* %627 = OpAccessChain %80 %626 
                                             OpStore %627 %45 
                               bool %628 = OpLoad %618 
                              f32_4 %629 = OpLoad %80 
                             bool_4 %632 = OpCompositeConstruct %628 %628 %628 %628 
                              f32_4 %633 = OpSelect %632 %629 %630 
                                             OpStore %42 %633 
                       Private f32* %634 = OpAccessChain %53 %626 
                                             OpStore %634 %45 
                               bool %637 = OpLoad %622 
                              f32_4 %638 = OpLoad %53 
                              f32_4 %639 = OpLoad %42 
                             bool_4 %640 = OpCompositeConstruct %637 %637 %637 %637 
                              f32_4 %641 = OpSelect %640 %638 %639 
                                             OpStore %636 %641 
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