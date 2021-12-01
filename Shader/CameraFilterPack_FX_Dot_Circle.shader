//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Dot_Circle" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value ("_Value", Range(4, 32)) = 7
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 54474
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
float u_xlat1;
vec4 u_xlat2;
vec3 u_xlat4;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat1 = trunc(_Value);
    u_xlat6.xy = u_xlat6.xy / vec2(u_xlat1);
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat4.xy = vec2(u_xlat1) * vec2(0.5, 0.375);
    u_xlat4.xz = u_xlat6.xy * vec2(u_xlat1) + u_xlat4.xx;
    u_xlat6.xy = vec2(u_xlat1) * u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy / _ScreenResolution.xy;
    u_xlat2 = texture(_MainTex, u_xlat6.xy);
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenResolution.xy + u_xlat4.xz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb0 = u_xlat4.y<u_xlat0.x;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
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
; Bound: 129
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %120 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %81 DescriptorSet 81 
                                             OpDecorate %81 Binding 81 
                                             OpDecorate %85 DescriptorSet 85 
                                             OpDecorate %85 Binding 85 
                                             OpDecorate %120 Location 120 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %13 = OpTypeVector %6 4 
                                     %14 = OpTypeStruct %13 %6 %13 
                                     %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %13 
                      Private f32_2* %28 = OpVariable Private 
                                 i32 %30 = OpConstant 0 
                                     %35 = OpTypePointer Private %6 
                        Private f32* %36 = OpVariable Private 
                                 i32 %37 = OpConstant 1 
                                     %38 = OpTypePointer Uniform %6 
                                     %48 = OpTypeVector %6 3 
                                     %49 = OpTypePointer Private %48 
                      Private f32_3* %50 = OpVariable Private 
                                 f32 %53 = OpConstant 3.674022E-40 
                                 f32 %54 = OpConstant 3.674022E-40 
                               f32_2 %55 = OpConstantComposite %53 %54 
                                     %77 = OpTypePointer Private %13 
                      Private f32_4* %78 = OpVariable Private 
                                     %79 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %80 = OpTypePointer UniformConstant %79 
UniformConstant read_only Texture2D* %81 = OpVariable UniformConstant 
                                     %83 = OpTypeSampler 
                                     %84 = OpTypePointer UniformConstant %83 
            UniformConstant sampler* %85 = OpVariable UniformConstant 
                                     %87 = OpTypeSampledImage %79 
                                    %103 = OpTypeInt 32 0 
                                u32 %104 = OpConstant 0 
                                    %110 = OpTypeBool 
                                    %111 = OpTypePointer Private %110 
                      Private bool* %112 = OpVariable Private 
                                u32 %113 = OpConstant 1 
                                    %119 = OpTypePointer Output %13 
                      Output f32_4* %120 = OpVariable Output 
                                f32 %122 = OpConstant 3.674022E-40 
                              f32_4 %123 = OpConstantComposite %122 %122 %122 %122 
                                    %125 = OpTypeVector %110 4 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %12 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                               f32_2 %23 = OpFMul %12 %22 
                      Uniform f32_4* %24 = OpAccessChain %16 %18 
                               f32_4 %25 = OpLoad %24 
                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                               f32_2 %27 = OpFAdd %23 %26 
                                             OpStore %9 %27 
                               f32_2 %29 = OpLoad %9 
                      Uniform f32_4* %31 = OpAccessChain %16 %30 
                               f32_4 %32 = OpLoad %31 
                               f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                               f32_2 %34 = OpFMul %29 %33 
                                             OpStore %28 %34 
                        Uniform f32* %39 = OpAccessChain %16 %37 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpExtInst %1 3 %40 
                                             OpStore %36 %41 
                               f32_2 %42 = OpLoad %28 
                                 f32 %43 = OpLoad %36 
                               f32_2 %44 = OpCompositeConstruct %43 %43 
                               f32_2 %45 = OpFDiv %42 %44 
                                             OpStore %28 %45 
                               f32_2 %46 = OpLoad %28 
                               f32_2 %47 = OpExtInst %1 8 %46 
                                             OpStore %28 %47 
                                 f32 %51 = OpLoad %36 
                               f32_2 %52 = OpCompositeConstruct %51 %51 
                               f32_2 %56 = OpFMul %52 %55 
                               f32_3 %57 = OpLoad %50 
                               f32_3 %58 = OpVectorShuffle %57 %56 3 4 2 
                                             OpStore %50 %58 
                               f32_2 %59 = OpLoad %28 
                                 f32 %60 = OpLoad %36 
                               f32_2 %61 = OpCompositeConstruct %60 %60 
                               f32_2 %62 = OpFMul %59 %61 
                               f32_3 %63 = OpLoad %50 
                               f32_2 %64 = OpVectorShuffle %63 %63 0 0 
                               f32_2 %65 = OpFAdd %62 %64 
                               f32_3 %66 = OpLoad %50 
                               f32_3 %67 = OpVectorShuffle %66 %65 3 1 4 
                                             OpStore %50 %67 
                                 f32 %68 = OpLoad %36 
                               f32_2 %69 = OpCompositeConstruct %68 %68 
                               f32_2 %70 = OpLoad %28 
                               f32_2 %71 = OpFMul %69 %70 
                                             OpStore %28 %71 
                               f32_2 %72 = OpLoad %28 
                      Uniform f32_4* %73 = OpAccessChain %16 %30 
                               f32_4 %74 = OpLoad %73 
                               f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                               f32_2 %76 = OpFDiv %72 %75 
                                             OpStore %28 %76 
                 read_only Texture2D %82 = OpLoad %81 
                             sampler %86 = OpLoad %85 
          read_only Texture2DSampled %88 = OpSampledImage %82 %86 
                               f32_2 %89 = OpLoad %28 
                               f32_4 %90 = OpImageSampleImplicitLod %88 %89 
                                             OpStore %78 %90 
                               f32_2 %91 = OpLoad %9 
                               f32_2 %92 = OpFNegate %91 
                      Uniform f32_4* %93 = OpAccessChain %16 %30 
                               f32_4 %94 = OpLoad %93 
                               f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                               f32_2 %96 = OpFMul %92 %95 
                               f32_3 %97 = OpLoad %50 
                               f32_2 %98 = OpVectorShuffle %97 %97 0 2 
                               f32_2 %99 = OpFAdd %96 %98 
                                             OpStore %9 %99 
                              f32_2 %100 = OpLoad %9 
                              f32_2 %101 = OpLoad %9 
                                f32 %102 = OpDot %100 %101 
                       Private f32* %105 = OpAccessChain %9 %104 
                                             OpStore %105 %102 
                       Private f32* %106 = OpAccessChain %9 %104 
                                f32 %107 = OpLoad %106 
                                f32 %108 = OpExtInst %1 31 %107 
                       Private f32* %109 = OpAccessChain %9 %104 
                                             OpStore %109 %108 
                       Private f32* %114 = OpAccessChain %50 %113 
                                f32 %115 = OpLoad %114 
                       Private f32* %116 = OpAccessChain %9 %104 
                                f32 %117 = OpLoad %116 
                               bool %118 = OpFOrdLessThan %115 %117 
                                             OpStore %112 %118 
                               bool %121 = OpLoad %112 
                              f32_4 %124 = OpLoad %78 
                             bool_4 %126 = OpCompositeConstruct %121 %121 %121 %121 
                              f32_4 %127 = OpSelect %126 %123 %124 
                                             OpStore %120 %127 
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