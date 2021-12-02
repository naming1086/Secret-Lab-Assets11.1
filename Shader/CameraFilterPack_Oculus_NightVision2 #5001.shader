//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Oculus_NightVision2" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 28164
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
uniform 	float _TimeX;
uniform 	float _Red_R;
uniform 	float _Red_G;
uniform 	float _Red_B;
uniform 	float _Green_R;
uniform 	float _Green_G;
uniform 	float _Green_B;
uniform 	float _Blue_R;
uniform 	float _Blue_G;
uniform 	float _Blue_B;
uniform 	float _Red_C;
uniform 	float _Green_C;
uniform 	float _Blue_C;
uniform 	float _FadeFX;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat8;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.xy = u_xlat0.xy * vec2(0.100000001, 1.0);
    u_xlat8.x = dot(u_xlat8.xy, vec2(12.9898005, 78.2330017));
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 43758.5469 + _TimeX;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 1.0;
    u_xlat1.x = _Blue_R;
    u_xlat1.yz = vec2(_Blue_G, _Blue_B);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.z = u_xlat12 + _Blue_C;
    u_xlat12 = dot(u_xlat2.xyz, vec3(_Red_R, _Red_G, _Red_B));
    u_xlat1.x = u_xlat12 + _Red_C;
    u_xlat12 = dot(u_xlat2.xyz, vec3(_Green_R, _Green_G, _Green_B));
    u_xlat1.y = u_xlat12 + _Green_C;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat8.xxx + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2 = vec4(_TimeX) * vec4(0.25, 0.230000004, 10.0, 110.0);
    u_xlat8.xy = sin(u_xlat2.yw);
    u_xlat8.x = u_xlat8.x + _TimeX;
    u_xlat12 = u_xlat8.y * 0.00999999978 + 0.790000021;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat13 = u_xlat0.y * 2.0 + u_xlat2.x;
    u_xlat2.x = u_xlat0.y * 300.0 + u_xlat2.z;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 0.100000001 + 0.899999976;
    u_xlat8.x = u_xlat8.x + u_xlat13;
    u_xlat13 = floor(u_xlat8.x);
    u_xlat8.x = u_xlat8.x + (-u_xlat13);
    u_xlatb6.xy = greaterThanEqual(u_xlat8.xxxx, vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlat8.x + -0.400000006;
    u_xlat13 = u_xlatb6.x ? 1.0 : float(0.0);
    u_xlat6.x = (u_xlatb6.y) ? -1.0 : -0.0;
    u_xlat13 = u_xlat13 + u_xlat6.x;
    u_xlat8.x = u_xlat8.x * u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 4.99999952 + 1.0;
    u_xlat8.x = u_xlat13 * u_xlat8.x;
    u_xlat13 = cos(_TimeX);
    u_xlat3.y = u_xlat13 * _TimeX;
    u_xlat3.x = _TimeX;
    u_xlat6.xy = u_xlat0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat6.xy;
    u_xlat3 = texture(_MainTex, u_xlat6.xy);
    u_xlat13 = u_xlat3.x * u_xlat3.x;
    u_xlat1.xyz = u_xlat8.xxx * vec3(u_xlat13) + u_xlat1.xyz;
    u_xlat8.x = u_xlat0.y * 30.0 + _TimeX;
    u_xlat13 = floor(u_xlat8.x);
    u_xlat8.x = u_xlat8.x + (-u_xlat13);
    u_xlat8.x = u_xlat8.x + 12.0;
    u_xlat8.x = u_xlat8.x * 0.0769230798;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat1.xyz;
    u_xlat8.x = u_xlat0.x * u_xlat0.y;
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.5, 1.5);
    u_xlat8.x = u_xlat8.x * 6.0;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = dot(u_xlat0.xx, u_xlat0.yy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
; Bound: 432
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %421 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpMemberDecorate %15 14 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %100 DescriptorSet 100 
                                                      OpDecorate %100 Binding 100 
                                                      OpDecorate %421 Location 421 
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
                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 14 
                                              %20 = OpTypePointer Uniform %14 
                                              %31 = OpTypePointer Private %10 
                               Private f32_2* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.674022E-40 
                                          f32 %36 = OpConstant 3.674022E-40 
                                        f32_2 %37 = OpConstantComposite %35 %36 
                                          f32 %40 = OpConstant 3.674022E-40 
                                          f32 %41 = OpConstant 3.674022E-40 
                                        f32_2 %42 = OpConstantComposite %40 %41 
                                              %44 = OpTypeInt 32 0 
                                          u32 %45 = OpConstant 0 
                                              %46 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.674022E-40 
                                          i32 %56 = OpConstant 0 
                                              %57 = OpTypePointer Uniform %6 
                                          f32 %68 = OpConstant 3.674022E-40 
                               Private f32_3* %78 = OpVariable Private 
                                          i32 %79 = OpConstant 7 
                                          i32 %83 = OpConstant 8 
                                          i32 %86 = OpConstant 9 
                                              %92 = OpTypePointer Private %14 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %95 = OpTypePointer UniformConstant %94 
         UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                                              %98 = OpTypeSampler 
                                              %99 = OpTypePointer UniformConstant %98 
                    UniformConstant sampler* %100 = OpVariable UniformConstant 
                                             %102 = OpTypeSampledImage %94 
                                Private f32* %110 = OpVariable Private 
                                         i32 %116 = OpConstant 12 
                                         u32 %120 = OpConstant 2 
                                         i32 %124 = OpConstant 1 
                                         i32 %127 = OpConstant 2 
                                         i32 %130 = OpConstant 3 
                                         i32 %136 = OpConstant 10 
                                         i32 %143 = OpConstant 4 
                                         i32 %146 = OpConstant 5 
                                         i32 %149 = OpConstant 6 
                                         i32 %155 = OpConstant 11 
                                         u32 %159 = OpConstant 1 
                                         i32 %169 = OpConstant 13 
                                         f32 %189 = OpConstant 3.674022E-40 
                                         f32 %190 = OpConstant 3.674022E-40 
                                         f32 %191 = OpConstant 3.674022E-40 
                                         f32 %192 = OpConstant 3.674022E-40 
                                       f32_4 %193 = OpConstantComposite %189 %190 %191 %192 
                                         f32 %206 = OpConstant 3.674022E-40 
                                         f32 %208 = OpConstant 3.674022E-40 
                                Private f32* %214 = OpVariable Private 
                                         f32 %217 = OpConstant 3.674022E-40 
                                         f32 %224 = OpConstant 3.674022E-40 
                                         f32 %237 = OpConstant 3.674022E-40 
                                             %254 = OpTypeBool 
                                             %255 = OpTypeVector %254 2 
                                             %256 = OpTypePointer Private %255 
                             Private bool_2* %257 = OpVariable Private 
                                         f32 %260 = OpConstant 3.674022E-40 
                                         f32 %261 = OpConstant 3.674022E-40 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_4 %263 = OpConstantComposite %260 %261 %262 %262 
                                             %264 = OpTypeVector %254 4 
                                         f32 %269 = OpConstant 3.674022E-40 
                                             %272 = OpTypePointer Private %254 
                              Private f32_2* %276 = OpVariable Private 
                                         f32 %279 = OpConstant 3.674022E-40 
                                         f32 %280 = OpConstant 3.674022E-40 
                                         f32 %295 = OpConstant 3.674022E-40 
                              Private f32_2* %307 = OpVariable Private 
                                       f32_2 %318 = OpConstantComposite %68 %36 
                                         f32 %320 = OpConstant 3.674022E-40 
                                       f32_2 %321 = OpConstantComposite %36 %320 
                                         f32 %324 = OpConstant 3.674022E-40 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_2 %326 = OpConstantComposite %324 %325 
                                         f32 %348 = OpConstant 3.674022E-40 
                                         f32 %365 = OpConstant 3.674022E-40 
                                         f32 %370 = OpConstant 3.674022E-40 
                                         f32 %386 = OpConstant 3.674022E-40 
                                       f32_2 %387 = OpConstantComposite %386 %386 
                                         f32 %393 = OpConstant 3.674022E-40 
                                             %420 = OpTypePointer Output %14 
                               Output f32_4* %421 = OpVariable Output 
                                         u32 %428 = OpConstant 3 
                                             %429 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFMul %13 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                        f32_2 %28 = OpFAdd %24 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_3 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %38 = OpFMul %34 %37 
                                                      OpStore %32 %38 
                                        f32_2 %39 = OpLoad %32 
                                          f32 %43 = OpDot %39 %42 
                                 Private f32* %47 = OpAccessChain %32 %45 
                                                      OpStore %47 %43 
                                 Private f32* %48 = OpAccessChain %32 %45 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpExtInst %1 13 %49 
                                 Private f32* %51 = OpAccessChain %32 %45 
                                                      OpStore %51 %50 
                                 Private f32* %52 = OpAccessChain %32 %45 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFMul %53 %54 
                                 Uniform f32* %58 = OpAccessChain %17 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFAdd %55 %59 
                                 Private f32* %61 = OpAccessChain %32 %45 
                                                      OpStore %61 %60 
                                 Private f32* %62 = OpAccessChain %32 %45 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpExtInst %1 10 %63 
                                 Private f32* %65 = OpAccessChain %32 %45 
                                                      OpStore %65 %64 
                                 Private f32* %66 = OpAccessChain %32 %45 
                                          f32 %67 = OpLoad %66 
                                          f32 %69 = OpFMul %67 %68 
                                          f32 %70 = OpFAdd %69 %68 
                                 Private f32* %71 = OpAccessChain %32 %45 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %32 %45 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %75 = OpFMul %74 %68 
                                          f32 %76 = OpFAdd %75 %36 
                                 Private f32* %77 = OpAccessChain %32 %45 
                                                      OpStore %77 %76 
                                 Uniform f32* %80 = OpAccessChain %17 %79 
                                          f32 %81 = OpLoad %80 
                                 Private f32* %82 = OpAccessChain %78 %45 
                                                      OpStore %82 %81 
                                 Uniform f32* %84 = OpAccessChain %17 %83 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %87 = OpAccessChain %17 %86 
                                          f32 %88 = OpLoad %87 
                                        f32_2 %89 = OpCompositeConstruct %85 %88 
                                        f32_3 %90 = OpLoad %78 
                                        f32_3 %91 = OpVectorShuffle %90 %89 0 3 4 
                                                      OpStore %78 %91 
                          read_only Texture2D %97 = OpLoad %96 
                                     sampler %101 = OpLoad %100 
                  read_only Texture2DSampled %103 = OpSampledImage %97 %101 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_4 %108 = OpLoad %93 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %93 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %78 
                                         f32 %114 = OpDot %112 %113 
                                                      OpStore %110 %114 
                                         f32 %115 = OpLoad %110 
                                Uniform f32* %117 = OpAccessChain %17 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFAdd %115 %118 
                                Private f32* %121 = OpAccessChain %78 %120 
                                                      OpStore %121 %119 
                                       f32_4 %122 = OpLoad %93 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                Uniform f32* %125 = OpAccessChain %17 %124 
                                         f32 %126 = OpLoad %125 
                                Uniform f32* %128 = OpAccessChain %17 %127 
                                         f32 %129 = OpLoad %128 
                                Uniform f32* %131 = OpAccessChain %17 %130 
                                         f32 %132 = OpLoad %131 
                                       f32_3 %133 = OpCompositeConstruct %126 %129 %132 
                                         f32 %134 = OpDot %123 %133 
                                                      OpStore %110 %134 
                                         f32 %135 = OpLoad %110 
                                Uniform f32* %137 = OpAccessChain %17 %136 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFAdd %135 %138 
                                Private f32* %140 = OpAccessChain %78 %45 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %93 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                Uniform f32* %144 = OpAccessChain %17 %143 
                                         f32 %145 = OpLoad %144 
                                Uniform f32* %147 = OpAccessChain %17 %146 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %150 = OpAccessChain %17 %149 
                                         f32 %151 = OpLoad %150 
                                       f32_3 %152 = OpCompositeConstruct %145 %148 %151 
                                         f32 %153 = OpDot %142 %152 
                                                      OpStore %110 %153 
                                         f32 %154 = OpLoad %110 
                                Uniform f32* %156 = OpAccessChain %17 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFAdd %154 %157 
                                Private f32* %160 = OpAccessChain %78 %159 
                                                      OpStore %160 %158 
                                       f32_3 %161 = OpLoad %78 
                                       f32_2 %162 = OpLoad %32 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 0 0 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_4 %165 = OpLoad %93 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFNegate %166 
                                       f32_3 %168 = OpFAdd %164 %167 
                                                      OpStore %78 %168 
                                Uniform f32* %170 = OpAccessChain %17 %169 
                                         f32 %171 = OpLoad %170 
                                Uniform f32* %172 = OpAccessChain %17 %169 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %174 = OpAccessChain %17 %169 
                                         f32 %175 = OpLoad %174 
                                       f32_3 %176 = OpCompositeConstruct %171 %173 %175 
                                         f32 %177 = OpCompositeExtract %176 0 
                                         f32 %178 = OpCompositeExtract %176 1 
                                         f32 %179 = OpCompositeExtract %176 2 
                                       f32_3 %180 = OpCompositeConstruct %177 %178 %179 
                                       f32_3 %181 = OpLoad %78 
                                       f32_3 %182 = OpFMul %180 %181 
                                       f32_4 %183 = OpLoad %93 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore %78 %185 
                                Uniform f32* %186 = OpAccessChain %17 %56 
                                         f32 %187 = OpLoad %186 
                                       f32_4 %188 = OpCompositeConstruct %187 %187 %187 %187 
                                       f32_4 %194 = OpFMul %188 %193 
                                                      OpStore %93 %194 
                                       f32_4 %195 = OpLoad %93 
                                       f32_2 %196 = OpVectorShuffle %195 %195 1 3 
                                       f32_2 %197 = OpExtInst %1 13 %196 
                                                      OpStore %32 %197 
                                Private f32* %198 = OpAccessChain %32 %45 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %200 = OpAccessChain %17 %56 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFAdd %199 %201 
                                Private f32* %203 = OpAccessChain %32 %45 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %32 %159 
                                         f32 %205 = OpLoad %204 
                                         f32 %207 = OpFMul %205 %206 
                                         f32 %209 = OpFAdd %207 %208 
                                                      OpStore %110 %209 
                                Private f32* %210 = OpAccessChain %32 %45 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpExtInst %1 13 %211 
                                Private f32* %213 = OpAccessChain %32 %45 
                                                      OpStore %213 %212 
                                Private f32* %215 = OpAccessChain %9 %159 
                                         f32 %216 = OpLoad %215 
                                         f32 %218 = OpFMul %216 %217 
                                Private f32* %219 = OpAccessChain %93 %45 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFAdd %218 %220 
                                                      OpStore %214 %221 
                                Private f32* %222 = OpAccessChain %9 %159 
                                         f32 %223 = OpLoad %222 
                                         f32 %225 = OpFMul %223 %224 
                                Private f32* %226 = OpAccessChain %93 %120 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpFAdd %225 %227 
                                Private f32* %229 = OpAccessChain %93 %45 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %93 %45 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpExtInst %1 13 %231 
                                Private f32* %233 = OpAccessChain %93 %45 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %93 %45 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %235 %35 
                                         f32 %238 = OpFAdd %236 %237 
                                Private f32* %239 = OpAccessChain %93 %45 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %32 %45 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpLoad %214 
                                         f32 %243 = OpFAdd %241 %242 
                                Private f32* %244 = OpAccessChain %32 %45 
                                                      OpStore %244 %243 
                                Private f32* %245 = OpAccessChain %32 %45 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpExtInst %1 8 %246 
                                                      OpStore %214 %247 
                                Private f32* %248 = OpAccessChain %32 %45 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpLoad %214 
                                         f32 %251 = OpFNegate %250 
                                         f32 %252 = OpFAdd %249 %251 
                                Private f32* %253 = OpAccessChain %32 %45 
                                                      OpStore %253 %252 
                                       f32_2 %258 = OpLoad %32 
                                       f32_4 %259 = OpVectorShuffle %258 %258 0 0 0 0 
                                      bool_4 %265 = OpFOrdGreaterThanEqual %259 %263 
                                      bool_2 %266 = OpVectorShuffle %265 %265 0 1 
                                                      OpStore %257 %266 
                                Private f32* %267 = OpAccessChain %32 %45 
                                         f32 %268 = OpLoad %267 
                                         f32 %270 = OpFAdd %268 %269 
                                Private f32* %271 = OpAccessChain %32 %45 
                                                      OpStore %271 %270 
                               Private bool* %273 = OpAccessChain %257 %45 
                                        bool %274 = OpLoad %273 
                                         f32 %275 = OpSelect %274 %36 %262 
                                                      OpStore %214 %275 
                               Private bool* %277 = OpAccessChain %257 %159 
                                        bool %278 = OpLoad %277 
                                         f32 %281 = OpSelect %278 %279 %280 
                                Private f32* %282 = OpAccessChain %276 %45 
                                                      OpStore %282 %281 
                                         f32 %283 = OpLoad %214 
                                Private f32* %284 = OpAccessChain %276 %45 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFAdd %283 %285 
                                                      OpStore %214 %286 
                                Private f32* %287 = OpAccessChain %32 %45 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpLoad %214 
                                         f32 %290 = OpFMul %288 %289 
                                Private f32* %291 = OpAccessChain %32 %45 
                                                      OpStore %291 %290 
                                Private f32* %292 = OpAccessChain %32 %45 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFNegate %293 
                                         f32 %296 = OpFMul %294 %295 
                                         f32 %297 = OpFAdd %296 %36 
                                Private f32* %298 = OpAccessChain %32 %45 
                                                      OpStore %298 %297 
                                         f32 %299 = OpLoad %214 
                                Private f32* %300 = OpAccessChain %32 %45 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFMul %299 %301 
                                Private f32* %303 = OpAccessChain %32 %45 
                                                      OpStore %303 %302 
                                Uniform f32* %304 = OpAccessChain %17 %56 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 14 %305 
                                                      OpStore %214 %306 
                                         f32 %308 = OpLoad %214 
                                Uniform f32* %309 = OpAccessChain %17 %56 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFMul %308 %310 
                                Private f32* %312 = OpAccessChain %307 %159 
                                                      OpStore %312 %311 
                                Uniform f32* %313 = OpAccessChain %17 %56 
                                         f32 %314 = OpLoad %313 
                                Private f32* %315 = OpAccessChain %307 %45 
                                                      OpStore %315 %314 
                                       f32_3 %316 = OpLoad %9 
                                       f32_2 %317 = OpVectorShuffle %316 %316 0 1 
                                       f32_2 %319 = OpFMul %317 %318 
                                       f32_2 %322 = OpFAdd %319 %321 
                                                      OpStore %276 %322 
                                       f32_2 %323 = OpLoad %307 
                                       f32_2 %327 = OpFMul %323 %326 
                                       f32_2 %328 = OpLoad %276 
                                       f32_2 %329 = OpFAdd %327 %328 
                                                      OpStore %276 %329 
                         read_only Texture2D %330 = OpLoad %96 
                                     sampler %331 = OpLoad %100 
                  read_only Texture2DSampled %332 = OpSampledImage %330 %331 
                                       f32_2 %333 = OpLoad %276 
                                       f32_4 %334 = OpImageSampleImplicitLod %332 %333 
                                         f32 %335 = OpCompositeExtract %334 0 
                                                      OpStore %214 %335 
                                         f32 %336 = OpLoad %214 
                                         f32 %337 = OpLoad %214 
                                         f32 %338 = OpFMul %336 %337 
                                                      OpStore %214 %338 
                                       f32_2 %339 = OpLoad %32 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 0 0 
                                         f32 %341 = OpLoad %214 
                                       f32_3 %342 = OpCompositeConstruct %341 %341 %341 
                                       f32_3 %343 = OpFMul %340 %342 
                                       f32_3 %344 = OpLoad %78 
                                       f32_3 %345 = OpFAdd %343 %344 
                                                      OpStore %78 %345 
                                Private f32* %346 = OpAccessChain %9 %159 
                                         f32 %347 = OpLoad %346 
                                         f32 %349 = OpFMul %347 %348 
                                Uniform f32* %350 = OpAccessChain %17 %56 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %349 %351 
                                Private f32* %353 = OpAccessChain %32 %45 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %32 %45 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpExtInst %1 8 %355 
                                                      OpStore %214 %356 
                                Private f32* %357 = OpAccessChain %32 %45 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpLoad %214 
                                         f32 %360 = OpFNegate %359 
                                         f32 %361 = OpFAdd %358 %360 
                                Private f32* %362 = OpAccessChain %32 %45 
                                                      OpStore %362 %361 
                                Private f32* %363 = OpAccessChain %32 %45 
                                         f32 %364 = OpLoad %363 
                                         f32 %366 = OpFAdd %364 %365 
                                Private f32* %367 = OpAccessChain %32 %45 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %32 %45 
                                         f32 %369 = OpLoad %368 
                                         f32 %371 = OpFMul %369 %370 
                                Private f32* %372 = OpAccessChain %32 %45 
                                                      OpStore %372 %371 
                                       f32_2 %373 = OpLoad %32 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 0 0 
                                       f32_3 %375 = OpLoad %78 
                                       f32_3 %376 = OpFMul %374 %375 
                                                      OpStore %78 %376 
                                Private f32* %377 = OpAccessChain %9 %45 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %9 %159 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFMul %378 %380 
                                Private f32* %382 = OpAccessChain %32 %45 
                                                      OpStore %382 %381 
                                       f32_3 %383 = OpLoad %9 
                                       f32_2 %384 = OpVectorShuffle %383 %383 0 1 
                                       f32_2 %385 = OpFNegate %384 
                                       f32_2 %388 = OpFAdd %385 %387 
                                       f32_3 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %388 3 4 2 
                                                      OpStore %9 %390 
                                Private f32* %391 = OpAccessChain %32 %45 
                                         f32 %392 = OpLoad %391 
                                         f32 %394 = OpFMul %392 %393 
                                Private f32* %395 = OpAccessChain %32 %45 
                                                      OpStore %395 %394 
                                Private f32* %396 = OpAccessChain %9 %45 
                                         f32 %397 = OpLoad %396 
                                Private f32* %398 = OpAccessChain %32 %45 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpFMul %397 %399 
                                Private f32* %401 = OpAccessChain %9 %45 
                                                      OpStore %401 %400 
                                       f32_3 %402 = OpLoad %9 
                                       f32_2 %403 = OpVectorShuffle %402 %402 0 0 
                                       f32_3 %404 = OpLoad %9 
                                       f32_2 %405 = OpVectorShuffle %404 %404 1 1 
                                         f32 %406 = OpDot %403 %405 
                                Private f32* %407 = OpAccessChain %9 %45 
                                                      OpStore %407 %406 
                                Private f32* %408 = OpAccessChain %9 %45 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpFAdd %409 %68 
                                Private f32* %411 = OpAccessChain %9 %45 
                                                      OpStore %411 %410 
                                       f32_3 %412 = OpLoad %9 
                                       f32_3 %413 = OpVectorShuffle %412 %412 0 0 0 
                                       f32_3 %414 = OpLoad %78 
                                       f32_3 %415 = OpFMul %413 %414 
                                                      OpStore %9 %415 
                                       f32_4 %416 = OpLoad %93 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 0 0 
                                       f32_3 %418 = OpLoad %9 
                                       f32_3 %419 = OpFMul %417 %418 
                                                      OpStore %9 %419 
                                         f32 %422 = OpLoad %110 
                                       f32_3 %423 = OpCompositeConstruct %422 %422 %422 
                                       f32_3 %424 = OpLoad %9 
                                       f32_3 %425 = OpFMul %423 %424 
                                       f32_4 %426 = OpLoad %421 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
                                                      OpStore %421 %427 
                                 Output f32* %430 = OpAccessChain %421 %428 
                                                      OpStore %430 %36 
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