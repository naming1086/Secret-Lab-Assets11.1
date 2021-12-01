//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/ScreenDissolve" {
Properties {
}
SubShader {
 Pass {
  Name "ScreenDissolve"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 30636
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
uniform 	float _DissolveAmount;
UNITY_LOCATION(0) uniform  sampler2D _BlendTex;
UNITY_LOCATION(1) uniform  sampler2D _OverlayTex;
UNITY_LOCATION(2) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0.x = (-_DissolveAmount) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.899999976 + -0.449999988;
    u_xlat1 = texture(_BlendTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlatb0 = 0.5>=u_xlat0.x;
    if(u_xlatb0){
        u_xlat0 = texture(_OverlayTex, vs_TEXCOORD0.xy);
        SV_Target0.xyz = u_xlat0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    SV_Target0 = texture(_MainTex, vs_TEXCOORD1.xy);
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
; Bound: 91
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %45 %74 %87 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate vs_TEXCOORD0 Location 45 
                                             OpDecorate %65 DescriptorSet 65 
                                             OpDecorate %65 Binding 65 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %74 Location 74 
                                             OpDecorate %82 DescriptorSet 82 
                                             OpDecorate %82 Binding 82 
                                             OpDecorate %84 DescriptorSet 84 
                                             OpDecorate %84 Binding 84 
                                             OpDecorate vs_TEXCOORD1 Location 87 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %6 
                                     %11 = OpTypePointer Uniform %10 
              Uniform struct {f32;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 0 
                                     %15 = OpTypePointer Uniform %6 
                                 f32 %19 = OpConstant 3.674022E-40 
                                     %21 = OpTypeInt 32 0 
                                 u32 %22 = OpConstant 0 
                                     %23 = OpTypePointer Private %6 
                                 f32 %27 = OpConstant 3.674022E-40 
                                 f32 %29 = OpConstant 3.674022E-40 
                        Private f32* %32 = OpVariable Private 
                                     %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %34 = OpTypePointer UniformConstant %33 
UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
                                     %37 = OpTypeSampler 
                                     %38 = OpTypePointer UniformConstant %37 
            UniformConstant sampler* %39 = OpVariable UniformConstant 
                                     %41 = OpTypeSampledImage %33 
                                     %43 = OpTypeVector %6 2 
                                     %44 = OpTypePointer Input %43 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %47 = OpTypeVector %6 4 
                                     %55 = OpTypeBool 
                                     %56 = OpTypePointer Private %55 
                       Private bool* %57 = OpVariable Private 
                                 f32 %58 = OpConstant 3.674022E-40 
UniformConstant read_only Texture2D* %65 = OpVariable UniformConstant 
            UniformConstant sampler* %67 = OpVariable UniformConstant 
                                     %73 = OpTypePointer Output %47 
                       Output f32_4* %74 = OpVariable Output 
                                 u32 %78 = OpConstant 3 
                                     %79 = OpTypePointer Output %6 
UniformConstant read_only Texture2D* %82 = OpVariable UniformConstant 
            UniformConstant sampler* %84 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %16 = OpAccessChain %12 %14 
                                 f32 %17 = OpLoad %16 
                                 f32 %18 = OpFNegate %17 
                                 f32 %20 = OpFAdd %18 %19 
                        Private f32* %24 = OpAccessChain %9 %22 
                                             OpStore %24 %20 
                        Private f32* %25 = OpAccessChain %9 %22 
                                 f32 %26 = OpLoad %25 
                                 f32 %28 = OpFMul %26 %27 
                                 f32 %30 = OpFAdd %28 %29 
                        Private f32* %31 = OpAccessChain %9 %22 
                                             OpStore %31 %30 
                 read_only Texture2D %36 = OpLoad %35 
                             sampler %40 = OpLoad %39 
          read_only Texture2DSampled %42 = OpSampledImage %36 %40 
                               f32_2 %46 = OpLoad vs_TEXCOORD0 
                               f32_4 %48 = OpImageSampleImplicitLod %42 %46 
                                 f32 %49 = OpCompositeExtract %48 0 
                                             OpStore %32 %49 
                                 f32 %50 = OpLoad %32 
                        Private f32* %51 = OpAccessChain %9 %22 
                                 f32 %52 = OpLoad %51 
                                 f32 %53 = OpFAdd %50 %52 
                        Private f32* %54 = OpAccessChain %9 %22 
                                             OpStore %54 %53 
                        Private f32* %59 = OpAccessChain %9 %22 
                                 f32 %60 = OpLoad %59 
                                bool %61 = OpFOrdGreaterThanEqual %58 %60 
                                             OpStore %57 %61 
                                bool %62 = OpLoad %57 
                                             OpSelectionMerge %64 None 
                                             OpBranchConditional %62 %63 %64 
                                     %63 = OpLabel 
                 read_only Texture2D %66 = OpLoad %65 
                             sampler %68 = OpLoad %67 
          read_only Texture2DSampled %69 = OpSampledImage %66 %68 
                               f32_2 %70 = OpLoad vs_TEXCOORD0 
                               f32_4 %71 = OpImageSampleImplicitLod %69 %70 
                               f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                             OpStore %9 %72 
                               f32_3 %75 = OpLoad %9 
                               f32_4 %76 = OpLoad %74 
                               f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                             OpStore %74 %77 
                         Output f32* %80 = OpAccessChain %74 %78 
                                             OpStore %80 %19 
                                             OpReturn
                                     %64 = OpLabel 
                 read_only Texture2D %83 = OpLoad %82 
                             sampler %85 = OpLoad %84 
          read_only Texture2DSampled %86 = OpSampledImage %83 %85 
                               f32_2 %88 = OpLoad vs_TEXCOORD1 
                               f32_4 %89 = OpImageSampleImplicitLod %86 %88 
                                             OpStore %74 %89 
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