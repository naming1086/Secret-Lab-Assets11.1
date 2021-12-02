//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Pixelize" {
Properties {
}
SubShader {
 Pass {
  Name "Pixelize"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58450
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
uniform 	vec4 _ScreenParams;
uniform 	float _Resolution;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = _ScreenParams.y / _ScreenParams.x;
    u_xlat2.xy = vs_TEXCOORD1.xy / vec2(_Resolution);
    u_xlat2.x = u_xlat2.x / u_xlat0;
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat2.xy = trunc(u_xlat2.xy);
    u_xlat1.y = u_xlat2.y * _Resolution;
    u_xlat2.x = u_xlat2.x * _Resolution;
    u_xlat1.x = u_xlat0 * u_xlat2.x;
    SV_Target0 = texture(_MainTex, u_xlat1.xy);
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
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %28 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD1 Location 28 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %68 DescriptorSet 68 
                                             OpDecorate %68 Binding 68 
                                             OpDecorate %72 DescriptorSet 72 
                                             OpDecorate %72 Binding 72 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeVector %6 4 
                                     %10 = OpTypeStruct %9 %6 
                                     %11 = OpTypePointer Uniform %10 
       Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 0 
                                     %15 = OpTypeInt 32 0 
                                 u32 %16 = OpConstant 1 
                                     %17 = OpTypePointer Uniform %6 
                                 u32 %20 = OpConstant 0 
                                     %24 = OpTypeVector %6 2 
                                     %25 = OpTypePointer Private %24 
                      Private f32_2* %26 = OpVariable Private 
                                     %27 = OpTypePointer Input %24 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                 i32 %30 = OpConstant 1 
                                 f32 %41 = OpConstant 3.674022E-40 
                               f32_2 %42 = OpConstantComposite %41 %41 
                      Private f32_2* %46 = OpVariable Private 
                                     %64 = OpTypePointer Output %9 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %67 = OpTypePointer UniformConstant %66 
UniformConstant read_only Texture2D* %68 = OpVariable UniformConstant 
                                     %70 = OpTypeSampler 
                                     %71 = OpTypePointer UniformConstant %70 
            UniformConstant sampler* %72 = OpVariable UniformConstant 
                                     %74 = OpTypeSampledImage %66 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                 f32 %19 = OpLoad %18 
                        Uniform f32* %21 = OpAccessChain %12 %14 %20 
                                 f32 %22 = OpLoad %21 
                                 f32 %23 = OpFDiv %19 %22 
                                             OpStore %8 %23 
                               f32_2 %29 = OpLoad vs_TEXCOORD1 
                        Uniform f32* %31 = OpAccessChain %12 %30 
                                 f32 %32 = OpLoad %31 
                               f32_2 %33 = OpCompositeConstruct %32 %32 
                               f32_2 %34 = OpFDiv %29 %33 
                                             OpStore %26 %34 
                        Private f32* %35 = OpAccessChain %26 %20 
                                 f32 %36 = OpLoad %35 
                                 f32 %37 = OpLoad %8 
                                 f32 %38 = OpFDiv %36 %37 
                        Private f32* %39 = OpAccessChain %26 %20 
                                             OpStore %39 %38 
                               f32_2 %40 = OpLoad %26 
                               f32_2 %43 = OpFAdd %40 %42 
                                             OpStore %26 %43 
                               f32_2 %44 = OpLoad %26 
                               f32_2 %45 = OpExtInst %1 3 %44 
                                             OpStore %26 %45 
                        Private f32* %47 = OpAccessChain %26 %16 
                                 f32 %48 = OpLoad %47 
                        Uniform f32* %49 = OpAccessChain %12 %30 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpFMul %48 %50 
                        Private f32* %52 = OpAccessChain %46 %16 
                                             OpStore %52 %51 
                        Private f32* %53 = OpAccessChain %26 %20 
                                 f32 %54 = OpLoad %53 
                        Uniform f32* %55 = OpAccessChain %12 %30 
                                 f32 %56 = OpLoad %55 
                                 f32 %57 = OpFMul %54 %56 
                        Private f32* %58 = OpAccessChain %26 %20 
                                             OpStore %58 %57 
                                 f32 %59 = OpLoad %8 
                        Private f32* %60 = OpAccessChain %26 %20 
                                 f32 %61 = OpLoad %60 
                                 f32 %62 = OpFMul %59 %61 
                        Private f32* %63 = OpAccessChain %46 %20 
                                             OpStore %63 %62 
                 read_only Texture2D %69 = OpLoad %68 
                             sampler %73 = OpLoad %72 
          read_only Texture2DSampled %75 = OpSampledImage %69 %73 
                               f32_2 %76 = OpLoad %46 
                               f32_4 %77 = OpImageSampleImplicitLod %75 %76 
                                             OpStore %65 %77 
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