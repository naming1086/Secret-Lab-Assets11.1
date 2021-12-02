//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Edge_Sobel" {
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
  GpuProgramID 64316
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
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat12;
float u_xlat13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
    u_xlat0.z = (-u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.zyxy + u_xlat1.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat13 = sqrt(u_xlat13);
    u_xlat0.w = 0.0;
    u_xlat2 = u_xlat0.wyxw + u_xlat1.xyxy;
    u_xlat3 = u_xlat0.wyxy * vec4(1.0, -1.0, 1.0, -1.0) + u_xlat1.xyxy;
    u_xlat4.xyz = (-u_xlat0.xyx);
    u_xlat5 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.y = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.y) * 2.0 + (-u_xlat13);
    u_xlat6.x = (-u_xlat0.z) + u_xlat6.x;
    u_xlat4.w = 0.0;
    u_xlat2 = u_xlat1.xyxy + u_xlat4.zwxy;
    u_xlat4 = texture(_MainTex, u_xlat2.zw);
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat6.z = u_xlat18 * 2.0 + u_xlat13;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xx;
    u_xlat12.x = (-u_xlat0.z) + u_xlat6.z;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat12.x;
    u_xlat1 = texture(_MainTex, u_xlat3.xy);
    u_xlat2 = texture(_MainTex, u_xlat3.zw);
    u_xlat12.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12.xy = sqrt(u_xlat12.xy);
    u_xlat6.x = u_xlat12.y * 2.0 + u_xlat6.x;
    u_xlat6.x = u_xlat12.x + u_xlat6.x;
    u_xlat0.x = (-u_xlat12.x) + u_xlat0.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat6.x;
    SV_Target0.xyz = sqrt(u_xlat0.xxx);
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
; Bound: 311
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %37 %302 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %13 0 Offset 13 
                                             OpMemberDecorate %13 1 Offset 13 
                                             OpDecorate %13 Block 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD0 Location 37 
                                             OpDecorate %59 DescriptorSet 59 
                                             OpDecorate %59 Binding 59 
                                             OpDecorate %63 DescriptorSet 63 
                                             OpDecorate %63 Binding 63 
                                             OpDecorate %302 Location 302 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                 f32 %11 = OpConstant 3.674022E-40 
                               f32_2 %12 = OpConstantComposite %11 %11 
                                     %13 = OpTypeStruct %7 %7 
                                     %14 = OpTypePointer Uniform %13 
     Uniform struct {f32_4; f32_4;}* %15 = OpVariable Uniform 
                                     %16 = OpTypeInt 32 1 
                                 i32 %17 = OpConstant 0 
                                     %18 = OpTypePointer Uniform %7 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 0 
                                     %27 = OpTypePointer Private %6 
                                 u32 %31 = OpConstant 2 
                                     %33 = OpTypeVector %6 3 
                                     %34 = OpTypePointer Private %33 
                      Private f32_3* %35 = OpVariable Private 
                                     %36 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %39 = OpConstant 1 
                      Private f32_4* %50 = OpVariable Private 
                      Private f32_4* %56 = OpVariable Private 
                                     %57 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %58 = OpTypePointer UniformConstant %57 
