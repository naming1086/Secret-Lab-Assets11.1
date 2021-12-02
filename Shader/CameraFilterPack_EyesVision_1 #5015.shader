//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/EyesVision_1" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3267
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat6;
vec2 u_xlat7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = _TimeX * _Value3;
    u_xlat0 = trunc(u_xlat0);
    u_xlat3.x = u_xlat0 * 2.0 + 23.0;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat1.y = fract(u_xlat3.x);
    u_xlat3.x = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat1.x = fract(u_xlat3.x);
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + u_xlat3.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_Value, _Value));
    u_xlat7.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat7.xy;
    u_xlat9 = cos(u_xlat7.y);
    u_xlat7.x = sin(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * 0.5 + 1.0;
    u_xlat9 = u_xlat9 * 0.5 + 1.0;
    u_xlat10 = sin(u_xlat9);
    u_xlat2.x = u_xlat10 + u_xlat7.x;
    u_xlat7.x = cos(u_xlat7.x);
    u_xlat2.y = u_xlat9 + u_xlat7.x;
    u_xlat1.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat1.xy;
    u_xlat1 = texture(_MainTex2, u_xlat1.xy);
    u_xlat3.xy = u_xlat1.xy * vec2(0.125, 0.125) + u_xlat3.xy;
    u_xlat9 = (-u_xlat3.y) + 0.5;
    u_xlat2 = texture(_MainTex, u_xlat3.xy);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
    u_xlat3.x = dot(vec2(u_xlat9), vec2(u_xlat9));
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat6 = _TimeX * 0.5;
    u_xlat6 = sin(u_xlat6);
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat0 = (-u_xlat6) * u_xlat0 + u_xlat0;
    u_xlat0 = (-u_xlat0) + u_xlat3.x;
    u_xlat0 = u_xlat0 * -1.66666663;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = (-u_xlat3.x) * u_xlat0 + 1.0;
    u_xlat0 = u_xlat0 * _Value4;
    SV_Target0.xyz = vec3(u_xlat0) * (-u_xlat1.xyz) + u_xlat1.xyz;
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
; Bound: 317
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %79 %303 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 79 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %212 DescriptorSet 212 
                                                      OpDecorate %212 Binding 212 
                                                      OpDecorate %231 DescriptorSet 231 
                                                      OpDecorate %231 Binding 231 
                                                      OpDecorate %233 DescriptorSet 233 
                                                      OpDecorate %233 Binding 233 
                                                      OpDecorate %303 Location 303 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 2 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %9 %10 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 0 
                                              %16 = OpTypePointer Uniform %6 
                                          i32 %19 = OpConstant 3 
                                              %25 = OpTypePointer Private %9 
                               Private f32_2* %26 = OpVariable Private 
                                          f32 %28 = OpConstant 3.674022E-40 
                                          f32 %30 = OpConstant 3.674022E-40 
                                              %32 = OpTypeInt 32 0 
                                          u32 %33 = OpConstant 0 
                                          f32 %40 = OpConstant 3.674022E-40 
                                          f32 %41 = OpConstant 3.674022E-40 
                                        f32_2 %42 = OpConstantComposite %40 %41 
                                          f32 %51 = OpConstant 3.674022E-40 
                                              %54 = OpTypeVector %6 3 
                                              %55 = OpTypePointer Private %54 
                               Private f32_3* %56 = OpVariable Private 
                                          u32 %60 = OpConstant 1 
                                              %78 = OpTypePointer Input %9 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %81 = OpConstant 6 
                                              %82 = OpTypePointer Uniform %10 
                                          f32 %93 = OpConstant 3.674022E-40 
                                          f32 %94 = OpConstant 3.674022E-40 
                                        f32_2 %95 = OpConstantComposite %93 %94 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_2 %104 = OpConstantComposite %103 %103 
                                         f32 %106 = OpConstant 3.674022E-40 
                                         f32 %107 = OpConstant 3.674022E-40 
                                       f32_2 %108 = OpConstantComposite %106 %107 
                                             %112 = OpTypeBool 
                                             %113 = OpTypePointer Private %112 
                               Private bool* %114 = OpVariable Private 
                                         i32 %115 = OpConstant 5 
                                         f32 %118 = OpConstant 3.674022E-40 
                              Private f32_2* %120 = OpVariable Private 
                                         f32 %123 = OpConstant 3.674022E-40 
                                       f32_2 %124 = OpConstantComposite %123 %123 
                                             %127 = OpTypePointer Function %9 
                                         i32 %136 = OpConstant 1 
                                         i32 %146 = OpConstant 2 
                                Private f32* %161 = OpVariable Private 
                                         f32 %171 = OpConstant 3.674022E-40 
                                Private f32* %178 = OpVariable Private 
                              Private f32_3* %181 = OpVariable Private 
                                         f32 %198 = OpConstant 3.674022E-40 
                                       f32_2 %199 = OpConstantComposite %198 %198 
                                             %206 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %207 = OpTypePointer UniformConstant %206 
        UniformConstant read_only Texture2D* %208 = OpVariable UniformConstant 
                                             %210 = OpTypeSampler 
                                             %211 = OpTypePointer UniformConstant %210 
                    UniformConstant sampler* %212 = OpVariable UniformConstant 
                                             %214 = OpTypeSampledImage %206 
                                         f32 %222 = OpConstant 3.674022E-40 
                                       f32_2 %223 = OpConstantComposite %222 %222 
        UniformConstant read_only Texture2D* %231 = OpVariable UniformConstant 
                    UniformConstant sampler* %233 = OpVariable UniformConstant 
                                         f32 %243 = OpConstant 3.674022E-40 
                                         f32 %244 = OpConstant 3.674022E-40 
                                       f32_3 %245 = OpConstantComposite %243 %243 %244 
                                Private f32* %257 = OpVariable Private 
                                         f32 %278 = OpConstant 3.674022E-40 
                                         f32 %283 = OpConstant 3.674022E-40 
                                         f32 %285 = OpConstant 3.674022E-40 
                                         i32 %298 = OpConstant 4 
                                             %302 = OpTypePointer Output %10 
                               Output f32_4* %303 = OpVariable Output 
                                         u32 %313 = OpConstant 3 
                                             %314 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %128 = OpVariable Function 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                 Uniform f32* %20 = OpAccessChain %13 %19 
                                          f32 %21 = OpLoad %20 
                                          f32 %22 = OpFMul %18 %21 
                                                      OpStore %8 %22 
                                          f32 %23 = OpLoad %8 
                                          f32 %24 = OpExtInst %1 3 %23 
                                                      OpStore %8 %24 
                                          f32 %27 = OpLoad %8 
                                          f32 %29 = OpFMul %27 %28 
                                          f32 %31 = OpFAdd %29 %30 
                                 Private f32* %34 = OpAccessChain %26 %33 
                                                      OpStore %34 %31 
                                          f32 %35 = OpLoad %8 
                                          f32 %36 = OpLoad %8 
                                          f32 %37 = OpFAdd %35 %36 
                                                      OpStore %8 %37 
                                        f32_2 %38 = OpLoad %26 
                                        f32_2 %39 = OpVectorShuffle %38 %38 0 0 
                                          f32 %43 = OpDot %39 %42 
                                 Private f32* %44 = OpAccessChain %26 %33 
                                                      OpStore %44 %43 
                                 Private f32* %45 = OpAccessChain %26 %33 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpExtInst %1 13 %46 
                                 Private f32* %48 = OpAccessChain %26 %33 
                                                      OpStore %48 %47 
                                 Private f32* %49 = OpAccessChain %26 %33 
                                          f32 %50 = OpLoad %49 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %26 %33 
                                                      OpStore %53 %52 
                                 Private f32* %57 = OpAccessChain %26 %33 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpExtInst %1 10 %58 
                                 Private f32* %61 = OpAccessChain %56 %60 
                                                      OpStore %61 %59 
                                          f32 %62 = OpLoad %8 
                                        f32_2 %63 = OpCompositeConstruct %62 %62 
                                          f32 %64 = OpDot %63 %42 
                                 Private f32* %65 = OpAccessChain %26 %33 
                                                      OpStore %65 %64 
                                 Private f32* %66 = OpAccessChain %26 %33 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpExtInst %1 13 %67 
                                 Private f32* %69 = OpAccessChain %26 %33 
                                                      OpStore %69 %68 
                                 Private f32* %70 = OpAccessChain %26 %33 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFMul %71 %51 
                                 Private f32* %73 = OpAccessChain %26 %33 
                                                      OpStore %73 %72 
                                 Private f32* %74 = OpAccessChain %26 %33 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpExtInst %1 10 %75 
                                 Private f32* %77 = OpAccessChain %56 %33 
                                                      OpStore %77 %76 
                                        f32_2 %80 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %83 = OpAccessChain %13 %81 
                                        f32_4 %84 = OpLoad %83 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %86 = OpFMul %80 %85 
                               Uniform f32_4* %87 = OpAccessChain %13 %81 
                                        f32_4 %88 = OpLoad %87 
                                        f32_2 %89 = OpVectorShuffle %88 %88 2 3 
                                        f32_2 %90 = OpFAdd %86 %89 
                                                      OpStore %26 %90 
                                        f32_3 %91 = OpLoad %56 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %96 = OpFMul %92 %95 
                                        f32_2 %97 = OpLoad %26 
                                        f32_2 %98 = OpFAdd %96 %97 
                                        f32_3 %99 = OpLoad %56 
                                       f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
                                                      OpStore %56 %100 
                                       f32_3 %101 = OpLoad %56 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_2 %109 = OpFAdd %105 %108 
                                       f32_3 %110 = OpLoad %56 
                                       f32_3 %111 = OpVectorShuffle %110 %109 3 4 2 
                                                      OpStore %56 %111 
                                Uniform f32* %116 = OpAccessChain %13 %115 %60 
                                         f32 %117 = OpLoad %116 
                                        bool %119 = OpFOrdLessThan %117 %118 
                                                      OpStore %114 %119 
                                       f32_2 %121 = OpLoad %26 
                                       f32_2 %122 = OpFNegate %121 
                                       f32_2 %125 = OpFAdd %122 %124 
                                                      OpStore %120 %125 
                                        bool %126 = OpLoad %114 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %126 %129 %132 
                                             %129 = OpLabel 
                                       f32_2 %131 = OpLoad %120 
                                                      OpStore %128 %131 
                                                      OpBranch %130 
                                             %132 = OpLabel 
                                       f32_2 %133 = OpLoad %26 
                                                      OpStore %128 %133 
                                                      OpBranch %130 
                                             %130 = OpLabel 
                                       f32_2 %134 = OpLoad %128 
                                                      OpStore %120 %134 
                                       f32_2 %135 = OpLoad %120 
                                Uniform f32* %137 = OpAccessChain %13 %136 
                                         f32 %138 = OpLoad %137 
                                Uniform f32* %139 = OpAccessChain %13 %136 
                                         f32 %140 = OpLoad %139 
                                       f32_2 %141 = OpCompositeConstruct %138 %140 
                                         f32 %142 = OpCompositeExtract %141 0 
                                         f32 %143 = OpCompositeExtract %141 1 
                                       f32_2 %144 = OpCompositeConstruct %142 %143 
                                       f32_2 %145 = OpFMul %135 %144 
                                                      OpStore %120 %145 
                                Uniform f32* %147 = OpAccessChain %13 %146 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %149 = OpAccessChain %13 %146 
                                         f32 %150 = OpLoad %149 
                                       f32_2 %151 = OpCompositeConstruct %148 %150 
                                         f32 %152 = OpCompositeExtract %151 0 
                                         f32 %153 = OpCompositeExtract %151 1 
                                       f32_2 %154 = OpCompositeConstruct %152 %153 
                                Uniform f32* %155 = OpAccessChain %13 %15 
                                         f32 %156 = OpLoad %155 
                                       f32_2 %157 = OpCompositeConstruct %156 %156 
                                       f32_2 %158 = OpFMul %154 %157 
                                       f32_2 %159 = OpLoad %120 
                                       f32_2 %160 = OpFAdd %158 %159 
                                                      OpStore %120 %160 
                                Private f32* %162 = OpAccessChain %120 %60 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpExtInst %1 14 %163 
                                                      OpStore %161 %164 
                                Private f32* %165 = OpAccessChain %120 %33 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpExtInst %1 13 %166 
                                Private f32* %168 = OpAccessChain %120 %33 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %120 %33 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpFMul %170 %171 
                                         f32 %173 = OpFAdd %172 %123 
                                Private f32* %174 = OpAccessChain %120 %33 
                                                      OpStore %174 %173 
                                         f32 %175 = OpLoad %161 
                                         f32 %176 = OpFMul %175 %171 
                                         f32 %177 = OpFAdd %176 %123 
                                                      OpStore %161 %177 
                                         f32 %179 = OpLoad %161 
                                         f32 %180 = OpExtInst %1 13 %179 
                                                      OpStore %178 %180 
                                         f32 %182 = OpLoad %178 
                                Private f32* %183 = OpAccessChain %120 %33 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFAdd %182 %184 
                                Private f32* %186 = OpAccessChain %181 %33 
                                                      OpStore %186 %185 
                                Private f32* %187 = OpAccessChain %120 %33 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpExtInst %1 14 %188 
                                Private f32* %190 = OpAccessChain %120 %33 
                                                      OpStore %190 %189 
                                         f32 %191 = OpLoad %161 
                                Private f32* %192 = OpAccessChain %120 %33 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %181 %60 
                                                      OpStore %195 %194 
                                       f32_3 %196 = OpLoad %181 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_2 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %56 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_2 %203 = OpFAdd %200 %202 
                                       f32_3 %204 = OpLoad %56 
                                       f32_3 %205 = OpVectorShuffle %204 %203 3 4 2 
                                                      OpStore %56 %205 
                         read_only Texture2D %209 = OpLoad %208 
                                     sampler %213 = OpLoad %212 
                  read_only Texture2DSampled %215 = OpSampledImage %209 %213 
                                       f32_3 %216 = OpLoad %56 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_4 %218 = OpImageSampleImplicitLod %215 %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                                      OpStore %56 %219 
                                       f32_3 %220 = OpLoad %56 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %224 = OpFMul %221 %223 
                                       f32_2 %225 = OpLoad %26 
                                       f32_2 %226 = OpFAdd %224 %225 
                                                      OpStore %26 %226 
                                Private f32* %227 = OpAccessChain %26 %60 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpFAdd %229 %171 
                                                      OpStore %161 %230 
                         read_only Texture2D %232 = OpLoad %231 
                                     sampler %234 = OpLoad %233 
                  read_only Texture2DSampled %235 = OpSampledImage %232 %234 
                                       f32_2 %236 = OpLoad %26 
                                       f32_4 %237 = OpImageSampleImplicitLod %235 %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                                      OpStore %181 %238 
                                       f32_3 %239 = OpLoad %56 
                                       f32_3 %240 = OpLoad %181 
                                       f32_3 %241 = OpFAdd %239 %240 
                                                      OpStore %56 %241 
                                       f32_3 %242 = OpLoad %56 
                                       f32_3 %246 = OpFAdd %242 %245 
                                                      OpStore %56 %246 
                                         f32 %247 = OpLoad %161 
                                       f32_2 %248 = OpCompositeConstruct %247 %247 
                                         f32 %249 = OpLoad %161 
                                       f32_2 %250 = OpCompositeConstruct %249 %249 
                                         f32 %251 = OpDot %248 %250 
                                Private f32* %252 = OpAccessChain %26 %33 
                                                      OpStore %252 %251 
                                Private f32* %253 = OpAccessChain %26 %33 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpExtInst %1 31 %254 
                                Private f32* %256 = OpAccessChain %26 %33 
                                                      OpStore %256 %255 
                                Uniform f32* %258 = OpAccessChain %13 %15 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %259 %171 
                                                      OpStore %257 %260 
                                         f32 %261 = OpLoad %257 
                                         f32 %262 = OpExtInst %1 13 %261 
                                                      OpStore %257 %262 
                                         f32 %263 = OpLoad %257 
                                         f32 %264 = OpLoad %257 
                                         f32 %265 = OpFMul %263 %264 
                                                      OpStore %257 %265 
                                         f32 %266 = OpLoad %257 
                                         f32 %267 = OpFNegate %266 
                                         f32 %268 = OpLoad %8 
                                         f32 %269 = OpFMul %267 %268 
                                         f32 %270 = OpLoad %8 
                                         f32 %271 = OpFAdd %269 %270 
                                                      OpStore %8 %271 
                                         f32 %272 = OpLoad %8 
                                         f32 %273 = OpFNegate %272 
                                Private f32* %274 = OpAccessChain %26 %33 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpFAdd %273 %275 
                                                      OpStore %8 %276 
                                         f32 %277 = OpLoad %8 
                                         f32 %279 = OpFMul %277 %278 
                                                      OpStore %8 %279 
                                         f32 %280 = OpLoad %8 
                                         f32 %281 = OpExtInst %1 43 %280 %118 %123 
                                                      OpStore %8 %281 
                                         f32 %282 = OpLoad %8 
                                         f32 %284 = OpFMul %282 %283 
                                         f32 %286 = OpFAdd %284 %285 
                                Private f32* %287 = OpAccessChain %26 %33 
                                                      OpStore %287 %286 
                                         f32 %288 = OpLoad %8 
                                         f32 %289 = OpLoad %8 
                                         f32 %290 = OpFMul %288 %289 
                                                      OpStore %8 %290 
                                Private f32* %291 = OpAccessChain %26 %33 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFNegate %292 
                                         f32 %294 = OpLoad %8 
                                         f32 %295 = OpFMul %293 %294 
                                         f32 %296 = OpFAdd %295 %123 
                                                      OpStore %8 %296 
                                         f32 %297 = OpLoad %8 
                                Uniform f32* %299 = OpAccessChain %13 %298 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpFMul %297 %300 
                                                      OpStore %8 %301 
                                         f32 %304 = OpLoad %8 
                                       f32_3 %305 = OpCompositeConstruct %304 %304 %304 
                                       f32_3 %306 = OpLoad %56 
                                       f32_3 %307 = OpFNegate %306 
                                       f32_3 %308 = OpFMul %305 %307 
                                       f32_3 %309 = OpLoad %56 
                                       f32_3 %310 = OpFAdd %308 %309 
                                       f32_4 %311 = OpLoad %303 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %303 %312 
                                 Output f32* %315 = OpAccessChain %303 %313 
                                                      OpStore %315 %123 
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