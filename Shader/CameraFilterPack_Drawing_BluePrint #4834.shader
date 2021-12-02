//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_BluePrint" {
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
  GpuProgramID 52603
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
uniform 	vec4 _PColor;
uniform 	vec4 _PColor2;
uniform 	float _TimeX;
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat15;
vec2 u_xlat17;
void main()
{
    u_xlat0.x = _TimeX * _Value4;
    u_xlat0.x = u_xlat0.x * 10.0;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * 0.0199999996;
    u_xlat0.x = u_xlat0.x * 0.0199999996;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat14.xy);
    u_xlat15 = u_xlat1.z * 0.0199999996;
    u_xlat2.x = u_xlat0.y * 0.0833333358 + u_xlat15;
    u_xlat2.y = u_xlat0.x * 0.0833333358 + u_xlat15;
    u_xlat3.y = _Value1;
    u_xlat3.x = float(0.0);
    u_xlat17.x = float(0.0);
    u_xlat4 = u_xlat14.xyxy + u_xlat3.yxxy;
    u_xlat4 = u_xlat2.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat4;
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6 = texture(_MainTex, u_xlat14.xy);
    u_xlat5.xyz = (-u_xlat5.xyz) + u_xlat6.xyz;
    u_xlat5.xyz = -abs(u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat5.y * u_xlat5.x;
    u_xlat0.x = u_xlat5.z * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7.x = _Value2 * 25.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat17.y = (-_Value1);
    u_xlat3 = u_xlat14.xyxy + u_xlat17.yxxy;
    u_xlat14.xy = u_xlat14.xy + u_xlat2.xy;
    u_xlat2 = u_xlat2.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat3;
    u_xlat3 = texture(_MainTex2, u_xlat14.xy);
    u_xlat5 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2.xyz = u_xlat6.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = -abs(u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyw = u_xlat6.xyz + (-u_xlat5.xyz);
    u_xlat3.xyw = -abs(u_xlat3.xyw) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat14.x = u_xlat3.y * u_xlat3.x;
    u_xlat14.x = u_xlat3.w * u_xlat14.x;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * u_xlat7.x;
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat3.xyw = (-u_xlat4.xyz) + u_xlat6.xyz;
    u_xlat3.xyw = -abs(u_xlat3.xyw) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat14.x = u_xlat3.y * u_xlat3.x;
    u_xlat14.x = u_xlat3.w * u_xlat14.x;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * u_xlat7.x;
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.x = u_xlat2.y * u_xlat2.x;
    u_xlat14.x = u_xlat2.z * u_xlat14.x;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = dot(u_xlat7.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat3.z * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat7.x = (-u_xlat1.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.174999997, 0.40200001, 0.686999977) + vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat14.x = (-_Value5) + 1.0;
    u_xlat7.x = u_xlat14.x * (-u_xlat7.x) + u_xlat7.x;
    u_xlat0.x = u_xlat7.x * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat7.xyz = (-u_xlat1.xyz) + _PColor2.xyz;
    u_xlat7.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) + _PColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat7.xyz;
    u_xlat0.xyz = (-u_xlat6.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat6.xyz;
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
; Bound: 523
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %60 %500 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 60 
                                                      OpDecorate %74 DescriptorSet 74 
                                                      OpDecorate %74 Binding 74 
                                                      OpDecorate %78 DescriptorSet 78 
                                                      OpDecorate %78 Binding 78 
                                                      OpDecorate %128 DescriptorSet 128 
                                                      OpDecorate %128 Binding 128 
                                                      OpDecorate %130 DescriptorSet 130 
                                                      OpDecorate %130 Binding 130 
                                                      OpDecorate %500 Location 500 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %10 %10 %6 %6 %6 %6 %6 %6 %6 %6 %10 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Uniform %6 
                                          i32 %19 = OpConstant 6 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          f32 %29 = OpConstant 3.674022E-40 
                               Private f32_3* %32 = OpVariable Private 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          u32 %45 = OpConstant 1 
                                              %51 = OpTypeVector %6 2 
                                              %57 = OpTypePointer Private %51 
                               Private f32_2* %58 = OpVariable Private 
                                              %59 = OpTypePointer Input %51 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %62 = OpConstant 10 
                                              %63 = OpTypePointer Uniform %10 
                                              %72 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %73 = OpTypePointer UniformConstant %72 
         UniformConstant read_only Texture2D* %74 = OpVariable UniformConstant 
                                              %76 = OpTypeSampler 
                                              %77 = OpTypePointer UniformConstant %76 
                     UniformConstant sampler* %78 = OpVariable UniformConstant 
                                              %80 = OpTypeSampledImage %72 
                                 Private f32* %85 = OpVariable Private 
                                          u32 %86 = OpConstant 2 
                                              %90 = OpTypePointer Private %10 
                               Private f32_4* %91 = OpVariable Private 
                                          f32 %94 = OpConstant 3.674022E-40 
                              Private f32_4* %105 = OpVariable Private 
                                         i32 %106 = OpConstant 3 
                                         f32 %110 = OpConstant 3.674022E-40 
                              Private f32_2* %112 = OpVariable Private 
                              Private f32_4* %114 = OpVariable Private 
                                         f32 %122 = OpConstant 3.674022E-40 
                                       f32_4 %123 = OpConstantComposite %122 %122 %122 %122 
                              Private f32_3* %127 = OpVariable Private 
        UniformConstant read_only Texture2D* %128 = OpVariable UniformConstant 
                    UniformConstant sampler* %130 = OpVariable UniformConstant 
                              Private f32_3* %146 = OpVariable Private 
                                         f32 %160 = OpConstant 3.674022E-40 
                                       f32_3 %161 = OpConstantComposite %160 %160 %160 
                                       f32_3 %164 = OpConstantComposite %110 %110 %110 
                              Private f32_3* %182 = OpVariable Private 
                                         i32 %183 = OpConstant 4 
                                         f32 %186 = OpConstant 3.674022E-40 
                                       f32_4 %201 = OpConstantComposite %160 %160 %160 %160 
                                Private f32* %285 = OpVariable Private 
                                         i32 %402 = OpConstant 5 
                                         f32 %409 = OpConstant 3.674022E-40 
                                         f32 %419 = OpConstant 3.674022E-40 
                                         f32 %420 = OpConstant 3.674022E-40 
                                         f32 %421 = OpConstant 3.674022E-40 
                                       f32_3 %422 = OpConstantComposite %419 %420 %421 
                                         f32 %424 = OpConstant 3.674022E-40 
                                       f32_3 %425 = OpConstantComposite %424 %424 %424 
                                         i32 %427 = OpConstant 7 
                                         i32 %461 = OpConstant 1 
                                         i32 %466 = OpConstant 8 
                                         i32 %484 = OpConstant 0 
                                             %499 = OpTypePointer Output %10 
                               Output f32_4* %500 = OpVariable Output 
                                         i32 %501 = OpConstant 9 
                                         u32 %519 = OpConstant 3 
                                             %520 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                 Uniform f32* %20 = OpAccessChain %13 %19 
                                          f32 %21 = OpLoad %20 
                                          f32 %22 = OpFMul %18 %21 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %22 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                          f32 %30 = OpFMul %28 %29 
                                 Private f32* %31 = OpAccessChain %9 %24 
                                                      OpStore %31 %30 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpExtInst %1 14 %34 
                                 Private f32* %36 = OpAccessChain %32 %24 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %24 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpExtInst %1 13 %38 
                                 Private f32* %40 = OpAccessChain %9 %24 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %32 %24 
                                          f32 %42 = OpLoad %41 
                                          f32 %44 = OpFMul %42 %43 
                                 Private f32* %46 = OpAccessChain %9 %45 
                                                      OpStore %46 %44 
                                 Private f32* %47 = OpAccessChain %9 %24 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFMul %48 %43 
                                 Private f32* %50 = OpAccessChain %9 %24 
                                                      OpStore %50 %49 
                                        f32_3 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_2 %54 = OpExtInst %1 8 %53 
                                        f32_3 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %54 3 4 2 
                                                      OpStore %9 %56 
                                        f32_2 %61 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %64 = OpAccessChain %13 %62 
                                        f32_4 %65 = OpLoad %64 
                                        f32_2 %66 = OpVectorShuffle %65 %65 0 1 
                                        f32_2 %67 = OpFMul %61 %66 
                               Uniform f32_4* %68 = OpAccessChain %13 %62 
                                        f32_4 %69 = OpLoad %68 
                                        f32_2 %70 = OpVectorShuffle %69 %69 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %58 %71 
                          read_only Texture2D %75 = OpLoad %74 
                                      sampler %79 = OpLoad %78 
                   read_only Texture2DSampled %81 = OpSampledImage %75 %79 
                                        f32_2 %82 = OpLoad %58 
                                        f32_4 %83 = OpImageSampleImplicitLod %81 %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                                      OpStore %32 %84 
                                 Private f32* %87 = OpAccessChain %32 %86 
                                          f32 %88 = OpLoad %87 
                                          f32 %89 = OpFMul %88 %43 
                                                      OpStore %85 %89 
                                 Private f32* %92 = OpAccessChain %9 %45 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFMul %93 %94 
                                          f32 %96 = OpLoad %85 
                                          f32 %97 = OpFAdd %95 %96 
                                 Private f32* %98 = OpAccessChain %91 %24 
                                                      OpStore %98 %97 
                                 Private f32* %99 = OpAccessChain %9 %24 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFMul %100 %94 
                                         f32 %102 = OpLoad %85 
                                         f32 %103 = OpFAdd %101 %102 
                                Private f32* %104 = OpAccessChain %91 %45 
                                                      OpStore %104 %103 
                                Uniform f32* %107 = OpAccessChain %13 %106 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %105 %45 
                                                      OpStore %109 %108 
                                Private f32* %111 = OpAccessChain %105 %24 
                                                      OpStore %111 %110 
                                Private f32* %113 = OpAccessChain %112 %24 
                                                      OpStore %113 %110 
                                       f32_2 %115 = OpLoad %58 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 1 0 1 
                                       f32_4 %117 = OpLoad %105 
                                       f32_4 %118 = OpVectorShuffle %117 %117 1 0 0 1 
                                       f32_4 %119 = OpFAdd %116 %118 
                                                      OpStore %114 %119 
                                       f32_4 %120 = OpLoad %91 
                                       f32_4 %121 = OpVectorShuffle %120 %120 0 1 0 1 
                                       f32_4 %124 = OpFMul %121 %123 
                                       f32_4 %125 = OpLoad %114 
                                       f32_4 %126 = OpFAdd %124 %125 
                                                      OpStore %114 %126 
                         read_only Texture2D %129 = OpLoad %128 
                                     sampler %131 = OpLoad %130 
                  read_only Texture2DSampled %132 = OpSampledImage %129 %131 
                                       f32_4 %133 = OpLoad %114 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                       f32_4 %135 = OpImageSampleImplicitLod %132 %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                                      OpStore %127 %136 
                         read_only Texture2D %137 = OpLoad %128 
                                     sampler %138 = OpLoad %130 
                  read_only Texture2DSampled %139 = OpSampledImage %137 %138 
                                       f32_4 %140 = OpLoad %114 
                                       f32_2 %141 = OpVectorShuffle %140 %140 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_4 %144 = OpLoad %114 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %114 %145 
                         read_only Texture2D %147 = OpLoad %128 
                                     sampler %148 = OpLoad %130 
                  read_only Texture2DSampled %149 = OpSampledImage %147 %148 
                                       f32_2 %150 = OpLoad %58 
                                       f32_4 %151 = OpImageSampleImplicitLod %149 %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                                      OpStore %146 %152 
                                       f32_3 %153 = OpLoad %127 
                                       f32_3 %154 = OpFNegate %153 
                                       f32_3 %155 = OpLoad %146 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %127 %156 
                                       f32_3 %157 = OpLoad %127 
                                       f32_3 %158 = OpExtInst %1 4 %157 
                                       f32_3 %159 = OpFNegate %158 
                                       f32_3 %162 = OpFAdd %159 %161 
                                                      OpStore %127 %162 
                                       f32_3 %163 = OpLoad %127 
                                       f32_3 %165 = OpExtInst %1 40 %163 %164 
                                                      OpStore %127 %165 
                                Private f32* %166 = OpAccessChain %127 %45 
                                         f32 %167 = OpLoad %166 
                                Private f32* %168 = OpAccessChain %127 %24 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFMul %167 %169 
                                Private f32* %171 = OpAccessChain %9 %24 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %127 %86 
                                         f32 %173 = OpLoad %172 
                                Private f32* %174 = OpAccessChain %9 %24 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %173 %175 
                                Private f32* %177 = OpAccessChain %9 %24 
                                                      OpStore %177 %176 
                                Private f32* %178 = OpAccessChain %9 %24 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpExtInst %1 30 %179 
                                Private f32* %181 = OpAccessChain %9 %24 
                                                      OpStore %181 %180 
                                Uniform f32* %184 = OpAccessChain %13 %183 
                                         f32 %185 = OpLoad %184 
                                         f32 %187 = OpFMul %185 %186 
                                Private f32* %188 = OpAccessChain %182 %24 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %9 %24 
                                         f32 %190 = OpLoad %189 
                                Private f32* %191 = OpAccessChain %182 %24 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %190 %192 
                                Private f32* %194 = OpAccessChain %9 %24 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %9 %24 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpExtInst %1 29 %196 
                                Private f32* %198 = OpAccessChain %9 %24 
                                                      OpStore %198 %197 
                                       f32_3 %199 = OpLoad %9 
                                       f32_4 %200 = OpVectorShuffle %199 %199 0 0 0 0 
                                         f32 %202 = OpDot %200 %201 
                                Private f32* %203 = OpAccessChain %9 %24 
                                                      OpStore %203 %202 
                                Uniform f32* %204 = OpAccessChain %13 %106 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                Private f32* %207 = OpAccessChain %112 %45 
                                                      OpStore %207 %206 
                                       f32_2 %208 = OpLoad %58 
                                       f32_4 %209 = OpVectorShuffle %208 %208 0 1 0 1 
                                       f32_2 %210 = OpLoad %112 
                                       f32_4 %211 = OpVectorShuffle %210 %210 1 0 0 1 
                                       f32_4 %212 = OpFAdd %209 %211 
                                                      OpStore %105 %212 
                                       f32_2 %213 = OpLoad %58 
                                       f32_4 %214 = OpLoad %91 
                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                                       f32_2 %216 = OpFAdd %213 %215 
                                                      OpStore %58 %216 
                                       f32_4 %217 = OpLoad %91 
                                       f32_4 %218 = OpVectorShuffle %217 %217 0 1 0 1 
                                       f32_4 %219 = OpFMul %218 %123 
                                       f32_4 %220 = OpLoad %105 
                                       f32_4 %221 = OpFAdd %219 %220 
                                                      OpStore %91 %221 
                         read_only Texture2D %222 = OpLoad %74 
                                     sampler %223 = OpLoad %78 
                  read_only Texture2DSampled %224 = OpSampledImage %222 %223 
                                       f32_2 %225 = OpLoad %58 
                                       f32_4 %226 = OpImageSampleImplicitLod %224 %225 
                                         f32 %227 = OpCompositeExtract %226 2 
                                Private f32* %228 = OpAccessChain %58 %24 
                                                      OpStore %228 %227 
                         read_only Texture2D %229 = OpLoad %128 
                                     sampler %230 = OpLoad %130 
                  read_only Texture2DSampled %231 = OpSampledImage %229 %230 
                                       f32_4 %232 = OpLoad %91 
                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
                                       f32_4 %234 = OpImageSampleImplicitLod %231 %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_4 %236 = OpLoad %105 
                                       f32_4 %237 = OpVectorShuffle %236 %235 4 5 6 3 
                                                      OpStore %105 %237 
                         read_only Texture2D %238 = OpLoad %128 
                                     sampler %239 = OpLoad %130 
                  read_only Texture2DSampled %240 = OpSampledImage %238 %239 
                                       f32_4 %241 = OpLoad %91 
                                       f32_2 %242 = OpVectorShuffle %241 %241 2 3 
                                       f32_4 %243 = OpImageSampleImplicitLod %240 %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_4 %245 = OpLoad %91 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                      OpStore %91 %246 
                                       f32_3 %247 = OpLoad %146 
                                       f32_4 %248 = OpLoad %91 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFNegate %249 
                                       f32_3 %251 = OpFAdd %247 %250 
                                       f32_4 %252 = OpLoad %91 
                                       f32_4 %253 = OpVectorShuffle %252 %251 4 5 6 3 
                                                      OpStore %91 %253 
                                       f32_4 %254 = OpLoad %91 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpExtInst %1 4 %255 
                                       f32_3 %257 = OpFNegate %256 
                                       f32_3 %258 = OpFAdd %257 %161 
                                       f32_4 %259 = OpLoad %91 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                                      OpStore %91 %260 
                                       f32_4 %261 = OpLoad %91 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpExtInst %1 40 %262 %164 
                                       f32_4 %264 = OpLoad %91 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %91 %265 
                                       f32_3 %266 = OpLoad %146 
                                       f32_4 %267 = OpLoad %105 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_3 %269 = OpFNegate %268 
                                       f32_3 %270 = OpFAdd %266 %269 
                                       f32_4 %271 = OpLoad %105 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %105 %272 
                                       f32_4 %273 = OpLoad %105 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpExtInst %1 4 %274 
                                       f32_3 %276 = OpFNegate %275 
                                       f32_3 %277 = OpFAdd %276 %161 
                                       f32_4 %278 = OpLoad %105 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 6 3 
                                                      OpStore %105 %279 
                                       f32_4 %280 = OpLoad %105 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                       f32_3 %282 = OpExtInst %1 40 %281 %164 
                                       f32_4 %283 = OpLoad %105 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                      OpStore %105 %284 
                                Private f32* %286 = OpAccessChain %105 %45 
                                         f32 %287 = OpLoad %286 
                                Private f32* %288 = OpAccessChain %105 %24 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFMul %287 %289 
                                                      OpStore %285 %290 
                                Private f32* %291 = OpAccessChain %105 %86 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpLoad %285 
                                         f32 %294 = OpFMul %292 %293 
                                                      OpStore %285 %294 
                                         f32 %295 = OpLoad %285 
                                         f32 %296 = OpExtInst %1 30 %295 
                                                      OpStore %285 %296 
                                         f32 %297 = OpLoad %285 
                                Private f32* %298 = OpAccessChain %182 %24 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpFMul %297 %299 
                                                      OpStore %285 %300 
                                         f32 %301 = OpLoad %285 
                                         f32 %302 = OpExtInst %1 29 %301 
                                                      OpStore %285 %302 
                                         f32 %303 = OpLoad %285 
                                       f32_4 %304 = OpCompositeConstruct %303 %303 %303 %303 
                                         f32 %305 = OpDot %304 %201 
                                                      OpStore %285 %305 
                                         f32 %306 = OpLoad %285 
                                Private f32* %307 = OpAccessChain %9 %24 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFMul %306 %308 
                                Private f32* %310 = OpAccessChain %9 %24 
                                                      OpStore %310 %309 
                                       f32_4 %311 = OpLoad %114 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpFNegate %312 
                                       f32_3 %314 = OpLoad %146 
                                       f32_3 %315 = OpFAdd %313 %314 
                                       f32_4 %316 = OpLoad %105 
                                       f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                      OpStore %105 %317 
                                       f32_4 %318 = OpLoad %105 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpExtInst %1 4 %319 
                                       f32_3 %321 = OpFNegate %320 
                                       f32_3 %322 = OpFAdd %321 %161 
                                       f32_4 %323 = OpLoad %105 
                                       f32_4 %324 = OpVectorShuffle %323 %322 4 5 6 3 
                                                      OpStore %105 %324 
                                       f32_4 %325 = OpLoad %105 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpExtInst %1 40 %326 %164 
                                       f32_4 %328 = OpLoad %105 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %105 %329 
                                Private f32* %330 = OpAccessChain %105 %45 
                                         f32 %331 = OpLoad %330 
                                Private f32* %332 = OpAccessChain %105 %24 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFMul %331 %333 
                                                      OpStore %285 %334 
                                Private f32* %335 = OpAccessChain %105 %86 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpLoad %285 
                                         f32 %338 = OpFMul %336 %337 
                                                      OpStore %285 %338 
                                         f32 %339 = OpLoad %285 
                                         f32 %340 = OpExtInst %1 30 %339 
                                                      OpStore %285 %340 
                                         f32 %341 = OpLoad %285 
                                Private f32* %342 = OpAccessChain %182 %24 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFMul %341 %343 
                                                      OpStore %285 %344 
                                         f32 %345 = OpLoad %285 
                                         f32 %346 = OpExtInst %1 29 %345 
                                                      OpStore %285 %346 
                                         f32 %347 = OpLoad %285 
                                       f32_4 %348 = OpCompositeConstruct %347 %347 %347 %347 
                                         f32 %349 = OpDot %348 %201 
                                                      OpStore %285 %349 
                                         f32 %350 = OpLoad %285 
                                Private f32* %351 = OpAccessChain %9 %24 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpFMul %350 %352 
                                Private f32* %354 = OpAccessChain %9 %24 
                                                      OpStore %354 %353 
                                Private f32* %355 = OpAccessChain %91 %45 
                                         f32 %356 = OpLoad %355 
                                Private f32* %357 = OpAccessChain %91 %24 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFMul %356 %358 
                                                      OpStore %285 %359 
                                Private f32* %360 = OpAccessChain %91 %86 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpLoad %285 
                                         f32 %363 = OpFMul %361 %362 
                                                      OpStore %285 %363 
                                         f32 %364 = OpLoad %285 
                                         f32 %365 = OpExtInst %1 30 %364 
                                                      OpStore %285 %365 
                                         f32 %366 = OpLoad %285 
                                Private f32* %367 = OpAccessChain %182 %24 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFMul %366 %368 
                                Private f32* %370 = OpAccessChain %182 %24 
                                                      OpStore %370 %369 
                                Private f32* %371 = OpAccessChain %182 %24 
                                         f32 %372 = OpLoad %371 
                                         f32 %373 = OpExtInst %1 29 %372 
                                Private f32* %374 = OpAccessChain %182 %24 
                                                      OpStore %374 %373 
                                       f32_3 %375 = OpLoad %182 
                                       f32_4 %376 = OpVectorShuffle %375 %375 0 0 0 0 
                                         f32 %377 = OpDot %376 %201 
                                Private f32* %378 = OpAccessChain %182 %24 
                                                      OpStore %378 %377 
                                Private f32* %379 = OpAccessChain %182 %24 
                                         f32 %380 = OpLoad %379 
                                Private f32* %381 = OpAccessChain %9 %24 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpFMul %380 %382 
                                Private f32* %384 = OpAccessChain %9 %24 
                                                      OpStore %384 %383 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpExtInst %1 37 %386 %160 
                                Private f32* %388 = OpAccessChain %9 %24 
                                                      OpStore %388 %387 
                                Private f32* %389 = OpAccessChain %9 %24 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFNegate %390 
                                         f32 %392 = OpFAdd %391 %160 
                                Private f32* %393 = OpAccessChain %9 %24 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %58 %24 
                                         f32 %395 = OpLoad %394 
                                Private f32* %396 = OpAccessChain %9 %24 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFMul %395 %397 
                                Private f32* %399 = OpAccessChain %9 %24 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %9 %24 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %403 = OpAccessChain %13 %402 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFMul %401 %404 
                                Private f32* %406 = OpAccessChain %9 %24 
                                                      OpStore %406 %405 
                                Private f32* %407 = OpAccessChain %9 %24 
                                         f32 %408 = OpLoad %407 
                                         f32 %410 = OpFMul %408 %409 
                                Private f32* %411 = OpAccessChain %9 %24 
                                                      OpStore %411 %410 
                                Private f32* %412 = OpAccessChain %32 %45 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFNegate %413 
                                         f32 %415 = OpFAdd %414 %160 
                                Private f32* %416 = OpAccessChain %182 %24 
                                                      OpStore %416 %415 
                                       f32_3 %417 = OpLoad %32 
                                       f32_3 %418 = OpVectorShuffle %417 %417 0 0 0 
                                       f32_3 %423 = OpFMul %418 %422 
                                       f32_3 %426 = OpFAdd %423 %425 
                                                      OpStore %32 %426 
                                Uniform f32* %428 = OpAccessChain %13 %427 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFNegate %429 
                                         f32 %431 = OpFAdd %430 %160 
                                Private f32* %432 = OpAccessChain %58 %24 
                                                      OpStore %432 %431 
                                Private f32* %433 = OpAccessChain %58 %24 
                                         f32 %434 = OpLoad %433 
                                Private f32* %435 = OpAccessChain %182 %24 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFNegate %436 
                                         f32 %438 = OpFMul %434 %437 
                                Private f32* %439 = OpAccessChain %182 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFAdd %438 %440 
                                Private f32* %442 = OpAccessChain %182 %24 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %182 %24 
                                         f32 %444 = OpLoad %443 
                                Private f32* %445 = OpAccessChain %9 %24 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                         f32 %448 = OpFMul %444 %447 
                                Private f32* %449 = OpAccessChain %9 %24 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFAdd %448 %450 
                                Private f32* %452 = OpAccessChain %9 %24 
                                                      OpStore %452 %451 
                                Private f32* %453 = OpAccessChain %9 %24 
                                         f32 %454 = OpLoad %453 
                                Uniform f32* %455 = OpAccessChain %13 %402 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFMul %454 %456 
                                Private f32* %458 = OpAccessChain %9 %24 
                                                      OpStore %458 %457 
                                       f32_3 %459 = OpLoad %32 
                                       f32_3 %460 = OpFNegate %459 
                              Uniform f32_4* %462 = OpAccessChain %13 %461 
                                       f32_4 %463 = OpLoad %462 
                                       f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
                                       f32_3 %465 = OpFAdd %460 %464 
                                                      OpStore %182 %465 
                                Uniform f32* %467 = OpAccessChain %13 %466 
                                         f32 %468 = OpLoad %467 
                                Uniform f32* %469 = OpAccessChain %13 %466 
                                         f32 %470 = OpLoad %469 
                                Uniform f32* %471 = OpAccessChain %13 %466 
                                         f32 %472 = OpLoad %471 
                                       f32_3 %473 = OpCompositeConstruct %468 %470 %472 
                                         f32 %474 = OpCompositeExtract %473 0 
                                         f32 %475 = OpCompositeExtract %473 1 
                                         f32 %476 = OpCompositeExtract %473 2 
                                       f32_3 %477 = OpCompositeConstruct %474 %475 %476 
                                       f32_3 %478 = OpLoad %182 
                                       f32_3 %479 = OpFMul %477 %478 
                                       f32_3 %480 = OpLoad %32 
                                       f32_3 %481 = OpFAdd %479 %480 
                                                      OpStore %182 %481 
                                       f32_3 %482 = OpLoad %182 
                                       f32_3 %483 = OpFNegate %482 
                              Uniform f32_4* %485 = OpAccessChain %13 %484 
                                       f32_4 %486 = OpLoad %485 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpFAdd %483 %487 
                                                      OpStore %32 %488 
                                       f32_3 %489 = OpLoad %9 
                                       f32_3 %490 = OpVectorShuffle %489 %489 0 0 0 
                                       f32_3 %491 = OpLoad %32 
                                       f32_3 %492 = OpFMul %490 %491 
                                       f32_3 %493 = OpLoad %182 
                                       f32_3 %494 = OpFAdd %492 %493 
                                                      OpStore %9 %494 
                                       f32_3 %495 = OpLoad %146 
                                       f32_3 %496 = OpFNegate %495 
                                       f32_3 %497 = OpLoad %9 
                                       f32_3 %498 = OpFAdd %496 %497 
                                                      OpStore %9 %498 
                                Uniform f32* %502 = OpAccessChain %13 %501 
                                         f32 %503 = OpLoad %502 
                                Uniform f32* %504 = OpAccessChain %13 %501 
                                         f32 %505 = OpLoad %504 
                                Uniform f32* %506 = OpAccessChain %13 %501 
                                         f32 %507 = OpLoad %506 
                                       f32_3 %508 = OpCompositeConstruct %503 %505 %507 
                                         f32 %509 = OpCompositeExtract %508 0 
                                         f32 %510 = OpCompositeExtract %508 1 
                                         f32 %511 = OpCompositeExtract %508 2 
                                       f32_3 %512 = OpCompositeConstruct %509 %510 %511 
                                       f32_3 %513 = OpLoad %9 
                                       f32_3 %514 = OpFMul %512 %513 
                                       f32_3 %515 = OpLoad %146 
                                       f32_3 %516 = OpFAdd %514 %515 
                                       f32_4 %517 = OpLoad %500 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 6 3 
                                                      OpStore %500 %518 
                                 Output f32* %521 = OpAccessChain %500 %519 
                                                      OpStore %521 %160 
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