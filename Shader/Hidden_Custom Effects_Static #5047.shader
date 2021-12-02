//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/Static" {
Properties {
}
SubShader {
 Pass {
  Name "Static"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 46121
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _Time;
uniform 	float _Fade;
uniform 	float _FadeAdditive;
uniform 	float _FadeDistortion;
UNITY_LOCATION(0) uniform  sampler2D _StaticTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat6.xy = _Time.yy * vec2(10.0, 0.5) + vs_TEXCOORD0.xy;
    u_xlat1 = texture(_StaticTex, u_xlat6.xy);
    u_xlat6.x = u_xlat1.x * _FadeDistortion;
    u_xlat0.x = u_xlat6.x * 0.03125 + vs_TEXCOORD0.x;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_Fade) * u_xlat2 + u_xlat0;
    SV_Target0 = vec4(vec4(_FadeAdditive, _FadeAdditive, _FadeAdditive, _FadeAdditive)) * u_xlat1 + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %12 %89 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 12 
                                                OpMemberDecorate %22 0 Offset 22 
                                                OpMemberDecorate %22 1 Offset 22 
                                                OpMemberDecorate %22 2 Offset 22 
                                                OpMemberDecorate %22 3 Offset 22 
                                                OpDecorate %22 Block 
                                                OpDecorate %24 DescriptorSet 24 
                                                OpDecorate %24 Binding 24 
                                                OpDecorate %40 DescriptorSet 40 
                                                OpDecorate %40 Binding 40 
                                                OpDecorate %44 DescriptorSet 44 
                                                OpDecorate %44 Binding 44 
                                                OpDecorate %67 DescriptorSet 67 
                                                OpDecorate %67 Binding 67 
                                                OpDecorate %69 DescriptorSet 69 
                                                OpDecorate %69 Binding 69 
                                                OpDecorate %89 Location 89 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 2 
                                        %11 = OpTypePointer Input %10 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %13 = OpTypeInt 32 0 
                                    u32 %14 = OpConstant 1 
                                        %15 = OpTypePointer Input %6 
                                        %18 = OpTypePointer Private %6 
                                        %20 = OpTypePointer Private %10 
                         Private f32_2* %21 = OpVariable Private 
                                        %22 = OpTypeStruct %7 %6 %6 %6 
                                        %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32; f32; f32;}* %24 = OpVariable Uniform 
                                        %25 = OpTypeInt 32 1 
                                    i32 %26 = OpConstant 0 
                                        %27 = OpTypePointer Uniform %7 
                                    f32 %31 = OpConstant 3.674022E-40 
                                    f32 %32 = OpConstant 3.674022E-40 
                                  f32_2 %33 = OpConstantComposite %31 %32 
                         Private f32_4* %37 = OpVariable Private 
                                        %38 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %39 = OpTypePointer UniformConstant %38 
   UniformConstant read_only Texture2D* %40 = OpVariable UniformConstant 
                                        %42 = OpTypeSampler 
                                        %43 = OpTypePointer UniformConstant %42 
               UniformConstant sampler* %44 = OpVariable UniformConstant 
                                        %46 = OpTypeSampledImage %38 
                                    u32 %50 = OpConstant 0 
                                    i32 %53 = OpConstant 3 
                                        %54 = OpTypePointer Uniform %6 
                                    f32 %61 = OpConstant 3.674022E-40 
   UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
               UniformConstant sampler* %69 = OpVariable UniformConstant 
                         Private f32_4* %75 = OpVariable Private 
                                    i32 %80 = OpConstant 1 
                                        %88 = OpTypePointer Output %7 
                          Output f32_4* %89 = OpVariable Output 
                                    i32 %90 = OpConstant 2 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                             Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                    f32 %17 = OpLoad %16 
                           Private f32* %19 = OpAccessChain %9 %14 
                                                OpStore %19 %17 
                         Uniform f32_4* %28 = OpAccessChain %24 %26 
                                  f32_4 %29 = OpLoad %28 
                                  f32_2 %30 = OpVectorShuffle %29 %29 1 1 
                                  f32_2 %34 = OpFMul %30 %33 
                                  f32_2 %35 = OpLoad vs_TEXCOORD0 
                                  f32_2 %36 = OpFAdd %34 %35 
                                                OpStore %21 %36 
                    read_only Texture2D %41 = OpLoad %40 
                                sampler %45 = OpLoad %44 
             read_only Texture2DSampled %47 = OpSampledImage %41 %45 
                                  f32_2 %48 = OpLoad %21 
                                  f32_4 %49 = OpImageSampleImplicitLod %47 %48 
                                                OpStore %37 %49 
                           Private f32* %51 = OpAccessChain %37 %50 
                                    f32 %52 = OpLoad %51 
                           Uniform f32* %55 = OpAccessChain %24 %53 
                                    f32 %56 = OpLoad %55 
                                    f32 %57 = OpFMul %52 %56 
                           Private f32* %58 = OpAccessChain %21 %50 
                                                OpStore %58 %57 
                           Private f32* %59 = OpAccessChain %21 %50 
                                    f32 %60 = OpLoad %59 
                                    f32 %62 = OpFMul %60 %61 
                             Input f32* %63 = OpAccessChain vs_TEXCOORD0 %50 
                                    f32 %64 = OpLoad %63 
                                    f32 %65 = OpFAdd %62 %64 
                           Private f32* %66 = OpAccessChain %9 %50 
                                                OpStore %66 %65 
                    read_only Texture2D %68 = OpLoad %67 
                                sampler %70 = OpLoad %69 
             read_only Texture2DSampled %71 = OpSampledImage %68 %70 
                                  f32_4 %72 = OpLoad %9 
                                  f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                  f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                                                OpStore %9 %74 
                                  f32_4 %76 = OpLoad %9 
                                  f32_4 %77 = OpFNegate %76 
                                  f32_4 %78 = OpLoad %37 
                                  f32_4 %79 = OpFAdd %77 %78 
                                                OpStore %75 %79 
                           Uniform f32* %81 = OpAccessChain %24 %80 
                                    f32 %82 = OpLoad %81 
                                  f32_4 %83 = OpCompositeConstruct %82 %82 %82 %82 
                                  f32_4 %84 = OpLoad %75 
                                  f32_4 %85 = OpFMul %83 %84 
                                  f32_4 %86 = OpLoad %9 
                                  f32_4 %87 = OpFAdd %85 %86 
                                                OpStore %9 %87 
                           Uniform f32* %91 = OpAccessChain %24 %90 
                                    f32 %92 = OpLoad %91 
                           Uniform f32* %93 = OpAccessChain %24 %90 
                                    f32 %94 = OpLoad %93 
                           Uniform f32* %95 = OpAccessChain %24 %90 
                                    f32 %96 = OpLoad %95 
                           Uniform f32* %97 = OpAccessChain %24 %90 
                                    f32 %98 = OpLoad %97 
                                  f32_4 %99 = OpCompositeConstruct %92 %94 %96 %98 
                                   f32 %100 = OpCompositeExtract %99 0 
                                   f32 %101 = OpCompositeExtract %99 1 
                                   f32 %102 = OpCompositeExtract %99 2 
                                   f32 %103 = OpCompositeExtract %99 3 
                                 f32_4 %104 = OpCompositeConstruct %100 %101 %102 %103 
                                 f32_4 %105 = OpLoad %37 
                                 f32_4 %106 = OpFMul %104 %105 
                                 f32_4 %107 = OpLoad %9 
                                 f32_4 %108 = OpFAdd %106 %107 
                                                OpStore %89 %108 
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