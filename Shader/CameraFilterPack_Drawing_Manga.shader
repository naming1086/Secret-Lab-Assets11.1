//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Manga" {
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
  GpuProgramID 51235
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
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
float u_xlat8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat1 = u_xlat0 + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0.x = dot(u_xlat1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
    u_xlat4.x = dot(u_xlat2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
    u_xlat1 = u_xlat0.zwzw + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
    u_xlat2 = texture(_MainTex, u_xlat1.zw);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = dot(u_xlat1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
    u_xlat5 = dot(u_xlat2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
    u_xlat4.x = u_xlat4.x * 2.0 + u_xlat5;
    u_xlat4.x = u_xlat0.x + u_xlat4.x;
    u_xlat2 = u_xlat0.zwzw + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat9.x = dot(u_xlat2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
    u_xlat9.y = dot(u_xlat3, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
    u_xlat4.x = u_xlat4.x + (-u_xlat9.y);
    u_xlat0.y = (-u_xlat9.y) * 2.0 + u_xlat4.x;
    u_xlat0.x = u_xlat0.x + u_xlat9.x;
    u_xlat0.x = u_xlat1.x * 2.0 + u_xlat0.x;
    u_xlat0.xy = (-u_xlat9.yx) + u_xlat0.xy;
    u_xlat0.x = (-u_xlat1.x) * 2.0 + u_xlat0.x;
    u_xlat0.x = (-u_xlat5) + u_xlat0.x;
    u_xlat4.x = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat4.x;
    u_xlatb0 = 0.0399999991<u_xlat0.x;
    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zw * vec2(0.707106411, 0.707106411);
    u_xlat4.x = u_xlat0.z * 0.707106411 + (-u_xlat1.y);
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat2 = texture(_MainTex, u_xlat0.zw);
    u_xlat8 = 2136.28125 / _DotSize;
    u_xlat8 = u_xlat8 * 1.66666663;
    u_xlat4.x = u_xlat8 * u_xlat4.x;
    u_xlat4.y = u_xlat8 * u_xlat1.x;
    u_xlat4.xy = cos(u_xlat4.xy);
    u_xlat8 = u_xlat4.y * 0.25 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.25 + u_xlat8;
    u_xlat8 = _DotSize * 0.125 + -0.200000018;
    u_xlat8 = (-u_xlat8) + u_xlat2.x;
    u_xlat8 = u_xlat8 * 3.33333349;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat12 = u_xlat8 * -2.0 + 3.0;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat12 * u_xlat8 + u_xlat4.x;
    u_xlat8 = u_xlat8 * u_xlat12;
    u_xlatb12 = 0.300000012<u_xlat8;
    u_xlat8 = (u_xlatb12) ? u_xlat1.x : u_xlat8;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xxx + vec3(u_xlat8);
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
; Bound: 339
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %324 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %42 DescriptorSet 42 
                                             OpDecorate %42 Binding 42 
                                             OpDecorate %324 Location 324 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %15 = OpTypeStruct %6 %7 
                                     %16 = OpTypePointer Uniform %15 
       Uniform struct {f32; f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 1 
                                     %20 = OpTypePointer Uniform %7 
                      Private f32_4* %29 = OpVariable Private 
                                 f32 %31 = OpConstant 3.674022E-40 
                                 f32 %32 = OpConstant 3.674022E-40 
                               f32_4 %33 = OpConstantComposite %31 %32 %32 %32 
                      Private f32_4* %35 = OpVariable Private 
                                     %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %37 = OpTypePointer UniformConstant %36 
UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
                                     %40 = OpTypeSampler 
                                     %41 = OpTypePointer UniformConstant %40 
            UniformConstant sampler* %42 = OpVariable UniformConstant 
                                     %44 = OpTypeSampledImage %36 
                                 f32 %56 = OpConstant 3.674022E-40 
                                 f32 %57 = OpConstant 3.674022E-40 
                                 f32 %58 = OpConstant 3.674022E-40 
                                 f32 %59 = OpConstant 3.674022E-40 
                               f32_4 %60 = OpConstantComposite %56 %57 %58 %59 
                                     %62 = OpTypeInt 32 0 
                                 u32 %63 = OpConstant 0 
                                     %64 = OpTypePointer Private %6 
                                     %66 = OpTypeVector %6 3 
                                     %67 = OpTypePointer Private %66 
                      Private f32_3* %68 = OpVariable Private 
                                 f32 %74 = OpConstant 3.674022E-40 
                               f32_4 %75 = OpConstantComposite %74 %31 %74 %32 
                        Private f32* %92 = OpVariable Private 
                                 f32 %97 = OpConstant 3.674022E-40 
                              f32_4 %110 = OpConstantComposite %74 %74 %32 %74 
                     Private f32_4* %112 = OpVariable Private 
                                    %125 = OpTypePointer Private %10 
                     Private f32_2* %126 = OpVariable Private 
                                u32 %132 = OpConstant 1 
                                    %199 = OpTypeBool 
                                    %200 = OpTypePointer Private %199 
                      Private bool* %201 = OpVariable Private 
                                f32 %202 = OpConstant 3.674022E-40 
                                f32 %207 = OpConstant 3.674022E-40 
                                f32 %212 = OpConstant 3.674022E-40 
                              f32_2 %213 = OpConstantComposite %212 %212 
                                u32 %217 = OpConstant 2 
                       Private f32* %232 = OpVariable Private 
                       Private f32* %240 = OpVariable Private 
                                f32 %241 = OpConstant 3.674022E-40 
                                i32 %242 = OpConstant 0 
                                    %243 = OpTypePointer Uniform %6 
                                f32 %248 = OpConstant 3.674022E-40 
                                f32 %268 = OpConstant 3.674022E-40 
                                f32 %278 = OpConstant 3.674022E-40 
                                f32 %280 = OpConstant 3.674022E-40 
                                f32 %287 = OpConstant 3.674022E-40 
                                f32 %290 = OpConstant 3.674022E-40 
                                f32 %293 = OpConstant 3.674022E-40 
                                f32 %295 = OpConstant 3.674022E-40 
                      Private bool* %310 = OpVariable Private 
                                    %314 = OpTypePointer Function %6 
                                    %323 = OpTypePointer Output %7 
                      Output f32_4* %324 = OpVariable Output 
                                u32 %335 = OpConstant 3 
                                    %336 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Function f32* %315 = OpVariable Function 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                      Uniform f32_4* %21 = OpAccessChain %17 %19 
                               f32_4 %22 = OpLoad %21 
                               f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
                               f32_4 %24 = OpFMul %14 %23 
                      Uniform f32_4* %25 = OpAccessChain %17 %19 
                               f32_4 %26 = OpLoad %25 
                               f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
                               f32_4 %28 = OpFAdd %24 %27 
                                             OpStore %9 %28 
                               f32_4 %30 = OpLoad %9 
                               f32_4 %34 = OpFAdd %30 %33 
                                             OpStore %29 %34 
                 read_only Texture2D %39 = OpLoad %38 
                             sampler %43 = OpLoad %42 
          read_only Texture2DSampled %45 = OpSampledImage %39 %43 
                               f32_4 %46 = OpLoad %29 
                               f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                             OpStore %35 %48 
                 read_only Texture2D %49 = OpLoad %38 
                             sampler %50 = OpLoad %42 
          read_only Texture2DSampled %51 = OpSampledImage %49 %50 
                               f32_4 %52 = OpLoad %29 
                               f32_2 %53 = OpVectorShuffle %52 %52 2 3 
                               f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                             OpStore %29 %54 
                               f32_4 %55 = OpLoad %29 
                                 f32 %61 = OpDot %55 %60 
                        Private f32* %65 = OpAccessChain %9 %63 
                                             OpStore %65 %61 
                               f32_4 %69 = OpLoad %35 
                                 f32 %70 = OpDot %69 %60 
                        Private f32* %71 = OpAccessChain %68 %63 
                                             OpStore %71 %70 
                               f32_4 %72 = OpLoad %9 
                               f32_4 %73 = OpVectorShuffle %72 %72 2 3 2 3 
                               f32_4 %76 = OpFAdd %73 %75 
                                             OpStore %29 %76 
                 read_only Texture2D %77 = OpLoad %38 
                             sampler %78 = OpLoad %42 
          read_only Texture2DSampled %79 = OpSampledImage %77 %78 
                               f32_4 %80 = OpLoad %29 
                               f32_2 %81 = OpVectorShuffle %80 %80 2 3 
                               f32_4 %82 = OpImageSampleImplicitLod %79 %81 
                                             OpStore %35 %82 
                 read_only Texture2D %83 = OpLoad %38 
                             sampler %84 = OpLoad %42 
          read_only Texture2DSampled %85 = OpSampledImage %83 %84 
                               f32_4 %86 = OpLoad %29 
                               f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                               f32_4 %88 = OpImageSampleImplicitLod %85 %87 
                                             OpStore %29 %88 
                               f32_4 %89 = OpLoad %29 
                                 f32 %90 = OpDot %89 %60 
                        Private f32* %91 = OpAccessChain %29 %63 
                                             OpStore %91 %90 
                               f32_4 %93 = OpLoad %35 
                                 f32 %94 = OpDot %93 %60 
                                             OpStore %92 %94 
                        Private f32* %95 = OpAccessChain %68 %63 
                                 f32 %96 = OpLoad %95 
                                 f32 %98 = OpFMul %96 %97 
                                 f32 %99 = OpLoad %92 
                                f32 %100 = OpFAdd %98 %99 
                       Private f32* %101 = OpAccessChain %68 %63 
                                             OpStore %101 %100 
                       Private f32* %102 = OpAccessChain %9 %63 
                                f32 %103 = OpLoad %102 
                       Private f32* %104 = OpAccessChain %68 %63 
                                f32 %105 = OpLoad %104 
                                f32 %106 = OpFAdd %103 %105 
                       Private f32* %107 = OpAccessChain %68 %63 
                                             OpStore %107 %106 
                              f32_4 %108 = OpLoad %9 
                              f32_4 %109 = OpVectorShuffle %108 %108 2 3 2 3 
                              f32_4 %111 = OpFAdd %109 %110 
                                             OpStore %35 %111 
                read_only Texture2D %113 = OpLoad %38 
                            sampler %114 = OpLoad %42 
         read_only Texture2DSampled %115 = OpSampledImage %113 %114 
                              f32_4 %116 = OpLoad %35 
                              f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                              f32_4 %118 = OpImageSampleImplicitLod %115 %117 
                                             OpStore %112 %118 
                read_only Texture2D %119 = OpLoad %38 
                            sampler %120 = OpLoad %42 
         read_only Texture2DSampled %121 = OpSampledImage %119 %120 
                              f32_4 %122 = OpLoad %35 
                              f32_2 %123 = OpVectorShuffle %122 %122 2 3 
                              f32_4 %124 = OpImageSampleImplicitLod %121 %123 
                                             OpStore %35 %124 
                              f32_4 %127 = OpLoad %35 
                                f32 %128 = OpDot %127 %60 
                       Private f32* %129 = OpAccessChain %126 %63 
                                             OpStore %129 %128 
                              f32_4 %130 = OpLoad %112 
                                f32 %131 = OpDot %130 %60 
                       Private f32* %133 = OpAccessChain %126 %132 
                                             OpStore %133 %131 
                       Private f32* %134 = OpAccessChain %68 %63 
                                f32 %135 = OpLoad %134 
                       Private f32* %136 = OpAccessChain %126 %132 
                                f32 %137 = OpLoad %136 
                                f32 %138 = OpFNegate %137 
                                f32 %139 = OpFAdd %135 %138 
                       Private f32* %140 = OpAccessChain %68 %63 
                                             OpStore %140 %139 
                       Private f32* %141 = OpAccessChain %126 %132 
                                f32 %142 = OpLoad %141 
                                f32 %143 = OpFNegate %142 
                                f32 %144 = OpFMul %143 %97 
                       Private f32* %145 = OpAccessChain %68 %63 
                                f32 %146 = OpLoad %145 
                                f32 %147 = OpFAdd %144 %146 
                       Private f32* %148 = OpAccessChain %9 %132 
                                             OpStore %148 %147 
                       Private f32* %149 = OpAccessChain %9 %63 
                                f32 %150 = OpLoad %149 
                       Private f32* %151 = OpAccessChain %126 %63 
                                f32 %152 = OpLoad %151 
                                f32 %153 = OpFAdd %150 %152 
                       Private f32* %154 = OpAccessChain %9 %63 
                                             OpStore %154 %153 
                       Private f32* %155 = OpAccessChain %29 %63 
                                f32 %156 = OpLoad %155 
                                f32 %157 = OpFMul %156 %97 
                       Private f32* %158 = OpAccessChain %9 %63 
                                f32 %159 = OpLoad %158 
                                f32 %160 = OpFAdd %157 %159 
                       Private f32* %161 = OpAccessChain %9 %63 
                                             OpStore %161 %160 
                              f32_2 %162 = OpLoad %126 
                              f32_2 %163 = OpVectorShuffle %162 %162 1 0 
                              f32_2 %164 = OpFNegate %163 
                              f32_4 %165 = OpLoad %9 
                              f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                              f32_2 %167 = OpFAdd %164 %166 
                              f32_4 %168 = OpLoad %9 
                              f32_4 %169 = OpVectorShuffle %168 %167 4 5 2 3 
                                             OpStore %9 %169 
                       Private f32* %170 = OpAccessChain %29 %63 
                                f32 %171 = OpLoad %170 
                                f32 %172 = OpFNegate %171 
                                f32 %173 = OpFMul %172 %97 
                       Private f32* %174 = OpAccessChain %9 %63 
                                f32 %175 = OpLoad %174 
                                f32 %176 = OpFAdd %173 %175 
                       Private f32* %177 = OpAccessChain %9 %63 
                                             OpStore %177 %176 
                                f32 %178 = OpLoad %92 
                                f32 %179 = OpFNegate %178 
                       Private f32* %180 = OpAccessChain %9 %63 
                                f32 %181 = OpLoad %180 
                                f32 %182 = OpFAdd %179 %181 
                       Private f32* %183 = OpAccessChain %9 %63 
                                             OpStore %183 %182 
                       Private f32* %184 = OpAccessChain %9 %132 
                                f32 %185 = OpLoad %184 
                       Private f32* %186 = OpAccessChain %9 %132 
                                f32 %187 = OpLoad %186 
                                f32 %188 = OpFMul %185 %187 
                       Private f32* %189 = OpAccessChain %68 %63 
                                             OpStore %189 %188 
                       Private f32* %190 = OpAccessChain %9 %63 
                                f32 %191 = OpLoad %190 
                       Private f32* %192 = OpAccessChain %9 %63 
                                f32 %193 = OpLoad %192 
                                f32 %194 = OpFMul %191 %193 
                       Private f32* %195 = OpAccessChain %68 %63 
                                f32 %196 = OpLoad %195 
                                f32 %197 = OpFAdd %194 %196 
                       Private f32* %198 = OpAccessChain %9 %63 
                                             OpStore %198 %197 
                       Private f32* %203 = OpAccessChain %9 %63 
                                f32 %204 = OpLoad %203 
                               bool %205 = OpFOrdLessThan %202 %204 
                                             OpStore %201 %205 
                               bool %206 = OpLoad %201 
                                f32 %208 = OpSelect %206 %207 %31 
                       Private f32* %209 = OpAccessChain %9 %63 
                                             OpStore %209 %208 
                              f32_4 %210 = OpLoad %9 
                              f32_2 %211 = OpVectorShuffle %210 %210 2 3 
                              f32_2 %214 = OpFMul %211 %213 
                              f32_4 %215 = OpLoad %29 
                              f32_4 %216 = OpVectorShuffle %215 %214 4 5 2 3 
                                             OpStore %29 %216 
                       Private f32* %218 = OpAccessChain %9 %217 
                                f32 %219 = OpLoad %218 
                                f32 %220 = OpFMul %219 %212 
                       Private f32* %221 = OpAccessChain %29 %132 
                                f32 %222 = OpLoad %221 
                                f32 %223 = OpFNegate %222 
                                f32 %224 = OpFAdd %220 %223 
                       Private f32* %225 = OpAccessChain %68 %63 
                                             OpStore %225 %224 
                       Private f32* %226 = OpAccessChain %29 %132 
                                f32 %227 = OpLoad %226 
                       Private f32* %228 = OpAccessChain %29 %63 
                                f32 %229 = OpLoad %228 
                                f32 %230 = OpFAdd %227 %229 
                       Private f32* %231 = OpAccessChain %29 %63 
                                             OpStore %231 %230 
                read_only Texture2D %233 = OpLoad %38 
                            sampler %234 = OpLoad %42 
         read_only Texture2DSampled %235 = OpSampledImage %233 %234 
                              f32_4 %236 = OpLoad %9 
                              f32_2 %237 = OpVectorShuffle %236 %236 2 3 
                              f32_4 %238 = OpImageSampleImplicitLod %235 %237 
                                f32 %239 = OpCompositeExtract %238 0 
                                             OpStore %232 %239 
                       Uniform f32* %244 = OpAccessChain %17 %242 
                                f32 %245 = OpLoad %244 
                                f32 %246 = OpFDiv %241 %245 
                                             OpStore %240 %246 
                                f32 %247 = OpLoad %240 
                                f32 %249 = OpFMul %247 %248 
                                             OpStore %240 %249 
                                f32 %250 = OpLoad %240 
                       Private f32* %251 = OpAccessChain %68 %63 
                                f32 %252 = OpLoad %251 
                                f32 %253 = OpFMul %250 %252 
                       Private f32* %254 = OpAccessChain %68 %63 
                                             OpStore %254 %253 
                                f32 %255 = OpLoad %240 
                       Private f32* %256 = OpAccessChain %29 %63 
                                f32 %257 = OpLoad %256 
                                f32 %258 = OpFMul %255 %257 
                       Private f32* %259 = OpAccessChain %68 %217 
                                             OpStore %259 %258 
                              f32_3 %260 = OpLoad %68 
                              f32_2 %261 = OpVectorShuffle %260 %260 0 2 
                              f32_2 %262 = OpExtInst %1 14 %261 
                              f32_3 %263 = OpLoad %68 
                              f32_3 %264 = OpVectorShuffle %263 %262 3 1 4 
                                             OpStore %68 %264 
                       Private f32* %265 = OpAccessChain %68 %217 
                                f32 %266 = OpLoad %265 
                                f32 %267 = OpFMul %266 %59 
                                f32 %269 = OpFAdd %267 %268 
                                             OpStore %240 %269 
                       Private f32* %270 = OpAccessChain %68 %63 
                                f32 %271 = OpLoad %270 
                                f32 %272 = OpFMul %271 %59 
                                f32 %273 = OpLoad %240 
                                f32 %274 = OpFAdd %272 %273 
                       Private f32* %275 = OpAccessChain %68 %63 
                                             OpStore %275 %274 
                       Uniform f32* %276 = OpAccessChain %17 %242 
                                f32 %277 = OpLoad %276 
                                f32 %279 = OpFMul %277 %278 
                                f32 %281 = OpFAdd %279 %280 
                                             OpStore %240 %281 
                                f32 %282 = OpLoad %240 
                                f32 %283 = OpFNegate %282 
                                f32 %284 = OpLoad %232 
                                f32 %285 = OpFAdd %283 %284 
                                             OpStore %232 %285 
                                f32 %286 = OpLoad %232 
                                f32 %288 = OpFMul %286 %287 
                                             OpStore %232 %288 
                                f32 %289 = OpLoad %232 
                                f32 %291 = OpExtInst %1 43 %289 %31 %290 
                                             OpStore %232 %291 
                                f32 %292 = OpLoad %232 
                                f32 %294 = OpFMul %292 %293 
                                f32 %296 = OpFAdd %294 %295 
                                             OpStore %240 %296 
                                f32 %297 = OpLoad %232 
                                f32 %298 = OpLoad %232 
                                f32 %299 = OpFMul %297 %298 
                                             OpStore %232 %299 
                                f32 %300 = OpLoad %240 
                                f32 %301 = OpLoad %232 
                                f32 %302 = OpFMul %300 %301 
                       Private f32* %303 = OpAccessChain %68 %63 
                                f32 %304 = OpLoad %303 
                                f32 %305 = OpFAdd %302 %304 
                       Private f32* %306 = OpAccessChain %29 %63 
                                             OpStore %306 %305 
                                f32 %307 = OpLoad %232 
                                f32 %308 = OpLoad %240 
                                f32 %309 = OpFMul %307 %308 
                                             OpStore %232 %309 
                                f32 %311 = OpLoad %232 
                               bool %312 = OpFOrdLessThan %56 %311 
                                             OpStore %310 %312 
                               bool %313 = OpLoad %310 
                                             OpSelectionMerge %317 None 
                                             OpBranchConditional %313 %316 %320 
                                    %316 = OpLabel 
                       Private f32* %318 = OpAccessChain %29 %63 
                                f32 %319 = OpLoad %318 
                                             OpStore %315 %319 
                                             OpBranch %317 
                                    %320 = OpLabel 
                                f32 %321 = OpLoad %232 
                                             OpStore %315 %321 
                                             OpBranch %317 
                                    %317 = OpLabel 
                                f32 %322 = OpLoad %315 
                                             OpStore %232 %322 
                              f32_4 %325 = OpLoad %9 
                              f32_3 %326 = OpVectorShuffle %325 %325 0 0 0 
                              f32_3 %327 = OpLoad %68 
                              f32_3 %328 = OpVectorShuffle %327 %327 0 0 0 
                              f32_3 %329 = OpFMul %326 %328 
                                f32 %330 = OpLoad %232 
                              f32_3 %331 = OpCompositeConstruct %330 %330 %330 
                              f32_3 %332 = OpFAdd %329 %331 
                              f32_4 %333 = OpLoad %324 
                              f32_4 %334 = OpVectorShuffle %333 %332 4 5 6 3 
                                             OpStore %324 %334 
                        Output f32* %337 = OpAccessChain %324 %335 
                                             OpStore %337 %290 
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