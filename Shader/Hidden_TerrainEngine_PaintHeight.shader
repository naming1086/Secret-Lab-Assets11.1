//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/PaintHeight" {
Properties {
_MainTex ("Texture", any) = "" { }
}
SubShader {
 Pass {
  Name "Raise/Lower Heights"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 38186
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _PCUVToBrushUVScales;
uniform 	vec2 _PCUVToBrushUVOffset;
uniform 	vec4 _BrushParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BrushTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xxyy * _PCUVToBrushUVScales;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + _PCUVToBrushUVOffset.xy;
    u_xlat4.xy = u_xlat0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlatb4.xy = equal(u_xlat0.xyxy, u_xlat4.xyxy).xy;
    u_xlat1 = texture(_BrushTex, u_xlat0.xy);
    u_xlatb0 = u_xlatb4.y && u_xlatb4.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = _BrushParams.x * u_xlat0.x + u_xlat1.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    SV_Target0 = min(u_xlat0.xxxx, vec4(0.499977112, 0.499977112, 0.499977112, 0.499977112));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
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
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 189
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %178 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpMemberDecorate %15 0 Offset 15 
                                               OpMemberDecorate %15 1 Offset 15 
                                               OpMemberDecorate %15 2 Offset 15 
                                               OpDecorate %15 Block 
                                               OpDecorate %17 DescriptorSet 17 
                                               OpDecorate %17 Binding 17 
                                               OpDecorate %63 DescriptorSet 63 
                                               OpDecorate %63 Binding 63 
                                               OpDecorate %67 DescriptorSet 67 
                                               OpDecorate %67 Binding 67 
                                               OpDecorate %119 DescriptorSet 119 
                                               OpDecorate %119 Binding 119 
                                               OpDecorate %121 DescriptorSet 121 
                                               OpDecorate %121 Binding 121 
                                               OpDecorate %178 Location 178 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       %15 = OpTypeStruct %7 %10 %7 
                                       %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_2; f32_4;}* %17 = OpVariable Uniform 
                                       %18 = OpTypeInt 32 1 
                                   i32 %19 = OpConstant 0 
                                       %20 = OpTypePointer Uniform %7 
                                   i32 %33 = OpConstant 1 
                                       %34 = OpTypePointer Uniform %10 
                                       %40 = OpTypePointer Private %10 
                        Private f32_2* %41 = OpVariable Private 
                                   f32 %45 = OpConstant 3.674022E-40 
                                   f32 %46 = OpConstant 3.674022E-40 
                                       %50 = OpTypeBool 
                                       %51 = OpTypeVector %50 2 
                                       %52 = OpTypePointer Private %51 
                       Private bool_2* %53 = OpVariable Private 
                                       %58 = OpTypeVector %50 4 
                                       %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %62 = OpTypePointer UniformConstant %61 
  UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                       %65 = OpTypeSampler 
                                       %66 = OpTypePointer UniformConstant %65 
              UniformConstant sampler* %67 = OpVariable UniformConstant 
                                       %69 = OpTypeSampledImage %61 
                                       %77 = OpTypeInt 32 0 
                                   u32 %78 = OpConstant 1 
                                       %79 = OpTypePointer Private %6 
                                   f32 %82 = OpConstant 3.674022E-40 
                                   u32 %84 = OpConstant 0 
                                       %89 = OpTypePointer Private %50 
                         Private bool* %90 = OpVariable Private 
                        Private f32_2* %96 = OpVariable Private 
                                  i32 %108 = OpConstant 2 
                                      %109 = OpTypePointer Uniform %6 
                                  f32 %116 = OpConstant 3.674022E-40 
 UniformConstant read_only Texture2D* %119 = OpVariable UniformConstant 
             UniformConstant sampler* %121 = OpVariable UniformConstant 
                                  f32 %147 = OpConstant 3.674022E-40 
                                  f32 %152 = OpConstant 3.674022E-40 
                                      %155 = OpTypeVector %77 2 
                                      %156 = OpTypePointer Private %155 
                       Private u32_2* %157 = OpVariable Private 
                                      %161 = OpTypePointer Private %77 
                                  u32 %165 = OpConstant 255 
                                  u32 %170 = OpConstant 8 
                       Private f32_2* %173 = OpVariable Private 
                                      %177 = OpTypePointer Output %7 
                        Output f32_4* %178 = OpVariable Output 
                                  f32 %180 = OpConstant 3.674022E-40 
                                f32_2 %181 = OpConstantComposite %180 %180 
                                f32_2 %185 = OpConstantComposite %45 %45 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_4 %14 = OpVectorShuffle %13 %13 0 0 1 1 
                        Uniform f32_4* %21 = OpAccessChain %17 %19 
                                 f32_4 %22 = OpLoad %21 
                                 f32_4 %23 = OpFMul %14 %22 
                                               OpStore %9 %23 
                                 f32_4 %24 = OpLoad %9 
                                 f32_2 %25 = OpVectorShuffle %24 %24 2 3 
                                 f32_4 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpFAdd %25 %27 
                                 f32_4 %29 = OpLoad %9 
                                 f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                               OpStore %9 %30 
                                 f32_4 %31 = OpLoad %9 
                                 f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                        Uniform f32_2* %35 = OpAccessChain %17 %33 
                                 f32_2 %36 = OpLoad %35 
                                 f32_2 %37 = OpFAdd %32 %36 
                                 f32_4 %38 = OpLoad %9 
                                 f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                               OpStore %9 %39 
                                 f32_4 %42 = OpLoad %9 
                                 f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                               OpStore %41 %43 
                                 f32_2 %44 = OpLoad %41 
                                 f32_2 %47 = OpCompositeConstruct %45 %45 
                                 f32_2 %48 = OpCompositeConstruct %46 %46 
                                 f32_2 %49 = OpExtInst %1 43 %44 %47 %48 
                                               OpStore %41 %49 
                                 f32_4 %54 = OpLoad %9 
                                 f32_4 %55 = OpVectorShuffle %54 %54 0 1 0 1 
                                 f32_2 %56 = OpLoad %41 
                                 f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                                bool_4 %59 = OpFOrdEqual %55 %57 
                                bool_2 %60 = OpVectorShuffle %59 %59 0 1 
                                               OpStore %53 %60 
                   read_only Texture2D %64 = OpLoad %63 
                               sampler %68 = OpLoad %67 
            read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                                 f32_4 %71 = OpLoad %9 
                                 f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                 f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 f32_4 %75 = OpLoad %9 
                                 f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
                                               OpStore %9 %76 
                          Private f32* %80 = OpAccessChain %9 %78 
                                   f32 %81 = OpLoad %80 
                                   f32 %83 = OpFMul %81 %82 
                          Private f32* %85 = OpAccessChain %9 %84 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFAdd %83 %86 
                          Private f32* %88 = OpAccessChain %9 %84 
                                               OpStore %88 %87 
                         Private bool* %91 = OpAccessChain %53 %78 
                                  bool %92 = OpLoad %91 
                         Private bool* %93 = OpAccessChain %53 %84 
                                  bool %94 = OpLoad %93 
                                  bool %95 = OpLogicalAnd %92 %94 
                                               OpStore %90 %95 
                                  bool %97 = OpLoad %90 
                                   f32 %98 = OpSelect %97 %46 %45 
                          Private f32* %99 = OpAccessChain %96 %84 
                                               OpStore %99 %98 
                         Private f32* %100 = OpAccessChain %96 %84 
                                  f32 %101 = OpLoad %100 
                         Private f32* %102 = OpAccessChain %9 %84 
                                  f32 %103 = OpLoad %102 
                                  f32 %104 = OpFMul %101 %103 
                         Private f32* %105 = OpAccessChain %9 %84 
                                               OpStore %105 %104 
                         Private f32* %106 = OpAccessChain %9 %84 
                                  f32 %107 = OpLoad %106 
                         Uniform f32* %110 = OpAccessChain %17 %108 %84 
                                  f32 %111 = OpLoad %110 
                                  f32 %112 = OpFMul %107 %111 
                         Private f32* %113 = OpAccessChain %9 %84 
                                               OpStore %113 %112 
                         Private f32* %114 = OpAccessChain %9 %84 
                                  f32 %115 = OpLoad %114 
                                  f32 %117 = OpFMul %115 %116 
                         Private f32* %118 = OpAccessChain %9 %84 
                                               OpStore %118 %117 
                  read_only Texture2D %120 = OpLoad %119 
                              sampler %122 = OpLoad %121 
           read_only Texture2DSampled %123 = OpSampledImage %120 %122 
                                f32_2 %124 = OpLoad vs_TEXCOORD0 
                                f32_4 %125 = OpImageSampleImplicitLod %123 %124 
                                f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                               OpStore %96 %126 
                         Private f32* %127 = OpAccessChain %96 %78 
                                  f32 %128 = OpLoad %127 
                                  f32 %129 = OpFMul %128 %82 
                         Private f32* %130 = OpAccessChain %96 %84 
                                  f32 %131 = OpLoad %130 
                                  f32 %132 = OpFAdd %129 %131 
                         Private f32* %133 = OpAccessChain %96 %84 
                                               OpStore %133 %132 
                         Private f32* %134 = OpAccessChain %96 %84 
                                  f32 %135 = OpLoad %134 
                                  f32 %136 = OpFMul %135 %116 
                         Private f32* %137 = OpAccessChain %9 %84 
                                  f32 %138 = OpLoad %137 
                                  f32 %139 = OpFAdd %136 %138 
                         Private f32* %140 = OpAccessChain %9 %84 
                                               OpStore %140 %139 
                         Private f32* %141 = OpAccessChain %9 %84 
                                  f32 %142 = OpLoad %141 
                                  f32 %143 = OpExtInst %1 40 %142 %45 
                         Private f32* %144 = OpAccessChain %9 %84 
                                               OpStore %144 %143 
                         Private f32* %145 = OpAccessChain %9 %84 
                                  f32 %146 = OpLoad %145 
                                  f32 %148 = OpExtInst %1 37 %146 %147 
                         Private f32* %149 = OpAccessChain %9 %84 
                                               OpStore %149 %148 
                         Private f32* %150 = OpAccessChain %9 %84 
                                  f32 %151 = OpLoad %150 
                                  f32 %153 = OpFMul %151 %152 
                         Private f32* %154 = OpAccessChain %9 %84 
                                               OpStore %154 %153 
                         Private f32* %158 = OpAccessChain %9 %84 
                                  f32 %159 = OpLoad %158 
                                  u32 %160 = OpConvertFToU %159 
                         Private u32* %162 = OpAccessChain %157 %84 
                                               OpStore %162 %160 
                         Private u32* %163 = OpAccessChain %157 %84 
                                  u32 %164 = OpLoad %163 
                                  u32 %166 = OpBitwiseAnd %164 %165 
                         Private u32* %167 = OpAccessChain %157 %78 
                                               OpStore %167 %166 
                         Private u32* %168 = OpAccessChain %157 %84 
                                  u32 %169 = OpLoad %168 
                                  u32 %171 = OpShiftRightLogical %169 %170 
                         Private u32* %172 = OpAccessChain %157 %84 
                                               OpStore %172 %171 
                                u32_2 %174 = OpLoad %157 
                                u32_2 %175 = OpVectorShuffle %174 %174 1 0 
                                f32_2 %176 = OpConvertUToF %175 
                                               OpStore %173 %176 
                                f32_2 %179 = OpLoad %173 
                                f32_2 %182 = OpFMul %179 %181 
                                f32_4 %183 = OpLoad %178 
                                f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
                                               OpStore %178 %184 
                                f32_4 %186 = OpLoad %178 
                                f32_4 %187 = OpVectorShuffle %186 %185 0 1 4 5 
                                               OpStore %178 %187 
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
 Pass {
  Name "Stamp Heights"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 105975
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _PCUVToBrushUVScales;
uniform 	vec2 _PCUVToBrushUVOffset;
uniform 	vec4 _BrushParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BrushTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xxyy * _PCUVToBrushUVScales;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + _PCUVToBrushUVOffset.xy;
    u_xlat4.xy = u_xlat0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlatb4.xy = equal(u_xlat0.xyxy, u_xlat4.xyxy).xy;
    u_xlat1 = texture(_BrushTex, u_xlat0.xy);
    u_xlatb0 = u_xlatb4.y && u_xlatb4.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _BrushParams.z;
    u_xlat2 = (-_BrushParams.w) + 1.0;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * 8.0;
    u_xlat2 = exp2(u_xlat2);
    u_xlat4.x = u_xlat2 * u_xlat0.x;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat2 * u_xlat1.x;
    u_xlat6 = exp2(u_xlat6);
    u_xlat4.x = u_xlat4.x + u_xlat6;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat2 = u_xlat4.x / u_xlat2;
    u_xlat0.x = max(u_xlat0.x, u_xlat1.x);
    u_xlatb4.x = 0.0<_BrushParams.w;
    u_xlat0.x = (u_xlatb4.x) ? u_xlat2 : u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
    u_xlat0.x = _BrushParams.x * u_xlat0.x + u_xlat1.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    SV_Target0 = min(u_xlat0.xxxx, vec4(0.499977112, 0.499977112, 0.499977112, 0.499977112));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
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
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 268
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %257 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpMemberDecorate %15 0 Offset 15 
                                               OpMemberDecorate %15 1 Offset 15 
                                               OpMemberDecorate %15 2 Offset 15 
                                               OpDecorate %15 Block 
                                               OpDecorate %17 DescriptorSet 17 
                                               OpDecorate %17 Binding 17 
                                               OpDecorate %63 DescriptorSet 63 
                                               OpDecorate %63 Binding 63 
                                               OpDecorate %67 DescriptorSet 67 
                                               OpDecorate %67 Binding 67 
                                               OpDecorate %140 DescriptorSet 140 
                                               OpDecorate %140 Binding 140 
                                               OpDecorate %142 DescriptorSet 142 
                                               OpDecorate %142 Binding 142 
                                               OpDecorate %257 Location 257 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       %15 = OpTypeStruct %7 %10 %7 
                                       %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_2; f32_4;}* %17 = OpVariable Uniform 
                                       %18 = OpTypeInt 32 1 
                                   i32 %19 = OpConstant 0 
                                       %20 = OpTypePointer Uniform %7 
                                   i32 %33 = OpConstant 1 
                                       %34 = OpTypePointer Uniform %10 
                                       %40 = OpTypePointer Private %10 
                        Private f32_2* %41 = OpVariable Private 
                                   f32 %45 = OpConstant 3.674022E-40 
                                   f32 %46 = OpConstant 3.674022E-40 
                                       %50 = OpTypeBool 
                                       %51 = OpTypeVector %50 2 
                                       %52 = OpTypePointer Private %51 
                       Private bool_2* %53 = OpVariable Private 
                                       %58 = OpTypeVector %50 4 
                                       %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %62 = OpTypePointer UniformConstant %61 
  UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                       %65 = OpTypeSampler 
                                       %66 = OpTypePointer UniformConstant %65 
              UniformConstant sampler* %67 = OpVariable UniformConstant 
                                       %69 = OpTypeSampledImage %61 
                                       %77 = OpTypeInt 32 0 
                                   u32 %78 = OpConstant 1 
                                       %79 = OpTypePointer Private %6 
                                   f32 %82 = OpConstant 3.674022E-40 
                                   u32 %84 = OpConstant 0 
                                       %89 = OpTypePointer Private %50 
                         Private bool* %90 = OpVariable Private 
                          Private f32* %96 = OpVariable Private 
                                  i32 %106 = OpConstant 2 
                                  u32 %107 = OpConstant 2 
                                      %108 = OpTypePointer Uniform %6 
                                  f32 %115 = OpConstant 3.674022E-40 
                                  u32 %118 = OpConstant 3 
                                  f32 %126 = OpConstant 3.674022E-40 
                       Private f32_2* %139 = OpVariable Private 
 UniformConstant read_only Texture2D* %140 = OpVariable UniformConstant 
             UniformConstant sampler* %142 = OpVariable UniformConstant 
                         Private f32* %148 = OpVariable Private 
                         Private f32* %158 = OpVariable Private 
                                  f32 %172 = OpConstant 3.674022E-40 
                                      %195 = OpTypePointer Function %6 
                                  f32 %227 = OpConstant 3.674022E-40 
                                  f32 %232 = OpConstant 3.674022E-40 
                                      %235 = OpTypeVector %77 2 
                                      %236 = OpTypePointer Private %235 
                       Private u32_2* %237 = OpVariable Private 
                                      %241 = OpTypePointer Private %77 
                                  u32 %245 = OpConstant 255 
                                  u32 %250 = OpConstant 8 
                                      %256 = OpTypePointer Output %7 
                        Output f32_4* %257 = OpVariable Output 
                                  f32 %259 = OpConstant 3.674022E-40 
                                f32_2 %260 = OpConstantComposite %259 %259 
                                f32_2 %264 = OpConstantComposite %45 %45 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                        Function f32* %196 = OpVariable Function 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_4 %14 = OpVectorShuffle %13 %13 0 0 1 1 
                        Uniform f32_4* %21 = OpAccessChain %17 %19 
                                 f32_4 %22 = OpLoad %21 
                                 f32_4 %23 = OpFMul %14 %22 
                                               OpStore %9 %23 
                                 f32_4 %24 = OpLoad %9 
                                 f32_2 %25 = OpVectorShuffle %24 %24 2 3 
                                 f32_4 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpFAdd %25 %27 
                                 f32_4 %29 = OpLoad %9 
                                 f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                               OpStore %9 %30 
                                 f32_4 %31 = OpLoad %9 
                                 f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                        Uniform f32_2* %35 = OpAccessChain %17 %33 
                                 f32_2 %36 = OpLoad %35 
                                 f32_2 %37 = OpFAdd %32 %36 
                                 f32_4 %38 = OpLoad %9 
                                 f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                               OpStore %9 %39 
                                 f32_4 %42 = OpLoad %9 
                                 f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                               OpStore %41 %43 
                                 f32_2 %44 = OpLoad %41 
                                 f32_2 %47 = OpCompositeConstruct %45 %45 
                                 f32_2 %48 = OpCompositeConstruct %46 %46 
                                 f32_2 %49 = OpExtInst %1 43 %44 %47 %48 
                                               OpStore %41 %49 
                                 f32_4 %54 = OpLoad %9 
                                 f32_4 %55 = OpVectorShuffle %54 %54 0 1 0 1 
                                 f32_2 %56 = OpLoad %41 
                                 f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                                bool_4 %59 = OpFOrdEqual %55 %57 
                                bool_2 %60 = OpVectorShuffle %59 %59 0 1 
                                               OpStore %53 %60 
                   read_only Texture2D %64 = OpLoad %63 
                               sampler %68 = OpLoad %67 
            read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                                 f32_4 %71 = OpLoad %9 
                                 f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                 f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 f32_4 %75 = OpLoad %9 
                                 f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
                                               OpStore %9 %76 
                          Private f32* %80 = OpAccessChain %9 %78 
                                   f32 %81 = OpLoad %80 
                                   f32 %83 = OpFMul %81 %82 
                          Private f32* %85 = OpAccessChain %9 %84 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFAdd %83 %86 
                          Private f32* %88 = OpAccessChain %9 %84 
                                               OpStore %88 %87 
                         Private bool* %91 = OpAccessChain %53 %78 
                                  bool %92 = OpLoad %91 
                         Private bool* %93 = OpAccessChain %53 %84 
                                  bool %94 = OpLoad %93 
                                  bool %95 = OpLogicalAnd %92 %94 
                                               OpStore %90 %95 
                                  bool %97 = OpLoad %90 
                                   f32 %98 = OpSelect %97 %46 %45 
                                               OpStore %96 %98 
                                   f32 %99 = OpLoad %96 
                         Private f32* %100 = OpAccessChain %9 %84 
                                  f32 %101 = OpLoad %100 
                                  f32 %102 = OpFMul %99 %101 
                         Private f32* %103 = OpAccessChain %9 %84 
                                               OpStore %103 %102 
                         Private f32* %104 = OpAccessChain %9 %84 
                                  f32 %105 = OpLoad %104 
                         Uniform f32* %109 = OpAccessChain %17 %106 %107 
                                  f32 %110 = OpLoad %109 
                                  f32 %111 = OpFMul %105 %110 
                         Private f32* %112 = OpAccessChain %9 %84 
                                               OpStore %112 %111 
                         Private f32* %113 = OpAccessChain %9 %84 
                                  f32 %114 = OpLoad %113 
                                  f32 %116 = OpFMul %114 %115 
                         Private f32* %117 = OpAccessChain %9 %84 
                                               OpStore %117 %116 
                         Uniform f32* %119 = OpAccessChain %17 %106 %118 
                                  f32 %120 = OpLoad %119 
                                  f32 %121 = OpFNegate %120 
                                  f32 %122 = OpFAdd %121 %46 
                                               OpStore %96 %122 
                                  f32 %123 = OpLoad %96 
                                  f32 %124 = OpExtInst %1 43 %123 %45 %46 
                                               OpStore %96 %124 
                                  f32 %125 = OpLoad %96 
                                  f32 %127 = OpFMul %125 %126 
                                               OpStore %96 %127 
                                  f32 %128 = OpLoad %96 
                                  f32 %129 = OpExtInst %1 29 %128 
                                               OpStore %96 %129 
                                  f32 %130 = OpLoad %96 
                         Private f32* %131 = OpAccessChain %9 %84 
                                  f32 %132 = OpLoad %131 
                                  f32 %133 = OpFMul %130 %132 
                         Private f32* %134 = OpAccessChain %41 %84 
                                               OpStore %134 %133 
                         Private f32* %135 = OpAccessChain %41 %84 
                                  f32 %136 = OpLoad %135 
                                  f32 %137 = OpExtInst %1 29 %136 
                         Private f32* %138 = OpAccessChain %41 %84 
                                               OpStore %138 %137 
                  read_only Texture2D %141 = OpLoad %140 
                              sampler %143 = OpLoad %142 
           read_only Texture2DSampled %144 = OpSampledImage %141 %143 
                                f32_2 %145 = OpLoad vs_TEXCOORD0 
                                f32_4 %146 = OpImageSampleImplicitLod %144 %145 
                                f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                               OpStore %139 %147 
                         Private f32* %149 = OpAccessChain %139 %78 
                                  f32 %150 = OpLoad %149 
                                  f32 %151 = OpFMul %150 %82 
                         Private f32* %152 = OpAccessChain %139 %84 
                                  f32 %153 = OpLoad %152 
                                  f32 %154 = OpFAdd %151 %153 
                                               OpStore %148 %154 
                                  f32 %155 = OpLoad %148 
                                  f32 %156 = OpFMul %155 %115 
                         Private f32* %157 = OpAccessChain %139 %84 
                                               OpStore %157 %156 
                                  f32 %159 = OpLoad %96 
                         Private f32* %160 = OpAccessChain %139 %84 
                                  f32 %161 = OpLoad %160 
                                  f32 %162 = OpFMul %159 %161 
                                               OpStore %158 %162 
                                  f32 %163 = OpLoad %158 
                                  f32 %164 = OpExtInst %1 29 %163 
                                               OpStore %158 %164 
                         Private f32* %165 = OpAccessChain %41 %84 
                                  f32 %166 = OpLoad %165 
                                  f32 %167 = OpLoad %158 
                                  f32 %168 = OpFAdd %166 %167 
                         Private f32* %169 = OpAccessChain %41 %84 
                                               OpStore %169 %168 
                         Private f32* %170 = OpAccessChain %41 %84 
                                  f32 %171 = OpLoad %170 
                                  f32 %173 = OpFAdd %171 %172 
                         Private f32* %174 = OpAccessChain %41 %84 
                                               OpStore %174 %173 
                         Private f32* %175 = OpAccessChain %41 %84 
                                  f32 %176 = OpLoad %175 
                                  f32 %177 = OpExtInst %1 30 %176 
                         Private f32* %178 = OpAccessChain %41 %84 
                                               OpStore %178 %177 
                         Private f32* %179 = OpAccessChain %41 %84 
                                  f32 %180 = OpLoad %179 
                                  f32 %181 = OpLoad %96 
                                  f32 %182 = OpFDiv %180 %181 
                                               OpStore %96 %182 
                         Private f32* %183 = OpAccessChain %9 %84 
                                  f32 %184 = OpLoad %183 
                         Private f32* %185 = OpAccessChain %139 %84 
                                  f32 %186 = OpLoad %185 
                                  f32 %187 = OpExtInst %1 40 %184 %186 
                         Private f32* %188 = OpAccessChain %9 %84 
                                               OpStore %188 %187 
                         Uniform f32* %189 = OpAccessChain %17 %106 %118 
                                  f32 %190 = OpLoad %189 
                                 bool %191 = OpFOrdLessThan %45 %190 
                        Private bool* %192 = OpAccessChain %53 %84 
                                               OpStore %192 %191 
                        Private bool* %193 = OpAccessChain %53 %84 
                                 bool %194 = OpLoad %193 
                                               OpSelectionMerge %198 None 
                                               OpBranchConditional %194 %197 %200 
                                      %197 = OpLabel 
                                  f32 %199 = OpLoad %96 
                                               OpStore %196 %199 
                                               OpBranch %198 
                                      %200 = OpLabel 
                         Private f32* %201 = OpAccessChain %9 %84 
                                  f32 %202 = OpLoad %201 
                                               OpStore %196 %202 
                                               OpBranch %198 
                                      %198 = OpLabel 
                                  f32 %203 = OpLoad %196 
                         Private f32* %204 = OpAccessChain %9 %84 
                                               OpStore %204 %203 
                                  f32 %205 = OpLoad %148 
                                  f32 %206 = OpFNegate %205 
                                  f32 %207 = OpFMul %206 %115 
                         Private f32* %208 = OpAccessChain %9 %84 
                                  f32 %209 = OpLoad %208 
                                  f32 %210 = OpFAdd %207 %209 
                         Private f32* %211 = OpAccessChain %9 %84 
                                               OpStore %211 %210 
                         Uniform f32* %212 = OpAccessChain %17 %106 %84 
                                  f32 %213 = OpLoad %212 
                         Private f32* %214 = OpAccessChain %9 %84 
                                  f32 %215 = OpLoad %214 
                                  f32 %216 = OpFMul %213 %215 
                         Private f32* %217 = OpAccessChain %139 %84 
                                  f32 %218 = OpLoad %217 
                                  f32 %219 = OpFAdd %216 %218 
                         Private f32* %220 = OpAccessChain %9 %84 
                                               OpStore %220 %219 
                         Private f32* %221 = OpAccessChain %9 %84 
                                  f32 %222 = OpLoad %221 
                                  f32 %223 = OpExtInst %1 40 %222 %45 
                         Private f32* %224 = OpAccessChain %9 %84 
                                               OpStore %224 %223 
                         Private f32* %225 = OpAccessChain %9 %84 
                                  f32 %226 = OpLoad %225 
                                  f32 %228 = OpExtInst %1 37 %226 %227 
                         Private f32* %229 = OpAccessChain %9 %84 
                                               OpStore %229 %228 
                         Private f32* %230 = OpAccessChain %9 %84 
                                  f32 %231 = OpLoad %230 
                                  f32 %233 = OpFMul %231 %232 
                         Private f32* %234 = OpAccessChain %9 %84 
                                               OpStore %234 %233 
                         Private f32* %238 = OpAccessChain %9 %84 
                                  f32 %239 = OpLoad %238 
                                  u32 %240 = OpConvertFToU %239 
                         Private u32* %242 = OpAccessChain %237 %84 
                                               OpStore %242 %240 
                         Private u32* %243 = OpAccessChain %237 %84 
                                  u32 %244 = OpLoad %243 
                                  u32 %246 = OpBitwiseAnd %244 %245 
                         Private u32* %247 = OpAccessChain %237 %78 
                                               OpStore %247 %246 
                         Private u32* %248 = OpAccessChain %237 %84 
                                  u32 %249 = OpLoad %248 
                                  u32 %251 = OpShiftRightLogical %249 %250 
                         Private u32* %252 = OpAccessChain %237 %84 
                                               OpStore %252 %251 
                                u32_2 %253 = OpLoad %237 
                                u32_2 %254 = OpVectorShuffle %253 %253 1 0 
                                f32_2 %255 = OpConvertUToF %254 
                                               OpStore %139 %255 
                                f32_2 %258 = OpLoad %139 
                                f32_2 %261 = OpFMul %258 %260 
                                f32_4 %262 = OpLoad %257 
                                f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                               OpStore %257 %263 
                                f32_4 %265 = OpLoad %257 
                                f32_4 %266 = OpVectorShuffle %265 %264 0 1 4 5 
                                               OpStore %257 %266 
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
 Pass {
  Name "Set Heights"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 187121
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _PCUVToBrushUVScales;
uniform 	vec2 _PCUVToBrushUVOffset;
uniform 	vec4 _BrushParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BrushTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat3;
int u_xlati3;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat5;
int u_xlati5;
float u_xlat6;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xxyy * _PCUVToBrushUVScales;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + _PCUVToBrushUVOffset.xy;
    u_xlat4.xy = u_xlat0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlatb4.xy = equal(u_xlat0.xyxy, u_xlat4.xyxy).xy;
    u_xlat1 = texture(_BrushTex, u_xlat0.xy);
    u_xlatb0 = u_xlatb4.y && u_xlatb4.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * _BrushParams.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat2 = u_xlat0.x;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat4.x = (-u_xlat2) + 1.0;
    u_xlat2 = u_xlat2 + 9.99999997e-07;
    u_xlat2 = u_xlat4.x / u_xlat2;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat1.x + (-_BrushParams.y);
    u_xlat6 = u_xlat4.x * u_xlat2;
    u_xlat6 = max(u_xlat6, -1.0);
    u_xlat6 = min(u_xlat6, 1.0);
    u_xlati3 = int((0.0<u_xlat6) ? 0xFFFFFFFFu : uint(0));
    u_xlati5 = int((u_xlat6<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati3 = (-u_xlati3) + u_xlati5;
    u_xlat3 = float(u_xlati3);
    u_xlat5 = u_xlat6 * 0.5;
    u_xlat3 = u_xlat5 * u_xlat3 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat3;
    u_xlat2 = u_xlat6 / u_xlat2;
    u_xlat2 = u_xlat2 + u_xlat4.x;
    u_xlat2 = u_xlat2 + _BrushParams.y;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat2) : u_xlat1.xxxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
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
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 267
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %256 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpMemberDecorate %15 0 Offset 15 
                                               OpMemberDecorate %15 1 Offset 15 
                                               OpMemberDecorate %15 2 Offset 15 
                                               OpDecorate %15 Block 
                                               OpDecorate %17 DescriptorSet 17 
                                               OpDecorate %17 Binding 17 
                                               OpDecorate %63 DescriptorSet 63 
                                               OpDecorate %63 Binding 63 
                                               OpDecorate %67 DescriptorSet 67 
                                               OpDecorate %67 Binding 67 
                                               OpDecorate %131 DescriptorSet 131 
                                               OpDecorate %131 Binding 131 
                                               OpDecorate %133 DescriptorSet 133 
                                               OpDecorate %133 Binding 133 
                                               OpDecorate %256 Location 256 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       %15 = OpTypeStruct %7 %10 %7 
                                       %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_2; f32_4;}* %17 = OpVariable Uniform 
                                       %18 = OpTypeInt 32 1 
                                   i32 %19 = OpConstant 0 
                                       %20 = OpTypePointer Uniform %7 
                                   i32 %33 = OpConstant 1 
                                       %34 = OpTypePointer Uniform %10 
                                       %40 = OpTypePointer Private %10 
                        Private f32_2* %41 = OpVariable Private 
                                   f32 %45 = OpConstant 3.674022E-40 
                                   f32 %46 = OpConstant 3.674022E-40 
                                       %50 = OpTypeBool 
                                       %51 = OpTypeVector %50 2 
                                       %52 = OpTypePointer Private %51 
                       Private bool_2* %53 = OpVariable Private 
                                       %58 = OpTypeVector %50 4 
                                       %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %62 = OpTypePointer UniformConstant %61 
  UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                       %65 = OpTypeSampler 
                                       %66 = OpTypePointer UniformConstant %65 
              UniformConstant sampler* %67 = OpVariable UniformConstant 
                                       %69 = OpTypeSampledImage %61 
                                       %77 = OpTypeInt 32 0 
                                   u32 %78 = OpConstant 1 
                                       %79 = OpTypePointer Private %6 
                                   f32 %82 = OpConstant 3.674022E-40 
                                   u32 %84 = OpConstant 0 
                                       %89 = OpTypePointer Private %50 
                         Private bool* %90 = OpVariable Private 
                          Private f32* %96 = OpVariable Private 
                                  i32 %100 = OpConstant 2 
                                      %101 = OpTypePointer Uniform %6 
                                  f32 %112 = OpConstant 3.674022E-40 
                        Private bool* %116 = OpVariable Private 
                                  f32 %125 = OpConstant 3.674022E-40 
 UniformConstant read_only Texture2D* %131 = OpVariable UniformConstant 
             UniformConstant sampler* %133 = OpVariable UniformConstant 
                         Private f32* %146 = OpVariable Private 
                       Private f32_2* %158 = OpVariable Private 
                                  f32 %165 = OpConstant 3.674022E-40 
                                      %172 = OpTypePointer Private %18 
                         Private i32* %173 = OpVariable Private 
                                  u32 %177 = OpConstant 4294967295 
                         Private i32* %180 = OpVariable Private 
                         Private f32* %190 = OpVariable Private 
                         Private f32* %193 = OpVariable Private 
                                  f32 %196 = OpConstant 3.674022E-40 
                                      %219 = OpTypePointer Function %6 
                                  f32 %231 = OpConstant 3.674022E-40 
                                      %234 = OpTypeVector %77 2 
                                      %235 = OpTypePointer Private %234 
                       Private u32_2* %236 = OpVariable Private 
                                      %240 = OpTypePointer Private %77 
                                  u32 %244 = OpConstant 255 
                                  i32 %249 = OpConstant 8 
                                      %255 = OpTypePointer Output %7 
                        Output f32_4* %256 = OpVariable Output 
                                  f32 %258 = OpConstant 3.674022E-40 
                                f32_2 %259 = OpConstantComposite %258 %258 
                                f32_2 %263 = OpConstantComposite %45 %45 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                        Function f32* %220 = OpVariable Function 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_4 %14 = OpVectorShuffle %13 %13 0 0 1 1 
                        Uniform f32_4* %21 = OpAccessChain %17 %19 
                                 f32_4 %22 = OpLoad %21 
                                 f32_4 %23 = OpFMul %14 %22 
                                               OpStore %9 %23 
                                 f32_4 %24 = OpLoad %9 
                                 f32_2 %25 = OpVectorShuffle %24 %24 2 3 
                                 f32_4 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpFAdd %25 %27 
                                 f32_4 %29 = OpLoad %9 
                                 f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                               OpStore %9 %30 
                                 f32_4 %31 = OpLoad %9 
                                 f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                        Uniform f32_2* %35 = OpAccessChain %17 %33 
                                 f32_2 %36 = OpLoad %35 
                                 f32_2 %37 = OpFAdd %32 %36 
                                 f32_4 %38 = OpLoad %9 
                                 f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                               OpStore %9 %39 
                                 f32_4 %42 = OpLoad %9 
                                 f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                               OpStore %41 %43 
                                 f32_2 %44 = OpLoad %41 
                                 f32_2 %47 = OpCompositeConstruct %45 %45 
                                 f32_2 %48 = OpCompositeConstruct %46 %46 
                                 f32_2 %49 = OpExtInst %1 43 %44 %47 %48 
                                               OpStore %41 %49 
                                 f32_4 %54 = OpLoad %9 
                                 f32_4 %55 = OpVectorShuffle %54 %54 0 1 0 1 
                                 f32_2 %56 = OpLoad %41 
                                 f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                                bool_4 %59 = OpFOrdEqual %55 %57 
                                bool_2 %60 = OpVectorShuffle %59 %59 0 1 
                                               OpStore %53 %60 
                   read_only Texture2D %64 = OpLoad %63 
                               sampler %68 = OpLoad %67 
            read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                                 f32_4 %71 = OpLoad %9 
                                 f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                 f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 f32_4 %75 = OpLoad %9 
                                 f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
                                               OpStore %9 %76 
                          Private f32* %80 = OpAccessChain %9 %78 
                                   f32 %81 = OpLoad %80 
                                   f32 %83 = OpFMul %81 %82 
                          Private f32* %85 = OpAccessChain %9 %84 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFAdd %83 %86 
                          Private f32* %88 = OpAccessChain %9 %84 
                                               OpStore %88 %87 
                         Private bool* %91 = OpAccessChain %53 %78 
                                  bool %92 = OpLoad %91 
                         Private bool* %93 = OpAccessChain %53 %84 
                                  bool %94 = OpLoad %93 
                                  bool %95 = OpLogicalAnd %92 %94 
                                               OpStore %90 %95 
                                  bool %97 = OpLoad %90 
                                   f32 %98 = OpSelect %97 %46 %45 
                                               OpStore %96 %98 
                                   f32 %99 = OpLoad %96 
                         Uniform f32* %102 = OpAccessChain %17 %100 %84 
                                  f32 %103 = OpLoad %102 
                                  f32 %104 = OpFMul %99 %103 
                                               OpStore %96 %104 
                                  f32 %105 = OpLoad %96 
                         Private f32* %106 = OpAccessChain %9 %84 
                                  f32 %107 = OpLoad %106 
                                  f32 %108 = OpFMul %105 %107 
                         Private f32* %109 = OpAccessChain %9 %84 
                                               OpStore %109 %108 
                         Private f32* %110 = OpAccessChain %9 %84 
                                  f32 %111 = OpLoad %110 
                                  f32 %113 = OpFMul %111 %112 
                                               OpStore %96 %113 
                                  f32 %114 = OpLoad %96 
                                  f32 %115 = OpExtInst %1 43 %114 %45 %46 
                                               OpStore %96 %115 
                         Private f32* %117 = OpAccessChain %9 %84 
                                  f32 %118 = OpLoad %117 
                                 bool %119 = OpFOrdLessThan %45 %118 
                                               OpStore %116 %119 
                                  f32 %120 = OpLoad %96 
                                  f32 %121 = OpFNegate %120 
                                  f32 %122 = OpFAdd %121 %46 
                         Private f32* %123 = OpAccessChain %41 %84 
                                               OpStore %123 %122 
                                  f32 %124 = OpLoad %96 
                                  f32 %126 = OpFAdd %124 %125 
                                               OpStore %96 %126 
                         Private f32* %127 = OpAccessChain %41 %84 
                                  f32 %128 = OpLoad %127 
                                  f32 %129 = OpLoad %96 
                                  f32 %130 = OpFDiv %128 %129 
                                               OpStore %96 %130 
                  read_only Texture2D %132 = OpLoad %131 
                              sampler %134 = OpLoad %133 
           read_only Texture2DSampled %135 = OpSampledImage %132 %134 
                                f32_2 %136 = OpLoad vs_TEXCOORD0 
                                f32_4 %137 = OpImageSampleImplicitLod %135 %136 
                                f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                               OpStore %41 %138 
                         Private f32* %139 = OpAccessChain %41 %78 
                                  f32 %140 = OpLoad %139 
                                  f32 %141 = OpFMul %140 %82 
                         Private f32* %142 = OpAccessChain %41 %84 
                                  f32 %143 = OpLoad %142 
                                  f32 %144 = OpFAdd %141 %143 
                         Private f32* %145 = OpAccessChain %41 %84 
                                               OpStore %145 %144 
                         Private f32* %147 = OpAccessChain %41 %84 
                                  f32 %148 = OpLoad %147 
                                  f32 %149 = OpFMul %148 %112 
                         Uniform f32* %150 = OpAccessChain %17 %100 %78 
                                  f32 %151 = OpLoad %150 
                                  f32 %152 = OpFNegate %151 
                                  f32 %153 = OpFAdd %149 %152 
                                               OpStore %146 %153 
                         Private f32* %154 = OpAccessChain %41 %84 
                                  f32 %155 = OpLoad %154 
                                  f32 %156 = OpFMul %155 %112 
                         Private f32* %157 = OpAccessChain %41 %84 
                                               OpStore %157 %156 
                                  f32 %159 = OpLoad %146 
                                  f32 %160 = OpLoad %96 
                                  f32 %161 = OpFMul %159 %160 
                         Private f32* %162 = OpAccessChain %158 %84 
                                               OpStore %162 %161 
                         Private f32* %163 = OpAccessChain %158 %84 
                                  f32 %164 = OpLoad %163 
                                  f32 %166 = OpExtInst %1 40 %164 %165 
                         Private f32* %167 = OpAccessChain %158 %84 
                                               OpStore %167 %166 
                         Private f32* %168 = OpAccessChain %158 %84 
                                  f32 %169 = OpLoad %168 
                                  f32 %170 = OpExtInst %1 37 %169 %46 
                         Private f32* %171 = OpAccessChain %158 %84 
                                               OpStore %171 %170 
                         Private f32* %174 = OpAccessChain %158 %84 
                                  f32 %175 = OpLoad %174 
                                 bool %176 = OpFOrdLessThan %45 %175 
                                  u32 %178 = OpSelect %176 %177 %84 
                                  i32 %179 = OpBitcast %178 
                                               OpStore %173 %179 
                         Private f32* %181 = OpAccessChain %158 %84 
                                  f32 %182 = OpLoad %181 
                                 bool %183 = OpFOrdLessThan %182 %45 
                                  u32 %184 = OpSelect %183 %177 %84 
                                  i32 %185 = OpBitcast %184 
                                               OpStore %180 %185 
                                  i32 %186 = OpLoad %173 
                                  i32 %187 = OpSNegate %186 
                                  i32 %188 = OpLoad %180 
                                  i32 %189 = OpIAdd %187 %188 
                                               OpStore %173 %189 
                                  i32 %191 = OpLoad %173 
                                  f32 %192 = OpConvertSToF %191 
                                               OpStore %190 %192 
                         Private f32* %194 = OpAccessChain %158 %84 
                                  f32 %195 = OpLoad %194 
                                  f32 %197 = OpFMul %195 %196 
                                               OpStore %193 %197 
                                  f32 %198 = OpLoad %193 
                                  f32 %199 = OpLoad %190 
                                  f32 %200 = OpFMul %198 %199 
                                  f32 %201 = OpFAdd %200 %165 
                                               OpStore %190 %201 
                                  f32 %202 = OpLoad %190 
                         Private f32* %203 = OpAccessChain %158 %84 
                                  f32 %204 = OpLoad %203 
                                  f32 %205 = OpFMul %202 %204 
                         Private f32* %206 = OpAccessChain %158 %84 
                                               OpStore %206 %205 
                         Private f32* %207 = OpAccessChain %158 %84 
                                  f32 %208 = OpLoad %207 
                                  f32 %209 = OpLoad %96 
                                  f32 %210 = OpFDiv %208 %209 
                                               OpStore %96 %210 
                                  f32 %211 = OpLoad %96 
                                  f32 %212 = OpLoad %146 
                                  f32 %213 = OpFAdd %211 %212 
                                               OpStore %96 %213 
                                  f32 %214 = OpLoad %96 
                         Uniform f32* %215 = OpAccessChain %17 %100 %78 
                                  f32 %216 = OpLoad %215 
                                  f32 %217 = OpFAdd %214 %216 
                                               OpStore %96 %217 
                                 bool %218 = OpLoad %116 
                                               OpSelectionMerge %222 None 
                                               OpBranchConditional %218 %221 %224 
                                      %221 = OpLabel 
                                  f32 %223 = OpLoad %96 
                                               OpStore %220 %223 
                                               OpBranch %222 
                                      %224 = OpLabel 
                         Private f32* %225 = OpAccessChain %41 %84 
                                  f32 %226 = OpLoad %225 
                                               OpStore %220 %226 
                                               OpBranch %222 
                                      %222 = OpLabel 
                                  f32 %227 = OpLoad %220 
                         Private f32* %228 = OpAccessChain %9 %84 
                                               OpStore %228 %227 
                         Private f32* %229 = OpAccessChain %9 %84 
                                  f32 %230 = OpLoad %229 
                                  f32 %232 = OpFMul %230 %231 
                         Private f32* %233 = OpAccessChain %9 %84 
                                               OpStore %233 %232 
                         Private f32* %237 = OpAccessChain %9 %84 
                                  f32 %238 = OpLoad %237 
                                  u32 %239 = OpConvertFToU %238 
                         Private u32* %241 = OpAccessChain %236 %84 
                                               OpStore %241 %239 
                         Private u32* %242 = OpAccessChain %236 %84 
                                  u32 %243 = OpLoad %242 
                                  u32 %245 = OpBitwiseAnd %243 %244 
                         Private u32* %246 = OpAccessChain %236 %78 
                                               OpStore %246 %245 
                         Private u32* %247 = OpAccessChain %236 %84 
                                  u32 %248 = OpLoad %247 
                                  u32 %250 = OpBitFieldUExtract %248 %249 %249 
                         Private u32* %251 = OpAccessChain %236 %84 
                                               OpStore %251 %250 
                                u32_2 %252 = OpLoad %236 
                                u32_2 %253 = OpVectorShuffle %252 %252 1 0 
                                f32_2 %254 = OpConvertUToF %253 
                                               OpStore %158 %254 
                                f32_2 %257 = OpLoad %158 
                                f32_2 %260 = OpFMul %257 %259 
                                f32_4 %261 = OpLoad %256 
                                f32_4 %262 = OpVectorShuffle %261 %260 4 5 2 3 
                                               OpStore %256 %262 
                                f32_4 %264 = OpLoad %256 
                                f32_4 %265 = OpVectorShuffle %264 %263 0 1 4 5 
                                               OpStore %256 %265 
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
 Pass {
  Name "Smooth Heights"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 229969
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _PCUVToBrushUVScales;
uniform 	vec2 _PCUVToBrushUVOffset;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _BrushParams;
uniform 	vec4 _SmoothWeights;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BrushTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
void main()
{
    u_xlat0.x = 0.0;
    u_xlat0.y = (-_MainTex_TexelSize.y);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat7.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat1 = texture(_MainTex, u_xlat7.xy);
    u_xlat2.xyz = (-_MainTex_TexelSize.xyx);
    u_xlat2.w = 0.0;
    u_xlat2 = u_xlat2.zwxy + vs_TEXCOORD0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat4.xw = _MainTex_TexelSize.xy;
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    u_xlat4 = u_xlat4 + vs_TEXCOORD0.xyxy;
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat6 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat7.x = u_xlat5.x + u_xlat6.x;
    u_xlat7.x = u_xlat3.x + u_xlat7.x;
    u_xlat7.x = u_xlat1.x * 0.75 + u_xlat7.x;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat7.x = u_xlat3.x * 0.75 + u_xlat7.x;
    u_xlat7.x = u_xlat1.x * 0.75 + u_xlat7.x;
    u_xlat7.x = u_xlat2.x * 0.75 + u_xlat7.x;
    u_xlat7.x = u_xlat4.x + u_xlat7.x;
    u_xlat0.x = u_xlat0.x + u_xlat7.x;
    u_xlat0.x = u_xlat0.x * 0.125;
    u_xlat0.y = min(u_xlat6.x, u_xlat0.x);
    u_xlat0.z = max(u_xlat6.x, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xyz, _SmoothWeights.xyz);
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat1 = vs_TEXCOORD0.xxyy * _PCUVToBrushUVScales;
    u_xlat7.xy = u_xlat1.zw + u_xlat1.xy;
    u_xlat7.xy = u_xlat7.xy + _PCUVToBrushUVOffset.xy;
    u_xlat1.xy = u_xlat7.xy;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlatb1.xy = equal(u_xlat7.xyxx, u_xlat1.xyxx).xy;
    u_xlat2 = texture(_BrushTex, u_xlat7.xy);
    u_xlatb7 = u_xlatb1.y && u_xlatb1.x;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat7.x * _BrushParams.x;
    u_xlat7.x = u_xlat2.x * u_xlat7.x;
    SV_Target0 = u_xlat7.xxxx * u_xlat0.xxxx + u_xlat6.xxxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
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
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 444
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %432 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %356 DescriptorSet 356 
                                                      OpDecorate %356 Binding 356 
                                                      OpDecorate %358 DescriptorSet 358 
                                                      OpDecorate %358 Binding 358 
                                                      OpDecorate %432 Location 432 
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
                                              %15 = OpTypeStruct %14 %10 %14 %14 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_2; f32_4; f32_4; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %14 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %43 = OpTypeInt 32 0 
                                          u32 %44 = OpConstant 1 
                                              %45 = OpTypePointer Private %6 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          u32 %50 = OpConstant 0 
                                              %55 = OpTypePointer Private %14 
                               Private f32_4* %56 = OpVariable Private 
                                          f32 %63 = OpConstant 3.674022E-40 
                                          u32 %64 = OpConstant 3 
                                              %71 = OpTypePointer Private %10 
                               Private f32_2* %72 = OpVariable Private 
                                 Private f32* %89 = OpVariable Private 
                                         u32 %109 = OpConstant 2 
                              Private f32_2* %124 = OpVariable Private 
                                Private f32* %132 = OpVariable Private 
                              Private f32_2* %146 = OpVariable Private 
                                         f32 %162 = OpConstant 3.674022E-40 
                                         f32 %181 = OpConstant 3.674022E-40 
                              Private f32_4* %187 = OpVariable Private 
                                         f32 %191 = OpConstant 3.674022E-40 
                                         f32 %192 = OpConstant 3.674022E-40 
                                       f32_4 %193 = OpConstantComposite %191 %192 %192 %191 
                                             %257 = OpTypePointer Uniform %6 
                                         f32 %288 = OpConstant 3.674022E-40 
                                         i32 %304 = OpConstant 4 
                                         i32 %320 = OpConstant 0 
                                         i32 %330 = OpConstant 1 
                                             %331 = OpTypePointer Uniform %10 
                                             %345 = OpTypeBool 
                                             %346 = OpTypeVector %345 2 
                                             %347 = OpTypePointer Private %346 
                             Private bool_2* %348 = OpVariable Private 
                                             %353 = OpTypeVector %345 4 
        UniformConstant read_only Texture2D* %356 = OpVariable UniformConstant 
                    UniformConstant sampler* %358 = OpVariable UniformConstant 
                                             %371 = OpTypePointer Private %345 
                               Private bool* %372 = OpVariable Private 
                                         i32 %381 = OpConstant 3 
                                         f32 %405 = OpConstant 3.674022E-40 
                                             %408 = OpTypeVector %43 2 
                                             %409 = OpTypePointer Private %408 
                              Private u32_2* %410 = OpVariable Private 
                                             %414 = OpTypePointer Private %43 
                                         u32 %418 = OpConstant 255 
                                         i32 %423 = OpConstant 8 
                                             %431 = OpTypePointer Output %14 
                               Output f32_4* %432 = OpVariable Output 
                                         f32 %435 = OpConstant 3.674022E-40 
                                       f32_2 %436 = OpConstantComposite %435 %435 
                                       f32_2 %440 = OpConstantComposite %63 %63 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFAdd %13 %23 
                                        f32_3 %25 = OpLoad %9 
                                        f32_3 %26 = OpVectorShuffle %25 %24 3 4 2 
                                                      OpStore %9 %26 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_3 %37 = OpLoad %9 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                        f32_4 %39 = OpImageSampleImplicitLod %36 %38 
                                        f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32_3 %41 = OpLoad %9 
                                        f32_3 %42 = OpVectorShuffle %41 %40 3 4 2 
                                                      OpStore %9 %42 
                                 Private f32* %46 = OpAccessChain %9 %44 
                                          f32 %47 = OpLoad %46 
                                          f32 %49 = OpFMul %47 %48 
                                 Private f32* %51 = OpAccessChain %9 %50 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %49 %52 
                                 Private f32* %54 = OpAccessChain %9 %50 
                                                      OpStore %54 %53 
                               Uniform f32_4* %57 = OpAccessChain %17 %19 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 0 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_4 %61 = OpLoad %56 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 6 3 
                                                      OpStore %56 %62 
                                 Private f32* %65 = OpAccessChain %56 %64 
                                                      OpStore %65 %63 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %66 2 3 0 1 
                                        f32_2 %68 = OpLoad vs_TEXCOORD0 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 1 0 1 
                                        f32_4 %70 = OpFAdd %67 %69 
                                                      OpStore %56 %70 
                          read_only Texture2D %73 = OpLoad %29 
                                      sampler %74 = OpLoad %33 
                   read_only Texture2DSampled %75 = OpSampledImage %73 %74 
                                        f32_4 %76 = OpLoad %56 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                                      OpStore %72 %79 
                          read_only Texture2D %80 = OpLoad %29 
                                      sampler %81 = OpLoad %33 
                   read_only Texture2DSampled %82 = OpSampledImage %80 %81 
                                        f32_4 %83 = OpLoad %56 
                                        f32_2 %84 = OpVectorShuffle %83 %83 2 3 
                                        f32_4 %85 = OpImageSampleImplicitLod %82 %84 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %56 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                                      OpStore %56 %88 
                                 Private f32* %90 = OpAccessChain %56 %44 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFMul %91 %48 
                                 Private f32* %93 = OpAccessChain %56 %50 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFAdd %92 %94 
                                                      OpStore %89 %95 
                                 Private f32* %96 = OpAccessChain %72 %44 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %97 %48 
                                 Private f32* %99 = OpAccessChain %72 %50 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFAdd %98 %100 
                                Private f32* %102 = OpAccessChain %72 %50 
                                                      OpStore %102 %101 
                              Uniform f32_4* %103 = OpAccessChain %17 %19 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_4 %106 = OpLoad %56 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 1 2 5 
                                                      OpStore %56 %107 
                                Private f32* %108 = OpAccessChain %56 %44 
                                                      OpStore %108 %63 
                                Private f32* %110 = OpAccessChain %56 %109 
                                                      OpStore %110 %63 
                                       f32_4 %111 = OpLoad %56 
                                       f32_2 %112 = OpLoad vs_TEXCOORD0 
                                       f32_4 %113 = OpVectorShuffle %112 %112 0 1 0 1 
                                       f32_4 %114 = OpFAdd %111 %113 
                                                      OpStore %56 %114 
                         read_only Texture2D %115 = OpLoad %29 
                                     sampler %116 = OpLoad %33 
                  read_only Texture2DSampled %117 = OpSampledImage %115 %116 
                                       f32_4 %118 = OpLoad %56 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
                                       f32_4 %122 = OpLoad %56 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 2 3 
                                                      OpStore %56 %123 
                         read_only Texture2D %125 = OpLoad %29 
                                     sampler %126 = OpLoad %33 
                  read_only Texture2DSampled %127 = OpSampledImage %125 %126 
                                       f32_4 %128 = OpLoad %56 
                                       f32_2 %129 = OpVectorShuffle %128 %128 2 3 
                                       f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                                      OpStore %124 %131 
                                Private f32* %133 = OpAccessChain %124 %44 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFMul %134 %48 
                                Private f32* %136 = OpAccessChain %124 %50 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFAdd %135 %137 
                                                      OpStore %132 %138 
                                Private f32* %139 = OpAccessChain %56 %44 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFMul %140 %48 
                                Private f32* %142 = OpAccessChain %56 %50 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFAdd %141 %143 
                                Private f32* %145 = OpAccessChain %56 %50 
                                                      OpStore %145 %144 
                         read_only Texture2D %147 = OpLoad %29 
                                     sampler %148 = OpLoad %33 
                  read_only Texture2DSampled %149 = OpSampledImage %147 %148 
                                       f32_2 %150 = OpLoad vs_TEXCOORD0 
                                       f32_4 %151 = OpImageSampleImplicitLod %149 %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
                                                      OpStore %146 %152 
                                Private f32* %153 = OpAccessChain %146 %44 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFMul %154 %48 
                                Private f32* %156 = OpAccessChain %146 %50 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFAdd %155 %157 
                                Private f32* %159 = OpAccessChain %146 %50 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %146 %50 
                                         f32 %161 = OpLoad %160 
                                         f32 %163 = OpFMul %161 %162 
                                Private f32* %164 = OpAccessChain %124 %50 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %56 %50 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %166 %162 
                                Private f32* %168 = OpAccessChain %124 %50 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFAdd %167 %169 
                                Private f32* %171 = OpAccessChain %56 %50 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %72 %50 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %162 
                                Private f32* %175 = OpAccessChain %56 %50 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFAdd %174 %176 
                                Private f32* %178 = OpAccessChain %72 %50 
                                                      OpStore %178 %177 
                                Private f32* %179 = OpAccessChain %9 %50 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpFMul %180 %181 
                                Private f32* %183 = OpAccessChain %72 %50 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFAdd %182 %184 
                                Private f32* %186 = OpAccessChain %9 %50 
                                                      OpStore %186 %185 
                              Uniform f32_4* %188 = OpAccessChain %17 %19 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpVectorShuffle %189 %189 0 1 0 1 
                                       f32_4 %194 = OpFMul %190 %193 
                                       f32_2 %195 = OpLoad vs_TEXCOORD0 
                                       f32_4 %196 = OpVectorShuffle %195 %195 0 1 0 1 
                                       f32_4 %197 = OpFAdd %194 %196 
                                                      OpStore %187 %197 
                         read_only Texture2D %198 = OpLoad %29 
                                     sampler %199 = OpLoad %33 
                  read_only Texture2DSampled %200 = OpSampledImage %198 %199 
                                       f32_4 %201 = OpLoad %187 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpImageSampleImplicitLod %200 %202 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                       f32_4 %205 = OpLoad %56 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 1 2 5 
                                                      OpStore %56 %206 
                         read_only Texture2D %207 = OpLoad %29 
                                     sampler %208 = OpLoad %33 
                  read_only Texture2DSampled %209 = OpSampledImage %207 %208 
                                       f32_4 %210 = OpLoad %187 
                                       f32_2 %211 = OpVectorShuffle %210 %210 2 3 
                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_4 %214 = OpLoad %187 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 2 3 
                                                      OpStore %187 %215 
                                Private f32* %216 = OpAccessChain %187 %44 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %217 %48 
                                Private f32* %219 = OpAccessChain %187 %50 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFAdd %218 %220 
                                Private f32* %222 = OpAccessChain %72 %50 
                                                      OpStore %222 %221 
                                Private f32* %223 = OpAccessChain %56 %64 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %224 %48 
                                Private f32* %226 = OpAccessChain %56 %50 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpFAdd %225 %227 
                                Private f32* %229 = OpAccessChain %56 %50 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %56 %50 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFMul %231 %181 
                                Private f32* %233 = OpAccessChain %9 %50 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpFAdd %232 %234 
                                Private f32* %236 = OpAccessChain %9 %50 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %72 %50 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFMul %238 %181 
                                Private f32* %240 = OpAccessChain %9 %50 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFAdd %239 %241 
                                Private f32* %243 = OpAccessChain %9 %50 
                                                      OpStore %243 %242 
                                         f32 %244 = OpLoad %89 
                                         f32 %245 = OpFMul %244 %181 
                                Private f32* %246 = OpAccessChain %9 %50 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFAdd %245 %247 
                                Private f32* %249 = OpAccessChain %9 %50 
                                                      OpStore %249 %248 
                                         f32 %250 = OpLoad %132 
                                         f32 %251 = OpFMul %250 %162 
                                Private f32* %252 = OpAccessChain %9 %50 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFAdd %251 %253 
                                Private f32* %255 = OpAccessChain %9 %50 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %187 %50 
                                                      OpStore %256 %63 
                                Uniform f32* %258 = OpAccessChain %17 %19 %44 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFNegate %259 
                                Private f32* %261 = OpAccessChain %187 %44 
                                                      OpStore %261 %260 
                                       f32_4 %262 = OpLoad %187 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_2 %264 = OpLoad vs_TEXCOORD0 
                                       f32_2 %265 = OpFAdd %263 %264 
                                                      OpStore %72 %265 
                         read_only Texture2D %266 = OpLoad %29 
                                     sampler %267 = OpLoad %33 
                  read_only Texture2DSampled %268 = OpSampledImage %266 %267 
                                       f32_2 %269 = OpLoad %72 
                                       f32_4 %270 = OpImageSampleImplicitLod %268 %269 
                                       f32_2 %271 = OpVectorShuffle %270 %270 0 1 
                                                      OpStore %72 %271 
                                Private f32* %272 = OpAccessChain %72 %44 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFMul %273 %48 
                                Private f32* %275 = OpAccessChain %72 %50 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFAdd %274 %276 
                                Private f32* %278 = OpAccessChain %72 %50 
                                                      OpStore %278 %277 
                                Private f32* %279 = OpAccessChain %72 %50 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFMul %280 %162 
                                Private f32* %282 = OpAccessChain %9 %50 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %281 %283 
                                Private f32* %285 = OpAccessChain %9 %50 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %9 %50 
                                         f32 %287 = OpLoad %286 
                                         f32 %289 = OpFMul %287 %288 
                                Private f32* %290 = OpAccessChain %9 %50 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %124 %50 
                                         f32 %292 = OpLoad %291 
                                Private f32* %293 = OpAccessChain %9 %50 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpExtInst %1 37 %292 %294 
                                Private f32* %296 = OpAccessChain %9 %44 
                                                      OpStore %296 %295 
                                Private f32* %297 = OpAccessChain %124 %50 
                                         f32 %298 = OpLoad %297 
                                Private f32* %299 = OpAccessChain %9 %50 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpExtInst %1 40 %298 %300 
                                Private f32* %302 = OpAccessChain %9 %109 
                                                      OpStore %302 %301 
                                       f32_3 %303 = OpLoad %9 
                              Uniform f32_4* %305 = OpAccessChain %17 %304 
                                       f32_4 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 0 1 2 
                                         f32 %308 = OpDot %303 %307 
                                Private f32* %309 = OpAccessChain %9 %50 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %146 %50 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFMul %312 %162 
                                Private f32* %314 = OpAccessChain %9 %50 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFAdd %313 %315 
                                Private f32* %317 = OpAccessChain %9 %50 
                                                      OpStore %317 %316 
                                       f32_2 %318 = OpLoad vs_TEXCOORD0 
                                       f32_4 %319 = OpVectorShuffle %318 %318 0 0 1 1 
                              Uniform f32_4* %321 = OpAccessChain %17 %320 
                                       f32_4 %322 = OpLoad %321 
                                       f32_4 %323 = OpFMul %319 %322 
                                                      OpStore %187 %323 
                                       f32_4 %324 = OpLoad %187 
                                       f32_2 %325 = OpVectorShuffle %324 %324 2 3 
                                       f32_4 %326 = OpLoad %187 
                                       f32_2 %327 = OpVectorShuffle %326 %326 0 1 
                                       f32_2 %328 = OpFAdd %325 %327 
                                                      OpStore %72 %328 
                                       f32_2 %329 = OpLoad %72 
                              Uniform f32_2* %332 = OpAccessChain %17 %330 
                                       f32_2 %333 = OpLoad %332 
                                       f32_2 %334 = OpFAdd %329 %333 
                                                      OpStore %72 %334 
                                       f32_2 %335 = OpLoad %72 
                                       f32_4 %336 = OpLoad %56 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 2 3 
                                                      OpStore %56 %337 
                                       f32_4 %338 = OpLoad %56 
                                       f32_2 %339 = OpVectorShuffle %338 %338 0 1 
                                       f32_2 %340 = OpCompositeConstruct %63 %63 
                                       f32_2 %341 = OpCompositeConstruct %192 %192 
                                       f32_2 %342 = OpExtInst %1 43 %339 %340 %341 
                                       f32_4 %343 = OpLoad %56 
                                       f32_4 %344 = OpVectorShuffle %343 %342 4 5 2 3 
                                                      OpStore %56 %344 
                                       f32_2 %349 = OpLoad %72 
                                       f32_4 %350 = OpVectorShuffle %349 %349 0 1 0 0 
                                       f32_4 %351 = OpLoad %56 
                                       f32_4 %352 = OpVectorShuffle %351 %351 0 1 0 0 
                                      bool_4 %354 = OpFOrdEqual %350 %352 
                                      bool_2 %355 = OpVectorShuffle %354 %354 0 1 
                                                      OpStore %348 %355 
                         read_only Texture2D %357 = OpLoad %356 
                                     sampler %359 = OpLoad %358 
                  read_only Texture2DSampled %360 = OpSampledImage %357 %359 
                                       f32_2 %361 = OpLoad %72 
                                       f32_4 %362 = OpImageSampleImplicitLod %360 %361 
                                       f32_2 %363 = OpVectorShuffle %362 %362 0 1 
                                                      OpStore %72 %363 
                                Private f32* %364 = OpAccessChain %72 %44 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFMul %365 %48 
                                Private f32* %367 = OpAccessChain %72 %50 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFAdd %366 %368 
                                Private f32* %370 = OpAccessChain %72 %50 
                                                      OpStore %370 %369 
                               Private bool* %373 = OpAccessChain %348 %44 
                                        bool %374 = OpLoad %373 
                               Private bool* %375 = OpAccessChain %348 %50 
                                        bool %376 = OpLoad %375 
                                        bool %377 = OpLogicalAnd %374 %376 
                                                      OpStore %372 %377 
                                        bool %378 = OpLoad %372 
                                         f32 %379 = OpSelect %378 %192 %63 
                                                      OpStore %132 %379 
                                         f32 %380 = OpLoad %132 
                                Uniform f32* %382 = OpAccessChain %17 %381 %50 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFMul %380 %383 
                                                      OpStore %132 %384 
                                         f32 %385 = OpLoad %132 
                                Private f32* %386 = OpAccessChain %72 %50 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFMul %385 %387 
                                Private f32* %389 = OpAccessChain %72 %50 
                                                      OpStore %389 %388 
                                Private f32* %390 = OpAccessChain %72 %50 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFMul %391 %162 
                                Private f32* %393 = OpAccessChain %72 %50 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %72 %50 
                                         f32 %395 = OpLoad %394 
                                Private f32* %396 = OpAccessChain %9 %50 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFMul %395 %397 
                                Private f32* %399 = OpAccessChain %124 %50 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpFAdd %398 %400 
                                Private f32* %402 = OpAccessChain %9 %50 
                                                      OpStore %402 %401 
                                Private f32* %403 = OpAccessChain %9 %50 
                                         f32 %404 = OpLoad %403 
                                         f32 %406 = OpFMul %404 %405 
                                Private f32* %407 = OpAccessChain %9 %50 
                                                      OpStore %407 %406 
                                Private f32* %411 = OpAccessChain %9 %50 
                                         f32 %412 = OpLoad %411 
                                         u32 %413 = OpConvertFToU %412 
                                Private u32* %415 = OpAccessChain %410 %50 
                                                      OpStore %415 %413 
                                Private u32* %416 = OpAccessChain %410 %50 
                                         u32 %417 = OpLoad %416 
                                         u32 %419 = OpBitwiseAnd %417 %418 
                                Private u32* %420 = OpAccessChain %410 %44 
                                                      OpStore %420 %419 
                                Private u32* %421 = OpAccessChain %410 %50 
                                         u32 %422 = OpLoad %421 
                                         u32 %424 = OpBitFieldUExtract %422 %423 %423 
                                Private u32* %425 = OpAccessChain %410 %50 
                                                      OpStore %425 %424 
                                       u32_2 %426 = OpLoad %410 
                                       u32_2 %427 = OpVectorShuffle %426 %426 1 0 
                                       f32_2 %428 = OpConvertUToF %427 
                                       f32_4 %429 = OpLoad %56 
                                       f32_4 %430 = OpVectorShuffle %429 %428 4 5 2 3 
                                                      OpStore %56 %430 
                                       f32_4 %433 = OpLoad %56 
                                       f32_2 %434 = OpVectorShuffle %433 %433 0 1 
                                       f32_2 %437 = OpFMul %434 %436 
                                       f32_4 %438 = OpLoad %432 
                                       f32_4 %439 = OpVectorShuffle %438 %437 4 5 2 3 
                                                      OpStore %432 %439 
                                       f32_4 %441 = OpLoad %432 
                                       f32_4 %442 = OpVectorShuffle %441 %440 0 1 4 5 
                                                      OpStore %432 %442 
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
 Pass {
  Name "Paint Texture"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 303487
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _PCUVToBrushUVScales;
uniform 	vec2 _PCUVToBrushUVOffset;
uniform 	vec4 _BrushParams;
UNITY_LOCATION(0) uniform  sampler2D _BrushTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xxyy * _PCUVToBrushUVScales;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + _PCUVToBrushUVOffset.xy;
    u_xlat6.xy = u_xlat0.xy;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlatb6.xy = equal(u_xlat0.xyxy, u_xlat6.xyxy).xy;
    u_xlat1 = texture(_BrushTex, u_xlat0.xy);
    u_xlatb0 = u_xlatb6.y && u_xlatb6.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * _BrushParams.x;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat0.x * u_xlat1.x + u_xlat2.x;
    u_xlat0.x = (-u_xlat0.x) * u_xlat1.x + u_xlat2.x;
    u_xlatb6.x = u_xlat2.x<_BrushParams.y;
    u_xlat0.x = max(u_xlat0.x, _BrushParams.y);
    u_xlat3 = min(u_xlat3, _BrushParams.y);
    SV_Target0 = (u_xlatb6.x) ? vec4(u_xlat3) : u_xlat0.xxxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
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
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 162
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %149 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpMemberDecorate %15 0 Offset 15 
                                               OpMemberDecorate %15 1 Offset 15 
                                               OpMemberDecorate %15 2 Offset 15 
                                               OpDecorate %15 Block 
                                               OpDecorate %17 DescriptorSet 17 
                                               OpDecorate %17 Binding 17 
                                               OpDecorate %63 DescriptorSet 63 
                                               OpDecorate %63 Binding 63 
                                               OpDecorate %67 DescriptorSet 67 
                                               OpDecorate %67 Binding 67 
                                               OpDecorate %110 DescriptorSet 110 
                                               OpDecorate %110 Binding 110 
                                               OpDecorate %112 DescriptorSet 112 
                                               OpDecorate %112 Binding 112 
                                               OpDecorate %149 Location 149 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       %15 = OpTypeStruct %7 %10 %7 
                                       %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_2; f32_4;}* %17 = OpVariable Uniform 
                                       %18 = OpTypeInt 32 1 
                                   i32 %19 = OpConstant 0 
                                       %20 = OpTypePointer Uniform %7 
                                   i32 %33 = OpConstant 1 
                                       %34 = OpTypePointer Uniform %10 
                                       %40 = OpTypePointer Private %10 
                        Private f32_2* %41 = OpVariable Private 
                                   f32 %45 = OpConstant 3.674022E-40 
                                   f32 %46 = OpConstant 3.674022E-40 
                                       %50 = OpTypeBool 
                                       %51 = OpTypeVector %50 2 
                                       %52 = OpTypePointer Private %51 
                       Private bool_2* %53 = OpVariable Private 
                                       %58 = OpTypeVector %50 4 
                                       %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %62 = OpTypePointer UniformConstant %61 
  UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                       %65 = OpTypeSampler 
                                       %66 = OpTypePointer UniformConstant %65 
              UniformConstant sampler* %67 = OpVariable UniformConstant 
                                       %69 = OpTypeSampledImage %61 
                                       %77 = OpTypeInt 32 0 
                                   u32 %78 = OpConstant 1 
                                       %79 = OpTypePointer Private %6 
                                   f32 %82 = OpConstant 3.674022E-40 
                                   u32 %84 = OpConstant 0 
                                       %89 = OpTypePointer Private %50 
                         Private bool* %90 = OpVariable Private 
                          Private f32* %96 = OpVariable Private 
                                  i32 %100 = OpConstant 2 
                                      %101 = OpTypePointer Uniform %6 
 UniformConstant read_only Texture2D* %110 = OpVariable UniformConstant 
             UniformConstant sampler* %112 = OpVariable UniformConstant 
                                  f32 %120 = OpConstant 3.674022E-40 
                                      %148 = OpTypePointer Output %7 
                        Output f32_4* %149 = OpVariable Output 
                                      %151 = OpTypePointer Function %7 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                      Function f32_4* %152 = OpVariable Function 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_4 %14 = OpVectorShuffle %13 %13 0 0 1 1 
                        Uniform f32_4* %21 = OpAccessChain %17 %19 
                                 f32_4 %22 = OpLoad %21 
                                 f32_4 %23 = OpFMul %14 %22 
                                               OpStore %9 %23 
                                 f32_4 %24 = OpLoad %9 
                                 f32_2 %25 = OpVectorShuffle %24 %24 2 3 
                                 f32_4 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpFAdd %25 %27 
                                 f32_4 %29 = OpLoad %9 
                                 f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                               OpStore %9 %30 
                                 f32_4 %31 = OpLoad %9 
                                 f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                        Uniform f32_2* %35 = OpAccessChain %17 %33 
                                 f32_2 %36 = OpLoad %35 
                                 f32_2 %37 = OpFAdd %32 %36 
                                 f32_4 %38 = OpLoad %9 
                                 f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                               OpStore %9 %39 
                                 f32_4 %42 = OpLoad %9 
                                 f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                               OpStore %41 %43 
                                 f32_2 %44 = OpLoad %41 
                                 f32_2 %47 = OpCompositeConstruct %45 %45 
                                 f32_2 %48 = OpCompositeConstruct %46 %46 
                                 f32_2 %49 = OpExtInst %1 43 %44 %47 %48 
                                               OpStore %41 %49 
                                 f32_4 %54 = OpLoad %9 
                                 f32_4 %55 = OpVectorShuffle %54 %54 0 1 0 1 
                                 f32_2 %56 = OpLoad %41 
                                 f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                                bool_4 %59 = OpFOrdEqual %55 %57 
                                bool_2 %60 = OpVectorShuffle %59 %59 0 1 
                                               OpStore %53 %60 
                   read_only Texture2D %64 = OpLoad %63 
                               sampler %68 = OpLoad %67 
            read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                                 f32_4 %71 = OpLoad %9 
                                 f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                 f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 f32_4 %75 = OpLoad %9 
                                 f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
                                               OpStore %9 %76 
                          Private f32* %80 = OpAccessChain %9 %78 
                                   f32 %81 = OpLoad %80 
                                   f32 %83 = OpFMul %81 %82 
                          Private f32* %85 = OpAccessChain %9 %84 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFAdd %83 %86 
                          Private f32* %88 = OpAccessChain %9 %84 
                                               OpStore %88 %87 
                         Private bool* %91 = OpAccessChain %53 %78 
                                  bool %92 = OpLoad %91 
                         Private bool* %93 = OpAccessChain %53 %84 
                                  bool %94 = OpLoad %93 
                                  bool %95 = OpLogicalAnd %92 %94 
                                               OpStore %90 %95 
                                  bool %97 = OpLoad %90 
                                   f32 %98 = OpSelect %97 %46 %45 
                                               OpStore %96 %98 
                                   f32 %99 = OpLoad %96 
                         Uniform f32* %102 = OpAccessChain %17 %100 %84 
                                  f32 %103 = OpLoad %102 
                                  f32 %104 = OpFMul %99 %103 
                                               OpStore %96 %104 
                                  f32 %105 = OpLoad %96 
                         Private f32* %106 = OpAccessChain %9 %84 
                                  f32 %107 = OpLoad %106 
                                  f32 %108 = OpFMul %105 %107 
                         Private f32* %109 = OpAccessChain %9 %84 
                                               OpStore %109 %108 
                  read_only Texture2D %111 = OpLoad %110 
                              sampler %113 = OpLoad %112 
           read_only Texture2DSampled %114 = OpSampledImage %111 %113 
                                f32_2 %115 = OpLoad vs_TEXCOORD0 
                                f32_4 %116 = OpImageSampleImplicitLod %114 %115 
                                  f32 %117 = OpCompositeExtract %116 0 
                                               OpStore %96 %117 
                         Private f32* %118 = OpAccessChain %9 %84 
                                  f32 %119 = OpLoad %118 
                                  f32 %121 = OpFMul %119 %120 
                                  f32 %122 = OpLoad %96 
                                  f32 %123 = OpFAdd %121 %122 
                         Private f32* %124 = OpAccessChain %41 %84 
                                               OpStore %124 %123 
                         Private f32* %125 = OpAccessChain %9 %84 
                                  f32 %126 = OpLoad %125 
                                  f32 %127 = OpFNegate %126 
                                  f32 %128 = OpFMul %127 %120 
                                  f32 %129 = OpLoad %96 
                                  f32 %130 = OpFAdd %128 %129 
                         Private f32* %131 = OpAccessChain %9 %84 
                                               OpStore %131 %130 
                                  f32 %132 = OpLoad %96 
                         Uniform f32* %133 = OpAccessChain %17 %100 %78 
                                  f32 %134 = OpLoad %133 
                                 bool %135 = OpFOrdLessThan %132 %134 
                                               OpStore %90 %135 
                         Private f32* %136 = OpAccessChain %9 %84 
                                  f32 %137 = OpLoad %136 
                         Uniform f32* %138 = OpAccessChain %17 %100 %78 
                                  f32 %139 = OpLoad %138 
                                  f32 %140 = OpExtInst %1 40 %137 %139 
                         Private f32* %141 = OpAccessChain %9 %84 
                                               OpStore %141 %140 
                         Private f32* %142 = OpAccessChain %41 %84 
                                  f32 %143 = OpLoad %142 
                         Uniform f32* %144 = OpAccessChain %17 %100 %78 
                                  f32 %145 = OpLoad %144 
                                  f32 %146 = OpExtInst %1 37 %143 %145 
                         Private f32* %147 = OpAccessChain %41 %84 
                                               OpStore %147 %146 
                                 bool %150 = OpLoad %90 
                                               OpSelectionMerge %154 None 
                                               OpBranchConditional %150 %153 %157 
                                      %153 = OpLabel 
                                f32_2 %155 = OpLoad %41 
                                f32_4 %156 = OpVectorShuffle %155 %155 0 0 0 0 
                                               OpStore %152 %156 
                                               OpBranch %154 
                                      %157 = OpLabel 
                                f32_4 %158 = OpLoad %9 
                                f32_4 %159 = OpVectorShuffle %158 %158 0 0 0 0 
                                               OpStore %152 %159 
                                               OpBranch %154 
                                      %154 = OpLabel 
                                f32_4 %160 = OpLoad %152 
                                               OpStore %149 %160 
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
 Pass {
  Name "Paint Holes"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 334029
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _PCUVToBrushUVScales;
uniform 	vec2 _PCUVToBrushUVOffset;
uniform 	vec4 _BrushParams;
UNITY_LOCATION(0) uniform  sampler2D _BrushTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
int u_xlati2;
vec2 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xxyy * _PCUVToBrushUVScales;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + _PCUVToBrushUVOffset.xy;
    u_xlat4.xy = u_xlat0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlatb4.xy = equal(u_xlat0.xyxy, u_xlat4.xyxy).xy;
    u_xlat1 = texture(_BrushTex, u_xlat0.xy);
    u_xlatb0 = u_xlatb4.y && u_xlatb4.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * _BrushParams.x;
    u_xlati2 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati4 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
    u_xlatb0 = u_xlat0.x<u_xlat1.x;
    u_xlati2 = (-u_xlati2) + u_xlati4;
    u_xlat2 = float(u_xlati2);
    u_xlat0.x = u_xlatb0 ? u_xlat2 : float(0.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat0.xxxx + u_xlat1.xxxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
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
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 159
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %152 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpMemberDecorate %15 0 Offset 15 
                                               OpMemberDecorate %15 1 Offset 15 
                                               OpMemberDecorate %15 2 Offset 15 
                                               OpDecorate %15 Block 
                                               OpDecorate %17 DescriptorSet 17 
                                               OpDecorate %17 Binding 17 
                                               OpDecorate %63 DescriptorSet 63 
                                               OpDecorate %63 Binding 63 
                                               OpDecorate %67 DescriptorSet 67 
                                               OpDecorate %67 Binding 67 
                                               OpDecorate %143 DescriptorSet 143 
                                               OpDecorate %143 Binding 143 
                                               OpDecorate %145 DescriptorSet 145 
                                               OpDecorate %145 Binding 145 
                                               OpDecorate %152 Location 152 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       %15 = OpTypeStruct %7 %10 %7 
                                       %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_2; f32_4;}* %17 = OpVariable Uniform 
                                       %18 = OpTypeInt 32 1 
                                   i32 %19 = OpConstant 0 
                                       %20 = OpTypePointer Uniform %7 
                                   i32 %33 = OpConstant 1 
                                       %34 = OpTypePointer Uniform %10 
                                       %40 = OpTypePointer Private %10 
                        Private f32_2* %41 = OpVariable Private 
                                   f32 %45 = OpConstant 3.674022E-40 
                                   f32 %46 = OpConstant 3.674022E-40 
                                       %50 = OpTypeBool 
                                       %51 = OpTypeVector %50 2 
                                       %52 = OpTypePointer Private %51 
                       Private bool_2* %53 = OpVariable Private 
                                       %58 = OpTypeVector %50 4 
                                       %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %62 = OpTypePointer UniformConstant %61 
  UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
                                       %65 = OpTypeSampler 
                                       %66 = OpTypePointer UniformConstant %65 
              UniformConstant sampler* %67 = OpVariable UniformConstant 
                                       %69 = OpTypeSampledImage %61 
                                       %77 = OpTypeInt 32 0 
                                   u32 %78 = OpConstant 1 
                                       %79 = OpTypePointer Private %6 
                                   f32 %82 = OpConstant 3.674022E-40 
                                   u32 %84 = OpConstant 0 
                                   f32 %91 = OpConstant 3.674022E-40 
                                       %94 = OpTypePointer Private %50 
                         Private bool* %95 = OpVariable Private 
                         Private f32* %101 = OpVariable Private 
                                  i32 %105 = OpConstant 2 
                                      %106 = OpTypePointer Uniform %6 
                        Private bool* %115 = OpVariable Private 
                                      %121 = OpTypePointer Private %18 
                         Private i32* %122 = OpVariable Private 
                                  u32 %125 = OpConstant 4294967295 
                         Private i32* %128 = OpVariable Private 
 UniformConstant read_only Texture2D* %143 = OpVariable UniformConstant 
             UniformConstant sampler* %145 = OpVariable UniformConstant 
                                      %151 = OpTypePointer Output %7 
                        Output f32_4* %152 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_4 %14 = OpVectorShuffle %13 %13 0 0 1 1 
                        Uniform f32_4* %21 = OpAccessChain %17 %19 
                                 f32_4 %22 = OpLoad %21 
                                 f32_4 %23 = OpFMul %14 %22 
                                               OpStore %9 %23 
                                 f32_4 %24 = OpLoad %9 
                                 f32_2 %25 = OpVectorShuffle %24 %24 2 3 
                                 f32_4 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpFAdd %25 %27 
                                 f32_4 %29 = OpLoad %9 
                                 f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                               OpStore %9 %30 
                                 f32_4 %31 = OpLoad %9 
                                 f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                        Uniform f32_2* %35 = OpAccessChain %17 %33 
                                 f32_2 %36 = OpLoad %35 
                                 f32_2 %37 = OpFAdd %32 %36 
                                 f32_4 %38 = OpLoad %9 
                                 f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                               OpStore %9 %39 
                                 f32_4 %42 = OpLoad %9 
                                 f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                               OpStore %41 %43 
                                 f32_2 %44 = OpLoad %41 
                                 f32_2 %47 = OpCompositeConstruct %45 %45 
                                 f32_2 %48 = OpCompositeConstruct %46 %46 
                                 f32_2 %49 = OpExtInst %1 43 %44 %47 %48 
                                               OpStore %41 %49 
                                 f32_4 %54 = OpLoad %9 
                                 f32_4 %55 = OpVectorShuffle %54 %54 0 1 0 1 
                                 f32_2 %56 = OpLoad %41 
                                 f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                                bool_4 %59 = OpFOrdEqual %55 %57 
                                bool_2 %60 = OpVectorShuffle %59 %59 0 1 
                                               OpStore %53 %60 
                   read_only Texture2D %64 = OpLoad %63 
                               sampler %68 = OpLoad %67 
            read_only Texture2DSampled %70 = OpSampledImage %64 %68 
                                 f32_4 %71 = OpLoad %9 
                                 f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 f32_4 %73 = OpImageSampleImplicitLod %70 %72 
                                 f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 f32_4 %75 = OpLoad %9 
                                 f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
                                               OpStore %9 %76 
                          Private f32* %80 = OpAccessChain %9 %78 
                                   f32 %81 = OpLoad %80 
                                   f32 %83 = OpFMul %81 %82 
                          Private f32* %85 = OpAccessChain %9 %84 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFAdd %83 %86 
                          Private f32* %88 = OpAccessChain %9 %84 
                                               OpStore %88 %87 
                          Private f32* %89 = OpAccessChain %9 %84 
                                   f32 %90 = OpLoad %89 
                                   f32 %92 = OpFMul %90 %91 
                          Private f32* %93 = OpAccessChain %9 %84 
                                               OpStore %93 %92 
                         Private bool* %96 = OpAccessChain %53 %78 
                                  bool %97 = OpLoad %96 
                         Private bool* %98 = OpAccessChain %53 %84 
                                  bool %99 = OpLoad %98 
                                 bool %100 = OpLogicalAnd %97 %99 
                                               OpStore %95 %100 
                                 bool %102 = OpLoad %95 
                                  f32 %103 = OpSelect %102 %46 %45 
                                               OpStore %101 %103 
                                  f32 %104 = OpLoad %101 
                         Uniform f32* %107 = OpAccessChain %17 %105 %84 
                                  f32 %108 = OpLoad %107 
                                  f32 %109 = OpFMul %104 %108 
                                               OpStore %101 %109 
                                  f32 %110 = OpLoad %101 
                                  f32 %111 = OpExtInst %1 4 %110 
                                  f32 %112 = OpFNegate %111 
                                  f32 %113 = OpFAdd %112 %46 
                         Private f32* %114 = OpAccessChain %41 %84 
                                               OpStore %114 %113 
                         Private f32* %116 = OpAccessChain %41 %84 
                                  f32 %117 = OpLoad %116 
                         Private f32* %118 = OpAccessChain %9 %84 
                                  f32 %119 = OpLoad %118 
                                 bool %120 = OpFOrdLessThan %117 %119 
                                               OpStore %115 %120 
                                  f32 %123 = OpLoad %101 
                                 bool %124 = OpFOrdLessThan %45 %123 
                                  u32 %126 = OpSelect %124 %125 %84 
                                  i32 %127 = OpBitcast %126 
                                               OpStore %122 %127 
                                  f32 %129 = OpLoad %101 
                                 bool %130 = OpFOrdLessThan %129 %45 
                                  u32 %131 = OpSelect %130 %125 %84 
                                  i32 %132 = OpBitcast %131 
                                               OpStore %128 %132 
                                  i32 %133 = OpLoad %122 
                                  i32 %134 = OpSNegate %133 
                                  i32 %135 = OpLoad %128 
                                  i32 %136 = OpIAdd %134 %135 
                                               OpStore %128 %136 
                                  i32 %137 = OpLoad %128 
                                  f32 %138 = OpConvertSToF %137 
                                               OpStore %101 %138 
                                 bool %139 = OpLoad %115 
                                  f32 %140 = OpLoad %101 
                                  f32 %141 = OpSelect %139 %140 %45 
                         Private f32* %142 = OpAccessChain %9 %84 
                                               OpStore %142 %141 
                  read_only Texture2D %144 = OpLoad %143 
                              sampler %146 = OpLoad %145 
           read_only Texture2DSampled %147 = OpSampledImage %144 %146 
                                f32_2 %148 = OpLoad vs_TEXCOORD0 
                                f32_4 %149 = OpImageSampleImplicitLod %147 %148 
                                  f32 %150 = OpCompositeExtract %149 0 
                                               OpStore %101 %150 
                                f32_4 %153 = OpLoad %9 
                                f32_4 %154 = OpVectorShuffle %153 %153 0 0 0 0 
                                  f32 %155 = OpLoad %101 
                                f32_4 %156 = OpCompositeConstruct %155 %155 %155 %155 
                                f32_4 %157 = OpFAdd %154 %156 
                                               OpStore %152 %157 
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