//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Oculus_NightVision1" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(1, 10)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Vignette ("_Vignette", Range(0, 100)) = 1.5
_Linecount ("_Linecount", Range(1, 150)) = 90
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 13541
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
uniform 	float _Vignette;
uniform 	float _Linecount;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat0.y * _Linecount;
    u_xlat1.x = floor(u_xlat12);
    u_xlat0.z = u_xlat1.x / _Linecount;
    u_xlat1.xy = vec2(_TimeX) * vec2(9.0, 7.0) + u_xlat0.xz;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat5.xy = u_xlat1.xx * vec2(0.0100000007, 0.0) + u_xlat0.xz;
    u_xlat8 = u_xlat1.x * 0.300000012 + 0.699999988;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = abs(u_xlat0.xy) * vec2(_Vignette);
    u_xlat1 = texture(_MainTex, u_xlat5.xy);
    u_xlat1.x = dot(u_xlat1.xyz, vec3(0.200000003, 0.5, 0.300000012));
    u_xlat5.x = (-u_xlat1.x) * u_xlat8 + 1.0;
    u_xlat8 = u_xlat8 * u_xlat1.x;
    u_xlat1.x = u_xlat5.x * 2.0 + 0.5;
    u_xlatb5 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb5) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * 2.0 + -1.0;
    u_xlat12 = -abs(u_xlat12) + 1.0;
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = exp2(u_xlat12);
    u_xlat8 = u_xlat8 * u_xlat12;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat12 = (-u_xlat8) * 2.0 + 1.0;
    u_xlat1 = vec4(u_xlat8) * vec4(0.400000006, 1.0, 0.200000003, 2.0);
    u_xlat1 = vec4(u_xlat12) * vec4(0.0, 0.100000001, 0.0, 1.0) + u_xlat1;
    u_xlat12 = u_xlat8 * 2.0 + -1.0;
    u_xlatb8 = u_xlat8<0.5;
    u_xlat2.x = (-u_xlat12) + 1.0;
    u_xlat3 = vec4(u_xlat12) * vec4(0.899999976, 1.0, 0.600000024, 1.0);
    u_xlat2 = u_xlat2.xxxx * vec4(0.200000003, 0.5, 0.100000001, 1.0) + u_xlat3;
    u_xlat1 = (bool(u_xlatb8)) ? u_xlat1 : u_xlat2;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat0.y) * u_xlat0.y + u_xlat0.x;
    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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
