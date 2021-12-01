//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/AAA_WaterDropPro" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_SizeX ("SizeX", Range(0, 1)) = 1
_SizeY ("SizeY", Range(0, 1)) = 1
_Speed ("Speed", Range(0, 10)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.87
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 51467
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
uniform 	float _SizeX;
uniform 	float _Speed;
uniform 	float _SizeY;
uniform 	float _Distortion;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = u_xlat0.xyxy * vec4(_SizeX, _SizeY, _SizeX, _SizeY);
    u_xlat2.w = u_xlat1.x * 1.29999995;
    u_xlat8.x = _Speed * _TimeX;
    u_xlat3.xyz = u_xlat8.xxx * vec3(0.125, 0.224999994, 0.0250000004);
    u_xlat2.yz = u_xlat1.yw * vec2(1.39999998, 1.10000002) + u_xlat3.xy;
    u_xlat1.y = u_xlat0.y * _SizeY + u_xlat3.z;
    u_xlat2.x = u_xlat1.z * 1.14999998 + -0.100000001;
    u_xlat3 = texture(_MainTex2, u_xlat2.xz);
    u_xlat2 = texture(_MainTex2, u_xlat2.wy);
    u_xlat8.xy = u_xlat2.xy / vec2(_Distortion);
    u_xlat9.xy = u_xlat3.xy / vec2(_Distortion);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat9.xy);
    u_xlat1.x = u_xlat0.x * _SizeX + -0.200000003;
    u_xlat1 = texture(_MainTex2, u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy / vec2(_Distortion);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat8.xy) * vec2(0.333333343, 0.333333343) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat0.xyz;
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
; Bound: 224
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %64 %217 
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
                                                      OpDecorate vs_TEXCOORD0 Location 64 
                                                      OpDecorate %130 DescriptorSet 130 
                                                      OpDecorate %130 Binding 130 
                                                      OpDecorate %134 DescriptorSet 134 
                                                      OpDecorate %134 Binding 134 
                                                      OpDecorate %207 DescriptorSet 207 
                                                      OpDecorate %207 Binding 207 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %217 Location 217 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                              %10 = OpTypeVector %9 2 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %10 %11 
                                              %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                              %15 = OpTypeInt 32 1 
                                          i32 %16 = OpConstant 5 
                                              %17 = OpTypeInt 32 0 
                                          u32 %18 = OpConstant 1 
                                              %19 = OpTypePointer Uniform %9 
                                          f32 %22 = OpConstant 3.674022E-40 
                                              %24 = OpTypePointer Private %9 
                                 Private f32* %25 = OpVariable Private 
                                          i32 %26 = OpConstant 2 
                                          f32 %30 = OpConstant 3.674022E-40 
                                              %32 = OpTypeVector %9 3 
                                              %33 = OpTypePointer Private %32 
                               Private f32_3* %34 = OpVariable Private 
                                              %36 = OpTypePointer Function %9 
                                          u32 %45 = OpConstant 0 
                                          i32 %49 = OpConstant 0 
                                          f32 %56 = OpConstant 3.674022E-40 
                                          f32 %57 = OpConstant 3.674022E-40 
                                          f32 %58 = OpConstant 3.674022E-40 
                                        f32_3 %59 = OpConstantComposite %56 %57 %58 
                                              %61 = OpTypePointer Private %10 
                               Private f32_2* %62 = OpVariable Private 
                                              %63 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %66 = OpConstant 6 
                                              %67 = OpTypePointer Uniform %11 
                                              %76 = OpTypePointer Private %11 
                               Private f32_4* %77 = OpVariable Private 
                                          i32 %80 = OpConstant 1 
                                          i32 %83 = OpConstant 3 
                               Private f32_4* %92 = OpVariable Private 
                                          f32 %95 = OpConstant 3.674022E-40 
                                          f32 %96 = OpConstant 3.674022E-40 
                                        f32_2 %97 = OpConstantComposite %95 %96 
                                         u32 %109 = OpConstant 2 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         u32 %118 = OpConstant 3 
                                         f32 %122 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                              Private f32_2* %127 = OpVariable Private 
                                             %128 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                             %129 = OpTypePointer UniformConstant %128 
        UniformConstant read_only Texture2D* %130 = OpVariable UniformConstant 
                                             %132 = OpTypeSampler 
                                             %133 = OpTypePointer UniformConstant %132 
                    UniformConstant sampler* %134 = OpVariable UniformConstant 
                                             %136 = OpTypeSampledImage %128 
                                         i32 %143 = OpConstant 4 
                              Private f32_2* %148 = OpVariable Private 
                                         f32 %170 = OpConstant 3.674022E-40 
                                         f32 %200 = OpConstant 3.674022E-40 
                                       f32_2 %201 = OpConstantComposite %200 %200 
        UniformConstant read_only Texture2D* %207 = OpVariable UniformConstant 
                    UniformConstant sampler* %209 = OpVariable UniformConstant 
                                             %216 = OpTypePointer Output %11 
                               Output f32_4* %217 = OpVariable Output 
                                             %221 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %37 = OpVariable Function 
                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
                                          f32 %21 = OpLoad %20 
                                         bool %23 = OpFOrdLessThan %21 %22 
                                                      OpStore %8 %23 
                                 Uniform f32* %27 = OpAccessChain %14 %26 
                                          f32 %28 = OpLoad %27 
                                          f32 %29 = OpFNegate %28 
                                          f32 %31 = OpFAdd %29 %30 
                                                      OpStore %25 %31 
                                         bool %35 = OpLoad %8 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %35 %38 %41 
                                              %38 = OpLabel 
                                          f32 %40 = OpLoad %25 
                                                      OpStore %37 %40 
                                                      OpBranch %39 
                                              %41 = OpLabel 
                                 Uniform f32* %42 = OpAccessChain %14 %26 
                                          f32 %43 = OpLoad %42 
                                                      OpStore %37 %43 
                                                      OpBranch %39 
                                              %39 = OpLabel 
                                          f32 %44 = OpLoad %37 
                                 Private f32* %46 = OpAccessChain %34 %45 
                                                      OpStore %46 %44 
                                 Private f32* %47 = OpAccessChain %34 %45 
                                          f32 %48 = OpLoad %47 
                                 Uniform f32* %50 = OpAccessChain %14 %49 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpFMul %48 %51 
                                 Private f32* %53 = OpAccessChain %34 %45 
                                                      OpStore %53 %52 
                                        f32_3 %54 = OpLoad %34 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 0 0 
                                        f32_3 %60 = OpFMul %55 %59 
                                                      OpStore %34 %60 
                                        f32_2 %65 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %68 = OpAccessChain %14 %66 
                                        f32_4 %69 = OpLoad %68 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_2 %71 = OpFMul %65 %70 
                               Uniform f32_4* %72 = OpAccessChain %14 %66 
                                        f32_4 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 2 3 
                                        f32_2 %75 = OpFAdd %71 %74 
                                                      OpStore %62 %75 
                                        f32_2 %78 = OpLoad %62 
                                        f32_4 %79 = OpVectorShuffle %78 %78 0 1 0 1 
                                 Uniform f32* %81 = OpAccessChain %14 %80 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %84 = OpAccessChain %14 %83 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %14 %80 
                                          f32 %87 = OpLoad %86 
                                 Uniform f32* %88 = OpAccessChain %14 %83 
                                          f32 %89 = OpLoad %88 
                                        f32_4 %90 = OpCompositeConstruct %82 %85 %87 %89 
                                        f32_4 %91 = OpFMul %79 %90 
                                                      OpStore %77 %91 
                                        f32_4 %93 = OpLoad %77 
                                        f32_2 %94 = OpVectorShuffle %93 %93 1 3 
                                        f32_2 %98 = OpFMul %94 %97 
                                        f32_3 %99 = OpLoad %34 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                       f32_2 %101 = OpFAdd %98 %100 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 0 4 5 3 
                                                      OpStore %92 %103 
                                Private f32* %104 = OpAccessChain %62 %18 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %106 = OpAccessChain %14 %83 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFMul %105 %107 
                                Private f32* %110 = OpAccessChain %34 %109 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFAdd %108 %111 
                                Private f32* %113 = OpAccessChain %34 %18 
                                                      OpStore %113 %112 
                                Private f32* %114 = OpAccessChain %77 %45 
                                         f32 %115 = OpLoad %114 
                                         f32 %117 = OpFMul %115 %116 
                                Private f32* %119 = OpAccessChain %92 %118 
                                                      OpStore %119 %117 
                                Private f32* %120 = OpAccessChain %77 %109 
                                         f32 %121 = OpLoad %120 
                                         f32 %123 = OpFMul %121 %122 
                                         f32 %125 = OpFAdd %123 %124 
                                Private f32* %126 = OpAccessChain %92 %45 
                                                      OpStore %126 %125 
                         read_only Texture2D %131 = OpLoad %130 
                                     sampler %135 = OpLoad %134 
                  read_only Texture2DSampled %137 = OpSampledImage %131 %135 
                                       f32_4 %138 = OpLoad %92 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 2 
                                       f32_4 %140 = OpImageSampleImplicitLod %137 %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                                      OpStore %127 %141 
                                       f32_2 %142 = OpLoad %127 
                                Uniform f32* %144 = OpAccessChain %14 %143 
                                         f32 %145 = OpLoad %144 
                                       f32_2 %146 = OpCompositeConstruct %145 %145 
                                       f32_2 %147 = OpFDiv %142 %146 
                                                      OpStore %127 %147 
                         read_only Texture2D %149 = OpLoad %130 
                                     sampler %150 = OpLoad %134 
                  read_only Texture2DSampled %151 = OpSampledImage %149 %150 
                                       f32_4 %152 = OpLoad %92 
                                       f32_2 %153 = OpVectorShuffle %152 %152 3 1 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                                                      OpStore %148 %155 
                                       f32_2 %156 = OpLoad %148 
                                Uniform f32* %157 = OpAccessChain %14 %143 
                                         f32 %158 = OpLoad %157 
                                       f32_2 %159 = OpCompositeConstruct %158 %158 
                                       f32_2 %160 = OpFDiv %156 %159 
                                                      OpStore %148 %160 
                                       f32_2 %161 = OpLoad %127 
                                       f32_2 %162 = OpFNegate %161 
                                       f32_2 %163 = OpLoad %148 
                                       f32_2 %164 = OpFAdd %162 %163 
                                                      OpStore %127 %164 
                                Private f32* %165 = OpAccessChain %62 %45 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %167 = OpAccessChain %14 %80 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                         f32 %171 = OpFAdd %169 %170 
                                Private f32* %172 = OpAccessChain %34 %45 
                                                      OpStore %172 %171 
                         read_only Texture2D %173 = OpLoad %130 
                                     sampler %174 = OpLoad %134 
                  read_only Texture2DSampled %175 = OpSampledImage %173 %174 
                                       f32_3 %176 = OpLoad %34 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_4 %178 = OpImageSampleImplicitLod %175 %177 
                                       f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                                       f32_3 %180 = OpLoad %34 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %34 %181 
                                       f32_3 %182 = OpLoad %34 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                Uniform f32* %184 = OpAccessChain %14 %143 
                                         f32 %185 = OpLoad %184 
                                       f32_2 %186 = OpCompositeConstruct %185 %185 
                                       f32_2 %187 = OpFDiv %183 %186 
                                       f32_3 %188 = OpLoad %34 
                                       f32_3 %189 = OpVectorShuffle %188 %187 3 4 2 
                                                      OpStore %34 %189 
                                       f32_3 %190 = OpLoad %34 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %192 = OpFNegate %191 
                                       f32_2 %193 = OpLoad %127 
                                       f32_2 %194 = OpFAdd %192 %193 
                                       f32_3 %195 = OpLoad %34 
                                       f32_3 %196 = OpVectorShuffle %195 %194 3 4 2 
                                                      OpStore %34 %196 
                                       f32_3 %197 = OpLoad %34 
                                       f32_2 %198 = OpVectorShuffle %197 %197 0 1 
                                       f32_2 %199 = OpFNegate %198 
                                       f32_2 %202 = OpFMul %199 %201 
                                       f32_2 %203 = OpLoad %62 
                                       f32_2 %204 = OpFAdd %202 %203 
                                       f32_3 %205 = OpLoad %34 
                                       f32_3 %206 = OpVectorShuffle %205 %204 3 4 2 
                                                      OpStore %34 %206 
                         read_only Texture2D %208 = OpLoad %207 
                                     sampler %210 = OpLoad %209 
                  read_only Texture2DSampled %211 = OpSampledImage %208 %210 
                                       f32_3 %212 = OpLoad %34 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                                      OpStore %34 %215 
                                       f32_3 %218 = OpLoad %34 
                                       f32_4 %219 = OpLoad %217 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 6 3 
                                                      OpStore %217 %220 
                                 Output f32* %222 = OpAccessChain %217 %118 
                                                      OpStore %222 %30 
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