//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blend2Camera_SplitScreen" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 49757
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec3 u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.y = (-_Value6);
    u_xlat0.xz = (-vec2(_Value3, _Value2));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat8 = u_xlat0.z + 1.0;
    u_xlat2.x = sin(_Value5);
    u_xlat3 = cos(_Value5);
    u_xlat4.x = u_xlat0.y * u_xlat3;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.x = float(1.0) / _Value4;
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * _Value;
    u_xlat2 = texture(_MainTex2, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    u_xlat4.xyz = vec3(u_xlat8) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyz;
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
; Bound: 255
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %35 %242 
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
                                                      OpDecorate %12 Block 
                                                      OpDecorate %14 DescriptorSet 14 
                                                      OpDecorate %14 Binding 14 
                                                      OpDecorate vs_TEXCOORD0 Location 35 
                                                      OpDecorate %191 DescriptorSet 191 
                                                      OpDecorate %191 Binding 191 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %205 DescriptorSet 205 
                                                      OpDecorate %205 Binding 205 
                                                      OpDecorate %242 Location 242 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeVector %6 4 
                                              %12 = OpTypeStruct %6 %6 %6 %6 %6 %6 %10 %11 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 5 
                                              %17 = OpTypePointer Uniform %6 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Private %6 
                                              %25 = OpTypeBool 
                                              %26 = OpTypePointer Private %25 
                                Private bool* %27 = OpVariable Private 
                                          i32 %28 = OpConstant 6 
                                          f32 %31 = OpConstant 3.674022E-40 
                               Private f32_3* %33 = OpVariable Private 
                                              %34 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %37 = OpConstant 7 
                                              %38 = OpTypePointer Uniform %11 
                                 Private f32* %49 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                              %56 = OpTypePointer Function %6 
                                          u32 %65 = OpConstant 2 
                                          i32 %67 = OpConstant 2 
                                          i32 %70 = OpConstant 1 
                                 Private f32* %84 = OpVariable Private 
                               Private f32_3* %88 = OpVariable Private 
                                          i32 %89 = OpConstant 4 
                                          u32 %93 = OpConstant 0 
                                 Private f32* %95 = OpVariable Private 
                               Private f32_3* %99 = OpVariable Private 
                                         i32 %146 = OpConstant 3 
                                         f32 %163 = OpConstant 3.674022E-40 
                                         f32 %165 = OpConstant 3.674022E-40 
                                         i32 %184 = OpConstant 0 
                                             %189 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %190 = OpTypePointer UniformConstant %189 
        UniformConstant read_only Texture2D* %191 = OpVariable UniformConstant 
                                             %193 = OpTypeSampler 
                                             %194 = OpTypePointer UniformConstant %193 
                    UniformConstant sampler* %195 = OpVariable UniformConstant 
                                             %197 = OpTypeSampledImage %189 
        UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
                    UniformConstant sampler* %205 = OpVariable UniformConstant 
                                             %241 = OpTypePointer Output %11 
                               Output f32_4* %242 = OpVariable Output 
                                         u32 %251 = OpConstant 3 
                                             %252 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %57 = OpVariable Function 
                               Function f32* %120 = OpVariable Function 
                                 Uniform f32* %18 = OpAccessChain %14 %16 
                                          f32 %19 = OpLoad %18 
                                          f32 %20 = OpFNegate %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                                      OpStore %24 %20 
                                 Uniform f32* %29 = OpAccessChain %14 %28 %22 
                                          f32 %30 = OpLoad %29 
                                         bool %32 = OpFOrdLessThan %30 %31 
                                                      OpStore %27 %32 
                                        f32_2 %36 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %39 = OpAccessChain %14 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %36 %41 
                               Uniform f32_4* %43 = OpAccessChain %14 %37 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
                                        f32_2 %46 = OpFAdd %42 %45 
                                        f32_3 %47 = OpLoad %33 
                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                      OpStore %33 %48 
                                 Private f32* %50 = OpAccessChain %33 %22 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpFNegate %51 
                                          f32 %54 = OpFAdd %52 %53 
                                                      OpStore %49 %54 
                                         bool %55 = OpLoad %27 
                                                      OpSelectionMerge %59 None 
                                                      OpBranchConditional %55 %58 %61 
                                              %58 = OpLabel 
                                          f32 %60 = OpLoad %49 
                                                      OpStore %57 %60 
                                                      OpBranch %59 
                                              %61 = OpLabel 
                                 Private f32* %62 = OpAccessChain %33 %22 
                                          f32 %63 = OpLoad %62 
                                                      OpStore %57 %63 
                                                      OpBranch %59 
                                              %59 = OpLabel 
                                          f32 %64 = OpLoad %57 
                                 Private f32* %66 = OpAccessChain %33 %65 
                                                      OpStore %66 %64 
                                 Uniform f32* %68 = OpAccessChain %14 %67 
                                          f32 %69 = OpLoad %68 
                                 Uniform f32* %71 = OpAccessChain %14 %70 
                                          f32 %72 = OpLoad %71 
                                        f32_2 %73 = OpCompositeConstruct %69 %72 
                                        f32_2 %74 = OpFNegate %73 
                                        f32_3 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %74 3 1 4 
                                                      OpStore %9 %76 
                                        f32_3 %77 = OpLoad %9 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_3 %79 = OpLoad %33 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 2 
                                        f32_2 %81 = OpFAdd %78 %80 
                                        f32_3 %82 = OpLoad %9 
                                        f32_3 %83 = OpVectorShuffle %82 %81 3 4 2 
                                                      OpStore %9 %83 
                                 Private f32* %85 = OpAccessChain %9 %65 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFAdd %86 %53 
                                                      OpStore %84 %87 
                                 Uniform f32* %90 = OpAccessChain %14 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpExtInst %1 13 %91 
                                 Private f32* %94 = OpAccessChain %88 %93 
                                                      OpStore %94 %92 
                                 Uniform f32* %96 = OpAccessChain %14 %89 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpExtInst %1 14 %97 
                                                      OpStore %95 %98 
                                Private f32* %100 = OpAccessChain %9 %22 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpLoad %95 
                                         f32 %103 = OpFMul %101 %102 
                                Private f32* %104 = OpAccessChain %99 %93 
                                                      OpStore %104 %103 
                                Private f32* %105 = OpAccessChain %9 %93 
                                         f32 %106 = OpLoad %105 
                                Private f32* %107 = OpAccessChain %88 %93 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFMul %106 %108 
                                Private f32* %110 = OpAccessChain %99 %93 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFAdd %109 %111 
                                Private f32* %113 = OpAccessChain %9 %93 
                                                      OpStore %113 %112 
                                Private f32* %114 = OpAccessChain %9 %93 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFNegate %115 
                                         f32 %117 = OpFAdd %116 %53 
                                Private f32* %118 = OpAccessChain %99 %93 
                                                      OpStore %118 %117 
                                        bool %119 = OpLoad %27 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %119 %121 %125 
                                             %121 = OpLabel 
                                Private f32* %123 = OpAccessChain %99 %93 
                                         f32 %124 = OpLoad %123 
                                                      OpStore %120 %124 
                                                      OpBranch %122 
                                             %125 = OpLabel 
                                Private f32* %126 = OpAccessChain %9 %93 
                                         f32 %127 = OpLoad %126 
                                                      OpStore %120 %127 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                         f32 %128 = OpLoad %120 
                                Private f32* %129 = OpAccessChain %9 %93 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %9 %93 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 40 %131 %31 
                                Private f32* %133 = OpAccessChain %9 %93 
                                                      OpStore %133 %132 
                                       f32_3 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 0 
                                       f32_2 %136 = OpFNegate %135 
                                       f32_3 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                                       f32_2 %139 = OpFNegate %138 
                                         f32 %140 = OpDot %136 %139 
                                Private f32* %141 = OpAccessChain %9 %93 
                                                      OpStore %141 %140 
                                Private f32* %142 = OpAccessChain %9 %93 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpExtInst %1 31 %143 
                                Private f32* %145 = OpAccessChain %9 %93 
                                                      OpStore %145 %144 
                                Uniform f32* %147 = OpAccessChain %14 %146 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFDiv %53 %148 
                                Private f32* %150 = OpAccessChain %99 %93 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %99 %93 
                                         f32 %152 = OpLoad %151 
                                Private f32* %153 = OpAccessChain %9 %93 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFMul %152 %154 
                                Private f32* %156 = OpAccessChain %9 %93 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %9 %93 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpExtInst %1 43 %158 %31 %53 
                                Private f32* %160 = OpAccessChain %9 %93 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %9 %93 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                         f32 %166 = OpFAdd %164 %165 
                                Private f32* %167 = OpAccessChain %99 %93 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %9 %93 
                                         f32 %169 = OpLoad %168 
                                Private f32* %170 = OpAccessChain %9 %93 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFMul %169 %171 
                                Private f32* %173 = OpAccessChain %9 %93 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %99 %93 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                Private f32* %177 = OpAccessChain %9 %93 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %176 %178 
                                         f32 %180 = OpFAdd %179 %53 
                                Private f32* %181 = OpAccessChain %9 %93 
                                                      OpStore %181 %180 
                                Private f32* %182 = OpAccessChain %9 %93 
                                         f32 %183 = OpLoad %182 
                                Uniform f32* %185 = OpAccessChain %14 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFMul %183 %186 
                                Private f32* %188 = OpAccessChain %9 %93 
                                                      OpStore %188 %187 
                         read_only Texture2D %192 = OpLoad %191 
                                     sampler %196 = OpLoad %195 
                  read_only Texture2DSampled %198 = OpSampledImage %192 %196 
                                       f32_3 %199 = OpLoad %33 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                       f32_4 %201 = OpImageSampleImplicitLod %198 %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                                      OpStore %88 %202 
                         read_only Texture2D %204 = OpLoad %203 
                                     sampler %206 = OpLoad %205 
                  read_only Texture2DSampled %207 = OpSampledImage %204 %206 
                                       f32_3 %208 = OpLoad %33 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                                      OpStore %33 %211 
                                       f32_3 %212 = OpLoad %33 
                                       f32_3 %213 = OpFNegate %212 
                                       f32_3 %214 = OpLoad %88 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %88 %215 
                                         f32 %216 = OpLoad %84 
                                       f32_3 %217 = OpCompositeConstruct %216 %216 %216 
                                       f32_3 %218 = OpLoad %88 
                                       f32_3 %219 = OpFMul %217 %218 
                                       f32_3 %220 = OpLoad %33 
                                       f32_3 %221 = OpFAdd %219 %220 
                                                      OpStore %99 %221 
                                Uniform f32* %222 = OpAccessChain %14 %70 
                                         f32 %223 = OpLoad %222 
                                Uniform f32* %224 = OpAccessChain %14 %70 
                                         f32 %225 = OpLoad %224 
                                Uniform f32* %226 = OpAccessChain %14 %70 
                                         f32 %227 = OpLoad %226 
                                       f32_3 %228 = OpCompositeConstruct %223 %225 %227 
                                         f32 %229 = OpCompositeExtract %228 0 
                                         f32 %230 = OpCompositeExtract %228 1 
                                         f32 %231 = OpCompositeExtract %228 2 
                                       f32_3 %232 = OpCompositeConstruct %229 %230 %231 
                                       f32_3 %233 = OpLoad %88 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_3 %235 = OpLoad %33 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %33 %236 
                                       f32_3 %237 = OpLoad %99 
                                       f32_3 %238 = OpLoad %33 
                                       f32_3 %239 = OpFNegate %238 
                                       f32_3 %240 = OpFAdd %237 %239 
                                                      OpStore %99 %240 
                                       f32_3 %243 = OpLoad %9 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 0 0 
                                       f32_3 %245 = OpLoad %99 
                                       f32_3 %246 = OpFMul %244 %245 
                                       f32_3 %247 = OpLoad %33 
                                       f32_3 %248 = OpFAdd %246 %247 
                                       f32_4 %249 = OpLoad %242 
                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 6 3 
                                                      OpStore %242 %250 
                                 Output f32* %253 = OpAccessChain %242 %251 
                                                      OpStore %253 %53 
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