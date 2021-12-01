//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/AAA_Blood_Plus" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 40480
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	float _Value8;
uniform 	float _Value9;
uniform 	float _Value10;
uniform 	float _Value11;
uniform 	float _Value12;
uniform 	float _Value13;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
void main()
{
    u_xlat0.x = _Value2 + _Value3;
    u_xlat0.x = u_xlat0.x + _Value4;
    u_xlat0.x = u_xlat0.x + _Value5;
    u_xlat0.x = u_xlat0.x * 0.00100000005 + 2.0;
    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat1.xy / u_xlat0.xx;
    u_xlat1.xy = u_xlat0.xw + vec2(0.5, 0.5);
    u_xlat1 = texture(_MainTex2, u_xlat1.xy);
    u_xlat2 = texture(_MainTex2, u_xlat0.xw);
    u_xlat3 = u_xlat0.xwxw + vec4(0.5, 0.0, 0.0, 0.5);
    u_xlat4 = texture(_MainTex2, u_xlat3.xy);
    u_xlat3 = texture(_MainTex2, u_xlat3.zw);
    u_xlat0.x = u_xlat4.x * _Value3;
    u_xlat0.x = u_xlat2.x * _Value2 + u_xlat0.x;
    u_xlat0.x = u_xlat3.x * _Value4 + u_xlat0.x;
    u_xlat0.x = u_xlat1.x * _Value5 + u_xlat0.x;
    u_xlat0.x = u_xlat2.y * _Value6 + u_xlat0.x;
    u_xlat0.x = u_xlat4.y * _Value7 + u_xlat0.x;
    u_xlat0.x = u_xlat3.y * _Value8 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y * _Value9 + u_xlat0.x;
    u_xlat0.x = u_xlat2.z * _Value10 + u_xlat0.x;
    u_xlat0.x = u_xlat4.z * _Value11 + u_xlat0.x;
    u_xlat0.x = u_xlat3.z * _Value12 + u_xlat0.x;
    u_xlat0.x = u_xlat1.z * _Value13 + u_xlat0.x;
    u_xlat1.x = u_xlat0.x * _Value;
    u_xlat0.xy = u_xlat1.xx * vec2(0.0625, 0.0625) + u_xlat5.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.yz = u_xlat0.yz;
    u_xlat5.xyz = u_xlat1.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat1.xyz;
    SV_Target0.x = u_xlat0.x + u_xlat5.x;
    SV_Target0.yz = u_xlat5.yz;
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
; Bound: 312
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %52 %296 
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
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 52 
                                                      OpDecorate %98 DescriptorSet 98 
                                                      OpDecorate %98 Binding 98 
                                                      OpDecorate %102 DescriptorSet 102 
                                                      OpDecorate %102 Binding 102 
                                                      OpDecorate %273 DescriptorSet 273 
                                                      OpDecorate %273 Binding 273 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %296 Location 296 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 1 
                                              %15 = OpTypePointer Uniform %6 
                                          i32 %18 = OpConstant 2 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Private %6 
                                          i32 %28 = OpConstant 3 
                                          i32 %35 = OpConstant 4 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %44 = OpConstant 3.674022E-40 
                                              %47 = OpTypeVector %6 3 
                                              %48 = OpTypePointer Private %47 
                               Private f32_3* %49 = OpVariable Private 
                                              %50 = OpTypeVector %6 2 
                                              %51 = OpTypePointer Input %50 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %54 = OpConstant 13 
                                              %55 = OpTypePointer Uniform %7 
                               Private f32_3* %66 = OpVariable Private 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_2 %70 = OpConstantComposite %69 %69 
                                          f32 %76 = OpConstant 3.674022E-40 
                                        f32_2 %77 = OpConstantComposite %76 %76 
                                          f32 %79 = OpConstant 3.674022E-40 
                                        f32_2 %80 = OpConstantComposite %79 %79 
                                              %96 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %97 = OpTypePointer UniformConstant %96 
         UniformConstant read_only Texture2D* %98 = OpVariable UniformConstant 
                                             %100 = OpTypeSampler 
                                             %101 = OpTypePointer UniformConstant %100 
                    UniformConstant sampler* %102 = OpVariable UniformConstant 
                                             %104 = OpTypeSampledImage %96 
                              Private f32_3* %110 = OpVariable Private 
                              Private f32_4* %118 = OpVariable Private 
                                         f32 %121 = OpConstant 3.674022E-40 
                                       f32_4 %122 = OpConstantComposite %79 %121 %121 %79 
                              Private f32_3* %124 = OpVariable Private 
                                         u32 %174 = OpConstant 1 
                                         i32 %177 = OpConstant 5 
                                         i32 %187 = OpConstant 6 
                                         i32 %197 = OpConstant 7 
                                         i32 %207 = OpConstant 8 
                                         u32 %215 = OpConstant 2 
                                         i32 %218 = OpConstant 9 
                                         i32 %228 = OpConstant 10 
                                         i32 %238 = OpConstant 11 
                                         i32 %248 = OpConstant 12 
                                         i32 %258 = OpConstant 0 
                                         f32 %265 = OpConstant 3.674022E-40 
                                       f32_2 %266 = OpConstantComposite %265 %265 
        UniformConstant read_only Texture2D* %273 = OpVariable UniformConstant 
                    UniformConstant sampler* %275 = OpVariable UniformConstant 
                                         f32 %290 = OpConstant 3.674022E-40 
                                       f32_3 %291 = OpConstantComposite %290 %290 %290 
                                             %295 = OpTypePointer Output %7 
                               Output f32_4* %296 = OpVariable Output 
                                             %302 = OpTypePointer Output %6 
                                         f32 %308 = OpConstant 3.674022E-40 
                                         u32 %309 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %19 = OpAccessChain %12 %18 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFAdd %17 %20 
                                 Private f32* %25 = OpAccessChain %9 %23 
                                                      OpStore %25 %21 
                                 Private f32* %26 = OpAccessChain %9 %23 
                                          f32 %27 = OpLoad %26 
                                 Uniform f32* %29 = OpAccessChain %12 %28 
                                          f32 %30 = OpLoad %29 
                                          f32 %31 = OpFAdd %27 %30 
                                 Private f32* %32 = OpAccessChain %9 %23 
                                                      OpStore %32 %31 
                                 Private f32* %33 = OpAccessChain %9 %23 
                                          f32 %34 = OpLoad %33 
                                 Uniform f32* %36 = OpAccessChain %12 %35 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFAdd %34 %37 
                                 Private f32* %39 = OpAccessChain %9 %23 
                                                      OpStore %39 %38 
                                 Private f32* %40 = OpAccessChain %9 %23 
                                          f32 %41 = OpLoad %40 
                                          f32 %43 = OpFMul %41 %42 
                                          f32 %45 = OpFAdd %43 %44 
                                 Private f32* %46 = OpAccessChain %9 %23 
                                                      OpStore %46 %45 
                                        f32_2 %53 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %56 = OpAccessChain %12 %54 
                                        f32_4 %57 = OpLoad %56 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 1 
                                        f32_2 %59 = OpFMul %53 %58 
                               Uniform f32_4* %60 = OpAccessChain %12 %54 
                                        f32_4 %61 = OpLoad %60 
                                        f32_2 %62 = OpVectorShuffle %61 %61 2 3 
                                        f32_2 %63 = OpFAdd %59 %62 
                                        f32_3 %64 = OpLoad %49 
                                        f32_3 %65 = OpVectorShuffle %64 %63 3 4 2 
                                                      OpStore %49 %65 
                                        f32_3 %67 = OpLoad %49 
                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                        f32_2 %71 = OpFAdd %68 %70 
                                        f32_3 %72 = OpLoad %66 
                                        f32_3 %73 = OpVectorShuffle %72 %71 3 4 2 
                                                      OpStore %66 %73 
                                        f32_3 %74 = OpLoad %66 
                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                                        f32_2 %78 = OpFMul %75 %77 
                                        f32_2 %81 = OpFAdd %78 %80 
                                        f32_3 %82 = OpLoad %66 
                                        f32_3 %83 = OpVectorShuffle %82 %81 3 4 2 
                                                      OpStore %66 %83 
                                        f32_3 %84 = OpLoad %66 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_4 %86 = OpLoad %9 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 0 
                                        f32_2 %88 = OpFDiv %85 %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 1 2 5 
                                                      OpStore %9 %90 
                                        f32_4 %91 = OpLoad %9 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 3 
                                        f32_2 %93 = OpFAdd %92 %80 
                                        f32_3 %94 = OpLoad %66 
                                        f32_3 %95 = OpVectorShuffle %94 %93 3 4 2 
                                                      OpStore %66 %95 
                          read_only Texture2D %99 = OpLoad %98 
                                     sampler %103 = OpLoad %102 
                  read_only Texture2DSampled %105 = OpSampledImage %99 %103 
                                       f32_3 %106 = OpLoad %66 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_4 %108 = OpImageSampleImplicitLod %105 %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                                      OpStore %66 %109 
                         read_only Texture2D %111 = OpLoad %98 
                                     sampler %112 = OpLoad %102 
                  read_only Texture2DSampled %113 = OpSampledImage %111 %112 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 3 
                                       f32_4 %116 = OpImageSampleImplicitLod %113 %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                                      OpStore %110 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %119 0 3 0 3 
                                       f32_4 %123 = OpFAdd %120 %122 
                                                      OpStore %118 %123 
                         read_only Texture2D %125 = OpLoad %98 
                                     sampler %126 = OpLoad %102 
                  read_only Texture2DSampled %127 = OpSampledImage %125 %126 
                                       f32_4 %128 = OpLoad %118 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                                      OpStore %124 %131 
                         read_only Texture2D %132 = OpLoad %98 
                                     sampler %133 = OpLoad %102 
                  read_only Texture2DSampled %134 = OpSampledImage %132 %133 
                                       f32_4 %135 = OpLoad %118 
                                       f32_2 %136 = OpVectorShuffle %135 %135 2 3 
                                       f32_4 %137 = OpImageSampleImplicitLod %134 %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_4 %139 = OpLoad %118 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %118 %140 
                                Private f32* %141 = OpAccessChain %124 %23 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %12 %18 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFMul %142 %144 
                                Private f32* %146 = OpAccessChain %9 %23 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %110 %23 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %149 = OpAccessChain %12 %14 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %148 %150 
                                Private f32* %152 = OpAccessChain %9 %23 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFAdd %151 %153 
                                Private f32* %155 = OpAccessChain %9 %23 
                                                      OpStore %155 %154 
                                Private f32* %156 = OpAccessChain %118 %23 
                                         f32 %157 = OpLoad %156 
                                Uniform f32* %158 = OpAccessChain %12 %28 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFMul %157 %159 
                                Private f32* %161 = OpAccessChain %9 %23 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFAdd %160 %162 
                                Private f32* %164 = OpAccessChain %9 %23 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %66 %23 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %167 = OpAccessChain %12 %35 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %9 %23 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFAdd %169 %171 
                                Private f32* %173 = OpAccessChain %9 %23 
                                                      OpStore %173 %172 
                                Private f32* %175 = OpAccessChain %110 %174 
                                         f32 %176 = OpLoad %175 
                                Uniform f32* %178 = OpAccessChain %12 %177 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %176 %179 
                                Private f32* %181 = OpAccessChain %9 %23 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFAdd %180 %182 
                                Private f32* %184 = OpAccessChain %9 %23 
                                                      OpStore %184 %183 
                                Private f32* %185 = OpAccessChain %124 %174 
                                         f32 %186 = OpLoad %185 
                                Uniform f32* %188 = OpAccessChain %12 %187 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFMul %186 %189 
                                Private f32* %191 = OpAccessChain %9 %23 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFAdd %190 %192 
                                Private f32* %194 = OpAccessChain %9 %23 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %118 %174 
                                         f32 %196 = OpLoad %195 
                                Uniform f32* %198 = OpAccessChain %12 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %196 %199 
                                Private f32* %201 = OpAccessChain %9 %23 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFAdd %200 %202 
                                Private f32* %204 = OpAccessChain %9 %23 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %66 %174 
                                         f32 %206 = OpLoad %205 
                                Uniform f32* %208 = OpAccessChain %12 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %206 %209 
                                Private f32* %211 = OpAccessChain %9 %23 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFAdd %210 %212 
                                Private f32* %214 = OpAccessChain %9 %23 
                                                      OpStore %214 %213 
                                Private f32* %216 = OpAccessChain %110 %215 
                                         f32 %217 = OpLoad %216 
                                Uniform f32* %219 = OpAccessChain %12 %218 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFMul %217 %220 
                                Private f32* %222 = OpAccessChain %9 %23 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFAdd %221 %223 
                                Private f32* %225 = OpAccessChain %9 %23 
                                                      OpStore %225 %224 
                                Private f32* %226 = OpAccessChain %124 %215 
                                         f32 %227 = OpLoad %226 
                                Uniform f32* %229 = OpAccessChain %12 %228 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFMul %227 %230 
                                Private f32* %232 = OpAccessChain %9 %23 
                                         f32 %233 = OpLoad %232 
                                         f32 %234 = OpFAdd %231 %233 
                                Private f32* %235 = OpAccessChain %9 %23 
                                                      OpStore %235 %234 
                                Private f32* %236 = OpAccessChain %118 %215 
                                         f32 %237 = OpLoad %236 
                                Uniform f32* %239 = OpAccessChain %12 %238 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFMul %237 %240 
                                Private f32* %242 = OpAccessChain %9 %23 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFAdd %241 %243 
                                Private f32* %245 = OpAccessChain %9 %23 
                                                      OpStore %245 %244 
                                Private f32* %246 = OpAccessChain %66 %215 
                                         f32 %247 = OpLoad %246 
                                Uniform f32* %249 = OpAccessChain %12 %248 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFMul %247 %250 
                                Private f32* %252 = OpAccessChain %9 %23 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFAdd %251 %253 
                                Private f32* %255 = OpAccessChain %9 %23 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %9 %23 
                                         f32 %257 = OpLoad %256 
                                Uniform f32* %259 = OpAccessChain %12 %258 
                                         f32 %260 = OpLoad %259 
                                         f32 %261 = OpFMul %257 %260 
                                Private f32* %262 = OpAccessChain %66 %23 
                                                      OpStore %262 %261 
                                       f32_3 %263 = OpLoad %66 
                                       f32_2 %264 = OpVectorShuffle %263 %263 0 0 
                                       f32_2 %267 = OpFMul %264 %266 
                                       f32_3 %268 = OpLoad %49 
                                       f32_2 %269 = OpVectorShuffle %268 %268 0 1 
                                       f32_2 %270 = OpFAdd %267 %269 
                                       f32_4 %271 = OpLoad %9 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 2 3 
                                                      OpStore %9 %272 
                         read_only Texture2D %274 = OpLoad %273 
                                     sampler %276 = OpLoad %275 
                  read_only Texture2DSampled %277 = OpSampledImage %274 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_2 %279 = OpVectorShuffle %278 %278 0 1 
                                       f32_4 %280 = OpImageSampleImplicitLod %277 %279 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %9 %283 
                                       f32_4 %284 = OpLoad %9 
                                       f32_2 %285 = OpVectorShuffle %284 %284 1 2 
                                       f32_3 %286 = OpLoad %66 
                                       f32_3 %287 = OpVectorShuffle %286 %285 0 3 4 
                                                      OpStore %66 %287 
                                       f32_3 %288 = OpLoad %66 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 0 0 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_3 %293 = OpLoad %66 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %49 %294 
                                Private f32* %297 = OpAccessChain %9 %23 
                                         f32 %298 = OpLoad %297 
                                Private f32* %299 = OpAccessChain %49 %23 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpFAdd %298 %300 
                                 Output f32* %303 = OpAccessChain %296 %23 
                                                      OpStore %303 %301 
                                       f32_3 %304 = OpLoad %49 
                                       f32_2 %305 = OpVectorShuffle %304 %304 1 2 
                                       f32_4 %306 = OpLoad %296 
                                       f32_4 %307 = OpVectorShuffle %306 %305 0 4 5 3 
                                                      OpStore %296 %307 
                                 Output f32* %310 = OpAccessChain %296 %309 
                                                      OpStore %310 %308 
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