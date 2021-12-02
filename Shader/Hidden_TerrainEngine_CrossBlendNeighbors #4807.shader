//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/CrossBlendNeighbors" {
Properties {
_TopTex ("Top Texture", any) = "black" { }
_BottomTex ("Bottom Texture", any) = "black" { }
_LeftTex ("Left Texture", any) = "black" { }
_RightTex ("Right Texture", any) = "black" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 10365
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
uniform 	vec4 _TexCoordOffsetScale;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy + _TexCoordOffsetScale.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _TexCoordOffsetScale.zw;
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
uniform 	vec4 _Offsets;
uniform 	vec4 _SlopeEnableFlags;
uniform 	float _AddressMode;
UNITY_LOCATION(0) uniform  sampler2D _LeftTex;
UNITY_LOCATION(1) uniform  sampler2D _RightTex;
UNITY_LOCATION(2) uniform  sampler2D _BottomTex;
UNITY_LOCATION(3) uniform  sampler2D _TopTex;
in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat8;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.yx) + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_AddressMode);
    u_xlat0.zw = vs_TEXCOORD0.xy;
    u_xlat1 = texture(_TopTex, u_xlat0.zx);
    u_xlat0 = texture(_RightTex, u_xlat0.yw);
    u_xlat1.w = u_xlat0.x;
    u_xlat0 = textureLod(_LeftTex, vec2(1.0, 1.0), 0.0);
    u_xlat2 = textureLod(_RightTex, vec2(0.0, 1.0), 0.0);
    u_xlat0.y = u_xlat2.x;
    u_xlat0.xy = u_xlat0.xy + _Offsets.zw;
    u_xlat0.xy = _SlopeEnableFlags.yy * u_xlat0.xy + _Offsets.yy;
    u_xlat5 = (-u_xlat0.x) + u_xlat0.y;
    u_xlat2.yz = vs_TEXCOORD0.wz;
    u_xlat2.yz = clamp(u_xlat2.yz, 0.0, 1.0);
    u_xlat0.x = u_xlat2.z * u_xlat5 + u_xlat0.x;
    u_xlat3 = textureLod(_LeftTex, vec2(1.0, 0.0), 0.0);
    u_xlat4 = textureLod(_RightTex, vec2(0.0, 0.0), 0.0);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.xy = u_xlat3.xy + _Offsets.zw;
    u_xlat3.xy = _SlopeEnableFlags.xx * u_xlat3.xy + _Offsets.xx;
    u_xlat8 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat0.y = u_xlat2.z * u_xlat8 + u_xlat3.x;
    u_xlat3 = textureLod(_BottomTex, vec2(0.0, 1.0), 0.0);
    u_xlat4 = textureLod(_TopTex, vec2(0.0, 0.0), 0.0);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.xy = u_xlat3.xy + _Offsets.xy;
    u_xlat3.xy = _SlopeEnableFlags.zz * u_xlat3.xy + _Offsets.zz;
    u_xlat8 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat0.z = u_xlat2.y * u_xlat8 + u_xlat3.x;
    u_xlat3 = textureLod(_BottomTex, vec2(1.0, 1.0), 0.0);
    u_xlat4 = textureLod(_TopTex, vec2(1.0, 0.0), 0.0);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.xy = u_xlat3.xy + _Offsets.xy;
    u_xlat3.xy = _SlopeEnableFlags.ww * u_xlat3.xy + _Offsets.ww;
    u_xlat8 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat0.w = u_xlat2.y * u_xlat8 + u_xlat3.x;
    u_xlat3.xy = (-vs_TEXCOORD0.yx) * vec2(_AddressMode) + vec2(1.0, 1.0);
    u_xlat3.zw = vs_TEXCOORD0.xy;
    u_xlat4 = texture(_BottomTex, u_xlat3.zx);
    u_xlat3 = texture(_LeftTex, u_xlat3.yw);
    u_xlat1.z = u_xlat3.x;
    u_xlat1.y = u_xlat4.x;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.xw = (-u_xlat2.yz) + vec2(1.0, 1.0);
    u_xlat1 = max(u_xlat2, vec4(1.00000001e-07, 1.00000001e-07, 1.00000001e-07, 1.00000001e-07));
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2.x = dot(u_xlat1, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    SV_Target0 = vec4(dot(u_xlat0, u_xlat1));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %92 
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
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 92 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                            %104 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                              Uniform f32_4* %86 = OpAccessChain %20 %35 
                                       f32_4 %87 = OpLoad %86 
                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                       f32_2 %89 = OpFAdd %85 %88 
                                       f32_4 %90 = OpLoad %9 
                                       f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                     OpStore %9 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFMul %94 %97 
                                       f32_4 %99 = OpLoad vs_TEXCOORD0 
                                      f32_4 %100 = OpVectorShuffle %99 %98 0 1 4 5 
                                                     OpStore vs_TEXCOORD0 %100 
                                      f32_2 %101 = OpLoad %84 
                                      f32_4 %102 = OpLoad vs_TEXCOORD0 
                                      f32_4 %103 = OpVectorShuffle %102 %101 4 5 2 3 
                                                     OpStore vs_TEXCOORD0 %103 
                                Output f32* %105 = OpAccessChain %72 %22 %68 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 494
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %483 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %23 0 Offset 23 
                                              OpMemberDecorate %23 1 Offset 23 
                                              OpMemberDecorate %23 2 Offset 23 
                                              OpDecorate %23 Block 
                                              OpDecorate %25 DescriptorSet 25 
                                              OpDecorate %25 Binding 25 
                                              OpDecorate %41 DescriptorSet 41 
                                              OpDecorate %41 Binding 41 
                                              OpDecorate %45 DescriptorSet 45 
                                              OpDecorate %45 Binding 45 
                                              OpDecorate %58 DescriptorSet 58 
                                              OpDecorate %58 Binding 58 
                                              OpDecorate %60 DescriptorSet 60 
                                              OpDecorate %60 Binding 60 
                                              OpDecorate %111 DescriptorSet 111 
                                              OpDecorate %111 Binding 111 
                                              OpDecorate %113 DescriptorSet 113 
                                              OpDecorate %113 Binding 113 
                                              OpDecorate %122 DescriptorSet 122 
                                              OpDecorate %122 Binding 122 
                                              OpDecorate %124 DescriptorSet 124 
                                              OpDecorate %124 Binding 124 
                                              OpDecorate %483 Location 483 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                      %12 = OpTypeVector %6 2 
                                  f32 %16 = OpConstant 3.674022E-40 
                                f32_2 %17 = OpConstantComposite %16 %16 
                                      %23 = OpTypeStruct %7 %7 %6 
                                      %24 = OpTypePointer Uniform %23 
 Uniform struct {f32_4; f32_4; f32;}* %25 = OpVariable Uniform 
                                      %26 = OpTypeInt 32 1 
                                  i32 %27 = OpConstant 2 
                                      %28 = OpTypePointer Uniform %6 
                                      %39 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %40 = OpTypePointer UniformConstant %39 
 UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
                                      %43 = OpTypeSampler 
                                      %44 = OpTypePointer UniformConstant %43 
             UniformConstant sampler* %45 = OpVariable UniformConstant 
                                      %47 = OpTypeSampledImage %39 
                                      %55 = OpTypeVector %6 3 
                                      %56 = OpTypePointer Private %55 
                       Private f32_3* %57 = OpVariable Private 
 UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
             UniformConstant sampler* %60 = OpVariable UniformConstant 
                                      %69 = OpTypeInt 32 0 
                                  u32 %70 = OpConstant 2 
                                      %71 = OpTypePointer Private %6 
                                  f32 %74 = OpConstant 3.674022E-40 
                                  u32 %76 = OpConstant 0 
                                  u32 %80 = OpConstant 1 
                       Private f32_4* %89 = OpVariable Private 
                                  f32 %92 = OpConstant 3.674022E-40 
                                f32_2 %93 = OpConstantComposite %92 %92 
UniformConstant read_only Texture2D* %111 = OpVariable UniformConstant 
            UniformConstant sampler* %113 = OpVariable UniformConstant 
UniformConstant read_only Texture2D* %122 = OpVariable UniformConstant 
            UniformConstant sampler* %124 = OpVariable UniformConstant 
                                 f32 %155 = OpConstant 3.674022E-40 
                                     %171 = OpTypePointer Private %12 
                      Private f32_2* %172 = OpVariable Private 
                               f32_2 %176 = OpConstantComposite %155 %16 
                                 i32 %192 = OpConstant 0 
                                     %193 = OpTypePointer Uniform %7 
                                 i32 %200 = OpConstant 1 
                      Private f32_4* %220 = OpVariable Private 
                      Private f32_2* %241 = OpVariable Private 
                               f32_2 %245 = OpConstantComposite %16 %155 
                      Private f32_2* %259 = OpVariable Private 
                               f32_2 %263 = OpConstantComposite %155 %155 
                        Private f32* %291 = OpVariable Private 
                                 u32 %425 = OpConstant 3 
                                 f32 %437 = OpConstant 3.674022E-40 
                               f32_4 %438 = OpConstantComposite %437 %437 %437 %437 
                               f32_4 %440 = OpConstantComposite %16 %16 %16 %16 
                                 f32 %456 = OpConstant 3.674022E-40 
                                     %459 = OpTypeVector %69 2 
                                     %460 = OpTypePointer Private %459 
                      Private u32_2* %461 = OpVariable Private 
                                     %465 = OpTypePointer Private %69 
                                 u32 %469 = OpConstant 255 
                                 i32 %474 = OpConstant 8 
                                     %482 = OpTypePointer Output %7 
                       Output f32_4* %483 = OpVariable Output 
                                 f32 %486 = OpConstant 3.674022E-40 
                               f32_2 %487 = OpConstantComposite %486 %486 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %13 = OpLoad vs_TEXCOORD0 
                                f32_2 %14 = OpVectorShuffle %13 %13 1 0 
                                f32_2 %15 = OpFNegate %14 
                                f32_2 %18 = OpFAdd %15 %17 
                                f32_4 %19 = OpLoad %9 
                                f32_4 %20 = OpVectorShuffle %19 %18 4 5 2 3 
                                              OpStore %9 %20 
                                f32_4 %21 = OpLoad %9 
                                f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                         Uniform f32* %29 = OpAccessChain %25 %27 
                                  f32 %30 = OpLoad %29 
                                f32_2 %31 = OpCompositeConstruct %30 %30 
                                f32_2 %32 = OpFMul %22 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
                                              OpStore %9 %34 
                                f32_4 %35 = OpLoad vs_TEXCOORD0 
                                f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                                f32_4 %37 = OpLoad %9 
                                f32_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                              OpStore %9 %38 
                  read_only Texture2D %42 = OpLoad %41 
                              sampler %46 = OpLoad %45 
           read_only Texture2DSampled %48 = OpSampledImage %42 %46 
                                f32_4 %49 = OpLoad %9 
                                f32_2 %50 = OpVectorShuffle %49 %49 2 0 
                                f32_4 %51 = OpImageSampleImplicitLod %48 %50 
                                f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                                f32_4 %53 = OpLoad %9 
                                f32_4 %54 = OpVectorShuffle %53 %52 4 1 5 3 
                                              OpStore %9 %54 
                  read_only Texture2D %59 = OpLoad %58 
                              sampler %61 = OpLoad %60 
           read_only Texture2DSampled %62 = OpSampledImage %59 %61 
                                f32_4 %63 = OpLoad %9 
                                f32_2 %64 = OpVectorShuffle %63 %63 1 3 
                                f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                f32_2 %66 = OpVectorShuffle %65 %65 0 1 
                                f32_3 %67 = OpLoad %57 
                                f32_3 %68 = OpVectorShuffle %67 %66 3 1 4 
                                              OpStore %57 %68 
                         Private f32* %72 = OpAccessChain %57 %70 
                                  f32 %73 = OpLoad %72 
                                  f32 %75 = OpFMul %73 %74 
                         Private f32* %77 = OpAccessChain %57 %76 
                                  f32 %78 = OpLoad %77 
                                  f32 %79 = OpFAdd %75 %78 
                         Private f32* %81 = OpAccessChain %9 %80 
                                              OpStore %81 %79 
                         Private f32* %82 = OpAccessChain %9 %70 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpFMul %83 %74 
                         Private f32* %85 = OpAccessChain %9 %76 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpFAdd %84 %86 
                         Private f32* %88 = OpAccessChain %9 %76 
                                              OpStore %88 %87 
                                f32_4 %90 = OpLoad %9 
                                f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                f32_2 %94 = OpFMul %91 %93 
                                f32_4 %95 = OpLoad %89 
                                f32_4 %96 = OpVectorShuffle %95 %94 4 1 2 5 
                                              OpStore %89 %96 
                                f32_4 %97 = OpLoad vs_TEXCOORD0 
                                f32_2 %98 = OpVectorShuffle %97 %97 1 0 
                                f32_2 %99 = OpFNegate %98 
                        Uniform f32* %100 = OpAccessChain %25 %27 
                                 f32 %101 = OpLoad %100 
                               f32_2 %102 = OpCompositeConstruct %101 %101 
                               f32_2 %103 = OpFMul %99 %102 
                               f32_2 %104 = OpFAdd %103 %17 
                               f32_4 %105 = OpLoad %9 
                               f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                              OpStore %9 %106 
                               f32_4 %107 = OpLoad vs_TEXCOORD0 
                               f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                               f32_4 %109 = OpLoad %9 
                               f32_4 %110 = OpVectorShuffle %109 %108 0 1 4 5 
                                              OpStore %9 %110 
                 read_only Texture2D %112 = OpLoad %111 
                             sampler %114 = OpLoad %113 
          read_only Texture2DSampled %115 = OpSampledImage %112 %114 
                               f32_4 %116 = OpLoad %9 
                               f32_2 %117 = OpVectorShuffle %116 %116 2 0 
                               f32_4 %118 = OpImageSampleImplicitLod %115 %117 
                               f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                               f32_4 %120 = OpLoad %9 
                               f32_4 %121 = OpVectorShuffle %120 %119 4 1 5 3 
                                              OpStore %9 %121 
                 read_only Texture2D %123 = OpLoad %122 
                             sampler %125 = OpLoad %124 
          read_only Texture2DSampled %126 = OpSampledImage %123 %125 
                               f32_4 %127 = OpLoad %9 
                               f32_2 %128 = OpVectorShuffle %127 %127 1 3 
                               f32_4 %129 = OpImageSampleImplicitLod %126 %128 
                               f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                               f32_3 %131 = OpLoad %57 
                               f32_3 %132 = OpVectorShuffle %131 %130 3 1 4 
                                              OpStore %57 %132 
                        Private f32* %133 = OpAccessChain %57 %70 
                                 f32 %134 = OpLoad %133 
                                 f32 %135 = OpFMul %134 %74 
                        Private f32* %136 = OpAccessChain %57 %76 
                                 f32 %137 = OpLoad %136 
                                 f32 %138 = OpFAdd %135 %137 
                        Private f32* %139 = OpAccessChain %9 %80 
                                              OpStore %139 %138 
                        Private f32* %140 = OpAccessChain %9 %70 
                                 f32 %141 = OpLoad %140 
                                 f32 %142 = OpFMul %141 %74 
                        Private f32* %143 = OpAccessChain %9 %76 
                                 f32 %144 = OpLoad %143 
                                 f32 %145 = OpFAdd %142 %144 
                        Private f32* %146 = OpAccessChain %9 %76 
                                              OpStore %146 %145 
                               f32_4 %147 = OpLoad %9 
                               f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                               f32_2 %149 = OpFMul %148 %93 
                               f32_4 %150 = OpLoad %89 
                               f32_4 %151 = OpVectorShuffle %150 %149 0 4 5 3 
                                              OpStore %89 %151 
                 read_only Texture2D %152 = OpLoad %122 
                             sampler %153 = OpLoad %124 
          read_only Texture2DSampled %154 = OpSampledImage %152 %153 
                               f32_4 %156 = OpImageSampleExplicitLod %154 %17 Lod %7 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                               f32_4 %158 = OpLoad %9 
                               f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                              OpStore %9 %159 
                        Private f32* %160 = OpAccessChain %9 %80 
                                 f32 %161 = OpLoad %160 
                                 f32 %162 = OpFMul %161 %74 
                        Private f32* %163 = OpAccessChain %9 %76 
                                 f32 %164 = OpLoad %163 
                                 f32 %165 = OpFAdd %162 %164 
                        Private f32* %166 = OpAccessChain %9 %76 
                                              OpStore %166 %165 
                        Private f32* %167 = OpAccessChain %9 %76 
                                 f32 %168 = OpLoad %167 
                                 f32 %169 = OpFMul %168 %92 
                        Private f32* %170 = OpAccessChain %9 %76 
                                              OpStore %170 %169 
                 read_only Texture2D %173 = OpLoad %58 
                             sampler %174 = OpLoad %60 
          read_only Texture2DSampled %175 = OpSampledImage %173 %174 
                               f32_4 %177 = OpImageSampleExplicitLod %175 %176 Lod %7 
                               f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                              OpStore %172 %178 
                        Private f32* %179 = OpAccessChain %172 %80 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpFMul %180 %74 
                        Private f32* %182 = OpAccessChain %172 %76 
                                 f32 %183 = OpLoad %182 
                                 f32 %184 = OpFAdd %181 %183 
                        Private f32* %185 = OpAccessChain %172 %76 
                                              OpStore %185 %184 
                        Private f32* %186 = OpAccessChain %172 %76 
                                 f32 %187 = OpLoad %186 
                                 f32 %188 = OpFMul %187 %92 
                        Private f32* %189 = OpAccessChain %9 %80 
                                              OpStore %189 %188 
                               f32_4 %190 = OpLoad %9 
                               f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                      Uniform f32_4* %194 = OpAccessChain %25 %192 
                               f32_4 %195 = OpLoad %194 
                               f32_2 %196 = OpVectorShuffle %195 %195 2 3 
                               f32_2 %197 = OpFAdd %191 %196 
                               f32_4 %198 = OpLoad %9 
                               f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                              OpStore %9 %199 
                      Uniform f32_4* %201 = OpAccessChain %25 %200 
                               f32_4 %202 = OpLoad %201 
                               f32_2 %203 = OpVectorShuffle %202 %202 1 1 
                               f32_4 %204 = OpLoad %9 
                               f32_2 %205 = OpVectorShuffle %204 %204 0 1 
                               f32_2 %206 = OpFMul %203 %205 
                      Uniform f32_4* %207 = OpAccessChain %25 %192 
                               f32_4 %208 = OpLoad %207 
                               f32_2 %209 = OpVectorShuffle %208 %208 1 1 
                               f32_2 %210 = OpFAdd %206 %209 
                               f32_4 %211 = OpLoad %9 
                               f32_4 %212 = OpVectorShuffle %211 %210 4 5 2 3 
                                              OpStore %9 %212 
                        Private f32* %213 = OpAccessChain %9 %76 
                                 f32 %214 = OpLoad %213 
                                 f32 %215 = OpFNegate %214 
                        Private f32* %216 = OpAccessChain %9 %80 
                                 f32 %217 = OpLoad %216 
                                 f32 %218 = OpFAdd %215 %217 
                        Private f32* %219 = OpAccessChain %57 %76 
                                              OpStore %219 %218 
                               f32_4 %221 = OpLoad vs_TEXCOORD0 
                               f32_2 %222 = OpVectorShuffle %221 %221 3 2 
                               f32_4 %223 = OpLoad %220 
                               f32_4 %224 = OpVectorShuffle %223 %222 0 4 5 3 
                                              OpStore %220 %224 
                               f32_4 %225 = OpLoad %220 
                               f32_2 %226 = OpVectorShuffle %225 %225 1 2 
                               f32_2 %227 = OpCompositeConstruct %155 %155 
                               f32_2 %228 = OpCompositeConstruct %16 %16 
                               f32_2 %229 = OpExtInst %1 43 %226 %227 %228 
                               f32_4 %230 = OpLoad %220 
                               f32_4 %231 = OpVectorShuffle %230 %229 0 4 5 3 
                                              OpStore %220 %231 
                        Private f32* %232 = OpAccessChain %220 %70 
                                 f32 %233 = OpLoad %232 
                        Private f32* %234 = OpAccessChain %57 %76 
                                 f32 %235 = OpLoad %234 
                                 f32 %236 = OpFMul %233 %235 
                        Private f32* %237 = OpAccessChain %9 %76 
                                 f32 %238 = OpLoad %237 
                                 f32 %239 = OpFAdd %236 %238 
                        Private f32* %240 = OpAccessChain %9 %76 
                                              OpStore %240 %239 
                 read_only Texture2D %242 = OpLoad %122 
                             sampler %243 = OpLoad %124 
          read_only Texture2DSampled %244 = OpSampledImage %242 %243 
                               f32_4 %246 = OpImageSampleExplicitLod %244 %245 Lod %7 
                               f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                              OpStore %241 %247 
                        Private f32* %248 = OpAccessChain %241 %80 
                                 f32 %249 = OpLoad %248 
                                 f32 %250 = OpFMul %249 %74 
                        Private f32* %251 = OpAccessChain %241 %76 
                                 f32 %252 = OpLoad %251 
                                 f32 %253 = OpFAdd %250 %252 
                        Private f32* %254 = OpAccessChain %241 %76 
                                              OpStore %254 %253 
                        Private f32* %255 = OpAccessChain %241 %76 
                                 f32 %256 = OpLoad %255 
                                 f32 %257 = OpFMul %256 %92 
                        Private f32* %258 = OpAccessChain %241 %76 
                                              OpStore %258 %257 
                 read_only Texture2D %260 = OpLoad %58 
                             sampler %261 = OpLoad %60 
          read_only Texture2DSampled %262 = OpSampledImage %260 %261 
                               f32_4 %264 = OpImageSampleExplicitLod %262 %263 Lod %7 
                               f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                              OpStore %259 %265 
                        Private f32* %266 = OpAccessChain %259 %80 
                                 f32 %267 = OpLoad %266 
                                 f32 %268 = OpFMul %267 %74 
                        Private f32* %269 = OpAccessChain %259 %76 
                                 f32 %270 = OpLoad %269 
                                 f32 %271 = OpFAdd %268 %270 
                        Private f32* %272 = OpAccessChain %259 %76 
                                              OpStore %272 %271 
                        Private f32* %273 = OpAccessChain %259 %76 
                                 f32 %274 = OpLoad %273 
                                 f32 %275 = OpFMul %274 %92 
                        Private f32* %276 = OpAccessChain %241 %80 
                                              OpStore %276 %275 
                               f32_2 %277 = OpLoad %241 
                      Uniform f32_4* %278 = OpAccessChain %25 %192 
                               f32_4 %279 = OpLoad %278 
                               f32_2 %280 = OpVectorShuffle %279 %279 2 3 
                               f32_2 %281 = OpFAdd %277 %280 
                                              OpStore %241 %281 
                      Uniform f32_4* %282 = OpAccessChain %25 %200 
                               f32_4 %283 = OpLoad %282 
                               f32_2 %284 = OpVectorShuffle %283 %283 0 0 
                               f32_2 %285 = OpLoad %241 
                               f32_2 %286 = OpFMul %284 %285 
                      Uniform f32_4* %287 = OpAccessChain %25 %192 
                               f32_4 %288 = OpLoad %287 
                               f32_2 %289 = OpVectorShuffle %288 %288 0 0 
                               f32_2 %290 = OpFAdd %286 %289 
                                              OpStore %241 %290 
                        Private f32* %292 = OpAccessChain %241 %76 
                                 f32 %293 = OpLoad %292 
                                 f32 %294 = OpFNegate %293 
                        Private f32* %295 = OpAccessChain %241 %80 
                                 f32 %296 = OpLoad %295 
                                 f32 %297 = OpFAdd %294 %296 
                                              OpStore %291 %297 
                        Private f32* %298 = OpAccessChain %220 %70 
                                 f32 %299 = OpLoad %298 
                                 f32 %300 = OpLoad %291 
                                 f32 %301 = OpFMul %299 %300 
                        Private f32* %302 = OpAccessChain %241 %76 
                                 f32 %303 = OpLoad %302 
                                 f32 %304 = OpFAdd %301 %303 
                        Private f32* %305 = OpAccessChain %9 %80 
                                              OpStore %305 %304 
                 read_only Texture2D %306 = OpLoad %111 
                             sampler %307 = OpLoad %113 
          read_only Texture2DSampled %308 = OpSampledImage %306 %307 
                               f32_4 %309 = OpImageSampleExplicitLod %308 %176 Lod %7 
                               f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                                              OpStore %241 %310 
                        Private f32* %311 = OpAccessChain %241 %80 
                                 f32 %312 = OpLoad %311 
                                 f32 %313 = OpFMul %312 %74 
                        Private f32* %314 = OpAccessChain %241 %76 
                                 f32 %315 = OpLoad %314 
                                 f32 %316 = OpFAdd %313 %315 
                        Private f32* %317 = OpAccessChain %241 %76 
                                              OpStore %317 %316 
                        Private f32* %318 = OpAccessChain %241 %76 
                                 f32 %319 = OpLoad %318 
                                 f32 %320 = OpFMul %319 %92 
                        Private f32* %321 = OpAccessChain %241 %76 
                                              OpStore %321 %320 
                 read_only Texture2D %322 = OpLoad %41 
                             sampler %323 = OpLoad %45 
          read_only Texture2DSampled %324 = OpSampledImage %322 %323 
                               f32_4 %325 = OpImageSampleExplicitLod %324 %263 Lod %7 
                               f32_2 %326 = OpVectorShuffle %325 %325 0 1 
                                              OpStore %259 %326 
                        Private f32* %327 = OpAccessChain %259 %80 
                                 f32 %328 = OpLoad %327 
                                 f32 %329 = OpFMul %328 %74 
                        Private f32* %330 = OpAccessChain %259 %76 
                                 f32 %331 = OpLoad %330 
                                 f32 %332 = OpFAdd %329 %331 
                        Private f32* %333 = OpAccessChain %259 %76 
                                              OpStore %333 %332 
                        Private f32* %334 = OpAccessChain %259 %76 
                                 f32 %335 = OpLoad %334 
                                 f32 %336 = OpFMul %335 %92 
                        Private f32* %337 = OpAccessChain %241 %80 
                                              OpStore %337 %336 
                               f32_2 %338 = OpLoad %241 
                      Uniform f32_4* %339 = OpAccessChain %25 %192 
                               f32_4 %340 = OpLoad %339 
                               f32_2 %341 = OpVectorShuffle %340 %340 0 1 
                               f32_2 %342 = OpFAdd %338 %341 
                                              OpStore %241 %342 
                      Uniform f32_4* %343 = OpAccessChain %25 %200 
                               f32_4 %344 = OpLoad %343 
                               f32_2 %345 = OpVectorShuffle %344 %344 2 2 
                               f32_2 %346 = OpLoad %241 
                               f32_2 %347 = OpFMul %345 %346 
                      Uniform f32_4* %348 = OpAccessChain %25 %192 
                               f32_4 %349 = OpLoad %348 
                               f32_2 %350 = OpVectorShuffle %349 %349 2 2 
                               f32_2 %351 = OpFAdd %347 %350 
                                              OpStore %241 %351 
                        Private f32* %352 = OpAccessChain %241 %76 
                                 f32 %353 = OpLoad %352 
                                 f32 %354 = OpFNegate %353 
                        Private f32* %355 = OpAccessChain %241 %80 
                                 f32 %356 = OpLoad %355 
                                 f32 %357 = OpFAdd %354 %356 
                                              OpStore %291 %357 
                        Private f32* %358 = OpAccessChain %220 %80 
                                 f32 %359 = OpLoad %358 
                                 f32 %360 = OpLoad %291 
                                 f32 %361 = OpFMul %359 %360 
                        Private f32* %362 = OpAccessChain %241 %76 
                                 f32 %363 = OpLoad %362 
                                 f32 %364 = OpFAdd %361 %363 
                        Private f32* %365 = OpAccessChain %9 %70 
                                              OpStore %365 %364 
                 read_only Texture2D %366 = OpLoad %111 
                             sampler %367 = OpLoad %113 
          read_only Texture2DSampled %368 = OpSampledImage %366 %367 
                               f32_4 %369 = OpImageSampleExplicitLod %368 %17 Lod %7 
                               f32_2 %370 = OpVectorShuffle %369 %369 0 1 
                                              OpStore %241 %370 
                        Private f32* %371 = OpAccessChain %241 %80 
                                 f32 %372 = OpLoad %371 
                                 f32 %373 = OpFMul %372 %74 
                        Private f32* %374 = OpAccessChain %241 %76 
                                 f32 %375 = OpLoad %374 
                                 f32 %376 = OpFAdd %373 %375 
                        Private f32* %377 = OpAccessChain %241 %76 
                                              OpStore %377 %376 
                        Private f32* %378 = OpAccessChain %241 %76 
                                 f32 %379 = OpLoad %378 
                                 f32 %380 = OpFMul %379 %92 
                        Private f32* %381 = OpAccessChain %241 %76 
                                              OpStore %381 %380 
                 read_only Texture2D %382 = OpLoad %41 
                             sampler %383 = OpLoad %45 
          read_only Texture2DSampled %384 = OpSampledImage %382 %383 
                               f32_4 %385 = OpImageSampleExplicitLod %384 %245 Lod %7 
                               f32_2 %386 = OpVectorShuffle %385 %385 0 1 
                                              OpStore %259 %386 
                        Private f32* %387 = OpAccessChain %259 %80 
                                 f32 %388 = OpLoad %387 
                                 f32 %389 = OpFMul %388 %74 
                        Private f32* %390 = OpAccessChain %259 %76 
                                 f32 %391 = OpLoad %390 
                                 f32 %392 = OpFAdd %389 %391 
                        Private f32* %393 = OpAccessChain %259 %76 
                                              OpStore %393 %392 
                        Private f32* %394 = OpAccessChain %259 %76 
                                 f32 %395 = OpLoad %394 
                                 f32 %396 = OpFMul %395 %92 
                        Private f32* %397 = OpAccessChain %241 %80 
                                              OpStore %397 %396 
                               f32_2 %398 = OpLoad %241 
                      Uniform f32_4* %399 = OpAccessChain %25 %192 
                               f32_4 %400 = OpLoad %399 
                               f32_2 %401 = OpVectorShuffle %400 %400 0 1 
                               f32_2 %402 = OpFAdd %398 %401 
                                              OpStore %241 %402 
                      Uniform f32_4* %403 = OpAccessChain %25 %200 
                               f32_4 %404 = OpLoad %403 
                               f32_2 %405 = OpVectorShuffle %404 %404 3 3 
                               f32_2 %406 = OpLoad %241 
                               f32_2 %407 = OpFMul %405 %406 
                      Uniform f32_4* %408 = OpAccessChain %25 %192 
                               f32_4 %409 = OpLoad %408 
                               f32_2 %410 = OpVectorShuffle %409 %409 3 3 
                               f32_2 %411 = OpFAdd %407 %410 
                                              OpStore %241 %411 
                        Private f32* %412 = OpAccessChain %241 %76 
                                 f32 %413 = OpLoad %412 
                                 f32 %414 = OpFNegate %413 
                        Private f32* %415 = OpAccessChain %241 %80 
                                 f32 %416 = OpLoad %415 
                                 f32 %417 = OpFAdd %414 %416 
                                              OpStore %291 %417 
                        Private f32* %418 = OpAccessChain %220 %80 
                                 f32 %419 = OpLoad %418 
                                 f32 %420 = OpLoad %291 
                                 f32 %421 = OpFMul %419 %420 
                        Private f32* %422 = OpAccessChain %241 %76 
                                 f32 %423 = OpLoad %422 
                                 f32 %424 = OpFAdd %421 %423 
                        Private f32* %426 = OpAccessChain %9 %425 
                                              OpStore %426 %424 
                               f32_4 %427 = OpLoad %9 
                               f32_4 %428 = OpLoad %89 
                               f32_4 %429 = OpFAdd %427 %428 
                                              OpStore %9 %429 
                               f32_4 %430 = OpLoad %220 
                               f32_2 %431 = OpVectorShuffle %430 %430 1 2 
                               f32_2 %432 = OpFNegate %431 
                               f32_2 %433 = OpFAdd %432 %17 
                               f32_4 %434 = OpLoad %220 
                               f32_4 %435 = OpVectorShuffle %434 %433 4 1 2 5 
                                              OpStore %220 %435 
                               f32_4 %436 = OpLoad %220 
                               f32_4 %439 = OpExtInst %1 40 %436 %438 
                                              OpStore %89 %439 
                               f32_4 %441 = OpLoad %89 
                               f32_4 %442 = OpFDiv %440 %441 
                                              OpStore %89 %442 
                               f32_4 %443 = OpLoad %89 
                                 f32 %444 = OpDot %443 %440 
                        Private f32* %445 = OpAccessChain %220 %76 
                                              OpStore %445 %444 
                               f32_4 %446 = OpLoad %89 
                               f32_4 %447 = OpLoad %220 
                               f32_4 %448 = OpVectorShuffle %447 %447 0 0 0 0 
                               f32_4 %449 = OpFDiv %446 %448 
                                              OpStore %89 %449 
                               f32_4 %450 = OpLoad %9 
                               f32_4 %451 = OpLoad %89 
                                 f32 %452 = OpDot %450 %451 
                        Private f32* %453 = OpAccessChain %9 %76 
                                              OpStore %453 %452 
                        Private f32* %454 = OpAccessChain %9 %76 
                                 f32 %455 = OpLoad %454 
                                 f32 %457 = OpFMul %455 %456 
                        Private f32* %458 = OpAccessChain %9 %76 
                                              OpStore %458 %457 
                        Private f32* %462 = OpAccessChain %9 %76 
                                 f32 %463 = OpLoad %462 
                                 u32 %464 = OpConvertFToU %463 
                        Private u32* %466 = OpAccessChain %461 %76 
                                              OpStore %466 %464 
                        Private u32* %467 = OpAccessChain %461 %76 
                                 u32 %468 = OpLoad %467 
                                 u32 %470 = OpBitwiseAnd %468 %469 
                        Private u32* %471 = OpAccessChain %461 %80 
                                              OpStore %471 %470 
                        Private u32* %472 = OpAccessChain %461 %76 
                                 u32 %473 = OpLoad %472 
                                 u32 %475 = OpBitFieldUExtract %473 %474 %474 
                        Private u32* %476 = OpAccessChain %461 %76 
                                              OpStore %476 %475 
                               u32_2 %477 = OpLoad %461 
                               u32_2 %478 = OpVectorShuffle %477 %477 1 0 
                               f32_2 %479 = OpConvertUToF %478 
                               f32_4 %480 = OpLoad %89 
                               f32_4 %481 = OpVectorShuffle %480 %479 4 5 2 3 
                                              OpStore %89 %481 
                               f32_4 %484 = OpLoad %89 
                               f32_2 %485 = OpVectorShuffle %484 %484 0 1 
                               f32_2 %488 = OpFMul %485 %487 
                               f32_4 %489 = OpLoad %483 
                               f32_4 %490 = OpVectorShuffle %489 %488 4 5 2 3 
                                              OpStore %483 %490 
                               f32_4 %491 = OpLoad %483 
                               f32_4 %492 = OpVectorShuffle %491 %263 0 1 4 5 
                                              OpStore %483 %492 
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