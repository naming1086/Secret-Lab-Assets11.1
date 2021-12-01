//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Manga2" {
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
  GpuProgramID 51682
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
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
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
    u_xlat8 = u_xlat8 * -3.33333349;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat12 = u_xlat8 * -2.0 + 3.0;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.xyz = vec3(u_xlat12) * vec3(u_xlat8) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xxx + u_xlat1.xyz;
    u_xlatb8 = 0.300000012<u_xlat1.x;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat2.xyz : u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xxx + u_xlat1.xyz;
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
; Bound: 345
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %330 
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
                                             OpDecorate %330 Location 330 
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
                                     %66 = OpTypePointer Private %10 
                      Private f32_2* %67 = OpVariable Private 
                                 f32 %73 = OpConstant 3.674022E-40 
                               f32_4 %74 = OpConstantComposite %73 %31 %73 %32 
                                     %91 = OpTypeVector %6 3 
                                     %92 = OpTypePointer Private %91 
                      Private f32_3* %93 = OpVariable Private 
                                 f32 %99 = OpConstant 3.674022E-40 
                              f32_4 %113 = OpConstantComposite %73 %73 %32 %73 
                     Private f32_4* %115 = OpVariable Private 
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
                                f32 %267 = OpConstant 3.674022E-40 
                                f32 %277 = OpConstant 3.674022E-40 
                                f32 %279 = OpConstant 3.674022E-40 
                                f32 %282 = OpConstant 3.674022E-40 
                                f32 %285 = OpConstant 3.674022E-40 
                       Private f32* %287 = OpVariable Private 
                                f32 %289 = OpConstant 3.674022E-40 
                                f32 %291 = OpConstant 3.674022E-40 
                      Private bool* %312 = OpVariable Private 
                                    %317 = OpTypePointer Function %91 
                                    %329 = OpTypePointer Output %7 
                      Output f32_4* %330 = OpVariable Output 
                                u32 %341 = OpConstant 3 
                                    %342 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %318 = OpVariable Function 
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
                               f32_4 %68 = OpLoad %35 
                                 f32 %69 = OpDot %68 %60 
                        Private f32* %70 = OpAccessChain %67 %63 
                                             OpStore %70 %69 
                               f32_4 %71 = OpLoad %9 
                               f32_4 %72 = OpVectorShuffle %71 %71 2 3 2 3 
                               f32_4 %75 = OpFAdd %72 %74 
                                             OpStore %29 %75 
                 read_only Texture2D %76 = OpLoad %38 
                             sampler %77 = OpLoad %42 
          read_only Texture2DSampled %78 = OpSampledImage %76 %77 
                               f32_4 %79 = OpLoad %29 
                               f32_2 %80 = OpVectorShuffle %79 %79 2 3 
                               f32_4 %81 = OpImageSampleImplicitLod %78 %80 
                                             OpStore %35 %81 
                 read_only Texture2D %82 = OpLoad %38 
                             sampler %83 = OpLoad %42 
          read_only Texture2DSampled %84 = OpSampledImage %82 %83 
                               f32_4 %85 = OpLoad %29 
                               f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                               f32_4 %87 = OpImageSampleImplicitLod %84 %86 
                                             OpStore %29 %87 
                               f32_4 %88 = OpLoad %29 
                                 f32 %89 = OpDot %88 %60 
                        Private f32* %90 = OpAccessChain %29 %63 
                                             OpStore %90 %89 
                               f32_4 %94 = OpLoad %35 
                                 f32 %95 = OpDot %94 %60 
                        Private f32* %96 = OpAccessChain %93 %63 
                                             OpStore %96 %95 
                        Private f32* %97 = OpAccessChain %67 %63 
                                 f32 %98 = OpLoad %97 
                                f32 %100 = OpFMul %98 %99 
                       Private f32* %101 = OpAccessChain %93 %63 
                                f32 %102 = OpLoad %101 
                                f32 %103 = OpFAdd %100 %102 
                       Private f32* %104 = OpAccessChain %67 %63 
                                             OpStore %104 %103 
                       Private f32* %105 = OpAccessChain %9 %63 
                                f32 %106 = OpLoad %105 
                       Private f32* %107 = OpAccessChain %67 %63 
                                f32 %108 = OpLoad %107 
                                f32 %109 = OpFAdd %106 %108 
                       Private f32* %110 = OpAccessChain %67 %63 
                                             OpStore %110 %109 
                              f32_4 %111 = OpLoad %9 
                              f32_4 %112 = OpVectorShuffle %111 %111 2 3 2 3 
                              f32_4 %114 = OpFAdd %112 %113 
                                             OpStore %35 %114 
                read_only Texture2D %116 = OpLoad %38 
                            sampler %117 = OpLoad %42 
         read_only Texture2DSampled %118 = OpSampledImage %116 %117 
                              f32_4 %119 = OpLoad %35 
                              f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                              f32_4 %121 = OpImageSampleImplicitLod %118 %120 
                                             OpStore %115 %121 
                read_only Texture2D %122 = OpLoad %38 
                            sampler %123 = OpLoad %42 
         read_only Texture2DSampled %124 = OpSampledImage %122 %123 
                              f32_4 %125 = OpLoad %35 
                              f32_2 %126 = OpVectorShuffle %125 %125 2 3 
                              f32_4 %127 = OpImageSampleImplicitLod %124 %126 
                                             OpStore %35 %127 
                              f32_4 %129 = OpLoad %35 
                                f32 %130 = OpDot %129 %60 
                       Private f32* %131 = OpAccessChain %128 %63 
                                             OpStore %131 %130 
                              f32_4 %132 = OpLoad %115 
                                f32 %133 = OpDot %132 %60 
                       Private f32* %135 = OpAccessChain %128 %134 
                                             OpStore %135 %133 
                       Private f32* %136 = OpAccessChain %67 %63 
                                f32 %137 = OpLoad %136 
                       Private f32* %138 = OpAccessChain %128 %134 
                                f32 %139 = OpLoad %138 
                                f32 %140 = OpFNegate %139 
                                f32 %141 = OpFAdd %137 %140 
                       Private f32* %142 = OpAccessChain %67 %63 
                                             OpStore %142 %141 
                       Private f32* %143 = OpAccessChain %128 %134 
                                f32 %144 = OpLoad %143 
                                f32 %145 = OpFNegate %144 
                                f32 %146 = OpFMul %145 %99 
                       Private f32* %147 = OpAccessChain %67 %63 
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
                                f32 %159 = OpFMul %158 %99 
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
                                f32 %175 = OpFMul %174 %99 
                       Private f32* %176 = OpAccessChain %9 %63 
                                f32 %177 = OpLoad %176 
                                f32 %178 = OpFAdd %175 %177 
                       Private f32* %179 = OpAccessChain %9 %63 
                                             OpStore %179 %178 
                       Private f32* %180 = OpAccessChain %93 %63 
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
                       Private f32* %192 = OpAccessChain %67 %63 
                                             OpStore %192 %191 
                       Private f32* %193 = OpAccessChain %9 %63 
                                f32 %194 = OpLoad %193 
                       Private f32* %195 = OpAccessChain %9 %63 
                                f32 %196 = OpLoad %195 
                                f32 %197 = OpFMul %194 %196 
                       Private f32* %198 = OpAccessChain %67 %63 
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
                       Private f32* %228 = OpAccessChain %67 %63 
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
                                             OpStore %93 %241 
                       Uniform f32* %246 = OpAccessChain %17 %244 
                                f32 %247 = OpLoad %246 
                                f32 %248 = OpFDiv %243 %247 
                                             OpStore %242 %248 
                                f32 %249 = OpLoad %242 
                                f32 %251 = OpFMul %249 %250 
                                             OpStore %242 %251 
                                f32 %252 = OpLoad %242 
                       Private f32* %253 = OpAccessChain %67 %63 
                                f32 %254 = OpLoad %253 
                                f32 %255 = OpFMul %252 %254 
                       Private f32* %256 = OpAccessChain %67 %63 
                                             OpStore %256 %255 
                                f32 %257 = OpLoad %242 
                       Private f32* %258 = OpAccessChain %29 %63 
                                f32 %259 = OpLoad %258 
                                f32 %260 = OpFMul %257 %259 
                       Private f32* %261 = OpAccessChain %67 %134 
                                             OpStore %261 %260 
                              f32_2 %262 = OpLoad %67 
                              f32_2 %263 = OpExtInst %1 14 %262 
                                             OpStore %67 %263 
                       Private f32* %264 = OpAccessChain %67 %134 
                                f32 %265 = OpLoad %264 
                                f32 %266 = OpFMul %265 %59 
                                f32 %268 = OpFAdd %266 %267 
                                             OpStore %242 %268 
                       Private f32* %269 = OpAccessChain %67 %63 
                                f32 %270 = OpLoad %269 
                                f32 %271 = OpFMul %270 %59 
                                f32 %272 = OpLoad %242 
                                f32 %273 = OpFAdd %271 %272 
                       Private f32* %274 = OpAccessChain %67 %63 
                                             OpStore %274 %273 
                       Uniform f32* %275 = OpAccessChain %17 %244 
                                f32 %276 = OpLoad %275 
                                f32 %278 = OpFMul %276 %277 
                                f32 %280 = OpFAdd %278 %279 
                                             OpStore %242 %280 
                                f32 %281 = OpLoad %242 
                                f32 %283 = OpFMul %281 %282 
                                             OpStore %242 %283 
                                f32 %284 = OpLoad %242 
                                f32 %286 = OpExtInst %1 43 %284 %31 %285 
                                             OpStore %242 %286 
                                f32 %288 = OpLoad %242 
                                f32 %290 = OpFMul %288 %289 
                                f32 %292 = OpFAdd %290 %291 
                                             OpStore %287 %292 
                                f32 %293 = OpLoad %242 
                                f32 %294 = OpLoad %242 
                                f32 %295 = OpFMul %293 %294 
                                             OpStore %242 %295 
                                f32 %296 = OpLoad %287 
                              f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                f32 %298 = OpLoad %242 
                              f32_3 %299 = OpCompositeConstruct %298 %298 %298 
                              f32_3 %300 = OpFMul %297 %299 
                              f32_3 %301 = OpLoad %93 
                              f32_3 %302 = OpFAdd %300 %301 
                              f32_4 %303 = OpLoad %29 
                              f32_4 %304 = OpVectorShuffle %303 %302 4 5 6 3 
                                             OpStore %29 %304 
                              f32_2 %305 = OpLoad %67 
                              f32_3 %306 = OpVectorShuffle %305 %305 0 0 0 
                              f32_4 %307 = OpLoad %29 
                              f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                              f32_3 %309 = OpFAdd %306 %308 
                              f32_4 %310 = OpLoad %35 
                              f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                             OpStore %35 %311 
                       Private f32* %313 = OpAccessChain %29 %63 
                                f32 %314 = OpLoad %313 
                               bool %315 = OpFOrdLessThan %56 %314 
                                             OpStore %312 %315 
                               bool %316 = OpLoad %312 
                                             OpSelectionMerge %320 None 
                                             OpBranchConditional %316 %319 %323 
                                    %319 = OpLabel 
                              f32_4 %321 = OpLoad %35 
                              f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
                                             OpStore %318 %322 
                                             OpBranch %320 
                                    %323 = OpLabel 
                              f32_4 %324 = OpLoad %29 
                              f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                             OpStore %318 %325 
                                             OpBranch %320 
                                    %320 = OpLabel 
                              f32_3 %326 = OpLoad %318 
                              f32_4 %327 = OpLoad %29 
                              f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
                                             OpStore %29 %328 
                              f32_4 %331 = OpLoad %9 
                              f32_3 %332 = OpVectorShuffle %331 %331 0 0 0 
                              f32_2 %333 = OpLoad %67 
                              f32_3 %334 = OpVectorShuffle %333 %333 0 0 0 
                              f32_3 %335 = OpFMul %332 %334 
                              f32_4 %336 = OpLoad %29 
                              f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                              f32_3 %338 = OpFAdd %335 %337 
                              f32_4 %339 = OpLoad %330 
                              f32_4 %340 = OpVectorShuffle %339 %338 4 5 6 3 
                                             OpStore %330 %340 
                        Output f32* %343 = OpAccessChain %330 %341 
                                             OpStore %343 %285 
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