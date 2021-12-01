//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/AAA_BloodOnScreen" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 43765
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
uniform 	vec4 _Time;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	vec4 _Color2;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.x = u_xlat0.y * 0.200000003 + 0.519999981;
    u_xlat8.x = (-u_xlat0.y) * 0.5 + u_xlat8.x;
    u_xlat1.xyz = u_xlat0.yxy * vec3(0.5, 16.0, 0.119999997);
    u_xlat8.x = _Value * u_xlat8.x + u_xlat1.x;
    u_xlat12 = sin(u_xlat1.y);
    u_xlat12 = u_xlat12 * _Value;
    u_xlat1.y = u_xlat12 * 0.03125 + u_xlat8.x;
    u_xlat8.x = _Time.x * _Value5;
    u_xlat8.xy = u_xlat8.xx * vec2(8.0, 9.60000038);
    u_xlat8.xy = sin(u_xlat8.xy);
    u_xlat1.x = (-u_xlat8.x) * 0.125 + u_xlat0.x;
    u_xlat2.xy = u_xlat8.xy * vec2(0.125, 0.25) + u_xlat0.xx;
    u_xlat3 = texture(_MainTex2, u_xlat1.xy);
    u_xlat8.x = _Value * 16.0;
    u_xlat12 = u_xlat3.x / u_xlat8.x;
    u_xlat1.xy = u_xlat0.yy * vec2(0.100000001, 0.0199999996) + vec2(0.519999981, 0.620000005);
    u_xlat1.x = (-u_xlat0.y) * 0.119999997 + u_xlat1.x;
    u_xlat5.x = (-u_xlat0.y) * 0.0799999982 + u_xlat1.y;
    u_xlat1.x = _Value * u_xlat1.x + u_xlat1.z;
    u_xlat9.xy = u_xlat0.xy * vec2(4.0, 0.0799999982);
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat5.x = _Value * u_xlat5.x + u_xlat9.y;
    u_xlat9.x = u_xlat9.x * _Value;
    u_xlat2.z = u_xlat9.x * 0.0078125 + u_xlat1.x;
    u_xlat2.w = u_xlat9.x * 0.0078125 + u_xlat5.x;
    u_xlat1.xy = vec2(u_xlat12) + u_xlat2.xz;
    u_xlat1 = texture(_MainTex2, u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat3.xy;
    u_xlat8.x = u_xlat1.x / u_xlat8.x;
    u_xlat8.xy = u_xlat8.xx + u_xlat2.yw;
    u_xlat2 = texture(_MainTex2, u_xlat8.xy);
    u_xlat8.xy = u_xlat1.xy + u_xlat2.xy;
    u_xlat1.x = u_xlat8.x * 0.0500000007;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.xx * vec2(vec2(_Value4, _Value4)) + u_xlat0.xy;
    u_xlat1.x = u_xlat1.x * _Value4;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat8.x * _Value4;
    u_xlat5.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * _Color2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat5.x = _Value * _Value3;
    u_xlat12 = (-u_xlat8.y) * u_xlat5.x + u_xlat1.x;
    u_xlat12 = u_xlat12 * _Value4;
    u_xlat1.x = _Value3 * u_xlat12 + (-u_xlat12);
    u_xlat1.xyz = _Color2.xyz * u_xlat1.xxx + vec3(u_xlat12);
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 414
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %28 %405 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %12 0 Offset 12 
                                                      OpMemberDecorate %12 1 Offset 12 
                                                      OpMemberDecorate %12 2 Offset 12 
                                                      OpMemberDecorate %12 3 Offset 12 
                                                      OpMemberDecorate %12 4 Offset 12 
                                                      OpMemberDecorate %12 5 Offset 12 
                                                      OpMemberDecorate %12 6 Offset 12 
                                                      OpMemberDecorate %12 7 Offset 12 
                                                      OpMemberDecorate %12 8 Offset 12 
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 28 
                                                      OpDecorate %175 DescriptorSet 175 
                                                      OpDecorate %175 Binding 175 
                                                      OpDecorate %179 DescriptorSet 179 
                                                      OpDecorate %179 Binding 179 
                                                      OpDecorate %325 DescriptorSet 325 
                                                      OpDecorate %325 Binding 325 
                                                      OpDecorate %327 DescriptorSet 327 
                                                      OpDecorate %327 Binding 327 
                                                      OpDecorate %405 Location 405 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                              %10 = OpTypeVector %9 4 
                                              %11 = OpTypeVector %9 2 
                                              %12 = OpTypeStruct %10 %9 %9 %9 %9 %9 %10 %11 %10 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32_4; f32; f32; f32; f32; f32; f32_4; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 7 
                                              %17 = OpTypeInt 32 0 
                                          u32 %18 = OpConstant 1 
                                              %19 = OpTypePointer Uniform %9 
                                          f32 %22 = OpConstant 3.674022E-40 
                                              %24 = OpTypeVector %9 3 
                                              %25 = OpTypePointer Private %24 
                               Private f32_3* %26 = OpVariable Private 
                                              %27 = OpTypePointer Input %11 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %30 = OpConstant 8 
                                              %31 = OpTypePointer Uniform %10 
                                              %42 = OpTypePointer Private %9 
                                 Private f32* %43 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                              %50 = OpTypePointer Function %9 
                                              %59 = OpTypePointer Private %11 
                               Private f32_2* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.674022E-40 
                                          f32 %64 = OpConstant 3.674022E-40 
                                        f32_2 %65 = OpConstantComposite %63 %64 
                                          f32 %67 = OpConstant 3.674022E-40 
                                        f32_2 %68 = OpConstantComposite %67 %67 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          f32 %74 = OpConstant 3.674022E-40 
                                        f32_2 %75 = OpConstantComposite %73 %74 
                               Private f32_3* %79 = OpVariable Private 
                                          i32 %85 = OpConstant 1 
                                         f32 %101 = OpConstant 3.674022E-40 
                                         f32 %102 = OpConstant 3.674022E-40 
                                       f32_2 %103 = OpConstantComposite %101 %102 
                              Private f32_3* %125 = OpVariable Private 
                                         f32 %128 = OpConstant 3.674022E-40 
                                         f32 %129 = OpConstant 3.674022E-40 
                                       f32_2 %130 = OpConstantComposite %128 %129 
                                         i32 %136 = OpConstant 0 
                                         u32 %137 = OpConstant 0 
                                         i32 %140 = OpConstant 5 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %148 = OpConstant 3.674022E-40 
                                       f32_2 %149 = OpConstantComposite %147 %148 
                                         f32 %156 = OpConstant 3.674022E-40 
                                             %162 = OpTypePointer Private %10 
                              Private f32_4* %163 = OpVariable Private 
                                         f32 %165 = OpConstant 3.674022E-40 
                                       f32_2 %166 = OpConstantComposite %156 %165 
                                             %173 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                             %174 = OpTypePointer UniformConstant %173 
        UniformConstant read_only Texture2D* %175 = OpVariable UniformConstant 
                                             %177 = OpTypeSampler 
                                             %178 = OpTypePointer UniformConstant %177 
                    UniformConstant sampler* %179 = OpVariable UniformConstant 
                                             %181 = OpTypeSampledImage %173 
                                         u32 %187 = OpConstant 2 
                                Private f32* %191 = OpVariable Private 
                                         f32 %225 = OpConstant 3.674022E-40 
                                         f32 %227 = OpConstant 3.674022E-40 
                                         f32 %232 = OpConstant 3.674022E-40 
                                Private f32* %238 = OpVariable Private 
                              Private f32_3* %254 = OpVariable Private 
                                         u32 %269 = OpConstant 3 
                                         f32 %295 = OpConstant 3.674022E-40 
                                         i32 %304 = OpConstant 4 
        UniformConstant read_only Texture2D* %325 = OpVariable UniformConstant 
                    UniformConstant sampler* %327 = OpVariable UniformConstant 
                                         i32 %340 = OpConstant 2 
                                         i32 %352 = OpConstant 6 
                                         i32 %365 = OpConstant 3 
                                             %404 = OpTypePointer Output %10 
                               Output f32_4* %405 = OpVariable Output 
                                             %411 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %51 = OpVariable Function 
                               Function f32* %245 = OpVariable Function 
                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
                                          f32 %21 = OpLoad %20 
                                         bool %23 = OpFOrdLessThan %21 %22 
                                                      OpStore %8 %23 
                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %32 = OpAccessChain %14 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFMul %29 %34 
                               Uniform f32_4* %36 = OpAccessChain %14 %30 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                        f32_2 %39 = OpFAdd %35 %38 
                                        f32_3 %40 = OpLoad %26 
                                        f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
                                                      OpStore %26 %41 
                                 Private f32* %44 = OpAccessChain %26 %18 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFNegate %45 
                                          f32 %48 = OpFAdd %46 %47 
                                                      OpStore %43 %48 
                                         bool %49 = OpLoad %8 
                                                      OpSelectionMerge %53 None 
                                                      OpBranchConditional %49 %52 %55 
                                              %52 = OpLabel 
                                          f32 %54 = OpLoad %43 
                                                      OpStore %51 %54 
                                                      OpBranch %53 
                                              %55 = OpLabel 
                                 Private f32* %56 = OpAccessChain %26 %18 
                                          f32 %57 = OpLoad %56 
                                                      OpStore %51 %57 
                                                      OpBranch %53 
                                              %53 = OpLabel 
                                          f32 %58 = OpLoad %51 
                                                      OpStore %43 %58 
                                          f32 %61 = OpLoad %43 
                                        f32_2 %62 = OpCompositeConstruct %61 %61 
                                        f32_2 %66 = OpFMul %62 %65 
                                        f32_2 %69 = OpFAdd %66 %68 
                                                      OpStore %60 %69 
                                          f32 %70 = OpLoad %43 
                                        f32_2 %71 = OpCompositeConstruct %70 %70 
                                        f32_2 %72 = OpFNegate %71 
                                        f32_2 %76 = OpFMul %72 %75 
                                        f32_2 %77 = OpLoad %60 
                                        f32_2 %78 = OpFAdd %76 %77 
                                                      OpStore %60 %78 
                                          f32 %80 = OpLoad %43 
                                        f32_2 %81 = OpCompositeConstruct %80 %80 
                                        f32_2 %82 = OpFMul %81 %75 
                                        f32_3 %83 = OpLoad %79 
                                        f32_3 %84 = OpVectorShuffle %83 %82 3 4 2 
                                                      OpStore %79 %84 
                                 Uniform f32* %86 = OpAccessChain %14 %85 
                                          f32 %87 = OpLoad %86 
                                 Uniform f32* %88 = OpAccessChain %14 %85 
                                          f32 %89 = OpLoad %88 
                                        f32_2 %90 = OpCompositeConstruct %87 %89 
                                          f32 %91 = OpCompositeExtract %90 0 
                                          f32 %92 = OpCompositeExtract %90 1 
                                        f32_2 %93 = OpCompositeConstruct %91 %92 
                                        f32_2 %94 = OpLoad %60 
                                        f32_2 %95 = OpFMul %93 %94 
                                        f32_3 %96 = OpLoad %79 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                        f32_2 %98 = OpFAdd %95 %97 
                                                      OpStore %60 %98 
                                        f32_3 %99 = OpLoad %26 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %104 = OpFMul %100 %103 
                                       f32_3 %105 = OpLoad %79 
                                       f32_3 %106 = OpVectorShuffle %105 %104 3 4 2 
                                                      OpStore %79 %106 
                                       f32_3 %107 = OpLoad %79 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 13 %108 
                                       f32_3 %110 = OpLoad %79 
                                       f32_3 %111 = OpVectorShuffle %110 %109 3 4 2 
                                                      OpStore %79 %111 
                                       f32_3 %112 = OpLoad %79 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                Uniform f32* %114 = OpAccessChain %14 %85 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %116 = OpAccessChain %14 %85 
                                         f32 %117 = OpLoad %116 
                                       f32_2 %118 = OpCompositeConstruct %115 %117 
                                         f32 %119 = OpCompositeExtract %118 0 
                                         f32 %120 = OpCompositeExtract %118 1 
                                       f32_2 %121 = OpCompositeConstruct %119 %120 
                                       f32_2 %122 = OpFMul %113 %121 
                                       f32_3 %123 = OpLoad %79 
                                       f32_3 %124 = OpVectorShuffle %123 %122 3 4 2 
                                                      OpStore %79 %124 
                                       f32_3 %126 = OpLoad %79 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %131 = OpFMul %127 %130 
                                       f32_2 %132 = OpLoad %60 
                                       f32_2 %133 = OpFAdd %131 %132 
                                       f32_3 %134 = OpLoad %125 
                                       f32_3 %135 = OpVectorShuffle %134 %133 0 3 4 
                                                      OpStore %125 %135 
                                Uniform f32* %138 = OpAccessChain %14 %136 %137 
                                         f32 %139 = OpLoad %138 
                                Uniform f32* %141 = OpAccessChain %14 %140 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFMul %139 %142 
                                Private f32* %144 = OpAccessChain %60 %137 
                                                      OpStore %144 %143 
                                       f32_2 %145 = OpLoad %60 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %150 = OpFMul %146 %149 
                                                      OpStore %60 %150 
                                       f32_2 %151 = OpLoad %60 
                                       f32_2 %152 = OpExtInst %1 13 %151 
                                                      OpStore %60 %152 
                                Private f32* %153 = OpAccessChain %60 %137 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                         f32 %157 = OpFMul %155 %156 
                                Private f32* %158 = OpAccessChain %26 %137 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %157 %159 
                                Private f32* %161 = OpAccessChain %125 %137 
                                                      OpStore %161 %160 
                                       f32_2 %164 = OpLoad %60 
                                       f32_2 %167 = OpFMul %164 %166 
                                       f32_3 %168 = OpLoad %26 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 0 
                                       f32_2 %170 = OpFAdd %167 %169 
                                       f32_4 %171 = OpLoad %163 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 2 3 
                                                      OpStore %163 %172 
                         read_only Texture2D %176 = OpLoad %175 
                                     sampler %180 = OpLoad %179 
                  read_only Texture2DSampled %182 = OpSampledImage %176 %180 
                                       f32_3 %183 = OpLoad %125 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                       f32_4 %185 = OpImageSampleImplicitLod %182 %184 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                                      OpStore %60 %186 
                                Private f32* %188 = OpAccessChain %125 %187 
                                         f32 %189 = OpLoad %188 
                                Private f32* %190 = OpAccessChain %163 %187 
                                                      OpStore %190 %189 
                                Uniform f32* %192 = OpAccessChain %14 %85 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %193 %101 
                                                      OpStore %191 %194 
                                Private f32* %195 = OpAccessChain %60 %137 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpLoad %191 
                                         f32 %198 = OpFDiv %196 %197 
                                Private f32* %199 = OpAccessChain %79 %137 
                                                      OpStore %199 %198 
                                       f32_3 %200 = OpLoad %79 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 0 
                                       f32_4 %202 = OpLoad %163 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_2 %204 = OpFAdd %201 %203 
                                       f32_3 %205 = OpLoad %79 
                                       f32_3 %206 = OpVectorShuffle %205 %204 3 1 4 
                                                      OpStore %79 %206 
                         read_only Texture2D %207 = OpLoad %175 
                                     sampler %208 = OpLoad %179 
                  read_only Texture2DSampled %209 = OpSampledImage %207 %208 
                                       f32_3 %210 = OpLoad %79 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 2 
                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_3 %214 = OpLoad %79 
                                       f32_3 %215 = OpVectorShuffle %214 %213 3 1 4 
                                                      OpStore %79 %215 
                                       f32_2 %216 = OpLoad %60 
                                       f32_3 %217 = OpLoad %79 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 2 
                                       f32_2 %219 = OpFAdd %216 %218 
                                                      OpStore %60 %219 
                                Private f32* %220 = OpAccessChain %60 %137 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpLoad %191 
                                         f32 %223 = OpFDiv %221 %222 
                                                      OpStore %191 %223 
                                         f32 %224 = OpLoad %43 
                                         f32 %226 = OpFMul %224 %225 
                                         f32 %228 = OpFAdd %226 %227 
                                Private f32* %229 = OpAccessChain %79 %137 
                                                      OpStore %229 %228 
                                         f32 %230 = OpLoad %43 
                                         f32 %231 = OpFNegate %230 
                                         f32 %233 = OpFMul %231 %232 
                                Private f32* %234 = OpAccessChain %79 %137 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFAdd %233 %235 
                                Private f32* %237 = OpAccessChain %79 %137 
                                                      OpStore %237 %236 
                                         f32 %239 = OpLoad %43 
                                         f32 %240 = OpFMul %239 %232 
                                                      OpStore %238 %240 
                                         f32 %241 = OpLoad %43 
                                         f32 %242 = OpFNegate %241 
                                         f32 %243 = OpFAdd %242 %47 
                                                      OpStore %43 %243 
                                        bool %244 = OpLoad %8 
                                                      OpSelectionMerge %247 None 
                                                      OpBranchConditional %244 %246 %249 
                                             %246 = OpLabel 
                                         f32 %248 = OpLoad %43 
                                                      OpStore %245 %248 
                                                      OpBranch %247 
                                             %249 = OpLabel 
                                Private f32* %250 = OpAccessChain %26 %18 
                                         f32 %251 = OpLoad %250 
                                                      OpStore %245 %251 
                                                      OpBranch %247 
                                             %247 = OpLabel 
                                         f32 %252 = OpLoad %245 
                                Private f32* %253 = OpAccessChain %26 %187 
                                                      OpStore %253 %252 
                                Uniform f32* %255 = OpAccessChain %14 %85 
                                         f32 %256 = OpLoad %255 
                                Private f32* %257 = OpAccessChain %79 %137 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                         f32 %260 = OpLoad %238 
                                         f32 %261 = OpFAdd %259 %260 
                                Private f32* %262 = OpAccessChain %254 %137 
                                                      OpStore %262 %261 
                                Private f32* %263 = OpAccessChain %79 %18 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFMul %264 %129 
                                Private f32* %266 = OpAccessChain %254 %137 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFAdd %265 %267 
                                Private f32* %270 = OpAccessChain %163 %269 
                                                      OpStore %270 %268 
                                         f32 %271 = OpLoad %191 
                                       f32_2 %272 = OpCompositeConstruct %271 %271 
                                       f32_4 %273 = OpLoad %163 
                                       f32_2 %274 = OpVectorShuffle %273 %273 1 3 
                                       f32_2 %275 = OpFAdd %272 %274 
                                       f32_3 %276 = OpLoad %254 
                                       f32_3 %277 = OpVectorShuffle %276 %275 3 4 2 
                                                      OpStore %254 %277 
                         read_only Texture2D %278 = OpLoad %175 
                                     sampler %279 = OpLoad %179 
                  read_only Texture2DSampled %280 = OpSampledImage %278 %279 
                                       f32_3 %281 = OpLoad %254 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
                                       f32_3 %285 = OpLoad %254 
                                       f32_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %254 %286 
                                       f32_3 %287 = OpLoad %254 
                                       f32_2 %288 = OpVectorShuffle %287 %287 0 1 
                                       f32_2 %289 = OpLoad %60 
                                       f32_2 %290 = OpFAdd %288 %289 
                                       f32_3 %291 = OpLoad %254 
                                       f32_3 %292 = OpVectorShuffle %291 %290 3 4 2 
                                                      OpStore %254 %292 
                                Private f32* %293 = OpAccessChain %254 %137 
                                         f32 %294 = OpLoad %293 
                                         f32 %296 = OpFMul %294 %295 
                                Private f32* %297 = OpAccessChain %60 %137 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %60 %137 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 43 %299 %22 %47 
                                Private f32* %301 = OpAccessChain %60 %137 
                                                      OpStore %301 %300 
                                       f32_2 %302 = OpLoad %60 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 0 
                                Uniform f32* %305 = OpAccessChain %14 %304 
                                         f32 %306 = OpLoad %305 
                                Uniform f32* %307 = OpAccessChain %14 %304 
                                         f32 %308 = OpLoad %307 
                                       f32_2 %309 = OpCompositeConstruct %306 %308 
                                         f32 %310 = OpCompositeExtract %309 0 
                                         f32 %311 = OpCompositeExtract %309 1 
                                       f32_2 %312 = OpCompositeConstruct %310 %311 
                                       f32_2 %313 = OpFMul %303 %312 
                                       f32_3 %314 = OpLoad %26 
                                       f32_2 %315 = OpVectorShuffle %314 %314 0 2 
                                       f32_2 %316 = OpFAdd %313 %315 
                                       f32_3 %317 = OpLoad %26 
                                       f32_3 %318 = OpVectorShuffle %317 %316 3 4 2 
                                                      OpStore %26 %318 
                                Private f32* %319 = OpAccessChain %60 %137 
                                         f32 %320 = OpLoad %319 
                                Uniform f32* %321 = OpAccessChain %14 %304 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFMul %320 %322 
                                Private f32* %324 = OpAccessChain %60 %137 
                                                      OpStore %324 %323 
                         read_only Texture2D %326 = OpLoad %325 
                                     sampler %328 = OpLoad %327 
                  read_only Texture2DSampled %329 = OpSampledImage %326 %328 
                                       f32_3 %330 = OpLoad %26 
                                       f32_2 %331 = OpVectorShuffle %330 %330 0 1 
                                       f32_4 %332 = OpImageSampleImplicitLod %329 %331 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                                      OpStore %26 %333 
                                Private f32* %334 = OpAccessChain %254 %137 
                                         f32 %335 = OpLoad %334 
                                Uniform f32* %336 = OpAccessChain %14 %304 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpFMul %335 %337 
                                Private f32* %339 = OpAccessChain %254 %137 
                                                      OpStore %339 %338 
                                Uniform f32* %341 = OpAccessChain %14 %340 
                                         f32 %342 = OpLoad %341 
                                Uniform f32* %343 = OpAccessChain %14 %340 
                                         f32 %344 = OpLoad %343 
                                Uniform f32* %345 = OpAccessChain %14 %340 
                                         f32 %346 = OpLoad %345 
                                       f32_3 %347 = OpCompositeConstruct %342 %344 %346 
                                         f32 %348 = OpCompositeExtract %347 0 
                                         f32 %349 = OpCompositeExtract %347 1 
                                         f32 %350 = OpCompositeExtract %347 2 
                                       f32_3 %351 = OpCompositeConstruct %348 %349 %350 
                              Uniform f32_4* %353 = OpAccessChain %14 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_3 %356 = OpFMul %351 %355 
                                                      OpStore %79 %356 
                                       f32_3 %357 = OpLoad %254 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 0 0 
                                       f32_3 %359 = OpLoad %79 
                                       f32_3 %360 = OpFMul %358 %359 
                                       f32_3 %361 = OpLoad %26 
                                       f32_3 %362 = OpFAdd %360 %361 
                                                      OpStore %26 %362 
                                Uniform f32* %363 = OpAccessChain %14 %85 
                                         f32 %364 = OpLoad %363 
                                Uniform f32* %366 = OpAccessChain %14 %365 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFMul %364 %367 
                                Private f32* %369 = OpAccessChain %254 %137 
                                                      OpStore %369 %368 
                                Private f32* %370 = OpAccessChain %254 %18 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpFNegate %371 
                                Private f32* %373 = OpAccessChain %254 %137 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpFMul %372 %374 
                                Private f32* %376 = OpAccessChain %60 %137 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFAdd %375 %377 
                                Private f32* %379 = OpAccessChain %254 %137 
                                                      OpStore %379 %378 
                                Private f32* %380 = OpAccessChain %254 %137 
                                         f32 %381 = OpLoad %380 
                                Uniform f32* %382 = OpAccessChain %14 %304 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFMul %381 %383 
                                Private f32* %385 = OpAccessChain %254 %137 
                                                      OpStore %385 %384 
                                Uniform f32* %386 = OpAccessChain %14 %365 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %254 %137 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFMul %387 %389 
                                Private f32* %391 = OpAccessChain %254 %137 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpFNegate %392 
                                         f32 %394 = OpFAdd %390 %393 
                                                      OpStore %43 %394 
                              Uniform f32_4* %395 = OpAccessChain %14 %352 
                                       f32_4 %396 = OpLoad %395 
                                       f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
                                         f32 %398 = OpLoad %43 
                                       f32_3 %399 = OpCompositeConstruct %398 %398 %398 
                                       f32_3 %400 = OpFMul %397 %399 
                                       f32_3 %401 = OpLoad %254 
                                       f32_3 %402 = OpVectorShuffle %401 %401 0 0 0 
                                       f32_3 %403 = OpFAdd %400 %402 
                                                      OpStore %254 %403 
                                       f32_3 %406 = OpLoad %254 
                                       f32_3 %407 = OpLoad %26 
                                       f32_3 %408 = OpFAdd %406 %407 
                                       f32_4 %409 = OpLoad %405 
                                       f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
                                                      OpStore %405 %410 
                                 Output f32* %412 = OpAccessChain %405 %269 
                                                      OpStore %412 %47 
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