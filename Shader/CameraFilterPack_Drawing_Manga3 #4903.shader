//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Manga3" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_DotSize ("_DotSize", Range(0, 1)) = 0
_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 30485
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
uniform 	float _DotSize;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
float u_xlat5;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = 2136.28125 / _DotSize;
    u_xlat0.x = u_xlat0.x * 1.66666663;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy * vec2(0.707106411, 0.707106411);
    u_xlat6 = u_xlat2.x * 0.707106411 + (-u_xlat1.y);
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat6 = cos(u_xlat1.x);
    u_xlat6 = u_xlat6 * 0.25 + 0.5;
    u_xlat0.x = u_xlat0.x * 0.25 + u_xlat6;
    u_xlat1 = texture(_MainTex, u_xlat2.xy);
    u_xlat0.xyz = (-u_xlat0.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
    u_xlat6 = _DotSize * 0.125 + -0.200000018;
    u_xlat6 = u_xlat6 * -3.33333349;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat5 = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1.xyz = vec3(u_xlat5) * vec3(u_xlat6) + u_xlat1.xyy;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xzz;
    u_xlatb6 = 0.300000012<u_xlat1.x;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
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
; Bound: 186
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %33 %170 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %12 0 Offset 12 
                                              OpMemberDecorate %12 1 Offset 12 
                                              OpDecorate %12 Block 
                                              OpDecorate %14 DescriptorSet 14 
                                              OpDecorate %14 Binding 14 
                                              OpDecorate vs_TEXCOORD0 Location 33 
                                              OpDecorate %101 DescriptorSet 101 
                                              OpDecorate %101 Binding 101 
                                              OpDecorate %105 DescriptorSet 105 
                                              OpDecorate %105 Binding 105 
                                              OpDecorate %170 Location 170 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                  f32 %10 = OpConstant 3.674022E-40 
                                      %11 = OpTypeVector %6 4 
                                      %12 = OpTypeStruct %6 %11 
                                      %13 = OpTypePointer Uniform %12 
        Uniform struct {f32; f32_4;}* %14 = OpVariable Uniform 
                                      %15 = OpTypeInt 32 1 
                                  i32 %16 = OpConstant 0 
                                      %17 = OpTypePointer Uniform %6 
                                      %21 = OpTypeInt 32 0 
                                  u32 %22 = OpConstant 0 
                                      %23 = OpTypePointer Private %6 
                                  f32 %27 = OpConstant 3.674022E-40 
                       Private f32_3* %30 = OpVariable Private 
                                      %31 = OpTypeVector %6 2 
                                      %32 = OpTypePointer Input %31 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  i32 %35 = OpConstant 1 
                                      %36 = OpTypePointer Uniform %11 
                       Private f32_3* %47 = OpVariable Private 
                                  f32 %50 = OpConstant 3.674022E-40 
                                f32_2 %51 = OpConstantComposite %50 %50 
                         Private f32* %55 = OpVariable Private 
                                  u32 %59 = OpConstant 1 
                                  f32 %89 = OpConstant 3.674022E-40 
                                  f32 %91 = OpConstant 3.674022E-40 
                                      %99 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %100 = OpTypePointer UniformConstant %99 
UniformConstant read_only Texture2D* %101 = OpVariable UniformConstant 
                                     %103 = OpTypeSampler 
                                     %104 = OpTypePointer UniformConstant %103 
            UniformConstant sampler* %105 = OpVariable UniformConstant 
                                     %107 = OpTypeSampledImage %99 
                               f32_3 %116 = OpConstantComposite %91 %91 %91 
                                 f32 %122 = OpConstant 3.674022E-40 
                                 f32 %124 = OpConstant 3.674022E-40 
                                 f32 %129 = OpConstant 3.674022E-40 
                                 f32 %134 = OpConstant 3.674022E-40 
                                 f32 %135 = OpConstant 3.674022E-40 
                                 f32 %140 = OpConstant 3.674022E-40 
                                 f32 %142 = OpConstant 3.674022E-40 
                                     %162 = OpTypeBool 
                                     %163 = OpTypePointer Private %162 
                       Private bool* %164 = OpVariable Private 
                                 f32 %165 = OpConstant 3.674022E-40 
                                     %169 = OpTypePointer Output %11 
                       Output f32_4* %170 = OpVariable Output 
                                     %172 = OpTypePointer Function %7 
                                 u32 %182 = OpConstant 3 
                                     %183 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                     Function f32_3* %173 = OpVariable Function 
                         Uniform f32* %18 = OpAccessChain %14 %16 
                                  f32 %19 = OpLoad %18 
                                  f32 %20 = OpFDiv %10 %19 
                         Private f32* %24 = OpAccessChain %9 %22 
                                              OpStore %24 %20 
                         Private f32* %25 = OpAccessChain %9 %22 
                                  f32 %26 = OpLoad %25 
                                  f32 %28 = OpFMul %26 %27 
                         Private f32* %29 = OpAccessChain %9 %22 
                                              OpStore %29 %28 
                                f32_2 %34 = OpLoad vs_TEXCOORD0 
                       Uniform f32_4* %37 = OpAccessChain %14 %35 
                                f32_4 %38 = OpLoad %37 
                                f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                f32_2 %40 = OpFMul %34 %39 
                       Uniform f32_4* %41 = OpAccessChain %14 %35 
                                f32_4 %42 = OpLoad %41 
                                f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                f32_2 %44 = OpFAdd %40 %43 
                                f32_3 %45 = OpLoad %30 
                                f32_3 %46 = OpVectorShuffle %45 %44 3 4 2 
                                              OpStore %30 %46 
                                f32_3 %48 = OpLoad %30 
                                f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                                f32_2 %52 = OpFMul %49 %51 
                                f32_3 %53 = OpLoad %47 
                                f32_3 %54 = OpVectorShuffle %53 %52 3 4 2 
                                              OpStore %47 %54 
                         Private f32* %56 = OpAccessChain %30 %22 
                                  f32 %57 = OpLoad %56 
                                  f32 %58 = OpFMul %57 %50 
                         Private f32* %60 = OpAccessChain %47 %59 
                                  f32 %61 = OpLoad %60 
                                  f32 %62 = OpFNegate %61 
                                  f32 %63 = OpFAdd %58 %62 
                                              OpStore %55 %63 
                         Private f32* %64 = OpAccessChain %47 %59 
                                  f32 %65 = OpLoad %64 
                         Private f32* %66 = OpAccessChain %47 %22 
                                  f32 %67 = OpLoad %66 
                                  f32 %68 = OpFAdd %65 %67 
                         Private f32* %69 = OpAccessChain %47 %22 
                                              OpStore %69 %68 
                         Private f32* %70 = OpAccessChain %9 %22 
                                  f32 %71 = OpLoad %70 
                         Private f32* %72 = OpAccessChain %47 %22 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpFMul %71 %73 
                         Private f32* %75 = OpAccessChain %47 %22 
                                              OpStore %75 %74 
                         Private f32* %76 = OpAccessChain %9 %22 
                                  f32 %77 = OpLoad %76 
                                  f32 %78 = OpLoad %55 
                                  f32 %79 = OpFMul %77 %78 
                         Private f32* %80 = OpAccessChain %9 %22 
                                              OpStore %80 %79 
                         Private f32* %81 = OpAccessChain %9 %22 
                                  f32 %82 = OpLoad %81 
                                  f32 %83 = OpExtInst %1 14 %82 
                         Private f32* %84 = OpAccessChain %9 %22 
                                              OpStore %84 %83 
                         Private f32* %85 = OpAccessChain %47 %22 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpExtInst %1 14 %86 
                                              OpStore %55 %87 
                                  f32 %88 = OpLoad %55 
                                  f32 %90 = OpFMul %88 %89 
                                  f32 %92 = OpFAdd %90 %91 
                                              OpStore %55 %92 
                         Private f32* %93 = OpAccessChain %9 %22 
                                  f32 %94 = OpLoad %93 
                                  f32 %95 = OpFMul %94 %89 
                                  f32 %96 = OpLoad %55 
                                  f32 %97 = OpFAdd %95 %96 
                         Private f32* %98 = OpAccessChain %9 %22 
                                              OpStore %98 %97 
                 read_only Texture2D %102 = OpLoad %101 
                             sampler %106 = OpLoad %105 
          read_only Texture2DSampled %108 = OpSampledImage %102 %106 
                               f32_3 %109 = OpLoad %30 
                               f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                               f32_4 %111 = OpImageSampleImplicitLod %108 %110 
                               f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                              OpStore %30 %112 
                               f32_3 %113 = OpLoad %9 
                               f32_3 %114 = OpVectorShuffle %113 %113 0 0 0 
                               f32_3 %115 = OpFNegate %114 
                               f32_3 %117 = OpFMul %115 %116 
                               f32_3 %118 = OpLoad %30 
                               f32_3 %119 = OpFAdd %117 %118 
                                              OpStore %47 %119 
                        Uniform f32* %120 = OpAccessChain %14 %16 
                                 f32 %121 = OpLoad %120 
                                 f32 %123 = OpFMul %121 %122 
                                 f32 %125 = OpFAdd %123 %124 
                        Private f32* %126 = OpAccessChain %9 %22 
                                              OpStore %126 %125 
                        Private f32* %127 = OpAccessChain %9 %22 
                                 f32 %128 = OpLoad %127 
                                 f32 %130 = OpFMul %128 %129 
                        Private f32* %131 = OpAccessChain %9 %22 
                                              OpStore %131 %130 
                        Private f32* %132 = OpAccessChain %9 %22 
                                 f32 %133 = OpLoad %132 
                                 f32 %136 = OpExtInst %1 43 %133 %134 %135 
                        Private f32* %137 = OpAccessChain %9 %22 
                                              OpStore %137 %136 
                        Private f32* %138 = OpAccessChain %9 %22 
                                 f32 %139 = OpLoad %138 
                                 f32 %141 = OpFMul %139 %140 
                                 f32 %143 = OpFAdd %141 %142 
                                              OpStore %55 %143 
                        Private f32* %144 = OpAccessChain %9 %22 
                                 f32 %145 = OpLoad %144 
                        Private f32* %146 = OpAccessChain %9 %22 
                                 f32 %147 = OpLoad %146 
                                 f32 %148 = OpFMul %145 %147 
                        Private f32* %149 = OpAccessChain %9 %22 
                                              OpStore %149 %148 
                                 f32 %150 = OpLoad %55 
                               f32_3 %151 = OpCompositeConstruct %150 %150 %150 
                               f32_3 %152 = OpLoad %9 
                               f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
                               f32_3 %154 = OpFMul %151 %153 
                               f32_3 %155 = OpLoad %30 
                               f32_3 %156 = OpVectorShuffle %155 %155 0 1 1 
                               f32_3 %157 = OpFAdd %154 %156 
                                              OpStore %9 %157 
                               f32_3 %158 = OpLoad %47 
                               f32_3 %159 = OpLoad %9 
                               f32_3 %160 = OpVectorShuffle %159 %159 0 2 2 
                               f32_3 %161 = OpFAdd %158 %160 
                                              OpStore %47 %161 
                        Private f32* %166 = OpAccessChain %9 %22 
                                 f32 %167 = OpLoad %166 
                                bool %168 = OpFOrdLessThan %165 %167 
                                              OpStore %164 %168 
                                bool %171 = OpLoad %164 
                                              OpSelectionMerge %175 None 
                                              OpBranchConditional %171 %174 %177 
                                     %174 = OpLabel 
                               f32_3 %176 = OpLoad %47 
                                              OpStore %173 %176 
                                              OpBranch %175 
                                     %177 = OpLabel 
                               f32_3 %178 = OpLoad %9 
                                              OpStore %173 %178 
                                              OpBranch %175 
                                     %175 = OpLabel 
                               f32_3 %179 = OpLoad %173 
                               f32_4 %180 = OpLoad %170 
                               f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                              OpStore %170 %181 
                         Output f32* %184 = OpAccessChain %170 %182 
                                              OpStore %184 %135 
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