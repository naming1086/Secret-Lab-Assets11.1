//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Pixelisation_Sweater" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 1
_Brightness ("_Brightness", Range(0, 1)) = 1.5
_Saturation ("_Saturation", Range(0, 1)) = 3
_Contrast ("_Contrast", Range(0, 1)) = 3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 49061
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
uniform 	float _Fade;
uniform 	float _SweaterSize;
uniform 	float _Intensity;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D Texture2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _SweaterSize + _SweaterSize;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat1.xy * vec2(vec2(_SweaterSize, _SweaterSize));
    u_xlat2 = texture(Texture2, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5);
    u_xlat3 = texture(Texture2, u_xlat4.xy);
    u_xlat4.x = u_xlat2.y / _SweaterSize;
    u_xlat4.x = (-u_xlat4.x) + u_xlat1.y;
    u_xlat1.z = u_xlat0.x + u_xlat4.x;
    u_xlat0.xy = u_xlat1.xz * vec2(vec2(_SweaterSize, _SweaterSize));
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_SweaterSize, _SweaterSize));
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat3 = u_xlat0 * u_xlat3.zzzz;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat0;
    u_xlat0 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity)) + (-u_xlat1);
    SV_Target0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat0 + u_xlat1;
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
; Bound: 205
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %33 %184 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpMemberDecorate %10 0 Offset 10 
                                                OpMemberDecorate %10 1 Offset 10 
                                                OpMemberDecorate %10 2 Offset 10 
                                                OpMemberDecorate %10 3 Offset 10 
                                                OpDecorate %10 Block 
                                                OpDecorate %12 DescriptorSet 12 
                                                OpDecorate %12 Binding 12 
                                                OpDecorate vs_TEXCOORD0 Location 33 
                                                OpDecorate %63 DescriptorSet 63 
                                                OpDecorate %63 Binding 63 
                                                OpDecorate %67 DescriptorSet 67 
                                                OpDecorate %67 Binding 67 
                                                OpDecorate %116 DescriptorSet 116 
                                                OpDecorate %116 Binding 116 
                                                OpDecorate %118 DescriptorSet 118 
                                                OpDecorate %118 Binding 118 
                                                OpDecorate %184 Location 184 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeStruct %6 %6 %6 %7 
                                        %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                        %13 = OpTypeInt 32 1 
                                    i32 %14 = OpConstant 1 
                                        %15 = OpTypePointer Uniform %6 
                                        %21 = OpTypeInt 32 0 
                                    u32 %22 = OpConstant 0 
                                        %23 = OpTypePointer Private %6 
                                    f32 %25 = OpConstant 3.674022E-40 
                         Private f32_4* %30 = OpVariable Private 
                                        %31 = OpTypeVector %6 2 
                                        %32 = OpTypePointer Input %31 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                    i32 %35 = OpConstant 3 
                                        %36 = OpTypePointer Uniform %7 
                                        %47 = OpTypePointer Private %31 
                         Private f32_2* %48 = OpVariable Private 
                         Private f32_2* %60 = OpVariable Private 
                                        %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %62 = OpTypePointer UniformConstant %61 
   UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                        %65 = OpTypeSampler 
                                        %66 = OpTypePointer UniformConstant %65 
               UniformConstant sampler* %67 = OpVariable UniformConstant 
                                        %69 = OpTypeSampledImage %61 
                                    f32 %75 = OpConstant 3.674022E-40 
                                  f32_2 %76 = OpConstantComposite %75 %75 
                                    u32 %83 = OpConstant 2 
                           Private f32* %86 = OpVariable Private 
                                    u32 %87 = OpConstant 1 
  UniformConstant read_only Texture2D* %116 = OpVariable UniformConstant 
              UniformConstant sampler* %118 = OpVariable UniformConstant 
                        Private f32_4* %142 = OpVariable Private 
                                   i32 %164 = OpConstant 2 
                                       %183 = OpTypePointer Output %7 
                         Output f32_4* %184 = OpVariable Output 
                                   i32 %185 = OpConstant 0 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                           Uniform f32* %16 = OpAccessChain %12 %14 
                                    f32 %17 = OpLoad %16 
                           Uniform f32* %18 = OpAccessChain %12 %14 
                                    f32 %19 = OpLoad %18 
                                    f32 %20 = OpFAdd %17 %19 
                           Private f32* %24 = OpAccessChain %9 %22 
                                                OpStore %24 %20 
                           Private f32* %26 = OpAccessChain %9 %22 
                                    f32 %27 = OpLoad %26 
                                    f32 %28 = OpFDiv %25 %27 
                           Private f32* %29 = OpAccessChain %9 %22 
                                                OpStore %29 %28 
                                  f32_2 %34 = OpLoad vs_TEXCOORD0 
                         Uniform f32_4* %37 = OpAccessChain %12 %35 
                                  f32_4 %38 = OpLoad %37 
                                  f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                  f32_2 %40 = OpFMul %34 %39 
                         Uniform f32_4* %41 = OpAccessChain %12 %35 
                                  f32_4 %42 = OpLoad %41 
                                  f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                  f32_2 %44 = OpFAdd %40 %43 
                                  f32_4 %45 = OpLoad %30 
                                  f32_4 %46 = OpVectorShuffle %45 %44 4 5 2 3 
                                                OpStore %30 %46 
                                  f32_4 %49 = OpLoad %30 
                                  f32_2 %50 = OpVectorShuffle %49 %49 0 1 
                           Uniform f32* %51 = OpAccessChain %12 %14 
                                    f32 %52 = OpLoad %51 
                           Uniform f32* %53 = OpAccessChain %12 %14 
                                    f32 %54 = OpLoad %53 
                                  f32_2 %55 = OpCompositeConstruct %52 %54 
                                    f32 %56 = OpCompositeExtract %55 0 
                                    f32 %57 = OpCompositeExtract %55 1 
                                  f32_2 %58 = OpCompositeConstruct %56 %57 
                                  f32_2 %59 = OpFMul %50 %58 
                                                OpStore %48 %59 
                    read_only Texture2D %64 = OpLoad %63 
                                sampler %68 = OpLoad %67 
             read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                                  f32_2 %71 = OpLoad %48 
                                  f32_4 %72 = OpImageSampleImplicitLod %70 %71 
                                  f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                                OpStore %60 %73 
                                  f32_2 %74 = OpLoad %48 
                                  f32_2 %77 = OpFMul %74 %76 
                                                OpStore %48 %77 
                    read_only Texture2D %78 = OpLoad %63 
                                sampler %79 = OpLoad %67 
             read_only Texture2DSampled %80 = OpSampledImage %78 %79 
                                  f32_2 %81 = OpLoad %48 
                                  f32_4 %82 = OpImageSampleImplicitLod %80 %81 
                                    f32 %84 = OpCompositeExtract %82 2 
                           Private f32* %85 = OpAccessChain %48 %22 
                                                OpStore %85 %84 
                           Private f32* %88 = OpAccessChain %60 %87 
                                    f32 %89 = OpLoad %88 
                           Uniform f32* %90 = OpAccessChain %12 %14 
                                    f32 %91 = OpLoad %90 
                                    f32 %92 = OpFDiv %89 %91 
                                                OpStore %86 %92 
                                    f32 %93 = OpLoad %86 
                                    f32 %94 = OpFNegate %93 
                           Private f32* %95 = OpAccessChain %30 %87 
                                    f32 %96 = OpLoad %95 
                                    f32 %97 = OpFAdd %94 %96 
                                                OpStore %86 %97 
                           Private f32* %98 = OpAccessChain %9 %22 
                                    f32 %99 = OpLoad %98 
                                   f32 %100 = OpLoad %86 
                                   f32 %101 = OpFAdd %99 %100 
                          Private f32* %102 = OpAccessChain %30 %83 
                                                OpStore %102 %101 
                                 f32_4 %103 = OpLoad %30 
                                 f32_2 %104 = OpVectorShuffle %103 %103 0 2 
                          Uniform f32* %105 = OpAccessChain %12 %14 
                                   f32 %106 = OpLoad %105 
                          Uniform f32* %107 = OpAccessChain %12 %14 
                                   f32 %108 = OpLoad %107 
                                 f32_2 %109 = OpCompositeConstruct %106 %108 
                                   f32 %110 = OpCompositeExtract %109 0 
                                   f32 %111 = OpCompositeExtract %109 1 
                                 f32_2 %112 = OpCompositeConstruct %110 %111 
                                 f32_2 %113 = OpFMul %104 %112 
                                 f32_4 %114 = OpLoad %9 
                                 f32_4 %115 = OpVectorShuffle %114 %113 4 1 5 3 
                                                OpStore %9 %115 
                   read_only Texture2D %117 = OpLoad %116 
                               sampler %119 = OpLoad %118 
            read_only Texture2DSampled %120 = OpSampledImage %117 %119 
                                 f32_4 %121 = OpLoad %30 
                                 f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                 f32_4 %123 = OpImageSampleImplicitLod %120 %122 
                                                OpStore %30 %123 
                                 f32_4 %124 = OpLoad %9 
                                 f32_2 %125 = OpVectorShuffle %124 %124 0 2 
                                 f32_2 %126 = OpExtInst %1 8 %125 
                                 f32_4 %127 = OpLoad %9 
                                 f32_4 %128 = OpVectorShuffle %127 %126 4 1 5 3 
                                                OpStore %9 %128 
                                 f32_4 %129 = OpLoad %9 
                                 f32_2 %130 = OpVectorShuffle %129 %129 0 2 
                          Uniform f32* %131 = OpAccessChain %12 %14 
                                   f32 %132 = OpLoad %131 
                          Uniform f32* %133 = OpAccessChain %12 %14 
                                   f32 %134 = OpLoad %133 
                                 f32_2 %135 = OpCompositeConstruct %132 %134 
                                   f32 %136 = OpCompositeExtract %135 0 
                                   f32 %137 = OpCompositeExtract %135 1 
                                 f32_2 %138 = OpCompositeConstruct %136 %137 
                                 f32_2 %139 = OpFDiv %130 %138 
                                 f32_4 %140 = OpLoad %9 
                                 f32_4 %141 = OpVectorShuffle %140 %139 4 1 5 3 
                                                OpStore %9 %141 
                   read_only Texture2D %143 = OpLoad %116 
                               sampler %144 = OpLoad %118 
            read_only Texture2DSampled %145 = OpSampledImage %143 %144 
                                 f32_4 %146 = OpLoad %9 
                                 f32_2 %147 = OpVectorShuffle %146 %146 0 2 
                                 f32_4 %148 = OpImageSampleImplicitLod %145 %147 
                                                OpStore %142 %148 
                                 f32_2 %149 = OpLoad %48 
                                 f32_4 %150 = OpVectorShuffle %149 %149 0 0 0 0 
                                 f32_4 %151 = OpLoad %142 
                                 f32_4 %152 = OpFMul %150 %151 
                                                OpStore %9 %152 
                                 f32_4 %153 = OpLoad %142 
                                 f32_2 %154 = OpLoad %60 
                                 f32_4 %155 = OpVectorShuffle %154 %154 0 0 0 0 
                                 f32_4 %156 = OpFMul %153 %155 
                                 f32_4 %157 = OpLoad %9 
                                 f32_4 %158 = OpFAdd %156 %157 
                                                OpStore %9 %158 
                                 f32_2 %159 = OpLoad %60 
                                 f32_4 %160 = OpVectorShuffle %159 %159 0 0 0 0 
                                 f32_4 %161 = OpLoad %9 
                                 f32_4 %162 = OpFMul %160 %161 
                                                OpStore %9 %162 
                                 f32_4 %163 = OpLoad %9 
                          Uniform f32* %165 = OpAccessChain %12 %164 
                                   f32 %166 = OpLoad %165 
                          Uniform f32* %167 = OpAccessChain %12 %164 
                                   f32 %168 = OpLoad %167 
                          Uniform f32* %169 = OpAccessChain %12 %164 
                                   f32 %170 = OpLoad %169 
                          Uniform f32* %171 = OpAccessChain %12 %164 
                                   f32 %172 = OpLoad %171 
                                 f32_4 %173 = OpCompositeConstruct %166 %168 %170 %172 
                                   f32 %174 = OpCompositeExtract %173 0 
                                   f32 %175 = OpCompositeExtract %173 1 
                                   f32 %176 = OpCompositeExtract %173 2 
                                   f32 %177 = OpCompositeExtract %173 3 
                                 f32_4 %178 = OpCompositeConstruct %174 %175 %176 %177 
                                 f32_4 %179 = OpFMul %163 %178 
                                 f32_4 %180 = OpLoad %30 
                                 f32_4 %181 = OpFNegate %180 
                                 f32_4 %182 = OpFAdd %179 %181 
                                                OpStore %9 %182 
                          Uniform f32* %186 = OpAccessChain %12 %185 
                                   f32 %187 = OpLoad %186 
                          Uniform f32* %188 = OpAccessChain %12 %185 
                                   f32 %189 = OpLoad %188 
                          Uniform f32* %190 = OpAccessChain %12 %185 
                                   f32 %191 = OpLoad %190 
                          Uniform f32* %192 = OpAccessChain %12 %185 
                                   f32 %193 = OpLoad %192 
                                 f32_4 %194 = OpCompositeConstruct %187 %189 %191 %193 
                                   f32 %195 = OpCompositeExtract %194 0 
                                   f32 %196 = OpCompositeExtract %194 1 
                                   f32 %197 = OpCompositeExtract %194 2 
                                   f32 %198 = OpCompositeExtract %194 3 
                                 f32_4 %199 = OpCompositeConstruct %195 %196 %197 %198 
                                 f32_4 %200 = OpLoad %9 
                                 f32_4 %201 = OpFMul %199 %200 
                                 f32_4 %202 = OpLoad %30 
                                 f32_4 %203 = OpFAdd %201 %202 
                                                OpStore %184 %203 
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