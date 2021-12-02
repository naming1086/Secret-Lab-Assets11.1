//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blizzard" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 17747
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat6;
float u_xlat8;
vec2 u_xlat9;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = _Value * _TimeX;
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat4.x = u_xlat4.x * u_xlat0.x;
    u_xlat4.xy = u_xlat4.xx * vec2(0.0625, 0.5) + vec2(1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat4.x + u_xlat1.x;
    u_xlat9.x = u_xlat0.x * 0.0625 + u_xlat12;
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * 0.0625 + u_xlat0.x;
    u_xlat2.x = u_xlat12 + (-u_xlat9.x);
    u_xlat4.x = u_xlat4.x * u_xlat2.x;
    u_xlat12 = _TimeX * _Value + u_xlat1.y;
    u_xlat2.y = u_xlat4.x * 0.03125 + u_xlat12;
    u_xlat4.xz = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
    u_xlat2 = texture(_MainTex2, u_xlat4.xz);
    u_xlat4.xz = u_xlat0.xx * vec2(0.5, 0.333333343);
    u_xlat9.xy = sin(u_xlat4.xz);
    u_xlat9.xy = u_xlat4.xz * u_xlat9.xy;
    u_xlat13 = u_xlat9.y * 0.333333343 + 1.0;
    u_xlat9.x = u_xlat9.x * 0.25 + u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 1.0;
    u_xlat6.x = u_xlat13 * 0.100000001;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat2.x = u_xlat6.x * u_xlat2.x;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat6.x = u_xlat0.x * 0.0625 + u_xlat9.x;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat4.x = u_xlat6.x * 0.125 + u_xlat4.x;
    u_xlat3.x = (-u_xlat4.x) + u_xlat9.x;
    u_xlat3.y = u_xlat0.x * 0.5 + u_xlat1.y;
    u_xlat6.xy = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
    u_xlat3 = texture(_MainTex2, u_xlat6.xy);
    u_xlat4.x = u_xlat2.x + u_xlat3.y;
    u_xlat9.x = u_xlat1.x * 2.0 + u_xlat4.y;
    u_xlat2.x = u_xlat0.x * 0.0833333358 + u_xlat9.x;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 0.125 + u_xlat0.x;
    u_xlat2.x = u_xlat9.x + (-u_xlat2.x);
    u_xlat8 = u_xlat4.y * u_xlat2.x;
    u_xlat9.x = u_xlat1.y + u_xlat1.y;
    u_xlat9.x = _TimeX * _Value + u_xlat9.x;
    u_xlat2.y = u_xlat8 * 0.015625 + u_xlat9.x;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
    u_xlat2 = texture(_MainTex2, u_xlat2.xy);
    u_xlat8 = u_xlat13 * 0.015625 + 2.0;
    u_xlat9.x = u_xlat1.x * 0.5 + u_xlat13;
    u_xlat8 = sin(u_xlat8);
    u_xlat8 = u_xlat8 * u_xlat2.z;
    u_xlat8 = max(u_xlat8, 0.0);
    u_xlat4.x = u_xlat8 + u_xlat4.x;
    u_xlat0.x = u_xlat0.x * 0.0555555597 + u_xlat9.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.0833333358 + u_xlat4.z;
    u_xlat2.y = u_xlat1.y * 0.5 + u_xlat4.z;
    u_xlat3 = texture(_MainTex, u_xlat1.xy);
    u_xlat2.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.xz = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
    u_xlat1 = texture(_MainTex2, u_xlat0.xz);
    u_xlat0.x = u_xlat1.y * 2.0 + u_xlat4.x;
    u_xlat0.x = u_xlat0.x * _Value3;
    SV_Target0.xyz = u_xlat0.xxx * vec3(0.25, 0.25, 0.25) + u_xlat3.xyz;
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
; Bound: 460
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %53 %447 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %12 0 Offset 12 
                                                      OpMemberDecorate %12 1 Offset 12 
                                                      OpMemberDecorate %12 2 Offset 12 
                                                      OpMemberDecorate %12 3 Offset 12 
                                                      OpMemberDecorate %12 4 Offset 12 
                                                      OpMemberDecorate %12 5 Offset 12 
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 53 
                                                      OpDecorate %134 DescriptorSet 134 
                                                      OpDecorate %134 Binding 134 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %365 DescriptorSet 365 
                                                      OpDecorate %365 Binding 365 
                                                      OpDecorate %367 DescriptorSet 367 
                                                      OpDecorate %367 Binding 367 
                                                      OpDecorate %447 Location 447 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeVector %6 4 
                                              %12 = OpTypeStruct %6 %6 %6 %6 %10 %11 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 0 
                                              %24 = OpTypeInt 32 0 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                               Private f32_3* %28 = OpVariable Private 
                                          f32 %41 = OpConstant 3.674022E-40 
                                          f32 %42 = OpConstant 3.674022E-40 
                                        f32_2 %43 = OpConstantComposite %41 %42 
                                          f32 %45 = OpConstant 3.674022E-40 
                                        f32_2 %46 = OpConstantComposite %45 %45 
                                              %50 = OpTypePointer Private %10 
                               Private f32_2* %51 = OpVariable Private 
                                              %52 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %55 = OpConstant 5 
                                              %56 = OpTypePointer Uniform %11 
                                 Private f32* %65 = OpVariable Private 
                               Private f32_2* %71 = OpVariable Private 
                               Private f32_3* %89 = OpVariable Private 
                                         u32 %107 = OpConstant 1 
                                         f32 %113 = OpConstant 3.674022E-40 
                                         i32 %120 = OpConstant 2 
                                             %132 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %133 = OpTypePointer UniformConstant %132 
        UniformConstant read_only Texture2D* %134 = OpVariable UniformConstant 
                                             %136 = OpTypeSampler 
                                             %137 = OpTypePointer UniformConstant %136 
                    UniformConstant sampler* %138 = OpVariable UniformConstant 
                                             %140 = OpTypeSampledImage %132 
                                         f32 %149 = OpConstant 3.674022E-40 
                                       f32_2 %150 = OpConstantComposite %42 %149 
                                         f32 %168 = OpConstant 3.674022E-40 
                                Private f32* %178 = OpVariable Private 
                                         f32 %180 = OpConstant 3.674022E-40 
                                         f32 %191 = OpConstant 3.674022E-40 
                                         f32 %203 = OpConstant 3.674022E-40 
                                             %216 = OpTypeBool 
                                             %217 = OpTypePointer Private %216 
                               Private bool* %218 = OpVariable Private 
                                         i32 %219 = OpConstant 4 
                                Private f32* %223 = OpVariable Private 
                                             %229 = OpTypePointer Function %6 
                                         f32 %275 = OpConstant 3.674022E-40 
                                         f32 %283 = OpConstant 3.674022E-40 
                                Private f32* %301 = OpVariable Private 
                              Private f32_2* %312 = OpVariable Private 
                                         f32 %329 = OpConstant 3.674022E-40 
                                         u32 %354 = OpConstant 2 
        UniformConstant read_only Texture2D* %365 = OpVariable UniformConstant 
                    UniformConstant sampler* %367 = OpVariable UniformConstant 
                                         f32 %390 = OpConstant 3.674022E-40 
                                         i32 %441 = OpConstant 3 
                                             %446 = OpTypePointer Output %11 
                               Output f32_4* %447 = OpVariable Output 
                                       f32_3 %450 = OpConstantComposite %168 %168 %168 
                                         u32 %456 = OpConstant 3 
                                             %457 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %230 = OpVariable Function 
                                 Uniform f32* %18 = OpAccessChain %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %14 %20 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFMul %19 %22 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %23 
                                 Private f32* %29 = OpAccessChain %9 %25 
                                          f32 %30 = OpLoad %29 
                                          f32 %31 = OpExtInst %1 13 %30 
                                 Private f32* %32 = OpAccessChain %28 %25 
                                                      OpStore %32 %31 
                                 Private f32* %33 = OpAccessChain %28 %25 
                                          f32 %34 = OpLoad %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFMul %34 %36 
                                 Private f32* %38 = OpAccessChain %28 %25 
                                                      OpStore %38 %37 
                                        f32_3 %39 = OpLoad %28 
                                        f32_2 %40 = OpVectorShuffle %39 %39 0 0 
                                        f32_2 %44 = OpFMul %40 %43 
                                        f32_2 %47 = OpFAdd %44 %46 
                                        f32_3 %48 = OpLoad %28 
                                        f32_3 %49 = OpVectorShuffle %48 %47 3 4 2 
                                                      OpStore %28 %49 
                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %57 = OpAccessChain %14 %55 
                                        f32_4 %58 = OpLoad %57 
                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                        f32_2 %60 = OpFMul %54 %59 
                               Uniform f32_4* %61 = OpAccessChain %14 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_2 %63 = OpVectorShuffle %62 %62 2 3 
                                        f32_2 %64 = OpFAdd %60 %63 
                                                      OpStore %51 %64 
                                 Private f32* %66 = OpAccessChain %28 %25 
                                          f32 %67 = OpLoad %66 
                                 Private f32* %68 = OpAccessChain %51 %25 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %67 %69 
                                                      OpStore %65 %70 
                                 Private f32* %72 = OpAccessChain %9 %25 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFMul %73 %41 
                                          f32 %75 = OpLoad %65 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %71 %25 
                                                      OpStore %77 %76 
                                 Private f32* %78 = OpAccessChain %71 %25 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpExtInst %1 13 %79 
                                 Private f32* %81 = OpAccessChain %71 %25 
                                                      OpStore %81 %80 
                                 Private f32* %82 = OpAccessChain %71 %25 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFMul %83 %41 
                                 Private f32* %85 = OpAccessChain %9 %25 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFAdd %84 %86 
                                 Private f32* %88 = OpAccessChain %71 %25 
                                                      OpStore %88 %87 
                                          f32 %90 = OpLoad %65 
                                 Private f32* %91 = OpAccessChain %71 %25 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpFNegate %92 
                                          f32 %94 = OpFAdd %90 %93 
                                 Private f32* %95 = OpAccessChain %89 %25 
                                                      OpStore %95 %94 
                                 Private f32* %96 = OpAccessChain %28 %25 
                                          f32 %97 = OpLoad %96 
                                 Private f32* %98 = OpAccessChain %89 %25 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %97 %99 
                                Private f32* %101 = OpAccessChain %28 %25 
                                                      OpStore %101 %100 
                                Uniform f32* %102 = OpAccessChain %14 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %14 %16 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFMul %103 %105 
                                Private f32* %108 = OpAccessChain %51 %107 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFAdd %106 %109 
                                                      OpStore %65 %110 
                                Private f32* %111 = OpAccessChain %28 %25 
                                         f32 %112 = OpLoad %111 
                                         f32 %114 = OpFMul %112 %113 
                                         f32 %115 = OpLoad %65 
                                         f32 %116 = OpFAdd %114 %115 
                                Private f32* %117 = OpAccessChain %89 %107 
                                                      OpStore %117 %116 
                                       f32_3 %118 = OpLoad %89 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                Uniform f32* %121 = OpAccessChain %14 %120 
                                         f32 %122 = OpLoad %121 
                                Uniform f32* %123 = OpAccessChain %14 %120 
                                         f32 %124 = OpLoad %123 
                                       f32_2 %125 = OpCompositeConstruct %122 %124 
                                         f32 %126 = OpCompositeExtract %125 0 
                                         f32 %127 = OpCompositeExtract %125 1 
                                       f32_2 %128 = OpCompositeConstruct %126 %127 
                                       f32_2 %129 = OpFMul %119 %128 
                                       f32_3 %130 = OpLoad %28 
                                       f32_3 %131 = OpVectorShuffle %130 %129 3 1 4 
                                                      OpStore %28 %131 
                         read_only Texture2D %135 = OpLoad %134 
                                     sampler %139 = OpLoad %138 
                  read_only Texture2DSampled %141 = OpSampledImage %135 %139 
                                       f32_3 %142 = OpLoad %28 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 2 
                                       f32_4 %144 = OpImageSampleImplicitLod %141 %143 
                                         f32 %145 = OpCompositeExtract %144 0 
                                Private f32* %146 = OpAccessChain %28 %25 
                                                      OpStore %146 %145 
                                       f32_3 %147 = OpLoad %9 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 0 
                                       f32_2 %151 = OpFMul %148 %150 
                                                      OpStore %71 %151 
                                       f32_2 %152 = OpLoad %71 
                                       f32_2 %153 = OpExtInst %1 13 %152 
                                       f32_3 %154 = OpLoad %89 
                                       f32_3 %155 = OpVectorShuffle %154 %153 3 4 2 
                                                      OpStore %89 %155 
                                       f32_2 %156 = OpLoad %71 
                                       f32_3 %157 = OpLoad %89 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFMul %156 %158 
                                       f32_3 %160 = OpLoad %89 
                                       f32_3 %161 = OpVectorShuffle %160 %159 3 4 2 
                                                      OpStore %89 %161 
                                Private f32* %162 = OpAccessChain %89 %107 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %163 %149 
                                         f32 %165 = OpFAdd %164 %45 
                                                      OpStore %65 %165 
                                Private f32* %166 = OpAccessChain %89 %25 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                Private f32* %170 = OpAccessChain %51 %25 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFAdd %169 %171 
                                Private f32* %173 = OpAccessChain %89 %25 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %89 %25 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %175 %45 
                                Private f32* %177 = OpAccessChain %89 %25 
                                                      OpStore %177 %176 
                                         f32 %179 = OpLoad %65 
                                         f32 %181 = OpFMul %179 %180 
                                                      OpStore %178 %181 
                                         f32 %182 = OpLoad %178 
                                         f32 %183 = OpExtInst %1 13 %182 
                                                      OpStore %178 %183 
                                Private f32* %184 = OpAccessChain %28 %25 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpLoad %178 
                                         f32 %187 = OpFMul %185 %186 
                                Private f32* %188 = OpAccessChain %28 %25 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %28 %25 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpExtInst %1 40 %190 %191 
                                Private f32* %193 = OpAccessChain %28 %25 
                                                      OpStore %193 %192 
                                Private f32* %194 = OpAccessChain %9 %25 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %195 %41 
                                Private f32* %197 = OpAccessChain %89 %25 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFAdd %196 %198 
                                                      OpStore %178 %199 
                                         f32 %200 = OpLoad %178 
                                         f32 %201 = OpExtInst %1 13 %200 
                                                      OpStore %178 %201 
                                         f32 %202 = OpLoad %178 
                                         f32 %204 = OpFMul %202 %203 
                                Private f32* %205 = OpAccessChain %71 %25 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFAdd %204 %206 
                                Private f32* %208 = OpAccessChain %71 %25 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %71 %25 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFNegate %210 
                                Private f32* %212 = OpAccessChain %89 %25 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFAdd %211 %213 
                                Private f32* %215 = OpAccessChain %89 %25 
                                                      OpStore %215 %214 
                                Uniform f32* %220 = OpAccessChain %14 %219 %107 
                                         f32 %221 = OpLoad %220 
                                        bool %222 = OpFOrdLessThan %221 %191 
                                                      OpStore %218 %222 
                                Private f32* %224 = OpAccessChain %51 %107 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFNegate %225 
                                         f32 %227 = OpFAdd %226 %45 
                                                      OpStore %223 %227 
                                        bool %228 = OpLoad %218 
                                                      OpSelectionMerge %232 None 
                                                      OpBranchConditional %228 %231 %234 
                                             %231 = OpLabel 
                                         f32 %233 = OpLoad %223 
                                                      OpStore %230 %233 
                                                      OpBranch %232 
                                             %234 = OpLabel 
                                Private f32* %235 = OpAccessChain %51 %107 
                                         f32 %236 = OpLoad %235 
                                                      OpStore %230 %236 
                                                      OpBranch %232 
                                             %232 = OpLabel 
                                         f32 %237 = OpLoad %230 
                                Private f32* %238 = OpAccessChain %71 %25 
                                                      OpStore %238 %237 
                                Private f32* %239 = OpAccessChain %9 %25 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFMul %240 %42 
                                Private f32* %242 = OpAccessChain %71 %25 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFAdd %241 %243 
                                Private f32* %245 = OpAccessChain %89 %107 
                                                      OpStore %245 %244 
                                       f32_3 %246 = OpLoad %89 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                Uniform f32* %248 = OpAccessChain %14 %120 
                                         f32 %249 = OpLoad %248 
                                Uniform f32* %250 = OpAccessChain %14 %120 
                                         f32 %251 = OpLoad %250 
                                       f32_2 %252 = OpCompositeConstruct %249 %251 
                                         f32 %253 = OpCompositeExtract %252 0 
                                         f32 %254 = OpCompositeExtract %252 1 
                                       f32_2 %255 = OpCompositeConstruct %253 %254 
                                       f32_2 %256 = OpFMul %247 %255 
                                       f32_3 %257 = OpLoad %89 
                                       f32_3 %258 = OpVectorShuffle %257 %256 3 4 2 
                                                      OpStore %89 %258 
                         read_only Texture2D %259 = OpLoad %134 
                                     sampler %260 = OpLoad %138 
                  read_only Texture2DSampled %261 = OpSampledImage %259 %260 
                                       f32_3 %262 = OpLoad %89 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_4 %264 = OpImageSampleImplicitLod %261 %263 
                                         f32 %265 = OpCompositeExtract %264 1 
                                Private f32* %266 = OpAccessChain %89 %25 
                                                      OpStore %266 %265 
                                Private f32* %267 = OpAccessChain %28 %25 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %89 %25 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFAdd %268 %270 
                                Private f32* %272 = OpAccessChain %28 %25 
                                                      OpStore %272 %271 
                                Private f32* %273 = OpAccessChain %51 %25 
                                         f32 %274 = OpLoad %273 
                                         f32 %276 = OpFMul %274 %275 
                                Private f32* %277 = OpAccessChain %28 %107 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpFAdd %276 %278 
                                Private f32* %280 = OpAccessChain %89 %25 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %9 %25 
                                         f32 %282 = OpLoad %281 
                                         f32 %284 = OpFMul %282 %283 
                                Private f32* %285 = OpAccessChain %89 %25 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpFAdd %284 %286 
                                                      OpStore %178 %287 
                                         f32 %288 = OpLoad %178 
                                         f32 %289 = OpExtInst %1 13 %288 
                                                      OpStore %178 %289 
                                         f32 %290 = OpLoad %178 
                                         f32 %291 = OpFMul %290 %203 
                                Private f32* %292 = OpAccessChain %9 %25 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                                      OpStore %178 %294 
                                         f32 %295 = OpLoad %178 
                                         f32 %296 = OpFNegate %295 
                                Private f32* %297 = OpAccessChain %89 %25 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFAdd %296 %298 
                                Private f32* %300 = OpAccessChain %89 %25 
                                                      OpStore %300 %299 
                                Private f32* %302 = OpAccessChain %28 %107 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %89 %25 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                                      OpStore %301 %306 
                                Private f32* %307 = OpAccessChain %71 %25 
                                         f32 %308 = OpLoad %307 
                                Private f32* %309 = OpAccessChain %71 %25 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFAdd %308 %310 
                                                      OpStore %223 %311 
                                Private f32* %313 = OpAccessChain %71 %25 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %314 %42 
                                Private f32* %316 = OpAccessChain %71 %107 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFAdd %315 %317 
                                Private f32* %319 = OpAccessChain %312 %107 
                                                      OpStore %319 %318 
                                Uniform f32* %320 = OpAccessChain %14 %20 
                                         f32 %321 = OpLoad %320 
                                Uniform f32* %322 = OpAccessChain %14 %16 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFMul %321 %323 
                                         f32 %325 = OpLoad %223 
                                         f32 %326 = OpFAdd %324 %325 
                                Private f32* %327 = OpAccessChain %71 %25 
                                                      OpStore %327 %326 
                                         f32 %328 = OpLoad %301 
                                         f32 %330 = OpFMul %328 %329 
                                Private f32* %331 = OpAccessChain %71 %25 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFAdd %330 %332 
                                Private f32* %334 = OpAccessChain %89 %107 
                                                      OpStore %334 %333 
                                       f32_3 %335 = OpLoad %89 
                                       f32_2 %336 = OpVectorShuffle %335 %335 0 1 
                                Uniform f32* %337 = OpAccessChain %14 %120 
                                         f32 %338 = OpLoad %337 
                                Uniform f32* %339 = OpAccessChain %14 %120 
                                         f32 %340 = OpLoad %339 
                                       f32_2 %341 = OpCompositeConstruct %338 %340 
                                         f32 %342 = OpCompositeExtract %341 0 
                                         f32 %343 = OpCompositeExtract %341 1 
                                       f32_2 %344 = OpCompositeConstruct %342 %343 
                                       f32_2 %345 = OpFMul %336 %344 
                                       f32_3 %346 = OpLoad %89 
                                       f32_3 %347 = OpVectorShuffle %346 %345 3 4 2 
                                                      OpStore %89 %347 
                         read_only Texture2D %348 = OpLoad %134 
                                     sampler %349 = OpLoad %138 
                  read_only Texture2DSampled %350 = OpSampledImage %348 %349 
                                       f32_3 %351 = OpLoad %89 
                                       f32_2 %352 = OpVectorShuffle %351 %351 0 1 
                                       f32_4 %353 = OpImageSampleImplicitLod %350 %352 
                                         f32 %355 = OpCompositeExtract %353 2 
                                                      OpStore %301 %355 
                                         f32 %356 = OpLoad %65 
                                         f32 %357 = OpFMul %356 %329 
                                         f32 %358 = OpFAdd %357 %275 
                                Private f32* %359 = OpAccessChain %71 %25 
                                                      OpStore %359 %358 
                                Private f32* %360 = OpAccessChain %51 %25 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFMul %361 %42 
                                         f32 %363 = OpLoad %65 
                                         f32 %364 = OpFAdd %362 %363 
                                                      OpStore %65 %364 
                         read_only Texture2D %366 = OpLoad %365 
                                     sampler %368 = OpLoad %367 
                  read_only Texture2DSampled %369 = OpSampledImage %366 %368 
                                       f32_2 %370 = OpLoad %51 
                                       f32_4 %371 = OpImageSampleImplicitLod %369 %370 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                                      OpStore %89 %372 
                                Private f32* %373 = OpAccessChain %71 %25 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpExtInst %1 13 %374 
                                Private f32* %376 = OpAccessChain %51 %25 
                                                      OpStore %376 %375 
                                         f32 %377 = OpLoad %301 
                                Private f32* %378 = OpAccessChain %51 %25 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFMul %377 %379 
                                                      OpStore %301 %380 
                                         f32 %381 = OpLoad %301 
                                         f32 %382 = OpExtInst %1 40 %381 %191 
                                                      OpStore %301 %382 
                                         f32 %383 = OpLoad %301 
                                Private f32* %384 = OpAccessChain %28 %25 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFAdd %383 %385 
                                Private f32* %387 = OpAccessChain %28 %25 
                                                      OpStore %387 %386 
                                Private f32* %388 = OpAccessChain %9 %25 
                                         f32 %389 = OpLoad %388 
                                         f32 %391 = OpFMul %389 %390 
                                         f32 %392 = OpLoad %65 
                                         f32 %393 = OpFAdd %391 %392 
                                Private f32* %394 = OpAccessChain %9 %25 
                                                      OpStore %394 %393 
                                Private f32* %395 = OpAccessChain %9 %25 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpExtInst %1 13 %396 
                                Private f32* %398 = OpAccessChain %9 %25 
                                                      OpStore %398 %397 
                                Private f32* %399 = OpAccessChain %9 %25 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpFMul %400 %283 
                                Private f32* %402 = OpAccessChain %71 %107 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                Private f32* %405 = OpAccessChain %9 %25 
                                                      OpStore %405 %404 
                                Private f32* %406 = OpAccessChain %9 %25 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpFNegate %407 
                                         f32 %409 = OpLoad %65 
                                         f32 %410 = OpFAdd %408 %409 
                                Private f32* %411 = OpAccessChain %312 %25 
                                                      OpStore %411 %410 
                                       f32_2 %412 = OpLoad %312 
                                Uniform f32* %413 = OpAccessChain %14 %120 
                                         f32 %414 = OpLoad %413 
                                Uniform f32* %415 = OpAccessChain %14 %120 
                                         f32 %416 = OpLoad %415 
                                       f32_2 %417 = OpCompositeConstruct %414 %416 
                                         f32 %418 = OpCompositeExtract %417 0 
                                         f32 %419 = OpCompositeExtract %417 1 
                                       f32_2 %420 = OpCompositeConstruct %418 %419 
                                       f32_2 %421 = OpFMul %412 %420 
                                       f32_3 %422 = OpLoad %9 
                                       f32_3 %423 = OpVectorShuffle %422 %421 3 1 4 
                                                      OpStore %9 %423 
                         read_only Texture2D %424 = OpLoad %134 
                                     sampler %425 = OpLoad %138 
                  read_only Texture2DSampled %426 = OpSampledImage %424 %425 
                                       f32_3 %427 = OpLoad %9 
                                       f32_2 %428 = OpVectorShuffle %427 %427 0 2 
                                       f32_4 %429 = OpImageSampleImplicitLod %426 %428 
                                         f32 %430 = OpCompositeExtract %429 1 
                                Private f32* %431 = OpAccessChain %9 %25 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %9 %25 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFMul %433 %275 
                                Private f32* %435 = OpAccessChain %28 %25 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %9 %25 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %9 %25 
                                         f32 %440 = OpLoad %439 
                                Uniform f32* %442 = OpAccessChain %14 %441 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFMul %440 %443 
                                Private f32* %445 = OpAccessChain %9 %25 
                                                      OpStore %445 %444 
                                       f32_3 %448 = OpLoad %9 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
                                       f32_3 %451 = OpFMul %449 %450 
                                       f32_3 %452 = OpLoad %89 
                                       f32_3 %453 = OpFAdd %451 %452 
                                       f32_4 %454 = OpLoad %447 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
                                                      OpStore %447 %455 
                                 Output f32* %458 = OpAccessChain %447 %456 
                                                      OpStore %458 %45 
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