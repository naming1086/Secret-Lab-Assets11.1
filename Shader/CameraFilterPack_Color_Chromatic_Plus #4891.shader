//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Color_Chromatic_Plus" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(-0.02, 0.02)) = 0.02
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 56397
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
uniform 	float _Distortion;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.y = _Distortion;
    u_xlat0.x = 0.0;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = u_xlat0.yxxy + u_xlat6.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat2.z = u_xlat1.z;
    u_xlat1 = texture(_MainTex, u_xlat6.xy);
    u_xlat0.xy = (-u_xlat6.xy) + vec2(0.5, 0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value);
    u_xlat2.yw = u_xlat1.yw;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat3 = float(1.0) / (-_Value2);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
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
; Bound: 150
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %28 %142 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpMemberDecorate %11 0 Offset 11 
                                                OpMemberDecorate %11 1 Offset 11 
                                                OpMemberDecorate %11 2 Offset 11 
                                                OpMemberDecorate %11 3 Offset 11 
                                                OpDecorate %11 Block 
                                                OpDecorate %13 DescriptorSet 13 
                                                OpDecorate %13 Binding 13 
                                                OpDecorate vs_TEXCOORD0 Location 28 
                                                OpDecorate %50 DescriptorSet 50 
                                                OpDecorate %50 Binding 50 
                                                OpDecorate %54 DescriptorSet 54 
                                                OpDecorate %54 Binding 54 
                                                OpDecorate %142 Location 142 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 2 
                                         %8 = OpTypePointer Private %7 
                          Private f32_2* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 4 
                                        %11 = OpTypeStruct %6 %6 %6 %10 
                                        %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                        %14 = OpTypeInt 32 1 
                                    i32 %15 = OpConstant 0 
                                        %16 = OpTypePointer Uniform %6 
                                        %19 = OpTypeInt 32 0 
                                    u32 %20 = OpConstant 1 
                                        %21 = OpTypePointer Private %6 
                                    f32 %23 = OpConstant 3.674022E-40 
                                    u32 %24 = OpConstant 0 
                         Private f32_2* %26 = OpVariable Private 
                                        %27 = OpTypePointer Input %7 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                    i32 %30 = OpConstant 3 
                                        %31 = OpTypePointer Uniform %10 
                                        %40 = OpTypePointer Private %10 
                         Private f32_4* %41 = OpVariable Private 
                         Private f32_4* %47 = OpVariable Private 
                                        %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %49 = OpTypePointer UniformConstant %48 
   UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
                                        %52 = OpTypeSampler 
                                        %53 = OpTypePointer UniformConstant %52 
               UniformConstant sampler* %54 = OpVariable UniformConstant 
                                        %56 = OpTypeSampledImage %48 
                                    u32 %69 = OpConstant 2 
                                    f32 %79 = OpConstant 3.674022E-40 
                                  f32_2 %80 = OpConstantComposite %79 %79 
                                    i32 %92 = OpConstant 1 
                          Private f32* %106 = OpVariable Private 
                                   f32 %107 = OpConstant 3.674022E-40 
                                   i32 %108 = OpConstant 2 
                                   f32 %124 = OpConstant 3.674022E-40 
                                   f32 %126 = OpConstant 3.674022E-40 
                                       %141 = OpTypePointer Output %10 
                         Output f32_4* %142 = OpVariable Output 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                           Uniform f32* %17 = OpAccessChain %13 %15 
                                    f32 %18 = OpLoad %17 
                           Private f32* %22 = OpAccessChain %9 %20 
                                                OpStore %22 %18 
                           Private f32* %25 = OpAccessChain %9 %24 
                                                OpStore %25 %23 
                                  f32_2 %29 = OpLoad vs_TEXCOORD0 
                         Uniform f32_4* %32 = OpAccessChain %13 %30 
                                  f32_4 %33 = OpLoad %32 
                                  f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                  f32_2 %35 = OpFMul %29 %34 
                         Uniform f32_4* %36 = OpAccessChain %13 %30 
                                  f32_4 %37 = OpLoad %36 
                                  f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                  f32_2 %39 = OpFAdd %35 %38 
                                                OpStore %26 %39 
                                  f32_2 %42 = OpLoad %9 
                                  f32_4 %43 = OpVectorShuffle %42 %42 1 0 0 1 
                                  f32_2 %44 = OpLoad %26 
                                  f32_4 %45 = OpVectorShuffle %44 %44 0 1 0 1 
                                  f32_4 %46 = OpFAdd %43 %45 
                                                OpStore %41 %46 
                    read_only Texture2D %51 = OpLoad %50 
                                sampler %55 = OpLoad %54 
             read_only Texture2DSampled %57 = OpSampledImage %51 %55 
                                  f32_4 %58 = OpLoad %41 
                                  f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                  f32_4 %60 = OpImageSampleImplicitLod %57 %59 
                                    f32 %61 = OpCompositeExtract %60 0 
                           Private f32* %62 = OpAccessChain %47 %24 
                                                OpStore %62 %61 
                    read_only Texture2D %63 = OpLoad %50 
                                sampler %64 = OpLoad %54 
             read_only Texture2DSampled %65 = OpSampledImage %63 %64 
                                  f32_4 %66 = OpLoad %41 
                                  f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                  f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                    f32 %70 = OpCompositeExtract %68 2 
                           Private f32* %71 = OpAccessChain %47 %69 
                                                OpStore %71 %70 
                    read_only Texture2D %72 = OpLoad %50 
                                sampler %73 = OpLoad %54 
             read_only Texture2DSampled %74 = OpSampledImage %72 %73 
                                  f32_2 %75 = OpLoad %26 
                                  f32_4 %76 = OpImageSampleImplicitLod %74 %75 
                                                OpStore %41 %76 
                                  f32_2 %77 = OpLoad %26 
                                  f32_2 %78 = OpFNegate %77 
                                  f32_2 %81 = OpFAdd %78 %80 
                                                OpStore %9 %81 
                                  f32_2 %82 = OpLoad %9 
                                  f32_2 %83 = OpLoad %9 
                                    f32 %84 = OpDot %82 %83 
                           Private f32* %85 = OpAccessChain %9 %24 
                                                OpStore %85 %84 
                           Private f32* %86 = OpAccessChain %9 %24 
                                    f32 %87 = OpLoad %86 
                                    f32 %88 = OpExtInst %1 31 %87 
                           Private f32* %89 = OpAccessChain %9 %24 
                                                OpStore %89 %88 
                           Private f32* %90 = OpAccessChain %9 %24 
                                    f32 %91 = OpLoad %90 
                           Uniform f32* %93 = OpAccessChain %13 %92 
                                    f32 %94 = OpLoad %93 
                                    f32 %95 = OpFNegate %94 
                                    f32 %96 = OpFAdd %91 %95 
                           Private f32* %97 = OpAccessChain %9 %24 
                                                OpStore %97 %96 
                                  f32_4 %98 = OpLoad %41 
                                  f32_2 %99 = OpVectorShuffle %98 %98 1 3 
                                 f32_4 %100 = OpLoad %47 
                                 f32_4 %101 = OpVectorShuffle %100 %99 0 4 2 5 
                                                OpStore %47 %101 
                                 f32_4 %102 = OpLoad %41 
                                 f32_4 %103 = OpFNegate %102 
                                 f32_4 %104 = OpLoad %47 
                                 f32_4 %105 = OpFAdd %103 %104 
                                                OpStore %47 %105 
                          Uniform f32* %109 = OpAccessChain %13 %108 
                                   f32 %110 = OpLoad %109 
                                   f32 %111 = OpFNegate %110 
                                   f32 %112 = OpFDiv %107 %111 
                                                OpStore %106 %112 
                                   f32 %113 = OpLoad %106 
                          Private f32* %114 = OpAccessChain %9 %24 
                                   f32 %115 = OpLoad %114 
                                   f32 %116 = OpFMul %113 %115 
                          Private f32* %117 = OpAccessChain %9 %24 
                                                OpStore %117 %116 
                          Private f32* %118 = OpAccessChain %9 %24 
                                   f32 %119 = OpLoad %118 
                                   f32 %120 = OpExtInst %1 43 %119 %23 %107 
                          Private f32* %121 = OpAccessChain %9 %24 
                                                OpStore %121 %120 
                          Private f32* %122 = OpAccessChain %9 %24 
                                   f32 %123 = OpLoad %122 
                                   f32 %125 = OpFMul %123 %124 
                                   f32 %127 = OpFAdd %125 %126 
                                                OpStore %106 %127 
                          Private f32* %128 = OpAccessChain %9 %24 
                                   f32 %129 = OpLoad %128 
                          Private f32* %130 = OpAccessChain %9 %24 
                                   f32 %131 = OpLoad %130 
                                   f32 %132 = OpFMul %129 %131 
                          Private f32* %133 = OpAccessChain %9 %24 
                                                OpStore %133 %132 
                                   f32 %134 = OpLoad %106 
                                   f32 %135 = OpFNegate %134 
                          Private f32* %136 = OpAccessChain %9 %24 
                                   f32 %137 = OpLoad %136 
                                   f32 %138 = OpFMul %135 %137 
                                   f32 %139 = OpFAdd %138 %107 
                          Private f32* %140 = OpAccessChain %9 %24 
                                                OpStore %140 %139 
                                 f32_2 %143 = OpLoad %9 
                                 f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                 f32_4 %145 = OpLoad %47 
                                 f32_4 %146 = OpFMul %144 %145 
                                 f32_4 %147 = OpLoad %41 
                                 f32_4 %148 = OpFAdd %146 %147 
                                                OpStore %142 %148 
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