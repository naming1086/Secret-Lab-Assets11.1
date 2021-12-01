//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Double Vision" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 36634
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
uniform 	float _Amount;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1.x = _Amount;
    u_xlat1.y = 0.0;
    u_xlat7.xy = (-u_xlat1.xy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat7.xy);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat0 = u_xlat2 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343);
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
; Bound: 80
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %74 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %56 DescriptorSet 56 
                                             OpDecorate %56 Binding 56 
                                             OpDecorate %74 Location 74 
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
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %26 = OpTypeStruct %6 
                                     %27 = OpTypePointer Uniform %26 
              Uniform struct {f32;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %6 
                                     %34 = OpTypeInt 32 0 
                                 u32 %35 = OpConstant 0 
                                     %36 = OpTypePointer Private %6 
                                 f32 %38 = OpConstant 3.674022E-40 
                                 u32 %39 = OpConstant 1 
                                     %41 = OpTypePointer Private %20 
                      Private f32_2* %42 = OpVariable Private 
                      Private f32_4* %54 = OpVariable Private 
            UniformConstant sampler* %56 = OpVariable UniformConstant 
                                     %73 = OpTypePointer Output %7 
                       Output f32_4* %74 = OpVariable Output 
                                 f32 %76 = OpConstant 3.674022E-40 
                               f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Uniform f32* %32 = OpAccessChain %28 %30 
                                 f32 %33 = OpLoad %32 
                        Private f32* %37 = OpAccessChain %25 %35 
                                             OpStore %37 %33 
                        Private f32* %40 = OpAccessChain %25 %39 
                                             OpStore %40 %38 
                               f32_4 %43 = OpLoad %25 
                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                               f32_2 %45 = OpFNegate %44 
                               f32_2 %46 = OpLoad vs_TEXCOORD1 
                               f32_2 %47 = OpFAdd %45 %46 
                                             OpStore %42 %47 
                               f32_4 %48 = OpLoad %25 
                               f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                               f32_2 %50 = OpLoad vs_TEXCOORD1 
                               f32_2 %51 = OpFAdd %49 %50 
                               f32_4 %52 = OpLoad %25 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %25 %53 
                 read_only Texture2D %55 = OpLoad %12 
                             sampler %57 = OpLoad %56 
          read_only Texture2DSampled %58 = OpSampledImage %55 %57 
                               f32_4 %59 = OpLoad %25 
                               f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                               f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                             OpStore %54 %61 
                 read_only Texture2D %62 = OpLoad %12 
                             sampler %63 = OpLoad %56 
          read_only Texture2DSampled %64 = OpSampledImage %62 %63 
                               f32_2 %65 = OpLoad %42 
                               f32_4 %66 = OpImageSampleImplicitLod %64 %65 
                                             OpStore %25 %66 
                               f32_4 %67 = OpLoad %9 
                               f32_4 %68 = OpLoad %25 
                               f32_4 %69 = OpFAdd %67 %68 
                                             OpStore %9 %69 
                               f32_4 %70 = OpLoad %54 
                               f32_4 %71 = OpLoad %9 
                               f32_4 %72 = OpFAdd %70 %71 
                                             OpStore %9 %72 
                               f32_4 %75 = OpLoad %9 
                               f32_4 %78 = OpFMul %75 %77 
                                             OpStore %74 %78 
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 67615
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
uniform 	float _Amount;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlat0 * vec4(_Amount);
    u_xlat0 = u_xlat0 * vec4(-0.333333343, -0.333333343, -0.666666687, -0.666666687) + vs_TEXCOORD1.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(0.333333343, 0.333333343, 0.333333343, 0.333333343);
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
; Bound: 93
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %51 %87 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate vs_TEXCOORD1 Location 51 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpDecorate %61 DescriptorSet 61 
                                             OpDecorate %61 Binding 61 
                                             OpDecorate %87 Location 87 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_4 %16 = OpConstantComposite %15 %15 %15 %15 
                                 f32 %18 = OpConstant 3.674022E-40 
                               f32_4 %19 = OpConstantComposite %18 %18 %18 %18 
                      Private f32_4* %21 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                               f32_4 %49 = OpConstantComposite %47 %47 %48 %48 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %56 = OpTypePointer UniformConstant %55 
UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
                                     %59 = OpTypeSampler 
                                     %60 = OpTypePointer UniformConstant %59 
            UniformConstant sampler* %61 = OpVariable UniformConstant 
                                     %63 = OpTypeSampledImage %55 
                      Private f32_4* %74 = OpVariable Private 
                                     %86 = OpTypePointer Output %7 
                       Output f32_4* %87 = OpVariable Output 
                                 f32 %89 = OpConstant 3.674022E-40 
                               f32_4 %90 = OpConstantComposite %89 %89 %89 %89 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                               f32_4 %17 = OpFMul %14 %16 
                               f32_4 %20 = OpFAdd %17 %19 
                                             OpStore %9 %20 
                               f32_4 %22 = OpLoad %9 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_4 %24 = OpLoad %9 
                               f32_2 %25 = OpVectorShuffle %24 %24 2 3 
                                 f32 %26 = OpDot %23 %25 
                        Private f32* %30 = OpAccessChain %21 %28 
                                             OpStore %30 %26 
                               f32_4 %31 = OpLoad %9 
                               f32_4 %32 = OpLoad %21 
                               f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                               f32_4 %34 = OpFMul %31 %33 
                                             OpStore %9 %34 
                               f32_4 %35 = OpLoad %9 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                               f32_4 %44 = OpCompositeConstruct %43 %43 %43 %43 
                               f32_4 %45 = OpFMul %35 %44 
                                             OpStore %9 %45 
                               f32_4 %46 = OpLoad %9 
                               f32_4 %50 = OpFMul %46 %49 
                               f32_2 %52 = OpLoad vs_TEXCOORD1 
                               f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
                               f32_4 %54 = OpFAdd %50 %53 
                                             OpStore %9 %54 
                 read_only Texture2D %58 = OpLoad %57 
                             sampler %62 = OpLoad %61 
          read_only Texture2DSampled %64 = OpSampledImage %58 %62 
                               f32_4 %65 = OpLoad %9 
                               f32_2 %66 = OpVectorShuffle %65 %65 0 1 
                               f32_4 %67 = OpImageSampleImplicitLod %64 %66 
                                             OpStore %21 %67 
                 read_only Texture2D %68 = OpLoad %57 
                             sampler %69 = OpLoad %61 
          read_only Texture2DSampled %70 = OpSampledImage %68 %69 
                               f32_4 %71 = OpLoad %9 
                               f32_2 %72 = OpVectorShuffle %71 %71 2 3 
                               f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                             OpStore %9 %73 
                 read_only Texture2D %75 = OpLoad %57 
                             sampler %76 = OpLoad %61 
          read_only Texture2DSampled %77 = OpSampledImage %75 %76 
                               f32_2 %78 = OpLoad vs_TEXCOORD1 
                               f32_4 %79 = OpImageSampleImplicitLod %77 %78 
                                             OpStore %74 %79 
                               f32_4 %80 = OpLoad %21 
                               f32_4 %81 = OpLoad %74 
                               f32_4 %82 = OpFAdd %80 %81 
                                             OpStore %21 %82 
                               f32_4 %83 = OpLoad %9 
                               f32_4 %84 = OpLoad %21 
                               f32_4 %85 = OpFAdd %83 %84 
                                             OpStore %9 %85 
                               f32_4 %88 = OpLoad %9 
                               f32_4 %91 = OpFMul %88 %90 
                                             OpStore %87 %91 
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