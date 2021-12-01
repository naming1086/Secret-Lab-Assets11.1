//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TextCore/Distance Field SSD" {
Properties {
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
}
SubShader {
 Tags { "ForceSupported" = "true" }
 Pass {
  Tags { "ForceSupported" = "true" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33620
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _FaceColor;
uniform 	vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec4 vs_COLOR1;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat0.www * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat0.w;
    u_xlat0.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat0.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = dFdx(u_xlat0.w);
    u_xlat2 = dFdy(u_xlat0.w);
    u_xlat0.x = abs(u_xlat2) + abs(u_xlat0.x);
    u_xlat2 = (-_Sharpness) + 1.0;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4;
    u_xlat2 = _FaceDilate * _ScaleRatioA;
    u_xlat2 = (-u_xlat2) * 0.5 + 0.5;
    u_xlat4 = u_xlat0.x + u_xlat2;
    u_xlat0.x = (-u_xlat0.x) + u_xlat2;
    u_xlat2 = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = (-u_xlat0.x) + u_xlat0.w;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    SV_Target0 = u_xlat0 * u_xlat1.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 241
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %102 %107 %128 %225 %232 %234 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %102 Location 102 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate vs_TEXCOORD1 Location 225 
                                                      OpDecorate vs_TEXCOORD0 Location 232 
                                                      OpDecorate %234 Location 234 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 1 
                                              %14 = OpTypePointer Input %6 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeStruct %18 %19 %20 %7 %7 %6 %6 %21 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; f32_4[4];}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 6 
                                              %27 = OpTypePointer Uniform %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                          i32 %36 = OpConstant 0 
                                          i32 %37 = OpConstant 1 
                                              %38 = OpTypePointer Uniform %7 
                               Private f32_4* %42 = OpVariable Private 
                                          i32 %45 = OpConstant 5 
                                          i32 %57 = OpConstant 2 
                                          i32 %66 = OpConstant 3 
                                              %89 = OpTypeArray %6 %13 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %100 = OpTypePointer Output %7 
                                Input f32_4* %102 = OpVariable Input 
                               Output f32_4* %107 = OpVariable Output 
                                             %108 = OpTypeVector %6 3 
                                         u32 %116 = OpConstant 3 
                                             %119 = OpTypePointer Output %6 
                                         i32 %123 = OpConstant 4 
                               Output f32_4* %128 = OpVariable Output 
                                             %163 = OpTypeVector %6 2 
                                             %205 = OpTypePointer Private %163 
                              Private f32_2* %206 = OpVariable Private 
                                         i32 %209 = OpConstant 7 
                                             %224 = OpTypePointer Output %163 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %233 = OpTypePointer Input %163 
                                Input f32_2* %234 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                 Uniform f32* %28 = OpAccessChain %24 %26 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFAdd %16 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                               Uniform f32_4* %39 = OpAccessChain %24 %36 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpFMul %35 %40 
                                                      OpStore %9 %41 
                                   Input f32* %43 = OpAccessChain %11 %31 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %46 = OpAccessChain %24 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %42 %31 
                                                      OpStore %49 %48 
                               Uniform f32_4* %50 = OpAccessChain %24 %36 %36 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %42 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                               Uniform f32_4* %58 = OpAccessChain %24 %36 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %11 
                                        f32_4 %61 = OpVectorShuffle %60 %60 2 2 2 2 
                                        f32_4 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpFAdd %62 %63 
                                                      OpStore %9 %64 
                                        f32_4 %65 = OpLoad %9 
                               Uniform f32_4* %67 = OpAccessChain %24 %36 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFAdd %65 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 1 1 1 1 
                               Uniform f32_4* %72 = OpAccessChain %24 %57 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFMul %71 %73 
                                                      OpStore %42 %74 
                               Uniform f32_4* %75 = OpAccessChain %24 %57 %36 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 0 0 0 0 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %42 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %42 %81 
                               Uniform f32_4* %82 = OpAccessChain %24 %57 %57 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 2 2 2 2 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %42 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %42 %88 
                               Uniform f32_4* %93 = OpAccessChain %24 %57 %66 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %95 3 3 3 3 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %42 
                                        f32_4 %99 = OpFAdd %97 %98 
                               Output f32_4* %101 = OpAccessChain %92 %36 
                                                      OpStore %101 %99 
                                       f32_4 %103 = OpLoad %102 
                              Uniform f32_4* %104 = OpAccessChain %24 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 3 3 3 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %107 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %107 %115 
                                Private f32* %117 = OpAccessChain %9 %116 
                                         f32 %118 = OpLoad %117 
                                 Output f32* %120 = OpAccessChain %107 %116 
                                                      OpStore %120 %118 
                                  Input f32* %121 = OpAccessChain %102 %116 
                                         f32 %122 = OpLoad %121 
                                Uniform f32* %124 = OpAccessChain %24 %123 %116 
                                         f32 %125 = OpLoad %124 
                                         f32 %126 = OpFMul %122 %125 
                                Private f32* %127 = OpAccessChain %9 %31 
                                                      OpStore %127 %126 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 0 0 
                              Uniform f32_4* %131 = OpAccessChain %24 %123 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                       f32_4 %135 = OpLoad %128 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %128 %136 
                                Private f32* %137 = OpAccessChain %9 %31 
                                         f32 %138 = OpLoad %137 
                                 Output f32* %139 = OpAccessChain %128 %116 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %11 
                                       f32_4 %141 = OpVectorShuffle %140 %140 1 1 1 1 
                              Uniform f32_4* %142 = OpAccessChain %24 %36 %37 
                                       f32_4 %143 = OpLoad %142 
                                       f32_4 %144 = OpFMul %141 %143 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %24 %36 %36 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %11 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 0 0 0 
                                       f32_4 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpFAdd %149 %150 
                                                      OpStore %9 %151 
                              Uniform f32_4* %152 = OpAccessChain %24 %36 %57 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %11 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                              Uniform f32_4* %160 = OpAccessChain %24 %36 %66 
                                       f32_4 %161 = OpLoad %160 
                                       f32_4 %162 = OpFAdd %159 %161 
                                                      OpStore %9 %162 
                                       f32_4 %164 = OpLoad %9 
                                       f32_2 %165 = OpVectorShuffle %164 %164 1 1 
                              Uniform f32_4* %166 = OpAccessChain %24 %37 %37 
                                       f32_4 %167 = OpLoad %166 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 1 
                                       f32_2 %169 = OpFMul %165 %168 
                                       f32_4 %170 = OpLoad %42 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %42 %171 
                              Uniform f32_4* %172 = OpAccessChain %24 %37 %36 
                                       f32_4 %173 = OpLoad %172 
                                       f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                                       f32_4 %175 = OpLoad %9 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 0 
                                       f32_2 %177 = OpFMul %174 %176 
                                       f32_4 %178 = OpLoad %42 
                                       f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                                       f32_2 %180 = OpFAdd %177 %179 
                                       f32_4 %181 = OpLoad %9 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
                                                      OpStore %9 %182 
                              Uniform f32_4* %183 = OpAccessChain %24 %37 %57 
                                       f32_4 %184 = OpLoad %183 
                                       f32_2 %185 = OpVectorShuffle %184 %184 0 1 
                                       f32_4 %186 = OpLoad %9 
                                       f32_2 %187 = OpVectorShuffle %186 %186 2 2 
                                       f32_2 %188 = OpFMul %185 %187 
                                       f32_4 %189 = OpLoad %9 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpFAdd %188 %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 2 3 
                                                      OpStore %9 %193 
                              Uniform f32_4* %194 = OpAccessChain %24 %37 %66 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_4 %197 = OpLoad %9 
                                       f32_2 %198 = OpVectorShuffle %197 %197 3 3 
                                       f32_2 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %9 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
                                       f32_2 %202 = OpFAdd %199 %201 
                                       f32_4 %203 = OpLoad %9 
                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
                                                      OpStore %9 %204 
                                       f32_4 %207 = OpLoad %9 
                                       f32_2 %208 = OpVectorShuffle %207 %207 1 1 
                              Uniform f32_4* %210 = OpAccessChain %24 %209 %37 
                                       f32_4 %211 = OpLoad %210 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_2 %213 = OpFMul %208 %212 
                                                      OpStore %206 %213 
                              Uniform f32_4* %214 = OpAccessChain %24 %209 %36 
                                       f32_4 %215 = OpLoad %214 
                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                       f32_4 %217 = OpLoad %9 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 0 
                                       f32_2 %219 = OpFMul %216 %218 
                                       f32_2 %220 = OpLoad %206 
                                       f32_2 %221 = OpFAdd %219 %220 
                                       f32_4 %222 = OpLoad %9 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 2 3 
                                                      OpStore %9 %223 
                                       f32_4 %226 = OpLoad %9 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                              Uniform f32_4* %228 = OpAccessChain %24 %209 %66 
                                       f32_4 %229 = OpLoad %228 
                                       f32_2 %230 = OpVectorShuffle %229 %229 0 1 
                                       f32_2 %231 = OpFAdd %227 %230 
                                                      OpStore vs_TEXCOORD1 %231 
                                       f32_2 %235 = OpLoad %234 
                                                      OpStore vs_TEXCOORD0 %235 
                                 Output f32* %236 = OpAccessChain %92 %36 %13 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFNegate %237 
                                 Output f32* %239 = OpAccessChain %92 %36 %13 
                                                      OpStore %239 %238 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 149
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %129 %138 %143 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpMemberDecorate %44 0 Offset 44 
                                              OpMemberDecorate %44 1 Offset 44 
                                              OpMemberDecorate %44 2 Offset 44 
                                              OpMemberDecorate %44 3 Offset 44 
                                              OpDecorate %44 Block 
                                              OpDecorate %46 DescriptorSet 46 
                                              OpDecorate %46 Binding 46 
                                              OpDecorate %129 Location 129 
                                              OpDecorate %133 DescriptorSet 133 
                                              OpDecorate %133 Binding 133 
                                              OpDecorate %135 DescriptorSet 135 
                                              OpDecorate %135 Binding 135 
                                              OpDecorate vs_TEXCOORD1 Location 138 
                                              OpDecorate %143 Location 143 
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
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %25 = OpTypeInt 32 0 
                                  u32 %26 = OpConstant 3 
                                  u32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Private %6 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %35 = OpVariable Private 
                                      %44 = OpTypeStruct %6 %6 %6 %6 
                                      %45 = OpTypePointer Uniform %44 
Uniform struct {f32; f32; f32; f32;}* %46 = OpVariable Uniform 
                                      %47 = OpTypeInt 32 1 
                                  i32 %48 = OpConstant 3 
                                      %49 = OpTypePointer Uniform %6 
                                  f32 %53 = OpConstant 3.674022E-40 
                         Private f32* %55 = OpVariable Private 
                                  i32 %56 = OpConstant 1 
                                  i32 %59 = OpConstant 2 
                                  i32 %68 = OpConstant 0 
                                  f32 %76 = OpConstant 3.674022E-40 
                                  u32 %95 = OpConstant 2 
                                 f32 %106 = OpConstant 3.674022E-40 
                                 f32 %111 = OpConstant 3.674022E-40 
                                 f32 %113 = OpConstant 3.674022E-40 
                                     %128 = OpTypePointer Input %7 
                        Input f32_4* %129 = OpVariable Input 
                        Private f32* %132 = OpVariable Private 
UniformConstant read_only Texture2D* %133 = OpVariable UniformConstant 
            UniformConstant sampler* %135 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %142 = OpTypePointer Output %7 
                       Output f32_4* %143 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                  f32 %27 = OpCompositeExtract %24 3 
                         Private f32* %30 = OpAccessChain %9 %28 
                                              OpStore %30 %27 
                         Private f32* %32 = OpAccessChain %9 %28 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpDPdx %33 
                                              OpStore %31 %34 
                         Private f32* %36 = OpAccessChain %9 %28 
                                  f32 %37 = OpLoad %36 
                                  f32 %38 = OpDPdy %37 
                                              OpStore %35 %38 
                                  f32 %39 = OpLoad %35 
                                  f32 %40 = OpExtInst %1 4 %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpExtInst %1 4 %41 
                                  f32 %43 = OpFAdd %40 %42 
                                              OpStore %31 %43 
                         Uniform f32* %50 = OpAccessChain %46 %48 
                                  f32 %51 = OpLoad %50 
                                  f32 %52 = OpFNegate %51 
                                  f32 %54 = OpFAdd %52 %53 
                                              OpStore %35 %54 
                         Uniform f32* %57 = OpAccessChain %46 %56 
                                  f32 %58 = OpLoad %57 
                         Uniform f32* %60 = OpAccessChain %46 %59 
                                  f32 %61 = OpLoad %60 
                                  f32 %62 = OpFMul %58 %61 
                                              OpStore %55 %62 
                                  f32 %63 = OpLoad %31 
                                  f32 %64 = OpLoad %35 
                                  f32 %65 = OpFMul %63 %64 
                                  f32 %66 = OpLoad %55 
                                  f32 %67 = OpFAdd %65 %66 
                                              OpStore %31 %67 
                         Uniform f32* %69 = OpAccessChain %46 %68 
                                  f32 %70 = OpLoad %69 
                         Uniform f32* %71 = OpAccessChain %46 %59 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %70 %72 
                                              OpStore %35 %73 
                                  f32 %74 = OpLoad %35 
                                  f32 %75 = OpFNegate %74 
                                  f32 %77 = OpFMul %75 %76 
                                  f32 %78 = OpFAdd %77 %76 
                                              OpStore %35 %78 
                                  f32 %79 = OpLoad %31 
                                  f32 %80 = OpLoad %35 
                                  f32 %81 = OpFAdd %79 %80 
                         Private f32* %82 = OpAccessChain %9 %26 
                                              OpStore %82 %81 
                                  f32 %83 = OpLoad %31 
                                  f32 %84 = OpFNegate %83 
                                  f32 %85 = OpLoad %35 
                                  f32 %86 = OpFAdd %84 %85 
                                              OpStore %31 %86 
                                  f32 %87 = OpLoad %31 
                                f32_2 %88 = OpCompositeConstruct %87 %87 
                                f32_2 %89 = OpFNegate %88 
                                f32_4 %90 = OpLoad %9 
                                f32_2 %91 = OpVectorShuffle %90 %90 0 3 
                                f32_2 %92 = OpFAdd %89 %91 
                                f32_4 %93 = OpLoad %9 
                                f32_4 %94 = OpVectorShuffle %93 %92 4 1 5 3 
                                              OpStore %9 %94 
                         Private f32* %96 = OpAccessChain %9 %95 
                                  f32 %97 = OpLoad %96 
                                  f32 %98 = OpFDiv %53 %97 
                                              OpStore %31 %98 
                                  f32 %99 = OpLoad %31 
                        Private f32* %100 = OpAccessChain %9 %28 
                                 f32 %101 = OpLoad %100 
                                 f32 %102 = OpFMul %99 %101 
                        Private f32* %103 = OpAccessChain %9 %28 
                                              OpStore %103 %102 
                        Private f32* %104 = OpAccessChain %9 %28 
                                 f32 %105 = OpLoad %104 
                                 f32 %107 = OpExtInst %1 43 %105 %106 %53 
                        Private f32* %108 = OpAccessChain %9 %28 
                                              OpStore %108 %107 
                        Private f32* %109 = OpAccessChain %9 %28 
                                 f32 %110 = OpLoad %109 
                                 f32 %112 = OpFMul %110 %111 
                                 f32 %114 = OpFAdd %112 %113 
                                              OpStore %31 %114 
                        Private f32* %115 = OpAccessChain %9 %28 
                                 f32 %116 = OpLoad %115 
                        Private f32* %117 = OpAccessChain %9 %28 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpFMul %116 %118 
                        Private f32* %120 = OpAccessChain %9 %28 
                                              OpStore %120 %119 
                        Private f32* %121 = OpAccessChain %9 %28 
                                 f32 %122 = OpLoad %121 
                                 f32 %123 = OpLoad %31 
                                 f32 %124 = OpFMul %122 %123 
                        Private f32* %125 = OpAccessChain %9 %28 
                                              OpStore %125 %124 
                               f32_4 %126 = OpLoad %9 
                               f32_4 %127 = OpVectorShuffle %126 %126 0 0 0 0 
                               f32_4 %130 = OpLoad %129 
                               f32_4 %131 = OpFMul %127 %130 
                                              OpStore %9 %131 
                 read_only Texture2D %134 = OpLoad %133 
                             sampler %136 = OpLoad %135 
          read_only Texture2DSampled %137 = OpSampledImage %134 %136 
                               f32_2 %139 = OpLoad vs_TEXCOORD1 
                               f32_4 %140 = OpImageSampleImplicitLod %137 %139 
                                 f32 %141 = OpCompositeExtract %140 3 
                                              OpStore %132 %141 
                               f32_4 %144 = OpLoad %9 
                                 f32 %145 = OpLoad %132 
                               f32_4 %146 = OpCompositeConstruct %145 %145 %145 %145 
                               f32_4 %147 = OpFMul %144 %146 
                                              OpStore %143 %147 
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