//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_Horror" {
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
  GpuProgramID 55827
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
uniform 	float Fade;
uniform 	float Distortion;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D Texture2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat12 = u_xlat1.y + u_xlat1.x;
    u_xlat12 = u_xlat1.z + u_xlat12;
    u_xlat12 = u_xlat1.y * u_xlat12;
    u_xlat12 = u_xlat12 * 0.333333343;
    u_xlat12 = u_xlat12 / u_xlat1.z;
    u_xlat12 = u_xlat1.x + u_xlat12;
    u_xlat2.x = sin(_TimeX);
    u_xlat2.x = u_xlat2.x * 12.0;
    u_xlat2.x = floor(u_xlat2.x);
    u_xlat0.z = u_xlat2.x * 0.0625;
    u_xlat2.xy = vec2(vec2(Distortion, Distortion)) * vec2(-0.5, -0.5) + u_xlat0.xz;
    u_xlat3 = texture(Texture2, u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy * vec2(vec2(Distortion, Distortion)) + u_xlat2.xy;
    u_xlat2 = texture(Texture2, u_xlat0.xy);
    u_xlat0 = vec4(u_xlat12) * u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat3 + (-u_xlat1);
    SV_Target0 = vec4(vec4(Fade, Fade, Fade, Fade)) * u_xlat0 + u_xlat1;
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
                                                OpEntryPoint Fragment %4 "main" %12 %154 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 12 
                                                OpMemberDecorate %14 0 Offset 14 
                                                OpMemberDecorate %14 1 Offset 14 
                                                OpMemberDecorate %14 2 Offset 14 
                                                OpMemberDecorate %14 3 Offset 14 
                                                OpDecorate %14 Block 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate %33 DescriptorSet 33 
                                                OpDecorate %33 Binding 33 
                                                OpDecorate %37 DescriptorSet 37 
                                                OpDecorate %37 Binding 37 
                                                OpDecorate %113 DescriptorSet 113 
                                                OpDecorate %113 Binding 113 
                                                OpDecorate %115 DescriptorSet 115 
                                                OpDecorate %115 Binding 115 
                                                OpDecorate %154 Location 154 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 2 
                                        %11 = OpTypePointer Input %10 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %14 = OpTypeStruct %6 %6 %6 %7 
                                        %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                        %17 = OpTypeInt 32 1 
                                    i32 %18 = OpConstant 3 
                                        %19 = OpTypePointer Uniform %7 
                         Private f32_4* %30 = OpVariable Private 
                                        %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %32 = OpTypePointer UniformConstant %31 
   UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                        %35 = OpTypeSampler 
                                        %36 = OpTypePointer UniformConstant %35 
               UniformConstant sampler* %37 = OpVariable UniformConstant 
                                        %39 = OpTypeSampledImage %31 
                                        %44 = OpTypePointer Private %6 
                           Private f32* %45 = OpVariable Private 
                                        %46 = OpTypeInt 32 0 
                                    u32 %47 = OpConstant 1 
                                    u32 %50 = OpConstant 0 
                                    u32 %54 = OpConstant 2 
                                    f32 %64 = OpConstant 3.674022E-40 
                         Private f32_4* %74 = OpVariable Private 
                                    i32 %75 = OpConstant 0 
                                        %76 = OpTypePointer Uniform %6 
                                    f32 %83 = OpConstant 3.674022E-40 
                                    f32 %92 = OpConstant 3.674022E-40 
                                    i32 %95 = OpConstant 2 
                                   f32 %104 = OpConstant 3.674022E-40 
                                 f32_2 %105 = OpConstantComposite %104 %104 
                        Private f32_4* %112 = OpVariable Private 
  UniformConstant read_only Texture2D* %113 = OpVariable UniformConstant 
              UniformConstant sampler* %115 = OpVariable UniformConstant 
                                       %153 = OpTypePointer Output %7 
                         Output f32_4* %154 = OpVariable Output 
                                   i32 %155 = OpConstant 1 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                                  f32_2 %13 = OpLoad vs_TEXCOORD0 
                         Uniform f32_4* %20 = OpAccessChain %16 %18 
                                  f32_4 %21 = OpLoad %20 
                                  f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                  f32_2 %23 = OpFMul %13 %22 
                         Uniform f32_4* %24 = OpAccessChain %16 %18 
                                  f32_4 %25 = OpLoad %24 
                                  f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                  f32_2 %27 = OpFAdd %23 %26 
                                  f32_4 %28 = OpLoad %9 
                                  f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                OpStore %9 %29 
                    read_only Texture2D %34 = OpLoad %33 
                                sampler %38 = OpLoad %37 
             read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                                  f32_4 %41 = OpLoad %9 
                                  f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                  f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                                                OpStore %30 %43 
                           Private f32* %48 = OpAccessChain %30 %47 
                                    f32 %49 = OpLoad %48 
                           Private f32* %51 = OpAccessChain %30 %50 
                                    f32 %52 = OpLoad %51 
                                    f32 %53 = OpFAdd %49 %52 
                                                OpStore %45 %53 
                           Private f32* %55 = OpAccessChain %30 %54 
                                    f32 %56 = OpLoad %55 
                                    f32 %57 = OpLoad %45 
                                    f32 %58 = OpFAdd %56 %57 
                                                OpStore %45 %58 
                           Private f32* %59 = OpAccessChain %30 %47 
                                    f32 %60 = OpLoad %59 
                                    f32 %61 = OpLoad %45 
                                    f32 %62 = OpFMul %60 %61 
                                                OpStore %45 %62 
                                    f32 %63 = OpLoad %45 
                                    f32 %65 = OpFMul %63 %64 
                                                OpStore %45 %65 
                                    f32 %66 = OpLoad %45 
                           Private f32* %67 = OpAccessChain %30 %54 
                                    f32 %68 = OpLoad %67 
                                    f32 %69 = OpFDiv %66 %68 
                                                OpStore %45 %69 
                           Private f32* %70 = OpAccessChain %30 %50 
                                    f32 %71 = OpLoad %70 
                                    f32 %72 = OpLoad %45 
                                    f32 %73 = OpFAdd %71 %72 
                                                OpStore %45 %73 
                           Uniform f32* %77 = OpAccessChain %16 %75 
                                    f32 %78 = OpLoad %77 
                                    f32 %79 = OpExtInst %1 13 %78 
                           Private f32* %80 = OpAccessChain %74 %50 
                                                OpStore %80 %79 
                           Private f32* %81 = OpAccessChain %74 %50 
                                    f32 %82 = OpLoad %81 
                                    f32 %84 = OpFMul %82 %83 
                           Private f32* %85 = OpAccessChain %74 %50 
                                                OpStore %85 %84 
                           Private f32* %86 = OpAccessChain %74 %50 
                                    f32 %87 = OpLoad %86 
                                    f32 %88 = OpExtInst %1 8 %87 
                           Private f32* %89 = OpAccessChain %74 %50 
                                                OpStore %89 %88 
                           Private f32* %90 = OpAccessChain %74 %50 
                                    f32 %91 = OpLoad %90 
                                    f32 %93 = OpFMul %91 %92 
                           Private f32* %94 = OpAccessChain %9 %54 
                                                OpStore %94 %93 
                           Uniform f32* %96 = OpAccessChain %16 %95 
                                    f32 %97 = OpLoad %96 
                           Uniform f32* %98 = OpAccessChain %16 %95 
                                    f32 %99 = OpLoad %98 
                                 f32_2 %100 = OpCompositeConstruct %97 %99 
                                   f32 %101 = OpCompositeExtract %100 0 
                                   f32 %102 = OpCompositeExtract %100 1 
                                 f32_2 %103 = OpCompositeConstruct %101 %102 
                                 f32_2 %106 = OpFMul %103 %105 
                                 f32_4 %107 = OpLoad %9 
                                 f32_2 %108 = OpVectorShuffle %107 %107 0 2 
                                 f32_2 %109 = OpFAdd %106 %108 
                                 f32_4 %110 = OpLoad %74 
                                 f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                OpStore %74 %111 
                   read_only Texture2D %114 = OpLoad %113 
                               sampler %116 = OpLoad %115 
            read_only Texture2DSampled %117 = OpSampledImage %114 %116 
                                 f32_4 %118 = OpLoad %9 
                                 f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                 f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                                OpStore %112 %120 
                                 f32_4 %121 = OpLoad %30 
                                 f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                          Uniform f32* %123 = OpAccessChain %16 %95 
                                   f32 %124 = OpLoad %123 
                          Uniform f32* %125 = OpAccessChain %16 %95 
                                   f32 %126 = OpLoad %125 
                                 f32_2 %127 = OpCompositeConstruct %124 %126 
                                   f32 %128 = OpCompositeExtract %127 0 
                                   f32 %129 = OpCompositeExtract %127 1 
                                 f32_2 %130 = OpCompositeConstruct %128 %129 
                                 f32_2 %131 = OpFMul %122 %130 
                                 f32_4 %132 = OpLoad %74 
                                 f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                 f32_2 %134 = OpFAdd %131 %133 
                                 f32_4 %135 = OpLoad %9 
                                 f32_4 %136 = OpVectorShuffle %135 %134 4 5 2 3 
                                                OpStore %9 %136 
                   read_only Texture2D %137 = OpLoad %113 
                               sampler %138 = OpLoad %115 
            read_only Texture2DSampled %139 = OpSampledImage %137 %138 
                                 f32_4 %140 = OpLoad %9 
                                 f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                 f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                OpStore %74 %142 
                                   f32 %143 = OpLoad %45 
                                 f32_4 %144 = OpCompositeConstruct %143 %143 %143 %143 
                                 f32_4 %145 = OpLoad %74 
                                 f32_4 %146 = OpFMul %144 %145 
                                                OpStore %9 %146 
                                 f32_4 %147 = OpLoad %9 
                                 f32_4 %148 = OpLoad %112 
                                 f32_4 %149 = OpFMul %147 %148 
                                 f32_4 %150 = OpLoad %30 
                                 f32_4 %151 = OpFNegate %150 
                                 f32_4 %152 = OpFAdd %149 %151 
                                                OpStore %9 %152 
                          Uniform f32* %156 = OpAccessChain %16 %155 
                                   f32 %157 = OpLoad %156 
                          Uniform f32* %158 = OpAccessChain %16 %155 
                                   f32 %159 = OpLoad %158 
                          Uniform f32* %160 = OpAccessChain %16 %155 
                                   f32 %161 = OpLoad %160 
                          Uniform f32* %162 = OpAccessChain %16 %155 
                                   f32 %163 = OpLoad %162 
                                 f32_4 %164 = OpCompositeConstruct %157 %159 %161 %163 
                                   f32 %165 = OpCompositeExtract %164 0 
                                   f32 %166 = OpCompositeExtract %164 1 
                                   f32 %167 = OpCompositeExtract %164 2 
                                   f32 %168 = OpCompositeExtract %164 3 
                                 f32_4 %169 = OpCompositeConstruct %165 %166 %167 %168 
                                 f32_4 %170 = OpLoad %9 
                                 f32_4 %171 = OpFMul %169 %170 
                                 f32_4 %172 = OpLoad %30 
                                 f32_4 %173 = OpFAdd %171 %172 
                                                OpStore %154 %173 
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