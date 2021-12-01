//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_CellShading" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_EdgeSize ("_EdgeSize", Range(0, 1)) = 0
_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 29511
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
uniform 	float _EdgeSize;
uniform 	float _ColorLevel;
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
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec3 u_xlat15;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat1 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 0.0, 1.0);
    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat3 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 1.0, 0.0);
    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
    u_xlat4 = texture(_MainTex, u_xlat3.zw);
    u_xlat3 = texture(_MainTex, u_xlat3.xy);
    u_xlat5 = u_xlat2 + u_xlat4;
    u_xlat6 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 2.0, 1.0, -2.0);
    u_xlat6 = u_xlat6 / _ScreenResolution.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.zw);
    u_xlat6 = texture(_MainTex, u_xlat6.xy);
    u_xlat5 = u_xlat5 + u_xlat7;
    u_xlat7.xy = u_xlat0.zw * _ScreenResolution.xy;
    u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
    u_xlat7 = texture(_MainTex, u_xlat7.xy);
    u_xlat5 = u_xlat5 + u_xlat7;
    u_xlat8 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -1.0, -1.0, 1.0);
    u_xlat8 = u_xlat8 / _ScreenResolution.xyxy;
    u_xlat9 = texture(_MainTex, u_xlat8.xy);
    u_xlat8 = texture(_MainTex, u_xlat8.zw);
    u_xlat5 = u_xlat5 + u_xlat9;
    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -2.0, -1.0, -2.0);
    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
    u_xlat11 = texture(_MainTex, u_xlat10.xy);
    u_xlat10 = texture(_MainTex, u_xlat10.zw);
    u_xlat5 = u_xlat5 + u_xlat11;
    u_xlat11 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 0.0, -1.0, -1.0);
    u_xlat11 = u_xlat11 / _ScreenResolution.xyxy;
    u_xlat12 = texture(_MainTex, u_xlat11.xy);
    u_xlat11 = texture(_MainTex, u_xlat11.zw);
    u_xlat5 = u_xlat5 + u_xlat12;
    u_xlat5 = u_xlat11 + u_xlat5;
    u_xlat5 = u_xlat10 + u_xlat5;
    u_xlat5 = u_xlat5 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 2.0, 0.0, 2.0);
    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
    u_xlat13 = texture(_MainTex, u_xlat10.xy);
    u_xlat10 = texture(_MainTex, u_xlat10.zw);
    u_xlat13 = u_xlat3 + u_xlat13;
    u_xlat13 = u_xlat4 + u_xlat13;
    u_xlat10 = u_xlat10 + u_xlat13;
    u_xlat10 = u_xlat1 + u_xlat10;
    u_xlat10 = u_xlat7 + u_xlat10;
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat6 = u_xlat8 + u_xlat6;
    u_xlat6 = u_xlat12 + u_xlat6;
    u_xlat5 = u_xlat6 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat5);
    u_xlat6 = u_xlat1 + u_xlat7;
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat6 = u_xlat8 + u_xlat6;
    u_xlat6 = u_xlat12 + u_xlat6;
    u_xlat6 = u_xlat11 + u_xlat6;
    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, -1.0, -2.0, 1.0);
    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
    u_xlat13 = texture(_MainTex, u_xlat10.zw);
    u_xlat10 = texture(_MainTex, u_xlat10.xy);
    u_xlat6 = u_xlat6 + u_xlat13;
    u_xlat13 = u_xlat0 * _ScreenResolution.xyxy + vec4(-2.0, 0.0, -2.0, -1.0);
    u_xlat0 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, 1.0, 2.0, 0.0);
    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
    u_xlat14 = texture(_MainTex, u_xlat13.xy);
    u_xlat13 = texture(_MainTex, u_xlat13.zw);
    u_xlat6 = u_xlat6 + u_xlat14;
    u_xlat6 = u_xlat13 + u_xlat6;
    u_xlat6 = u_xlat6 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
    u_xlat13 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat13;
    u_xlat0 = u_xlat10 + u_xlat0;
    u_xlat0 = u_xlat3 + u_xlat0;
    u_xlat3 = u_xlat4 + u_xlat3;
    u_xlat0 = u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat2 + u_xlat0;
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat7 + u_xlat0;
    u_xlat1 = u_xlat7 + u_xlat2;
    u_xlat1 = u_xlat9 + u_xlat1;
    u_xlat0 = u_xlat9 + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat6);
    u_xlat0 = abs(u_xlat0) + abs(u_xlat5);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0.x = dot(u_xlat0, u_xlat0);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat1 = u_xlat12 + u_xlat1;
    u_xlat1 = u_xlat11 + u_xlat1;
    u_xlat15.x = _EdgeSize + 0.0500000007;
    u_xlatb0 = u_xlat15.x<u_xlat0.x;
    u_xlat15.xyz = u_xlat1.xyz * vec3(0.777777791, 0.777777791, 0.777777791);
    SV_Target0.w = u_xlat1.w * 0.111111112;
    u_xlat15.xyz = floor(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz / vec3(vec3(_ColorLevel, _ColorLevel, _ColorLevel));
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat15.xyz;
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
; Bound: 542
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %12 %507 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 12 
                                                  OpMemberDecorate %15 0 Offset 15 
                                                  OpMemberDecorate %15 1 Offset 15 
                                                  OpMemberDecorate %15 2 Offset 15 
                                                  OpMemberDecorate %15 3 Offset 15 
                                                  OpDecorate %15 Block 
                                                  OpDecorate %17 DescriptorSet 17 
                                                  OpDecorate %17 Binding 17 
                                                  OpDecorate %50 DescriptorSet 50 
                                                  OpDecorate %50 Binding 50 
                                                  OpDecorate %54 DescriptorSet 54 
                                                  OpDecorate %54 Binding 54 
                                                  OpDecorate %507 Location 507 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 2 
                                          %11 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          %15 = OpTypeStruct %7 %6 %6 %7 
                                          %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                          %18 = OpTypeInt 32 1 
                                      i32 %19 = OpConstant 3 
                                          %20 = OpTypePointer Uniform %7 
                           Private f32_4* %29 = OpVariable Private 
                                      i32 %32 = OpConstant 0 
                                      f32 %37 = OpConstant 3.674022E-40 
                                      f32 %38 = OpConstant 3.674022E-40 
                                      f32 %39 = OpConstant 3.674022E-40 
                                    f32_4 %40 = OpConstantComposite %37 %38 %39 %37 
                           Private f32_4* %47 = OpVariable Private 
                                          %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %49 = OpTypePointer UniformConstant %48 
     UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
                                          %52 = OpTypeSampler 
                                          %53 = OpTypePointer UniformConstant %52 
                 UniformConstant sampler* %54 = OpVariable UniformConstant 
                                          %56 = OpTypeSampledImage %48 
                           Private f32_4* %67 = OpVariable Private 
                                    f32_4 %74 = OpConstantComposite %37 %37 %37 %39 
                           Private f32_4* %81 = OpVariable Private 
                           Private f32_4* %94 = OpVariable Private 
                           Private f32_4* %98 = OpVariable Private 
                                     f32 %105 = OpConstant 3.674022E-40 
                                     f32 %106 = OpConstant 3.674022E-40 
                                   f32_4 %107 = OpConstantComposite %38 %105 %37 %106 
                          Private f32_4* %114 = OpVariable Private 
                          Private f32_4* %155 = OpVariable Private 
                                   f32_4 %162 = OpConstantComposite %39 %38 %38 %37 
                          Private f32_4* %169 = OpVariable Private 
                          Private f32_4* %185 = OpVariable Private 
                                   f32_4 %192 = OpConstantComposite %39 %106 %38 %106 
                          Private f32_4* %199 = OpVariable Private 
                                   f32_4 %221 = OpConstantComposite %38 %39 %38 %38 
                          Private f32_4* %228 = OpVariable Private 
                                     f32 %251 = OpConstant 3.674022E-40 
                                   f32_4 %252 = OpConstantComposite %251 %251 %251 %251 
                                   f32_4 %260 = OpConstantComposite %37 %105 %39 %105 
                          Private f32_4* %267 = OpVariable Private 
                                   f32_4 %330 = OpConstantComposite %105 %38 %106 %37 
                                   f32_4 %357 = OpConstantComposite %106 %39 %106 %38 
                                   f32_4 %365 = OpConstantComposite %105 %37 %105 %39 
                          Private f32_4* %377 = OpVariable Private 
                                     f32 %460 = OpConstant 3.674022E-40 
                                   f32_4 %461 = OpConstantComposite %460 %460 %460 %460 
                                         %466 = OpTypeInt 32 0 
                                     u32 %467 = OpConstant 0 
                                         %468 = OpTypePointer Private %6 
                                         %483 = OpTypeVector %6 3 
                                         %484 = OpTypePointer Private %483 
                          Private f32_3* %485 = OpVariable Private 
                                     i32 %486 = OpConstant 1 
                                         %487 = OpTypePointer Uniform %6 
                                     f32 %490 = OpConstant 3.674022E-40 
                                         %493 = OpTypeBool 
                                         %494 = OpTypePointer Private %493 
                           Private bool* %495 = OpVariable Private 
                                     f32 %503 = OpConstant 3.674022E-40 
                                   f32_3 %504 = OpConstantComposite %503 %503 %503 
                                         %506 = OpTypePointer Output %7 
                           Output f32_4* %507 = OpVariable Output 
                                     u32 %508 = OpConstant 3 
                                         %512 = OpTypePointer Output %6 
                                     i32 %517 = OpConstant 2 
                                         %531 = OpTypePointer Function %483 
                                   f32_3 %535 = OpConstantComposite %39 %39 %39 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                         Function f32_3* %532 = OpVariable Function 
                                    f32_2 %13 = OpLoad vs_TEXCOORD0 
                                    f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                           Uniform f32_4* %21 = OpAccessChain %17 %19 
                                    f32_4 %22 = OpLoad %21 
                                    f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
                                    f32_4 %24 = OpFMul %14 %23 
                           Uniform f32_4* %25 = OpAccessChain %17 %19 
                                    f32_4 %26 = OpLoad %25 
                                    f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
                                    f32_4 %28 = OpFAdd %24 %27 
                                                  OpStore %9 %28 
                                    f32_4 %30 = OpLoad %9 
                                    f32_4 %31 = OpVectorShuffle %30 %30 2 3 2 3 
                           Uniform f32_4* %33 = OpAccessChain %17 %32 
                                    f32_4 %34 = OpLoad %33 
                                    f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
                                    f32_4 %36 = OpFMul %31 %35 
                                    f32_4 %41 = OpFAdd %36 %40 
                                                  OpStore %29 %41 
                                    f32_4 %42 = OpLoad %29 
                           Uniform f32_4* %43 = OpAccessChain %17 %32 
                                    f32_4 %44 = OpLoad %43 
                                    f32_4 %45 = OpVectorShuffle %44 %44 0 1 0 1 
                                    f32_4 %46 = OpFDiv %42 %45 
                                                  OpStore %29 %46 
                      read_only Texture2D %51 = OpLoad %50 
                                  sampler %55 = OpLoad %54 
               read_only Texture2DSampled %57 = OpSampledImage %51 %55 
                                    f32_4 %58 = OpLoad %29 
                                    f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                    f32_4 %60 = OpImageSampleImplicitLod %57 %59 
                                                  OpStore %47 %60 
                      read_only Texture2D %61 = OpLoad %50 
                                  sampler %62 = OpLoad %54 
               read_only Texture2DSampled %63 = OpSampledImage %61 %62 
                                    f32_4 %64 = OpLoad %29 
                                    f32_2 %65 = OpVectorShuffle %64 %64 2 3 
                                    f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                                                  OpStore %29 %66 
                                    f32_4 %68 = OpLoad %9 
                                    f32_4 %69 = OpVectorShuffle %68 %68 2 3 2 3 
                           Uniform f32_4* %70 = OpAccessChain %17 %32 
                                    f32_4 %71 = OpLoad %70 
                                    f32_4 %72 = OpVectorShuffle %71 %71 0 1 0 1 
                                    f32_4 %73 = OpFMul %69 %72 
                                    f32_4 %75 = OpFAdd %73 %74 
                                                  OpStore %67 %75 
                                    f32_4 %76 = OpLoad %67 
                           Uniform f32_4* %77 = OpAccessChain %17 %32 
                                    f32_4 %78 = OpLoad %77 
                                    f32_4 %79 = OpVectorShuffle %78 %78 0 1 0 1 
                                    f32_4 %80 = OpFDiv %76 %79 
                                                  OpStore %67 %80 
                      read_only Texture2D %82 = OpLoad %50 
                                  sampler %83 = OpLoad %54 
               read_only Texture2DSampled %84 = OpSampledImage %82 %83 
                                    f32_4 %85 = OpLoad %67 
                                    f32_2 %86 = OpVectorShuffle %85 %85 2 3 
                                    f32_4 %87 = OpImageSampleImplicitLod %84 %86 
                                                  OpStore %81 %87 
                      read_only Texture2D %88 = OpLoad %50 
                                  sampler %89 = OpLoad %54 
               read_only Texture2DSampled %90 = OpSampledImage %88 %89 
                                    f32_4 %91 = OpLoad %67 
                                    f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                    f32_4 %93 = OpImageSampleImplicitLod %90 %92 
                                                  OpStore %67 %93 
                                    f32_4 %95 = OpLoad %47 
                                    f32_4 %96 = OpLoad %81 
                                    f32_4 %97 = OpFAdd %95 %96 
                                                  OpStore %94 %97 
                                    f32_4 %99 = OpLoad %9 
                                   f32_4 %100 = OpVectorShuffle %99 %99 2 3 2 3 
                          Uniform f32_4* %101 = OpAccessChain %17 %32 
                                   f32_4 %102 = OpLoad %101 
                                   f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                                   f32_4 %104 = OpFMul %100 %103 
                                   f32_4 %108 = OpFAdd %104 %107 
                                                  OpStore %98 %108 
                                   f32_4 %109 = OpLoad %98 
                          Uniform f32_4* %110 = OpAccessChain %17 %32 
                                   f32_4 %111 = OpLoad %110 
                                   f32_4 %112 = OpVectorShuffle %111 %111 0 1 0 1 
                                   f32_4 %113 = OpFDiv %109 %112 
                                                  OpStore %98 %113 
                     read_only Texture2D %115 = OpLoad %50 
                                 sampler %116 = OpLoad %54 
              read_only Texture2DSampled %117 = OpSampledImage %115 %116 
                                   f32_4 %118 = OpLoad %98 
                                   f32_2 %119 = OpVectorShuffle %118 %118 2 3 
                                   f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                                  OpStore %114 %120 
                     read_only Texture2D %121 = OpLoad %50 
                                 sampler %122 = OpLoad %54 
              read_only Texture2DSampled %123 = OpSampledImage %121 %122 
                                   f32_4 %124 = OpLoad %98 
                                   f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                   f32_4 %126 = OpImageSampleImplicitLod %123 %125 
                                                  OpStore %98 %126 
                                   f32_4 %127 = OpLoad %94 
                                   f32_4 %128 = OpLoad %114 
                                   f32_4 %129 = OpFAdd %127 %128 
                                                  OpStore %94 %129 
                                   f32_4 %130 = OpLoad %9 
                                   f32_2 %131 = OpVectorShuffle %130 %130 2 3 
                          Uniform f32_4* %132 = OpAccessChain %17 %32 
                                   f32_4 %133 = OpLoad %132 
                                   f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                   f32_2 %135 = OpFMul %131 %134 
                                   f32_4 %136 = OpLoad %114 
                                   f32_4 %137 = OpVectorShuffle %136 %135 4 5 2 3 
                                                  OpStore %114 %137 
                                   f32_4 %138 = OpLoad %114 
                                   f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                          Uniform f32_4* %140 = OpAccessChain %17 %32 
                                   f32_4 %141 = OpLoad %140 
                                   f32_2 %142 = OpVectorShuffle %141 %141 0 1 
                                   f32_2 %143 = OpFDiv %139 %142 
                                   f32_4 %144 = OpLoad %114 
                                   f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                  OpStore %114 %145 
                     read_only Texture2D %146 = OpLoad %50 
                                 sampler %147 = OpLoad %54 
              read_only Texture2DSampled %148 = OpSampledImage %146 %147 
                                   f32_4 %149 = OpLoad %114 
                                   f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                   f32_4 %151 = OpImageSampleImplicitLod %148 %150 
                                                  OpStore %114 %151 
                                   f32_4 %152 = OpLoad %94 
                                   f32_4 %153 = OpLoad %114 
                                   f32_4 %154 = OpFAdd %152 %153 
                                                  OpStore %94 %154 
                                   f32_4 %156 = OpLoad %9 
                                   f32_4 %157 = OpVectorShuffle %156 %156 2 3 2 3 
                          Uniform f32_4* %158 = OpAccessChain %17 %32 
                                   f32_4 %159 = OpLoad %158 
                                   f32_4 %160 = OpVectorShuffle %159 %159 0 1 0 1 
                                   f32_4 %161 = OpFMul %157 %160 
                                   f32_4 %163 = OpFAdd %161 %162 
                                                  OpStore %155 %163 
                                   f32_4 %164 = OpLoad %155 
                          Uniform f32_4* %165 = OpAccessChain %17 %32 
                                   f32_4 %166 = OpLoad %165 
                                   f32_4 %167 = OpVectorShuffle %166 %166 0 1 0 1 
                                   f32_4 %168 = OpFDiv %164 %167 
                                                  OpStore %155 %168 
                     read_only Texture2D %170 = OpLoad %50 
                                 sampler %171 = OpLoad %54 
              read_only Texture2DSampled %172 = OpSampledImage %170 %171 
                                   f32_4 %173 = OpLoad %155 
                                   f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                                   f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                                  OpStore %169 %175 
                     read_only Texture2D %176 = OpLoad %50 
                                 sampler %177 = OpLoad %54 
              read_only Texture2DSampled %178 = OpSampledImage %176 %177 
                                   f32_4 %179 = OpLoad %155 
                                   f32_2 %180 = OpVectorShuffle %179 %179 2 3 
                                   f32_4 %181 = OpImageSampleImplicitLod %178 %180 
                                                  OpStore %155 %181 
                                   f32_4 %182 = OpLoad %94 
                                   f32_4 %183 = OpLoad %169 
                                   f32_4 %184 = OpFAdd %182 %183 
                                                  OpStore %94 %184 
                                   f32_4 %186 = OpLoad %9 
                                   f32_4 %187 = OpVectorShuffle %186 %186 2 3 2 3 
                          Uniform f32_4* %188 = OpAccessChain %17 %32 
                                   f32_4 %189 = OpLoad %188 
                                   f32_4 %190 = OpVectorShuffle %189 %189 0 1 0 1 
                                   f32_4 %191 = OpFMul %187 %190 
                                   f32_4 %193 = OpFAdd %191 %192 
                                                  OpStore %185 %193 
                                   f32_4 %194 = OpLoad %185 
                          Uniform f32_4* %195 = OpAccessChain %17 %32 
                                   f32_4 %196 = OpLoad %195 
                                   f32_4 %197 = OpVectorShuffle %196 %196 0 1 0 1 
                                   f32_4 %198 = OpFDiv %194 %197 
                                                  OpStore %185 %198 
                     read_only Texture2D %200 = OpLoad %50 
                                 sampler %201 = OpLoad %54 
              read_only Texture2DSampled %202 = OpSampledImage %200 %201 
                                   f32_4 %203 = OpLoad %185 
                                   f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                   f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                  OpStore %199 %205 
                     read_only Texture2D %206 = OpLoad %50 
                                 sampler %207 = OpLoad %54 
              read_only Texture2DSampled %208 = OpSampledImage %206 %207 
                                   f32_4 %209 = OpLoad %185 
                                   f32_2 %210 = OpVectorShuffle %209 %209 2 3 
                                   f32_4 %211 = OpImageSampleImplicitLod %208 %210 
                                                  OpStore %185 %211 
                                   f32_4 %212 = OpLoad %94 
                                   f32_4 %213 = OpLoad %199 
                                   f32_4 %214 = OpFAdd %212 %213 
                                                  OpStore %94 %214 
                                   f32_4 %215 = OpLoad %9 
                                   f32_4 %216 = OpVectorShuffle %215 %215 2 3 2 3 
                          Uniform f32_4* %217 = OpAccessChain %17 %32 
                                   f32_4 %218 = OpLoad %217 
                                   f32_4 %219 = OpVectorShuffle %218 %218 0 1 0 1 
                                   f32_4 %220 = OpFMul %216 %219 
                                   f32_4 %222 = OpFAdd %220 %221 
                                                  OpStore %199 %222 
                                   f32_4 %223 = OpLoad %199 
                          Uniform f32_4* %224 = OpAccessChain %17 %32 
                                   f32_4 %225 = OpLoad %224 
                                   f32_4 %226 = OpVectorShuffle %225 %225 0 1 0 1 
                                   f32_4 %227 = OpFDiv %223 %226 
                                                  OpStore %199 %227 
                     read_only Texture2D %229 = OpLoad %50 
                                 sampler %230 = OpLoad %54 
              read_only Texture2DSampled %231 = OpSampledImage %229 %230 
                                   f32_4 %232 = OpLoad %199 
                                   f32_2 %233 = OpVectorShuffle %232 %232 0 1 
                                   f32_4 %234 = OpImageSampleImplicitLod %231 %233 
                                                  OpStore %228 %234 
                     read_only Texture2D %235 = OpLoad %50 
                                 sampler %236 = OpLoad %54 
              read_only Texture2DSampled %237 = OpSampledImage %235 %236 
                                   f32_4 %238 = OpLoad %199 
                                   f32_2 %239 = OpVectorShuffle %238 %238 2 3 
                                   f32_4 %240 = OpImageSampleImplicitLod %237 %239 
                                                  OpStore %199 %240 
                                   f32_4 %241 = OpLoad %94 
                                   f32_4 %242 = OpLoad %228 
                                   f32_4 %243 = OpFAdd %241 %242 
                                                  OpStore %94 %243 
                                   f32_4 %244 = OpLoad %199 
                                   f32_4 %245 = OpLoad %94 
                                   f32_4 %246 = OpFAdd %244 %245 
                                                  OpStore %94 %246 
                                   f32_4 %247 = OpLoad %185 
                                   f32_4 %248 = OpLoad %94 
                                   f32_4 %249 = OpFAdd %247 %248 
                                                  OpStore %94 %249 
                                   f32_4 %250 = OpLoad %94 
                                   f32_4 %253 = OpFMul %250 %252 
                                                  OpStore %94 %253 
                                   f32_4 %254 = OpLoad %9 
                                   f32_4 %255 = OpVectorShuffle %254 %254 2 3 2 3 
                          Uniform f32_4* %256 = OpAccessChain %17 %32 
                                   f32_4 %257 = OpLoad %256 
                                   f32_4 %258 = OpVectorShuffle %257 %257 0 1 0 1 
                                   f32_4 %259 = OpFMul %255 %258 
                                   f32_4 %261 = OpFAdd %259 %260 
                                                  OpStore %185 %261 
                                   f32_4 %262 = OpLoad %185 
                          Uniform f32_4* %263 = OpAccessChain %17 %32 
                                   f32_4 %264 = OpLoad %263 
                                   f32_4 %265 = OpVectorShuffle %264 %264 0 1 0 1 
                                   f32_4 %266 = OpFDiv %262 %265 
                                                  OpStore %185 %266 
                     read_only Texture2D %268 = OpLoad %50 
                                 sampler %269 = OpLoad %54 
              read_only Texture2DSampled %270 = OpSampledImage %268 %269 
                                   f32_4 %271 = OpLoad %185 
                                   f32_2 %272 = OpVectorShuffle %271 %271 0 1 
                                   f32_4 %273 = OpImageSampleImplicitLod %270 %272 
                                                  OpStore %267 %273 
                     read_only Texture2D %274 = OpLoad %50 
                                 sampler %275 = OpLoad %54 
              read_only Texture2DSampled %276 = OpSampledImage %274 %275 
                                   f32_4 %277 = OpLoad %185 
                                   f32_2 %278 = OpVectorShuffle %277 %277 2 3 
                                   f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                                  OpStore %185 %279 
                                   f32_4 %280 = OpLoad %67 
                                   f32_4 %281 = OpLoad %267 
                                   f32_4 %282 = OpFAdd %280 %281 
                                                  OpStore %267 %282 
                                   f32_4 %283 = OpLoad %81 
                                   f32_4 %284 = OpLoad %267 
                                   f32_4 %285 = OpFAdd %283 %284 
                                                  OpStore %267 %285 
                                   f32_4 %286 = OpLoad %185 
                                   f32_4 %287 = OpLoad %267 
                                   f32_4 %288 = OpFAdd %286 %287 
                                                  OpStore %185 %288 
                                   f32_4 %289 = OpLoad %29 
                                   f32_4 %290 = OpLoad %185 
                                   f32_4 %291 = OpFAdd %289 %290 
                                                  OpStore %185 %291 
                                   f32_4 %292 = OpLoad %114 
                                   f32_4 %293 = OpLoad %185 
                                   f32_4 %294 = OpFAdd %292 %293 
                                                  OpStore %185 %294 
                                   f32_4 %295 = OpLoad %98 
                                   f32_4 %296 = OpLoad %185 
                                   f32_4 %297 = OpFAdd %295 %296 
                                                  OpStore %98 %297 
                                   f32_4 %298 = OpLoad %155 
                                   f32_4 %299 = OpLoad %98 
                                   f32_4 %300 = OpFAdd %298 %299 
                                                  OpStore %98 %300 
                                   f32_4 %301 = OpLoad %228 
                                   f32_4 %302 = OpLoad %98 
                                   f32_4 %303 = OpFAdd %301 %302 
                                                  OpStore %98 %303 
                                   f32_4 %304 = OpLoad %98 
                                   f32_4 %305 = OpFMul %304 %252 
                                   f32_4 %306 = OpLoad %94 
                                   f32_4 %307 = OpFNegate %306 
                                   f32_4 %308 = OpFAdd %305 %307 
                                                  OpStore %94 %308 
                                   f32_4 %309 = OpLoad %29 
                                   f32_4 %310 = OpLoad %114 
                                   f32_4 %311 = OpFAdd %309 %310 
                                                  OpStore %98 %311 
                                   f32_4 %312 = OpLoad %169 
                                   f32_4 %313 = OpLoad %98 
                                   f32_4 %314 = OpFAdd %312 %313 
                                                  OpStore %98 %314 
                                   f32_4 %315 = OpLoad %155 
                                   f32_4 %316 = OpLoad %98 
                                   f32_4 %317 = OpFAdd %315 %316 
                                                  OpStore %98 %317 
                                   f32_4 %318 = OpLoad %228 
                                   f32_4 %319 = OpLoad %98 
                                   f32_4 %320 = OpFAdd %318 %319 
                                                  OpStore %98 %320 
                                   f32_4 %321 = OpLoad %199 
                                   f32_4 %322 = OpLoad %98 
                                   f32_4 %323 = OpFAdd %321 %322 
                                                  OpStore %98 %323 
                                   f32_4 %324 = OpLoad %9 
                                   f32_4 %325 = OpVectorShuffle %324 %324 2 3 2 3 
                          Uniform f32_4* %326 = OpAccessChain %17 %32 
                                   f32_4 %327 = OpLoad %326 
                                   f32_4 %328 = OpVectorShuffle %327 %327 0 1 0 1 
                                   f32_4 %329 = OpFMul %325 %328 
                                   f32_4 %331 = OpFAdd %329 %330 
                                                  OpStore %185 %331 
                                   f32_4 %332 = OpLoad %185 
                          Uniform f32_4* %333 = OpAccessChain %17 %32 
                                   f32_4 %334 = OpLoad %333 
                                   f32_4 %335 = OpVectorShuffle %334 %334 0 1 0 1 
                                   f32_4 %336 = OpFDiv %332 %335 
                                                  OpStore %185 %336 
                     read_only Texture2D %337 = OpLoad %50 
                                 sampler %338 = OpLoad %54 
              read_only Texture2DSampled %339 = OpSampledImage %337 %338 
                                   f32_4 %340 = OpLoad %185 
                                   f32_2 %341 = OpVectorShuffle %340 %340 2 3 
                                   f32_4 %342 = OpImageSampleImplicitLod %339 %341 
                                                  OpStore %267 %342 
                     read_only Texture2D %343 = OpLoad %50 
                                 sampler %344 = OpLoad %54 
              read_only Texture2DSampled %345 = OpSampledImage %343 %344 
                                   f32_4 %346 = OpLoad %185 
                                   f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                   f32_4 %348 = OpImageSampleImplicitLod %345 %347 
                                                  OpStore %185 %348 
                                   f32_4 %349 = OpLoad %98 
                                   f32_4 %350 = OpLoad %267 
                                   f32_4 %351 = OpFAdd %349 %350 
                                                  OpStore %98 %351 
                                   f32_4 %352 = OpLoad %9 
                          Uniform f32_4* %353 = OpAccessChain %17 %32 
                                   f32_4 %354 = OpLoad %353 
                                   f32_4 %355 = OpVectorShuffle %354 %354 0 1 0 1 
                                   f32_4 %356 = OpFMul %352 %355 
                                   f32_4 %358 = OpFAdd %356 %357 
                                                  OpStore %267 %358 
                                   f32_4 %359 = OpLoad %9 
                                   f32_4 %360 = OpVectorShuffle %359 %359 2 3 2 3 
                          Uniform f32_4* %361 = OpAccessChain %17 %32 
                                   f32_4 %362 = OpLoad %361 
                                   f32_4 %363 = OpVectorShuffle %362 %362 0 1 0 1 
                                   f32_4 %364 = OpFMul %360 %363 
                                   f32_4 %366 = OpFAdd %364 %365 
                                                  OpStore %9 %366 
                                   f32_4 %367 = OpLoad %9 
                          Uniform f32_4* %368 = OpAccessChain %17 %32 
                                   f32_4 %369 = OpLoad %368 
                                   f32_4 %370 = OpVectorShuffle %369 %369 0 1 0 1 
                                   f32_4 %371 = OpFDiv %367 %370 
                                                  OpStore %9 %371 
                                   f32_4 %372 = OpLoad %267 
                          Uniform f32_4* %373 = OpAccessChain %17 %32 
                                   f32_4 %374 = OpLoad %373 
                                   f32_4 %375 = OpVectorShuffle %374 %374 0 1 0 1 
                                   f32_4 %376 = OpFDiv %372 %375 
                                                  OpStore %267 %376 
                     read_only Texture2D %378 = OpLoad %50 
                                 sampler %379 = OpLoad %54 
              read_only Texture2DSampled %380 = OpSampledImage %378 %379 
                                   f32_4 %381 = OpLoad %267 
                                   f32_2 %382 = OpVectorShuffle %381 %381 0 1 
                                   f32_4 %383 = OpImageSampleImplicitLod %380 %382 
                                                  OpStore %377 %383 
                     read_only Texture2D %384 = OpLoad %50 
                                 sampler %385 = OpLoad %54 
              read_only Texture2DSampled %386 = OpSampledImage %384 %385 
                                   f32_4 %387 = OpLoad %267 
                                   f32_2 %388 = OpVectorShuffle %387 %387 2 3 
                                   f32_4 %389 = OpImageSampleImplicitLod %386 %388 
                                                  OpStore %267 %389 
                                   f32_4 %390 = OpLoad %98 
                                   f32_4 %391 = OpLoad %377 
                                   f32_4 %392 = OpFAdd %390 %391 
                                                  OpStore %98 %392 
                                   f32_4 %393 = OpLoad %267 
                                   f32_4 %394 = OpLoad %98 
                                   f32_4 %395 = OpFAdd %393 %394 
                                                  OpStore %98 %395 
                                   f32_4 %396 = OpLoad %98 
                                   f32_4 %397 = OpFMul %396 %252 
                                                  OpStore %98 %397 
                     read_only Texture2D %398 = OpLoad %50 
                                 sampler %399 = OpLoad %54 
              read_only Texture2DSampled %400 = OpSampledImage %398 %399 
                                   f32_4 %401 = OpLoad %9 
                                   f32_2 %402 = OpVectorShuffle %401 %401 0 1 
                                   f32_4 %403 = OpImageSampleImplicitLod %400 %402 
                                                  OpStore %267 %403 
                     read_only Texture2D %404 = OpLoad %50 
                                 sampler %405 = OpLoad %54 
              read_only Texture2DSampled %406 = OpSampledImage %404 %405 
                                   f32_4 %407 = OpLoad %9 
                                   f32_2 %408 = OpVectorShuffle %407 %407 2 3 
                                   f32_4 %409 = OpImageSampleImplicitLod %406 %408 
                                                  OpStore %9 %409 
                                   f32_4 %410 = OpLoad %9 
                                   f32_4 %411 = OpLoad %267 
                                   f32_4 %412 = OpFAdd %410 %411 
                                                  OpStore %9 %412 
                                   f32_4 %413 = OpLoad %185 
                                   f32_4 %414 = OpLoad %9 
                                   f32_4 %415 = OpFAdd %413 %414 
                                                  OpStore %9 %415 
                                   f32_4 %416 = OpLoad %67 
                                   f32_4 %417 = OpLoad %9 
                                   f32_4 %418 = OpFAdd %416 %417 
                                                  OpStore %9 %418 
                                   f32_4 %419 = OpLoad %81 
                                   f32_4 %420 = OpLoad %67 
                                   f32_4 %421 = OpFAdd %419 %420 
                                                  OpStore %67 %421 
                                   f32_4 %422 = OpLoad %81 
                                   f32_4 %423 = OpLoad %9 
                                   f32_4 %424 = OpFAdd %422 %423 
                                                  OpStore %9 %424 
                                   f32_4 %425 = OpLoad %47 
                                   f32_4 %426 = OpLoad %9 
                                   f32_4 %427 = OpFAdd %425 %426 
                                                  OpStore %9 %427 
                                   f32_4 %428 = OpLoad %47 
                                   f32_4 %429 = OpLoad %67 
                                   f32_4 %430 = OpFAdd %428 %429 
                                                  OpStore %47 %430 
                                   f32_4 %431 = OpLoad %29 
                                   f32_4 %432 = OpLoad %47 
                                   f32_4 %433 = OpFAdd %431 %432 
                                                  OpStore %47 %433 
                                   f32_4 %434 = OpLoad %29 
                                   f32_4 %435 = OpLoad %9 
                                   f32_4 %436 = OpFAdd %434 %435 
                                                  OpStore %9 %436 
                                   f32_4 %437 = OpLoad %114 
                                   f32_4 %438 = OpLoad %9 
                                   f32_4 %439 = OpFAdd %437 %438 
                                                  OpStore %9 %439 
                                   f32_4 %440 = OpLoad %114 
                                   f32_4 %441 = OpLoad %47 
                                   f32_4 %442 = OpFAdd %440 %441 
                                                  OpStore %29 %442 
                                   f32_4 %443 = OpLoad %169 
                                   f32_4 %444 = OpLoad %29 
                                   f32_4 %445 = OpFAdd %443 %444 
                                                  OpStore %29 %445 
                                   f32_4 %446 = OpLoad %169 
                                   f32_4 %447 = OpLoad %9 
                                   f32_4 %448 = OpFAdd %446 %447 
                                                  OpStore %9 %448 
                                   f32_4 %449 = OpLoad %9 
                                   f32_4 %450 = OpFMul %449 %252 
                                   f32_4 %451 = OpLoad %98 
                                   f32_4 %452 = OpFNegate %451 
                                   f32_4 %453 = OpFAdd %450 %452 
                                                  OpStore %9 %453 
                                   f32_4 %454 = OpLoad %9 
                                   f32_4 %455 = OpExtInst %1 4 %454 
                                   f32_4 %456 = OpLoad %94 
                                   f32_4 %457 = OpExtInst %1 4 %456 
                                   f32_4 %458 = OpFAdd %455 %457 
                                                  OpStore %9 %458 
                                   f32_4 %459 = OpLoad %9 
                                   f32_4 %462 = OpFMul %459 %461 
                                                  OpStore %9 %462 
                                   f32_4 %463 = OpLoad %9 
                                   f32_4 %464 = OpLoad %9 
                                     f32 %465 = OpDot %463 %464 
                            Private f32* %469 = OpAccessChain %9 %467 
                                                  OpStore %469 %465 
                            Private f32* %470 = OpAccessChain %9 %467 
                                     f32 %471 = OpLoad %470 
                                     f32 %472 = OpExtInst %1 31 %471 
                            Private f32* %473 = OpAccessChain %9 %467 
                                                  OpStore %473 %472 
                                   f32_4 %474 = OpLoad %155 
                                   f32_4 %475 = OpLoad %29 
                                   f32_4 %476 = OpFAdd %474 %475 
                                                  OpStore %29 %476 
                                   f32_4 %477 = OpLoad %228 
                                   f32_4 %478 = OpLoad %29 
                                   f32_4 %479 = OpFAdd %477 %478 
                                                  OpStore %29 %479 
                                   f32_4 %480 = OpLoad %199 
                                   f32_4 %481 = OpLoad %29 
                                   f32_4 %482 = OpFAdd %480 %481 
                                                  OpStore %29 %482 
                            Uniform f32* %488 = OpAccessChain %17 %486 
                                     f32 %489 = OpLoad %488 
                                     f32 %491 = OpFAdd %489 %490 
                            Private f32* %492 = OpAccessChain %485 %467 
                                                  OpStore %492 %491 
                            Private f32* %496 = OpAccessChain %485 %467 
                                     f32 %497 = OpLoad %496 
                            Private f32* %498 = OpAccessChain %9 %467 
                                     f32 %499 = OpLoad %498 
                                    bool %500 = OpFOrdLessThan %497 %499 
                                                  OpStore %495 %500 
                                   f32_4 %501 = OpLoad %29 
                                   f32_3 %502 = OpVectorShuffle %501 %501 0 1 2 
                                   f32_3 %505 = OpFMul %502 %504 
                                                  OpStore %485 %505 
                            Private f32* %509 = OpAccessChain %29 %508 
                                     f32 %510 = OpLoad %509 
                                     f32 %511 = OpFMul %510 %251 
                             Output f32* %513 = OpAccessChain %507 %508 
                                                  OpStore %513 %511 
                                   f32_3 %514 = OpLoad %485 
                                   f32_3 %515 = OpExtInst %1 8 %514 
                                                  OpStore %485 %515 
                                   f32_3 %516 = OpLoad %485 
                            Uniform f32* %518 = OpAccessChain %17 %517 
                                     f32 %519 = OpLoad %518 
                            Uniform f32* %520 = OpAccessChain %17 %517 
                                     f32 %521 = OpLoad %520 
                            Uniform f32* %522 = OpAccessChain %17 %517 
                                     f32 %523 = OpLoad %522 
                                   f32_3 %524 = OpCompositeConstruct %519 %521 %523 
                                     f32 %525 = OpCompositeExtract %524 0 
                                     f32 %526 = OpCompositeExtract %524 1 
                                     f32 %527 = OpCompositeExtract %524 2 
                                   f32_3 %528 = OpCompositeConstruct %525 %526 %527 
                                   f32_3 %529 = OpFDiv %516 %528 
                                                  OpStore %485 %529 
                                    bool %530 = OpLoad %495 
                                                  OpSelectionMerge %534 None 
                                                  OpBranchConditional %530 %533 %536 
                                         %533 = OpLabel 
                                                  OpStore %532 %535 
                                                  OpBranch %534 
                                         %536 = OpLabel 
                                   f32_3 %537 = OpLoad %485 
                                                  OpStore %532 %537 
                                                  OpBranch %534 
                                         %534 = OpLabel 
                                   f32_3 %538 = OpLoad %532 
                                   f32_4 %539 = OpLoad %507 
                                   f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                  OpStore %507 %540 
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