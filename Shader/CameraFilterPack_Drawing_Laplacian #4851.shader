//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Laplacian" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33871
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec2 u_xlat10;
vec2 u_xlat19;
vec2 u_xlat20;
void main()
{
    u_xlat0.y = 0.0;
    u_xlat1.xy = vec2(2.0, 2.0) / _ScreenResolution.xy;
    u_xlat0.xz = (-u_xlat1.xy);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat20.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3 = texture(_MainTex, u_xlat20.xy);
    u_xlat4.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
    u_xlat0.w = u_xlat4.y;
    u_xlat5 = u_xlat0.xwyw + u_xlat2.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat5.xy);
    u_xlat5 = texture(_MainTex, u_xlat5.zw);
    u_xlat3 = (-u_xlat3) + (-u_xlat6);
    u_xlat1.z = (-u_xlat1.x);
    u_xlat20.xy = u_xlat1.zy + u_xlat2.xy;
    u_xlat6 = texture(_MainTex, u_xlat20.xy);
    u_xlat3 = u_xlat3 + (-u_xlat6);
    u_xlat0.xy = (-u_xlat4.xy);
    u_xlat6 = u_xlat0.xzxy + u_xlat2.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat3 = u_xlat3 + (-u_xlat7);
    u_xlat3 = (-u_xlat6) + u_xlat3;
    u_xlat0.w = 0.0;
    u_xlat6 = u_xlat0.xwwz + u_xlat2.xyxy;
    u_xlat0.xy = u_xlat0.wy + u_xlat2.xy;
    u_xlat7 = texture(_MainTex, u_xlat0.xy);
    u_xlat4.z = u_xlat0.z;
    u_xlat0.xy = u_xlat2.xy + u_xlat4.xz;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat8 = texture(_MainTex, u_xlat6.xy);
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat3 = u_xlat3 + (-u_xlat8);
    u_xlat3 = (-u_xlat6) + u_xlat3;
    u_xlat3 = (-u_xlat7) + u_xlat3;
    u_xlat6 = texture(_MainTex, u_xlat2.xy);
    u_xlat3 = u_xlat6 * vec4(16.0, 16.0, 16.0, 16.0) + u_xlat3;
    u_xlat3 = (-u_xlat5) + u_xlat3;
    u_xlat1.w = 0.0;
    u_xlat5 = u_xlat1.wyxw + u_xlat2.xyxy;
    u_xlat6 = texture(_MainTex, u_xlat5.xy);
    u_xlat5 = texture(_MainTex, u_xlat5.zw);
    u_xlat3 = u_xlat3 + (-u_xlat6);
    u_xlat0 = (-u_xlat0) + u_xlat3;
    u_xlat4.w = (-u_xlat4.y);
    u_xlat19.xy = u_xlat2.xy + u_xlat4.xw;
    u_xlat3 = texture(_MainTex, u_xlat19.xy);
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat3.z = (-u_xlat4.y);
    u_xlat4.y = 0.0;
    u_xlat19.xy = u_xlat2.xy + u_xlat4.xy;
    u_xlat4 = texture(_MainTex, u_xlat19.xy);
    u_xlat0 = u_xlat0 + (-u_xlat4);
    u_xlat10.xy = u_xlat1.xy * vec2(1.0, -1.0) + u_xlat2.xy;
    u_xlat3.x = u_xlat1.x * 1.0;
    u_xlat1.xw = u_xlat2.xy + u_xlat3.xz;
    u_xlat2 = texture(_MainTex, u_xlat1.xw);
    u_xlat1 = texture(_MainTex, u_xlat10.xy);
    u_xlat0 = u_xlat0 + (-u_xlat1);
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat1.x = u_xlat0.y + u_xlat0.x;
    u_xlat1.x = u_xlat0.z + u_xlat1.x;
    u_xlatb1 = u_xlat1.x<2.39999986;
    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat0;
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
; Bound: 370
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %38 %362 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %19 0 Offset 19 
                                             OpMemberDecorate %19 1 Offset 19 
                                             OpDecorate %19 Block 
                                             OpDecorate %21 DescriptorSet 21 
                                             OpDecorate %21 Binding 21 
                                             OpDecorate vs_TEXCOORD0 Location 38 
                                             OpDecorate %61 DescriptorSet 61 
                                             OpDecorate %61 Binding 61 
                                             OpDecorate %65 DescriptorSet 65 
                                             OpDecorate %65 Binding 65 
                                             OpDecorate %362 Location 362 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                 f32 %10 = OpConstant 3.674022E-40 
                                     %11 = OpTypeInt 32 0 
                                 u32 %12 = OpConstant 1 
                                     %13 = OpTypePointer Private %6 
                      Private f32_4* %15 = OpVariable Private 
                                     %16 = OpTypeVector %6 2 
                                 f32 %17 = OpConstant 3.674022E-40 
                               f32_2 %18 = OpConstantComposite %17 %17 
                                     %19 = OpTypeStruct %7 %7 
                                     %20 = OpTypePointer Uniform %19 
     Uniform struct {f32_4; f32_4;}* %21 = OpVariable Uniform 
                                     %22 = OpTypeInt 32 1 
                                 i32 %23 = OpConstant 0 
                                     %24 = OpTypePointer Uniform %7 
                      Private f32_4* %36 = OpVariable Private 
                                     %37 = OpTypePointer Input %16 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %40 = OpConstant 1 
                                     %51 = OpTypePointer Private %16 
                      Private f32_2* %52 = OpVariable Private 
                      Private f32_4* %58 = OpVariable Private 
                                     %59 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %60 = OpTypePointer UniformConstant %59 
