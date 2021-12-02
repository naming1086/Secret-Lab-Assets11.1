//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blur_DitherOffset" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Level ("_Level", Range(1, 16)) = 4
_Distance ("_Distance", Vector) = (30,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 22853
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Level;
uniform 	vec4 _Distance;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat7;
vec2 u_xlat12;
int u_xlati12;
bool u_xlatb12;
int u_xlati18;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.x = fract(_TimeX);
    u_xlat12.xy = u_xlat12.xx + u_xlat0.xy;
    u_xlat12.x = dot(u_xlat12.xy, vec2(12.9898005, 78.2330017));
    u_xlat12.x = sin(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 43758.5469;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlati18 = int(_Level);
    u_xlat1 = trunc(_Level);
    u_xlat7.xy = _Distance.xy / _ScreenResolution.xy;
    u_xlat2.xy = (-u_xlat7.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat0.xy = u_xlat7.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
    u_xlat7.x = u_xlat1 + -1.0;
    u_xlat0.xy = u_xlat0.xy / u_xlat7.xx;
    u_xlatb12 = 0.5>=u_xlat12.x;
    u_xlat12.x = u_xlatb12 ? 0.5 : float(0.0);
    u_xlat7.xy = u_xlat12.xx * u_xlat0.xy + u_xlat2.xy;
    u_xlat2 = textureLod(_MainTex, u_xlat7.xy, 0.0);
    u_xlat3 = u_xlat2;
    u_xlat4.xy = u_xlat7.xy;
    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati18 ; u_xlati_loop_1++)
    {
        u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
        u_xlat5 = textureLod(_MainTex, u_xlat4.xy, 0.0);
        u_xlat3 = u_xlat3 + u_xlat5;
    }
    SV_Target0 = u_xlat3 / vec4(u_xlat1);
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
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %167 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %128 DescriptorSet 128 
                                                      OpDecorate %128 Binding 128 
                                                      OpDecorate %132 DescriptorSet 132 
                                                      OpDecorate %132 Binding 132 
                                                      OpDecorate %167 Location 167 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %13 = OpTypeVector %6 4 
                                              %14 = OpTypeStruct %6 %13 %6 %13 %13 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32_4; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 4 
                                              %19 = OpTypePointer Uniform %13 
                               Private f32_2* %28 = OpVariable Private 
                                          i32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Uniform %6 
                                              %34 = OpTypeInt 32 0 
                                          u32 %35 = OpConstant 0 
                                              %36 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          f32 %44 = OpConstant 3.674022E-40 
                                        f32_2 %45 = OpConstantComposite %43 %44 
                                          f32 %54 = OpConstant 3.674022E-40 
                                              %61 = OpTypePointer Private %17 
                                 Private i32* %62 = OpVariable Private 
                                          i32 %63 = OpConstant 2 
                                 Private f32* %67 = OpVariable Private 
                               Private f32_2* %71 = OpVariable Private 
                                          i32 %72 = OpConstant 3 
                                          i32 %76 = OpConstant 1 
                                              %81 = OpTypePointer Private %13 
                               Private f32_4* %82 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                        f32_2 %86 = OpConstantComposite %85 %85 
                                         f32 %102 = OpConstant 3.674022E-40 
                                             %109 = OpTypeBool 
                                             %110 = OpTypePointer Private %109 
                               Private bool* %111 = OpVariable Private 
                                         f32 %116 = OpConstant 3.674022E-40 
                                             %126 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %127 = OpTypePointer UniformConstant %126 
        UniformConstant read_only Texture2D* %128 = OpVariable UniformConstant 
                                             %130 = OpTypeSampler 
                                             %131 = OpTypePointer UniformConstant %130 
                    UniformConstant sampler* %132 = OpVariable UniformConstant 
                                             %134 = OpTypeSampledImage %126 
                              Private f32_4* %138 = OpVariable Private 
                              Private f32_2* %140 = OpVariable Private 
                                             %142 = OpTypePointer Function %17 
                              Private f32_4* %155 = OpVariable Private 
                                             %166 = OpTypePointer Output %13 
                               Output f32_4* %167 = OpVariable Output 
                                Private i32* %173 = OpVariable Private 
                               Private bool* %174 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %143 = OpVariable Function 
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
                                 Uniform f32* %31 = OpAccessChain %16 %29 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpExtInst %1 10 %32 
                                 Private f32* %37 = OpAccessChain %28 %35 
                                                      OpStore %37 %33 
                                        f32_2 %38 = OpLoad %28 
                                        f32_2 %39 = OpVectorShuffle %38 %38 0 0 
                                        f32_2 %40 = OpLoad %9 
                                        f32_2 %41 = OpFAdd %39 %40 
                                                      OpStore %28 %41 
                                        f32_2 %42 = OpLoad %28 
                                          f32 %46 = OpDot %42 %45 
                                 Private f32* %47 = OpAccessChain %28 %35 
                                                      OpStore %47 %46 
                                 Private f32* %48 = OpAccessChain %28 %35 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpExtInst %1 13 %49 
                                 Private f32* %51 = OpAccessChain %28 %35 
                                                      OpStore %51 %50 
                                 Private f32* %52 = OpAccessChain %28 %35 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFMul %53 %54 
                                 Private f32* %56 = OpAccessChain %28 %35 
                                                      OpStore %56 %55 
                                 Private f32* %57 = OpAccessChain %28 %35 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpExtInst %1 10 %58 
                                 Private f32* %60 = OpAccessChain %28 %35 
                                                      OpStore %60 %59 
                                 Uniform f32* %64 = OpAccessChain %16 %63 
                                          f32 %65 = OpLoad %64 
                                          i32 %66 = OpConvertFToS %65 
                                                      OpStore %62 %66 
                                 Uniform f32* %68 = OpAccessChain %16 %63 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 3 %69 
                                                      OpStore %67 %70 
                               Uniform f32_4* %73 = OpAccessChain %16 %72 
                                        f32_4 %74 = OpLoad %73 
                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                               Uniform f32_4* %77 = OpAccessChain %16 %76 
                                        f32_4 %78 = OpLoad %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                        f32_2 %80 = OpFDiv %75 %79 
                                                      OpStore %71 %80 
                                        f32_2 %83 = OpLoad %71 
                                        f32_2 %84 = OpFNegate %83 
                                        f32_2 %87 = OpFMul %84 %86 
                                        f32_2 %88 = OpLoad %9 
                                        f32_2 %89 = OpFAdd %87 %88 
                                        f32_4 %90 = OpLoad %82 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %82 %91 
                                        f32_2 %92 = OpLoad %71 
                                        f32_2 %93 = OpFMul %92 %86 
                                        f32_2 %94 = OpLoad %9 
                                        f32_2 %95 = OpFAdd %93 %94 
                                                      OpStore %9 %95 
                                        f32_4 %96 = OpLoad %82 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                        f32_2 %98 = OpFNegate %97 
                                        f32_2 %99 = OpLoad %9 
                                       f32_2 %100 = OpFAdd %98 %99 
                                                      OpStore %9 %100 
                                         f32 %101 = OpLoad %67 
                                         f32 %103 = OpFAdd %101 %102 
                                Private f32* %104 = OpAccessChain %71 %35 
                                                      OpStore %104 %103 
                                       f32_2 %105 = OpLoad %9 
                                       f32_2 %106 = OpLoad %71 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 0 
                                       f32_2 %108 = OpFDiv %105 %107 
                                                      OpStore %9 %108 
                                Private f32* %112 = OpAccessChain %28 %35 
                                         f32 %113 = OpLoad %112 
                                        bool %114 = OpFOrdGreaterThanEqual %85 %113 
                                                      OpStore %111 %114 
                                        bool %115 = OpLoad %111 
                                         f32 %117 = OpSelect %115 %85 %116 
                                Private f32* %118 = OpAccessChain %28 %35 
                                                      OpStore %118 %117 
                                       f32_2 %119 = OpLoad %28 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 0 
                                       f32_2 %121 = OpLoad %9 
                                       f32_2 %122 = OpFMul %120 %121 
                                       f32_4 %123 = OpLoad %82 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpFAdd %122 %124 
                                                      OpStore %71 %125 
                         read_only Texture2D %129 = OpLoad %128 
                                     sampler %133 = OpLoad %132 
                  read_only Texture2DSampled %135 = OpSampledImage %129 %133 
                                       f32_2 %136 = OpLoad %71 
                                       f32_4 %137 = OpImageSampleExplicitLod %135 %136 Lod %13 
                                                      OpStore %82 %137 
                                       f32_4 %139 = OpLoad %82 
                                                      OpStore %138 %139 
                                       f32_2 %141 = OpLoad %71 
                                                      OpStore %140 %141 
                                                      OpStore %143 %76 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                                      OpLoopMerge %146 %147 None 
                                                      OpBranch %148 
                                             %148 = OpLabel 
                                         i32 %149 = OpLoad %143 
                                         i32 %150 = OpLoad %62 
                                        bool %151 = OpSLessThan %149 %150 
                                                      OpBranchConditional %151 %145 %146 
                                             %145 = OpLabel 
                                       f32_2 %152 = OpLoad %9 
                                       f32_2 %153 = OpLoad %140 
                                       f32_2 %154 = OpFAdd %152 %153 
                                                      OpStore %140 %154 
                         read_only Texture2D %156 = OpLoad %128 
                                     sampler %157 = OpLoad %132 
                  read_only Texture2DSampled %158 = OpSampledImage %156 %157 
                                       f32_2 %159 = OpLoad %140 
                                       f32_4 %160 = OpImageSampleExplicitLod %158 %159 Lod %13 
                                                      OpStore %155 %160 
                                       f32_4 %161 = OpLoad %138 
                                       f32_4 %162 = OpLoad %155 
                                       f32_4 %163 = OpFAdd %161 %162 
                                                      OpStore %138 %163 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                         i32 %164 = OpLoad %143 
                                         i32 %165 = OpIAdd %164 %76 
                                                      OpStore %143 %165 
                                                      OpBranch %144 
                                             %146 = OpLabel 
                                       f32_4 %168 = OpLoad %138 
                                         f32 %169 = OpLoad %67 
                                       f32_4 %170 = OpCompositeConstruct %169 %169 %169 %169 
                                       f32_4 %171 = OpFDiv %168 %170 
                                                      OpStore %167 %171 
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