//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/OldFilm_Cutting1" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3476
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
    u_xlat0.xyw = u_xlat2.xyz * vec3(4.0, 4.0, 4.0);
    u_xlat2.xyz = u_xlat1.xyz / vec3(u_xlat6);
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(u_xlat6) + u_xlat2.xyz;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat1.xyz = vec3(_Value3) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat6 = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
    u_xlat6 = u_xlat6 * _Value;
    SV_Target0.xyz = vec3(u_xlat6) / u_xlat0.xyw;
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
; Bound: 280
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %72 %268 
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
                                                      OpDecorate vs_TEXCOORD0 Location 72 
                                                      OpDecorate %100 DescriptorSet 100 
                                                      OpDecorate %100 Binding 100 
                                                      OpDecorate %104 DescriptorSet 104 
                                                      OpDecorate %104 Binding 104 
                                                      OpDecorate %250 DescriptorSet 250 
                                                      OpDecorate %250 Binding 250 
                                                      OpDecorate %252 DescriptorSet 252 
                                                      OpDecorate %252 Binding 252 
                                                      OpDecorate %268 Location 268 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %10 %7 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 0 
                                              %16 = OpTypePointer Uniform %6 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 0 
                                              %23 = OpTypePointer Private %6 
                                 Private f32* %29 = OpVariable Private 
                                          f32 %32 = OpConstant 3.674022E-40 
                                          f32 %33 = OpConstant 3.674022E-40 
                                        f32_2 %34 = OpConstantComposite %32 %33 
                                          f32 %38 = OpConstant 3.674022E-40 
                                          f32 %51 = OpConstant 3.674022E-40 
                               Private f32_4* %54 = OpVariable Private 
                                          u32 %58 = OpConstant 1 
                                              %71 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %75 = OpConstant 6 
                                              %76 = OpTypePointer Uniform %7 
                                              %87 = OpTypePointer Private %10 
                               Private f32_2* %88 = OpVariable Private 
                                          f32 %91 = OpConstant 3.674022E-40 
                                          f32 %92 = OpConstant 3.674022E-40 
                                        f32_2 %93 = OpConstantComposite %91 %92 
                                              %98 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %99 = OpTypePointer UniformConstant %98 
        UniformConstant read_only Texture2D* %100 = OpVariable UniformConstant 
                                             %102 = OpTypeSampler 
                                             %103 = OpTypePointer UniformConstant %102 
                    UniformConstant sampler* %104 = OpVariable UniformConstant 
                                             %106 = OpTypeSampledImage %98 
                                             %110 = OpTypeVector %6 3 
                                         f32 %116 = OpConstant 3.674022E-40 
                              Private f32_2* %119 = OpVariable Private 
                                         f32 %123 = OpConstant 3.674022E-40 
                                       f32_2 %124 = OpConstantComposite %123 %123 
                                         f32 %150 = OpConstant 3.674022E-40 
                                         i32 %159 = OpConstant 3 
                                             %164 = OpTypePointer Private %110 
                              Private f32_3* %165 = OpVariable Private 
                                         i32 %186 = OpConstant 4 
                                         f32 %197 = OpConstant 3.674022E-40 
                                         f32 %198 = OpConstant 3.674022E-40 
                                         f32 %199 = OpConstant 3.674022E-40 
                                       f32_3 %200 = OpConstantComposite %197 %198 %199 
                                         i32 %207 = OpConstant 2 
                                             %212 = OpTypeBool 
                                             %213 = OpTypePointer Private %212 
                               Private bool* %214 = OpVariable Private 
                                         i32 %215 = OpConstant 5 
                                         f32 %218 = OpConstant 3.674022E-40 
                                             %221 = OpTypePointer Function %6 
                                         i32 %234 = OpConstant 1 
                                         f32 %244 = OpConstant 3.674022E-40 
        UniformConstant read_only Texture2D* %250 = OpVariable UniformConstant 
                    UniformConstant sampler* %252 = OpVariable UniformConstant 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_3 %263 = OpConstantComposite %262 %262 %262 
                                             %267 = OpTypePointer Output %7 
                               Output f32_4* %268 = OpVariable Output 
                                         u32 %276 = OpConstant 3 
                                             %277 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %222 = OpVariable Function 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                          f32 %20 = OpFMul %18 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                                      OpStore %24 %20 
                                 Private f32* %25 = OpAccessChain %9 %22 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpExtInst %1 3 %26 
                                 Private f32* %28 = OpAccessChain %9 %22 
                                                      OpStore %28 %27 
                                        f32_4 %30 = OpLoad %9 
                                        f32_2 %31 = OpVectorShuffle %30 %30 0 0 
                                          f32 %35 = OpDot %31 %34 
                                                      OpStore %29 %35 
                                 Private f32* %36 = OpAccessChain %9 %22 
                                          f32 %37 = OpLoad %36 
                                          f32 %39 = OpFAdd %37 %38 
                                 Private f32* %40 = OpAccessChain %9 %22 
                                                      OpStore %40 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_2 %42 = OpVectorShuffle %41 %41 0 0 
                                          f32 %43 = OpDot %42 %34 
                                 Private f32* %44 = OpAccessChain %9 %22 
                                                      OpStore %44 %43 
                                 Private f32* %45 = OpAccessChain %9 %22 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpExtInst %1 13 %46 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                                      OpStore %48 %47 
                                 Private f32* %49 = OpAccessChain %9 %22 
                                          f32 %50 = OpLoad %49 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %22 
                                                      OpStore %53 %52 
                                 Private f32* %55 = OpAccessChain %9 %22 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpExtInst %1 10 %56 
                                 Private f32* %59 = OpAccessChain %54 %58 
                                                      OpStore %59 %57 
                                          f32 %60 = OpLoad %29 
                                          f32 %61 = OpExtInst %1 13 %60 
                                 Private f32* %62 = OpAccessChain %9 %22 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %9 %22 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %64 %51 
                                 Private f32* %66 = OpAccessChain %9 %22 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %9 %22 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 10 %68 
                                 Private f32* %70 = OpAccessChain %54 %22 
                                                      OpStore %70 %69 
                                        f32_2 %73 = OpLoad vs_TEXCOORD0 
                                        f32_2 %74 = OpVectorShuffle %73 %73 1 0 
                               Uniform f32_4* %77 = OpAccessChain %13 %75 
                                        f32_4 %78 = OpLoad %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 1 0 
                                        f32_2 %80 = OpFMul %74 %79 
                               Uniform f32_4* %81 = OpAccessChain %13 %75 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 3 2 
                                        f32_2 %84 = OpFAdd %80 %83 
                                        f32_4 %85 = OpLoad %9 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 2 3 
                                                      OpStore %9 %86 
                                        f32_4 %89 = OpLoad %54 
                                        f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                        f32_2 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_2 %96 = OpVectorShuffle %95 %95 1 0 
                                        f32_2 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                         read_only Texture2D %101 = OpLoad %100 
                                     sampler %105 = OpLoad %104 
                  read_only Texture2DSampled %107 = OpSampledImage %101 %105 
                                       f32_2 %108 = OpLoad %88 
                                       f32_4 %109 = OpImageSampleImplicitLod %107 %108 
                                       f32_3 %111 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_4 %112 = OpLoad %54 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 1 5 6 
                                                      OpStore %54 %113 
                                Private f32* %114 = OpAccessChain %9 %58 
                                         f32 %115 = OpLoad %114 
                                         f32 %117 = OpFMul %115 %116 
                                Private f32* %118 = OpAccessChain %88 %22 
                                                      OpStore %118 %117 
                                       f32_4 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
                                       f32_2 %122 = OpFNegate %121 
                                       f32_2 %125 = OpFAdd %122 %124 
                                                      OpStore %119 %125 
                                Private f32* %126 = OpAccessChain %88 %22 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %119 %58 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Private f32* %131 = OpAccessChain %88 %22 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %9 %22 
                                         f32 %133 = OpLoad %132 
                                Private f32* %134 = OpAccessChain %88 %22 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFMul %133 %135 
                                Private f32* %137 = OpAccessChain %88 %22 
                                                      OpStore %137 %136 
                                Private f32* %138 = OpAccessChain %119 %22 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %88 %22 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFMul %139 %141 
                                Private f32* %143 = OpAccessChain %88 %22 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %88 %22 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 30 %145 
                                Private f32* %147 = OpAccessChain %88 %22 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %88 %22 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                Private f32* %152 = OpAccessChain %88 %22 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %88 %22 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpExtInst %1 29 %154 
                                Private f32* %156 = OpAccessChain %88 %22 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %88 %22 
                                         f32 %158 = OpLoad %157 
                                Uniform f32* %160 = OpAccessChain %13 %159 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpFAdd %158 %161 
                                Private f32* %163 = OpAccessChain %88 %22 
                                                      OpStore %163 %162 
                                       f32_4 %166 = OpLoad %54 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 2 3 
                                       f32_2 %168 = OpLoad %88 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
                                       f32_3 %170 = OpFDiv %167 %169 
                                                      OpStore %165 %170 
                                       f32_4 %171 = OpLoad %54 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 2 3 
                                       f32_3 %173 = OpFNegate %172 
                                       f32_2 %174 = OpLoad %88 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %173 %175 
                                       f32_3 %177 = OpLoad %165 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %165 %178 
                                       f32_2 %179 = OpLoad %88 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                                       f32_4 %181 = OpLoad %54 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 2 3 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %54 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 1 5 6 
                                                      OpStore %54 %185 
                                Uniform f32* %187 = OpAccessChain %13 %186 
                                         f32 %188 = OpLoad %187 
                                       f32_3 %189 = OpCompositeConstruct %188 %188 %188 
                                       f32_3 %190 = OpLoad %165 
                                       f32_3 %191 = OpFMul %189 %190 
                                       f32_4 %192 = OpLoad %54 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 2 3 
                                       f32_3 %194 = OpFAdd %191 %193 
                                       f32_4 %195 = OpLoad %54 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 1 5 6 
                                                      OpStore %54 %196 
                                       f32_4 %201 = OpLoad %54 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 2 3 
                                         f32 %203 = OpDot %200 %202 
                                Private f32* %204 = OpAccessChain %88 %22 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %88 %22 
                                         f32 %206 = OpLoad %205 
                                Uniform f32* %208 = OpAccessChain %13 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %206 %209 
                                Private f32* %211 = OpAccessChain %88 %22 
                                                      OpStore %211 %210 
                                Uniform f32* %216 = OpAccessChain %13 %215 %58 
                                         f32 %217 = OpLoad %216 
                                        bool %219 = OpFOrdLessThan %217 %218 
                                                      OpStore %214 %219 
                                        bool %220 = OpLoad %214 
                                                      OpSelectionMerge %224 None 
                                                      OpBranchConditional %220 %223 %227 
                                             %223 = OpLabel 
                                Private f32* %225 = OpAccessChain %119 %22 
                                         f32 %226 = OpLoad %225 
                                                      OpStore %222 %226 
                                                      OpBranch %224 
                                             %227 = OpLabel 
                                Private f32* %228 = OpAccessChain %9 %22 
                                         f32 %229 = OpLoad %228 
                                                      OpStore %222 %229 
                                                      OpBranch %224 
                                             %224 = OpLabel 
                                         f32 %230 = OpLoad %222 
                                Private f32* %231 = OpAccessChain %9 %22 
                                                      OpStore %231 %230 
                                Uniform f32* %232 = OpAccessChain %13 %15 
                                         f32 %233 = OpLoad %232 
                                Uniform f32* %235 = OpAccessChain %13 %234 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %233 %236 
                                Private f32* %238 = OpAccessChain %9 %58 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFAdd %237 %239 
                                Private f32* %241 = OpAccessChain %119 %22 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %54 %58 
                                         f32 %243 = OpLoad %242 
                                         f32 %245 = OpFMul %243 %244 
                                Private f32* %246 = OpAccessChain %9 %22 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFAdd %245 %247 
                                Private f32* %249 = OpAccessChain %119 %58 
                                                      OpStore %249 %248 
                         read_only Texture2D %251 = OpLoad %250 
                                     sampler %253 = OpLoad %252 
                  read_only Texture2DSampled %254 = OpSampledImage %251 %253 
                                       f32_2 %255 = OpLoad %119 
                                       f32_4 %256 = OpImageSampleImplicitLod %254 %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %9 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 6 
                                                      OpStore %9 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 3 
                                       f32_3 %264 = OpFMul %261 %263 
                                       f32_4 %265 = OpLoad %9 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 6 
                                                      OpStore %9 %266 
                                       f32_2 %269 = OpLoad %88 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 0 0 
                                       f32_4 %271 = OpLoad %9 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 3 
                                       f32_3 %273 = OpFDiv %270 %272 
                                       f32_4 %274 = OpLoad %268 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %268 %275 
                                 Output f32* %278 = OpAccessChain %268 %276 
                                                      OpStore %278 %123 
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