//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Plasma" {
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
  GpuProgramID 39150
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec2 u_xlat8;
vec2 u_xlat12;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = u_xlat0.yy * vec2(0.5, 0.25);
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat1 = vec4(_TimeX) * vec4(0.109999999, 0.150000006, 0.109999999, 0.150000006);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(20.0, 22.0, 20.0, 22.0) + vec4(1000.0, 800.0, 1000.0, 800.0);
    u_xlat2.xy = u_xlat0.xx * vec2(5.0, 3.0) + u_xlat1.ww;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat12.xy = u_xlat2.xy * vec2(0.00999999978, 0.00999999978) + u_xlat12.xy;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.zw;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat2.xy = u_xlat1.zz * vec2(0.00999999978, 0.0199999996);
    u_xlat2.xy = cos(u_xlat2.xy);
    u_xlat3 = u_xlat1.zzzz * vec4(0.00499999989, 0.00100000005, 0.00100000005, 0.00499999989) + u_xlat0.xyxy;
    u_xlat4.xy = sin(u_xlat3.xz);
    u_xlat4.zw = cos(u_xlat3.yw);
    u_xlat2.xy = u_xlat2.xy * u_xlat4.xz;
    u_xlat3 = texture(_MainTex, u_xlat4.yw);
    u_xlat2.xy = u_xlat2.xy * vec2(5.0, 5.0);
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat6.yz = u_xlat12.xy * u_xlat2.xx;
    u_xlat8.x = u_xlat1.w * 0.0399999991;
    u_xlat8.x = sin((-u_xlat8.x));
    u_xlat8.x = u_xlat0.x + u_xlat8.x;
    u_xlat14 = u_xlat1.z * u_xlat3.x;
    u_xlat14 = u_xlat14 * 0.0900000036;
    u_xlat8.x = u_xlat8.x * u_xlat14;
    u_xlat4 = u_xlat1 * vec4(0.100000001, 0.0500000007, 0.0350000001, 0.100000001);
    u_xlat1.x = sin(u_xlat4.w);
    u_xlat5 = sin((-u_xlat4.yzxx));
    u_xlat7 = u_xlat3.x * u_xlat4.x;
    u_xlat4 = u_xlat0.xyxy + u_xlat5;
    u_xlat19 = u_xlat4.y * 5.0;
    u_xlat19 = sin(u_xlat19);
    u_xlat8.x = u_xlat8.x * u_xlat19 + u_xlat1.x;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat18 = u_xlat6.z * abs(u_xlat8.x);
    u_xlat8.xy = u_xlat0.xy + vec2(-0.5, 0.5);
    u_xlat5 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat1.z * u_xlat8.x;
    u_xlat6.x = u_xlat1.z * u_xlat4.z;
    u_xlat13 = sin(u_xlat8.y);
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = abs(u_xlat0.x) * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat18 = u_xlat18 * 0.5 + u_xlat0.x;
    u_xlat1.z = sin(u_xlat4.w);
    u_xlat7 = u_xlat7 * u_xlat4.x;
    u_xlat1.x = u_xlat7 * u_xlat19 + u_xlat1.x;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.zx;
    u_xlat0.x = u_xlat6.y * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat6.x * 0.200000003;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat12.x = abs(u_xlat6.x) * u_xlat2.x;
    u_xlat6.x = u_xlat6.x * u_xlat2.x;
    u_xlat1.y = u_xlat6.x * 0.100000001 + u_xlat0.x;
    u_xlat1.z = u_xlat12.x * 0.100000001 + u_xlat18;
    u_xlat1.x = float(0.0);
    u_xlat1.w = float(1.0);
    SV_Target0 = u_xlat5 + u_xlat1;
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
; Bound: 362
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %357 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %14 0 Offset 14 
                                              OpMemberDecorate %14 1 Offset 14 
                                              OpDecorate %14 Block 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate %119 DescriptorSet 119 
                                              OpDecorate %119 Binding 119 
                                              OpDecorate %123 DescriptorSet 123 
                                              OpDecorate %123 Binding 123 
                                              OpDecorate %357 Location 357 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypeStruct %6 %13 
                                      %15 = OpTypePointer Uniform %14 
        Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
                                      %17 = OpTypeInt 32 1 
                                  i32 %18 = OpConstant 1 
                                      %19 = OpTypePointer Uniform %13 
                       Private f32_2* %28 = OpVariable Private 
                                  f32 %31 = OpConstant 3.674022E-40 
                                  f32 %32 = OpConstant 3.674022E-40 
                                f32_2 %33 = OpConstantComposite %31 %32 
                                      %37 = OpTypePointer Private %13 
                       Private f32_4* %38 = OpVariable Private 
                                  i32 %39 = OpConstant 0 
                                      %40 = OpTypePointer Uniform %6 
                                  f32 %44 = OpConstant 3.674022E-40 
                                  f32 %45 = OpConstant 3.674022E-40 
                                f32_4 %46 = OpConstantComposite %44 %45 %44 %45 
                                  f32 %51 = OpConstant 3.674022E-40 
                                  f32 %52 = OpConstant 3.674022E-40 
                                f32_4 %53 = OpConstantComposite %51 %52 %51 %52 
                                  f32 %55 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                f32_4 %57 = OpConstantComposite %55 %56 %55 %56 
                       Private f32_2* %59 = OpVariable Private 
                                  f32 %62 = OpConstant 3.674022E-40 
                                  f32 %63 = OpConstant 3.674022E-40 
                                f32_2 %64 = OpConstantComposite %62 %63 
                                  f32 %72 = OpConstant 3.674022E-40 
                                f32_2 %73 = OpConstantComposite %72 %72 
                                  f32 %85 = OpConstant 3.674022E-40 
                                f32_2 %86 = OpConstantComposite %72 %85 
                       Private f32_4* %90 = OpVariable Private 
                                  f32 %93 = OpConstant 3.674022E-40 
                                  f32 %94 = OpConstant 3.674022E-40 
                                f32_4 %95 = OpConstantComposite %93 %94 %94 %93 
                      Private f32_4* %100 = OpVariable Private 
                                     %115 = OpTypePointer Private %6 
                        Private f32* %116 = OpVariable Private 
                                     %117 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %118 = OpTypePointer UniformConstant %117 
