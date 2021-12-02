//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Edge_Neon" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_EdgeWeight ("_EdgeWeight", Range(1, 10)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 12228
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
uniform 	float _EdgeWeight;
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
vec4 u_xlat6;
vec4 u_xlat7;
vec2 u_xlat17;
void main()
{
    u_xlat0.x = _EdgeWeight * 100.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat17.xy = (-u_xlat0.xx) + u_xlat1.xy;
    u_xlat2 = texture(_MainTex, u_xlat17.xy);
    u_xlat0.yz = (-u_xlat0.xx);
    u_xlat3 = u_xlat0.yxxx + u_xlat1.xyxy;
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat5 = (-u_xlat2) + u_xlat4;
    u_xlat0.w = 0.0;
    u_xlat6 = u_xlat0.zwwx + u_xlat1.xyxy;
    u_xlat7 = u_xlat0.xwxz + u_xlat1.xyxy;
    u_xlat0.xy = u_xlat0.wx * vec2(1.0, -1.0) + u_xlat1.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, u_xlat6.zw);
    u_xlat6 = texture(_MainTex, u_xlat6.xy);
    u_xlat4 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat4;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat5;
    u_xlat0 = (-u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat1;
    u_xlat0 = u_xlat3 + u_xlat0;
    u_xlat1 = texture(_MainTex, u_xlat7.zw);
    u_xlat3 = texture(_MainTex, u_xlat7.xy);
    u_xlat2 = (-u_xlat3) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat2;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat0 = u_xlat0 + (-u_xlat1);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat2 * u_xlat2 + u_xlat0;
    SV_Target0 = sqrt(u_xlat0);
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
; Bound: 202
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %32 %198 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 32 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpDecorate %61 DescriptorSet 61 
                                             OpDecorate %61 Binding 61 
                                             OpDecorate %198 Location 198 
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
                                 f32 %18 = OpConstant 3.674022E-40 
                                     %20 = OpTypeInt 32 0 
                                 u32 %21 = OpConstant 0 
                                     %22 = OpTypePointer Private %6 
                                 f32 %24 = OpConstant 3.674022E-40 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeVector %6 2 
                                     %31 = OpTypePointer Input %30 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %7 
                                     %46 = OpTypePointer Private %30 
                      Private f32_2* %47 = OpVariable Private 
                      Private f32_4* %54 = OpVariable Private 
                                     %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %56 = OpTypePointer UniformConstant %55 
UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
                                     %59 = OpTypeSampler 
                                     %60 = OpTypePointer UniformConstant %59 
            UniformConstant sampler* %61 = OpVariable UniformConstant 
                                     %63 = OpTypeSampledImage %55 
                      Private f32_4* %72 = OpVariable Private 
                      Private f32_4* %78 = OpVariable Private 
                      Private f32_4* %91 = OpVariable Private 
                                 f32 %96 = OpConstant 3.674022E-40 
                                 u32 %97 = OpConstant 3 
                      Private f32_4* %99 = OpVariable Private 
                     Private f32_4* %105 = OpVariable Private 
                                f32 %113 = OpConstant 3.674022E-40 
                              f32_2 %114 = OpConstantComposite %24 %113 
                                f32 %140 = OpConstant 3.674022E-40 
                              f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                                    %197 = OpTypePointer Output %7 
                      Output f32_4* %198 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %16 = OpAccessChain %12 %14 
                                 f32 %17 = OpLoad %16 
                                 f32 %19 = OpFMul %17 %18 
                        Private f32* %23 = OpAccessChain %9 %21 
                                             OpStore %23 %19 
                        Private f32* %25 = OpAccessChain %9 %21 
                                 f32 %26 = OpLoad %25 
                                 f32 %27 = OpFDiv %24 %26 
                        Private f32* %28 = OpAccessChain %9 %21 
                                             OpStore %28 %27 
                               f32_2 %33 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %36 = OpAccessChain %12 %34 
                               f32_4 %37 = OpLoad %36 
                               f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                               f32_2 %39 = OpFMul %33 %38 
                      Uniform f32_4* %40 = OpAccessChain %12 %34 
                               f32_4 %41 = OpLoad %40 
                               f32_2 %42 = OpVectorShuffle %41 %41 2 3 
                               f32_2 %43 = OpFAdd %39 %42 
                               f32_4 %44 = OpLoad %29 
                               f32_4 %45 = OpVectorShuffle %44 %43 4 5 2 3 
                                             OpStore %29 %45 
                               f32_4 %48 = OpLoad %9 
                               f32_2 %49 = OpVectorShuffle %48 %48 0 0 
                               f32_2 %50 = OpFNegate %49 
                               f32_4 %51 = OpLoad %29 
                               f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                               f32_2 %53 = OpFAdd %50 %52 
                                             OpStore %47 %53 
                 read_only Texture2D %58 = OpLoad %57 
                             sampler %62 = OpLoad %61 
          read_only Texture2DSampled %64 = OpSampledImage %58 %62 
                               f32_2 %65 = OpLoad %47 
                               f32_4 %66 = OpImageSampleImplicitLod %64 %65 
                                             OpStore %54 %66 
                               f32_4 %67 = OpLoad %9 
                               f32_2 %68 = OpVectorShuffle %67 %67 0 0 
                               f32_2 %69 = OpFNegate %68 
                               f32_4 %70 = OpLoad %9 
                               f32_4 %71 = OpVectorShuffle %70 %69 0 4 5 3 
                                             OpStore %9 %71 
                               f32_4 %73 = OpLoad %9 
                               f32_4 %74 = OpVectorShuffle %73 %73 1 0 0 0 
                               f32_4 %75 = OpLoad %29 
                               f32_4 %76 = OpVectorShuffle %75 %75 0 1 0 1 
                               f32_4 %77 = OpFAdd %74 %76 
                                             OpStore %72 %77 
                 read_only Texture2D %79 = OpLoad %57 
                             sampler %80 = OpLoad %61 
          read_only Texture2DSampled %81 = OpSampledImage %79 %80 
                               f32_4 %82 = OpLoad %72 
                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                               f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                             OpStore %78 %84 
                 read_only Texture2D %85 = OpLoad %57 
                             sampler %86 = OpLoad %61 
          read_only Texture2DSampled %87 = OpSampledImage %85 %86 
                               f32_4 %88 = OpLoad %72 
                               f32_2 %89 = OpVectorShuffle %88 %88 2 3 
                               f32_4 %90 = OpImageSampleImplicitLod %87 %89 
                                             OpStore %72 %90 
                               f32_4 %92 = OpLoad %54 
                               f32_4 %93 = OpFNegate %92 
                               f32_4 %94 = OpLoad %78 
                               f32_4 %95 = OpFAdd %93 %94 
                                             OpStore %91 %95 
                        Private f32* %98 = OpAccessChain %9 %97 
                                             OpStore %98 %96 
                              f32_4 %100 = OpLoad %9 
                              f32_4 %101 = OpVectorShuffle %100 %100 2 3 3 0 
                              f32_4 %102 = OpLoad %29 
                              f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                              f32_4 %104 = OpFAdd %101 %103 
                                             OpStore %99 %104 
                              f32_4 %106 = OpLoad %9 
                              f32_4 %107 = OpVectorShuffle %106 %106 0 3 0 2 
                              f32_4 %108 = OpLoad %29 
                              f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
                              f32_4 %110 = OpFAdd %107 %109 
                                             OpStore %105 %110 
                              f32_4 %111 = OpLoad %9 
                              f32_2 %112 = OpVectorShuffle %111 %111 3 0 
                              f32_2 %115 = OpFMul %112 %114 
                              f32_4 %116 = OpLoad %29 
                              f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                              f32_2 %118 = OpFAdd %115 %117 
                              f32_4 %119 = OpLoad %9 
                              f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                             OpStore %9 %120 
                read_only Texture2D %121 = OpLoad %57 
                            sampler %122 = OpLoad %61 
         read_only Texture2DSampled %123 = OpSampledImage %121 %122 
                              f32_4 %124 = OpLoad %9 
                              f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                              f32_4 %126 = OpImageSampleImplicitLod %123 %125 
                                             OpStore %9 %126 
                read_only Texture2D %127 = OpLoad %57 
                            sampler %128 = OpLoad %61 
         read_only Texture2DSampled %129 = OpSampledImage %127 %128 
                              f32_4 %130 = OpLoad %99 
                              f32_2 %131 = OpVectorShuffle %130 %130 2 3 
                              f32_4 %132 = OpImageSampleImplicitLod %129 %131 
                                             OpStore %29 %132 
                read_only Texture2D %133 = OpLoad %57 
                            sampler %134 = OpLoad %61 
         read_only Texture2DSampled %135 = OpSampledImage %133 %134 
                              f32_4 %136 = OpLoad %99 
                              f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                              f32_4 %138 = OpImageSampleImplicitLod %135 %137 
                                             OpStore %99 %138 
                              f32_4 %139 = OpLoad %99 
                              f32_4 %142 = OpFMul %139 %141 
                              f32_4 %143 = OpLoad %78 
                              f32_4 %144 = OpFAdd %142 %143 
                                             OpStore %78 %144 
                              f32_4 %145 = OpLoad %54 
                              f32_4 %146 = OpLoad %78 
                              f32_4 %147 = OpFAdd %145 %146 
                                             OpStore %54 %147 
                              f32_4 %148 = OpLoad %72 
                              f32_4 %149 = OpFNegate %148 
                              f32_4 %150 = OpLoad %54 
                              f32_4 %151 = OpFAdd %149 %150 
                                             OpStore %54 %151 
                              f32_4 %152 = OpLoad %29 
                              f32_4 %153 = OpFMul %152 %141 
                              f32_4 %154 = OpLoad %91 
                              f32_4 %155 = OpFAdd %153 %154 
                                             OpStore %29 %155 
                              f32_4 %156 = OpLoad %9 
                              f32_4 %157 = OpFNegate %156 
                              f32_4 %158 = OpFMul %157 %141 
                              f32_4 %159 = OpLoad %29 
                              f32_4 %160 = OpFAdd %158 %159 
                                             OpStore %9 %160 
                              f32_4 %161 = OpLoad %72 
                              f32_4 %162 = OpLoad %9 
                              f32_4 %163 = OpFAdd %161 %162 
                                             OpStore %9 %163 
                read_only Texture2D %164 = OpLoad %57 
                            sampler %165 = OpLoad %61 
         read_only Texture2DSampled %166 = OpSampledImage %164 %165 
                              f32_4 %167 = OpLoad %105 
                              f32_2 %168 = OpVectorShuffle %167 %167 2 3 
                              f32_4 %169 = OpImageSampleImplicitLod %166 %168 
                                             OpStore %29 %169 
                read_only Texture2D %170 = OpLoad %57 
                            sampler %171 = OpLoad %61 
         read_only Texture2DSampled %172 = OpSampledImage %170 %171 
                              f32_4 %173 = OpLoad %105 
                              f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                              f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                             OpStore %72 %175 
                              f32_4 %176 = OpLoad %72 
                              f32_4 %177 = OpFNegate %176 
                              f32_4 %178 = OpFMul %177 %141 
                              f32_4 %179 = OpLoad %54 
                              f32_4 %180 = OpFAdd %178 %179 
                                             OpStore %54 %180 
                              f32_4 %181 = OpLoad %29 
                              f32_4 %182 = OpFNegate %181 
                              f32_4 %183 = OpLoad %54 
                              f32_4 %184 = OpFAdd %182 %183 
                                             OpStore %54 %184 
                              f32_4 %185 = OpLoad %9 
                              f32_4 %186 = OpLoad %29 
                              f32_4 %187 = OpFNegate %186 
                              f32_4 %188 = OpFAdd %185 %187 
                                             OpStore %9 %188 
                              f32_4 %189 = OpLoad %9 
                              f32_4 %190 = OpLoad %9 
                              f32_4 %191 = OpFMul %189 %190 
                                             OpStore %9 %191 
                              f32_4 %192 = OpLoad %54 
                              f32_4 %193 = OpLoad %54 
                              f32_4 %194 = OpFMul %192 %193 
                              f32_4 %195 = OpLoad %9 
                              f32_4 %196 = OpFAdd %194 %195 
                                             OpStore %9 %196 
                              f32_4 %199 = OpLoad %9 
                              f32_4 %200 = OpExtInst %1 31 %199 
                                             OpStore %198 %200 
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