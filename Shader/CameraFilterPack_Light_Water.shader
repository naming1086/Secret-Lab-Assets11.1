//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Light_Water" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 30428
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
uniform 	float _Alpha;
uniform 	float _Distance;
uniform 	float _Size;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
float u_xlat4;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat0.xy + vec2(-1.20000005, -1.20000005);
    u_xlat6.xy = u_xlat6.xy * vec2(vec2(_Distance, _Distance)) + vec2(-10.0, -10.0);
    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + (-u_xlat6.xy);
    u_xlat1.zw = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat6.yx;
    u_xlat1.yz = sin(u_xlat1.yz);
    u_xlat1.xw = cos(u_xlat1.xw);
    u_xlat2.xy = u_xlat1.zw + u_xlat1.xy;
    u_xlat1.xy = u_xlat6.xy + u_xlat2.xy;
    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat1.xy;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat4 = cos(u_xlat1.y);
    u_xlat4 = u_xlat4 * 100.0;
    u_xlat2.y = u_xlat6.y / u_xlat4;
    u_xlat9 = u_xlat1.x * 100.0;
    u_xlat2.x = u_xlat6.x / u_xlat9;
    u_xlat6.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = 1.20000005 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 0.200000003;
    u_xlat6.x = u_xlat6.x * _Size;
    u_xlat6.x = u_xlat6.x * 0.666666687;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.x) + 1.5;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat6.xxx + vec3(0.0, 0.300000012, 0.5);
    u_xlat6.x = u_xlat1.x * _Alpha;
    u_xlat2.x = u_xlat6.x * 0.285714298;
    u_xlat2.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat1.xyz * vec3(_Alpha) + u_xlat0.xyz;
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
; Bound: 237
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %219 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 12 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpMemberDecorate %14 1 Offset 14 
                                                     OpMemberDecorate %14 2 Offset 14 
                                                     OpMemberDecorate %14 3 Offset 14 
                                                     OpMemberDecorate %14 4 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %207 DescriptorSet 207 
                                                     OpDecorate %207 Binding 207 
                                                     OpDecorate %211 DescriptorSet 211 
                                                     OpDecorate %211 Binding 211 
                                                     OpDecorate %219 Location 219 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %14 = OpTypeStruct %6 %6 %6 %6 %7 
                                             %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 4 
                                             %19 = OpTypePointer Uniform %7 
                                             %30 = OpTypePointer Private %10 
                              Private f32_2* %31 = OpVariable Private 
                                         f32 %34 = OpConstant 3.674022E-40 
                                       f32_2 %35 = OpConstantComposite %34 %34 
                                         i32 %38 = OpConstant 2 
                                             %39 = OpTypePointer Uniform %6 
                                         f32 %49 = OpConstant 3.674022E-40 
                                       f32_2 %50 = OpConstantComposite %49 %49 
                              Private f32_4* %52 = OpVariable Private 
                                         i32 %53 = OpConstant 0 
                                         f32 %57 = OpConstant 3.674022E-40 
                                       f32_2 %58 = OpConstantComposite %57 %57 
                              Private f32_2* %84 = OpVariable Private 
                                            %104 = OpTypeInt 32 0 
                                        u32 %105 = OpConstant 0 
                                            %106 = OpTypePointer Private %6 
                               Private f32* %111 = OpVariable Private 
                                        u32 %112 = OpConstant 1 
                                        f32 %117 = OpConstant 3.674022E-40 
                               Private f32* %124 = OpVariable Private 
                                        f32 %141 = OpConstant 3.674022E-40 
                                        f32 %148 = OpConstant 3.674022E-40 
                                        i32 %153 = OpConstant 3 
                                        f32 %160 = OpConstant 3.674022E-40 
                                        f32 %170 = OpConstant 3.674022E-40 
                                            %173 = OpTypeVector %6 3 
                                        f32 %179 = OpConstant 3.674022E-40 
                                        f32 %180 = OpConstant 3.674022E-40 
                                        f32 %181 = OpConstant 3.674022E-40 
                                      f32_3 %182 = OpConstantComposite %179 %180 %181 
                                        i32 %188 = OpConstant 1 
                                        f32 %195 = OpConstant 3.674022E-40 
                                            %205 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %206 = OpTypePointer UniformConstant %205 
       UniformConstant read_only Texture2D* %207 = OpVariable UniformConstant 
                                            %209 = OpTypeSampler 
                                            %210 = OpTypePointer UniformConstant %209 
                   UniformConstant sampler* %211 = OpVariable UniformConstant 
                                            %213 = OpTypeSampledImage %205 
                                            %218 = OpTypePointer Output %7 
                              Output f32_4* %219 = OpVariable Output 
                                        u32 %231 = OpConstant 3 
                                            %234 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %13 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %20 = OpAccessChain %16 %18 
                                       f32_4 %21 = OpLoad %20 
                                       f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                       f32_2 %23 = OpFMul %13 %22 
                              Uniform f32_4* %24 = OpAccessChain %16 %18 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                       f32_2 %27 = OpFAdd %23 %26 
                                       f32_4 %28 = OpLoad %9 
                                       f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                     OpStore %9 %29 
                                       f32_4 %32 = OpLoad %9 
                                       f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                       f32_2 %36 = OpFAdd %33 %35 
                                                     OpStore %31 %36 
                                       f32_2 %37 = OpLoad %31 
                                Uniform f32* %40 = OpAccessChain %16 %38 
                                         f32 %41 = OpLoad %40 
                                Uniform f32* %42 = OpAccessChain %16 %38 
                                         f32 %43 = OpLoad %42 
                                       f32_2 %44 = OpCompositeConstruct %41 %43 
                                         f32 %45 = OpCompositeExtract %44 0 
                                         f32 %46 = OpCompositeExtract %44 1 
                                       f32_2 %47 = OpCompositeConstruct %45 %46 
                                       f32_2 %48 = OpFMul %37 %47 
                                       f32_2 %51 = OpFAdd %48 %50 
                                                     OpStore %31 %51 
                                Uniform f32* %54 = OpAccessChain %16 %53 
                                         f32 %55 = OpLoad %54 
                                       f32_2 %56 = OpCompositeConstruct %55 %55 
                                       f32_2 %59 = OpFMul %56 %58 
                                       f32_2 %60 = OpLoad %31 
                                       f32_2 %61 = OpFNegate %60 
                                       f32_2 %62 = OpFAdd %59 %61 
                                       f32_4 %63 = OpLoad %52 
                                       f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                                     OpStore %52 %64 
                                Uniform f32* %65 = OpAccessChain %16 %53 
                                         f32 %66 = OpLoad %65 
                                       f32_2 %67 = OpCompositeConstruct %66 %66 
                                       f32_2 %68 = OpFMul %67 %58 
                                       f32_2 %69 = OpLoad %31 
                                       f32_2 %70 = OpVectorShuffle %69 %69 1 0 
                                       f32_2 %71 = OpFAdd %68 %70 
                                       f32_4 %72 = OpLoad %52 
                                       f32_4 %73 = OpVectorShuffle %72 %71 0 1 4 5 
                                                     OpStore %52 %73 
                                       f32_4 %74 = OpLoad %52 
                                       f32_2 %75 = OpVectorShuffle %74 %74 1 2 
                                       f32_2 %76 = OpExtInst %1 13 %75 
                                       f32_4 %77 = OpLoad %52 
                                       f32_4 %78 = OpVectorShuffle %77 %76 0 4 5 3 
                                                     OpStore %52 %78 
                                       f32_4 %79 = OpLoad %52 
                                       f32_2 %80 = OpVectorShuffle %79 %79 0 3 
                                       f32_2 %81 = OpExtInst %1 14 %80 
                                       f32_4 %82 = OpLoad %52 
                                       f32_4 %83 = OpVectorShuffle %82 %81 4 1 2 5 
                                                     OpStore %52 %83 
                                       f32_4 %85 = OpLoad %52 
                                       f32_2 %86 = OpVectorShuffle %85 %85 2 3 
                                       f32_4 %87 = OpLoad %52 
                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                       f32_2 %89 = OpFAdd %86 %88 
                                                     OpStore %84 %89 
                                       f32_2 %90 = OpLoad %31 
                                       f32_2 %91 = OpLoad %84 
                                       f32_2 %92 = OpFAdd %90 %91 
                                       f32_4 %93 = OpLoad %52 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %52 %94 
                                Uniform f32* %95 = OpAccessChain %16 %53 
                                         f32 %96 = OpLoad %95 
                                       f32_2 %97 = OpCompositeConstruct %96 %96 
                                       f32_2 %98 = OpFMul %97 %58 
                                       f32_4 %99 = OpLoad %52 
                                      f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                      f32_2 %101 = OpFAdd %98 %100 
                                      f32_4 %102 = OpLoad %52 
                                      f32_4 %103 = OpVectorShuffle %102 %101 4 5 2 3 
                                                     OpStore %52 %103 
                               Private f32* %107 = OpAccessChain %52 %105 
                                        f32 %108 = OpLoad %107 
                                        f32 %109 = OpExtInst %1 13 %108 
                               Private f32* %110 = OpAccessChain %52 %105 
                                                     OpStore %110 %109 
                               Private f32* %113 = OpAccessChain %52 %112 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpExtInst %1 14 %114 
                                                     OpStore %111 %115 
                                        f32 %116 = OpLoad %111 
                                        f32 %118 = OpFMul %116 %117 
                                                     OpStore %111 %118 
                               Private f32* %119 = OpAccessChain %31 %112 
                                        f32 %120 = OpLoad %119 
                                        f32 %121 = OpLoad %111 
                                        f32 %122 = OpFDiv %120 %121 
                               Private f32* %123 = OpAccessChain %84 %112 
                                                     OpStore %123 %122 
                               Private f32* %125 = OpAccessChain %52 %105 
                                        f32 %126 = OpLoad %125 
                                        f32 %127 = OpFMul %126 %117 
                                                     OpStore %124 %127 
                               Private f32* %128 = OpAccessChain %31 %105 
                                        f32 %129 = OpLoad %128 
                                        f32 %130 = OpLoad %124 
                                        f32 %131 = OpFDiv %129 %130 
                               Private f32* %132 = OpAccessChain %84 %105 
                                                     OpStore %132 %131 
                                      f32_2 %133 = OpLoad %84 
                                      f32_2 %134 = OpLoad %84 
                                        f32 %135 = OpDot %133 %134 
                               Private f32* %136 = OpAccessChain %31 %105 
                                                     OpStore %136 %135 
                               Private f32* %137 = OpAccessChain %31 %105 
                                        f32 %138 = OpLoad %137 
                                        f32 %139 = OpExtInst %1 31 %138 
                               Private f32* %140 = OpAccessChain %31 %105 
                                                     OpStore %140 %139 
                               Private f32* %142 = OpAccessChain %31 %105 
                                        f32 %143 = OpLoad %142 
                                        f32 %144 = OpFDiv %141 %143 
                               Private f32* %145 = OpAccessChain %31 %105 
                                                     OpStore %145 %144 
                               Private f32* %146 = OpAccessChain %31 %105 
                                        f32 %147 = OpLoad %146 
                                        f32 %149 = OpFAdd %147 %148 
                               Private f32* %150 = OpAccessChain %31 %105 
                                                     OpStore %150 %149 
                               Private f32* %151 = OpAccessChain %31 %105 
                                        f32 %152 = OpLoad %151 
                               Uniform f32* %154 = OpAccessChain %16 %153 
                                        f32 %155 = OpLoad %154 
                                        f32 %156 = OpFMul %152 %155 
                               Private f32* %157 = OpAccessChain %31 %105 
                                                     OpStore %157 %156 
                               Private f32* %158 = OpAccessChain %31 %105 
                                        f32 %159 = OpLoad %158 
                                        f32 %161 = OpFMul %159 %160 
                               Private f32* %162 = OpAccessChain %31 %105 
                                                     OpStore %162 %161 
                               Private f32* %163 = OpAccessChain %31 %105 
                                        f32 %164 = OpLoad %163 
                                        f32 %165 = OpExtInst %1 31 %164 
                               Private f32* %166 = OpAccessChain %31 %105 
                                                     OpStore %166 %165 
                               Private f32* %167 = OpAccessChain %31 %105 
                                        f32 %168 = OpLoad %167 
                                        f32 %169 = OpFNegate %168 
                                        f32 %171 = OpFAdd %169 %170 
                               Private f32* %172 = OpAccessChain %31 %105 
                                                     OpStore %172 %171 
                                      f32_2 %174 = OpLoad %31 
                                      f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                      f32_2 %176 = OpLoad %31 
                                      f32_3 %177 = OpVectorShuffle %176 %176 0 0 0 
                                      f32_3 %178 = OpFMul %175 %177 
                                      f32_3 %183 = OpFAdd %178 %182 
                                      f32_4 %184 = OpLoad %52 
                                      f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                     OpStore %52 %185 
                               Private f32* %186 = OpAccessChain %52 %105 
                                        f32 %187 = OpLoad %186 
                               Uniform f32* %189 = OpAccessChain %16 %188 
                                        f32 %190 = OpLoad %189 
                                        f32 %191 = OpFMul %187 %190 
                               Private f32* %192 = OpAccessChain %31 %105 
                                                     OpStore %192 %191 
                               Private f32* %193 = OpAccessChain %31 %105 
                                        f32 %194 = OpLoad %193 
                                        f32 %196 = OpFMul %194 %195 
                               Private f32* %197 = OpAccessChain %84 %105 
                                                     OpStore %197 %196 
                               Private f32* %198 = OpAccessChain %84 %112 
                                                     OpStore %198 %179 
                                      f32_4 %199 = OpLoad %9 
                                      f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                      f32_2 %201 = OpLoad %84 
                                      f32_2 %202 = OpFAdd %200 %201 
                                      f32_4 %203 = OpLoad %9 
                                      f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
                                                     OpStore %9 %204 
                        read_only Texture2D %208 = OpLoad %207 
                                    sampler %212 = OpLoad %211 
                 read_only Texture2DSampled %214 = OpSampledImage %208 %212 
                                      f32_4 %215 = OpLoad %9 
                                      f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                      f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                                                     OpStore %9 %217 
                                      f32_4 %220 = OpLoad %52 
                                      f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                               Uniform f32* %222 = OpAccessChain %16 %188 
                                        f32 %223 = OpLoad %222 
                                      f32_3 %224 = OpCompositeConstruct %223 %223 %223 
                                      f32_3 %225 = OpFMul %221 %224 
                                      f32_4 %226 = OpLoad %9 
                                      f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                      f32_3 %228 = OpFAdd %225 %227 
                                      f32_4 %229 = OpLoad %219 
                                      f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                                     OpStore %219 %230 
                               Private f32* %232 = OpAccessChain %9 %231 
                                        f32 %233 = OpLoad %232 
                                Output f32* %235 = OpAccessChain %219 %231 
                                                     OpStore %235 %233 
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