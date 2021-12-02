//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Manga4" {
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
  GpuProgramID 59112
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
vec3 u_xlat4;
float u_xlat5;
float u_xlat8;
vec2 u_xlat9;
bool u_xlatb13;
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
    u_xlat0.x = dot(u_xlat0.xx, u_xlat4.xx);
    u_xlat4.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + (-u_xlat4.xxx);
    u_xlat1.x = _DotSize * 0.125 + -0.200000018;
    u_xlat1.x = u_xlat1.x * -3.33333349;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xxx + u_xlat2.xyy;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat1.xzz;
    u_xlatb13 = 0.300000012<u_xlat1.x;
    u_xlat4.xyz = (bool(u_xlatb13)) ? u_xlat4.xyz : u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xxx + u_xlat4.xyz;
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
; Bound: 361
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %350 
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
                                             OpDecorate %350 Location 350 
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
                      Private f32_3* %92 = OpVariable Private 
                                 f32 %98 = OpConstant 3.674022E-40 
                              f32_4 %112 = OpConstantComposite %74 %74 %32 %74 
                     Private f32_4* %114 = OpVariable Private 
                                    %127 = OpTypePointer Private %10 
                     Private f32_2* %128 = OpVariable Private 
                                u32 %134 = OpConstant 1 
                                    %202 = OpTypeBool 
                                    %203 = OpTypePointer Private %202 
                      Private bool* %204 = OpVariable Private 
                                f32 %205 = OpConstant 3.674022E-40 
                                f32 %210 = OpConstant 3.674022E-40 
                                f32 %215 = OpConstant 3.674022E-40 
                              f32_2 %216 = OpConstantComposite %215 %215 
                                u32 %220 = OpConstant 2 
                       Private f32* %242 = OpVariable Private 
                                f32 %243 = OpConstant 3.674022E-40 
                                i32 %244 = OpConstant 0 
                                    %245 = OpTypePointer Uniform %6 
                                f32 %250 = OpConstant 3.674022E-40 
                                f32 %270 = OpConstant 3.674022E-40 
                              f32_3 %285 = OpConstantComposite %98 %98 %98 
                                f32 %293 = OpConstant 3.674022E-40 
                                f32 %295 = OpConstant 3.674022E-40 
                                f32 %300 = OpConstant 3.674022E-40 
                                f32 %305 = OpConstant 3.674022E-40 
                       Private f32* %308 = OpVariable Private 
                                f32 %311 = OpConstant 3.674022E-40 
                                f32 %313 = OpConstant 3.674022E-40 
                      Private bool* %335 = OpVariable Private 
                                    %340 = OpTypePointer Function %66 
                                    %349 = OpTypePointer Output %7 
                      Output f32_4* %350 = OpVariable Output 
                                u32 %357 = OpConstant 3 
                                    %358 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %341 = OpVariable Function 
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
                        Private f32* %95 = OpAccessChain %92 %63 
                                             OpStore %95 %94 
                        Private f32* %96 = OpAccessChain %68 %63 
                                 f32 %97 = OpLoad %96 
                                 f32 %99 = OpFMul %97 %98 
                       Private f32* %100 = OpAccessChain %92 %63 
                                f32 %101 = OpLoad %100 
                                f32 %102 = OpFAdd %99 %101 
                       Private f32* %103 = OpAccessChain %68 %63 
                                             OpStore %103 %102 
                       Private f32* %104 = OpAccessChain %9 %63 
                                f32 %105 = OpLoad %104 
                       Private f32* %106 = OpAccessChain %68 %63 
                                f32 %107 = OpLoad %106 
                                f32 %108 = OpFAdd %105 %107 
                       Private f32* %109 = OpAccessChain %68 %63 
                                             OpStore %109 %108 
                              f32_4 %110 = OpLoad %9 
                              f32_4 %111 = OpVectorShuffle %110 %110 2 3 2 3 
                              f32_4 %113 = OpFAdd %111 %112 
                                             OpStore %35 %113 
                read_only Texture2D %115 = OpLoad %38 
                            sampler %116 = OpLoad %42 
         read_only Texture2DSampled %117 = OpSampledImage %115 %116 
                              f32_4 %118 = OpLoad %35 
                              f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                              f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                             OpStore %114 %120 
                read_only Texture2D %121 = OpLoad %38 
                            sampler %122 = OpLoad %42 
         read_only Texture2DSampled %123 = OpSampledImage %121 %122 
                              f32_4 %124 = OpLoad %35 
                              f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              f32_4 %126 = OpImageSampleImplicitLod %123 %125 
                                             OpStore %35 %126 
                              f32_4 %129 = OpLoad %35 
                                f32 %130 = OpDot %129 %60 
                       Private f32* %131 = OpAccessChain %128 %63 
                                             OpStore %131 %130 
                              f32_4 %132 = OpLoad %114 
                                f32 %133 = OpDot %132 %60 
                       Private f32* %135 = OpAccessChain %128 %134 
                                             OpStore %135 %133 
                       Private f32* %136 = OpAccessChain %68 %63 
                                f32 %137 = OpLoad %136 
                       Private f32* %138 = OpAccessChain %128 %134 
                                f32 %139 = OpLoad %138 
                                f32 %140 = OpFNegate %139 
                                f32 %141 = OpFAdd %137 %140 
                       Private f32* %142 = OpAccessChain %68 %63 
                                             OpStore %142 %141 
                       Private f32* %143 = OpAccessChain %128 %134 
                                f32 %144 = OpLoad %143 
                                f32 %145 = OpFNegate %144 
                                f32 %146 = OpFMul %145 %98 
                       Private f32* %147 = OpAccessChain %68 %63 
                                f32 %148 = OpLoad %147 
                                f32 %149 = OpFAdd %146 %148 
                       Private f32* %150 = OpAccessChain %9 %134 
                                             OpStore %150 %149 
                       Private f32* %151 = OpAccessChain %9 %63 
                                f32 %152 = OpLoad %151 
                       Private f32* %153 = OpAccessChain %128 %63 
                                f32 %154 = OpLoad %153 
                                f32 %155 = OpFAdd %152 %154 
                       Private f32* %156 = OpAccessChain %9 %63 
                                             OpStore %156 %155 
                       Private f32* %157 = OpAccessChain %29 %63 
                                f32 %158 = OpLoad %157 
                                f32 %159 = OpFMul %158 %98 
                       Private f32* %160 = OpAccessChain %9 %63 
                                f32 %161 = OpLoad %160 
                                f32 %162 = OpFAdd %159 %161 
                       Private f32* %163 = OpAccessChain %9 %63 
                                             OpStore %163 %162 
                              f32_2 %164 = OpLoad %128 
                              f32_2 %165 = OpVectorShuffle %164 %164 1 0 
                              f32_2 %166 = OpFNegate %165 
                              f32_4 %167 = OpLoad %9 
                              f32_2 %168 = OpVectorShuffle %167 %167 0 1 
                              f32_2 %169 = OpFAdd %166 %168 
                              f32_4 %170 = OpLoad %9 
                              f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                             OpStore %9 %171 
                       Private f32* %172 = OpAccessChain %29 %63 
                                f32 %173 = OpLoad %172 
                                f32 %174 = OpFNegate %173 
                                f32 %175 = OpFMul %174 %98 
                       Private f32* %176 = OpAccessChain %9 %63 
                                f32 %177 = OpLoad %176 
                                f32 %178 = OpFAdd %175 %177 
                       Private f32* %179 = OpAccessChain %9 %63 
                                             OpStore %179 %178 
                       Private f32* %180 = OpAccessChain %92 %63 
                                f32 %181 = OpLoad %180 
                                f32 %182 = OpFNegate %181 
                       Private f32* %183 = OpAccessChain %9 %63 
                                f32 %184 = OpLoad %183 
                                f32 %185 = OpFAdd %182 %184 
                       Private f32* %186 = OpAccessChain %9 %63 
                                             OpStore %186 %185 
                       Private f32* %187 = OpAccessChain %9 %134 
                                f32 %188 = OpLoad %187 
                       Private f32* %189 = OpAccessChain %9 %134 
                                f32 %190 = OpLoad %189 
                                f32 %191 = OpFMul %188 %190 
                       Private f32* %192 = OpAccessChain %68 %63 
                                             OpStore %192 %191 
                       Private f32* %193 = OpAccessChain %9 %63 
                                f32 %194 = OpLoad %193 
                       Private f32* %195 = OpAccessChain %9 %63 
                                f32 %196 = OpLoad %195 
                                f32 %197 = OpFMul %194 %196 
                       Private f32* %198 = OpAccessChain %68 %63 
                                f32 %199 = OpLoad %198 
                                f32 %200 = OpFAdd %197 %199 
                       Private f32* %201 = OpAccessChain %9 %63 
                                             OpStore %201 %200 
                       Private f32* %206 = OpAccessChain %9 %63 
                                f32 %207 = OpLoad %206 
                               bool %208 = OpFOrdLessThan %205 %207 
                                             OpStore %204 %208 
                               bool %209 = OpLoad %204 
                                f32 %211 = OpSelect %209 %210 %31 
                       Private f32* %212 = OpAccessChain %9 %63 
                                             OpStore %212 %211 
                              f32_4 %213 = OpLoad %9 
                              f32_2 %214 = OpVectorShuffle %213 %213 2 3 
                              f32_2 %217 = OpFMul %214 %216 
                              f32_4 %218 = OpLoad %29 
                              f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                             OpStore %29 %219 
                       Private f32* %221 = OpAccessChain %9 %220 
                                f32 %222 = OpLoad %221 
                                f32 %223 = OpFMul %222 %215 
                       Private f32* %224 = OpAccessChain %29 %134 
                                f32 %225 = OpLoad %224 
                                f32 %226 = OpFNegate %225 
                                f32 %227 = OpFAdd %223 %226 
                       Private f32* %228 = OpAccessChain %68 %63 
                                             OpStore %228 %227 
                       Private f32* %229 = OpAccessChain %29 %134 
                                f32 %230 = OpLoad %229 
                       Private f32* %231 = OpAccessChain %29 %63 
                                f32 %232 = OpLoad %231 
                                f32 %233 = OpFAdd %230 %232 
                       Private f32* %234 = OpAccessChain %29 %63 
                                             OpStore %234 %233 
                read_only Texture2D %235 = OpLoad %38 
                            sampler %236 = OpLoad %42 
         read_only Texture2DSampled %237 = OpSampledImage %235 %236 
                              f32_4 %238 = OpLoad %9 
                              f32_2 %239 = OpVectorShuffle %238 %238 2 3 
                              f32_4 %240 = OpImageSampleImplicitLod %237 %239 
                              f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                             OpStore %92 %241 
                       Uniform f32* %246 = OpAccessChain %17 %244 
                                f32 %247 = OpLoad %246 
                                f32 %248 = OpFDiv %243 %247 
                                             OpStore %242 %248 
                                f32 %249 = OpLoad %242 
                                f32 %251 = OpFMul %249 %250 
                                             OpStore %242 %251 
                                f32 %252 = OpLoad %242 
                       Private f32* %253 = OpAccessChain %68 %63 
                                f32 %254 = OpLoad %253 
                                f32 %255 = OpFMul %252 %254 
                       Private f32* %256 = OpAccessChain %68 %63 
                                             OpStore %256 %255 
                                f32 %257 = OpLoad %242 
                       Private f32* %258 = OpAccessChain %29 %63 
                                f32 %259 = OpLoad %258 
                                f32 %260 = OpFMul %257 %259 
                       Private f32* %261 = OpAccessChain %68 %134 
                                             OpStore %261 %260 
                              f32_3 %262 = OpLoad %68 
                              f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                              f32_2 %264 = OpExtInst %1 14 %263 
                              f32_3 %265 = OpLoad %68 
                              f32_3 %266 = OpVectorShuffle %265 %264 3 4 2 
                                             OpStore %68 %266 
                       Private f32* %267 = OpAccessChain %68 %134 
                                f32 %268 = OpLoad %267 
                                f32 %269 = OpFMul %268 %59 
                                f32 %271 = OpFAdd %269 %270 
                                             OpStore %242 %271 
                       Private f32* %272 = OpAccessChain %68 %63 
                                f32 %273 = OpLoad %272 
                                f32 %274 = OpFMul %273 %59 
                                f32 %275 = OpLoad %242 
                                f32 %276 = OpFAdd %274 %275 
                       Private f32* %277 = OpAccessChain %68 %63 
                                             OpStore %277 %276 
                              f32_4 %278 = OpLoad %9 
                              f32_2 %279 = OpVectorShuffle %278 %278 0 0 
                              f32_3 %280 = OpLoad %68 
                              f32_2 %281 = OpVectorShuffle %280 %280 0 0 
                                f32 %282 = OpDot %279 %281 
                       Private f32* %283 = OpAccessChain %9 %63 
                                             OpStore %283 %282 
                              f32_3 %284 = OpLoad %92 
                              f32_3 %286 = OpFMul %284 %285 
                              f32_3 %287 = OpLoad %68 
                              f32_3 %288 = OpVectorShuffle %287 %287 0 0 0 
                              f32_3 %289 = OpFNegate %288 
                              f32_3 %290 = OpFAdd %286 %289 
                                             OpStore %68 %290 
                       Uniform f32* %291 = OpAccessChain %17 %244 
                                f32 %292 = OpLoad %291 
                                f32 %294 = OpFMul %292 %293 
                                f32 %296 = OpFAdd %294 %295 
                       Private f32* %297 = OpAccessChain %29 %63 
                                             OpStore %297 %296 
                       Private f32* %298 = OpAccessChain %29 %63 
                                f32 %299 = OpLoad %298 
                                f32 %301 = OpFMul %299 %300 
                       Private f32* %302 = OpAccessChain %29 %63 
                                             OpStore %302 %301 
                       Private f32* %303 = OpAccessChain %29 %63 
                                f32 %304 = OpLoad %303 
                                f32 %306 = OpExtInst %1 43 %304 %31 %305 
                       Private f32* %307 = OpAccessChain %29 %63 
                                             OpStore %307 %306 
                       Private f32* %309 = OpAccessChain %29 %63 
                                f32 %310 = OpLoad %309 
                                f32 %312 = OpFMul %310 %311 
                                f32 %314 = OpFAdd %312 %313 
                                             OpStore %308 %314 
                       Private f32* %315 = OpAccessChain %29 %63 
                                f32 %316 = OpLoad %315 
                       Private f32* %317 = OpAccessChain %29 %63 
                                f32 %318 = OpLoad %317 
                                f32 %319 = OpFMul %316 %318 
                       Private f32* %320 = OpAccessChain %29 %63 
                                             OpStore %320 %319 
                                f32 %321 = OpLoad %308 
                              f32_3 %322 = OpCompositeConstruct %321 %321 %321 
                              f32_4 %323 = OpLoad %29 
                              f32_3 %324 = OpVectorShuffle %323 %323 0 0 0 
                              f32_3 %325 = OpFMul %322 %324 
                              f32_3 %326 = OpLoad %92 
                              f32_3 %327 = OpVectorShuffle %326 %326 0 1 1 
                              f32_3 %328 = OpFAdd %325 %327 
                              f32_4 %329 = OpLoad %29 
                              f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                             OpStore %29 %330 
                              f32_3 %331 = OpLoad %68 
                              f32_4 %332 = OpLoad %29 
                              f32_3 %333 = OpVectorShuffle %332 %332 0 2 2 
                              f32_3 %334 = OpFAdd %331 %333 
                                             OpStore %68 %334 
                       Private f32* %336 = OpAccessChain %29 %63 
                                f32 %337 = OpLoad %336 
                               bool %338 = OpFOrdLessThan %56 %337 
                                             OpStore %335 %338 
                               bool %339 = OpLoad %335 
                                             OpSelectionMerge %343 None 
                                             OpBranchConditional %339 %342 %345 
                                    %342 = OpLabel 
                              f32_3 %344 = OpLoad %68 
                                             OpStore %341 %344 
                                             OpBranch %343 
                                    %345 = OpLabel 
                              f32_4 %346 = OpLoad %29 
                              f32_3 %347 = OpVectorShuffle %346 %346 0 1 2 
                                             OpStore %341 %347 
                                             OpBranch %343 
                                    %343 = OpLabel 
                              f32_3 %348 = OpLoad %341 
                                             OpStore %68 %348 
                              f32_4 %351 = OpLoad %9 
                              f32_3 %352 = OpVectorShuffle %351 %351 0 0 0 
                              f32_3 %353 = OpLoad %68 
                              f32_3 %354 = OpFAdd %352 %353 
                              f32_4 %355 = OpLoad %350 
                              f32_4 %356 = OpVectorShuffle %355 %354 4 5 6 3 
                                             OpStore %350 %356 
                        Output f32* %359 = OpAccessChain %350 %357 
                                             OpStore %359 %305 
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