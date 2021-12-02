//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Toon" {
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
  GpuProgramID 22908
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
uniform 	float _Distortion;
uniform 	float _DotSize;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat10;
float u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = u_xlat0.x;
    u_xlat1.yzw = vec3(_DotSize) * vec3(0.001953125, 0.001953125, 0.001953125) + u_xlat0.yxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat3 = texture(_MainTex, u_xlat1.zw);
    u_xlat10 = dot(u_xlat3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat15 = dot(u_xlat2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat2.w = _DotSize * 0.001953125 + u_xlat0.y;
    u_xlat2.xz = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + u_xlat1.xx;
    u_xlat3 = texture(_MainTex, u_xlat2.zw);
    u_xlat6 = dot(u_xlat3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat15 = u_xlat15 * 2.0 + u_xlat6;
    u_xlat15 = u_xlat10 + u_xlat15;
    u_xlat3.xyw = (-vec3(_DotSize)) * vec3(0.001953125, 0.001953125, 0.001953125) + u_xlat0.xyy;
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat11 = dot(u_xlat4, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat15 = u_xlat15 + (-u_xlat11);
    u_xlat15 = (-u_xlat11) * 2.0 + u_xlat15;
    u_xlat3.z = _DotSize * 0.001953125 + u_xlat1.x;
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat1.x = dot(u_xlat3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat15 = u_xlat15 + (-u_xlat1.x);
    u_xlat10 = u_xlat10 + u_xlat1.x;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat2.y = u_xlat0.y;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat0.x = dot(u_xlat2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
    u_xlat5.x = u_xlat0.x * 2.0 + u_xlat10;
    u_xlat5.x = (-u_xlat11) + u_xlat5.x;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat5.x;
    u_xlat0.x = (-u_xlat6) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat15;
    u_xlatb0 = 0.0399999991<u_xlat0.x;
    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
    u_xlat5.x = dot(u_xlat3, u_xlat3);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.5, 2.5, 2.5);
    u_xlat5.xyz = log2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.649999976, 0.649999976, 0.649999976);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(5.0, 5.0, 5.0);
    u_xlat5.xyz = floor(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat5.xyz = log2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.53846157, 1.53846157, 1.53846157);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat0.xyz = u_xlat5.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion)) + u_xlat0.xxx;
    u_xlat15 = u_xlat0.z + u_xlat0.x;
    u_xlat15 = u_xlat15 * 12.8000002;
    u_xlatb15 = u_xlat15<u_xlat0.y;
    u_xlat0.xyz = (bool(u_xlatb15)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat1 = u_xlat0.xxxx * vec4(0.899999976, 0.699999988, 0.5, 0.75);
    u_xlat0.yzw = u_xlat0.xxx * vec3(0.25, 0.5, 0.899999976);
    u_xlatb2 = lessThan(vec4(0.949999988, 0.75, 0.5, 0.25), u_xlat0.xxxx);
    u_xlat5.xy = (u_xlatb2.w) ? u_xlat1.zw : u_xlat0.yz;
    u_xlat5.xy = (u_xlatb2.z) ? u_xlat1.yx : u_xlat5.xy;
    u_xlat5.xy = (u_xlatb2.y) ? u_xlat0.wx : u_xlat5.xy;
    SV_Target0.xy = (u_xlatb2.x) ? u_xlat0.xx : u_xlat5.xy;
    SV_Target0.z = u_xlat0.x;
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
; Bound: 423
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %402 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %54 DescriptorSet 54 
                                             OpDecorate %54 Binding 54 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate %402 Location 402 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %14 = OpTypeStruct %6 %6 %7 
                                     %15 = OpTypePointer Uniform %14 
  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %7 
                      Private f32_4* %30 = OpVariable Private 
                                     %31 = OpTypeInt 32 0 
                                 u32 %32 = OpConstant 0 
                                     %33 = OpTypePointer Private %6 
                                 i32 %37 = OpConstant 1 
                                     %38 = OpTypePointer Uniform %6 
                                     %41 = OpTypeVector %6 3 
                                 f32 %43 = OpConstant 3.674022E-40 
                               f32_3 %44 = OpConstantComposite %43 %43 %43 
                      Private f32_4* %51 = OpVariable Private 
                                     %52 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %53 = OpTypePointer UniformConstant %52 
UniformConstant read_only Texture2D* %54 = OpVariable UniformConstant 
                                     %56 = OpTypeSampler 
                                     %57 = OpTypePointer UniformConstant %56 
            UniformConstant sampler* %58 = OpVariable UniformConstant 
                                     %60 = OpTypeSampledImage %52 
                      Private f32_4* %65 = OpVariable Private 
                        Private f32* %72 = OpVariable Private 
                                 f32 %74 = OpConstant 3.674022E-40 
                                 f32 %75 = OpConstant 3.674022E-40 
                                 f32 %76 = OpConstant 3.674022E-40 
                                 f32 %77 = OpConstant 3.674022E-40 
                               f32_4 %78 = OpConstantComposite %74 %75 %76 %77 
                        Private f32* %80 = OpVariable Private 
                                 u32 %86 = OpConstant 1 
                                 u32 %90 = OpConstant 3 
                               f32_2 %96 = OpConstantComposite %43 %43 
                       Private f32* %109 = OpVariable Private 
                                f32 %113 = OpConstant 3.674022E-40 
                     Private f32_4* %130 = OpVariable Private 
                       Private f32* %137 = OpVariable Private 
                                u32 %155 = OpConstant 2 
                                    %196 = OpTypePointer Private %41 
                     Private f32_3* %197 = OpVariable Private 
                                    %232 = OpTypeBool 
                                    %233 = OpTypePointer Private %232 
                      Private bool* %234 = OpVariable Private 
                                f32 %235 = OpConstant 3.674022E-40 
                                f32 %240 = OpConstant 3.674022E-40 
                                f32 %241 = OpConstant 3.674022E-40 
                                f32 %258 = OpConstant 3.674022E-40 
                              f32_3 %259 = OpConstantComposite %258 %258 %258 
                                f32 %264 = OpConstant 3.674022E-40 
                              f32_3 %265 = OpConstantComposite %264 %264 %264 
                                f32 %270 = OpConstant 3.674022E-40 
                              f32_3 %271 = OpConstantComposite %270 %270 %270 
                                f32 %276 = OpConstant 3.674022E-40 
                              f32_3 %277 = OpConstantComposite %276 %276 %276 
                                f32 %282 = OpConstant 3.674022E-40 
                              f32_3 %283 = OpConstantComposite %282 %282 %282 
                                i32 %288 = OpConstant 0 
                                f32 %312 = OpConstant 3.674022E-40 
                      Private bool* %314 = OpVariable Private 
                                    %320 = OpTypePointer Function %41 
                              f32_3 %324 = OpConstantComposite %241 %241 %241 
                                f32 %333 = OpConstant 3.674022E-40 
                                f32 %334 = OpConstant 3.674022E-40 
                                f32 %335 = OpConstant 3.674022E-40 
                              f32_3 %336 = OpConstantComposite %333 %334 %335 
                                f32 %341 = OpConstant 3.674022E-40 
                                f32 %342 = OpConstant 3.674022E-40 
                                f32 %343 = OpConstant 3.674022E-40 
                                f32 %344 = OpConstant 3.674022E-40 
                              f32_4 %345 = OpConstantComposite %341 %342 %343 %344 
                              f32_3 %349 = OpConstantComposite %77 %343 %341 
                                    %353 = OpTypeVector %232 4 
                                    %354 = OpTypePointer Private %353 
                    Private bool_4* %355 = OpVariable Private 
                                f32 %356 = OpConstant 3.674022E-40 
                              f32_4 %357 = OpConstantComposite %356 %344 %343 %77 
                                    %363 = OpTypePointer Function %10 
                                    %401 = OpTypePointer Output %7 
                      Output f32_4* %402 = OpVariable Output 
                                    %418 = OpTypePointer Output %6 
                                f32 %420 = OpConstant 3.674022E-40 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %321 = OpVariable Function 
                    Function f32_2* %364 = OpVariable Function 
                    Function f32_2* %377 = OpVariable Function 
                    Function f32_2* %390 = OpVariable Function 
                    Function f32_2* %405 = OpVariable Function 
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
                        Private f32* %34 = OpAccessChain %9 %32 
                                 f32 %35 = OpLoad %34 
                        Private f32* %36 = OpAccessChain %30 %32 
                                             OpStore %36 %35 
                        Uniform f32* %39 = OpAccessChain %16 %37 
                                 f32 %40 = OpLoad %39 
                               f32_3 %42 = OpCompositeConstruct %40 %40 %40 
                               f32_3 %45 = OpFMul %42 %44 
                               f32_4 %46 = OpLoad %9 
                               f32_3 %47 = OpVectorShuffle %46 %46 1 0 1 
                               f32_3 %48 = OpFAdd %45 %47 
                               f32_4 %49 = OpLoad %30 
                               f32_4 %50 = OpVectorShuffle %49 %48 0 4 5 6 
                                             OpStore %30 %50 
                 read_only Texture2D %55 = OpLoad %54 
                             sampler %59 = OpLoad %58 
          read_only Texture2DSampled %61 = OpSampledImage %55 %59 
                               f32_4 %62 = OpLoad %30 
                               f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                               f32_4 %64 = OpImageSampleImplicitLod %61 %63 
                                             OpStore %51 %64 
                 read_only Texture2D %66 = OpLoad %54 
                             sampler %67 = OpLoad %58 
          read_only Texture2DSampled %68 = OpSampledImage %66 %67 
                               f32_4 %69 = OpLoad %30 
                               f32_2 %70 = OpVectorShuffle %69 %69 2 3 
                               f32_4 %71 = OpImageSampleImplicitLod %68 %70 
                                             OpStore %65 %71 
                               f32_4 %73 = OpLoad %65 
                                 f32 %79 = OpDot %73 %78 
                                             OpStore %72 %79 
                               f32_4 %81 = OpLoad %51 
                                 f32 %82 = OpDot %81 %78 
                                             OpStore %80 %82 
                        Uniform f32* %83 = OpAccessChain %16 %37 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %84 %43 
                        Private f32* %87 = OpAccessChain %9 %86 
                                 f32 %88 = OpLoad %87 
                                 f32 %89 = OpFAdd %85 %88 
                        Private f32* %91 = OpAccessChain %51 %90 
                                             OpStore %91 %89 
                        Uniform f32* %92 = OpAccessChain %16 %37 
                                 f32 %93 = OpLoad %92 
                               f32_2 %94 = OpCompositeConstruct %93 %93 
                               f32_2 %95 = OpFNegate %94 
                               f32_2 %97 = OpFMul %95 %96 
                               f32_4 %98 = OpLoad %30 
                               f32_2 %99 = OpVectorShuffle %98 %98 0 0 
                              f32_2 %100 = OpFAdd %97 %99 
                              f32_4 %101 = OpLoad %51 
                              f32_4 %102 = OpVectorShuffle %101 %100 4 1 5 3 
                                             OpStore %51 %102 
                read_only Texture2D %103 = OpLoad %54 
                            sampler %104 = OpLoad %58 
         read_only Texture2DSampled %105 = OpSampledImage %103 %104 
                              f32_4 %106 = OpLoad %51 
                              f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                              f32_4 %108 = OpImageSampleImplicitLod %105 %107 
                                             OpStore %65 %108 
                              f32_4 %110 = OpLoad %65 
                                f32 %111 = OpDot %110 %78 
                                             OpStore %109 %111 
                                f32 %112 = OpLoad %80 
                                f32 %114 = OpFMul %112 %113 
                                f32 %115 = OpLoad %109 
                                f32 %116 = OpFAdd %114 %115 
                                             OpStore %80 %116 
                                f32 %117 = OpLoad %72 
                                f32 %118 = OpLoad %80 
                                f32 %119 = OpFAdd %117 %118 
                                             OpStore %80 %119 
                       Uniform f32* %120 = OpAccessChain %16 %37 
                                f32 %121 = OpLoad %120 
                              f32_3 %122 = OpCompositeConstruct %121 %121 %121 
                              f32_3 %123 = OpFNegate %122 
                              f32_3 %124 = OpFMul %123 %44 
                              f32_4 %125 = OpLoad %9 
                              f32_3 %126 = OpVectorShuffle %125 %125 0 1 1 
                              f32_3 %127 = OpFAdd %124 %126 
                              f32_4 %128 = OpLoad %65 
                              f32_4 %129 = OpVectorShuffle %128 %127 4 5 2 6 
                                             OpStore %65 %129 
                read_only Texture2D %131 = OpLoad %54 
                            sampler %132 = OpLoad %58 
         read_only Texture2DSampled %133 = OpSampledImage %131 %132 
                              f32_4 %134 = OpLoad %65 
                              f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                              f32_4 %136 = OpImageSampleImplicitLod %133 %135 
                                             OpStore %130 %136 
                              f32_4 %138 = OpLoad %130 
                                f32 %139 = OpDot %138 %78 
                                             OpStore %137 %139 
                                f32 %140 = OpLoad %80 
                                f32 %141 = OpLoad %137 
                                f32 %142 = OpFNegate %141 
                                f32 %143 = OpFAdd %140 %142 
                                             OpStore %80 %143 
                                f32 %144 = OpLoad %137 
                                f32 %145 = OpFNegate %144 
                                f32 %146 = OpFMul %145 %113 
                                f32 %147 = OpLoad %80 
                                f32 %148 = OpFAdd %146 %147 
                                             OpStore %80 %148 
                       Uniform f32* %149 = OpAccessChain %16 %37 
                                f32 %150 = OpLoad %149 
                                f32 %151 = OpFMul %150 %43 
                       Private f32* %152 = OpAccessChain %30 %32 
                                f32 %153 = OpLoad %152 
                                f32 %154 = OpFAdd %151 %153 
                       Private f32* %156 = OpAccessChain %65 %155 
                                             OpStore %156 %154 
                read_only Texture2D %157 = OpLoad %54 
                            sampler %158 = OpLoad %58 
         read_only Texture2DSampled %159 = OpSampledImage %157 %158 
                              f32_4 %160 = OpLoad %65 
                              f32_2 %161 = OpVectorShuffle %160 %160 2 3 
                              f32_4 %162 = OpImageSampleImplicitLod %159 %161 
                                             OpStore %65 %162 
                              f32_4 %163 = OpLoad %65 
                                f32 %164 = OpDot %163 %78 
                       Private f32* %165 = OpAccessChain %30 %32 
                                             OpStore %165 %164 
                                f32 %166 = OpLoad %80 
                       Private f32* %167 = OpAccessChain %30 %32 
                                f32 %168 = OpLoad %167 
                                f32 %169 = OpFNegate %168 
                                f32 %170 = OpFAdd %166 %169 
                                             OpStore %80 %170 
                                f32 %171 = OpLoad %72 
                       Private f32* %172 = OpAccessChain %30 %32 
                                f32 %173 = OpLoad %172 
                                f32 %174 = OpFAdd %171 %173 
                                             OpStore %72 %174 
                                f32 %175 = OpLoad %80 
                                f32 %176 = OpLoad %80 
                                f32 %177 = OpFMul %175 %176 
                                             OpStore %80 %177 
                       Private f32* %178 = OpAccessChain %9 %86 
                                f32 %179 = OpLoad %178 
                       Private f32* %180 = OpAccessChain %51 %86 
                                             OpStore %180 %179 
                read_only Texture2D %181 = OpLoad %54 
                            sampler %182 = OpLoad %58 
         read_only Texture2DSampled %183 = OpSampledImage %181 %182 
                              f32_4 %184 = OpLoad %9 
                              f32_2 %185 = OpVectorShuffle %184 %184 0 1 
                              f32_4 %186 = OpImageSampleImplicitLod %183 %185 
                                             OpStore %65 %186 
                read_only Texture2D %187 = OpLoad %54 
                            sampler %188 = OpLoad %58 
         read_only Texture2DSampled %189 = OpSampledImage %187 %188 
                              f32_4 %190 = OpLoad %51 
                              f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                              f32_4 %192 = OpImageSampleImplicitLod %189 %191 
                                             OpStore %51 %192 
                              f32_4 %193 = OpLoad %51 
                                f32 %194 = OpDot %193 %78 
                       Private f32* %195 = OpAccessChain %9 %32 
                                             OpStore %195 %194 
                       Private f32* %198 = OpAccessChain %9 %32 
                                f32 %199 = OpLoad %198 
                                f32 %200 = OpFMul %199 %113 
                                f32 %201 = OpLoad %72 
                                f32 %202 = OpFAdd %200 %201 
                       Private f32* %203 = OpAccessChain %197 %32 
                                             OpStore %203 %202 
                                f32 %204 = OpLoad %137 
                                f32 %205 = OpFNegate %204 
                       Private f32* %206 = OpAccessChain %197 %32 
                                f32 %207 = OpLoad %206 
                                f32 %208 = OpFAdd %205 %207 
                       Private f32* %209 = OpAccessChain %197 %32 
                                             OpStore %209 %208 
                       Private f32* %210 = OpAccessChain %9 %32 
                                f32 %211 = OpLoad %210 
                                f32 %212 = OpFNegate %211 
                                f32 %213 = OpFMul %212 %113 
                       Private f32* %214 = OpAccessChain %197 %32 
                                f32 %215 = OpLoad %214 
                                f32 %216 = OpFAdd %213 %215 
                       Private f32* %217 = OpAccessChain %9 %32 
                                             OpStore %217 %216 
                                f32 %218 = OpLoad %109 
                                f32 %219 = OpFNegate %218 
                       Private f32* %220 = OpAccessChain %9 %32 
                                f32 %221 = OpLoad %220 
                                f32 %222 = OpFAdd %219 %221 
                       Private f32* %223 = OpAccessChain %9 %32 
                                             OpStore %223 %222 
                       Private f32* %224 = OpAccessChain %9 %32 
                                f32 %225 = OpLoad %224 
                       Private f32* %226 = OpAccessChain %9 %32 
                                f32 %227 = OpLoad %226 
                                f32 %228 = OpFMul %225 %227 
                                f32 %229 = OpLoad %80 
                                f32 %230 = OpFAdd %228 %229 
                       Private f32* %231 = OpAccessChain %9 %32 
                                             OpStore %231 %230 
                       Private f32* %236 = OpAccessChain %9 %32 
                                f32 %237 = OpLoad %236 
                               bool %238 = OpFOrdLessThan %235 %237 
                                             OpStore %234 %238 
                               bool %239 = OpLoad %234 
                                f32 %242 = OpSelect %239 %240 %241 
                       Private f32* %243 = OpAccessChain %9 %32 
                                             OpStore %243 %242 
                              f32_4 %244 = OpLoad %65 
                              f32_4 %245 = OpLoad %65 
                                f32 %246 = OpDot %244 %245 
                       Private f32* %247 = OpAccessChain %197 %32 
                                             OpStore %247 %246 
                       Private f32* %248 = OpAccessChain %197 %32 
                                f32 %249 = OpLoad %248 
                                f32 %250 = OpExtInst %1 32 %249 
                       Private f32* %251 = OpAccessChain %197 %32 
                                             OpStore %251 %250 
                              f32_3 %252 = OpLoad %197 
                              f32_3 %253 = OpVectorShuffle %252 %252 0 0 0 
                              f32_4 %254 = OpLoad %65 
                              f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                              f32_3 %256 = OpFMul %253 %255 
                                             OpStore %197 %256 
                              f32_3 %257 = OpLoad %197 
                              f32_3 %260 = OpFMul %257 %259 
                                             OpStore %197 %260 
                              f32_3 %261 = OpLoad %197 
                              f32_3 %262 = OpExtInst %1 30 %261 
                                             OpStore %197 %262 
                              f32_3 %263 = OpLoad %197 
                              f32_3 %266 = OpFMul %263 %265 
                                             OpStore %197 %266 
                              f32_3 %267 = OpLoad %197 
                              f32_3 %268 = OpExtInst %1 29 %267 
                                             OpStore %197 %268 
                              f32_3 %269 = OpLoad %197 
                              f32_3 %272 = OpFMul %269 %271 
                                             OpStore %197 %272 
                              f32_3 %273 = OpLoad %197 
                              f32_3 %274 = OpExtInst %1 8 %273 
                                             OpStore %197 %274 
                              f32_3 %275 = OpLoad %197 
                              f32_3 %278 = OpFMul %275 %277 
                                             OpStore %197 %278 
                              f32_3 %279 = OpLoad %197 
                              f32_3 %280 = OpExtInst %1 30 %279 
                                             OpStore %197 %280 
                              f32_3 %281 = OpLoad %197 
                              f32_3 %284 = OpFMul %281 %283 
                                             OpStore %197 %284 
                              f32_3 %285 = OpLoad %197 
                              f32_3 %286 = OpExtInst %1 29 %285 
                                             OpStore %197 %286 
                              f32_3 %287 = OpLoad %197 
                       Uniform f32* %289 = OpAccessChain %16 %288 
                                f32 %290 = OpLoad %289 
                       Uniform f32* %291 = OpAccessChain %16 %288 
                                f32 %292 = OpLoad %291 
                       Uniform f32* %293 = OpAccessChain %16 %288 
                                f32 %294 = OpLoad %293 
                              f32_3 %295 = OpCompositeConstruct %290 %292 %294 
                                f32 %296 = OpCompositeExtract %295 0 
                                f32 %297 = OpCompositeExtract %295 1 
                                f32 %298 = OpCompositeExtract %295 2 
                              f32_3 %299 = OpCompositeConstruct %296 %297 %298 
                              f32_3 %300 = OpFMul %287 %299 
                              f32_4 %301 = OpLoad %9 
                              f32_3 %302 = OpVectorShuffle %301 %301 0 0 0 
                              f32_3 %303 = OpFAdd %300 %302 
                              f32_4 %304 = OpLoad %9 
                              f32_4 %305 = OpVectorShuffle %304 %303 4 5 6 3 
                                             OpStore %9 %305 
                       Private f32* %306 = OpAccessChain %9 %155 
                                f32 %307 = OpLoad %306 
                       Private f32* %308 = OpAccessChain %9 %32 
                                f32 %309 = OpLoad %308 
                                f32 %310 = OpFAdd %307 %309 
                                             OpStore %80 %310 
                                f32 %311 = OpLoad %80 
                                f32 %313 = OpFMul %311 %312 
                                             OpStore %80 %313 
                                f32 %315 = OpLoad %80 
                       Private f32* %316 = OpAccessChain %9 %86 
                                f32 %317 = OpLoad %316 
                               bool %318 = OpFOrdLessThan %315 %317 
                                             OpStore %314 %318 
                               bool %319 = OpLoad %314 
                                             OpSelectionMerge %323 None 
                                             OpBranchConditional %319 %322 %325 
                                    %322 = OpLabel 
                                             OpStore %321 %324 
                                             OpBranch %323 
                                    %325 = OpLabel 
                              f32_4 %326 = OpLoad %9 
                              f32_3 %327 = OpVectorShuffle %326 %326 0 1 2 
                                             OpStore %321 %327 
                                             OpBranch %323 
                                    %323 = OpLabel 
                              f32_3 %328 = OpLoad %321 
                              f32_4 %329 = OpLoad %9 
                              f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                             OpStore %9 %330 
                              f32_4 %331 = OpLoad %9 
                              f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                f32 %337 = OpDot %332 %336 
                       Private f32* %338 = OpAccessChain %9 %32 
                                             OpStore %338 %337 
                              f32_4 %339 = OpLoad %9 
                              f32_4 %340 = OpVectorShuffle %339 %339 0 0 0 0 
                              f32_4 %346 = OpFMul %340 %345 
                                             OpStore %30 %346 
                              f32_4 %347 = OpLoad %9 
                              f32_3 %348 = OpVectorShuffle %347 %347 0 0 0 
                              f32_3 %350 = OpFMul %348 %349 
                              f32_4 %351 = OpLoad %9 
                              f32_4 %352 = OpVectorShuffle %351 %350 0 4 5 6 
                                             OpStore %9 %352 
                              f32_4 %358 = OpLoad %9 
                              f32_4 %359 = OpVectorShuffle %358 %358 0 0 0 0 
                             bool_4 %360 = OpFOrdLessThan %357 %359 
                                             OpStore %355 %360 
                      Private bool* %361 = OpAccessChain %355 %90 
                               bool %362 = OpLoad %361 
                                             OpSelectionMerge %366 None 
                                             OpBranchConditional %362 %365 %369 
                                    %365 = OpLabel 
                              f32_4 %367 = OpLoad %30 
                              f32_2 %368 = OpVectorShuffle %367 %367 2 3 
                                             OpStore %364 %368 
                                             OpBranch %366 
                                    %369 = OpLabel 
                              f32_4 %370 = OpLoad %9 
                              f32_2 %371 = OpVectorShuffle %370 %370 1 2 
                                             OpStore %364 %371 
                                             OpBranch %366 
                                    %366 = OpLabel 
                              f32_2 %372 = OpLoad %364 
                              f32_3 %373 = OpLoad %197 
                              f32_3 %374 = OpVectorShuffle %373 %372 3 4 2 
                                             OpStore %197 %374 
                      Private bool* %375 = OpAccessChain %355 %155 
                               bool %376 = OpLoad %375 
                                             OpSelectionMerge %379 None 
                                             OpBranchConditional %376 %378 %382 
                                    %378 = OpLabel 
                              f32_4 %380 = OpLoad %30 
                              f32_2 %381 = OpVectorShuffle %380 %380 1 0 
                                             OpStore %377 %381 
                                             OpBranch %379 
                                    %382 = OpLabel 
                              f32_3 %383 = OpLoad %197 
                              f32_2 %384 = OpVectorShuffle %383 %383 0 1 
                                             OpStore %377 %384 
                                             OpBranch %379 
                                    %379 = OpLabel 
                              f32_2 %385 = OpLoad %377 
                              f32_3 %386 = OpLoad %197 
                              f32_3 %387 = OpVectorShuffle %386 %385 3 4 2 
                                             OpStore %197 %387 
                      Private bool* %388 = OpAccessChain %355 %86 
                               bool %389 = OpLoad %388 
                                             OpSelectionMerge %392 None 
                                             OpBranchConditional %389 %391 %395 
                                    %391 = OpLabel 
                              f32_4 %393 = OpLoad %9 
                              f32_2 %394 = OpVectorShuffle %393 %393 3 0 
                                             OpStore %390 %394 
                                             OpBranch %392 
                                    %395 = OpLabel 
                              f32_3 %396 = OpLoad %197 
                              f32_2 %397 = OpVectorShuffle %396 %396 0 1 
                                             OpStore %390 %397 
                                             OpBranch %392 
                                    %392 = OpLabel 
                              f32_2 %398 = OpLoad %390 
                              f32_3 %399 = OpLoad %197 
                              f32_3 %400 = OpVectorShuffle %399 %398 3 4 2 
                                             OpStore %197 %400 
                      Private bool* %403 = OpAccessChain %355 %32 
                               bool %404 = OpLoad %403 
                                             OpSelectionMerge %407 None 
                                             OpBranchConditional %404 %406 %410 
                                    %406 = OpLabel 
                              f32_4 %408 = OpLoad %9 
                              f32_2 %409 = OpVectorShuffle %408 %408 0 0 
                                             OpStore %405 %409 
                                             OpBranch %407 
                                    %410 = OpLabel 
                              f32_3 %411 = OpLoad %197 
                              f32_2 %412 = OpVectorShuffle %411 %411 0 1 
                                             OpStore %405 %412 
                                             OpBranch %407 
                                    %407 = OpLabel 
                              f32_2 %413 = OpLoad %405 
                              f32_4 %414 = OpLoad %402 
                              f32_4 %415 = OpVectorShuffle %414 %413 4 5 2 3 
                                             OpStore %402 %415 
                       Private f32* %416 = OpAccessChain %9 %32 
                                f32 %417 = OpLoad %416 
                        Output f32* %419 = OpAccessChain %402 %155 
                                             OpStore %419 %417 
                        Output f32* %421 = OpAccessChain %402 %90 
                                             OpStore %421 %420 
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