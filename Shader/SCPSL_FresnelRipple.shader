//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "SCPSL/FresnelRipple" {
Properties {
_DistortionAmount ("Distortion Amount", Range(0, 0.1)) = 0.292
_DepthFadeDistance ("Depth Fade Distance", Float) = 0
_TextureSample1 ("Texture Sample 1", 2D) = "bump" { }
_TimeScale ("Time Scale", Float) = 0
_ForcefieldTint ("Forcefield Tint", Color) = (0,0,0,0)
_IntersectionColor ("Intersection Color", Color) = (0.4338235,0.4377282,1,0)
_FresnelPower ("Fresnel Power", Float) = 0
_FresnelScale ("Fresnel Scale", Float) = 0
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "First Pass"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 30725
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
out vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _IntersectionColor;
uniform 	float _DepthFadeDistance;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD0.zxy / vs_TEXCOORD0.www;
    u_xlat1 = texture(_CameraDepthTexture, u_xlat0.yz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = (-u_xlat0.x) + u_xlat2;
    u_xlat0.x = u_xlat0.x / _DepthFadeDistance;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    SV_Target0.w = (-u_xlat0.x) + 1.0;
    SV_Target0.xyz = _IntersectionColor.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 119
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %100 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 100 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                         u32 %86 = OpConstant 0 
                                             %87 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 3 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_3 %96 = OpConstantComposite %95 %95 %95 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                            %101 = OpTypeVector %6 2 
                                            %113 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %84 = OpAccessChain %9 %75 
                                         f32 %85 = OpLoad %84 
                                Uniform f32* %88 = OpAccessChain %20 %27 %86 
                                         f32 %89 = OpLoad %88 
                                         f32 %90 = OpFMul %85 %89 
                                Private f32* %91 = OpAccessChain %9 %75 
                                                     OpStore %91 %90 
                                       f32_4 %93 = OpLoad %9 
                                       f32_3 %94 = OpVectorShuffle %93 %93 0 3 1 
                                       f32_3 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %48 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 6 
                                                     OpStore %48 %99 
                                      f32_4 %102 = OpLoad %9 
                                      f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                      f32_4 %104 = OpLoad vs_TEXCOORD0 
                                      f32_4 %105 = OpVectorShuffle %104 %103 0 1 4 5 
                                                     OpStore vs_TEXCOORD0 %105 
                                      f32_4 %106 = OpLoad %48 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %48 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                      f32_4 %111 = OpLoad vs_TEXCOORD0 
                                      f32_4 %112 = OpVectorShuffle %111 %110 4 5 2 3 
                                                     OpStore vs_TEXCOORD0 %112 
                                Output f32* %114 = OpAccessChain %79 %27 %75 
                                        f32 %115 = OpLoad %114 
                                        f32 %116 = OpFNegate %115 
                                Output f32* %117 = OpAccessChain %79 %27 %75 
                                                     OpStore %117 %116 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %87 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpMemberDecorate %37 0 Offset 37 
                                             OpMemberDecorate %37 1 Offset 37 
                                             OpMemberDecorate %37 2 Offset 37 
                                             OpDecorate %37 Block 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %87 Location 87 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 4 
                                     %11 = OpTypePointer Input %10 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %18 = OpTypePointer Private %6 
                        Private f32* %19 = OpVariable Private 
                                     %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %21 = OpTypePointer UniformConstant %20 
UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                     %24 = OpTypeSampler 
                                     %25 = OpTypePointer UniformConstant %24 
            UniformConstant sampler* %26 = OpVariable UniformConstant 
                                     %28 = OpTypeSampledImage %20 
                                     %30 = OpTypeVector %6 2 
                                     %34 = OpTypeInt 32 0 
                                 u32 %35 = OpConstant 0 
                                     %37 = OpTypeStruct %10 %10 %6 
                                     %38 = OpTypePointer Uniform %37 
Uniform struct {f32_4; f32_4; f32;}* %39 = OpVariable Uniform 
                                     %40 = OpTypeInt 32 1 
                                 i32 %41 = OpConstant 0 
                                 u32 %42 = OpConstant 2 
                                     %43 = OpTypePointer Uniform %6 
                                 u32 %49 = OpConstant 3 
                                 f32 %54 = OpConstant 3.674022E-40 
                                 i32 %76 = OpConstant 2 
                                     %86 = OpTypePointer Output %10 
                       Output f32_4* %87 = OpVariable Output 
                                     %92 = OpTypePointer Output %6 
                                 i32 %94 = OpConstant 1 
                                     %95 = OpTypePointer Uniform %10 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD0 
                               f32_3 %14 = OpVectorShuffle %13 %13 2 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD0 
                               f32_3 %16 = OpVectorShuffle %15 %15 3 3 3 
                               f32_3 %17 = OpFDiv %14 %16 
                                             OpStore %9 %17 
                 read_only Texture2D %23 = OpLoad %22 
                             sampler %27 = OpLoad %26 
          read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                               f32_3 %31 = OpLoad %9 
                               f32_2 %32 = OpVectorShuffle %31 %31 1 2 
                               f32_4 %33 = OpImageSampleImplicitLod %29 %32 
                                 f32 %36 = OpCompositeExtract %33 0 
                                             OpStore %19 %36 
                        Uniform f32* %44 = OpAccessChain %39 %41 %42 
                                 f32 %45 = OpLoad %44 
                        Private f32* %46 = OpAccessChain %9 %35 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %45 %47 
                        Uniform f32* %50 = OpAccessChain %39 %41 %49 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpFAdd %48 %51 
                        Private f32* %53 = OpAccessChain %9 %35 
                                             OpStore %53 %52 
                        Private f32* %55 = OpAccessChain %9 %35 
                                 f32 %56 = OpLoad %55 
                                 f32 %57 = OpFDiv %54 %56 
                        Private f32* %58 = OpAccessChain %9 %35 
                                             OpStore %58 %57 
                        Uniform f32* %59 = OpAccessChain %39 %41 %42 
                                 f32 %60 = OpLoad %59 
                                 f32 %61 = OpLoad %19 
                                 f32 %62 = OpFMul %60 %61 
                        Uniform f32* %63 = OpAccessChain %39 %41 %49 
                                 f32 %64 = OpLoad %63 
                                 f32 %65 = OpFAdd %62 %64 
                                             OpStore %19 %65 
                                 f32 %66 = OpLoad %19 
                                 f32 %67 = OpFDiv %54 %66 
                                             OpStore %19 %67 
                        Private f32* %68 = OpAccessChain %9 %35 
                                 f32 %69 = OpLoad %68 
                                 f32 %70 = OpFNegate %69 
                                 f32 %71 = OpLoad %19 
                                 f32 %72 = OpFAdd %70 %71 
                        Private f32* %73 = OpAccessChain %9 %35 
                                             OpStore %73 %72 
                        Private f32* %74 = OpAccessChain %9 %35 
                                 f32 %75 = OpLoad %74 
                        Uniform f32* %77 = OpAccessChain %39 %76 
                                 f32 %78 = OpLoad %77 
                                 f32 %79 = OpFDiv %75 %78 
                        Private f32* %80 = OpAccessChain %9 %35 
                                             OpStore %80 %79 
                        Private f32* %81 = OpAccessChain %9 %35 
                                 f32 %82 = OpLoad %81 
                                 f32 %83 = OpExtInst %1 4 %82 
                                 f32 %84 = OpExtInst %1 37 %83 %54 
                        Private f32* %85 = OpAccessChain %9 %35 
                                             OpStore %85 %84 
                        Private f32* %88 = OpAccessChain %9 %35 
                                 f32 %89 = OpLoad %88 
                                 f32 %90 = OpFNegate %89 
                                 f32 %91 = OpFAdd %90 %54 
                         Output f32* %93 = OpAccessChain %87 %49 
                                             OpStore %93 %91 
                      Uniform f32_4* %96 = OpAccessChain %39 %94 
                               f32_4 %97 = OpLoad %96 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                               f32_4 %99 = OpLoad %87 
                              f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                             OpStore %87 %100 
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
 GrabPass {
}
 Pass {
  Name "Second Pass"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 73575
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	float _DistortionAmount;
uniform 	float _TimeScale;
uniform 	vec4 _ForcefieldTint;
uniform 	vec4 _IntersectionColor;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	float _DepthFadeDistance;
UNITY_LOCATION(0) uniform  sampler2D _TextureSample1;
UNITY_LOCATION(1) uniform  sampler2D _GrabTexture;
UNITY_LOCATION(2) uniform  sampler2D _CameraDepthTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.x = _Time.y * _TimeScale;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0 = texture(_TextureSample1, u_xlat0.xy);
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.x = vs_TEXCOORD1.w * 0.5;
    u_xlat9 = (-vs_TEXCOORD1.w) * 0.5 + vs_TEXCOORD1.y;
    u_xlat1.y = u_xlat9 * _ProjectionParams.x + u_xlat6.x;
    u_xlat1.x = vs_TEXCOORD1.x;
    u_xlat6.xy = u_xlat1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(_DistortionAmount) + u_xlat6.xy;
    u_xlat0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat0.xyz = u_xlat0.xyz * _ForcefieldTint.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _FresnelPower;
    u_xlat9 = exp2(u_xlat9);
    u_xlat9 = u_xlat9 * _FresnelScale;
    u_xlat1.xyz = _IntersectionColor.xyz * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.zxy / vs_TEXCOORD1.www;
    u_xlat1 = texture(_CameraDepthTexture, u_xlat0.yz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = (-u_xlat0.x) + u_xlat3.x;
    u_xlat0.x = u_xlat0.x / _DepthFadeDistance;
    SV_Target0.w = min(abs(u_xlat0.x), 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 182
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %51 %94 %97 %98 %124 %140 %168 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate vs_TEXCOORD2 Location 51 
                                                      OpMemberDecorate %92 0 BuiltIn 92 
                                                      OpMemberDecorate %92 1 BuiltIn 92 
                                                      OpMemberDecorate %92 2 BuiltIn 92 
                                                      OpDecorate %92 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate vs_TEXCOORD1 Location 124 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate vs_TEXCOORD3 Location 168 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                              %52 = OpTypeVector %6 3 
                                          u32 %90 = OpConstant 1 
                                              %91 = OpTypeArray %6 %90 
                                              %92 = OpTypeStruct %7 %6 %91 
                                              %93 = OpTypePointer Output %92 
         Output struct {f32_4; f32; f32[1];}* %94 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                              %99 = OpTypeVector %6 2 
                                         f32 %104 = OpConstant 3.674022E-40 
                                       f32_2 %105 = OpConstantComposite %104 %104 
                                             %108 = OpTypePointer Private %6 
                                         u32 %111 = OpConstant 0 
                                             %112 = OpTypePointer Uniform %6 
                                         f32 %119 = OpConstant 3.674022E-40 
                                       f32_3 %120 = OpConstantComposite %119 %119 %119 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %136 = OpConstant 3 
                                             %137 = OpTypePointer Output %6 
                                             %139 = OpTypePointer Input %52 
                                Input f32_3* %140 = OpVariable Input 
                                         u32 %158 = OpConstant 2 
                                Private f32* %160 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad vs_TEXCOORD2 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore vs_TEXCOORD2 %63 
                                        f32_4 %64 = OpLoad %44 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %21 %46 %23 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFMul %65 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %46 %28 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %44 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %76 = OpAccessChain %21 %46 %36 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpLoad %44 
                                        f32_4 %79 = OpVectorShuffle %78 %78 2 2 2 2 
                                        f32_4 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %9 %82 
                               Uniform f32_4* %83 = OpAccessChain %21 %46 %46 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpLoad %44 
                                        f32_4 %86 = OpVectorShuffle %85 %85 3 3 3 3 
                                        f32_4 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFAdd %87 %88 
                                                      OpStore %9 %89 
                                        f32_4 %95 = OpLoad %9 
                                Output f32_4* %96 = OpAccessChain %94 %28 
                                                      OpStore %96 %95 
                                       f32_4 %100 = OpLoad %98 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad vs_TEXCOORD0 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %103 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                Private f32* %109 = OpAccessChain %9 %90 
                                         f32 %110 = OpLoad %109 
                                Uniform f32* %113 = OpAccessChain %21 %28 %111 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %110 %114 
                                Private f32* %116 = OpAccessChain %9 %90 
                                                      OpStore %116 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 3 1 
                                       f32_3 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %44 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 1 5 6 
                                                      OpStore %44 %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 2 3 
                                       f32_4 %127 = OpLoad vs_TEXCOORD1 
                                       f32_4 %128 = OpVectorShuffle %127 %126 0 1 4 5 
                                                      OpStore vs_TEXCOORD1 %128 
                                       f32_4 %129 = OpLoad %44 
                                       f32_2 %130 = OpVectorShuffle %129 %129 2 2 
                                       f32_4 %131 = OpLoad %44 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 3 
                                       f32_2 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad vs_TEXCOORD1 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 2 3 
                                                      OpStore vs_TEXCOORD1 %135 
                                 Output f32* %138 = OpAccessChain vs_TEXCOORD2 %136 
                                                      OpStore %138 %104 
                                       f32_3 %141 = OpLoad %140 
                              Uniform f32_4* %142 = OpAccessChain %21 %36 %28 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %145 = OpDot %141 %144 
                                Private f32* %146 = OpAccessChain %9 %111 
                                                      OpStore %146 %145 
                                       f32_3 %147 = OpLoad %140 
                              Uniform f32_4* %148 = OpAccessChain %21 %36 %23 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %90 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %140 
                              Uniform f32_4* %154 = OpAccessChain %21 %36 %36 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %159 = OpAccessChain %9 %158 
                                                      OpStore %159 %157 
                                       f32_4 %161 = OpLoad %9 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                         f32 %165 = OpDot %162 %164 
                                                      OpStore %160 %165 
                                         f32 %166 = OpLoad %160 
                                         f32 %167 = OpExtInst %1 32 %166 
                                                      OpStore %160 %167 
                                         f32 %169 = OpLoad %160 
                                       f32_3 %170 = OpCompositeConstruct %169 %169 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %170 %172 
                                       f32_4 %174 = OpLoad vs_TEXCOORD3 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore vs_TEXCOORD3 %175 
                                 Output f32* %176 = OpAccessChain vs_TEXCOORD3 %136 
                                                      OpStore %176 %104 
                                 Output f32* %177 = OpAccessChain %94 %28 %90 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFNegate %178 
                                 Output f32* %180 = OpAccessChain %94 %28 %90 
                                                      OpStore %180 %179 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 291
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %46 %107 %167 %185 %219 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 46 
                                                      OpDecorate %78 DescriptorSet 78 
                                                      OpDecorate %78 Binding 78 
                                                      OpDecorate %82 DescriptorSet 82 
                                                      OpDecorate %82 Binding 82 
                                                      OpDecorate vs_TEXCOORD1 Location 107 
                                                      OpDecorate %151 DescriptorSet 151 
                                                      OpDecorate %151 Binding 151 
                                                      OpDecorate %153 DescriptorSet 153 
                                                      OpDecorate %153 Binding 153 
                                                      OpDecorate vs_TEXCOORD2 Location 167 
                                                      OpDecorate vs_TEXCOORD3 Location 185 
                                                      OpDecorate %219 Location 219 
                                                      OpDecorate %233 DescriptorSet 233 
                                                      OpDecorate %233 Binding 233 
                                                      OpDecorate %235 DescriptorSet 235 
                                                      OpDecorate %235 Binding 235 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %10 %7 %10 %10 %6 %6 %10 %10 %6 %6 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_3; f32_4; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 0 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 1 
                                              %18 = OpTypePointer Uniform %6 
                                          i32 %21 = OpConstant 5 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                               Private f32_3* %28 = OpVariable Private 
                               Private f32_3* %37 = OpVariable Private 
                                          u32 %40 = OpConstant 2 
                                              %42 = OpTypeVector %6 2 
                                              %43 = OpTypePointer Private %42 
                               Private f32_2* %44 = OpVariable Private 
                                              %45 = OpTypePointer Input %10 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %49 = OpConstant 3.674022E-40 
                                        f32_2 %50 = OpConstantComposite %49 %49 
                                          f32 %71 = OpConstant 3.674022E-40 
                                        f32_2 %72 = OpConstantComposite %71 %71 
                                              %76 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %77 = OpTypePointer UniformConstant %76 
         UniformConstant read_only Texture2D* %78 = OpVariable UniformConstant 
                                              %80 = OpTypeSampler 
                                              %81 = OpTypePointer UniformConstant %80 
                     UniformConstant sampler* %82 = OpVariable UniformConstant 
                                              %84 = OpTypeSampledImage %76 
                                          f32 %98 = OpConstant 3.674022E-40 
                                        f32_2 %99 = OpConstantComposite %98 %98 
                                         f32 %101 = OpConstant 3.674022E-40 
                                       f32_2 %102 = OpConstantComposite %101 %101 
                              Private f32_2* %106 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %108 = OpConstant 3 
                                             %109 = OpTypePointer Input %6 
                                Private f32* %114 = OpVariable Private 
                                         i32 %124 = OpConstant 2 
                                         i32 %142 = OpConstant 4 
        UniformConstant read_only Texture2D* %151 = OpVariable UniformConstant 
                    UniformConstant sampler* %153 = OpVariable UniformConstant 
                                         i32 %161 = OpConstant 6 
                                             %162 = OpTypePointer Uniform %10 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                         i32 %171 = OpConstant 1 
                                             %172 = OpTypePointer Uniform %7 
                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                         f32 %192 = OpConstant 3.674022E-40 
                                         i32 %197 = OpConstant 9 
                                         i32 %204 = OpConstant 8 
                                         i32 %208 = OpConstant 7 
                                             %218 = OpTypePointer Output %10 
                               Output f32_4* %219 = OpVariable Output 
        UniformConstant read_only Texture2D* %233 = OpVariable UniformConstant 
                    UniformConstant sampler* %235 = OpVariable UniformConstant 
                                         i32 %243 = OpConstant 3 
                                         i32 %279 = OpConstant 10 
                                             %288 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                 Uniform f32* %22 = OpAccessChain %13 %21 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFMul %20 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %29 = OpAccessChain %9 %25 
                                          f32 %30 = OpLoad %29 
                                          f32 %31 = OpExtInst %1 14 %30 
                                 Private f32* %32 = OpAccessChain %28 %25 
                                                      OpStore %32 %31 
                                 Private f32* %33 = OpAccessChain %9 %25 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpExtInst %1 13 %34 
                                 Private f32* %36 = OpAccessChain %9 %25 
                                                      OpStore %36 %35 
                                 Private f32* %38 = OpAccessChain %9 %25 
                                          f32 %39 = OpLoad %38 
                                 Private f32* %41 = OpAccessChain %37 %40 
                                                      OpStore %41 %39 
                                        f32_4 %47 = OpLoad vs_TEXCOORD0 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %51 = OpFAdd %48 %50 
                                                      OpStore %44 %51 
                                 Private f32* %52 = OpAccessChain %28 %25 
                                          f32 %53 = OpLoad %52 
                                 Private f32* %54 = OpAccessChain %37 %17 
                                                      OpStore %54 %53 
                                 Private f32* %55 = OpAccessChain %9 %25 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpFNegate %56 
                                 Private f32* %58 = OpAccessChain %37 %25 
                                                      OpStore %58 %57 
                                        f32_2 %59 = OpLoad %44 
                                        f32_3 %60 = OpLoad %37 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                          f32 %62 = OpDot %59 %61 
                                 Private f32* %63 = OpAccessChain %28 %17 
                                                      OpStore %63 %62 
                                        f32_2 %64 = OpLoad %44 
                                        f32_3 %65 = OpLoad %37 
                                        f32_2 %66 = OpVectorShuffle %65 %65 1 2 
                                          f32 %67 = OpDot %64 %66 
                                 Private f32* %68 = OpAccessChain %28 %25 
                                                      OpStore %68 %67 
                                        f32_3 %69 = OpLoad %28 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_2 %73 = OpFAdd %70 %72 
                                        f32_3 %74 = OpLoad %9 
                                        f32_3 %75 = OpVectorShuffle %74 %73 3 4 2 
                                                      OpStore %9 %75 
                          read_only Texture2D %79 = OpLoad %78 
                                      sampler %83 = OpLoad %82 
                   read_only Texture2DSampled %85 = OpSampledImage %79 %83 
                                        f32_3 %86 = OpLoad %9 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                        f32_4 %88 = OpImageSampleImplicitLod %85 %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 3 
                                                      OpStore %9 %89 
                                 Private f32* %90 = OpAccessChain %9 %40 
                                          f32 %91 = OpLoad %90 
                                 Private f32* %92 = OpAccessChain %9 %25 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFMul %91 %93 
                                 Private f32* %95 = OpAccessChain %9 %25 
                                                      OpStore %95 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                       f32_2 %100 = OpFMul %97 %99 
                                       f32_2 %103 = OpFAdd %100 %102 
                                       f32_3 %104 = OpLoad %9 
                                       f32_3 %105 = OpVectorShuffle %104 %103 3 4 2 
                                                      OpStore %9 %105 
                                  Input f32* %110 = OpAccessChain vs_TEXCOORD1 %108 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFMul %111 %71 
                                Private f32* %113 = OpAccessChain %106 %25 
                                                      OpStore %113 %112 
                                  Input f32* %115 = OpAccessChain vs_TEXCOORD1 %108 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                         f32 %118 = OpFMul %117 %71 
                                  Input f32* %119 = OpAccessChain vs_TEXCOORD1 %17 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFAdd %118 %120 
                                                      OpStore %114 %121 
                                         f32 %122 = OpLoad %114 
                                         f32 %123 = OpFNegate %122 
                                Uniform f32* %125 = OpAccessChain %13 %124 %25 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %123 %126 
                                Private f32* %128 = OpAccessChain %106 %25 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFAdd %127 %129 
                                Private f32* %131 = OpAccessChain %28 %17 
                                                      OpStore %131 %130 
                                  Input f32* %132 = OpAccessChain vs_TEXCOORD1 %25 
                                         f32 %133 = OpLoad %132 
                                Private f32* %134 = OpAccessChain %28 %25 
                                                      OpStore %134 %133 
                                       f32_3 %135 = OpLoad %28 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_4 %137 = OpLoad vs_TEXCOORD1 
                                       f32_2 %138 = OpVectorShuffle %137 %137 3 3 
                                       f32_2 %139 = OpFDiv %136 %138 
                                                      OpStore %106 %139 
                                       f32_3 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                Uniform f32* %143 = OpAccessChain %13 %142 
                                         f32 %144 = OpLoad %143 
                                       f32_2 %145 = OpCompositeConstruct %144 %144 
                                       f32_2 %146 = OpFMul %141 %145 
                                       f32_2 %147 = OpLoad %106 
                                       f32_2 %148 = OpFAdd %146 %147 
                                       f32_3 %149 = OpLoad %9 
                                       f32_3 %150 = OpVectorShuffle %149 %148 3 4 2 
                                                      OpStore %9 %150 
                         read_only Texture2D %152 = OpLoad %151 
                                     sampler %154 = OpLoad %153 
                  read_only Texture2DSampled %155 = OpSampledImage %152 %154 
                                       f32_3 %156 = OpLoad %9 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_4 %158 = OpImageSampleImplicitLod %155 %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                                      OpStore %9 %159 
                                       f32_3 %160 = OpLoad %9 
                              Uniform f32_4* %163 = OpAccessChain %13 %161 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFMul %160 %165 
                                                      OpStore %9 %166 
                                       f32_4 %168 = OpLoad vs_TEXCOORD2 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFNegate %169 
                              Uniform f32_3* %173 = OpAccessChain %13 %171 
                                       f32_3 %174 = OpLoad %173 
                                       f32_3 %175 = OpFAdd %170 %174 
                                                      OpStore %28 %175 
                                       f32_3 %176 = OpLoad %28 
                                       f32_3 %177 = OpLoad %28 
                                         f32 %178 = OpDot %176 %177 
                                                      OpStore %114 %178 
                                         f32 %179 = OpLoad %114 
                                         f32 %180 = OpExtInst %1 32 %179 
                                                      OpStore %114 %180 
                                         f32 %181 = OpLoad %114 
                                       f32_3 %182 = OpCompositeConstruct %181 %181 %181 
                                       f32_3 %183 = OpLoad %28 
                                       f32_3 %184 = OpFMul %182 %183 
                                                      OpStore %28 %184 
                                       f32_4 %186 = OpLoad vs_TEXCOORD3 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                       f32_3 %188 = OpLoad %28 
                                         f32 %189 = OpDot %187 %188 
                                                      OpStore %114 %189 
                                         f32 %190 = OpLoad %114 
                                         f32 %191 = OpFNegate %190 
                                         f32 %193 = OpFAdd %191 %192 
                                                      OpStore %114 %193 
                                         f32 %194 = OpLoad %114 
                                         f32 %195 = OpExtInst %1 30 %194 
                                                      OpStore %114 %195 
                                         f32 %196 = OpLoad %114 
                                Uniform f32* %198 = OpAccessChain %13 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %196 %199 
                                                      OpStore %114 %200 
                                         f32 %201 = OpLoad %114 
                                         f32 %202 = OpExtInst %1 29 %201 
                                                      OpStore %114 %202 
                                         f32 %203 = OpLoad %114 
                                Uniform f32* %205 = OpAccessChain %13 %204 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFMul %203 %206 
                                                      OpStore %114 %207 
                              Uniform f32_4* %209 = OpAccessChain %13 %208 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                         f32 %212 = OpLoad %114 
                                       f32_3 %213 = OpCompositeConstruct %212 %212 %212 
                                       f32_3 %214 = OpFMul %211 %213 
                                       f32_3 %215 = OpLoad %9 
                                       f32_3 %216 = OpFNegate %215 
                                       f32_3 %217 = OpFAdd %214 %216 
                                                      OpStore %28 %217 
                                         f32 %220 = OpLoad %114 
                                       f32_3 %221 = OpCompositeConstruct %220 %220 %220 
                                       f32_3 %222 = OpLoad %28 
                                       f32_3 %223 = OpFMul %221 %222 
                                       f32_3 %224 = OpLoad %9 
                                       f32_3 %225 = OpFAdd %223 %224 
                                       f32_4 %226 = OpLoad %219 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %219 %227 
                                       f32_4 %228 = OpLoad vs_TEXCOORD1 
                                       f32_3 %229 = OpVectorShuffle %228 %228 2 0 1 
                                       f32_4 %230 = OpLoad vs_TEXCOORD1 
                                       f32_3 %231 = OpVectorShuffle %230 %230 3 3 3 
                                       f32_3 %232 = OpFDiv %229 %231 
                                                      OpStore %9 %232 
                         read_only Texture2D %234 = OpLoad %233 
                                     sampler %236 = OpLoad %235 
                  read_only Texture2DSampled %237 = OpSampledImage %234 %236 
                                       f32_3 %238 = OpLoad %9 
                                       f32_2 %239 = OpVectorShuffle %238 %238 1 2 
                                       f32_4 %240 = OpImageSampleImplicitLod %237 %239 
                                         f32 %241 = OpCompositeExtract %240 0 
                                Private f32* %242 = OpAccessChain %44 %25 
                                                      OpStore %242 %241 
                                Uniform f32* %244 = OpAccessChain %13 %243 %40 
                                         f32 %245 = OpLoad %244 
                                Private f32* %246 = OpAccessChain %9 %25 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFMul %245 %247 
                                Uniform f32* %249 = OpAccessChain %13 %243 %108 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFAdd %248 %250 
                                Private f32* %252 = OpAccessChain %9 %25 
                                                      OpStore %252 %251 
                                Private f32* %253 = OpAccessChain %9 %25 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpFDiv %192 %254 
                                Private f32* %256 = OpAccessChain %9 %25 
                                                      OpStore %256 %255 
                                Uniform f32* %257 = OpAccessChain %13 %243 %40 
                                         f32 %258 = OpLoad %257 
                                Private f32* %259 = OpAccessChain %44 %25 
                                         f32 %260 = OpLoad %259 
                                         f32 %261 = OpFMul %258 %260 
                                Uniform f32* %262 = OpAccessChain %13 %243 %108 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFAdd %261 %263 
                                Private f32* %265 = OpAccessChain %44 %25 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %44 %25 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFDiv %192 %267 
                                Private f32* %269 = OpAccessChain %44 %25 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %9 %25 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFNegate %271 
                                Private f32* %273 = OpAccessChain %44 %25 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFAdd %272 %274 
                                Private f32* %276 = OpAccessChain %9 %25 
                                                      OpStore %276 %275 
                                Private f32* %277 = OpAccessChain %9 %25 
                                         f32 %278 = OpLoad %277 
                                Uniform f32* %280 = OpAccessChain %13 %279 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFDiv %278 %281 
                                Private f32* %283 = OpAccessChain %9 %25 
                                                      OpStore %283 %282 
                                Private f32* %284 = OpAccessChain %9 %25 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpExtInst %1 4 %285 
                                         f32 %287 = OpExtInst %1 37 %286 %192 
                                 Output f32* %289 = OpAccessChain %219 %108 
                                                      OpStore %289 %287 
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
CustomEditor "ASEMaterialInspector"
}