UniformConstant read_only Texture2D* %59 = OpVariable UniformConstant 
                                     %61 = OpTypeSampler 
                                     %62 = OpTypePointer UniformConstant %61 
            UniformConstant sampler* %63 = OpVariable UniformConstant 
                                     %65 = OpTypeSampledImage %57 
                                     %82 = OpTypePointer Private %10 
                      Private f32_2* %83 = OpVariable Private 
                      Private f32_2* %94 = OpVariable Private 
                                f32 %101 = OpConstant 3.674022E-40 
                                u32 %102 = OpConstant 3 
                                f32 %111 = OpConstant 3.674022E-40 
                              f32_4 %112 = OpConstantComposite %11 %111 %11 %111 
                     Private f32_4* %117 = OpVariable Private 
                                u32 %146 = OpConstant 1 
                                f32 %163 = OpConstant 3.674022E-40 
                       Private f32* %201 = OpVariable Private 
                       Private f32* %215 = OpVariable Private 
                                    %301 = OpTypePointer Output %7 
                      Output f32_4* %302 = OpVariable Output 
                                    %308 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %19 = OpAccessChain %15 %17 
                               f32_4 %20 = OpLoad %19 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                               f32_2 %22 = OpFDiv %12 %21 
                               f32_4 %23 = OpLoad %9 
                               f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
                                             OpStore %9 %24 
                        Private f32* %28 = OpAccessChain %9 %26 
                                 f32 %29 = OpLoad %28 
                                 f32 %30 = OpFNegate %29 
                        Private f32* %32 = OpAccessChain %9 %31 
                                             OpStore %32 %30 
                               f32_2 %38 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %40 = OpAccessChain %15 %39 
                               f32_4 %41 = OpLoad %40 
                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               f32_2 %43 = OpFMul %38 %42 
                      Uniform f32_4* %44 = OpAccessChain %15 %39 
                               f32_4 %45 = OpLoad %44 
                               f32_2 %46 = OpVectorShuffle %45 %45 2 3 
                               f32_2 %47 = OpFAdd %43 %46 
                               f32_3 %48 = OpLoad %35 
                               f32_3 %49 = OpVectorShuffle %48 %47 3 4 2 
                                             OpStore %35 %49 
                               f32_4 %51 = OpLoad %9 
                               f32_4 %52 = OpVectorShuffle %51 %51 2 1 0 1 
                               f32_3 %53 = OpLoad %35 
                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
                               f32_4 %55 = OpFAdd %52 %54 
                                             OpStore %50 %55 
                 read_only Texture2D %60 = OpLoad %59 
                             sampler %64 = OpLoad %63 
          read_only Texture2DSampled %66 = OpSampledImage %60 %64 
                               f32_4 %67 = OpLoad %50 
                               f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                               f32_4 %69 = OpImageSampleImplicitLod %66 %68 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_4 %71 = OpLoad %56 
                               f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                             OpStore %56 %72 
                 read_only Texture2D %73 = OpLoad %59 
                             sampler %74 = OpLoad %63 
          read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                               f32_4 %76 = OpLoad %50 
                               f32_2 %77 = OpVectorShuffle %76 %76 2 3 
                               f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               f32_4 %80 = OpLoad %50 
                               f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                             OpStore %50 %81 
                               f32_4 %84 = OpLoad %50 
                               f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               f32_4 %86 = OpLoad %50 
                               f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                 f32 %88 = OpDot %85 %87 
                        Private f32* %89 = OpAccessChain %83 %26 
                                             OpStore %89 %88 
                        Private f32* %90 = OpAccessChain %83 %26 
                                 f32 %91 = OpLoad %90 
                                 f32 %92 = OpExtInst %1 31 %91 
                        Private f32* %93 = OpAccessChain %83 %26 
                                             OpStore %93 %92 
                               f32_4 %95 = OpLoad %56 
                               f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                               f32_4 %97 = OpLoad %56 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                 f32 %99 = OpDot %96 %98 
                       Private f32* %100 = OpAccessChain %94 %26 
                                             OpStore %100 %99 
                       Private f32* %103 = OpAccessChain %9 %102 
                                             OpStore %103 %101 
                              f32_4 %104 = OpLoad %9 
                              f32_4 %105 = OpVectorShuffle %104 %104 3 1 0 3 
                              f32_3 %106 = OpLoad %35 
                              f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
                              f32_4 %108 = OpFAdd %105 %107 
                                             OpStore %50 %108 
                              f32_4 %109 = OpLoad %9 
                              f32_4 %110 = OpVectorShuffle %109 %109 3 1 0 1 
                              f32_4 %113 = OpFMul %110 %112 
                              f32_3 %114 = OpLoad %35 
                              f32_4 %115 = OpVectorShuffle %114 %114 0 1 0 1 
                              f32_4 %116 = OpFAdd %113 %115 
                                             OpStore %56 %116 
                              f32_4 %118 = OpLoad %9 
                              f32_3 %119 = OpVectorShuffle %118 %118 0 1 0 
                              f32_3 %120 = OpFNegate %119 
                              f32_4 %121 = OpLoad %117 
                              f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                             OpStore %117 %122 
                read_only Texture2D %123 = OpLoad %59 
                            sampler %124 = OpLoad %63 
         read_only Texture2DSampled %125 = OpSampledImage %123 %124 
                              f32_4 %126 = OpLoad %50 
                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                              f32_4 %128 = OpImageSampleImplicitLod %125 %127 
                              f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                              f32_4 %130 = OpLoad %9 
                              f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 6 
                                             OpStore %9 %131 
                read_only Texture2D %132 = OpLoad %59 
                            sampler %133 = OpLoad %63 
         read_only Texture2DSampled %134 = OpSampledImage %132 %133 
                              f32_4 %135 = OpLoad %50 
                              f32_2 %136 = OpVectorShuffle %135 %135 2 3 
                              f32_4 %137 = OpImageSampleImplicitLod %134 %136 
                              f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                              f32_4 %139 = OpLoad %50 
                              f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                             OpStore %50 %140 
                              f32_4 %141 = OpLoad %50 
                              f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              f32_4 %143 = OpLoad %50 
                              f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                f32 %145 = OpDot %142 %144 
                       Private f32* %147 = OpAccessChain %94 %146 
                                             OpStore %147 %145 
                              f32_2 %148 = OpLoad %94 
                              f32_2 %149 = OpExtInst %1 31 %148 
                                             OpStore %94 %149 
                              f32_4 %150 = OpLoad %9 
                              f32_3 %151 = OpVectorShuffle %150 %150 0 1 3 
                              f32_4 %152 = OpLoad %9 
                              f32_3 %153 = OpVectorShuffle %152 %152 0 1 3 
                                f32 %154 = OpDot %151 %153 
                       Private f32* %155 = OpAccessChain %9 %26 
                                             OpStore %155 %154 
                       Private f32* %156 = OpAccessChain %9 %26 
                                f32 %157 = OpLoad %156 
                                f32 %158 = OpExtInst %1 31 %157 
                       Private f32* %159 = OpAccessChain %9 %26 
                                             OpStore %159 %158 
                       Private f32* %160 = OpAccessChain %9 %26 
                                f32 %161 = OpLoad %160 
                                f32 %162 = OpFNegate %161 
                                f32 %164 = OpFMul %162 %163 
                       Private f32* %165 = OpAccessChain %94 %26 
                                f32 %166 = OpLoad %165 
                                f32 %167 = OpFNegate %166 
                                f32 %168 = OpFAdd %164 %167 
                       Private f32* %169 = OpAccessChain %9 %26 
                                             OpStore %169 %168 
                       Private f32* %170 = OpAccessChain %83 %26 
                                f32 %171 = OpLoad %170 
                                f32 %172 = OpFNegate %171 
                       Private f32* %173 = OpAccessChain %9 %26 
                                f32 %174 = OpLoad %173 
                                f32 %175 = OpFAdd %172 %174 
                       Private f32* %176 = OpAccessChain %9 %26 
                                             OpStore %176 %175 
                       Private f32* %177 = OpAccessChain %117 %102 
                                             OpStore %177 %101 
                              f32_3 %178 = OpLoad %35 
                              f32_4 %179 = OpVectorShuffle %178 %178 0 1 0 1 
                              f32_4 %180 = OpLoad %117 
                              f32_4 %181 = OpVectorShuffle %180 %180 2 3 0 1 
                              f32_4 %182 = OpFAdd %179 %181 
                                             OpStore %50 %182 
                read_only Texture2D %183 = OpLoad %59 
                            sampler %184 = OpLoad %63 
         read_only Texture2DSampled %185 = OpSampledImage %183 %184 
                              f32_4 %186 = OpLoad %50 
                              f32_2 %187 = OpVectorShuffle %186 %186 2 3 
                              f32_4 %188 = OpImageSampleImplicitLod %185 %187 
                              f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                              f32_4 %190 = OpLoad %117 
                              f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                             OpStore %117 %191 
                read_only Texture2D %192 = OpLoad %59 
                            sampler %193 = OpLoad %63 
         read_only Texture2DSampled %194 = OpSampledImage %192 %193 
                              f32_4 %195 = OpLoad %50 
                              f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                              f32_4 %197 = OpImageSampleImplicitLod %194 %196 
                              f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                              f32_4 %199 = OpLoad %50 
                              f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
                                             OpStore %50 %200 
                              f32_4 %202 = OpLoad %50 
                              f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                              f32_4 %204 = OpLoad %50 
                              f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                f32 %206 = OpDot %203 %205 
                                             OpStore %201 %206 
                                f32 %207 = OpLoad %201 
                                f32 %208 = OpExtInst %1 31 %207 
                                             OpStore %201 %208 
                                f32 %209 = OpLoad %201 
                                f32 %210 = OpFMul %209 %163 
                       Private f32* %211 = OpAccessChain %94 %26 
                                f32 %212 = OpLoad %211 
                                f32 %213 = OpFAdd %210 %212 
                       Private f32* %214 = OpAccessChain %9 %146 
                                             OpStore %214 %213 
                              f32_4 %216 = OpLoad %117 
                              f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                              f32_4 %218 = OpLoad %117 
                              f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                f32 %220 = OpDot %217 %219 
                                             OpStore %215 %220 
                                f32 %221 = OpLoad %215 
                                f32 %222 = OpExtInst %1 31 %221 
                                             OpStore %215 %222 
                                f32 %223 = OpLoad %215 
                              f32_2 %224 = OpCompositeConstruct %223 %223 
                              f32_4 %225 = OpLoad %9 
                              f32_2 %226 = OpVectorShuffle %225 %225 0 1 
                              f32_2 %227 = OpFAdd %224 %226 
                              f32_4 %228 = OpLoad %9 
                              f32_4 %229 = OpVectorShuffle %228 %227 4 5 2 3 
                                             OpStore %9 %229 
                       Private f32* %230 = OpAccessChain %83 %26 
                                f32 %231 = OpLoad %230 
                                f32 %232 = OpFNegate %231 
                       Private f32* %233 = OpAccessChain %9 %146 
                                f32 %234 = OpLoad %233 
                                f32 %235 = OpFAdd %232 %234 
                                             OpStore %201 %235 
                       Private f32* %236 = OpAccessChain %94 %146 
                                f32 %237 = OpLoad %236 
                                f32 %238 = OpFNegate %237 
                                f32 %239 = OpFMul %238 %163 
                                f32 %240 = OpLoad %201 
                                f32 %241 = OpFAdd %239 %240 
                                             OpStore %201 %241 
                read_only Texture2D %242 = OpLoad %59 
                            sampler %243 = OpLoad %63 
         read_only Texture2DSampled %244 = OpSampledImage %242 %243 
                              f32_4 %245 = OpLoad %56 
                              f32_2 %246 = OpVectorShuffle %245 %245 0 1 
                              f32_4 %247 = OpImageSampleImplicitLod %244 %246 
                              f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                             OpStore %35 %248 
                read_only Texture2D %249 = OpLoad %59 
                            sampler %250 = OpLoad %63 
         read_only Texture2DSampled %251 = OpSampledImage %249 %250 
                              f32_4 %252 = OpLoad %56 
                              f32_2 %253 = OpVectorShuffle %252 %252 2 3 
                              f32_4 %254 = OpImageSampleImplicitLod %251 %253 
                              f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                              f32_4 %256 = OpLoad %50 
                              f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                             OpStore %50 %257 
                              f32_4 %258 = OpLoad %50 
                              f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                              f32_4 %260 = OpLoad %50 
                              f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                f32 %262 = OpDot %259 %261 
                       Private f32* %263 = OpAccessChain %83 %26 
                                             OpStore %263 %262 
                              f32_3 %264 = OpLoad %35 
                              f32_3 %265 = OpLoad %35 
                                f32 %266 = OpDot %264 %265 
                       Private f32* %267 = OpAccessChain %83 %146 
                                             OpStore %267 %266 
                              f32_2 %268 = OpLoad %83 
                              f32_2 %269 = OpExtInst %1 31 %268 
                                             OpStore %83 %269 
                       Private f32* %270 = OpAccessChain %83 %146 
                                f32 %271 = OpLoad %270 
                                f32 %272 = OpFMul %271 %163 
                       Private f32* %273 = OpAccessChain %9 %26 
                                f32 %274 = OpLoad %273 
                                f32 %275 = OpFAdd %272 %274 
                       Private f32* %276 = OpAccessChain %9 %26 
                                             OpStore %276 %275 
                       Private f32* %277 = OpAccessChain %83 %26 
                                f32 %278 = OpLoad %277 
                       Private f32* %279 = OpAccessChain %9 %26 
                                f32 %280 = OpLoad %279 
                                f32 %281 = OpFAdd %278 %280 
                       Private f32* %282 = OpAccessChain %9 %26 
                                             OpStore %282 %281 
                       Private f32* %283 = OpAccessChain %83 %26 
                                f32 %284 = OpLoad %283 
                                f32 %285 = OpFNegate %284 
                                f32 %286 = OpLoad %201 
                                f32 %287 = OpFAdd %285 %286 
                                             OpStore %201 %287 
                       Private f32* %288 = OpAccessChain %9 %26 
                                f32 %289 = OpLoad %288 
                       Private f32* %290 = OpAccessChain %9 %26 
                                f32 %291 = OpLoad %290 
                                f32 %292 = OpFMul %289 %291 
                       Private f32* %293 = OpAccessChain %9 %26 
                                             OpStore %293 %292 
                                f32 %294 = OpLoad %201 
                                f32 %295 = OpLoad %201 
                                f32 %296 = OpFMul %294 %295 
                       Private f32* %297 = OpAccessChain %9 %26 
                                f32 %298 = OpLoad %297 
                                f32 %299 = OpFAdd %296 %298 
                       Private f32* %300 = OpAccessChain %9 %26 
                                             OpStore %300 %299 
                              f32_4 %303 = OpLoad %9 
                              f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                              f32_3 %305 = OpExtInst %1 31 %304 
                              f32_4 %306 = OpLoad %302 
                              f32_4 %307 = OpVectorShuffle %306 %305 4 5 6 3 
                                             OpStore %302 %307 
                        Output f32* %309 = OpAccessChain %302 %102 
                                             OpStore %309 %11 
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