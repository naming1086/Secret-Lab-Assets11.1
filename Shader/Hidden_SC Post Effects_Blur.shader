//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Blur" {
Properties {
}
SubShader {
 Pass {
  Name "Blur Blend"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33446
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _BlurredTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = texture(_BlurredTex, vs_TEXCOORD1.xy);
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
; Bound: 26
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %9 %22 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %9 Location 9 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Output %7 
                        Output f32_4* %9 = OpVariable Output 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
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
 Pass {
  Name "Blur Depth Fade"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 123891
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FadeParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BlurredTex;
UNITY_LOCATION(2) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat3.x = u_xlat1.x * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3.x + _ZBufferParams.y;
    u_xlat3.x = (-unity_OrthoParams.w) * u_xlat3.x + 1.0;
    u_xlat0 = u_xlat3.x / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat3.x = (-u_xlat0) + 1.0;
    u_xlat3.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
    u_xlat3.x = (-u_xlat3.x) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat3.x = (-u_xlat0) + u_xlat3.x;
    u_xlat0 = unity_OrthoParams.w * u_xlat3.x + u_xlat0;
    u_xlat0 = (-u_xlat0) + _FadeParams.y;
    u_xlat3.x = (-_FadeParams.x) + _FadeParams.y;
    u_xlat0 = u_xlat0 / u_xlat3.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_BlurredTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    SV_Target0.w = u_xlat1.w;
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat3.xyz + u_xlat2.xyz;
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
; Bound: 177
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %38 %162 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate vs_TEXCOORD1 Location 38 
                                                      OpDecorate %139 DescriptorSet 139 
                                                      OpDecorate %139 Binding 139 
                                                      OpDecorate %141 DescriptorSet 141 
                                                      OpDecorate %141 Binding 141 
                                                      OpDecorate %146 DescriptorSet 146 
                                                      OpDecorate %146 Binding 146 
                                                      OpDecorate %148 DescriptorSet 148 
                                                      OpDecorate %148 Binding 148 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %9 %9 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 1 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 3 
                                              %17 = OpTypePointer Uniform %6 
                                          f32 %21 = OpConstant 3.674022E-40 
                                              %23 = OpTypeVector %6 3 
                                              %24 = OpTypePointer Private %23 
                               Private f32_3* %25 = OpVariable Private 
                                              %26 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %27 = OpTypePointer UniformConstant %26 
         UniformConstant read_only Texture2D* %28 = OpVariable UniformConstant 
                                              %30 = OpTypeSampler 
                                              %31 = OpTypePointer UniformConstant %30 
                     UniformConstant sampler* %32 = OpVariable UniformConstant 
                                              %34 = OpTypeSampledImage %26 
                                              %36 = OpTypeVector %6 2 
                                              %37 = OpTypePointer Input %36 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                          u32 %41 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          u32 %55 = OpConstant 1 
                                          i32 %72 = OpConstant 0 
                                          u32 %73 = OpConstant 2 
                                         i32 %119 = OpConstant 3 
                                         f32 %135 = OpConstant 3.674022E-40 
                                             %137 = OpTypePointer Private %9 
                              Private f32_4* %138 = OpVariable Private 
        UniformConstant read_only Texture2D* %139 = OpVariable UniformConstant 
                    UniformConstant sampler* %141 = OpVariable UniformConstant 
        UniformConstant read_only Texture2D* %146 = OpVariable UniformConstant 
                    UniformConstant sampler* %148 = OpVariable UniformConstant 
                                             %161 = OpTypePointer Output %9 
                               Output f32_4* %162 = OpVariable Output 
                                             %165 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                          f32 %20 = OpFNegate %19 
                                          f32 %22 = OpFAdd %20 %21 
                                                      OpStore %8 %22 
                          read_only Texture2D %29 = OpLoad %28 
                                      sampler %33 = OpLoad %32 
                   read_only Texture2DSampled %35 = OpSampledImage %29 %33 
                                        f32_2 %39 = OpLoad vs_TEXCOORD1 
                                        f32_4 %40 = OpImageSampleImplicitLod %35 %39 
                                          f32 %42 = OpCompositeExtract %40 0 
                                 Private f32* %43 = OpAccessChain %25 %41 
                                                      OpStore %43 %42 
                                 Private f32* %44 = OpAccessChain %25 %41 
                                          f32 %45 = OpLoad %44 
                                 Uniform f32* %47 = OpAccessChain %12 %46 %41 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFMul %45 %48 
                                 Private f32* %50 = OpAccessChain %25 %41 
                                                      OpStore %50 %49 
                                          f32 %51 = OpLoad %8 
                                 Private f32* %52 = OpAccessChain %25 %41 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFMul %51 %53 
                                 Uniform f32* %56 = OpAccessChain %12 %46 %55 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFAdd %54 %57 
                                                      OpStore %8 %58 
                                 Uniform f32* %59 = OpAccessChain %12 %14 %16 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                 Private f32* %62 = OpAccessChain %25 %41 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %61 %63 
                                          f32 %65 = OpFAdd %64 %21 
                                 Private f32* %66 = OpAccessChain %25 %41 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %25 %41 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpLoad %8 
                                          f32 %70 = OpFDiv %68 %69 
                                                      OpStore %8 %70 
                                          f32 %71 = OpLoad %8 
                                 Uniform f32* %74 = OpAccessChain %12 %72 %73 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFMul %71 %75 
                                 Uniform f32* %77 = OpAccessChain %12 %72 %55 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFNegate %78 
                                          f32 %80 = OpFAdd %76 %79 
                                                      OpStore %8 %80 
                                          f32 %81 = OpLoad %8 
                                          f32 %82 = OpFNegate %81 
                                          f32 %83 = OpFAdd %82 %21 
                                 Private f32* %84 = OpAccessChain %25 %41 
                                                      OpStore %84 %83 
                                 Uniform f32* %85 = OpAccessChain %12 %46 %73 
                                          f32 %86 = OpLoad %85 
                                 Private f32* %87 = OpAccessChain %25 %41 
                                          f32 %88 = OpLoad %87 
                                          f32 %89 = OpFMul %86 %88 
                                 Uniform f32* %90 = OpAccessChain %12 %46 %16 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %89 %91 
                                 Private f32* %93 = OpAccessChain %25 %41 
                                                      OpStore %93 %92 
                                 Private f32* %94 = OpAccessChain %25 %41 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFNegate %95 
                                 Uniform f32* %97 = OpAccessChain %12 %72 %16 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFMul %96 %98 
                                Uniform f32* %100 = OpAccessChain %12 %72 %73 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %99 %101 
                                Private f32* %103 = OpAccessChain %25 %41 
                                                      OpStore %103 %102 
                                         f32 %104 = OpLoad %8 
                                         f32 %105 = OpFNegate %104 
                                Private f32* %106 = OpAccessChain %25 %41 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFAdd %105 %107 
                                Private f32* %109 = OpAccessChain %25 %41 
                                                      OpStore %109 %108 
                                Uniform f32* %110 = OpAccessChain %12 %14 %16 
                                         f32 %111 = OpLoad %110 
                                Private f32* %112 = OpAccessChain %25 %41 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %111 %113 
                                         f32 %115 = OpLoad %8 
                                         f32 %116 = OpFAdd %114 %115 
                                                      OpStore %8 %116 
                                         f32 %117 = OpLoad %8 
                                         f32 %118 = OpFNegate %117 
                                Uniform f32* %120 = OpAccessChain %12 %119 %55 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFAdd %118 %121 
                                                      OpStore %8 %122 
                                Uniform f32* %123 = OpAccessChain %12 %119 %41 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFNegate %124 
                                Uniform f32* %126 = OpAccessChain %12 %119 %55 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFAdd %125 %127 
                                Private f32* %129 = OpAccessChain %25 %41 
                                                      OpStore %129 %128 
                                         f32 %130 = OpLoad %8 
                                Private f32* %131 = OpAccessChain %25 %41 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFDiv %130 %132 
                                                      OpStore %8 %133 
                                         f32 %134 = OpLoad %8 
                                         f32 %136 = OpExtInst %1 43 %134 %135 %21 
                                                      OpStore %8 %136 
                         read_only Texture2D %140 = OpLoad %139 
                                     sampler %142 = OpLoad %141 
                  read_only Texture2DSampled %143 = OpSampledImage %140 %142 
                                       f32_2 %144 = OpLoad vs_TEXCOORD1 
                                       f32_4 %145 = OpImageSampleImplicitLod %143 %144 
                                                      OpStore %138 %145 
                         read_only Texture2D %147 = OpLoad %146 
                                     sampler %149 = OpLoad %148 
                  read_only Texture2DSampled %150 = OpSampledImage %147 %149 
                                       f32_2 %151 = OpLoad vs_TEXCOORD1 
                                       f32_4 %152 = OpImageSampleImplicitLod %150 %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %25 %153 
                                       f32_3 %154 = OpLoad %25 
                                       f32_3 %155 = OpFNegate %154 
                                       f32_4 %156 = OpLoad %138 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFAdd %155 %157 
                                       f32_4 %159 = OpLoad %138 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %138 %160 
                                Private f32* %163 = OpAccessChain %138 %16 
                                         f32 %164 = OpLoad %163 
                                 Output f32* %166 = OpAccessChain %162 %16 
                                                      OpStore %166 %164 
                                         f32 %167 = OpLoad %8 
                                       f32_3 %168 = OpCompositeConstruct %167 %167 %167 
                                       f32_4 %169 = OpLoad %138 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_3 %172 = OpLoad %25 
                                       f32_3 %173 = OpFAdd %171 %172 
                                       f32_4 %174 = OpLoad %162 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %162 %175 
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
 Pass {
  Name "Gaussian Blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 147163
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
uniform 	vec4 _BlurOffsets;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_TEXCOORD1 = _BlurOffsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + u_xlat0.xyxy;
    vs_TEXCOORD2 = _BlurOffsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + u_xlat0.xyxy;
    vs_TEXCOORD3 = _BlurOffsets.xyxy * vec4(6.0, 6.0, -6.0, -6.0) + u_xlat0.xyxy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.zw);
    u_xlat0 = u_xlat1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.zw);
    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.zw);
    SV_Target0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 96
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %54 %56 %68 %79 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpMemberDecorate %45 0 Offset 45 
                                             OpMemberDecorate %45 1 Offset 45 
                                             OpDecorate %45 Block 
                                             OpDecorate %47 DescriptorSet 47 
                                             OpDecorate %47 Binding 47 
                                             OpDecorate vs_TEXCOORD0 Location 54 
                                             OpDecorate vs_TEXCOORD1 Location 56 
                                             OpDecorate vs_TEXCOORD2 Location 68 
                                             OpDecorate vs_TEXCOORD3 Location 79 
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
                                     %45 = OpTypeStruct %6 %7 
                                     %46 = OpTypePointer Uniform %45 
       Uniform struct {f32; f32_4;}* %47 = OpVariable Uniform 
                                     %48 = OpTypePointer Uniform %6 
                                     %53 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
              Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                 i32 %57 = OpConstant 1 
                                     %58 = OpTypePointer Uniform %7 
                                 f32 %62 = OpConstant 3.674022E-40 
                               f32_4 %63 = OpConstantComposite %27 %27 %62 %62 
              Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                 f32 %72 = OpConstant 3.674022E-40 
                                 f32 %73 = OpConstant 3.674022E-40 
                               f32_4 %74 = OpConstantComposite %72 %72 %73 %73 
              Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                 f32 %83 = OpConstant 3.674022E-40 
                                 f32 %84 = OpConstant 3.674022E-40 
                               f32_4 %85 = OpConstantComposite %83 %83 %84 %84 
                                     %90 = OpTypePointer Output %6 
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
                               f32_2 %44 = OpLoad %33 
                        Uniform f32* %49 = OpAccessChain %47 %15 
                                 f32 %50 = OpLoad %49 
                               f32_2 %51 = OpCompositeConstruct %50 %50 
                               f32_2 %52 = OpFMul %44 %51 
                                             OpStore %33 %52 
                               f32_2 %55 = OpLoad %33 
                                             OpStore vs_TEXCOORD0 %55 
                      Uniform f32_4* %59 = OpAccessChain %47 %57 
                               f32_4 %60 = OpLoad %59 
                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
                               f32_4 %64 = OpFMul %61 %63 
                               f32_2 %65 = OpLoad %33 
                               f32_4 %66 = OpVectorShuffle %65 %65 0 1 0 1 
                               f32_4 %67 = OpFAdd %64 %66 
                                             OpStore vs_TEXCOORD1 %67 
                      Uniform f32_4* %69 = OpAccessChain %47 %57 
                               f32_4 %70 = OpLoad %69 
                               f32_4 %71 = OpVectorShuffle %70 %70 0 1 0 1 
                               f32_4 %75 = OpFMul %71 %74 
                               f32_2 %76 = OpLoad %33 
                               f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               f32_4 %78 = OpFAdd %75 %77 
                                             OpStore vs_TEXCOORD2 %78 
                      Uniform f32_4* %80 = OpAccessChain %47 %57 
                               f32_4 %81 = OpLoad %80 
                               f32_4 %82 = OpVectorShuffle %81 %81 0 1 0 1 
                               f32_4 %86 = OpFMul %82 %85 
                               f32_2 %87 = OpLoad %33 
                               f32_4 %88 = OpVectorShuffle %87 %87 0 1 0 1 
                               f32_4 %89 = OpFAdd %86 %88 
                                             OpStore vs_TEXCOORD3 %89 
                         Output f32* %91 = OpAccessChain %13 %15 %9 
                                 f32 %92 = OpLoad %91 
                                 f32 %93 = OpFNegate %92 
                         Output f32* %94 = OpAccessChain %13 %15 %9 
                                             OpStore %94 %93 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %35 %57 %80 %97 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 21 
                                             OpDecorate vs_TEXCOORD0 Location 35 
                                             OpDecorate vs_TEXCOORD2 Location 57 
                                             OpDecorate vs_TEXCOORD3 Location 80 
                                             OpDecorate %97 Location 97 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %22 = OpTypeVector %6 2 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_4 %28 = OpConstantComposite %27 %27 %27 %27 
                      Private f32_4* %30 = OpVariable Private 
                                     %34 = OpTypePointer Input %22 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %39 = OpConstant 3.674022E-40 
                               f32_4 %40 = OpConstantComposite %39 %39 %39 %39 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %62 = OpConstant 3.674022E-40 
                               f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
               Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                 f32 %85 = OpConstant 3.674022E-40 
                               f32_4 %86 = OpConstantComposite %85 %85 %85 %85 
                                     %96 = OpTypePointer Output %7 
                       Output f32_4* %97 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpLoad vs_TEXCOORD1 
                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                             OpStore %9 %25 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpFMul %26 %28 
                                             OpStore %9 %29 
                 read_only Texture2D %31 = OpLoad %12 
                             sampler %32 = OpLoad %16 
          read_only Texture2DSampled %33 = OpSampledImage %31 %32 
                               f32_2 %36 = OpLoad vs_TEXCOORD0 
                               f32_4 %37 = OpImageSampleImplicitLod %33 %36 
                                             OpStore %30 %37 
                               f32_4 %38 = OpLoad %30 
                               f32_4 %41 = OpFMul %38 %40 
                               f32_4 %42 = OpLoad %9 
                               f32_4 %43 = OpFAdd %41 %42 
                                             OpStore %9 %43 
                 read_only Texture2D %44 = OpLoad %12 
                             sampler %45 = OpLoad %16 
          read_only Texture2DSampled %46 = OpSampledImage %44 %45 
                               f32_4 %47 = OpLoad vs_TEXCOORD1 
                               f32_2 %48 = OpVectorShuffle %47 %47 2 3 
                               f32_4 %49 = OpImageSampleImplicitLod %46 %48 
                                             OpStore %30 %49 
                               f32_4 %50 = OpLoad %30 
                               f32_4 %51 = OpFMul %50 %28 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpFAdd %51 %52 
                                             OpStore %9 %53 
                 read_only Texture2D %54 = OpLoad %12 
                             sampler %55 = OpLoad %16 
          read_only Texture2DSampled %56 = OpSampledImage %54 %55 
                               f32_4 %58 = OpLoad vs_TEXCOORD2 
                               f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                               f32_4 %60 = OpImageSampleImplicitLod %56 %59 
                                             OpStore %30 %60 
                               f32_4 %61 = OpLoad %30 
                               f32_4 %64 = OpFMul %61 %63 
                               f32_4 %65 = OpLoad %9 
                               f32_4 %66 = OpFAdd %64 %65 
                                             OpStore %9 %66 
                 read_only Texture2D %67 = OpLoad %12 
                             sampler %68 = OpLoad %16 
          read_only Texture2DSampled %69 = OpSampledImage %67 %68 
                               f32_4 %70 = OpLoad vs_TEXCOORD2 
                               f32_2 %71 = OpVectorShuffle %70 %70 2 3 
                               f32_4 %72 = OpImageSampleImplicitLod %69 %71 
                                             OpStore %30 %72 
                               f32_4 %73 = OpLoad %30 
                               f32_4 %74 = OpFMul %73 %63 
                               f32_4 %75 = OpLoad %9 
                               f32_4 %76 = OpFAdd %74 %75 
                                             OpStore %9 %76 
                 read_only Texture2D %77 = OpLoad %12 
                             sampler %78 = OpLoad %16 
          read_only Texture2DSampled %79 = OpSampledImage %77 %78 
                               f32_4 %81 = OpLoad vs_TEXCOORD3 
                               f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                               f32_4 %83 = OpImageSampleImplicitLod %79 %82 
                                             OpStore %30 %83 
                               f32_4 %84 = OpLoad %30 
                               f32_4 %87 = OpFMul %84 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_4 %89 = OpFAdd %87 %88 
                                             OpStore %9 %89 
                 read_only Texture2D %90 = OpLoad %12 
                             sampler %91 = OpLoad %16 
          read_only Texture2DSampled %92 = OpSampledImage %90 %91 
                               f32_4 %93 = OpLoad vs_TEXCOORD3 
                               f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                               f32_4 %95 = OpImageSampleImplicitLod %92 %94 
                                             OpStore %30 %95 
                               f32_4 %98 = OpLoad %30 
                               f32_4 %99 = OpFMul %98 %86 
                              f32_4 %100 = OpLoad %9 
                              f32_4 %101 = OpFAdd %99 %100 
                                             OpStore %97 %101 
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
 Pass {
  Name "Box Blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 246844
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
uniform 	vec4 _BlurOffsets;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _BlurOffsets.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1 = _BlurOffsets.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
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
; Bound: 86
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %25 %80 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %80 Location 80 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 
                                     %11 = OpTypePointer Uniform %10 
            Uniform struct {f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 0 
                                     %15 = OpTypePointer Uniform %7 
                                 f32 %19 = OpConstant 3.674022E-40 
                                 f32 %20 = OpConstant 3.674022E-40 
                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
                                     %23 = OpTypeVector %6 2 
                                     %24 = OpTypePointer Input %23 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                               f32_4 %55 = OpConstantComposite %19 %20 %20 %20 
                      Private f32_4* %60 = OpVariable Private 
                                     %79 = OpTypePointer Output %7 
                       Output f32_4* %80 = OpVariable Output 
                                 f32 %82 = OpConstant 3.674022E-40 
                               f32_4 %83 = OpConstantComposite %82 %82 %82 %82 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %16 = OpAccessChain %12 %14 
                               f32_4 %17 = OpLoad %16 
                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
                               f32_4 %22 = OpFMul %18 %21 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFAdd %22 %27 
                                             OpStore %9 %28 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                                             OpStore %29 %42 
                 read_only Texture2D %43 = OpLoad %32 
                             sampler %44 = OpLoad %36 
          read_only Texture2DSampled %45 = OpSampledImage %43 %44 
                               f32_4 %46 = OpLoad %9 
                               f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                             OpStore %9 %48 
                               f32_4 %49 = OpLoad %9 
                               f32_4 %50 = OpLoad %29 
                               f32_4 %51 = OpFAdd %49 %50 
                                             OpStore %9 %51 
                      Uniform f32_4* %52 = OpAccessChain %12 %14 
                               f32_4 %53 = OpLoad %52 
                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
                               f32_4 %56 = OpFMul %54 %55 
                               f32_2 %57 = OpLoad vs_TEXCOORD0 
                               f32_4 %58 = OpVectorShuffle %57 %57 0 1 0 1 
                               f32_4 %59 = OpFAdd %56 %58 
                                             OpStore %29 %59 
                 read_only Texture2D %61 = OpLoad %32 
                             sampler %62 = OpLoad %36 
          read_only Texture2DSampled %63 = OpSampledImage %61 %62 
                               f32_4 %64 = OpLoad %29 
                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                               f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                                             OpStore %60 %66 
                 read_only Texture2D %67 = OpLoad %32 
                             sampler %68 = OpLoad %36 
          read_only Texture2DSampled %69 = OpSampledImage %67 %68 
                               f32_4 %70 = OpLoad %29 
                               f32_2 %71 = OpVectorShuffle %70 %70 2 3 
                               f32_4 %72 = OpImageSampleImplicitLod %69 %71 
                                             OpStore %29 %72 
                               f32_4 %73 = OpLoad %9 
                               f32_4 %74 = OpLoad %60 
                               f32_4 %75 = OpFAdd %73 %74 
                                             OpStore %9 %75 
                               f32_4 %76 = OpLoad %29 
                               f32_4 %77 = OpLoad %9 
                               f32_4 %78 = OpFAdd %76 %77 
                                             OpStore %9 %78 
                               f32_4 %81 = OpLoad %9 
                               f32_4 %84 = OpFMul %81 %83 
                                             OpStore %80 %84 
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