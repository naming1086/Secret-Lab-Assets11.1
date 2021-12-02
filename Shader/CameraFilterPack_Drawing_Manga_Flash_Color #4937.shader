//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Manga_Flash_Color" {
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
  GpuProgramID 35916
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
uniform 	float _Intensity;
uniform 	vec4 Color;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
bool u_xlatb3;
bool u_xlatb5;
vec2 u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.y = (-_Value3);
    u_xlat0.x = (-_Value4);
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat6.yx;
    u_xlat1 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6.x = u_xlat6.x * u_xlat9;
    u_xlat9 = u_xlat6.x * u_xlat6.x;
    u_xlat2.x = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat9 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat9 * u_xlat2.x + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat9 * u_xlat6.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat2.x = u_xlatb5 ? u_xlat2.x : float(0.0);
    u_xlat6.x = u_xlat6.x * u_xlat9 + u_xlat2.x;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat9 + u_xlat6.x;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb3 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat3.x = (u_xlatb3) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat3.x = _Value * 3.14159274 + u_xlat3.x;
    u_xlat6.x = _Value * 6.28318548;
    u_xlat3.x = u_xlat3.x / u_xlat6.x;
    u_xlat3.x = u_xlat3.x * 700.0;
    u_xlat3.y = _Value2 * _TimeX;
    u_xlat3.xy = floor(u_xlat3.xy);
    u_xlat6.x = u_xlat3.y / _Value2;
    u_xlat6.x = max(u_xlat6.x, 0.100000001);
    u_xlat0.y = u_xlat6.x * u_xlat3.x;
    u_xlat3.xy = u_xlat0.yx * vec2(0.00142857141, 1.41421354);
    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 0.699999988 + 0.300000012;
    u_xlat0.x = u_xlat0.x * 1.41421354 + (-u_xlat3.x);
    u_xlatb3 = u_xlat3.x<u_xlat3.y;
    u_xlat0.x = abs(u_xlat0.x);
    u_xlat0.x = u_xlatb3 ? u_xlat0.x : float(0.0);
    u_xlat0.x = u_xlat0.x * _Intensity;
    u_xlat2 = (-u_xlat1) + Color;
    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
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
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %32 %347 
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
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 32 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %347 Location 347 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %6 %10 %10 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 3 
                                              %16 = OpTypePointer Uniform %6 
                                              %20 = OpTypeInt 32 0 
                                          u32 %21 = OpConstant 1 
                                              %22 = OpTypePointer Private %6 
                                          i32 %24 = OpConstant 4 
                                          u32 %28 = OpConstant 0 
                               Private f32_2* %30 = OpVariable Private 
                                              %31 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %34 = OpConstant 7 
                                              %35 = OpTypePointer Uniform %10 
                                              %48 = OpTypePointer Private %10 
                               Private f32_4* %49 = OpVariable Private 
                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %51 = OpTypePointer UniformConstant %50 
         UniformConstant read_only Texture2D* %52 = OpVariable UniformConstant 
                                              %54 = OpTypeSampler 
                                              %55 = OpTypePointer UniformConstant %54 
                     UniformConstant sampler* %56 = OpVariable UniformConstant 
                                              %58 = OpTypeSampledImage %50 
                                          f32 %70 = OpConstant 3.674022E-40 
                                 Private f32* %75 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                          f32 %95 = OpConstant 3.674022E-40 
                                          f32 %97 = OpConstant 3.674022E-40 
                                         f32 %104 = OpConstant 3.674022E-40 
                                         f32 %111 = OpConstant 3.674022E-40 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %127 = OpConstant 3.674022E-40 
                                         f32 %129 = OpConstant 3.674022E-40 
                                             %132 = OpTypeBool 
                                             %133 = OpTypePointer Private %132 
                               Private bool* %134 = OpVariable Private 
                                             %143 = OpTypePointer Function %6 
                                         f32 %150 = OpConstant 3.674022E-40 
                               Private bool* %161 = OpVariable Private 
                                         f32 %169 = OpConstant 3.674022E-40 
                               Private bool* %199 = OpVariable Private 
                              Private f32_2* %209 = OpVariable Private 
                                         i32 %222 = OpConstant 1 
                                         f32 %225 = OpConstant 3.674022E-40 
                                         f32 %233 = OpConstant 3.674022E-40 
                                         f32 %244 = OpConstant 3.674022E-40 
                                         i32 %247 = OpConstant 2 
                                         i32 %250 = OpConstant 0 
                                         f32 %265 = OpConstant 3.674022E-40 
                                         f32 %276 = OpConstant 3.674022E-40 
                                         f32 %277 = OpConstant 3.674022E-40 
                                       f32_2 %278 = OpConstantComposite %276 %277 
                                         f32 %282 = OpConstant 3.674022E-40 
                                         f32 %283 = OpConstant 3.674022E-40 
                                       f32_2 %284 = OpConstantComposite %282 %283 
                                         f32 %293 = OpConstant 3.674022E-40 
                                         f32 %302 = OpConstant 3.674022E-40 
                                         f32 %304 = OpConstant 3.674022E-40 
                                         i32 %335 = OpConstant 5 
                                         i32 %342 = OpConstant 6 
                                             %346 = OpTypePointer Output %10 
                               Output f32_4* %347 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %144 = OpVariable Function 
                               Function f32* %211 = OpVariable Function 
                               Function f32* %325 = OpVariable Function 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                          f32 %19 = OpFNegate %18 
                                 Private f32* %23 = OpAccessChain %9 %21 
                                                      OpStore %23 %19 
                                 Uniform f32* %25 = OpAccessChain %13 %24 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpFNegate %26 
                                 Private f32* %29 = OpAccessChain %9 %28 
                                                      OpStore %29 %27 
                                        f32_2 %33 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %36 = OpAccessChain %13 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                        f32_2 %39 = OpFMul %33 %38 
                               Uniform f32_4* %40 = OpAccessChain %13 %34 
                                        f32_4 %41 = OpLoad %40 
                                        f32_2 %42 = OpVectorShuffle %41 %41 2 3 
                                        f32_2 %43 = OpFAdd %39 %42 
                                                      OpStore %30 %43 
                                        f32_2 %44 = OpLoad %9 
                                        f32_2 %45 = OpLoad %30 
                                        f32_2 %46 = OpVectorShuffle %45 %45 1 0 
                                        f32_2 %47 = OpFAdd %44 %46 
                                                      OpStore %9 %47 
                          read_only Texture2D %53 = OpLoad %52 
                                      sampler %57 = OpLoad %56 
                   read_only Texture2DSampled %59 = OpSampledImage %53 %57 
                                        f32_2 %60 = OpLoad %30 
                                        f32_4 %61 = OpImageSampleImplicitLod %59 %60 
                                                      OpStore %49 %61 
                                 Private f32* %62 = OpAccessChain %9 %21 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpExtInst %1 4 %63 
                                 Private f32* %65 = OpAccessChain %9 %28 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpExtInst %1 4 %66 
                                          f32 %68 = OpExtInst %1 40 %64 %67 
                                 Private f32* %69 = OpAccessChain %30 %28 
                                                      OpStore %69 %68 
                                 Private f32* %71 = OpAccessChain %30 %28 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFDiv %70 %72 
                                 Private f32* %74 = OpAccessChain %30 %28 
                                                      OpStore %74 %73 
                                 Private f32* %76 = OpAccessChain %9 %21 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpExtInst %1 4 %77 
                                 Private f32* %79 = OpAccessChain %9 %28 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpExtInst %1 4 %80 
                                          f32 %82 = OpExtInst %1 37 %78 %81 
                                                      OpStore %75 %82 
                                 Private f32* %83 = OpAccessChain %30 %28 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpLoad %75 
                                          f32 %86 = OpFMul %84 %85 
                                 Private f32* %87 = OpAccessChain %30 %28 
                                                      OpStore %87 %86 
                                 Private f32* %88 = OpAccessChain %30 %28 
                                          f32 %89 = OpLoad %88 
                                 Private f32* %90 = OpAccessChain %30 %28 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFMul %89 %91 
                                                      OpStore %75 %92 
                                          f32 %94 = OpLoad %75 
                                          f32 %96 = OpFMul %94 %95 
                                          f32 %98 = OpFAdd %96 %97 
                                 Private f32* %99 = OpAccessChain %93 %28 
                                                      OpStore %99 %98 
                                         f32 %100 = OpLoad %75 
                                Private f32* %101 = OpAccessChain %93 %28 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %100 %102 
                                         f32 %105 = OpFAdd %103 %104 
                                Private f32* %106 = OpAccessChain %93 %28 
                                                      OpStore %106 %105 
                                         f32 %107 = OpLoad %75 
                                Private f32* %108 = OpAccessChain %93 %28 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                         f32 %112 = OpFAdd %110 %111 
                                Private f32* %113 = OpAccessChain %93 %28 
                                                      OpStore %113 %112 
                                         f32 %114 = OpLoad %75 
                                Private f32* %115 = OpAccessChain %93 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %114 %116 
                                         f32 %119 = OpFAdd %117 %118 
                                                      OpStore %75 %119 
                                         f32 %120 = OpLoad %75 
                                Private f32* %121 = OpAccessChain %30 %28 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFMul %120 %122 
                                Private f32* %124 = OpAccessChain %93 %28 
                                                      OpStore %124 %123 
                                Private f32* %125 = OpAccessChain %93 %28 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %130 = OpFAdd %128 %129 
                                Private f32* %131 = OpAccessChain %93 %28 
                                                      OpStore %131 %130 
                                Private f32* %135 = OpAccessChain %9 %21 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpExtInst %1 4 %136 
                                Private f32* %138 = OpAccessChain %9 %28 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpExtInst %1 4 %139 
                                        bool %141 = OpFOrdLessThan %137 %140 
                                                      OpStore %134 %141 
                                        bool %142 = OpLoad %134 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %142 %145 %149 
                                             %145 = OpLabel 
                                Private f32* %147 = OpAccessChain %93 %28 
                                         f32 %148 = OpLoad %147 
                                                      OpStore %144 %148 
                                                      OpBranch %146 
                                             %149 = OpLabel 
                                                      OpStore %144 %150 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                         f32 %151 = OpLoad %144 
                                Private f32* %152 = OpAccessChain %93 %28 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %30 %28 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpLoad %75 
                                         f32 %156 = OpFMul %154 %155 
                                Private f32* %157 = OpAccessChain %93 %28 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %30 %28 
                                                      OpStore %160 %159 
                                Private f32* %162 = OpAccessChain %9 %21 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %9 %21 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFNegate %165 
                                        bool %167 = OpFOrdLessThan %163 %166 
                                                      OpStore %161 %167 
                                        bool %168 = OpLoad %161 
                                         f32 %170 = OpSelect %168 %169 %150 
                                                      OpStore %75 %170 
                                         f32 %171 = OpLoad %75 
                                Private f32* %172 = OpAccessChain %30 %28 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFAdd %171 %173 
                                Private f32* %175 = OpAccessChain %30 %28 
                                                      OpStore %175 %174 
                                Private f32* %176 = OpAccessChain %9 %21 
                                         f32 %177 = OpLoad %176 
                                Private f32* %178 = OpAccessChain %9 %28 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpExtInst %1 37 %177 %179 
                                                      OpStore %75 %180 
                                         f32 %181 = OpLoad %75 
                                         f32 %182 = OpLoad %75 
                                         f32 %183 = OpFNegate %182 
                                        bool %184 = OpFOrdLessThan %181 %183 
                                                      OpStore %161 %184 
                                Private f32* %185 = OpAccessChain %9 %21 
                                         f32 %186 = OpLoad %185 
                                Private f32* %187 = OpAccessChain %9 %28 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpExtInst %1 40 %186 %188 
                                Private f32* %190 = OpAccessChain %93 %28 
                                                      OpStore %190 %189 
                                       f32_2 %191 = OpLoad %9 
                                       f32_2 %192 = OpLoad %9 
                                         f32 %193 = OpDot %191 %192 
                                Private f32* %194 = OpAccessChain %9 %28 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %9 %28 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpExtInst %1 31 %196 
                                Private f32* %198 = OpAccessChain %9 %28 
                                                      OpStore %198 %197 
                                Private f32* %200 = OpAccessChain %93 %28 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %93 %28 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFNegate %203 
                                        bool %205 = OpFOrdGreaterThanEqual %201 %204 
                                                      OpStore %199 %205 
                                        bool %206 = OpLoad %199 
                                        bool %207 = OpLoad %161 
                                        bool %208 = OpLogicalAnd %206 %207 
                                                      OpStore %199 %208 
                                        bool %210 = OpLoad %199 
                                                      OpSelectionMerge %213 None 
                                                      OpBranchConditional %210 %212 %217 
                                             %212 = OpLabel 
                                Private f32* %214 = OpAccessChain %30 %28 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                                      OpStore %211 %216 
                                                      OpBranch %213 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %30 %28 
                                         f32 %219 = OpLoad %218 
                                                      OpStore %211 %219 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                         f32 %220 = OpLoad %211 
                                Private f32* %221 = OpAccessChain %209 %28 
                                                      OpStore %221 %220 
                                Uniform f32* %223 = OpAccessChain %13 %222 
                                         f32 %224 = OpLoad %223 
                                         f32 %226 = OpFMul %224 %225 
                                Private f32* %227 = OpAccessChain %209 %28 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFAdd %226 %228 
                                Private f32* %230 = OpAccessChain %209 %28 
                                                      OpStore %230 %229 
                                Uniform f32* %231 = OpAccessChain %13 %222 
                                         f32 %232 = OpLoad %231 
                                         f32 %234 = OpFMul %232 %233 
                                Private f32* %235 = OpAccessChain %30 %28 
                                                      OpStore %235 %234 
                                Private f32* %236 = OpAccessChain %209 %28 
                                         f32 %237 = OpLoad %236 
                                Private f32* %238 = OpAccessChain %30 %28 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFDiv %237 %239 
                                Private f32* %241 = OpAccessChain %209 %28 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %209 %28 
                                         f32 %243 = OpLoad %242 
                                         f32 %245 = OpFMul %243 %244 
                                Private f32* %246 = OpAccessChain %209 %28 
                                                      OpStore %246 %245 
                                Uniform f32* %248 = OpAccessChain %13 %247 
                                         f32 %249 = OpLoad %248 
                                Uniform f32* %251 = OpAccessChain %13 %250 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFMul %249 %252 
                                Private f32* %254 = OpAccessChain %209 %21 
                                                      OpStore %254 %253 
                                       f32_2 %255 = OpLoad %209 
                                       f32_2 %256 = OpExtInst %1 8 %255 
                                                      OpStore %209 %256 
                                Private f32* %257 = OpAccessChain %209 %21 
                                         f32 %258 = OpLoad %257 
                                Uniform f32* %259 = OpAccessChain %13 %247 
                                         f32 %260 = OpLoad %259 
                                         f32 %261 = OpFDiv %258 %260 
                                Private f32* %262 = OpAccessChain %30 %28 
                                                      OpStore %262 %261 
                                Private f32* %263 = OpAccessChain %30 %28 
                                         f32 %264 = OpLoad %263 
                                         f32 %266 = OpExtInst %1 40 %264 %265 
                                Private f32* %267 = OpAccessChain %30 %28 
                                                      OpStore %267 %266 
                                Private f32* %268 = OpAccessChain %30 %28 
                                         f32 %269 = OpLoad %268 
                                Private f32* %270 = OpAccessChain %209 %28 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFMul %269 %271 
                                Private f32* %273 = OpAccessChain %9 %21 
                                                      OpStore %273 %272 
                                       f32_2 %274 = OpLoad %9 
                                       f32_2 %275 = OpVectorShuffle %274 %274 1 0 
                                       f32_2 %279 = OpFMul %275 %278 
                                                      OpStore %209 %279 
                                       f32_2 %280 = OpLoad %209 
                                       f32_2 %281 = OpVectorShuffle %280 %280 0 0 
                                         f32 %285 = OpDot %281 %284 
                                Private f32* %286 = OpAccessChain %209 %28 
                                                      OpStore %286 %285 
                                Private f32* %287 = OpAccessChain %209 %28 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpExtInst %1 13 %288 
                                Private f32* %290 = OpAccessChain %209 %28 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %209 %28 
                                         f32 %292 = OpLoad %291 
                                         f32 %294 = OpFMul %292 %293 
                                Private f32* %295 = OpAccessChain %209 %28 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %209 %28 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 10 %297 
                                Private f32* %299 = OpAccessChain %209 %28 
                                                      OpStore %299 %298 
                                Private f32* %300 = OpAccessChain %209 %28 
                                         f32 %301 = OpLoad %300 
                                         f32 %303 = OpFMul %301 %302 
                                         f32 %305 = OpFAdd %303 %304 
                                Private f32* %306 = OpAccessChain %209 %28 
                                                      OpStore %306 %305 
                                Private f32* %307 = OpAccessChain %9 %28 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFMul %308 %277 
                                Private f32* %310 = OpAccessChain %209 %28 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %309 %312 
                                Private f32* %314 = OpAccessChain %9 %28 
                                                      OpStore %314 %313 
                                Private f32* %315 = OpAccessChain %209 %28 
                                         f32 %316 = OpLoad %315 
                                Private f32* %317 = OpAccessChain %209 %21 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdLessThan %316 %318 
                                                      OpStore %199 %319 
                                Private f32* %320 = OpAccessChain %9 %28 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 4 %321 
                                Private f32* %323 = OpAccessChain %9 %28 
                                                      OpStore %323 %322 
                                        bool %324 = OpLoad %199 
                                                      OpSelectionMerge %327 None 
                                                      OpBranchConditional %324 %326 %330 
                                             %326 = OpLabel 
                                Private f32* %328 = OpAccessChain %9 %28 
                                         f32 %329 = OpLoad %328 
                                                      OpStore %325 %329 
                                                      OpBranch %327 
                                             %330 = OpLabel 
                                                      OpStore %325 %150 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         f32 %331 = OpLoad %325 
                                Private f32* %332 = OpAccessChain %9 %28 
                                                      OpStore %332 %331 
                                Private f32* %333 = OpAccessChain %9 %28 
                                         f32 %334 = OpLoad %333 
                                Uniform f32* %336 = OpAccessChain %13 %335 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpFMul %334 %337 
                                Private f32* %339 = OpAccessChain %9 %28 
                                                      OpStore %339 %338 
                                       f32_4 %340 = OpLoad %49 
                                       f32_4 %341 = OpFNegate %340 
                              Uniform f32_4* %343 = OpAccessChain %13 %342 
                                       f32_4 %344 = OpLoad %343 
                                       f32_4 %345 = OpFAdd %341 %344 
                                                      OpStore %93 %345 
                                       f32_2 %348 = OpLoad %9 
                                       f32_4 %349 = OpVectorShuffle %348 %348 0 0 0 0 
                                       f32_4 %350 = OpLoad %93 
                                       f32_4 %351 = OpFMul %349 %350 
                                       f32_4 %352 = OpLoad %49 
                                       f32_4 %353 = OpFAdd %351 %352 
                                                      OpStore %347 %353 
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