UniformConstant read_only Texture2D* %119 = OpVariable UniformConstant 
                                     %121 = OpTypeSampler 
                                     %122 = OpTypePointer UniformConstant %121 
            UniformConstant sampler* %123 = OpVariable UniformConstant 
                                     %125 = OpTypeSampledImage %117 
                                     %130 = OpTypeInt 32 0 
                                 u32 %131 = OpConstant 0 
                               f32_2 %134 = OpConstantComposite %62 %62 
                                     %143 = OpTypeVector %6 3 
                                     %144 = OpTypePointer Private %143 
                      Private f32_3* %145 = OpVariable Private 
                      Private f32_3* %152 = OpVariable Private 
                                 u32 %153 = OpConstant 3 
                                 f32 %156 = OpConstant 3.674022E-40 
                        Private f32* %170 = OpVariable Private 
                                 u32 %171 = OpConstant 2 
                                 f32 %177 = OpConstant 3.674022E-40 
                                 f32 %185 = OpConstant 3.674022E-40 
                                 f32 %186 = OpConstant 3.674022E-40 
                                 f32 %187 = OpConstant 3.674022E-40 
                               f32_4 %188 = OpConstantComposite %185 %186 %187 %185 
                        Private f32* %198 = OpVariable Private 
                        Private f32* %207 = OpVariable Private 
                                 u32 %208 = OpConstant 1 
                        Private f32* %226 = OpVariable Private 
                                 f32 %234 = OpConstant 3.674022E-40 
                               f32_2 %235 = OpConstantComposite %234 %31 
                        Private f32* %256 = OpVariable Private 
                                 f32 %319 = OpConstant 3.674022E-40 
                                 f32 %352 = OpConstant 3.674022E-40 
                                 f32 %354 = OpConstant 3.674022E-40 
                                     %356 = OpTypePointer Output %13 
                       Output f32_4* %357 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad vs_TEXCOORD0 
                       Uniform f32_4* %20 = OpAccessChain %16 %18 
                                f32_4 %21 = OpLoad %20 
                                f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                f32_2 %23 = OpFMul %12 %22 
                       Uniform f32_4* %24 = OpAccessChain %16 %18 
                                f32_4 %25 = OpLoad %24 
                                f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                f32_2 %27 = OpFAdd %23 %26 
                                              OpStore %9 %27 
                                f32_2 %29 = OpLoad %9 
                                f32_2 %30 = OpVectorShuffle %29 %29 1 1 
                                f32_2 %34 = OpFMul %30 %33 
                                              OpStore %28 %34 
                                f32_2 %35 = OpLoad %28 
                                f32_2 %36 = OpExtInst %1 13 %35 
                                              OpStore %28 %36 
                         Uniform f32* %41 = OpAccessChain %16 %39 
                                  f32 %42 = OpLoad %41 
                                f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                f32_4 %47 = OpFMul %43 %46 
                                              OpStore %38 %47 
                                f32_4 %48 = OpLoad %38 
                                f32_4 %49 = OpExtInst %1 13 %48 
                                              OpStore %38 %49 
                                f32_4 %50 = OpLoad %38 
                                f32_4 %54 = OpFMul %50 %53 
                                f32_4 %58 = OpFAdd %54 %57 
                                              OpStore %38 %58 
                                f32_2 %60 = OpLoad %9 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 0 
                                f32_2 %65 = OpFMul %61 %64 
                                f32_4 %66 = OpLoad %38 
                                f32_2 %67 = OpVectorShuffle %66 %66 3 3 
                                f32_2 %68 = OpFAdd %65 %67 
                                              OpStore %59 %68 
                                f32_2 %69 = OpLoad %59 
                                f32_2 %70 = OpExtInst %1 13 %69 
                                              OpStore %59 %70 
                                f32_2 %71 = OpLoad %59 
                                f32_2 %74 = OpFMul %71 %73 
                                f32_2 %75 = OpLoad %28 
                                f32_2 %76 = OpFAdd %74 %75 
                                              OpStore %28 %76 
                                f32_2 %77 = OpLoad %28 
                                f32_4 %78 = OpLoad %38 
                                f32_2 %79 = OpVectorShuffle %78 %78 2 3 
                                f32_2 %80 = OpFMul %77 %79 
                                              OpStore %28 %80 
                                f32_2 %81 = OpLoad %28 
                                f32_2 %82 = OpExtInst %1 13 %81 
                                              OpStore %28 %82 
                                f32_4 %83 = OpLoad %38 
                                f32_2 %84 = OpVectorShuffle %83 %83 2 2 
                                f32_2 %87 = OpFMul %84 %86 
                                              OpStore %59 %87 
                                f32_2 %88 = OpLoad %59 
                                f32_2 %89 = OpExtInst %1 14 %88 
                                              OpStore %59 %89 
                                f32_4 %91 = OpLoad %38 
                                f32_4 %92 = OpVectorShuffle %91 %91 2 2 2 2 
                                f32_4 %96 = OpFMul %92 %95 
                                f32_2 %97 = OpLoad %9 
                                f32_4 %98 = OpVectorShuffle %97 %97 0 1 0 1 
                                f32_4 %99 = OpFAdd %96 %98 
                                              OpStore %90 %99 
                               f32_4 %101 = OpLoad %90 
                               f32_2 %102 = OpVectorShuffle %101 %101 0 2 
                               f32_2 %103 = OpExtInst %1 13 %102 
                               f32_4 %104 = OpLoad %100 
                               f32_4 %105 = OpVectorShuffle %104 %103 4 5 2 3 
                                              OpStore %100 %105 
                               f32_4 %106 = OpLoad %90 
                               f32_2 %107 = OpVectorShuffle %106 %106 1 3 
                               f32_2 %108 = OpExtInst %1 14 %107 
                               f32_4 %109 = OpLoad %100 
                               f32_4 %110 = OpVectorShuffle %109 %108 0 1 4 5 
                                              OpStore %100 %110 
                               f32_2 %111 = OpLoad %59 
                               f32_4 %112 = OpLoad %100 
                               f32_2 %113 = OpVectorShuffle %112 %112 0 2 
                               f32_2 %114 = OpFMul %111 %113 
                                              OpStore %59 %114 
                 read_only Texture2D %120 = OpLoad %119 
                             sampler %124 = OpLoad %123 
          read_only Texture2DSampled %126 = OpSampledImage %120 %124 
                               f32_4 %127 = OpLoad %100 
                               f32_2 %128 = OpVectorShuffle %127 %127 1 3 
                               f32_4 %129 = OpImageSampleImplicitLod %126 %128 
                                 f32 %132 = OpCompositeExtract %129 0 
                                              OpStore %116 %132 
                               f32_2 %133 = OpLoad %59 
                               f32_2 %135 = OpFMul %133 %134 
                                              OpStore %59 %135 
                 read_only Texture2D %136 = OpLoad %119 
                             sampler %137 = OpLoad %123 
          read_only Texture2DSampled %138 = OpSampledImage %136 %137 
                               f32_2 %139 = OpLoad %59 
                               f32_4 %140 = OpImageSampleImplicitLod %138 %139 
                                 f32 %141 = OpCompositeExtract %140 0 
                        Private f32* %142 = OpAccessChain %59 %131 
                                              OpStore %142 %141 
                               f32_2 %146 = OpLoad %28 
                               f32_2 %147 = OpLoad %59 
                               f32_2 %148 = OpVectorShuffle %147 %147 0 0 
                               f32_2 %149 = OpFMul %146 %148 
                               f32_3 %150 = OpLoad %145 
                               f32_3 %151 = OpVectorShuffle %150 %149 0 3 4 
                                              OpStore %145 %151 
                        Private f32* %154 = OpAccessChain %38 %153 
                                 f32 %155 = OpLoad %154 
                                 f32 %157 = OpFMul %155 %156 
                        Private f32* %158 = OpAccessChain %152 %131 
                                              OpStore %158 %157 
                        Private f32* %159 = OpAccessChain %152 %131 
                                 f32 %160 = OpLoad %159 
                                 f32 %161 = OpFNegate %160 
                                 f32 %162 = OpExtInst %1 13 %161 
                        Private f32* %163 = OpAccessChain %152 %131 
                                              OpStore %163 %162 
                        Private f32* %164 = OpAccessChain %9 %131 
                                 f32 %165 = OpLoad %164 
                        Private f32* %166 = OpAccessChain %152 %131 
                                 f32 %167 = OpLoad %166 
                                 f32 %168 = OpFAdd %165 %167 
                        Private f32* %169 = OpAccessChain %152 %131 
                                              OpStore %169 %168 
                        Private f32* %172 = OpAccessChain %38 %171 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpLoad %116 
                                 f32 %175 = OpFMul %173 %174 
                                              OpStore %170 %175 
                                 f32 %176 = OpLoad %170 
                                 f32 %178 = OpFMul %176 %177 
                                              OpStore %170 %178 
                        Private f32* %179 = OpAccessChain %152 %131 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpLoad %170 
                                 f32 %182 = OpFMul %180 %181 
                        Private f32* %183 = OpAccessChain %152 %131 
                                              OpStore %183 %182 
                               f32_4 %184 = OpLoad %38 
                               f32_4 %189 = OpFMul %184 %188 
                                              OpStore %90 %189 
                        Private f32* %190 = OpAccessChain %90 %153 
                                 f32 %191 = OpLoad %190 
                                 f32 %192 = OpExtInst %1 13 %191 
                        Private f32* %193 = OpAccessChain %38 %131 
                                              OpStore %193 %192 
                               f32_4 %194 = OpLoad %90 
                               f32_4 %195 = OpVectorShuffle %194 %194 1 2 0 0 
                               f32_4 %196 = OpFNegate %195 
                               f32_4 %197 = OpExtInst %1 13 %196 
                                              OpStore %100 %197 
                                 f32 %199 = OpLoad %116 
                        Private f32* %200 = OpAccessChain %90 %131 
                                 f32 %201 = OpLoad %200 
                                 f32 %202 = OpFMul %199 %201 
                                              OpStore %198 %202 
                               f32_2 %203 = OpLoad %9 
                               f32_4 %204 = OpVectorShuffle %203 %203 0 1 0 1 
                               f32_4 %205 = OpLoad %100 
                               f32_4 %206 = OpFAdd %204 %205 
                                              OpStore %90 %206 
                        Private f32* %209 = OpAccessChain %90 %208 
                                 f32 %210 = OpLoad %209 
                                 f32 %211 = OpFMul %210 %62 
                                              OpStore %207 %211 
                                 f32 %212 = OpLoad %207 
                                 f32 %213 = OpExtInst %1 13 %212 
                                              OpStore %207 %213 
                        Private f32* %214 = OpAccessChain %152 %131 
                                 f32 %215 = OpLoad %214 
                                 f32 %216 = OpLoad %207 
                                 f32 %217 = OpFMul %215 %216 
                        Private f32* %218 = OpAccessChain %38 %131 
                                 f32 %219 = OpLoad %218 
                                 f32 %220 = OpFAdd %217 %219 
                        Private f32* %221 = OpAccessChain %152 %131 
                                              OpStore %221 %220 
                        Private f32* %222 = OpAccessChain %152 %131 
                                 f32 %223 = OpLoad %222 
                                 f32 %224 = OpExtInst %1 13 %223 
                        Private f32* %225 = OpAccessChain %152 %131 
                                              OpStore %225 %224 
                        Private f32* %227 = OpAccessChain %145 %171 
                                 f32 %228 = OpLoad %227 
                        Private f32* %229 = OpAccessChain %152 %131 
                                 f32 %230 = OpLoad %229 
                                 f32 %231 = OpExtInst %1 4 %230 
                                 f32 %232 = OpFMul %228 %231 
                                              OpStore %226 %232 
                               f32_2 %233 = OpLoad %9 
                               f32_2 %236 = OpFAdd %233 %235 
                               f32_3 %237 = OpLoad %152 
                               f32_3 %238 = OpVectorShuffle %237 %236 3 1 4 
                                              OpStore %152 %238 
                 read_only Texture2D %239 = OpLoad %119 
                             sampler %240 = OpLoad %123 
          read_only Texture2DSampled %241 = OpSampledImage %239 %240 
                               f32_2 %242 = OpLoad %9 
                               f32_4 %243 = OpImageSampleImplicitLod %241 %242 
                                              OpStore %100 %243 
                        Private f32* %244 = OpAccessChain %38 %171 
                                 f32 %245 = OpLoad %244 
                        Private f32* %246 = OpAccessChain %152 %131 
                                 f32 %247 = OpLoad %246 
                                 f32 %248 = OpFMul %245 %247 
                        Private f32* %249 = OpAccessChain %9 %131 
                                              OpStore %249 %248 
                        Private f32* %250 = OpAccessChain %38 %171 
                                 f32 %251 = OpLoad %250 
                        Private f32* %252 = OpAccessChain %90 %171 
                                 f32 %253 = OpLoad %252 
                                 f32 %254 = OpFMul %251 %253 
                        Private f32* %255 = OpAccessChain %145 %131 
                                              OpStore %255 %254 
                        Private f32* %257 = OpAccessChain %152 %171 
                                 f32 %258 = OpLoad %257 
                                 f32 %259 = OpExtInst %1 13 %258 
                                              OpStore %256 %259 
                        Private f32* %260 = OpAccessChain %9 %131 
                                 f32 %261 = OpLoad %260 
                                 f32 %262 = OpLoad %256 
                                 f32 %263 = OpFMul %261 %262 
                        Private f32* %264 = OpAccessChain %9 %131 
                                              OpStore %264 %263 
                        Private f32* %265 = OpAccessChain %9 %131 
                                 f32 %266 = OpLoad %265 
                                 f32 %267 = OpExtInst %1 13 %266 
                        Private f32* %268 = OpAccessChain %9 %131 
                                              OpStore %268 %267 
                        Private f32* %269 = OpAccessChain %9 %131 
                                 f32 %270 = OpLoad %269 
                                 f32 %271 = OpExtInst %1 4 %270 
                                 f32 %272 = OpLoad %116 
                                 f32 %273 = OpFMul %271 %272 
                        Private f32* %274 = OpAccessChain %9 %131 
                                              OpStore %274 %273 
                        Private f32* %275 = OpAccessChain %9 %131 
                                 f32 %276 = OpLoad %275 
                                 f32 %277 = OpFMul %276 %31 
                        Private f32* %278 = OpAccessChain %9 %131 
                                              OpStore %278 %277 
                                 f32 %279 = OpLoad %226 
                                 f32 %280 = OpFMul %279 %31 
                        Private f32* %281 = OpAccessChain %9 %131 
                                 f32 %282 = OpLoad %281 
                                 f32 %283 = OpFAdd %280 %282 
                                              OpStore %226 %283 
                        Private f32* %284 = OpAccessChain %90 %153 
                                 f32 %285 = OpLoad %284 
                                 f32 %286 = OpExtInst %1 13 %285 
                        Private f32* %287 = OpAccessChain %38 %171 
                                              OpStore %287 %286 
                                 f32 %288 = OpLoad %198 
                        Private f32* %289 = OpAccessChain %90 %131 
                                 f32 %290 = OpLoad %289 
                                 f32 %291 = OpFMul %288 %290 
                                              OpStore %198 %291 
                                 f32 %292 = OpLoad %198 
                                 f32 %293 = OpLoad %207 
                                 f32 %294 = OpFMul %292 %293 
                        Private f32* %295 = OpAccessChain %38 %131 
                                 f32 %296 = OpLoad %295 
                                 f32 %297 = OpFAdd %294 %296 
                        Private f32* %298 = OpAccessChain %38 %131 
                                              OpStore %298 %297 
                        Private f32* %299 = OpAccessChain %38 %131 
                                 f32 %300 = OpLoad %299 
                                 f32 %301 = OpExtInst %1 13 %300 
                        Private f32* %302 = OpAccessChain %38 %131 
                                              OpStore %302 %301 
                               f32_3 %303 = OpLoad %145 
                               f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                               f32_4 %305 = OpLoad %38 
                               f32_2 %306 = OpVectorShuffle %305 %305 2 0 
                               f32_2 %307 = OpFMul %304 %306 
                               f32_3 %308 = OpLoad %145 
                               f32_3 %309 = OpVectorShuffle %308 %307 3 4 2 
                                              OpStore %145 %309 
                        Private f32* %310 = OpAccessChain %145 %208 
                                 f32 %311 = OpLoad %310 
                                 f32 %312 = OpFMul %311 %31 
                        Private f32* %313 = OpAccessChain %9 %131 
                                 f32 %314 = OpLoad %313 
                                 f32 %315 = OpFAdd %312 %314 
                        Private f32* %316 = OpAccessChain %9 %131 
                                              OpStore %316 %315 
                        Private f32* %317 = OpAccessChain %145 %131 
                                 f32 %318 = OpLoad %317 
                                 f32 %320 = OpFMul %318 %319 
                        Private f32* %321 = OpAccessChain %145 %131 
                                              OpStore %321 %320 
                        Private f32* %322 = OpAccessChain %145 %131 
                                 f32 %323 = OpLoad %322 
                                 f32 %324 = OpExtInst %1 13 %323 
                        Private f32* %325 = OpAccessChain %145 %131 
                                              OpStore %325 %324 
                        Private f32* %326 = OpAccessChain %145 %131 
                                 f32 %327 = OpLoad %326 
                                 f32 %328 = OpExtInst %1 4 %327 
                        Private f32* %329 = OpAccessChain %59 %131 
                                 f32 %330 = OpLoad %329 
                                 f32 %331 = OpFMul %328 %330 
                        Private f32* %332 = OpAccessChain %28 %131 
                                              OpStore %332 %331 
                        Private f32* %333 = OpAccessChain %145 %131 
                                 f32 %334 = OpLoad %333 
                        Private f32* %335 = OpAccessChain %59 %131 
                                 f32 %336 = OpLoad %335 
                                 f32 %337 = OpFMul %334 %336 
                        Private f32* %338 = OpAccessChain %145 %131 
                                              OpStore %338 %337 
                        Private f32* %339 = OpAccessChain %145 %131 
                                 f32 %340 = OpLoad %339 
                                 f32 %341 = OpFMul %340 %185 
                        Private f32* %342 = OpAccessChain %9 %131 
                                 f32 %343 = OpLoad %342 
                                 f32 %344 = OpFAdd %341 %343 
                        Private f32* %345 = OpAccessChain %38 %208 
                                              OpStore %345 %344 
                        Private f32* %346 = OpAccessChain %28 %131 
                                 f32 %347 = OpLoad %346 
                                 f32 %348 = OpFMul %347 %185 
                                 f32 %349 = OpLoad %226 
                                 f32 %350 = OpFAdd %348 %349 
                        Private f32* %351 = OpAccessChain %38 %171 
                                              OpStore %351 %350 
                        Private f32* %353 = OpAccessChain %38 %131 
                                              OpStore %353 %352 
                        Private f32* %355 = OpAccessChain %38 %153 
                                              OpStore %355 %354 
                               f32_4 %358 = OpLoad %100 
                               f32_4 %359 = OpLoad %38 
                               f32_4 %360 = OpFAdd %358 %359 
                                              OpStore %357 %360 
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