//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Drunk2" {
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
  GpuProgramID 22959
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat8;
void main()
{
    u_xlat0.x = sin(_TimeX);
    u_xlat0.x = u_xlat0.x * 0.0500000007;
    u_xlat0.y = sin(u_xlat0.x);
    u_xlat0.x = 0.0;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = (-u_xlat0.yxxy) + u_xlat8.xyxy;
    u_xlat2 = u_xlat0.yxxy + u_xlat8.xyxy;
    u_xlat0 = texture(_MainTex, u_xlat8.xy);
    u_xlat3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat2 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
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
; Bound: 120
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %39 %114 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 39 
                                             OpDecorate %66 DescriptorSet 66 
                                             OpDecorate %66 Binding 66 
                                             OpDecorate %70 DescriptorSet 70 
                                             OpDecorate %70 Binding 70 
                                             OpDecorate %114 Location 114 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %6 %7 
                                     %11 = OpTypePointer Uniform %10 
       Uniform struct {f32; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 0 
                                     %15 = OpTypePointer Uniform %6 
                                     %19 = OpTypeInt 32 0 
                                 u32 %20 = OpConstant 0 
                                     %21 = OpTypePointer Private %6 
                                 f32 %25 = OpConstant 3.674022E-40 
                                 u32 %31 = OpConstant 1 
                                 f32 %33 = OpConstant 3.674022E-40 
                                     %35 = OpTypeVector %6 2 
                                     %36 = OpTypePointer Private %35 
                      Private f32_2* %37 = OpVariable Private 
                                     %38 = OpTypePointer Input %35 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %41 = OpConstant 1 
                                     %42 = OpTypePointer Uniform %7 
                      Private f32_4* %51 = OpVariable Private 
                      Private f32_4* %58 = OpVariable Private 
                                     %64 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %65 = OpTypePointer UniformConstant %64 
UniformConstant read_only Texture2D* %66 = OpVariable UniformConstant 
                                     %68 = OpTypeSampler 
                                     %69 = OpTypePointer UniformConstant %68 
            UniformConstant sampler* %70 = OpVariable UniformConstant 
                                     %72 = OpTypeSampledImage %64 
                      Private f32_4* %76 = OpVariable Private 
                                    %113 = OpTypePointer Output %7 
                      Output f32_4* %114 = OpVariable Output 
                                f32 %116 = OpConstant 3.674022E-40 
                              f32_4 %117 = OpConstantComposite %116 %116 %116 %116 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %16 = OpAccessChain %12 %14 
                                 f32 %17 = OpLoad %16 
                                 f32 %18 = OpExtInst %1 13 %17 
                        Private f32* %22 = OpAccessChain %9 %20 
                                             OpStore %22 %18 
                        Private f32* %23 = OpAccessChain %9 %20 
                                 f32 %24 = OpLoad %23 
                                 f32 %26 = OpFMul %24 %25 
                        Private f32* %27 = OpAccessChain %9 %20 
                                             OpStore %27 %26 
                        Private f32* %28 = OpAccessChain %9 %20 
                                 f32 %29 = OpLoad %28 
                                 f32 %30 = OpExtInst %1 13 %29 
                        Private f32* %32 = OpAccessChain %9 %31 
                                             OpStore %32 %30 
                        Private f32* %34 = OpAccessChain %9 %20 
                                             OpStore %34 %33 
                               f32_2 %40 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %43 = OpAccessChain %12 %41 
                               f32_4 %44 = OpLoad %43 
                               f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                               f32_2 %46 = OpFMul %40 %45 
                      Uniform f32_4* %47 = OpAccessChain %12 %41 
                               f32_4 %48 = OpLoad %47 
                               f32_2 %49 = OpVectorShuffle %48 %48 2 3 
                               f32_2 %50 = OpFAdd %46 %49 
                                             OpStore %37 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %52 1 0 0 1 
                               f32_4 %54 = OpFNegate %53 
                               f32_2 %55 = OpLoad %37 
                               f32_4 %56 = OpVectorShuffle %55 %55 0 1 0 1 
                               f32_4 %57 = OpFAdd %54 %56 
                                             OpStore %51 %57 
                               f32_4 %59 = OpLoad %9 
                               f32_4 %60 = OpVectorShuffle %59 %59 1 0 0 1 
                               f32_2 %61 = OpLoad %37 
                               f32_4 %62 = OpVectorShuffle %61 %61 0 1 0 1 
                               f32_4 %63 = OpFAdd %60 %62 
                                             OpStore %58 %63 
                 read_only Texture2D %67 = OpLoad %66 
                             sampler %71 = OpLoad %70 
          read_only Texture2DSampled %73 = OpSampledImage %67 %71 
                               f32_2 %74 = OpLoad %37 
                               f32_4 %75 = OpImageSampleImplicitLod %73 %74 
                                             OpStore %9 %75 
                 read_only Texture2D %77 = OpLoad %66 
                             sampler %78 = OpLoad %70 
          read_only Texture2DSampled %79 = OpSampledImage %77 %78 
                               f32_4 %80 = OpLoad %51 
                               f32_2 %81 = OpVectorShuffle %80 %80 0 1 
                               f32_4 %82 = OpImageSampleImplicitLod %79 %81 
                                             OpStore %76 %82 
                 read_only Texture2D %83 = OpLoad %66 
                             sampler %84 = OpLoad %70 
          read_only Texture2DSampled %85 = OpSampledImage %83 %84 
                               f32_4 %86 = OpLoad %51 
                               f32_2 %87 = OpVectorShuffle %86 %86 2 3 
                               f32_4 %88 = OpImageSampleImplicitLod %85 %87 
                                             OpStore %51 %88 
                               f32_4 %89 = OpLoad %9 
                               f32_4 %90 = OpLoad %76 
                               f32_4 %91 = OpFAdd %89 %90 
                                             OpStore %9 %91 
                 read_only Texture2D %92 = OpLoad %66 
                             sampler %93 = OpLoad %70 
          read_only Texture2DSampled %94 = OpSampledImage %92 %93 
                               f32_4 %95 = OpLoad %58 
                               f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                             OpStore %76 %97 
                 read_only Texture2D %98 = OpLoad %66 
                             sampler %99 = OpLoad %70 
         read_only Texture2DSampled %100 = OpSampledImage %98 %99 
                              f32_4 %101 = OpLoad %58 
                              f32_2 %102 = OpVectorShuffle %101 %101 2 3 
                              f32_4 %103 = OpImageSampleImplicitLod %100 %102 
                                             OpStore %58 %103 
                              f32_4 %104 = OpLoad %9 
                              f32_4 %105 = OpLoad %76 
                              f32_4 %106 = OpFAdd %104 %105 
                                             OpStore %9 %106 
                              f32_4 %107 = OpLoad %51 
                              f32_4 %108 = OpLoad %9 
                              f32_4 %109 = OpFAdd %107 %108 
                                             OpStore %9 %109 
                              f32_4 %110 = OpLoad %58 
                              f32_4 %111 = OpLoad %9 
                              f32_4 %112 = OpFAdd %110 %111 
                                             OpStore %9 %112 
                              f32_4 %115 = OpLoad %9 
                              f32_4 %118 = OpFMul %115 %117 
                                             OpStore %114 %118 
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