; Bound: 263
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %12 %257 
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
                                                OpDecorate %70 DescriptorSet 70 
                                                OpDecorate %70 Binding 70 
                                                OpDecorate %74 DescriptorSet 74 
                                                OpDecorate %74 Binding 74 
                                                OpDecorate %257 Location 257 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 3 
                                         %8 = OpTypePointer Private %7 
                          Private f32_3* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 2 
                                        %11 = OpTypePointer Input %10 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %14 = OpTypeVector %6 4 
                                        %15 = OpTypeStruct %6 %6 %6 %14 
                                        %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                        %18 = OpTypeInt 32 1 
                                    i32 %19 = OpConstant 3 
                                        %20 = OpTypePointer Uniform %14 
                                        %31 = OpTypePointer Private %6 
                           Private f32* %32 = OpVariable Private 
                                        %33 = OpTypeInt 32 0 
                                    u32 %34 = OpConstant 1 
                                    i32 %37 = OpConstant 2 
                                        %38 = OpTypePointer Uniform %6 
                                        %42 = OpTypePointer Private %14 
                         Private f32_4* %43 = OpVariable Private 
                                    u32 %46 = OpConstant 0 
                                    u32 %53 = OpConstant 2 
                                    i32 %55 = OpConstant 0 
                                    f32 %59 = OpConstant 3.674022E-40 
                                    f32 %60 = OpConstant 3.674022E-40 
                                  f32_2 %61 = OpConstantComposite %59 %60 
                                        %68 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %69 = OpTypePointer UniformConstant %68 
   UniformConstant read_only Texture2D* %70 = OpVariable UniformConstant 
                                        %72 = OpTypeSampler 
                                        %73 = OpTypePointer UniformConstant %72 
               UniformConstant sampler* %74 = OpVariable UniformConstant 
                                        %76 = OpTypeSampledImage %68 
                                        %83 = OpTypePointer Private %10 
                         Private f32_2* %84 = OpVariable Private 
                                    f32 %87 = OpConstant 3.674022E-40 
                                    f32 %88 = OpConstant 3.674022E-40 
                                  f32_2 %89 = OpConstantComposite %87 %88 
                           Private f32* %94 = OpVariable Private 
                                    f32 %97 = OpConstant 3.674022E-40 
                                    f32 %99 = OpConstant 3.674022E-40 
                                   f32 %103 = OpConstant 3.674022E-40 
                                 f32_2 %104 = OpConstantComposite %103 %103 
                                   i32 %111 = OpConstant 1 
                                   f32 %128 = OpConstant 3.674022E-40 
                                   f32 %129 = OpConstant 3.674022E-40 
                                 f32_3 %130 = OpConstantComposite %128 %129 %97 
                                   f32 %138 = OpConstant 3.674022E-40 
                                   f32 %147 = OpConstant 3.674022E-40 
                                       %151 = OpTypeBool 
                                       %152 = OpTypePointer Private %151 
                         Private bool* %153 = OpVariable Private 
                                       %162 = OpTypePointer Function %6 
                                   f32 %173 = OpConstant 3.674022E-40 
                                   f32 %198 = OpConstant 3.674022E-40 
                                 f32_4 %199 = OpConstantComposite %198 %138 %128 %147 
                                   f32 %203 = OpConstant 3.674022E-40 
                                 f32_4 %204 = OpConstantComposite %88 %203 %88 %138 
                         Private bool* %211 = OpVariable Private 
                        Private f32_4* %214 = OpVariable Private 
                        Private f32_4* %219 = OpVariable Private 
                                   f32 %222 = OpConstant 3.674022E-40 
                                   f32 %223 = OpConstant 3.674022E-40 
                                 f32_4 %224 = OpConstantComposite %222 %138 %223 %138 
                                 f32_4 %228 = OpConstantComposite %128 %129 %203 %138 
                                       %235 = OpTypeVector %151 4 
                                       %256 = OpTypePointer Output %14 
                         Output f32_4* %257 = OpVariable Output 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                         Function f32* %163 = OpVariable Function 
                                  f32_2 %13 = OpLoad vs_TEXCOORD0 
                         Uniform f32_4* %21 = OpAccessChain %17 %19 
                                  f32_4 %22 = OpLoad %21 
                                  f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                  f32_2 %24 = OpFMul %13 %23 
                         Uniform f32_4* %25 = OpAccessChain %17 %19 
                                  f32_4 %26 = OpLoad %25 
                                  f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                  f32_2 %28 = OpFAdd %24 %27 
                                  f32_3 %29 = OpLoad %9 
                                  f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                OpStore %9 %30 
                           Private f32* %35 = OpAccessChain %9 %34 
                                    f32 %36 = OpLoad %35 
                           Uniform f32* %39 = OpAccessChain %17 %37 
                                    f32 %40 = OpLoad %39 
                                    f32 %41 = OpFMul %36 %40 
                                                OpStore %32 %41 
                                    f32 %44 = OpLoad %32 
                                    f32 %45 = OpExtInst %1 8 %44 
                           Private f32* %47 = OpAccessChain %43 %46 
                                                OpStore %47 %45 
                           Private f32* %48 = OpAccessChain %43 %46 
                                    f32 %49 = OpLoad %48 
                           Uniform f32* %50 = OpAccessChain %17 %37 
                                    f32 %51 = OpLoad %50 
                                    f32 %52 = OpFDiv %49 %51 
                           Private f32* %54 = OpAccessChain %9 %53 
                                                OpStore %54 %52 
                           Uniform f32* %56 = OpAccessChain %17 %55 
                                    f32 %57 = OpLoad %56 
                                  f32_2 %58 = OpCompositeConstruct %57 %57 
                                  f32_2 %62 = OpFMul %58 %61 
                                  f32_3 %63 = OpLoad %9 
                                  f32_2 %64 = OpVectorShuffle %63 %63 0 2 
                                  f32_2 %65 = OpFAdd %62 %64 
                                  f32_4 %66 = OpLoad %43 
                                  f32_4 %67 = OpVectorShuffle %66 %65 4 5 2 3 
                                                OpStore %43 %67 
                    read_only Texture2D %71 = OpLoad %70 
                                sampler %75 = OpLoad %74 
             read_only Texture2DSampled %77 = OpSampledImage %71 %75 
                                  f32_4 %78 = OpLoad %43 
                                  f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                  f32_4 %80 = OpImageSampleImplicitLod %77 %79 
                                    f32 %81 = OpCompositeExtract %80 0 
                           Private f32* %82 = OpAccessChain %43 %46 
                                                OpStore %82 %81 
                                  f32_4 %85 = OpLoad %43 
                                  f32_2 %86 = OpVectorShuffle %85 %85 0 0 
                                  f32_2 %90 = OpFMul %86 %89 
                                  f32_3 %91 = OpLoad %9 
                                  f32_2 %92 = OpVectorShuffle %91 %91 0 2 
                                  f32_2 %93 = OpFAdd %90 %92 
                                                OpStore %84 %93 
                           Private f32* %95 = OpAccessChain %43 %46 
                                    f32 %96 = OpLoad %95 
                                    f32 %98 = OpFMul %96 %97 
                                   f32 %100 = OpFAdd %98 %99 
                                                OpStore %94 %100 
                                 f32_3 %101 = OpLoad %9 
                                 f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                 f32_2 %105 = OpFAdd %102 %104 
                                 f32_3 %106 = OpLoad %9 
                                 f32_3 %107 = OpVectorShuffle %106 %105 3 4 2 
                                                OpStore %9 %107 
                                 f32_3 %108 = OpLoad %9 
                                 f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                 f32_2 %110 = OpExtInst %1 4 %109 
                          Uniform f32* %112 = OpAccessChain %17 %111 
                                   f32 %113 = OpLoad %112 
                                 f32_2 %114 = OpCompositeConstruct %113 %113 
                                 f32_2 %115 = OpFMul %110 %114 
                                 f32_3 %116 = OpLoad %9 
                                 f32_3 %117 = OpVectorShuffle %116 %115 3 4 2 
                                                OpStore %9 %117 
                   read_only Texture2D %118 = OpLoad %70 
                               sampler %119 = OpLoad %74 
            read_only Texture2DSampled %120 = OpSampledImage %118 %119 
                                 f32_2 %121 = OpLoad %84 
                                 f32_4 %122 = OpImageSampleImplicitLod %120 %121 
                                 f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                 f32_4 %124 = OpLoad %43 
                                 f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                OpStore %43 %125 
                                 f32_4 %126 = OpLoad %43 
                                 f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                   f32 %131 = OpDot %127 %130 
                          Private f32* %132 = OpAccessChain %43 %46 
                                                OpStore %132 %131 
                          Private f32* %133 = OpAccessChain %43 %46 
                                   f32 %134 = OpLoad %133 
                                   f32 %135 = OpFNegate %134 
                                   f32 %136 = OpLoad %94 
                                   f32 %137 = OpFMul %135 %136 
                                   f32 %139 = OpFAdd %137 %138 
                          Private f32* %140 = OpAccessChain %84 %46 
                                                OpStore %140 %139 
                                   f32 %141 = OpLoad %94 
                          Private f32* %142 = OpAccessChain %43 %46 
                                   f32 %143 = OpLoad %142 
                                   f32 %144 = OpFMul %141 %143 
                                                OpStore %94 %144 
                          Private f32* %145 = OpAccessChain %84 %46 
                                   f32 %146 = OpLoad %145 
                                   f32 %148 = OpFMul %146 %147 
                                   f32 %149 = OpFAdd %148 %129 
                          Private f32* %150 = OpAccessChain %43 %46 
                                                OpStore %150 %149 
                                   f32 %154 = OpLoad %32 
                                   f32 %155 = OpLoad %32 
                                   f32 %156 = OpFNegate %155 
                                  bool %157 = OpFOrdGreaterThanEqual %154 %156 
                                                OpStore %153 %157 
                                   f32 %158 = OpLoad %32 
                                   f32 %159 = OpExtInst %1 4 %158 
                                   f32 %160 = OpExtInst %1 10 %159 
                                                OpStore %32 %160 
                                  bool %161 = OpLoad %153 
                                                OpSelectionMerge %165 None 
                                                OpBranchConditional %161 %164 %167 
                                       %164 = OpLabel 
                                   f32 %166 = OpLoad %32 
                                                OpStore %163 %166 
                                                OpBranch %165 
                                       %167 = OpLabel 
                                   f32 %168 = OpLoad %32 
                                   f32 %169 = OpFNegate %168 
                                                OpStore %163 %169 
                                                OpBranch %165 
                                       %165 = OpLabel 
                                   f32 %170 = OpLoad %163 
                                                OpStore %32 %170 
                                   f32 %171 = OpLoad %32 
                                   f32 %172 = OpFMul %171 %147 
                                   f32 %174 = OpFAdd %172 %173 
                                                OpStore %32 %174 
                                   f32 %175 = OpLoad %32 
                                   f32 %176 = OpExtInst %1 4 %175 
                                   f32 %177 = OpFNegate %176 
                                   f32 %178 = OpFAdd %177 %138 
                                                OpStore %32 %178 
                                   f32 %179 = OpLoad %32 
                                   f32 %180 = OpExtInst %1 30 %179 
                                                OpStore %32 %180 
                                   f32 %181 = OpLoad %32 
                          Private f32* %182 = OpAccessChain %43 %46 
                                   f32 %183 = OpLoad %182 
                                   f32 %184 = OpFMul %181 %183 
                                                OpStore %32 %184 
                                   f32 %185 = OpLoad %32 
                                   f32 %186 = OpExtInst %1 29 %185 
                                                OpStore %32 %186 
                                   f32 %187 = OpLoad %94 
                                   f32 %188 = OpLoad %32 
                                   f32 %189 = OpFMul %187 %188 
                                                OpStore %94 %189 
                                   f32 %190 = OpLoad %94 
                                   f32 %191 = OpExtInst %1 43 %190 %88 %138 
                                                OpStore %94 %191 
                                   f32 %192 = OpLoad %94 
                                   f32 %193 = OpFNegate %192 
                                   f32 %194 = OpFMul %193 %147 
                                   f32 %195 = OpFAdd %194 %138 
                                                OpStore %32 %195 
                                   f32 %196 = OpLoad %94 
                                 f32_4 %197 = OpCompositeConstruct %196 %196 %196 %196 
                                 f32_4 %200 = OpFMul %197 %199 
                                                OpStore %43 %200 
                                   f32 %201 = OpLoad %32 
                                 f32_4 %202 = OpCompositeConstruct %201 %201 %201 %201 
                                 f32_4 %205 = OpFMul %202 %204 
                                 f32_4 %206 = OpLoad %43 
                                 f32_4 %207 = OpFAdd %205 %206 
                                                OpStore %43 %207 
                                   f32 %208 = OpLoad %94 
                                   f32 %209 = OpFMul %208 %147 
                                   f32 %210 = OpFAdd %209 %173 
                                                OpStore %32 %210 
                                   f32 %212 = OpLoad %94 
                                  bool %213 = OpFOrdLessThan %212 %129 
                                                OpStore %211 %213 
                                   f32 %215 = OpLoad %32 
                                   f32 %216 = OpFNegate %215 
                                   f32 %217 = OpFAdd %216 %138 
                          Private f32* %218 = OpAccessChain %214 %46 
                                                OpStore %218 %217 
                                   f32 %220 = OpLoad %32 
                                 f32_4 %221 = OpCompositeConstruct %220 %220 %220 %220 
                                 f32_4 %225 = OpFMul %221 %224 
                                                OpStore %219 %225 
                                 f32_4 %226 = OpLoad %214 
                                 f32_4 %227 = OpVectorShuffle %226 %226 0 0 0 0 
                                 f32_4 %229 = OpFMul %227 %228 
                                 f32_4 %230 = OpLoad %219 
                                 f32_4 %231 = OpFAdd %229 %230 
                                                OpStore %214 %231 
                                  bool %232 = OpLoad %211 
                                 f32_4 %233 = OpLoad %43 
                                 f32_4 %234 = OpLoad %214 
                                bool_4 %236 = OpCompositeConstruct %232 %232 %232 %232 
                                 f32_4 %237 = OpSelect %236 %233 %234 
                                                OpStore %43 %237 
                          Private f32* %238 = OpAccessChain %9 %46 
                                   f32 %239 = OpLoad %238 
                                   f32 %240 = OpFNegate %239 
                          Private f32* %241 = OpAccessChain %9 %46 
                                   f32 %242 = OpLoad %241 
                                   f32 %243 = OpFMul %240 %242 
                                   f32 %244 = OpFAdd %243 %138 
                          Private f32* %245 = OpAccessChain %9 %46 
                                                OpStore %245 %244 
                          Private f32* %246 = OpAccessChain %9 %34 
                                   f32 %247 = OpLoad %246 
                                   f32 %248 = OpFNegate %247 
                          Private f32* %249 = OpAccessChain %9 %34 
                                   f32 %250 = OpLoad %249 
                                   f32 %251 = OpFMul %248 %250 
                          Private f32* %252 = OpAccessChain %9 %46 
                                   f32 %253 = OpLoad %252 
                                   f32 %254 = OpFAdd %251 %253 
                          Private f32* %255 = OpAccessChain %9 %46 
                                                OpStore %255 %254 
                                 f32_3 %258 = OpLoad %9 
                                 f32_4 %259 = OpVectorShuffle %258 %258 0 0 0 0 
                                 f32_4 %260 = OpLoad %43 
                                 f32_4 %261 = OpFMul %259 %260 
                                                OpStore %257 %261 
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