//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Default" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 29562
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
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
uniform 	vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 + _TextureSampleAdd;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 186
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %97 %145 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 93 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate vs_TEXCOORD1 Location 97 
                                                      OpDecorate vs_TEXCOORD2 Location 145 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %128 = OpConstant 6 
                                             %129 = OpTypePointer Uniform %6 
                                         i32 %132 = OpConstant 7 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_2 %137 = OpConstantComposite %136 %136 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                                             %180 = OpTypePointer Output %6 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                                                      OpStore vs_TEXCOORD0 %96 
                                        f32_4 %98 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %98 
                               Uniform f32_4* %99 = OpAccessChain %21 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 1 1 
                              Uniform f32_4* %102 = OpAccessChain %21 %36 %23 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 2 3 
                                                      OpStore %9 %107 
                              Uniform f32_4* %108 = OpAccessChain %21 %36 %28 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                              Uniform f32_4* %111 = OpAccessChain %21 %28 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 0 
                                       f32_2 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
                                                      OpStore %9 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 3 3 
                                       f32_4 %122 = OpLoad %9 
                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                       f32_2 %124 = OpExtInst %1 4 %123 
                                       f32_2 %125 = OpFDiv %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 3 
                                                      OpStore %9 %127 
                                Uniform f32* %130 = OpAccessChain %21 %128 
                                         f32 %131 = OpLoad %130 
                                Uniform f32* %133 = OpAccessChain %21 %132 
                                         f32 %134 = OpLoad %133 
                                       f32_2 %135 = OpCompositeConstruct %131 %134 
                                       f32_2 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %9 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpExtInst %1 4 %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 3 
                                                      OpStore %9 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %137 %147 
                                       f32_4 %149 = OpLoad vs_TEXCOORD2 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %9 %156 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %9 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %9 %171 
                                       f32_4 %172 = OpLoad %9 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %9 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad vs_TEXCOORD2 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %179 
                                 Output f32* %181 = OpAccessChain %80 %28 %76 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFNegate %182 
                                 Output f32* %184 = OpAccessChain %80 %28 %76 
                                                      OpStore %184 %183 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 43
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %36 %39 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %36 Location 36 
                                             OpDecorate %39 Location 39 
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
                                     %26 = OpTypeStruct %7 
                                     %27 = OpTypePointer Uniform %26 
            Uniform struct {f32_4;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %7 
                                     %35 = OpTypePointer Output %7 
                       Output f32_4* %36 = OpVariable Output 
                                     %38 = OpTypePointer Input %7 
                        Input f32_4* %39 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFAdd %25 %33 
                                             OpStore %9 %34 
                               f32_4 %37 = OpLoad %9 
                               f32_4 %40 = OpLoad %39 
                               f32_4 %41 = OpFMul %37 %40 
                                             OpStore %36 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
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
uniform 	vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 + _TextureSampleAdd;
    u_xlat1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    u_xlatb0 = u_xlat1<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 186
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %97 %145 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 93 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate vs_TEXCOORD1 Location 97 
                                                      OpDecorate vs_TEXCOORD2 Location 145 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %128 = OpConstant 6 
                                             %129 = OpTypePointer Uniform %6 
                                         i32 %132 = OpConstant 7 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_2 %137 = OpConstantComposite %136 %136 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                                             %180 = OpTypePointer Output %6 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                                                      OpStore vs_TEXCOORD0 %96 
                                        f32_4 %98 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %98 
                               Uniform f32_4* %99 = OpAccessChain %21 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 1 1 
                              Uniform f32_4* %102 = OpAccessChain %21 %36 %23 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 2 3 
                                                      OpStore %9 %107 
                              Uniform f32_4* %108 = OpAccessChain %21 %36 %28 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                              Uniform f32_4* %111 = OpAccessChain %21 %28 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 0 
                                       f32_2 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
                                                      OpStore %9 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 3 3 
                                       f32_4 %122 = OpLoad %9 
                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                       f32_2 %124 = OpExtInst %1 4 %123 
                                       f32_2 %125 = OpFDiv %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 3 
                                                      OpStore %9 %127 
                                Uniform f32* %130 = OpAccessChain %21 %128 
                                         f32 %131 = OpLoad %130 
                                Uniform f32* %133 = OpAccessChain %21 %132 
                                         f32 %134 = OpLoad %133 
                                       f32_2 %135 = OpCompositeConstruct %131 %134 
                                       f32_2 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %9 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpExtInst %1 4 %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 3 
                                                      OpStore %9 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %137 %147 
                                       f32_4 %149 = OpLoad vs_TEXCOORD2 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %9 %156 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %9 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %9 %171 
                                       f32_4 %172 = OpLoad %9 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %9 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad vs_TEXCOORD2 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %179 
                                 Output f32* %181 = OpAccessChain %80 %28 %76 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFNegate %182 
                                 Output f32* %184 = OpAccessChain %80 %28 %76 
                                                      OpStore %184 %183 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 71
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %42 %53 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %26 0 Offset 26 
                                             OpDecorate %26 Block 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %42 Location 42 
                                             OpDecorate %53 Location 53 
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
                                     %26 = OpTypeStruct %7 
                                     %27 = OpTypePointer Uniform %26 
            Uniform struct {f32_4;}* %28 = OpVariable Uniform 
                                     %29 = OpTypeInt 32 1 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %7 
                                     %35 = OpTypePointer Private %6 
                        Private f32* %36 = OpVariable Private 
                                     %37 = OpTypeInt 32 0 
                                 u32 %38 = OpConstant 3 
                                     %41 = OpTypePointer Input %7 
                        Input f32_4* %42 = OpVariable Input 
                                     %43 = OpTypePointer Input %6 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %52 = OpTypePointer Output %7 
                       Output f32_4* %53 = OpVariable Output 
                                     %55 = OpTypeBool 
                                     %56 = OpTypePointer Private %55 
                       Private bool* %57 = OpVariable Private 
                                 f32 %59 = OpConstant 3.674022E-40 
                                 i32 %62 = OpConstant 1 
                                 i32 %64 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                      Uniform f32_4* %32 = OpAccessChain %28 %30 
                               f32_4 %33 = OpLoad %32 
                               f32_4 %34 = OpFAdd %25 %33 
                                             OpStore %9 %34 
                        Private f32* %39 = OpAccessChain %9 %38 
                                 f32 %40 = OpLoad %39 
                          Input f32* %44 = OpAccessChain %42 %38 
                                 f32 %45 = OpLoad %44 
                                 f32 %46 = OpFMul %40 %45 
                                 f32 %48 = OpFAdd %46 %47 
                                             OpStore %36 %48 
                               f32_4 %49 = OpLoad %9 
                               f32_4 %50 = OpLoad %42 
                               f32_4 %51 = OpFMul %49 %50 
                                             OpStore %9 %51 
                               f32_4 %54 = OpLoad %9 
                                             OpStore %53 %54 
                                 f32 %58 = OpLoad %36 
                                bool %60 = OpFOrdLessThan %58 %59 
                                             OpStore %57 %60 
                                bool %61 = OpLoad %57 
                                 i32 %63 = OpSelect %61 %62 %30 
                                 i32 %65 = OpIMul %63 %64 
                                bool %66 = OpINotEqual %65 %30 
                                             OpSelectionMerge %68 None 
                                             OpBranchConditional %66 %67 %68 
                                     %67 = OpLabel 
                                             OpKill
                                     %68 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
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
uniform 	vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 186
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %97 %145 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 93 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate vs_TEXCOORD1 Location 97 
                                                      OpDecorate vs_TEXCOORD2 Location 145 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %128 = OpConstant 6 
                                             %129 = OpTypePointer Uniform %6 
                                         i32 %132 = OpConstant 7 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_2 %137 = OpConstantComposite %136 %136 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                                             %180 = OpTypePointer Output %6 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                                                      OpStore vs_TEXCOORD0 %96 
                                        f32_4 %98 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %98 
                               Uniform f32_4* %99 = OpAccessChain %21 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 1 1 
                              Uniform f32_4* %102 = OpAccessChain %21 %36 %23 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 2 3 
                                                      OpStore %9 %107 
                              Uniform f32_4* %108 = OpAccessChain %21 %36 %28 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                              Uniform f32_4* %111 = OpAccessChain %21 %28 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 0 
                                       f32_2 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
                                                      OpStore %9 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 3 3 
                                       f32_4 %122 = OpLoad %9 
                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                       f32_2 %124 = OpExtInst %1 4 %123 
                                       f32_2 %125 = OpFDiv %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 3 
                                                      OpStore %9 %127 
                                Uniform f32* %130 = OpAccessChain %21 %128 
                                         f32 %131 = OpLoad %130 
                                Uniform f32* %133 = OpAccessChain %21 %132 
                                         f32 %134 = OpLoad %133 
                                       f32_2 %135 = OpCompositeConstruct %131 %134 
                                       f32_2 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %9 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpExtInst %1 4 %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 3 
                                                      OpStore %9 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %137 %147 
                                       f32_4 %149 = OpLoad vs_TEXCOORD2 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %9 %156 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %9 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %9 %171 
                                       f32_4 %172 = OpLoad %9 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %9 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad vs_TEXCOORD2 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %179 
                                 Output f32* %181 = OpAccessChain %80 %28 %76 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFNegate %182 
                                 Output f32* %184 = OpAccessChain %80 %28 %76 
                                                      OpStore %184 %183 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %27 %66 %75 %79 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpMemberDecorate %11 1 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD2 Location 27 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpDecorate %61 DescriptorSet 61 
                                             OpDecorate %61 Binding 61 
                                             OpDecorate vs_TEXCOORD0 Location 66 
                                             OpDecorate %75 Location 75 
                                             OpDecorate %79 Location 79 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 4 
                                     %11 = OpTypeStruct %10 %10 
                                     %12 = OpTypePointer Uniform %11 
     Uniform struct {f32_4; f32_4;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 1 
                                     %16 = OpTypePointer Uniform %10 
                                     %26 = OpTypePointer Input %10 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %38 = OpConstant 3.674022E-40 
                                 f32 %39 = OpConstant 3.674022E-40 
                                     %43 = OpTypeInt 32 0 
                                 u32 %44 = OpConstant 1 
                                     %45 = OpTypePointer Private %6 
                                 u32 %48 = OpConstant 0 
                                     %53 = OpTypePointer Private %10 
                      Private f32_4* %54 = OpVariable Private 
                                     %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %56 = OpTypePointer UniformConstant %55 
UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
                                     %59 = OpTypeSampler 
                                     %60 = OpTypePointer UniformConstant %59 
            UniformConstant sampler* %61 = OpVariable UniformConstant 
                                     %63 = OpTypeSampledImage %55 
                                     %65 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %70 = OpConstant 0 
                        Input f32_4* %75 = OpVariable Input 
                                     %78 = OpTypePointer Output %10 
                       Output f32_4* %79 = OpVariable Output 
                                 u32 %82 = OpConstant 3 
                                     %86 = OpTypePointer Output %6 
                                     %88 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %13 %15 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %13 %15 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                                             OpStore %9 %24 
                               f32_2 %25 = OpLoad %9 
                               f32_4 %28 = OpLoad vs_TEXCOORD2 
                               f32_2 %29 = OpVectorShuffle %28 %28 0 1 
                               f32_2 %30 = OpExtInst %1 4 %29 
                               f32_2 %31 = OpFNegate %30 
                               f32_2 %32 = OpFAdd %25 %31 
                                             OpStore %9 %32 
                               f32_2 %33 = OpLoad %9 
                               f32_4 %34 = OpLoad vs_TEXCOORD2 
                               f32_2 %35 = OpVectorShuffle %34 %34 2 3 
                               f32_2 %36 = OpFMul %33 %35 
                                             OpStore %9 %36 
                               f32_2 %37 = OpLoad %9 
                               f32_2 %40 = OpCompositeConstruct %38 %38 
                               f32_2 %41 = OpCompositeConstruct %39 %39 
                               f32_2 %42 = OpExtInst %1 43 %37 %40 %41 
                                             OpStore %9 %42 
                        Private f32* %46 = OpAccessChain %9 %44 
                                 f32 %47 = OpLoad %46 
                        Private f32* %49 = OpAccessChain %9 %48 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpFMul %47 %50 
                        Private f32* %52 = OpAccessChain %9 %48 
                                             OpStore %52 %51 
                 read_only Texture2D %58 = OpLoad %57 
                             sampler %62 = OpLoad %61 
          read_only Texture2DSampled %64 = OpSampledImage %58 %62 
                               f32_2 %67 = OpLoad vs_TEXCOORD0 
                               f32_4 %68 = OpImageSampleImplicitLod %64 %67 
                                             OpStore %54 %68 
                               f32_4 %69 = OpLoad %54 
                      Uniform f32_4* %71 = OpAccessChain %13 %70 
                               f32_4 %72 = OpLoad %71 
                               f32_4 %73 = OpFAdd %69 %72 
                                             OpStore %54 %73 
                               f32_4 %74 = OpLoad %54 
                               f32_4 %76 = OpLoad %75 
                               f32_4 %77 = OpFMul %74 %76 
                                             OpStore %54 %77 
                        Private f32* %80 = OpAccessChain %9 %48 
                                 f32 %81 = OpLoad %80 
                        Private f32* %83 = OpAccessChain %54 %82 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %81 %84 
                         Output f32* %87 = OpAccessChain %79 %82 
                                             OpStore %87 %85 
                               f32_4 %89 = OpLoad %54 
                               f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               f32_4 %91 = OpLoad %79 
                               f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                             OpStore %79 %92 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
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
uniform 	vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat2<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 186
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %97 %145 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD0 Location 93 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate vs_TEXCOORD1 Location 97 
                                                      OpDecorate vs_TEXCOORD2 Location 145 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %128 = OpConstant 6 
                                             %129 = OpTypePointer Uniform %6 
                                         i32 %132 = OpConstant 7 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_2 %137 = OpConstantComposite %136 %136 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                                             %180 = OpTypePointer Output %6 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                                                      OpStore vs_TEXCOORD0 %96 
                                        f32_4 %98 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %98 
                               Uniform f32_4* %99 = OpAccessChain %21 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 1 1 
                              Uniform f32_4* %102 = OpAccessChain %21 %36 %23 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 2 3 
                                                      OpStore %9 %107 
                              Uniform f32_4* %108 = OpAccessChain %21 %36 %28 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                              Uniform f32_4* %111 = OpAccessChain %21 %28 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 0 
                                       f32_2 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
                                                      OpStore %9 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 3 3 
                                       f32_4 %122 = OpLoad %9 
                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                       f32_2 %124 = OpExtInst %1 4 %123 
                                       f32_2 %125 = OpFDiv %121 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 3 
                                                      OpStore %9 %127 
                                Uniform f32* %130 = OpAccessChain %21 %128 
                                         f32 %131 = OpLoad %130 
                                Uniform f32* %133 = OpAccessChain %21 %132 
                                         f32 %134 = OpLoad %133 
                                       f32_2 %135 = OpCompositeConstruct %131 %134 
                                       f32_2 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %9 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpExtInst %1 4 %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 3 
                                                      OpStore %9 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %137 %147 
                                       f32_4 %149 = OpLoad vs_TEXCOORD2 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %9 %156 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %9 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %9 %171 
                                       f32_4 %172 = OpLoad %9 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %9 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad vs_TEXCOORD2 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %179 
                                 Output f32* %181 = OpAccessChain %80 %28 %76 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFNegate %182 
                                 Output f32* %184 = OpAccessChain %80 %28 %76 
                                                      OpStore %184 %183 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %27 %66 %75 %94 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 Offset 11 
                                             OpMemberDecorate %11 1 Offset 11 
                                             OpDecorate %11 Block 
                                             OpDecorate %13 DescriptorSet 13 
                                             OpDecorate %13 Binding 13 
                                             OpDecorate vs_TEXCOORD2 Location 27 
                                             OpDecorate %57 DescriptorSet 57 
                                             OpDecorate %57 Binding 57 
                                             OpDecorate %61 DescriptorSet 61 
                                             OpDecorate %61 Binding 61 
                                             OpDecorate vs_TEXCOORD0 Location 66 
                                             OpDecorate %75 Location 75 
                                             OpDecorate %94 Location 94 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 4 
                                     %11 = OpTypeStruct %10 %10 
                                     %12 = OpTypePointer Uniform %11 
     Uniform struct {f32_4; f32_4;}* %13 = OpVariable Uniform 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 1 
                                     %16 = OpTypePointer Uniform %10 
                                     %26 = OpTypePointer Input %10 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %38 = OpConstant 3.674022E-40 
                                 f32 %39 = OpConstant 3.674022E-40 
                                     %43 = OpTypeInt 32 0 
                                 u32 %44 = OpConstant 1 
                                     %45 = OpTypePointer Private %6 
                                 u32 %48 = OpConstant 0 
                                     %53 = OpTypePointer Private %10 
                      Private f32_4* %54 = OpVariable Private 
                                     %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %56 = OpTypePointer UniformConstant %55 
UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
                                     %59 = OpTypeSampler 
                                     %60 = OpTypePointer UniformConstant %59 
            UniformConstant sampler* %61 = OpVariable UniformConstant 
                                     %63 = OpTypeSampledImage %55 
                                     %65 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %70 = OpConstant 0 
                        Input f32_4* %75 = OpVariable Input 
                        Private f32* %78 = OpVariable Private 
                                 u32 %79 = OpConstant 3 
                                 f32 %85 = OpConstant 3.674022E-40 
                                     %93 = OpTypePointer Output %10 
                       Output f32_4* %94 = OpVariable Output 
                                     %95 = OpTypeVector %6 3 
                                    %102 = OpTypePointer Output %6 
                                    %104 = OpTypeBool 
                                    %105 = OpTypePointer Private %104 
                      Private bool* %106 = OpVariable Private 
                                i32 %111 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %13 %15 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %13 %15 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                                             OpStore %9 %24 
                               f32_2 %25 = OpLoad %9 
                               f32_4 %28 = OpLoad vs_TEXCOORD2 
                               f32_2 %29 = OpVectorShuffle %28 %28 0 1 
                               f32_2 %30 = OpExtInst %1 4 %29 
                               f32_2 %31 = OpFNegate %30 
                               f32_2 %32 = OpFAdd %25 %31 
                                             OpStore %9 %32 
                               f32_2 %33 = OpLoad %9 
                               f32_4 %34 = OpLoad vs_TEXCOORD2 
                               f32_2 %35 = OpVectorShuffle %34 %34 2 3 
                               f32_2 %36 = OpFMul %33 %35 
                                             OpStore %9 %36 
                               f32_2 %37 = OpLoad %9 
                               f32_2 %40 = OpCompositeConstruct %38 %38 
                               f32_2 %41 = OpCompositeConstruct %39 %39 
                               f32_2 %42 = OpExtInst %1 43 %37 %40 %41 
                                             OpStore %9 %42 
                        Private f32* %46 = OpAccessChain %9 %44 
                                 f32 %47 = OpLoad %46 
                        Private f32* %49 = OpAccessChain %9 %48 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpFMul %47 %50 
                        Private f32* %52 = OpAccessChain %9 %48 
                                             OpStore %52 %51 
                 read_only Texture2D %58 = OpLoad %57 
                             sampler %62 = OpLoad %61 
          read_only Texture2DSampled %64 = OpSampledImage %58 %62 
                               f32_2 %67 = OpLoad vs_TEXCOORD0 
                               f32_4 %68 = OpImageSampleImplicitLod %64 %67 
                                             OpStore %54 %68 
                               f32_4 %69 = OpLoad %54 
                      Uniform f32_4* %71 = OpAccessChain %13 %70 
                               f32_4 %72 = OpLoad %71 
                               f32_4 %73 = OpFAdd %69 %72 
                                             OpStore %54 %73 
                               f32_4 %74 = OpLoad %54 
                               f32_4 %76 = OpLoad %75 
                               f32_4 %77 = OpFMul %74 %76 
                                             OpStore %54 %77 
                        Private f32* %80 = OpAccessChain %54 %79 
                                 f32 %81 = OpLoad %80 
                        Private f32* %82 = OpAccessChain %9 %48 
                                 f32 %83 = OpLoad %82 
                                 f32 %84 = OpFMul %81 %83 
                                 f32 %86 = OpFAdd %84 %85 
                                             OpStore %78 %86 
                        Private f32* %87 = OpAccessChain %9 %48 
                                 f32 %88 = OpLoad %87 
                        Private f32* %89 = OpAccessChain %54 %79 
                                 f32 %90 = OpLoad %89 
                                 f32 %91 = OpFMul %88 %90 
                        Private f32* %92 = OpAccessChain %9 %48 
                                             OpStore %92 %91 
                               f32_4 %96 = OpLoad %54 
                               f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                               f32_4 %98 = OpLoad %94 
                               f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                             OpStore %94 %99 
                       Private f32* %100 = OpAccessChain %9 %48 
                                f32 %101 = OpLoad %100 
                        Output f32* %103 = OpAccessChain %94 %79 
                                             OpStore %103 %101 
                                f32 %107 = OpLoad %78 
                               bool %108 = OpFOrdLessThan %107 %38 
                                             OpStore %106 %108 
                               bool %109 = OpLoad %106 
                                i32 %110 = OpSelect %109 %15 %70 
                                i32 %112 = OpIMul %110 %111 
                               bool %113 = OpINotEqual %112 %70 
                                             OpSelectionMerge %115 None 
                                             OpBranchConditional %113 %114 %115 
                                    %114 = OpLabel 
                                             OpKill
                                    %115 = OpLabel 
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
SubProgram "d3d11 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "d3d11 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "d3d11 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
}