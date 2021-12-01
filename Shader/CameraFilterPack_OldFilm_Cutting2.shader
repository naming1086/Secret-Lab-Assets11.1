//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/OldFilm_Cutting2" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 27946
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
uniform 	float _Speed;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6 = u_xlat0.x * 16.0;
    u_xlat1.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat6 = u_xlat0.y * u_xlat6;
    u_xlat6 = u_xlat1.y * u_xlat6;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * 0.400000006;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 + _Value2;
    u_xlat9 = _TimeX * 15.0;
    u_xlat9 = trunc(u_xlat9);
    u_xlat1.x = u_xlat9 + 23.0;
    u_xlat9 = dot(vec2(u_xlat9), vec2(12.9898005, 78.2330017));
    u_xlat9 = sin(u_xlat9);
    u_xlat9 = u_xlat9 * 43758.5469;
    u_xlat2.x = fract(u_xlat9);
    u_xlat9 = dot(u_xlat1.xx, vec2(12.9898005, 78.2330017));
    u_xlat9 = sin(u_xlat9);
    u_xlat9 = u_xlat9 * 43758.5469;
    u_xlat2.y = fract(u_xlat9);
    u_xlat1.xyw = u_xlat2.xyy * vec3(-0.00800000038, 0.00400000019, 0.00999999978) + u_xlat0.xyy;
    u_xlat1.z = _TimeX * _Speed + u_xlat0.x;
    u_xlat2 = texture(_MainTex2, u_xlat1.zw);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.xyw = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = vec3(_Value3) * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyw;
    u_xlat0.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz + (-vec3(vec3(_Value, _Value, _Value)));
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
; Bound: 274
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %74 %252 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %12 0 Offset 12 
                                                      OpMemberDecorate %12 1 Offset 12 
                                                      OpMemberDecorate %12 2 Offset 12 
                                                      OpMemberDecorate %12 3 Offset 12 
                                                      OpMemberDecorate %12 4 Offset 12 
                                                      OpMemberDecorate %12 5 Offset 12 
                                                      OpMemberDecorate %12 6 Offset 12 
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 74 
                                                      OpDecorate %101 DescriptorSet 101 
                                                      OpDecorate %101 Binding 101 
                                                      OpDecorate %105 DescriptorSet 105 
                                                      OpDecorate %105 Binding 105 
                                                      OpDecorate %235 DescriptorSet 235 
                                                      OpDecorate %235 Binding 235 
                                                      OpDecorate %237 DescriptorSet 237 
                                                      OpDecorate %237 Binding 237 
                                                      OpDecorate %252 Location 252 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeVector %6 4 
                                              %12 = OpTypeStruct %6 %6 %6 %6 %6 %10 %11 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 0 
                                              %17 = OpTypePointer Uniform %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.674022E-40 
                                          f32 %34 = OpConstant 3.674022E-40 
                                        f32_2 %35 = OpConstantComposite %33 %34 
                                          f32 %39 = OpConstant 3.674022E-40 
                                          f32 %52 = OpConstant 3.674022E-40 
                                              %55 = OpTypePointer Private %11 
                               Private f32_4* %56 = OpVariable Private 
                                          u32 %60 = OpConstant 1 
                                              %73 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %76 = OpConstant 6 
                                              %77 = OpTypePointer Uniform %11 
                                              %88 = OpTypePointer Private %10 
                               Private f32_2* %89 = OpVariable Private 
                                          f32 %92 = OpConstant 3.674022E-40 
                                          f32 %93 = OpConstant 3.674022E-40 
                                        f32_2 %94 = OpConstantComposite %92 %93 
                                              %99 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %100 = OpTypePointer UniformConstant %99 
        UniformConstant read_only Texture2D* %101 = OpVariable UniformConstant 
                                             %103 = OpTypeSampler 
                                             %104 = OpTypePointer UniformConstant %103 
                    UniformConstant sampler* %105 = OpVariable UniformConstant 
                                             %107 = OpTypeSampledImage %99 
                              Private f32_3* %114 = OpVariable Private 
                                         f32 %117 = OpConstant 3.674022E-40 
                                       f32_3 %118 = OpConstantComposite %117 %117 %117 
                                         f32 %120 = OpConstant 3.674022E-40 
                                       f32_3 %121 = OpConstantComposite %120 %120 %120 
                                         i32 %123 = OpConstant 4 
                                       f32_2 %137 = OpConstantComposite %120 %120 
                                         f32 %159 = OpConstant 3.674022E-40 
                                         f32 %168 = OpConstant 3.674022E-40 
                                         i32 %177 = OpConstant 3 
                                         f32 %189 = OpConstant 3.674022E-40 
                                         f32 %190 = OpConstant 3.674022E-40 
                                         f32 %191 = OpConstant 3.674022E-40 
                                       f32_3 %192 = OpConstantComposite %189 %190 %191 
                                             %197 = OpTypeBool 
                                             %198 = OpTypePointer Private %197 
                               Private bool* %199 = OpVariable Private 
                                         i32 %200 = OpConstant 5 
                                         f32 %203 = OpConstant 3.674022E-40 
                                             %206 = OpTypePointer Function %10 
                                         f32 %219 = OpConstant 3.674022E-40 
                                         i32 %227 = OpConstant 1 
        UniformConstant read_only Texture2D* %235 = OpVariable UniformConstant 
                    UniformConstant sampler* %237 = OpVariable UniformConstant 
                                         f32 %245 = OpConstant 3.674022E-40 
                                       f32_3 %246 = OpConstantComposite %245 %245 %245 
                                             %251 = OpTypePointer Output %11 
                               Output f32_4* %252 = OpVariable Output 
                                         i32 %254 = OpConstant 2 
                                         u32 %270 = OpConstant 3 
                                             %271 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %207 = OpVariable Function 
                                 Uniform f32* %18 = OpAccessChain %14 %16 
                                          f32 %19 = OpLoad %18 
                                          f32 %21 = OpFMul %19 %20 
                                 Private f32* %25 = OpAccessChain %9 %23 
                                                      OpStore %25 %21 
                                 Private f32* %26 = OpAccessChain %9 %23 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpExtInst %1 3 %27 
                                 Private f32* %29 = OpAccessChain %9 %23 
                                                      OpStore %29 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 0 
                                          f32 %36 = OpDot %32 %35 
                                                      OpStore %30 %36 
                                 Private f32* %37 = OpAccessChain %9 %23 
                                          f32 %38 = OpLoad %37 
                                          f32 %40 = OpFAdd %38 %39 
                                 Private f32* %41 = OpAccessChain %9 %23 
                                                      OpStore %41 %40 
                                        f32_3 %42 = OpLoad %9 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 0 
                                          f32 %44 = OpDot %43 %35 
                                 Private f32* %45 = OpAccessChain %9 %23 
                                                      OpStore %45 %44 
                                 Private f32* %46 = OpAccessChain %9 %23 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpExtInst %1 13 %47 
                                 Private f32* %49 = OpAccessChain %9 %23 
                                                      OpStore %49 %48 
                                 Private f32* %50 = OpAccessChain %9 %23 
                                          f32 %51 = OpLoad %50 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %23 
                                                      OpStore %54 %53 
                                 Private f32* %57 = OpAccessChain %9 %23 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpExtInst %1 10 %58 
                                 Private f32* %61 = OpAccessChain %56 %60 
                                                      OpStore %61 %59 
                                          f32 %62 = OpLoad %30 
                                          f32 %63 = OpExtInst %1 13 %62 
                                 Private f32* %64 = OpAccessChain %9 %23 
                                                      OpStore %64 %63 
                                 Private f32* %65 = OpAccessChain %9 %23 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %66 %52 
                                 Private f32* %68 = OpAccessChain %9 %23 
                                                      OpStore %68 %67 
                                 Private f32* %69 = OpAccessChain %9 %23 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpExtInst %1 10 %70 
                                 Private f32* %72 = OpAccessChain %56 %23 
                                                      OpStore %72 %71 
                                        f32_2 %75 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %78 = OpAccessChain %14 %76 
                                        f32_4 %79 = OpLoad %78 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_2 %81 = OpFMul %75 %80 
                               Uniform f32_4* %82 = OpAccessChain %14 %76 
                                        f32_4 %83 = OpLoad %82 
                                        f32_2 %84 = OpVectorShuffle %83 %83 2 3 
                                        f32_2 %85 = OpFAdd %81 %84 
                                        f32_3 %86 = OpLoad %9 
                                        f32_3 %87 = OpVectorShuffle %86 %85 3 4 2 
                                                      OpStore %9 %87 
                                        f32_4 %90 = OpLoad %56 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_2 %95 = OpFMul %91 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                        f32_2 %98 = OpFAdd %95 %97 
                                                      OpStore %89 %98 
                         read_only Texture2D %102 = OpLoad %101 
                                     sampler %106 = OpLoad %105 
                  read_only Texture2DSampled %108 = OpSampledImage %102 %106 
                                       f32_2 %109 = OpLoad %89 
                                       f32_4 %110 = OpImageSampleImplicitLod %108 %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_4 %112 = OpLoad %56 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 1 5 6 
                                                      OpStore %56 %113 
                                       f32_4 %115 = OpLoad %56 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 2 3 
                                       f32_3 %119 = OpFMul %116 %118 
                                       f32_3 %122 = OpFAdd %119 %121 
                                                      OpStore %114 %122 
                                Uniform f32* %124 = OpAccessChain %14 %123 
                                         f32 %125 = OpLoad %124 
                                       f32_3 %126 = OpCompositeConstruct %125 %125 %125 
                                       f32_3 %127 = OpLoad %114 
                                       f32_3 %128 = OpFMul %126 %127 
                                       f32_4 %129 = OpLoad %56 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 2 3 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %56 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 1 5 6 
                                                      OpStore %56 %133 
                                       f32_3 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFNegate %135 
                                       f32_2 %138 = OpFAdd %136 %137 
                                                      OpStore %89 %138 
                                Private f32* %139 = OpAccessChain %9 %23 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %89 %23 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFMul %140 %142 
                                Private f32* %144 = OpAccessChain %114 %23 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %9 %60 
                                         f32 %146 = OpLoad %145 
                                Private f32* %147 = OpAccessChain %114 %23 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFMul %146 %148 
                                Private f32* %150 = OpAccessChain %114 %23 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %89 %60 
                                         f32 %152 = OpLoad %151 
                                Private f32* %153 = OpAccessChain %114 %23 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFMul %152 %154 
                                Private f32* %156 = OpAccessChain %114 %23 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %114 %23 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                Private f32* %161 = OpAccessChain %114 %23 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %114 %23 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpExtInst %1 30 %163 
                                Private f32* %165 = OpAccessChain %114 %23 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %114 %23 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                Private f32* %170 = OpAccessChain %114 %23 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %114 %23 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpExtInst %1 29 %172 
                                Private f32* %174 = OpAccessChain %114 %23 
                                                      OpStore %174 %173 
                                Private f32* %175 = OpAccessChain %114 %23 
                                         f32 %176 = OpLoad %175 
                                Uniform f32* %178 = OpAccessChain %14 %177 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFAdd %176 %179 
                                Private f32* %181 = OpAccessChain %114 %23 
                                                      OpStore %181 %180 
                                       f32_4 %182 = OpLoad %56 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 2 3 
                                       f32_3 %184 = OpLoad %114 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 0 0 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %56 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 1 5 6 
                                                      OpStore %56 %188 
                                       f32_4 %193 = OpLoad %56 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 2 3 
                                         f32 %195 = OpDot %192 %194 
                                Private f32* %196 = OpAccessChain %56 %23 
                                                      OpStore %196 %195 
                                Uniform f32* %201 = OpAccessChain %14 %200 %60 
                                         f32 %202 = OpLoad %201 
                                        bool %204 = OpFOrdLessThan %202 %203 
                                                      OpStore %199 %204 
                                        bool %205 = OpLoad %199 
                                                      OpSelectionMerge %209 None 
                                                      OpBranchConditional %205 %208 %211 
                                             %208 = OpLabel 
                                       f32_2 %210 = OpLoad %89 
                                                      OpStore %207 %210 
                                                      OpBranch %209 
                                             %211 = OpLabel 
                                       f32_3 %212 = OpLoad %9 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                                      OpStore %207 %213 
                                                      OpBranch %209 
                                             %209 = OpLabel 
                                       f32_2 %214 = OpLoad %207 
                                       f32_3 %215 = OpLoad %9 
                                       f32_3 %216 = OpVectorShuffle %215 %214 3 4 2 
                                                      OpStore %9 %216 
                                Private f32* %217 = OpAccessChain %56 %60 
                                         f32 %218 = OpLoad %217 
                                         f32 %220 = OpFMul %218 %219 
                                Private f32* %221 = OpAccessChain %9 %60 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFAdd %220 %222 
                                Private f32* %224 = OpAccessChain %114 %60 
                                                      OpStore %224 %223 
                                Uniform f32* %225 = OpAccessChain %14 %16 
                                         f32 %226 = OpLoad %225 
                                Uniform f32* %228 = OpAccessChain %14 %227 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFMul %226 %229 
                                Private f32* %231 = OpAccessChain %9 %23 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFAdd %230 %232 
                                Private f32* %234 = OpAccessChain %114 %23 
                                                      OpStore %234 %233 
                         read_only Texture2D %236 = OpLoad %235 
                                     sampler %238 = OpLoad %237 
                  read_only Texture2DSampled %239 = OpSampledImage %236 %238 
                                       f32_3 %240 = OpLoad %114 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                                       f32_4 %242 = OpImageSampleImplicitLod %239 %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                                      OpStore %9 %243 
                                       f32_3 %244 = OpLoad %9 
                                       f32_3 %247 = OpFMul %244 %246 
                                       f32_4 %248 = OpLoad %56 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 0 0 
                                       f32_3 %250 = OpFAdd %247 %249 
                                                      OpStore %9 %250 
                                       f32_3 %253 = OpLoad %9 
                                Uniform f32* %255 = OpAccessChain %14 %254 
                                         f32 %256 = OpLoad %255 
                                Uniform f32* %257 = OpAccessChain %14 %254 
                                         f32 %258 = OpLoad %257 
                                Uniform f32* %259 = OpAccessChain %14 %254 
                                         f32 %260 = OpLoad %259 
                                       f32_3 %261 = OpCompositeConstruct %256 %258 %260 
                                         f32 %262 = OpCompositeExtract %261 0 
                                         f32 %263 = OpCompositeExtract %261 1 
                                         f32 %264 = OpCompositeExtract %261 2 
                                       f32_3 %265 = OpCompositeConstruct %262 %263 %264 
                                       f32_3 %266 = OpFNegate %265 
                                       f32_3 %267 = OpFAdd %253 %266 
                                       f32_4 %268 = OpLoad %252 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %252 %269 
                                 Output f32* %272 = OpAccessChain %252 %270 
                                                      OpStore %272 %120 
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