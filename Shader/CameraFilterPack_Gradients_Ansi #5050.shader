//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Gradients_Ansi" {
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
  GpuProgramID 29271
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat1.x = u_xlat9 * -2.0 + 1.0;
    u_xlat9 = _Value * u_xlat1.x + u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(8.0, 4.0, 2.0);
    u_xlat1.xyz = floor(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 121
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %98 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpMemberDecorate %15 2 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %98 Location 98 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %14 = OpTypeVector %6 4 
                                     %15 = OpTypeStruct %6 %6 %14 
                                     %16 = OpTypePointer Uniform %15 
  Uniform struct {f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 2 
                                     %20 = OpTypePointer Uniform %14 
                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %32 = OpTypePointer UniformConstant %31 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                     %35 = OpTypeSampler 
                                     %36 = OpTypePointer UniformConstant %35 
            UniformConstant sampler* %37 = OpVariable UniformConstant 
                                     %39 = OpTypeSampledImage %31 
                                     %45 = OpTypePointer Private %6 
                        Private f32* %46 = OpVariable Private 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 f32 %50 = OpConstant 3.674022E-40 
                               f32_3 %51 = OpConstantComposite %48 %49 %50 
                      Private f32_3* %53 = OpVariable Private 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 f32 %57 = OpConstant 3.674022E-40 
                                     %59 = OpTypeInt 32 0 
                                 u32 %60 = OpConstant 0 
                                 i32 %62 = OpConstant 0 
                                     %63 = OpTypePointer Uniform %6 
                                 f32 %73 = OpConstant 3.674022E-40 
                                 f32 %74 = OpConstant 3.674022E-40 
                                 f32 %75 = OpConstant 3.674022E-40 
                               f32_3 %76 = OpConstantComposite %73 %74 %75 
                      Private f32_3* %80 = OpVariable Private 
                                 f32 %82 = OpConstant 3.674022E-40 
                               f32_3 %83 = OpConstantComposite %82 %82 %82 
                               f32_3 %89 = OpConstantComposite %75 %75 %75 
                                     %97 = OpTypePointer Output %14 
                       Output f32_4* %98 = OpVariable Output 
                                 i32 %99 = OpConstant 1 
                                u32 %117 = OpConstant 3 
                                    %118 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %21 = OpAccessChain %17 %19 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                               f32_2 %24 = OpFMul %13 %23 
                      Uniform f32_4* %25 = OpAccessChain %17 %19 
                               f32_4 %26 = OpLoad %25 
                               f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                               f32_2 %28 = OpFAdd %24 %27 
                               f32_3 %29 = OpLoad %9 
                               f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                             OpStore %9 %30 
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %38 = OpLoad %37 
          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                               f32_3 %41 = OpLoad %9 
                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                             OpStore %9 %44 
                               f32_3 %47 = OpLoad %9 
                                 f32 %52 = OpDot %47 %51 
                                             OpStore %46 %52 
                                 f32 %54 = OpLoad %46 
                                 f32 %56 = OpFMul %54 %55 
                                 f32 %58 = OpFAdd %56 %57 
                        Private f32* %61 = OpAccessChain %53 %60 
                                             OpStore %61 %58 
                        Uniform f32* %64 = OpAccessChain %17 %62 
                                 f32 %65 = OpLoad %64 
                        Private f32* %66 = OpAccessChain %53 %60 
                                 f32 %67 = OpLoad %66 
                                 f32 %68 = OpFMul %65 %67 
                                 f32 %69 = OpLoad %46 
                                 f32 %70 = OpFAdd %68 %69 
                                             OpStore %46 %70 
                                 f32 %71 = OpLoad %46 
                               f32_3 %72 = OpCompositeConstruct %71 %71 %71 
                               f32_3 %77 = OpFMul %72 %76 
                                             OpStore %53 %77 
                               f32_3 %78 = OpLoad %53 
                               f32_3 %79 = OpExtInst %1 8 %78 
                                             OpStore %53 %79 
                               f32_3 %81 = OpLoad %53 
                               f32_3 %84 = OpFMul %81 %83 
                                             OpStore %80 %84 
                               f32_3 %85 = OpLoad %80 
                               f32_3 %86 = OpExtInst %1 8 %85 
                                             OpStore %80 %86 
                               f32_3 %87 = OpLoad %80 
                               f32_3 %88 = OpFNegate %87 
                               f32_3 %90 = OpFMul %88 %89 
                               f32_3 %91 = OpLoad %53 
                               f32_3 %92 = OpFAdd %90 %91 
                                             OpStore %53 %92 
                               f32_3 %93 = OpLoad %9 
                               f32_3 %94 = OpFNegate %93 
                               f32_3 %95 = OpLoad %53 
                               f32_3 %96 = OpFAdd %94 %95 
                                             OpStore %53 %96 
                       Uniform f32* %100 = OpAccessChain %17 %99 
                                f32 %101 = OpLoad %100 
                       Uniform f32* %102 = OpAccessChain %17 %99 
                                f32 %103 = OpLoad %102 
                       Uniform f32* %104 = OpAccessChain %17 %99 
                                f32 %105 = OpLoad %104 
                              f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                f32 %107 = OpCompositeExtract %106 0 
                                f32 %108 = OpCompositeExtract %106 1 
                                f32 %109 = OpCompositeExtract %106 2 
                              f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                              f32_3 %111 = OpLoad %53 
                              f32_3 %112 = OpFMul %110 %111 
                              f32_3 %113 = OpLoad %9 
                              f32_3 %114 = OpFAdd %112 %113 
                              f32_4 %115 = OpLoad %98 
                              f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                             OpStore %98 %116 
                        Output f32* %119 = OpAccessChain %98 %117 
                                             OpStore %119 %57 
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