//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_CompressionFX" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Parasite ("_Parasite", Range(1, 10)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 12506
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
uniform 	float _Parasite;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat3;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = u_xlat0.xyxy * vec4(24.0, 19.0, 38.0, 14.0);
    u_xlat1 = floor(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(4.0, 4.0, 4.0, 4.0);
    u_xlat4.x = _TimeX * 12.0;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat1 = u_xlat4.xxxx * u_xlat1;
    u_xlat4.xy = u_xlat4.xx * vec2(2.0, 1.0);
    u_xlat4.x = dot(u_xlat4.xy, vec2(127.099998, 311.700012));
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 43758.5469;
    u_xlat6 = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
    u_xlat1.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat6 = sin(u_xlat6);
    u_xlat4.y = u_xlat6 * 43758.5469;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat3 = u_xlat4.y * u_xlat4.y;
    u_xlat6 = u_xlat4.y * u_xlat3;
    u_xlat6 = u_xlat6 * _Parasite;
    u_xlat3 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat3 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat6 = u_xlat6 * 0.0199999996;
    u_xlat1.x = u_xlat4.x * u_xlat6;
    u_xlat1.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
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
; Bound: 185
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %177 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpMemberDecorate %15 0 Offset 15 
                                              OpMemberDecorate %15 1 Offset 15 
                                              OpMemberDecorate %15 2 Offset 15 
                                              OpDecorate %15 Block 
                                              OpDecorate %17 DescriptorSet 17 
                                              OpDecorate %17 Binding 17 
                                              OpDecorate %164 DescriptorSet 164 
                                              OpDecorate %164 Binding 164 
                                              OpDecorate %168 DescriptorSet 168 
                                              OpDecorate %168 Binding 168 
                                              OpDecorate %177 Location 177 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %14 = OpTypeVector %6 4 
                                      %15 = OpTypeStruct %6 %6 %14 
                                      %16 = OpTypePointer Uniform %15 
   Uniform struct {f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                      %18 = OpTypeInt 32 1 
                                  i32 %19 = OpConstant 2 
                                      %20 = OpTypePointer Uniform %14 
                                      %31 = OpTypePointer Private %14 
                       Private f32_4* %32 = OpVariable Private 
                                  f32 %35 = OpConstant 3.674022E-40 
                                  f32 %36 = OpConstant 3.674022E-40 
                                  f32 %37 = OpConstant 3.674022E-40 
                                  f32 %38 = OpConstant 3.674022E-40 
                                f32_4 %39 = OpConstantComposite %35 %36 %37 %38 
                                  f32 %44 = OpConstant 3.674022E-40 
                                f32_4 %45 = OpConstantComposite %44 %44 %44 %44 
                                      %47 = OpTypePointer Private %10 
                       Private f32_2* %48 = OpVariable Private 
                                  i32 %49 = OpConstant 0 
                                      %50 = OpTypePointer Uniform %6 
                                  f32 %53 = OpConstant 3.674022E-40 
                                      %55 = OpTypeInt 32 0 
                                  u32 %56 = OpConstant 0 
                                      %57 = OpTypePointer Private %6 
                                  f32 %69 = OpConstant 3.674022E-40 
                                  f32 %70 = OpConstant 3.674022E-40 
                                f32_2 %71 = OpConstantComposite %69 %70 
                                  f32 %74 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                f32_2 %76 = OpConstantComposite %74 %75 
                                  f32 %85 = OpConstant 3.674022E-40 
                         Private f32* %88 = OpVariable Private 
                                 u32 %112 = OpConstant 1 
                        Private f32* %116 = OpVariable Private 
                                 i32 %127 = OpConstant 1 
                                 f32 %146 = OpConstant 3.674022E-40 
                                 f32 %153 = OpConstant 3.674022E-40 
                                     %162 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %163 = OpTypePointer UniformConstant %162 
UniformConstant read_only Texture2D* %164 = OpVariable UniformConstant 
                                     %166 = OpTypeSampler 
                                     %167 = OpTypePointer UniformConstant %166 
            UniformConstant sampler* %168 = OpVariable UniformConstant 
                                     %170 = OpTypeSampledImage %162 
                                     %176 = OpTypePointer Output %14 
                       Output f32_4* %177 = OpVariable Output 
                                 u32 %181 = OpConstant 3 
                                     %182 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %13 = OpLoad vs_TEXCOORD0 
                       Uniform f32_4* %21 = OpAccessChain %17 %19 
                                f32_4 %22 = OpLoad %21 
                                f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                f32_2 %24 = OpFMul %13 %23 
                       Uniform f32_4* %25 = OpAccessChain %17 %19 
                                f32_4 %26 = OpLoad %25 
                                f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                f32_2 %28 = OpFAdd %24 %27 
                                f32_3 %29 = OpLoad %9 
                                f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                              OpStore %9 %30 
                                f32_3 %33 = OpLoad %9 
                                f32_4 %34 = OpVectorShuffle %33 %33 0 1 0 1 
                                f32_4 %40 = OpFMul %34 %39 
                                              OpStore %32 %40 
                                f32_4 %41 = OpLoad %32 
                                f32_4 %42 = OpExtInst %1 8 %41 
                                              OpStore %32 %42 
                                f32_4 %43 = OpLoad %32 
                                f32_4 %46 = OpFMul %43 %45 
                                              OpStore %32 %46 
                         Uniform f32* %51 = OpAccessChain %17 %49 
                                  f32 %52 = OpLoad %51 
                                  f32 %54 = OpFMul %52 %53 
                         Private f32* %58 = OpAccessChain %48 %56 
                                              OpStore %58 %54 
                         Private f32* %59 = OpAccessChain %48 %56 
                                  f32 %60 = OpLoad %59 
                                  f32 %61 = OpExtInst %1 8 %60 
                         Private f32* %62 = OpAccessChain %48 %56 
                                              OpStore %62 %61 
                                f32_2 %63 = OpLoad %48 
                                f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                f32_4 %65 = OpLoad %32 
                                f32_4 %66 = OpFMul %64 %65 
                                              OpStore %32 %66 
                                f32_2 %67 = OpLoad %48 
                                f32_2 %68 = OpVectorShuffle %67 %67 0 0 
                                f32_2 %72 = OpFMul %68 %71 
                                              OpStore %48 %72 
                                f32_2 %73 = OpLoad %48 
                                  f32 %77 = OpDot %73 %76 
                         Private f32* %78 = OpAccessChain %48 %56 
                                              OpStore %78 %77 
                         Private f32* %79 = OpAccessChain %48 %56 
                                  f32 %80 = OpLoad %79 
                                  f32 %81 = OpExtInst %1 13 %80 
                         Private f32* %82 = OpAccessChain %48 %56 
                                              OpStore %82 %81 
                         Private f32* %83 = OpAccessChain %48 %56 
                                  f32 %84 = OpLoad %83 
                                  f32 %86 = OpFMul %84 %85 
                         Private f32* %87 = OpAccessChain %48 %56 
                                              OpStore %87 %86 
                                f32_4 %89 = OpLoad %32 
                                f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                  f32 %91 = OpDot %90 %76 
                                              OpStore %88 %91 
                                f32_4 %92 = OpLoad %32 
                                f32_2 %93 = OpVectorShuffle %92 %92 2 3 
                                  f32 %94 = OpDot %93 %76 
                         Private f32* %95 = OpAccessChain %32 %56 
                                              OpStore %95 %94 
                         Private f32* %96 = OpAccessChain %32 %56 
                                  f32 %97 = OpLoad %96 
                                  f32 %98 = OpExtInst %1 13 %97 
                         Private f32* %99 = OpAccessChain %32 %56 
                                              OpStore %99 %98 
                        Private f32* %100 = OpAccessChain %32 %56 
                                 f32 %101 = OpLoad %100 
                                 f32 %102 = OpFMul %101 %85 
                        Private f32* %103 = OpAccessChain %32 %56 
                                              OpStore %103 %102 
                        Private f32* %104 = OpAccessChain %32 %56 
                                 f32 %105 = OpLoad %104 
                                 f32 %106 = OpExtInst %1 10 %105 
                        Private f32* %107 = OpAccessChain %32 %56 
                                              OpStore %107 %106 
                                 f32 %108 = OpLoad %88 
                                 f32 %109 = OpExtInst %1 13 %108 
                                              OpStore %88 %109 
                                 f32 %110 = OpLoad %88 
                                 f32 %111 = OpFMul %110 %85 
                        Private f32* %113 = OpAccessChain %48 %112 
                                              OpStore %113 %111 
                               f32_2 %114 = OpLoad %48 
                               f32_2 %115 = OpExtInst %1 10 %114 
                                              OpStore %48 %115 
                        Private f32* %117 = OpAccessChain %48 %112 
                                 f32 %118 = OpLoad %117 
                        Private f32* %119 = OpAccessChain %48 %112 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFMul %118 %120 
                                              OpStore %116 %121 
                        Private f32* %122 = OpAccessChain %48 %112 
                                 f32 %123 = OpLoad %122 
                                 f32 %124 = OpLoad %116 
                                 f32 %125 = OpFMul %123 %124 
                                              OpStore %88 %125 
                                 f32 %126 = OpLoad %88 
                        Uniform f32* %128 = OpAccessChain %17 %127 
                                 f32 %129 = OpLoad %128 
                                 f32 %130 = OpFMul %126 %129 
                                              OpStore %88 %130 
                        Private f32* %131 = OpAccessChain %32 %56 
                                 f32 %132 = OpLoad %131 
                        Private f32* %133 = OpAccessChain %32 %56 
                                 f32 %134 = OpLoad %133 
                                 f32 %135 = OpFMul %132 %134 
                                              OpStore %116 %135 
                                 f32 %136 = OpLoad %116 
                        Private f32* %137 = OpAccessChain %32 %56 
                                 f32 %138 = OpLoad %137 
                                 f32 %139 = OpFMul %136 %138 
                        Private f32* %140 = OpAccessChain %32 %56 
                                              OpStore %140 %139 
                                 f32 %141 = OpLoad %88 
                        Private f32* %142 = OpAccessChain %32 %56 
                                 f32 %143 = OpLoad %142 
                                 f32 %144 = OpFMul %141 %143 
                                              OpStore %88 %144 
                                 f32 %145 = OpLoad %88 
                                 f32 %147 = OpFMul %145 %146 
                                              OpStore %88 %147 
                        Private f32* %148 = OpAccessChain %48 %56 
                                 f32 %149 = OpLoad %148 
                                 f32 %150 = OpLoad %88 
                                 f32 %151 = OpFMul %149 %150 
                        Private f32* %152 = OpAccessChain %32 %56 
                                              OpStore %152 %151 
                        Private f32* %154 = OpAccessChain %32 %112 
                                              OpStore %154 %153 
                               f32_3 %155 = OpLoad %9 
                               f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                               f32_4 %157 = OpLoad %32 
                               f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                               f32_2 %159 = OpFAdd %156 %158 
                               f32_3 %160 = OpLoad %9 
                               f32_3 %161 = OpVectorShuffle %160 %159 3 4 2 
                                              OpStore %9 %161 
                 read_only Texture2D %165 = OpLoad %164 
                             sampler %169 = OpLoad %168 
          read_only Texture2DSampled %171 = OpSampledImage %165 %169 
                               f32_3 %172 = OpLoad %9 
                               f32_2 %173 = OpVectorShuffle %172 %172 0 1 
                               f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                               f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                              OpStore %9 %175 
                               f32_3 %178 = OpLoad %9 
                               f32_4 %179 = OpLoad %177 
                               f32_4 %180 = OpVectorShuffle %179 %178 4 5 6 3 
                                              OpStore %177 %180 
                         Output f32* %183 = OpAccessChain %177 %181 
                                              OpStore %183 %70 
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