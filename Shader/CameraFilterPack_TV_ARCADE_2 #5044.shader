//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_ARCADE_2" {
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
  GpuProgramID 10067
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
uniform 	float Fade;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.xy = u_xlat6.xy * vec2(2.20000005, 2.20000005);
    u_xlat1.x = abs(u_xlat6.y) * 0.200000003;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.0;
    u_xlat1.x = u_xlat6.x * u_xlat1.x;
    u_xlat6.x = abs(u_xlat1.x) * 0.25;
    u_xlat6.x = u_xlat6.x * u_xlat6.x + 1.0;
    u_xlat1.y = u_xlat6.x * u_xlat6.y;
    u_xlat6.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
    u_xlat0.xy = vec2(Fade) * u_xlat6.xy + u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat6.xy = u_xlat0.yy * vec2(21.0, 29.0);
    u_xlat6.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat6.xy;
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat9 = _TimeX * 0.330000013 + 0.300000012;
    u_xlat9 = u_xlat0.y * 31.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat6.x = u_xlat9 * u_xlat6.x;
    u_xlat9 = u_xlat6.x * 0.00170000002 + u_xlat0.x;
    u_xlat6.x = u_xlat6.x * 0.00170000002 + 0.0250000004;
    u_xlat1.x = u_xlat9 + 0.00100000005;
    u_xlat1.yw = u_xlat0.yy + vec2(0.00100000005, -0.0149999997);
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat2.xyz = u_xlat2.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat9 = _Value2 * (-_TimeX);
    u_xlat9 = fract(u_xlat9);
    u_xlat9 = u_xlat0.y * _Value + (-u_xlat9);
    u_xlat9 = u_xlat9 + -0.0500000007;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = min(u_xlat9, 0.100000001);
    u_xlat1.x = u_xlat9 * 10.0 + -0.5;
    u_xlat9 = u_xlat9 * 100.0;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * -4.0 + 1.0;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * 0.0199999996;
    u_xlat1.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat1.z = u_xlat6.x * 0.75 + u_xlat0.x;
    u_xlat6.xy = u_xlat1.zw + vec2(0.00100000005, 0.00100000005);
    u_xlat1 = texture(_MainTex, u_xlat6.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * u_xlat0.y;
    u_xlat6.x = u_xlat6.x * 16.0;
    u_xlat2.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat2.x;
    u_xlat6.x = u_xlat2.y * u_xlat6.x;
    u_xlat6.x = log2(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 0.300000012;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.94000006, 2.66000009);
    u_xlat6.x = u_xlat0.y * _ScreenResolution.y;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xw = vec2(_TimeX) * vec2(3.5, 110.0);
    u_xlat0.x = u_xlat6.x * 1.5 + u_xlat0.x;
    u_xlat0.xw = sin(u_xlat0.xw);
    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.70000005;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Value3;
    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat9 = u_xlat0.w * 0.00999999978 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + (-u_xlat2.xyz);
    SV_Target0.xyz = vec3(Fade) * u_xlat0.xyz + u_xlat2.xyz;
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
; Bound: 500
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %484 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %199 DescriptorSet 199 
                                                      OpDecorate %199 Binding 199 
                                                      OpDecorate %484 Location 484 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 6 
                                              %19 = OpTypePointer Uniform %7 
                                              %30 = OpTypePointer Private %10 
                               Private f32_2* %31 = OpVariable Private 
                                          f32 %34 = OpConstant 3.674022E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                                          f32 %38 = OpConstant 3.674022E-40 
                                        f32_2 %39 = OpConstantComposite %38 %38 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeInt 32 0 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Private %6 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          u32 %50 = OpConstant 0 
                                          f32 %57 = OpConstant 3.674022E-40 
                                          f32 %69 = OpConstant 3.674022E-40 
                                          f32 %87 = OpConstant 3.674022E-40 
                                        f32_2 %88 = OpConstantComposite %87 %87 
                                          f32 %92 = OpConstant 3.674022E-40 
                                        f32_2 %93 = OpConstantComposite %92 %92 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         i32 %103 = OpConstant 4 
                                             %104 = OpTypePointer Uniform %6 
                                         f32 %117 = OpConstant 3.674022E-40 
                                         f32 %125 = OpConstant 3.674022E-40 
                                         f32 %126 = OpConstant 3.674022E-40 
                                       f32_2 %127 = OpConstantComposite %125 %126 
                                         i32 %129 = OpConstant 0 
                                         f32 %133 = OpConstant 3.674022E-40 
                                         f32 %134 = OpConstant 3.674022E-40 
                                       f32_2 %135 = OpConstantComposite %133 %134 
                                Private f32* %147 = OpVariable Private 
                                         f32 %150 = OpConstant 3.674022E-40 
                                         f32 %155 = OpConstant 3.674022E-40 
                                         f32 %168 = OpConstant 3.674022E-40 
                                         f32 %176 = OpConstant 3.674022E-40 
                                         f32 %180 = OpConstant 3.674022E-40 
                                         f32 %185 = OpConstant 3.674022E-40 
                                       f32_2 %186 = OpConstantComposite %180 %185 
                                             %190 = OpTypeVector %6 3 
                                             %191 = OpTypePointer Private %190 
                              Private f32_3* %192 = OpVariable Private 
                                             %193 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %194 = OpTypePointer UniformConstant %193 
        UniformConstant read_only Texture2D* %195 = OpVariable UniformConstant 
                                             %197 = OpTypeSampler 
                                             %198 = OpTypePointer UniformConstant %197 
                    UniformConstant sampler* %199 = OpVariable UniformConstant 
                                             %201 = OpTypeSampledImage %193 
                                         f32 %208 = OpConstant 3.674022E-40 
                                       f32_3 %209 = OpConstantComposite %208 %208 %208 
                                         i32 %211 = OpConstant 2 
                                         i32 %222 = OpConstant 1 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %235 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                         f32 %243 = OpConstant 3.674022E-40 
                                         f32 %255 = OpConstant 3.674022E-40 
                                         f32 %264 = OpConstant 3.674022E-40 
                                         f32 %277 = OpConstant 3.674022E-40 
                                         u32 %282 = OpConstant 2 
                                       f32_2 %286 = OpConstantComposite %180 %180 
                                         f32 %298 = OpConstant 3.674022E-40 
                                       f32_3 %299 = OpConstantComposite %298 %208 %298 
                                         f32 %311 = OpConstant 3.674022E-40 
                                       f32_3 %312 = OpConstantComposite %311 %311 %311 
                                         f32 %316 = OpConstant 3.674022E-40 
                                       f32_3 %317 = OpConstantComposite %316 %316 %316 
                                         f32 %338 = OpConstant 3.674022E-40 
                                       f32_2 %344 = OpConstantComposite %57 %57 
                                         f32 %381 = OpConstant 3.674022E-40 
                                         f32 %382 = OpConstant 3.674022E-40 
                                       f32_3 %383 = OpConstantComposite %381 %382 %381 
                                         i32 %389 = OpConstant 5 
                                Private f32* %403 = OpVariable Private 
                                         f32 %406 = OpConstant 3.674022E-40 
                                         f32 %410 = OpConstant 3.674022E-40 
                                         f32 %421 = OpConstant 3.674022E-40 
                                         f32 %431 = OpConstant 3.674022E-40 
                                         i32 %440 = OpConstant 3 
                                         f32 %459 = OpConstant 3.674022E-40 
                                         f32 %468 = OpConstant 3.674022E-40 
                                             %483 = OpTypePointer Output %7 
                               Output f32_4* %484 = OpVariable Output 
                                         u32 %496 = OpConstant 3 
                                             %497 = OpTypePointer Output %6 
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
                                        f32_2 %40 = OpFMul %37 %39 
                                                      OpStore %31 %40 
                                 Private f32* %45 = OpAccessChain %31 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpExtInst %1 4 %46 
                                          f32 %49 = OpFMul %47 %48 
                                 Private f32* %51 = OpAccessChain %41 %50 
                                                      OpStore %51 %49 
                                 Private f32* %52 = OpAccessChain %41 %50 
                                          f32 %53 = OpLoad %52 
                                 Private f32* %54 = OpAccessChain %41 %50 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFMul %53 %55 
                                          f32 %58 = OpFAdd %56 %57 
                                 Private f32* %59 = OpAccessChain %41 %50 
                                                      OpStore %59 %58 
                                 Private f32* %60 = OpAccessChain %31 %50 
                                          f32 %61 = OpLoad %60 
                                 Private f32* %62 = OpAccessChain %41 %50 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %61 %63 
                                 Private f32* %65 = OpAccessChain %41 %50 
                                                      OpStore %65 %64 
                                 Private f32* %66 = OpAccessChain %41 %50 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpExtInst %1 4 %67 
                                          f32 %70 = OpFMul %68 %69 
                                 Private f32* %71 = OpAccessChain %31 %50 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %31 %50 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %31 %50 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFMul %73 %75 
                                          f32 %77 = OpFAdd %76 %57 
                                 Private f32* %78 = OpAccessChain %31 %50 
                                                      OpStore %78 %77 
                                 Private f32* %79 = OpAccessChain %31 %50 
                                          f32 %80 = OpLoad %79 
                                 Private f32* %81 = OpAccessChain %31 %43 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFMul %80 %82 
                                 Private f32* %84 = OpAccessChain %41 %43 
                                                      OpStore %84 %83 
                                        f32_4 %85 = OpLoad %41 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_2 %89 = OpFMul %86 %88 
                                        f32_2 %90 = OpFAdd %89 %88 
                                                      OpStore %31 %90 
                                        f32_2 %91 = OpLoad %31 
                                        f32_2 %94 = OpFMul %91 %93 
                                        f32_2 %97 = OpFAdd %94 %96 
                                                      OpStore %31 %97 
                                        f32_4 %98 = OpLoad %9 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFNegate %99 
                                       f32_2 %101 = OpLoad %31 
                                       f32_2 %102 = OpFAdd %100 %101 
                                                      OpStore %31 %102 
                                Uniform f32* %105 = OpAccessChain %16 %103 
                                         f32 %106 = OpLoad %105 
                                       f32_2 %107 = OpCompositeConstruct %106 %106 
                                       f32_2 %108 = OpLoad %31 
                                       f32_2 %109 = OpFMul %107 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore %9 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %118 = OpCompositeConstruct %117 %117 
                                       f32_2 %119 = OpCompositeConstruct %57 %57 
                                       f32_2 %120 = OpExtInst %1 43 %116 %118 %119 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
                                                      OpStore %9 %122 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 1 1 
                                       f32_2 %128 = OpFMul %124 %127 
                                                      OpStore %31 %128 
                                Uniform f32* %130 = OpAccessChain %16 %129 
                                         f32 %131 = OpLoad %130 
                                       f32_2 %132 = OpCompositeConstruct %131 %131 
                                       f32_2 %136 = OpFMul %132 %135 
                                       f32_2 %137 = OpLoad %31 
                                       f32_2 %138 = OpFAdd %136 %137 
                                                      OpStore %31 %138 
                                       f32_2 %139 = OpLoad %31 
                                       f32_2 %140 = OpExtInst %1 13 %139 
                                                      OpStore %31 %140 
                                Private f32* %141 = OpAccessChain %31 %43 
                                         f32 %142 = OpLoad %141 
                                Private f32* %143 = OpAccessChain %31 %50 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFMul %142 %144 
                                Private f32* %146 = OpAccessChain %31 %50 
                                                      OpStore %146 %145 
                                Uniform f32* %148 = OpAccessChain %16 %129 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %152 = OpFAdd %151 %133 
                                                      OpStore %147 %152 
                                Private f32* %153 = OpAccessChain %9 %43 
                                         f32 %154 = OpLoad %153 
                                         f32 %156 = OpFMul %154 %155 
                                         f32 %157 = OpLoad %147 
                                         f32 %158 = OpFAdd %156 %157 
                                                      OpStore %147 %158 
                                         f32 %159 = OpLoad %147 
                                         f32 %160 = OpExtInst %1 13 %159 
                                                      OpStore %147 %160 
                                         f32 %161 = OpLoad %147 
                                Private f32* %162 = OpAccessChain %31 %50 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Private f32* %165 = OpAccessChain %31 %50 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %31 %50 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                Private f32* %170 = OpAccessChain %9 %50 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFAdd %169 %171 
                                                      OpStore %147 %172 
                                Private f32* %173 = OpAccessChain %31 %50 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFMul %174 %168 
                                         f32 %177 = OpFAdd %175 %176 
                                Private f32* %178 = OpAccessChain %31 %50 
                                                      OpStore %178 %177 
                                         f32 %179 = OpLoad %147 
                                         f32 %181 = OpFAdd %179 %180 
                                Private f32* %182 = OpAccessChain %41 %50 
                                                      OpStore %182 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_2 %184 = OpVectorShuffle %183 %183 1 1 
                                       f32_2 %187 = OpFAdd %184 %186 
                                       f32_4 %188 = OpLoad %41 
                                       f32_4 %189 = OpVectorShuffle %188 %187 0 4 2 5 
                                                      OpStore %41 %189 
                         read_only Texture2D %196 = OpLoad %195 
                                     sampler %200 = OpLoad %199 
                  read_only Texture2DSampled %202 = OpSampledImage %196 %200 
                                       f32_4 %203 = OpLoad %41 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                       f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                                                      OpStore %192 %206 
                                       f32_3 %207 = OpLoad %192 
                                       f32_3 %210 = OpFAdd %207 %209 
                                                      OpStore %192 %210 
                                Uniform f32* %212 = OpAccessChain %16 %211 
                                         f32 %213 = OpLoad %212 
                                Uniform f32* %214 = OpAccessChain %16 %129 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFMul %213 %216 
                                                      OpStore %147 %217 
                                         f32 %218 = OpLoad %147 
                                         f32 %219 = OpExtInst %1 10 %218 
                                                      OpStore %147 %219 
                                Private f32* %220 = OpAccessChain %9 %43 
                                         f32 %221 = OpLoad %220 
                                Uniform f32* %223 = OpAccessChain %16 %222 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %221 %224 
                                         f32 %226 = OpLoad %147 
                                         f32 %227 = OpFNegate %226 
                                         f32 %228 = OpFAdd %225 %227 
                                                      OpStore %147 %228 
                                         f32 %229 = OpLoad %147 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %147 %231 
                                         f32 %232 = OpLoad %147 
                                         f32 %233 = OpExtInst %1 40 %232 %117 
                                                      OpStore %147 %233 
                                         f32 %234 = OpLoad %147 
                                         f32 %236 = OpExtInst %1 37 %234 %235 
                                                      OpStore %147 %236 
                                         f32 %237 = OpLoad %147 
                                         f32 %239 = OpFMul %237 %238 
                                         f32 %240 = OpFAdd %239 %34 
                                Private f32* %241 = OpAccessChain %41 %50 
                                                      OpStore %241 %240 
                                         f32 %242 = OpLoad %147 
                                         f32 %244 = OpFMul %242 %243 
                                                      OpStore %147 %244 
                                         f32 %245 = OpLoad %147 
                                         f32 %246 = OpExtInst %1 13 %245 
                                                      OpStore %147 %246 
                                Private f32* %247 = OpAccessChain %41 %50 
                                         f32 %248 = OpLoad %247 
                                Private f32* %249 = OpAccessChain %41 %50 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFMul %248 %250 
                                Private f32* %252 = OpAccessChain %41 %50 
                                                      OpStore %252 %251 
                                Private f32* %253 = OpAccessChain %41 %50 
                                         f32 %254 = OpLoad %253 
                                         f32 %256 = OpFMul %254 %255 
                                         f32 %257 = OpFAdd %256 %57 
                                Private f32* %258 = OpAccessChain %41 %50 
                                                      OpStore %258 %257 
                                         f32 %259 = OpLoad %147 
                                Private f32* %260 = OpAccessChain %41 %50 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpFMul %259 %261 
                                                      OpStore %147 %262 
                                         f32 %263 = OpLoad %147 
                                         f32 %265 = OpFMul %263 %264 
                                Private f32* %266 = OpAccessChain %41 %50 
                                                      OpStore %266 %265 
                                Private f32* %267 = OpAccessChain %41 %43 
                                                      OpStore %267 %117 
                                       f32_4 %268 = OpLoad %9 
                                       f32_2 %269 = OpVectorShuffle %268 %268 0 1 
                                       f32_4 %270 = OpLoad %41 
                                       f32_2 %271 = OpVectorShuffle %270 %270 0 1 
                                       f32_2 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 2 3 
                                                      OpStore %9 %274 
                                Private f32* %275 = OpAccessChain %31 %50 
                                         f32 %276 = OpLoad %275 
                                         f32 %278 = OpFMul %276 %277 
                                Private f32* %279 = OpAccessChain %9 %50 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFAdd %278 %280 
                                Private f32* %283 = OpAccessChain %41 %282 
                                                      OpStore %283 %281 
                                       f32_4 %284 = OpLoad %41 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_2 %287 = OpFAdd %285 %286 
                                                      OpStore %31 %287 
                         read_only Texture2D %288 = OpLoad %195 
                                     sampler %289 = OpLoad %199 
                  read_only Texture2DSampled %290 = OpSampledImage %288 %289 
                                       f32_2 %291 = OpLoad %31 
                                       f32_4 %292 = OpImageSampleImplicitLod %290 %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_4 %294 = OpLoad %41 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %41 %295 
                                       f32_4 %296 = OpLoad %41 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                                       f32_3 %300 = OpFMul %297 %299 
                                       f32_3 %301 = OpLoad %192 
                                       f32_3 %302 = OpFAdd %300 %301 
                                       f32_4 %303 = OpLoad %41 
                                       f32_4 %304 = OpVectorShuffle %303 %302 4 5 6 3 
                                                      OpStore %41 %304 
                                       f32_4 %305 = OpLoad %41 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                                       f32_4 %307 = OpLoad %41 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %309 = OpFMul %306 %308 
                                                      OpStore %192 %309 
                                       f32_3 %310 = OpLoad %192 
                                       f32_3 %313 = OpFMul %310 %312 
                                                      OpStore %192 %313 
                                       f32_4 %314 = OpLoad %41 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %318 = OpFMul %315 %317 
                                       f32_3 %319 = OpLoad %192 
                                       f32_3 %320 = OpFAdd %318 %319 
                                       f32_4 %321 = OpLoad %41 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %41 %322 
                                       f32_4 %323 = OpLoad %41 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpCompositeConstruct %117 %117 %117 
                                       f32_3 %326 = OpCompositeConstruct %57 %57 %57 
                                       f32_3 %327 = OpExtInst %1 43 %324 %325 %326 
                                       f32_4 %328 = OpLoad %41 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %41 %329 
                                Private f32* %330 = OpAccessChain %9 %50 
                                         f32 %331 = OpLoad %330 
                                Private f32* %332 = OpAccessChain %9 %43 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFMul %331 %333 
                                Private f32* %335 = OpAccessChain %31 %50 
                                                      OpStore %335 %334 
                                Private f32* %336 = OpAccessChain %31 %50 
                                         f32 %337 = OpLoad %336 
                                         f32 %339 = OpFMul %337 %338 
                                Private f32* %340 = OpAccessChain %31 %50 
                                                      OpStore %340 %339 
                                       f32_4 %341 = OpLoad %9 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 1 
                                       f32_2 %343 = OpFNegate %342 
                                       f32_2 %345 = OpFAdd %343 %344 
                                       f32_3 %346 = OpLoad %192 
                                       f32_3 %347 = OpVectorShuffle %346 %345 3 4 2 
                                                      OpStore %192 %347 
                                Private f32* %348 = OpAccessChain %31 %50 
                                         f32 %349 = OpLoad %348 
                                Private f32* %350 = OpAccessChain %192 %50 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFMul %349 %351 
                                Private f32* %353 = OpAccessChain %31 %50 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %192 %43 
                                         f32 %355 = OpLoad %354 
                                Private f32* %356 = OpAccessChain %31 %50 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFMul %355 %357 
                                Private f32* %359 = OpAccessChain %31 %50 
                                                      OpStore %359 %358 
                                Private f32* %360 = OpAccessChain %31 %50 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpExtInst %1 30 %361 
                                Private f32* %363 = OpAccessChain %31 %50 
                                                      OpStore %363 %362 
                                Private f32* %364 = OpAccessChain %31 %50 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFMul %365 %133 
                                Private f32* %367 = OpAccessChain %31 %50 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %31 %50 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 29 %369 
                                Private f32* %371 = OpAccessChain %31 %50 
                                                      OpStore %371 %370 
                                       f32_2 %372 = OpLoad %31 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 0 0 
                                       f32_4 %374 = OpLoad %41 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
                                       f32_3 %376 = OpFMul %373 %375 
                                       f32_4 %377 = OpLoad %41 
                                       f32_4 %378 = OpVectorShuffle %377 %376 4 5 6 3 
                                                      OpStore %41 %378 
                                       f32_4 %379 = OpLoad %41 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %384 = OpFMul %380 %383 
                                       f32_4 %385 = OpLoad %41 
                                       f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                                      OpStore %41 %386 
                                Private f32* %387 = OpAccessChain %9 %43 
                                         f32 %388 = OpLoad %387 
                                Uniform f32* %390 = OpAccessChain %16 %389 %43 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFMul %388 %391 
                                Private f32* %393 = OpAccessChain %31 %50 
                                                      OpStore %393 %392 
                         read_only Texture2D %394 = OpLoad %195 
                                     sampler %395 = OpLoad %199 
                  read_only Texture2DSampled %396 = OpSampledImage %394 %395 
                                       f32_4 %397 = OpLoad %9 
                                       f32_2 %398 = OpVectorShuffle %397 %397 0 1 
                                       f32_4 %399 = OpImageSampleImplicitLod %396 %398 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_4 %401 = OpLoad %9 
                                       f32_4 %402 = OpVectorShuffle %401 %400 4 5 2 6 
                                                      OpStore %9 %402 
                                Uniform f32* %404 = OpAccessChain %16 %129 
                                         f32 %405 = OpLoad %404 
                                         f32 %407 = OpFMul %405 %406 
                                                      OpStore %403 %407 
                                Private f32* %408 = OpAccessChain %31 %50 
                                         f32 %409 = OpLoad %408 
                                         f32 %411 = OpFMul %409 %410 
                                         f32 %412 = OpLoad %403 
                                         f32 %413 = OpFAdd %411 %412 
                                Private f32* %414 = OpAccessChain %31 %50 
                                                      OpStore %414 %413 
                                Private f32* %415 = OpAccessChain %31 %50 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpExtInst %1 13 %416 
                                Private f32* %418 = OpAccessChain %31 %50 
                                                      OpStore %418 %417 
                                Private f32* %419 = OpAccessChain %31 %50 
                                         f32 %420 = OpLoad %419 
                                         f32 %422 = OpFMul %420 %421 
                                         f32 %423 = OpFAdd %422 %421 
                                Private f32* %424 = OpAccessChain %31 %50 
                                                      OpStore %424 %423 
                                Private f32* %425 = OpAccessChain %31 %50 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpExtInst %1 30 %426 
                                Private f32* %428 = OpAccessChain %31 %50 
                                                      OpStore %428 %427 
                                Private f32* %429 = OpAccessChain %31 %50 
                                         f32 %430 = OpLoad %429 
                                         f32 %432 = OpFMul %430 %431 
                                Private f32* %433 = OpAccessChain %31 %50 
                                                      OpStore %433 %432 
                                Private f32* %434 = OpAccessChain %31 %50 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpExtInst %1 29 %435 
                                Private f32* %437 = OpAccessChain %31 %50 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %31 %50 
                                         f32 %439 = OpLoad %438 
                                Uniform f32* %441 = OpAccessChain %16 %440 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFMul %439 %442 
                                Private f32* %444 = OpAccessChain %31 %50 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %31 %50 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFMul %446 %134 
                                         f32 %448 = OpFAdd %447 %311 
                                Private f32* %449 = OpAccessChain %31 %50 
                                                      OpStore %449 %448 
                                       f32_2 %450 = OpLoad %31 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 0 0 
                                       f32_4 %452 = OpLoad %41 
                                       f32_3 %453 = OpVectorShuffle %452 %452 0 1 2 
                                       f32_3 %454 = OpFMul %451 %453 
                                       f32_4 %455 = OpLoad %41 
                                       f32_4 %456 = OpVectorShuffle %455 %454 4 5 6 3 
                                                      OpStore %41 %456 
                                Uniform f32* %457 = OpAccessChain %16 %129 
                                         f32 %458 = OpLoad %457 
                                         f32 %460 = OpFMul %458 %459 
                                Private f32* %461 = OpAccessChain %31 %50 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %31 %50 
                                         f32 %463 = OpLoad %462 
                                         f32 %464 = OpExtInst %1 13 %463 
                                Private f32* %465 = OpAccessChain %31 %50 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %31 %50 
                                         f32 %467 = OpLoad %466 
                                         f32 %469 = OpFMul %467 %468 
                                         f32 %470 = OpFAdd %469 %57 
                                Private f32* %471 = OpAccessChain %31 %50 
                                                      OpStore %471 %470 
                                       f32_4 %472 = OpLoad %41 
                                       f32_3 %473 = OpVectorShuffle %472 %472 0 1 2 
                                       f32_2 %474 = OpLoad %31 
                                       f32_3 %475 = OpVectorShuffle %474 %474 0 0 0 
                                       f32_3 %476 = OpFMul %473 %475 
                                       f32_4 %477 = OpLoad %9 
                                       f32_3 %478 = OpVectorShuffle %477 %477 0 1 3 
                                       f32_3 %479 = OpFNegate %478 
                                       f32_3 %480 = OpFAdd %476 %479 
                                       f32_4 %481 = OpLoad %41 
                                       f32_4 %482 = OpVectorShuffle %481 %480 4 5 6 3 
                                                      OpStore %41 %482 
                                Uniform f32* %485 = OpAccessChain %16 %103 
                                         f32 %486 = OpLoad %485 
                                       f32_3 %487 = OpCompositeConstruct %486 %486 %486 
                                       f32_4 %488 = OpLoad %41 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFMul %487 %489 
                                       f32_4 %491 = OpLoad %9 
                                       f32_3 %492 = OpVectorShuffle %491 %491 0 1 3 
                                       f32_3 %493 = OpFAdd %490 %492 
                                       f32_4 %494 = OpLoad %484 
                                       f32_4 %495 = OpVectorShuffle %494 %493 4 5 6 3 
                                                      OpStore %484 %495 
                                 Output f32* %498 = OpAccessChain %484 %496 
                                                      OpStore %498 %57 
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