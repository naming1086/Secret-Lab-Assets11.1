//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_NewCellShading" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Threshold ("_Threshold", Range(0, 1)) = 0
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 19780
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
uniform 	float _Threshold;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat2 = u_xlat0.xyyx * _ScreenResolution.xyyx + vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat3 = u_xlat2.xyxz / _ScreenResolution.xyxy;
    u_xlat4 = textureLod(_MainTex, u_xlat3.xy, 0.0);
    u_xlat1.zw = u_xlat0.xx * _ScreenResolution.xx + vec2(-1.0, 1.0);
    u_xlat5 = u_xlat1.zywy / _ScreenResolution.xyxy;
    u_xlat6 = textureLod(_MainTex, u_xlat5.xy, 0.0);
    u_xlat16 = (-u_xlat6.x) * 2.0 + (-u_xlat4.x);
    u_xlat3 = textureLod(_MainTex, u_xlat3.zw, 0.0);
    u_xlat16 = u_xlat16 + (-u_xlat3.x);
    u_xlat2 = u_xlat2.wywz / _ScreenResolution.xyxy;
    u_xlat6 = textureLod(_MainTex, u_xlat2.xy, 0.0);
    u_xlat16 = u_xlat16 + u_xlat6.x;
    u_xlat5 = textureLod(_MainTex, u_xlat5.zw, 0.0);
    u_xlat16 = u_xlat5.x * 2.0 + u_xlat16;
    u_xlat2 = textureLod(_MainTex, u_xlat2.zw, 0.0);
    u_xlat5.x = u_xlat16 + u_xlat2.x;
    u_xlat0 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(0.0, -1.0, 0.0, 1.0);
    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
    u_xlat7 = textureLod(_MainTex, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat7.x * 2.0 + u_xlat4.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat3 = textureLod(_MainTex, u_xlat0.zw, 0.0);
    u_xlat0.x = (-u_xlat3.x) * 2.0 + u_xlat0.x;
    u_xlat5.y = (-u_xlat2.x) + u_xlat0.x;
    u_xlat0.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb0 = _Threshold<u_xlat0.x;
    if(u_xlatb0){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        u_xlat0.xy = u_xlat1.xy / _ScreenResolution.xy;
        SV_Target0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
    }
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
; Bound: 262
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %247 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %60 DescriptorSet 60 
                                             OpDecorate %60 Binding 60 
                                             OpDecorate %64 DescriptorSet 64 
                                             OpDecorate %64 Binding 64 
                                             OpDecorate %247 Location 247 
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
                                     %28 = OpTypePointer Private %13 
                      Private f32_4* %29 = OpVariable Private 
                                 i32 %31 = OpConstant 0 
                      Private f32_4* %38 = OpVariable Private 
                                 f32 %45 = OpConstant 3.674022E-40 
                                 f32 %46 = OpConstant 3.674022E-40 
                               f32_4 %47 = OpConstantComposite %45 %45 %46 %46 
                      Private f32_4* %49 = OpVariable Private 
                                     %56 = OpTypePointer Private %6 
                        Private f32* %57 = OpVariable Private 
                                     %58 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %59 = OpTypePointer UniformConstant %58 
UniformConstant read_only Texture2D* %60 = OpVariable UniformConstant 
                                     %62 = OpTypeSampler 
                                     %63 = OpTypePointer UniformConstant %62 
            UniformConstant sampler* %64 = OpVariable UniformConstant 
                                     %66 = OpTypeSampledImage %58 
                                 f32 %70 = OpConstant 3.674022E-40 
                                     %72 = OpTypeInt 32 0 
                                 u32 %73 = OpConstant 0 
                               f32_2 %81 = OpConstantComposite %45 %46 
                      Private f32_4* %85 = OpVariable Private 
                        Private f32* %92 = OpVariable Private 
                                f32 %102 = OpConstant 3.674022E-40 
                       Private f32* %107 = OpVariable Private 
                       Private f32* %125 = OpVariable Private 
                              f32_4 %168 = OpConstantComposite %70 %45 %70 %46 
                       Private f32* %200 = OpVariable Private 
                                u32 %221 = OpConstant 1 
                                    %233 = OpTypeBool 
                                    %234 = OpTypePointer Private %233 
                      Private bool* %235 = OpVariable Private 
                                i32 %236 = OpConstant 1 
                                    %237 = OpTypePointer Uniform %6 
                                    %246 = OpTypePointer Output %13 
                      Output f32_4* %247 = OpVariable Output 
                              f32_4 %248 = OpConstantComposite %70 %70 %70 %70 
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
                               f32_2 %30 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %16 %31 
                               f32_4 %33 = OpLoad %32 
                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                               f32_2 %35 = OpFMul %30 %34 
                               f32_4 %36 = OpLoad %29 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %29 %37 
                               f32_2 %39 = OpLoad %9 
                               f32_4 %40 = OpVectorShuffle %39 %39 0 1 1 0 
                      Uniform f32_4* %41 = OpAccessChain %16 %31 
                               f32_4 %42 = OpLoad %41 
                               f32_4 %43 = OpVectorShuffle %42 %42 0 1 1 0 
                               f32_4 %44 = OpFMul %40 %43 
                               f32_4 %48 = OpFAdd %44 %47 
                                             OpStore %38 %48 
                               f32_4 %50 = OpLoad %38 
                               f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 2 
                      Uniform f32_4* %52 = OpAccessChain %16 %31 
                               f32_4 %53 = OpLoad %52 
                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
                               f32_4 %55 = OpFDiv %51 %54 
                                             OpStore %49 %55 
                 read_only Texture2D %61 = OpLoad %60 
                             sampler %65 = OpLoad %64 
          read_only Texture2DSampled %67 = OpSampledImage %61 %65 
                               f32_4 %68 = OpLoad %49 
                               f32_2 %69 = OpVectorShuffle %68 %68 0 1 
                               f32_4 %71 = OpImageSampleExplicitLod %67 %69 Lod %13 
                                 f32 %74 = OpCompositeExtract %71 0 
                                             OpStore %57 %74 
                               f32_2 %75 = OpLoad %9 
                               f32_2 %76 = OpVectorShuffle %75 %75 0 0 
                      Uniform f32_4* %77 = OpAccessChain %16 %31 
                               f32_4 %78 = OpLoad %77 
                               f32_2 %79 = OpVectorShuffle %78 %78 0 0 
                               f32_2 %80 = OpFMul %76 %79 
                               f32_2 %82 = OpFAdd %80 %81 
                               f32_4 %83 = OpLoad %29 
                               f32_4 %84 = OpVectorShuffle %83 %82 0 1 4 5 
                                             OpStore %29 %84 
                               f32_4 %86 = OpLoad %29 
                               f32_4 %87 = OpVectorShuffle %86 %86 2 1 3 1 
                      Uniform f32_4* %88 = OpAccessChain %16 %31 
                               f32_4 %89 = OpLoad %88 
                               f32_4 %90 = OpVectorShuffle %89 %89 0 1 0 1 
                               f32_4 %91 = OpFDiv %87 %90 
                                             OpStore %85 %91 
                 read_only Texture2D %93 = OpLoad %60 
                             sampler %94 = OpLoad %64 
          read_only Texture2DSampled %95 = OpSampledImage %93 %94 
                               f32_4 %96 = OpLoad %85 
                               f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                               f32_4 %98 = OpImageSampleExplicitLod %95 %97 Lod %13 
                                 f32 %99 = OpCompositeExtract %98 0 
                                             OpStore %92 %99 
                                f32 %100 = OpLoad %92 
                                f32 %101 = OpFNegate %100 
                                f32 %103 = OpFMul %101 %102 
                                f32 %104 = OpLoad %57 
                                f32 %105 = OpFNegate %104 
                                f32 %106 = OpFAdd %103 %105 
                                             OpStore %92 %106 
                read_only Texture2D %108 = OpLoad %60 
                            sampler %109 = OpLoad %64 
         read_only Texture2DSampled %110 = OpSampledImage %108 %109 
                              f32_4 %111 = OpLoad %49 
                              f32_2 %112 = OpVectorShuffle %111 %111 2 3 
                              f32_4 %113 = OpImageSampleExplicitLod %110 %112 Lod %13 
                                f32 %114 = OpCompositeExtract %113 0 
                                             OpStore %107 %114 
                                f32 %115 = OpLoad %92 
                                f32 %116 = OpLoad %107 
                                f32 %117 = OpFNegate %116 
                                f32 %118 = OpFAdd %115 %117 
                                             OpStore %92 %118 
                              f32_4 %119 = OpLoad %38 
                              f32_4 %120 = OpVectorShuffle %119 %119 3 1 3 2 
                     Uniform f32_4* %121 = OpAccessChain %16 %31 
                              f32_4 %122 = OpLoad %121 
                              f32_4 %123 = OpVectorShuffle %122 %122 0 1 0 1 
                              f32_4 %124 = OpFDiv %120 %123 
                                             OpStore %38 %124 
                read_only Texture2D %126 = OpLoad %60 
                            sampler %127 = OpLoad %64 
         read_only Texture2DSampled %128 = OpSampledImage %126 %127 
                              f32_4 %129 = OpLoad %38 
                              f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                              f32_4 %131 = OpImageSampleExplicitLod %128 %130 Lod %13 
                                f32 %132 = OpCompositeExtract %131 0 
                                             OpStore %125 %132 
                                f32 %133 = OpLoad %92 
                                f32 %134 = OpLoad %125 
                                f32 %135 = OpFAdd %133 %134 
                                             OpStore %92 %135 
                read_only Texture2D %136 = OpLoad %60 
                            sampler %137 = OpLoad %64 
         read_only Texture2DSampled %138 = OpSampledImage %136 %137 
                              f32_4 %139 = OpLoad %85 
                              f32_2 %140 = OpVectorShuffle %139 %139 2 3 
                              f32_4 %141 = OpImageSampleExplicitLod %138 %140 Lod %13 
                                f32 %142 = OpCompositeExtract %141 0 
                       Private f32* %143 = OpAccessChain %38 %73 
                                             OpStore %143 %142 
                       Private f32* %144 = OpAccessChain %38 %73 
                                f32 %145 = OpLoad %144 
                                f32 %146 = OpFMul %145 %102 
                                f32 %147 = OpLoad %92 
                                f32 %148 = OpFAdd %146 %147 
                                             OpStore %92 %148 
                read_only Texture2D %149 = OpLoad %60 
                            sampler %150 = OpLoad %64 
         read_only Texture2DSampled %151 = OpSampledImage %149 %150 
                              f32_4 %152 = OpLoad %38 
                              f32_2 %153 = OpVectorShuffle %152 %152 2 3 
                              f32_4 %154 = OpImageSampleExplicitLod %151 %153 Lod %13 
                                f32 %155 = OpCompositeExtract %154 0 
                       Private f32* %156 = OpAccessChain %38 %73 
                                             OpStore %156 %155 
                                f32 %157 = OpLoad %92 
                       Private f32* %158 = OpAccessChain %38 %73 
                                f32 %159 = OpLoad %158 
                                f32 %160 = OpFAdd %157 %159 
                       Private f32* %161 = OpAccessChain %49 %73 
                                             OpStore %161 %160 
                              f32_2 %162 = OpLoad %9 
                              f32_4 %163 = OpVectorShuffle %162 %162 0 1 0 1 
                     Uniform f32_4* %164 = OpAccessChain %16 %31 
                              f32_4 %165 = OpLoad %164 
                              f32_4 %166 = OpVectorShuffle %165 %165 0 1 0 1 
                              f32_4 %167 = OpFMul %163 %166 
                              f32_4 %169 = OpFAdd %167 %168 
                                             OpStore %85 %169 
                              f32_4 %170 = OpLoad %85 
                     Uniform f32_4* %171 = OpAccessChain %16 %31 
                              f32_4 %172 = OpLoad %171 
                              f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 1 
                              f32_4 %174 = OpFDiv %170 %173 
                                             OpStore %85 %174 
                read_only Texture2D %175 = OpLoad %60 
                            sampler %176 = OpLoad %64 
         read_only Texture2DSampled %177 = OpSampledImage %175 %176 
                              f32_4 %178 = OpLoad %85 
                              f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                              f32_4 %180 = OpImageSampleExplicitLod %177 %179 Lod %13 
                                f32 %181 = OpCompositeExtract %180 0 
                       Private f32* %182 = OpAccessChain %9 %73 
                                             OpStore %182 %181 
                       Private f32* %183 = OpAccessChain %9 %73 
                                f32 %184 = OpLoad %183 
                                f32 %185 = OpFMul %184 %102 
                                f32 %186 = OpLoad %57 
                                f32 %187 = OpFAdd %185 %186 
                       Private f32* %188 = OpAccessChain %9 %73 
                                             OpStore %188 %187 
                                f32 %189 = OpLoad %125 
                       Private f32* %190 = OpAccessChain %9 %73 
                                f32 %191 = OpLoad %190 
                                f32 %192 = OpFAdd %189 %191 
                       Private f32* %193 = OpAccessChain %9 %73 
                                             OpStore %193 %192 
                                f32 %194 = OpLoad %107 
                                f32 %195 = OpFNegate %194 
                       Private f32* %196 = OpAccessChain %9 %73 
                                f32 %197 = OpLoad %196 
                                f32 %198 = OpFAdd %195 %197 
                       Private f32* %199 = OpAccessChain %9 %73 
                                             OpStore %199 %198 
                read_only Texture2D %201 = OpLoad %60 
                            sampler %202 = OpLoad %64 
         read_only Texture2DSampled %203 = OpSampledImage %201 %202 
                              f32_4 %204 = OpLoad %85 
                              f32_2 %205 = OpVectorShuffle %204 %204 2 3 
                              f32_4 %206 = OpImageSampleExplicitLod %203 %205 Lod %13 
                                f32 %207 = OpCompositeExtract %206 0 
                                             OpStore %200 %207 
                                f32 %208 = OpLoad %200 
                                f32 %209 = OpFNegate %208 
                                f32 %210 = OpFMul %209 %102 
                       Private f32* %211 = OpAccessChain %9 %73 
                                f32 %212 = OpLoad %211 
                                f32 %213 = OpFAdd %210 %212 
                       Private f32* %214 = OpAccessChain %9 %73 
                                             OpStore %214 %213 
                       Private f32* %215 = OpAccessChain %38 %73 
                                f32 %216 = OpLoad %215 
                                f32 %217 = OpFNegate %216 
                       Private f32* %218 = OpAccessChain %9 %73 
                                f32 %219 = OpLoad %218 
                                f32 %220 = OpFAdd %217 %219 
                       Private f32* %222 = OpAccessChain %49 %221 
                                             OpStore %222 %220 
                              f32_4 %223 = OpLoad %49 
                              f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                              f32_4 %225 = OpLoad %49 
                              f32_2 %226 = OpVectorShuffle %225 %225 0 1 
                                f32 %227 = OpDot %224 %226 
                       Private f32* %228 = OpAccessChain %9 %73 
                                             OpStore %228 %227 
                       Private f32* %229 = OpAccessChain %9 %73 
                                f32 %230 = OpLoad %229 
                                f32 %231 = OpExtInst %1 31 %230 
                       Private f32* %232 = OpAccessChain %9 %73 
                                             OpStore %232 %231 
                       Uniform f32* %238 = OpAccessChain %16 %236 
                                f32 %239 = OpLoad %238 
                       Private f32* %240 = OpAccessChain %9 %73 
                                f32 %241 = OpLoad %240 
                               bool %242 = OpFOrdLessThan %239 %241 
                                             OpStore %235 %242 
                               bool %243 = OpLoad %235 
                                             OpSelectionMerge %245 None 
                                             OpBranchConditional %243 %244 %249 
                                    %244 = OpLabel 
                                             OpStore %247 %248 
                                             OpBranch %245 
                                    %249 = OpLabel 
                              f32_4 %250 = OpLoad %29 
                              f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                     Uniform f32_4* %252 = OpAccessChain %16 %31 
                              f32_4 %253 = OpLoad %252 
                              f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                              f32_2 %255 = OpFDiv %251 %254 
                                             OpStore %9 %255 
                read_only Texture2D %256 = OpLoad %60 
                            sampler %257 = OpLoad %64 
         read_only Texture2DSampled %258 = OpSampledImage %256 %257 
                              f32_2 %259 = OpLoad %9 
                              f32_4 %260 = OpImageSampleExplicitLod %258 %259 Lod %13 
                                             OpStore %247 %260 
                                             OpBranch %245 
                                    %245 = OpLabel 
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