UniformConstant read_only Texture2D* %61 = OpVariable UniformConstant 
                                     %63 = OpTypeSampler 
                                     %64 = OpTypePointer UniformConstant %63 
            UniformConstant sampler* %65 = OpVariable UniformConstant 
                                     %67 = OpTypeSampledImage %59 
                      Private f32_4* %71 = OpVariable Private 
                                 f32 %72 = OpConstant 3.674022E-40 
                               f32_2 %73 = OpConstantComposite %72 %72 
                                 u32 %82 = OpConstant 3 
                      Private f32_4* %84 = OpVariable Private 
                      Private f32_4* %90 = OpVariable Private 
                                u32 %108 = OpConstant 0 
                                u32 %112 = OpConstant 2 
                     Private f32_4* %138 = OpVariable Private 
                     Private f32_4* %194 = OpVariable Private 
                                f32 %226 = OpConstant 3.674022E-40 
                              f32_4 %227 = OpConstantComposite %226 %226 %226 %226 
                     Private f32_2* %265 = OpVariable Private 
                     Private f32_2* %299 = OpVariable Private 
                                f32 %302 = OpConstant 3.674022E-40 
                              f32_2 %303 = OpConstantComposite %72 %302 
                                    %354 = OpTypeBool 
                                    %355 = OpTypePointer Private %354 
                      Private bool* %356 = OpVariable Private 
                                f32 %359 = OpConstant 3.674022E-40 
                                    %361 = OpTypePointer Output %7 
                      Output f32_4* %362 = OpVariable Output 
                              f32_4 %364 = OpConstantComposite %10 %10 %10 %10 
                                    %366 = OpTypeVector %354 4 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Private f32* %14 = OpAccessChain %9 %12 
                                             OpStore %14 %10 
                      Uniform f32_4* %25 = OpAccessChain %21 %23 
                               f32_4 %26 = OpLoad %25 
                               f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                               f32_2 %28 = OpFDiv %18 %27 
                               f32_4 %29 = OpLoad %15 
                               f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                             OpStore %15 %30 
                               f32_4 %31 = OpLoad %15 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpFNegate %32 
                               f32_4 %34 = OpLoad %9 
                               f32_4 %35 = OpVectorShuffle %34 %33 4 1 5 3 
                                             OpStore %9 %35 
                               f32_2 %39 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %41 = OpAccessChain %21 %40 
                               f32_4 %42 = OpLoad %41 
                               f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                               f32_2 %44 = OpFMul %39 %43 
                      Uniform f32_4* %45 = OpAccessChain %21 %40 
                               f32_4 %46 = OpLoad %45 
                               f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                               f32_2 %48 = OpFAdd %44 %47 
                               f32_4 %49 = OpLoad %36 
                               f32_4 %50 = OpVectorShuffle %49 %48 4 5 2 3 
                                             OpStore %36 %50 
                               f32_4 %53 = OpLoad %9 
                               f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                               f32_4 %55 = OpLoad %36 
                               f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                               f32_2 %57 = OpFAdd %54 %56 
                                             OpStore %52 %57 
                 read_only Texture2D %62 = OpLoad %61 
                             sampler %66 = OpLoad %65 
          read_only Texture2DSampled %68 = OpSampledImage %62 %66 
                               f32_2 %69 = OpLoad %52 
                               f32_4 %70 = OpImageSampleImplicitLod %68 %69 
                                             OpStore %58 %70 
                      Uniform f32_4* %74 = OpAccessChain %21 %23 
                               f32_4 %75 = OpLoad %74 
                               f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                               f32_2 %77 = OpFDiv %73 %76 
                               f32_4 %78 = OpLoad %71 
                               f32_4 %79 = OpVectorShuffle %78 %77 4 5 2 3 
                                             OpStore %71 %79 
                        Private f32* %80 = OpAccessChain %71 %12 
                                 f32 %81 = OpLoad %80 
                        Private f32* %83 = OpAccessChain %9 %82 
                                             OpStore %83 %81 
                               f32_4 %85 = OpLoad %9 
                               f32_4 %86 = OpVectorShuffle %85 %85 0 3 1 3 
                               f32_4 %87 = OpLoad %36 
                               f32_4 %88 = OpVectorShuffle %87 %87 0 1 0 1 
                               f32_4 %89 = OpFAdd %86 %88 
                                             OpStore %84 %89 
                 read_only Texture2D %91 = OpLoad %61 
                             sampler %92 = OpLoad %65 
          read_only Texture2DSampled %93 = OpSampledImage %91 %92 
                               f32_4 %94 = OpLoad %84 
                               f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                               f32_4 %96 = OpImageSampleImplicitLod %93 %95 
                                             OpStore %90 %96 
                 read_only Texture2D %97 = OpLoad %61 
                             sampler %98 = OpLoad %65 
          read_only Texture2DSampled %99 = OpSampledImage %97 %98 
                              f32_4 %100 = OpLoad %84 
                              f32_2 %101 = OpVectorShuffle %100 %100 2 3 
                              f32_4 %102 = OpImageSampleImplicitLod %99 %101 
                                             OpStore %84 %102 
                              f32_4 %103 = OpLoad %58 
                              f32_4 %104 = OpFNegate %103 
                              f32_4 %105 = OpLoad %90 
                              f32_4 %106 = OpFNegate %105 
                              f32_4 %107 = OpFAdd %104 %106 
                                             OpStore %58 %107 
                       Private f32* %109 = OpAccessChain %15 %108 
                                f32 %110 = OpLoad %109 
                                f32 %111 = OpFNegate %110 
                       Private f32* %113 = OpAccessChain %15 %112 
                                             OpStore %113 %111 
                              f32_4 %114 = OpLoad %15 
                              f32_2 %115 = OpVectorShuffle %114 %114 2 1 
                              f32_4 %116 = OpLoad %36 
                              f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                              f32_2 %118 = OpFAdd %115 %117 
                                             OpStore %52 %118 
                read_only Texture2D %119 = OpLoad %61 
                            sampler %120 = OpLoad %65 
         read_only Texture2DSampled %121 = OpSampledImage %119 %120 
                              f32_2 %122 = OpLoad %52 
                              f32_4 %123 = OpImageSampleImplicitLod %121 %122 
                                             OpStore %90 %123 
                              f32_4 %124 = OpLoad %58 
                              f32_4 %125 = OpLoad %90 
                              f32_4 %126 = OpFNegate %125 
                              f32_4 %127 = OpFAdd %124 %126 
                                             OpStore %58 %127 
                              f32_4 %128 = OpLoad %71 
                              f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                              f32_2 %130 = OpFNegate %129 
                              f32_4 %131 = OpLoad %9 
                              f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                             OpStore %9 %132 
                              f32_4 %133 = OpLoad %9 
                              f32_4 %134 = OpVectorShuffle %133 %133 0 2 0 1 
                              f32_4 %135 = OpLoad %36 
                              f32_4 %136 = OpVectorShuffle %135 %135 0 1 0 1 
                              f32_4 %137 = OpFAdd %134 %136 
                                             OpStore %90 %137 
                read_only Texture2D %139 = OpLoad %61 
                            sampler %140 = OpLoad %65 
         read_only Texture2DSampled %141 = OpSampledImage %139 %140 
                              f32_4 %142 = OpLoad %90 
                              f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                              f32_4 %144 = OpImageSampleImplicitLod %141 %143 
                                             OpStore %138 %144 
                read_only Texture2D %145 = OpLoad %61 
                            sampler %146 = OpLoad %65 
         read_only Texture2DSampled %147 = OpSampledImage %145 %146 
                              f32_4 %148 = OpLoad %90 
                              f32_2 %149 = OpVectorShuffle %148 %148 2 3 
                              f32_4 %150 = OpImageSampleImplicitLod %147 %149 
                                             OpStore %90 %150 
                              f32_4 %151 = OpLoad %58 
                              f32_4 %152 = OpLoad %138 
                              f32_4 %153 = OpFNegate %152 
                              f32_4 %154 = OpFAdd %151 %153 
                                             OpStore %58 %154 
                              f32_4 %155 = OpLoad %90 
                              f32_4 %156 = OpFNegate %155 
                              f32_4 %157 = OpLoad %58 
                              f32_4 %158 = OpFAdd %156 %157 
                                             OpStore %58 %158 
                       Private f32* %159 = OpAccessChain %9 %82 
                                             OpStore %159 %10 
                              f32_4 %160 = OpLoad %9 
                              f32_4 %161 = OpVectorShuffle %160 %160 0 3 3 2 
                              f32_4 %162 = OpLoad %36 
                              f32_4 %163 = OpVectorShuffle %162 %162 0 1 0 1 
                              f32_4 %164 = OpFAdd %161 %163 
                                             OpStore %90 %164 
                              f32_4 %165 = OpLoad %9 
                              f32_2 %166 = OpVectorShuffle %165 %165 3 1 
                              f32_4 %167 = OpLoad %36 
                              f32_2 %168 = OpVectorShuffle %167 %167 0 1 
                              f32_2 %169 = OpFAdd %166 %168 
                              f32_4 %170 = OpLoad %9 
                              f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                             OpStore %9 %171 
                read_only Texture2D %172 = OpLoad %61 
                            sampler %173 = OpLoad %65 
         read_only Texture2DSampled %174 = OpSampledImage %172 %173 
                              f32_4 %175 = OpLoad %9 
                              f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                              f32_4 %177 = OpImageSampleImplicitLod %174 %176 
                                             OpStore %138 %177 
                       Private f32* %178 = OpAccessChain %9 %112 
                                f32 %179 = OpLoad %178 
                       Private f32* %180 = OpAccessChain %71 %112 
                                             OpStore %180 %179 
                              f32_4 %181 = OpLoad %36 
                              f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                              f32_4 %183 = OpLoad %71 
                              f32_2 %184 = OpVectorShuffle %183 %183 0 2 
                              f32_2 %185 = OpFAdd %182 %184 
                              f32_4 %186 = OpLoad %9 
                              f32_4 %187 = OpVectorShuffle %186 %185 4 5 2 3 
                                             OpStore %9 %187 
                read_only Texture2D %188 = OpLoad %61 
                            sampler %189 = OpLoad %65 
         read_only Texture2DSampled %190 = OpSampledImage %188 %189 
                              f32_4 %191 = OpLoad %9 
                              f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                              f32_4 %193 = OpImageSampleImplicitLod %190 %192 
                                             OpStore %9 %193 
                read_only Texture2D %195 = OpLoad %61 
                            sampler %196 = OpLoad %65 
         read_only Texture2DSampled %197 = OpSampledImage %195 %196 
                              f32_4 %198 = OpLoad %90 
                              f32_2 %199 = OpVectorShuffle %198 %198 0 1 
                              f32_4 %200 = OpImageSampleImplicitLod %197 %199 
                                             OpStore %194 %200 
                read_only Texture2D %201 = OpLoad %61 
                            sampler %202 = OpLoad %65 
         read_only Texture2DSampled %203 = OpSampledImage %201 %202 
                              f32_4 %204 = OpLoad %90 
                              f32_2 %205 = OpVectorShuffle %204 %204 2 3 
                              f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                                             OpStore %90 %206 
                              f32_4 %207 = OpLoad %58 
                              f32_4 %208 = OpLoad %194 
                              f32_4 %209 = OpFNegate %208 
                              f32_4 %210 = OpFAdd %207 %209 
                                             OpStore %58 %210 
                              f32_4 %211 = OpLoad %90 
                              f32_4 %212 = OpFNegate %211 
                              f32_4 %213 = OpLoad %58 
                              f32_4 %214 = OpFAdd %212 %213 
                                             OpStore %58 %214 
                              f32_4 %215 = OpLoad %138 
                              f32_4 %216 = OpFNegate %215 
                              f32_4 %217 = OpLoad %58 
                              f32_4 %218 = OpFAdd %216 %217 
                                             OpStore %58 %218 
                read_only Texture2D %219 = OpLoad %61 
                            sampler %220 = OpLoad %65 
         read_only Texture2DSampled %221 = OpSampledImage %219 %220 
                              f32_4 %222 = OpLoad %36 
                              f32_2 %223 = OpVectorShuffle %222 %222 0 1 
                              f32_4 %224 = OpImageSampleImplicitLod %221 %223 
                                             OpStore %90 %224 
                              f32_4 %225 = OpLoad %90 
                              f32_4 %228 = OpFMul %225 %227 
                              f32_4 %229 = OpLoad %58 
                              f32_4 %230 = OpFAdd %228 %229 
                                             OpStore %58 %230 
                              f32_4 %231 = OpLoad %84 
                              f32_4 %232 = OpFNegate %231 
                              f32_4 %233 = OpLoad %58 
                              f32_4 %234 = OpFAdd %232 %233 
                                             OpStore %58 %234 
                       Private f32* %235 = OpAccessChain %15 %82 
                                             OpStore %235 %10 
                              f32_4 %236 = OpLoad %15 
                              f32_4 %237 = OpVectorShuffle %236 %236 3 1 0 3 
                              f32_4 %238 = OpLoad %36 
                              f32_4 %239 = OpVectorShuffle %238 %238 0 1 0 1 
                              f32_4 %240 = OpFAdd %237 %239 
                                             OpStore %84 %240 
                read_only Texture2D %241 = OpLoad %61 
                            sampler %242 = OpLoad %65 
         read_only Texture2DSampled %243 = OpSampledImage %241 %242 
                              f32_4 %244 = OpLoad %84 
                              f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                              f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                             OpStore %90 %246 
                read_only Texture2D %247 = OpLoad %61 
                            sampler %248 = OpLoad %65 
         read_only Texture2DSampled %249 = OpSampledImage %247 %248 
                              f32_4 %250 = OpLoad %84 
                              f32_2 %251 = OpVectorShuffle %250 %250 2 3 
                              f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                             OpStore %84 %252 
                              f32_4 %253 = OpLoad %58 
                              f32_4 %254 = OpLoad %90 
                              f32_4 %255 = OpFNegate %254 
                              f32_4 %256 = OpFAdd %253 %255 
                                             OpStore %58 %256 
                              f32_4 %257 = OpLoad %9 
                              f32_4 %258 = OpFNegate %257 
                              f32_4 %259 = OpLoad %58 
                              f32_4 %260 = OpFAdd %258 %259 
                                             OpStore %9 %260 
                       Private f32* %261 = OpAccessChain %71 %12 
                                f32 %262 = OpLoad %261 
                                f32 %263 = OpFNegate %262 
                       Private f32* %264 = OpAccessChain %71 %82 
                                             OpStore %264 %263 
                              f32_4 %266 = OpLoad %36 
                              f32_2 %267 = OpVectorShuffle %266 %266 0 1 
                              f32_4 %268 = OpLoad %71 
                              f32_2 %269 = OpVectorShuffle %268 %268 0 3 
                              f32_2 %270 = OpFAdd %267 %269 
                                             OpStore %265 %270 
                read_only Texture2D %271 = OpLoad %61 
                            sampler %272 = OpLoad %65 
         read_only Texture2DSampled %273 = OpSampledImage %271 %272 
                              f32_2 %274 = OpLoad %265 
                              f32_4 %275 = OpImageSampleImplicitLod %273 %274 
                                             OpStore %58 %275 
                              f32_4 %276 = OpLoad %9 
                              f32_4 %277 = OpLoad %58 
                              f32_4 %278 = OpFNegate %277 
                              f32_4 %279 = OpFAdd %276 %278 
                                             OpStore %9 %279 
                       Private f32* %280 = OpAccessChain %71 %12 
                                f32 %281 = OpLoad %280 
                                f32 %282 = OpFNegate %281 
                       Private f32* %283 = OpAccessChain %58 %112 
                                             OpStore %283 %282 
                       Private f32* %284 = OpAccessChain %71 %12 
                                             OpStore %284 %10 
                              f32_4 %285 = OpLoad %36 
                              f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                              f32_4 %287 = OpLoad %71 
                              f32_2 %288 = OpVectorShuffle %287 %287 0 1 
                              f32_2 %289 = OpFAdd %286 %288 
                                             OpStore %265 %289 
                read_only Texture2D %290 = OpLoad %61 
                            sampler %291 = OpLoad %65 
         read_only Texture2DSampled %292 = OpSampledImage %290 %291 
                              f32_2 %293 = OpLoad %265 
                              f32_4 %294 = OpImageSampleImplicitLod %292 %293 
                                             OpStore %71 %294 
                              f32_4 %295 = OpLoad %9 
                              f32_4 %296 = OpLoad %71 
                              f32_4 %297 = OpFNegate %296 
                              f32_4 %298 = OpFAdd %295 %297 
                                             OpStore %9 %298 
                              f32_4 %300 = OpLoad %15 
                              f32_2 %301 = OpVectorShuffle %300 %300 0 1 
                              f32_2 %304 = OpFMul %301 %303 
                              f32_4 %305 = OpLoad %36 
                              f32_2 %306 = OpVectorShuffle %305 %305 0 1 
                              f32_2 %307 = OpFAdd %304 %306 
                                             OpStore %299 %307 
                       Private f32* %308 = OpAccessChain %15 %108 
                                f32 %309 = OpLoad %308 
                                f32 %310 = OpFMul %309 %72 
                       Private f32* %311 = OpAccessChain %58 %108 
                                             OpStore %311 %310 
                              f32_4 %312 = OpLoad %36 
                              f32_2 %313 = OpVectorShuffle %312 %312 0 1 
                              f32_4 %314 = OpLoad %58 
                              f32_2 %315 = OpVectorShuffle %314 %314 0 2 
                              f32_2 %316 = OpFAdd %313 %315 
                              f32_4 %317 = OpLoad %15 
                              f32_4 %318 = OpVectorShuffle %317 %316 4 1 2 5 
                                             OpStore %15 %318 
                read_only Texture2D %319 = OpLoad %61 
                            sampler %320 = OpLoad %65 
         read_only Texture2DSampled %321 = OpSampledImage %319 %320 
                              f32_4 %322 = OpLoad %15 
                              f32_2 %323 = OpVectorShuffle %322 %322 0 3 
                              f32_4 %324 = OpImageSampleImplicitLod %321 %323 
                                             OpStore %36 %324 
                read_only Texture2D %325 = OpLoad %61 
                            sampler %326 = OpLoad %65 
         read_only Texture2DSampled %327 = OpSampledImage %325 %326 
                              f32_2 %328 = OpLoad %299 
                              f32_4 %329 = OpImageSampleImplicitLod %327 %328 
                                             OpStore %15 %329 
                              f32_4 %330 = OpLoad %9 
                              f32_4 %331 = OpLoad %15 
                              f32_4 %332 = OpFNegate %331 
                              f32_4 %333 = OpFAdd %330 %332 
                                             OpStore %9 %333 
                              f32_4 %334 = OpLoad %36 
                              f32_4 %335 = OpFNegate %334 
                              f32_4 %336 = OpLoad %9 
                              f32_4 %337 = OpFAdd %335 %336 
                                             OpStore %9 %337 
                              f32_4 %338 = OpLoad %84 
                              f32_4 %339 = OpFNegate %338 
                              f32_4 %340 = OpLoad %9 
                              f32_4 %341 = OpFAdd %339 %340 
                                             OpStore %9 %341 
                       Private f32* %342 = OpAccessChain %9 %12 
                                f32 %343 = OpLoad %342 
                       Private f32* %344 = OpAccessChain %9 %108 
                                f32 %345 = OpLoad %344 
                                f32 %346 = OpFAdd %343 %345 
                       Private f32* %347 = OpAccessChain %15 %108 
                                             OpStore %347 %346 
                       Private f32* %348 = OpAccessChain %9 %112 
                                f32 %349 = OpLoad %348 
                       Private f32* %350 = OpAccessChain %15 %108 
                                f32 %351 = OpLoad %350 
                                f32 %352 = OpFAdd %349 %351 
                       Private f32* %353 = OpAccessChain %15 %108 
                                             OpStore %353 %352 
                       Private f32* %357 = OpAccessChain %15 %108 
                                f32 %358 = OpLoad %357 
                               bool %360 = OpFOrdLessThan %358 %359 
                                             OpStore %356 %360 
                               bool %363 = OpLoad %356 
                              f32_4 %365 = OpLoad %9 
                             bool_4 %367 = OpCompositeConstruct %363 %363 %363 %363 
                              f32_4 %368 = OpSelect %367 %364 %365 
                                             OpStore %362 %368 
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