//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Scanlines" {
Properties {
}
SubShader {
 Pass {
  Name "Scanlines"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 22138
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.x = _Time.w * _Params.z;
    u_xlat0.x = vs_TEXCOORD0.y * _Params.x + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) * _Params.x + vs_TEXCOORD0.y;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat1.xyz);
    SV_Target0.xyz = _Params.yyy * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
; Bound: 99
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %31 %69 %82 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpMemberDecorate %11 1 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD0 Location 31 
                                             OpDecorate %61 DescriptorSet 61 
                                             OpDecorate %61 Binding 61 
                                             OpDecorate %65 DescriptorSet 65 
                                             OpDecorate %65 Binding 65 
                                             OpDecorate vs_TEXCOORD1 Location 69 
                                             OpDecorate %82 Location 82 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 4 
                                     %11 = OpTypeStruct %10 %10 
                                     %12 = OpTypePointer Uniform %11 
     Uniform struct {f32_4; f32_4;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeInt 32 0 
                                 u32 %17 = OpConstant 3 
                                     %18 = OpTypePointer Uniform %6 
                                 i32 %21 = OpConstant 1 
                                 u32 %22 = OpConstant 2 
                                 u32 %26 = OpConstant 0 
                                     %27 = OpTypePointer Private %6 
                                     %29 = OpTypeVector %6 2 
                                     %30 = OpTypePointer Input %29 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 u32 %32 = OpConstant 1 
                                     %33 = OpTypePointer Input %6 
                                     %57 = OpTypePointer Private %10 
                      Private f32_4* %58 = OpVariable Private 
                                     %59 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %60 = OpTypePointer UniformConstant %59 
UniformConstant read_only Texture2D* %61 = OpVariable UniformConstant 
                                     %63 = OpTypeSampler 
                                     %64 = OpTypePointer UniformConstant %63 
            UniformConstant sampler* %65 = OpVariable UniformConstant 
                                     %67 = OpTypeSampledImage %59 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %81 = OpTypePointer Output %10 
                       Output f32_4* %82 = OpVariable Output 
                                     %83 = OpTypePointer Uniform %10 
                                     %96 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                 f32 %20 = OpLoad %19 
                        Uniform f32* %23 = OpAccessChain %13 %21 %22 
                                 f32 %24 = OpLoad %23 
                                 f32 %25 = OpFMul %20 %24 
                        Private f32* %28 = OpAccessChain %9 %26 
                                             OpStore %28 %25 
                          Input f32* %34 = OpAccessChain vs_TEXCOORD0 %32 
                                 f32 %35 = OpLoad %34 
                        Uniform f32* %36 = OpAccessChain %13 %21 %26 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFMul %35 %37 
                        Private f32* %39 = OpAccessChain %9 %26 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFAdd %38 %40 
                        Private f32* %42 = OpAccessChain %9 %26 
                                             OpStore %42 %41 
                        Private f32* %43 = OpAccessChain %9 %26 
                                 f32 %44 = OpLoad %43 
                                 f32 %45 = OpExtInst %1 13 %44 
                        Private f32* %46 = OpAccessChain %9 %26 
                                             OpStore %46 %45 
                        Private f32* %47 = OpAccessChain %9 %26 
                                 f32 %48 = OpLoad %47 
                                 f32 %49 = OpFNegate %48 
                        Uniform f32* %50 = OpAccessChain %13 %21 %26 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpFMul %49 %51 
                          Input f32* %53 = OpAccessChain vs_TEXCOORD0 %32 
                                 f32 %54 = OpLoad %53 
                                 f32 %55 = OpFAdd %52 %54 
                        Private f32* %56 = OpAccessChain %9 %26 
                                             OpStore %56 %55 
                 read_only Texture2D %62 = OpLoad %61 
                             sampler %66 = OpLoad %65 
          read_only Texture2DSampled %68 = OpSampledImage %62 %66 
                               f32_2 %70 = OpLoad vs_TEXCOORD1 
                               f32_4 %71 = OpImageSampleImplicitLod %68 %70 
                                             OpStore %58 %71 
                               f32_4 %72 = OpLoad %58 
                               f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                               f32_3 %74 = OpLoad %9 
                               f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                               f32_3 %76 = OpFMul %73 %75 
                               f32_4 %77 = OpLoad %58 
                               f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                               f32_3 %79 = OpFNegate %78 
                               f32_3 %80 = OpFAdd %76 %79 
                                             OpStore %9 %80 
                      Uniform f32_4* %84 = OpAccessChain %13 %21 
                               f32_4 %85 = OpLoad %84 
                               f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                               f32_3 %87 = OpLoad %9 
                               f32_3 %88 = OpFMul %86 %87 
                               f32_4 %89 = OpLoad %58 
                               f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               f32_3 %91 = OpFAdd %88 %90 
                               f32_4 %92 = OpLoad %82 
                               f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                             OpStore %82 %93 
                        Private f32* %94 = OpAccessChain %58 %17 
                                 f32 %95 = OpLoad %94 
                         Output f32* %97 = OpAccessChain %82 %17 
                                             OpStore %97 %95 
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