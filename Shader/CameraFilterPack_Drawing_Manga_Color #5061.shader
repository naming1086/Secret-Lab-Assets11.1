//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Manga_Color" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_DotSize ("_DotSize", Range(0, 1)) = 0
_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 57323
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
uniform 	float _DotSize;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
vec4 u_xlat3;
bool u_xlatb5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.xy = vec2(_DotSize) * vec2(0.001953125, -0.001953125) + u_xlat0.xy;
    u_xlat1 = texture(_MainTex, u_xlat8.xy);
    u_xlat8.x = dot(u_xlat1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat1.xy = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + u_xlat0.xy;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat12 = dot(u_xlat1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat8.x = u_xlat8.x * 4.0 + (-u_xlat12);
    u_xlat8.x = u_xlat12 * -3.0 + u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlatb8 = 0.0399999991<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? -1.0 : float(0.0);
    u_xlat1 = u_xlat0.xyxy * vec4(0.707106411, 0.707106411, 480.0, 480.0);
    u_xlat2.xy = u_xlat0.xx * vec2(0.707106411, 480.0) + (-u_xlat1.yw);
    u_xlat1.xy = u_xlat1.yw + u_xlat1.xz;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat3 = u_xlat3.xyzx + u_xlat3.xyzx;
    u_xlat0.x = 2136.28125 / _DotSize;
    u_xlat0.x = u_xlat0.x * 0.625;
    u_xlat0.y = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.xy = cos(u_xlat0.xy);
    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
    u_xlat0 = u_xlat8.xxxx * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 1.39999998);
    u_xlat12 = floor(u_xlat0.w);
    u_xlat12 = u_xlat12 * 0.357142866;
    u_xlat1.x = u_xlat1.y * u_xlat12;
    u_xlat12 = u_xlat2.y * u_xlat12;
    u_xlat12 = u_xlat12 * 3.1500001;
    u_xlat12 = sin(u_xlat12);
    u_xlat1.x = u_xlat1.x * 3.1500001;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlatb5 = u_xlat0.x<u_xlat0.y;
    u_xlat12 = (u_xlatb5) ? u_xlat12 : u_xlat1.x;
    SV_Target0.xyz = (-vec3(u_xlat12)) * vec3(0.125, 0.125, 0.125) + u_xlat0.xyz;
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
; Bound: 273
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %257 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %47 DescriptorSet 47 
                                             OpDecorate %47 Binding 47 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
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
                                     %14 = OpTypeStruct %6 %7 
                                     %15 = OpTypePointer Uniform %14 
       Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 1 
                                     %19 = OpTypePointer Uniform %7 
                                     %30 = OpTypePointer Private %10 
                      Private f32_2* %31 = OpVariable Private 
                                 i32 %32 = OpConstant 0 
                                     %33 = OpTypePointer Uniform %6 
                                 f32 %37 = OpConstant 3.674022E-40 
                                 f32 %38 = OpConstant 3.674022E-40 
                               f32_2 %39 = OpConstantComposite %37 %38 
                      Private f32_4* %44 = OpVariable Private 
                                     %45 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %46 = OpTypePointer UniformConstant %45 
UniformConstant read_only Texture2D* %47 = OpVariable UniformConstant 
                                     %49 = OpTypeSampler 
                                     %50 = OpTypePointer UniformConstant %49 
            UniformConstant sampler* %51 = OpVariable UniformConstant 
                                     %53 = OpTypeSampledImage %45 
                                 f32 %58 = OpConstant 3.674022E-40 
                                 f32 %59 = OpConstant 3.674022E-40 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 f32 %61 = OpConstant 3.674022E-40 
                               f32_4 %62 = OpConstantComposite %58 %59 %60 %61 
                                     %64 = OpTypeInt 32 0 
                                 u32 %65 = OpConstant 0 
                                     %66 = OpTypePointer Private %6 
                               f32_2 %72 = OpConstantComposite %37 %37 
                        Private f32* %85 = OpVariable Private 
                                 f32 %90 = OpConstant 3.674022E-40 
                                 f32 %97 = OpConstant 3.674022E-40 
                                    %109 = OpTypeBool 
                                    %110 = OpTypePointer Private %109 
                      Private bool* %111 = OpVariable Private 
                                f32 %112 = OpConstant 3.674022E-40 
                                f32 %117 = OpConstant 3.674022E-40 
                                f32 %118 = OpConstant 3.674022E-40 
                                f32 %123 = OpConstant 3.674022E-40 
                                f32 %124 = OpConstant 3.674022E-40 
                              f32_4 %125 = OpConstantComposite %123 %123 %124 %124 
                     Private f32_2* %127 = OpVariable Private 
                              f32_2 %130 = OpConstantComposite %123 %124 
                                    %149 = OpTypeVector %6 3 
                     Private f32_4* %153 = OpVariable Private 
                                f32 %159 = OpConstant 3.674022E-40 
                                f32 %166 = OpConstant 3.674022E-40 
                                u32 %174 = OpConstant 1 
                                f32 %190 = OpConstant 3.674022E-40 
                                f32 %208 = OpConstant 3.674022E-40 
                              f32_4 %209 = OpConstantComposite %190 %190 %190 %208 
                                u32 %211 = OpConstant 3 
                                f32 %216 = OpConstant 3.674022E-40 
                                f32 %228 = OpConstant 3.674022E-40 
                      Private bool* %240 = OpVariable Private 
                                    %247 = OpTypePointer Function %6 
                                    %256 = OpTypePointer Output %7 
                      Output f32_4* %257 = OpVariable Output 
                                f32 %261 = OpConstant 3.674022E-40 
                              f32_3 %262 = OpConstantComposite %261 %261 %261 
                                f32 %269 = OpConstant 3.674022E-40 
                                    %270 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Function f32* %248 = OpVariable Function 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                               f32_2 %23 = OpFMul %13 %22 
                      Uniform f32_4* %24 = OpAccessChain %16 %18 
                               f32_4 %25 = OpLoad %24 
                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                               f32_2 %27 = OpFAdd %23 %26 
                               f32_4 %28 = OpLoad %9 
                               f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                        Uniform f32* %34 = OpAccessChain %16 %32 
                                 f32 %35 = OpLoad %34 
                               f32_2 %36 = OpCompositeConstruct %35 %35 
                               f32_2 %40 = OpFMul %36 %39 
                               f32_4 %41 = OpLoad %9 
                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               f32_2 %43 = OpFAdd %40 %42 
                                             OpStore %31 %43 
                 read_only Texture2D %48 = OpLoad %47 
                             sampler %52 = OpLoad %51 
          read_only Texture2DSampled %54 = OpSampledImage %48 %52 
                               f32_2 %55 = OpLoad %31 
                               f32_4 %56 = OpImageSampleImplicitLod %54 %55 
                                             OpStore %44 %56 
                               f32_4 %57 = OpLoad %44 
                                 f32 %63 = OpDot %57 %62 
                        Private f32* %67 = OpAccessChain %31 %65 
                                             OpStore %67 %63 
                        Uniform f32* %68 = OpAccessChain %16 %32 
                                 f32 %69 = OpLoad %68 
                               f32_2 %70 = OpCompositeConstruct %69 %69 
                               f32_2 %71 = OpFNegate %70 
                               f32_2 %73 = OpFMul %71 %72 
                               f32_4 %74 = OpLoad %9 
                               f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                               f32_2 %76 = OpFAdd %73 %75 
                               f32_4 %77 = OpLoad %44 
                               f32_4 %78 = OpVectorShuffle %77 %76 4 5 2 3 
                                             OpStore %44 %78 
                 read_only Texture2D %79 = OpLoad %47 
                             sampler %80 = OpLoad %51 
          read_only Texture2DSampled %81 = OpSampledImage %79 %80 
                               f32_4 %82 = OpLoad %44 
                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                               f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                             OpStore %44 %84 
                               f32_4 %86 = OpLoad %44 
                                 f32 %87 = OpDot %86 %62 
                                             OpStore %85 %87 
                        Private f32* %88 = OpAccessChain %31 %65 
                                 f32 %89 = OpLoad %88 
                                 f32 %91 = OpFMul %89 %90 
                                 f32 %92 = OpLoad %85 
                                 f32 %93 = OpFNegate %92 
                                 f32 %94 = OpFAdd %91 %93 
                        Private f32* %95 = OpAccessChain %31 %65 
                                             OpStore %95 %94 
                                 f32 %96 = OpLoad %85 
                                 f32 %98 = OpFMul %96 %97 
                        Private f32* %99 = OpAccessChain %31 %65 
                                f32 %100 = OpLoad %99 
                                f32 %101 = OpFAdd %98 %100 
                       Private f32* %102 = OpAccessChain %31 %65 
                                             OpStore %102 %101 
                       Private f32* %103 = OpAccessChain %31 %65 
                                f32 %104 = OpLoad %103 
                       Private f32* %105 = OpAccessChain %31 %65 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpFMul %104 %106 
                       Private f32* %108 = OpAccessChain %31 %65 
                                             OpStore %108 %107 
                       Private f32* %113 = OpAccessChain %31 %65 
                                f32 %114 = OpLoad %113 
                               bool %115 = OpFOrdLessThan %112 %114 
                                             OpStore %111 %115 
                               bool %116 = OpLoad %111 
                                f32 %119 = OpSelect %116 %117 %118 
                       Private f32* %120 = OpAccessChain %31 %65 
                                             OpStore %120 %119 
                              f32_4 %121 = OpLoad %9 
                              f32_4 %122 = OpVectorShuffle %121 %121 0 1 0 1 
                              f32_4 %126 = OpFMul %122 %125 
                                             OpStore %44 %126 
                              f32_4 %128 = OpLoad %9 
                              f32_2 %129 = OpVectorShuffle %128 %128 0 0 
                              f32_2 %131 = OpFMul %129 %130 
                              f32_4 %132 = OpLoad %44 
                              f32_2 %133 = OpVectorShuffle %132 %132 1 3 
                              f32_2 %134 = OpFNegate %133 
                              f32_2 %135 = OpFAdd %131 %134 
                                             OpStore %127 %135 
                              f32_4 %136 = OpLoad %44 
                              f32_2 %137 = OpVectorShuffle %136 %136 1 3 
                              f32_4 %138 = OpLoad %44 
                              f32_2 %139 = OpVectorShuffle %138 %138 0 2 
                              f32_2 %140 = OpFAdd %137 %139 
                              f32_4 %141 = OpLoad %44 
                              f32_4 %142 = OpVectorShuffle %141 %140 4 5 2 3 
                                             OpStore %44 %142 
                read_only Texture2D %143 = OpLoad %47 
                            sampler %144 = OpLoad %51 
         read_only Texture2DSampled %145 = OpSampledImage %143 %144 
                              f32_4 %146 = OpLoad %9 
                              f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                              f32_4 %148 = OpImageSampleImplicitLod %145 %147 
                              f32_3 %150 = OpVectorShuffle %148 %148 0 1 2 
                              f32_4 %151 = OpLoad %9 
                              f32_4 %152 = OpVectorShuffle %151 %150 4 5 2 6 
                                             OpStore %9 %152 
                              f32_4 %154 = OpLoad %9 
                              f32_4 %155 = OpVectorShuffle %154 %154 0 1 3 0 
                              f32_4 %156 = OpLoad %9 
                              f32_4 %157 = OpVectorShuffle %156 %156 0 1 3 0 
                              f32_4 %158 = OpFAdd %155 %157 
                                             OpStore %153 %158 
                       Uniform f32* %160 = OpAccessChain %16 %32 
                                f32 %161 = OpLoad %160 
                                f32 %162 = OpFDiv %159 %161 
                       Private f32* %163 = OpAccessChain %9 %65 
                                             OpStore %163 %162 
                       Private f32* %164 = OpAccessChain %9 %65 
                                f32 %165 = OpLoad %164 
                                f32 %167 = OpFMul %165 %166 
                       Private f32* %168 = OpAccessChain %9 %65 
                                             OpStore %168 %167 
                       Private f32* %169 = OpAccessChain %9 %65 
                                f32 %170 = OpLoad %169 
                       Private f32* %171 = OpAccessChain %127 %65 
                                f32 %172 = OpLoad %171 
                                f32 %173 = OpFMul %170 %172 
                       Private f32* %175 = OpAccessChain %9 %174 
                                             OpStore %175 %173 
                       Private f32* %176 = OpAccessChain %9 %65 
                                f32 %177 = OpLoad %176 
                       Private f32* %178 = OpAccessChain %44 %65 
                                f32 %179 = OpLoad %178 
                                f32 %180 = OpFMul %177 %179 
                       Private f32* %181 = OpAccessChain %9 %65 
                                             OpStore %181 %180 
                              f32_4 %182 = OpLoad %9 
                              f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                              f32_2 %184 = OpExtInst %1 14 %183 
                              f32_4 %185 = OpLoad %9 
                              f32_4 %186 = OpVectorShuffle %185 %184 4 5 2 3 
                                             OpStore %9 %186 
                       Private f32* %187 = OpAccessChain %9 %65 
                                f32 %188 = OpLoad %187 
                                f32 %189 = OpFMul %188 %61 
                                f32 %191 = OpFAdd %189 %190 
                       Private f32* %192 = OpAccessChain %9 %65 
                                             OpStore %192 %191 
                       Private f32* %193 = OpAccessChain %9 %174 
                                f32 %194 = OpLoad %193 
                                f32 %195 = OpFMul %194 %61 
                       Private f32* %196 = OpAccessChain %9 %65 
                                f32 %197 = OpLoad %196 
                                f32 %198 = OpFAdd %195 %197 
                       Private f32* %199 = OpAccessChain %9 %65 
                                             OpStore %199 %198 
                              f32_2 %200 = OpLoad %31 
                              f32_4 %201 = OpVectorShuffle %200 %200 0 0 0 0 
                              f32_4 %202 = OpLoad %9 
                              f32_4 %203 = OpVectorShuffle %202 %202 0 0 0 0 
                              f32_4 %204 = OpFMul %201 %203 
                              f32_4 %205 = OpLoad %153 
                              f32_4 %206 = OpFAdd %204 %205 
                                             OpStore %9 %206 
                              f32_4 %207 = OpLoad %9 
                              f32_4 %210 = OpFMul %207 %209 
                                             OpStore %9 %210 
                       Private f32* %212 = OpAccessChain %9 %211 
                                f32 %213 = OpLoad %212 
                                f32 %214 = OpExtInst %1 8 %213 
                                             OpStore %85 %214 
                                f32 %215 = OpLoad %85 
                                f32 %217 = OpFMul %215 %216 
                                             OpStore %85 %217 
                       Private f32* %218 = OpAccessChain %44 %174 
                                f32 %219 = OpLoad %218 
                                f32 %220 = OpLoad %85 
                                f32 %221 = OpFMul %219 %220 
                       Private f32* %222 = OpAccessChain %44 %65 
                                             OpStore %222 %221 
                       Private f32* %223 = OpAccessChain %127 %174 
                                f32 %224 = OpLoad %223 
                                f32 %225 = OpLoad %85 
                                f32 %226 = OpFMul %224 %225 
                                             OpStore %85 %226 
                                f32 %227 = OpLoad %85 
                                f32 %229 = OpFMul %227 %228 
                                             OpStore %85 %229 
                                f32 %230 = OpLoad %85 
                                f32 %231 = OpExtInst %1 13 %230 
                                             OpStore %85 %231 
                       Private f32* %232 = OpAccessChain %44 %65 
                                f32 %233 = OpLoad %232 
                                f32 %234 = OpFMul %233 %228 
                       Private f32* %235 = OpAccessChain %44 %65 
                                             OpStore %235 %234 
                       Private f32* %236 = OpAccessChain %44 %65 
                                f32 %237 = OpLoad %236 
                                f32 %238 = OpExtInst %1 13 %237 
                       Private f32* %239 = OpAccessChain %44 %65 
                                             OpStore %239 %238 
                       Private f32* %241 = OpAccessChain %9 %65 
                                f32 %242 = OpLoad %241 
                       Private f32* %243 = OpAccessChain %9 %174 
                                f32 %244 = OpLoad %243 
                               bool %245 = OpFOrdLessThan %242 %244 
                                             OpStore %240 %245 
                               bool %246 = OpLoad %240 
                                             OpSelectionMerge %250 None 
                                             OpBranchConditional %246 %249 %252 
                                    %249 = OpLabel 
                                f32 %251 = OpLoad %85 
                                             OpStore %248 %251 
                                             OpBranch %250 
                                    %252 = OpLabel 
                       Private f32* %253 = OpAccessChain %44 %65 
                                f32 %254 = OpLoad %253 
                                             OpStore %248 %254 
                                             OpBranch %250 
                                    %250 = OpLabel 
                                f32 %255 = OpLoad %248 
                                             OpStore %85 %255 
                                f32 %258 = OpLoad %85 
                              f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                              f32_3 %260 = OpFNegate %259 
                              f32_3 %263 = OpFMul %260 %262 
                              f32_4 %264 = OpLoad %9 
                              f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                              f32_3 %266 = OpFAdd %263 %265 
                              f32_4 %267 = OpLoad %257 
                              f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                             OpStore %257 %268 
                        Output f32* %271 = OpAccessChain %257 %211 
                                             OpStore %271 %269 
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