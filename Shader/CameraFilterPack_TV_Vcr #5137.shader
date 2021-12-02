//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_Vcr" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(1, 10)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 51294
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
vec2 u_xlat6;
float u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0 = vec4(_TimeX) * vec4(0.25, 4.0, 80.0, 3.0);
    u_xlat5.xyz = cos(u_xlat0.yzw);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = _TimeX * 0.25 + (-u_xlat0.x);
    u_xlat5.x = u_xlat5.x * 4.0 + _TimeX;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlatb5 = u_xlat5.x>=0.300000012;
    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.yx * vec2(1.20000005, 1.20000005);
    u_xlat11.x = dot(u_xlat11.yy, u_xlat11.xx);
    u_xlat11.x = u_xlat11.x + 0.833333313;
    u_xlat2.xy = u_xlat1.yx * u_xlat11.xx + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat11.xx * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat11.x = u_xlat2.y * 10.0 + _TimeX;
    u_xlat11.x = sin(u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 0.0199999996;
    u_xlat0.y = u_xlat5.x * u_xlat11.x;
    u_xlat0.z = u_xlat5.y + 1.0;
    u_xlat15 = u_xlat5.z * 2.0 + _TimeX;
    u_xlat15 = sin(u_xlat15);
    u_xlatb15 = u_xlat15>=0.899999976;
    u_xlat15 = u_xlatb15 ? 0.400000006 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.y;
    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * 20.0 + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat2.x;
    u_xlat3 = vec4(_TimeX) * vec4(20.0, 200.0, 5.0, 0.5);
    u_xlat11.xy = sin(u_xlat3.xy);
    u_xlat10 = u_xlat11.y * 0.100000001;
    u_xlat3.x = sin(_TimeX);
    u_xlat4 = cos(_TimeX);
    u_xlat10 = u_xlat10 * u_xlat4;
    u_xlat10 = u_xlat3.x * u_xlat11.x + u_xlat10;
    u_xlat3.y = u_xlat4 * _TimeX;
    u_xlat10 = u_xlat10 + 0.5;
    u_xlat10 = u_xlat15 * u_xlat10 + u_xlat2.y;
    u_xlat15 = floor(u_xlat10);
    u_xlat0.y = (-u_xlat15) + u_xlat10;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat15 = _TimeX * 0.629999995;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + _TimeX;
    u_xlat15 = sin(u_xlat15);
    u_xlat11.x = u_xlat2.y * 4.0 + u_xlat3.w;
    u_xlat16 = cos(u_xlat3.z);
    u_xlat16 = u_xlat16 * 5.0 + _TimeX;
    u_xlat16 = sin(u_xlat16);
    u_xlat16 = u_xlat16 * 0.300000012 + 3.0;
    u_xlat1.xy = (-u_xlat1.xy) * vec2(u_xlat16) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat6.x = floor(u_xlat15);
    u_xlat15 = u_xlat15 + (-u_xlat6.x);
    u_xlat6.x = u_xlat15 + -0.5;
    u_xlatb11.xy = greaterThanEqual(vec4(u_xlat15), vec4(0.5, 0.600000024, 0.5, 0.600000024)).xy;
    u_xlat15 = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb11.y) ? -1.0 : -0.0;
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat6.x = u_xlat15 * u_xlat6.x;
    u_xlat6.x = (-u_xlat6.x) * 9.99999809 + 1.0;
    u_xlat15 = u_xlat15 * u_xlat6.x;
    u_xlat6.xy = u_xlat2.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
    u_xlat3.x = _TimeX;
    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat6.xy;
    u_xlat12.xy = u_xlat3.xy * vec2(8.0, 16.0);
    u_xlat2.xz = u_xlat2.xy * vec2(2.0, 2.0) + u_xlat12.xy;
    u_xlat16 = u_xlat2.y * 30.0 + _TimeX;
    u_xlat2 = texture(_MainTex, u_xlat2.xz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat3 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.x = u_xlat3.x * u_xlat3.x;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat6.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat15 = floor(u_xlat16);
    u_xlat15 = (-u_xlat15) + u_xlat16;
    u_xlat15 = u_xlat15 + 12.0;
    u_xlat15 = u_xlat15 * 0.0769230798;
    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
; Bound: 491
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %73 %480 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %10 0 Offset 10 
                                              OpMemberDecorate %10 1 Offset 10 
                                              OpDecorate %10 Block 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate vs_TEXCOORD0 Location 73 
                                              OpDecorate %262 DescriptorSet 262 
                                              OpDecorate %262 Binding 262 
                                              OpDecorate %266 DescriptorSet 266 
                                              OpDecorate %266 Binding 266 
                                              OpDecorate %480 Location 480 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeStruct %6 %7 
                                      %11 = OpTypePointer Uniform %10 
        Uniform struct {f32; f32_4;}* %12 = OpVariable Uniform 
                                      %13 = OpTypeInt 32 1 
                                  i32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Uniform %6 
                                  f32 %19 = OpConstant 3.674022E-40 
                                  f32 %20 = OpConstant 3.674022E-40 
                                  f32 %21 = OpConstant 3.674022E-40 
                                  f32 %22 = OpConstant 3.674022E-40 
                                f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
                                      %25 = OpTypeVector %6 3 
                                      %26 = OpTypePointer Private %25 
                       Private f32_3* %27 = OpVariable Private 
                                      %31 = OpTypeInt 32 0 
                                  u32 %32 = OpConstant 0 
                                      %33 = OpTypePointer Private %6 
                                      %57 = OpTypeBool 
                                      %58 = OpTypePointer Private %57 
                        Private bool* %59 = OpVariable Private 
                                  f32 %62 = OpConstant 3.674022E-40 
                                  f32 %65 = OpConstant 3.674022E-40 
                                  f32 %66 = OpConstant 3.674022E-40 
                                      %69 = OpTypeVector %6 2 
                                      %70 = OpTypePointer Private %69 
                       Private f32_2* %71 = OpVariable Private 
                                      %72 = OpTypePointer Input %69 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  i32 %75 = OpConstant 1 
                                      %76 = OpTypePointer Uniform %7 
                                  f32 %86 = OpConstant 3.674022E-40 
                                f32_2 %87 = OpConstantComposite %86 %86 
                       Private f32_2* %89 = OpVariable Private 
                                  f32 %95 = OpConstant 3.674022E-40 
                                f32_2 %96 = OpConstantComposite %95 %95 
                                 f32 %106 = OpConstant 3.674022E-40 
                      Private f32_3* %109 = OpVariable Private 
                                 f32 %115 = OpConstant 3.674022E-40 
                               f32_2 %116 = OpConstantComposite %115 %115 
                                 u32 %127 = OpConstant 1 
                                 f32 %130 = OpConstant 3.674022E-40 
                                 f32 %142 = OpConstant 3.674022E-40 
                                 u32 %154 = OpConstant 2 
                        Private f32* %156 = OpVariable Private 
                                 f32 %159 = OpConstant 3.674022E-40 
                       Private bool* %166 = OpVariable Private 
                                 f32 %168 = OpConstant 3.674022E-40 
                                 f32 %171 = OpConstant 3.674022E-40 
                                 f32 %189 = OpConstant 3.674022E-40 
                      Private f32_4* %206 = OpVariable Private 
                                 f32 %210 = OpConstant 3.674022E-40 
                                 f32 %211 = OpConstant 3.674022E-40 
                               f32_4 %212 = OpConstantComposite %189 %210 %211 %115 
                        Private f32* %217 = OpVariable Private 
                                 f32 %220 = OpConstant 3.674022E-40 
                        Private f32* %226 = OpVariable Private 
                                     %260 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %261 = OpTypePointer UniformConstant %260 
UniformConstant read_only Texture2D* %262 = OpVariable UniformConstant 
                                     %264 = OpTypeSampler 
                                     %265 = OpTypePointer UniformConstant %264 
            UniformConstant sampler* %266 = OpVariable UniformConstant 
                                     %268 = OpTypeSampledImage %260 
                                 f32 %278 = OpConstant 3.674022E-40 
                                 u32 %291 = OpConstant 3 
                        Private f32* %296 = OpVariable Private 
                               f32_2 %315 = OpConstantComposite %65 %65 
                      Private f32_2* %327 = OpVariable Private 
                                     %339 = OpTypeVector %57 2 
                                     %340 = OpTypePointer Private %339 
                     Private bool_2* %341 = OpVariable Private 
                                 f32 %344 = OpConstant 3.674022E-40 
                               f32_4 %345 = OpConstantComposite %115 %344 %115 %344 
                                     %346 = OpTypeVector %57 4 
                                 f32 %354 = OpConstant 3.674022E-40 
                                 f32 %355 = OpConstant 3.674022E-40 
                                 f32 %370 = OpConstant 3.674022E-40 
                               f32_2 %380 = OpConstantComposite %115 %65 
                               f32_2 %382 = OpConstantComposite %65 %22 
                                 f32 %389 = OpConstant 3.674022E-40 
                                 f32 %390 = OpConstant 3.674022E-40 
                               f32_2 %391 = OpConstantComposite %389 %390 
                      Private f32_2* %395 = OpVariable Private 
                               f32_2 %401 = OpConstantComposite %159 %159 
                                 f32 %409 = OpConstant 3.674022E-40 
                               f32_3 %453 = OpConstantComposite %115 %115 %115 
                                 f32 %474 = OpConstant 3.674022E-40 
                                 f32 %477 = OpConstant 3.674022E-40 
                                     %479 = OpTypePointer Output %7 
                       Output f32_4* %480 = OpVariable Output 
                                     %488 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                         Uniform f32* %16 = OpAccessChain %12 %14 
                                  f32 %17 = OpLoad %16 
                                f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
                                f32_4 %24 = OpFMul %18 %23 
                                              OpStore %9 %24 
                                f32_4 %28 = OpLoad %9 
                                f32_3 %29 = OpVectorShuffle %28 %28 1 2 3 
                                f32_3 %30 = OpExtInst %1 14 %29 
                                              OpStore %27 %30 
                         Private f32* %34 = OpAccessChain %9 %32 
                                  f32 %35 = OpLoad %34 
                                  f32 %36 = OpExtInst %1 8 %35 
                         Private f32* %37 = OpAccessChain %9 %32 
                                              OpStore %37 %36 
                         Uniform f32* %38 = OpAccessChain %12 %14 
                                  f32 %39 = OpLoad %38 
                                  f32 %40 = OpFMul %39 %19 
                         Private f32* %41 = OpAccessChain %9 %32 
                                  f32 %42 = OpLoad %41 
                                  f32 %43 = OpFNegate %42 
                                  f32 %44 = OpFAdd %40 %43 
                         Private f32* %45 = OpAccessChain %9 %32 
                                              OpStore %45 %44 
                         Private f32* %46 = OpAccessChain %27 %32 
                                  f32 %47 = OpLoad %46 
                                  f32 %48 = OpFMul %47 %20 
                         Uniform f32* %49 = OpAccessChain %12 %14 
                                  f32 %50 = OpLoad %49 
                                  f32 %51 = OpFAdd %48 %50 
                         Private f32* %52 = OpAccessChain %27 %32 
                                              OpStore %52 %51 
                         Private f32* %53 = OpAccessChain %27 %32 
                                  f32 %54 = OpLoad %53 
                                  f32 %55 = OpExtInst %1 13 %54 
                         Private f32* %56 = OpAccessChain %27 %32 
                                              OpStore %56 %55 
                         Private f32* %60 = OpAccessChain %27 %32 
                                  f32 %61 = OpLoad %60 
                                 bool %63 = OpFOrdGreaterThanEqual %61 %62 
                                              OpStore %59 %63 
                                 bool %64 = OpLoad %59 
                                  f32 %67 = OpSelect %64 %65 %66 
                         Private f32* %68 = OpAccessChain %27 %32 
                                              OpStore %68 %67 
                                f32_2 %74 = OpLoad vs_TEXCOORD0 
                       Uniform f32_4* %77 = OpAccessChain %12 %75 
                                f32_4 %78 = OpLoad %77 
                                f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                f32_2 %80 = OpFMul %74 %79 
                       Uniform f32_4* %81 = OpAccessChain %12 %75 
                                f32_4 %82 = OpLoad %81 
                                f32_2 %83 = OpVectorShuffle %82 %82 2 3 
                                f32_2 %84 = OpFAdd %80 %83 
                                              OpStore %71 %84 
                                f32_2 %85 = OpLoad %71 
                                f32_2 %88 = OpFAdd %85 %87 
                                              OpStore %71 %88 
                                f32_2 %90 = OpLoad %71 
                                f32_2 %91 = OpLoad %71 
                                f32_2 %92 = OpFMul %90 %91 
                                              OpStore %89 %92 
                                f32_2 %93 = OpLoad %71 
                                f32_2 %94 = OpVectorShuffle %93 %93 1 0 
                                f32_2 %97 = OpFMul %94 %96 
                                              OpStore %71 %97 
                                f32_2 %98 = OpLoad %89 
                                f32_2 %99 = OpVectorShuffle %98 %98 1 1 
                               f32_2 %100 = OpLoad %89 
                               f32_2 %101 = OpVectorShuffle %100 %100 0 0 
                                 f32 %102 = OpDot %99 %101 
                        Private f32* %103 = OpAccessChain %89 %32 
                                              OpStore %103 %102 
                        Private f32* %104 = OpAccessChain %89 %32 
                                 f32 %105 = OpLoad %104 
                                 f32 %107 = OpFAdd %105 %106 
                        Private f32* %108 = OpAccessChain %89 %32 
                                              OpStore %108 %107 
                               f32_2 %110 = OpLoad %71 
                               f32_2 %111 = OpVectorShuffle %110 %110 1 0 
                               f32_2 %112 = OpLoad %89 
                               f32_2 %113 = OpVectorShuffle %112 %112 0 0 
                               f32_2 %114 = OpFMul %111 %113 
                               f32_2 %117 = OpFAdd %114 %116 
                               f32_3 %118 = OpLoad %109 
                               f32_3 %119 = OpVectorShuffle %118 %117 3 4 2 
                                              OpStore %109 %119 
                               f32_2 %120 = OpLoad %89 
                               f32_2 %121 = OpVectorShuffle %120 %120 0 0 
                               f32_2 %122 = OpLoad %71 
                               f32_2 %123 = OpFMul %121 %122 
                                              OpStore %71 %123 
                               f32_2 %124 = OpLoad %71 
                               f32_2 %125 = OpLoad %71 
                               f32_2 %126 = OpFMul %124 %125 
                                              OpStore %71 %126 
                        Private f32* %128 = OpAccessChain %109 %127 
                                 f32 %129 = OpLoad %128 
                                 f32 %131 = OpFMul %129 %130 
                        Uniform f32* %132 = OpAccessChain %12 %14 
                                 f32 %133 = OpLoad %132 
                                 f32 %134 = OpFAdd %131 %133 
                        Private f32* %135 = OpAccessChain %89 %32 
                                              OpStore %135 %134 
                        Private f32* %136 = OpAccessChain %89 %32 
                                 f32 %137 = OpLoad %136 
                                 f32 %138 = OpExtInst %1 13 %137 
                        Private f32* %139 = OpAccessChain %89 %32 
                                              OpStore %139 %138 
                        Private f32* %140 = OpAccessChain %89 %32 
                                 f32 %141 = OpLoad %140 
                                 f32 %143 = OpFMul %141 %142 
                        Private f32* %144 = OpAccessChain %89 %32 
                                              OpStore %144 %143 
                        Private f32* %145 = OpAccessChain %27 %32 
                                 f32 %146 = OpLoad %145 
                        Private f32* %147 = OpAccessChain %89 %32 
                                 f32 %148 = OpLoad %147 
                                 f32 %149 = OpFMul %146 %148 
                        Private f32* %150 = OpAccessChain %9 %127 
                                              OpStore %150 %149 
                        Private f32* %151 = OpAccessChain %27 %127 
                                 f32 %152 = OpLoad %151 
                                 f32 %153 = OpFAdd %152 %65 
                        Private f32* %155 = OpAccessChain %9 %154 
                                              OpStore %155 %153 
                        Private f32* %157 = OpAccessChain %27 %154 
                                 f32 %158 = OpLoad %157 
                                 f32 %160 = OpFMul %158 %159 
                        Uniform f32* %161 = OpAccessChain %12 %14 
                                 f32 %162 = OpLoad %161 
                                 f32 %163 = OpFAdd %160 %162 
                                              OpStore %156 %163 
                                 f32 %164 = OpLoad %156 
                                 f32 %165 = OpExtInst %1 13 %164 
                                              OpStore %156 %165 
                                 f32 %167 = OpLoad %156 
                                bool %169 = OpFOrdGreaterThanEqual %167 %168 
                                              OpStore %166 %169 
                                bool %170 = OpLoad %166 
                                 f32 %172 = OpSelect %170 %171 %66 
                                              OpStore %156 %172 
                        Private f32* %173 = OpAccessChain %9 %32 
                                 f32 %174 = OpLoad %173 
                                 f32 %175 = OpFNegate %174 
                        Private f32* %176 = OpAccessChain %109 %127 
                                 f32 %177 = OpLoad %176 
                                 f32 %178 = OpFAdd %175 %177 
                        Private f32* %179 = OpAccessChain %9 %32 
                                              OpStore %179 %178 
                               f32_4 %180 = OpLoad %9 
                               f32_2 %181 = OpVectorShuffle %180 %180 0 2 
                               f32_4 %182 = OpLoad %9 
                               f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                               f32_2 %184 = OpFMul %181 %183 
                               f32_4 %185 = OpLoad %9 
                               f32_4 %186 = OpVectorShuffle %185 %184 4 5 2 3 
                                              OpStore %9 %186 
                        Private f32* %187 = OpAccessChain %9 %32 
                                 f32 %188 = OpLoad %187 
                                 f32 %190 = OpFMul %188 %189 
                                 f32 %191 = OpFAdd %190 %65 
                        Private f32* %192 = OpAccessChain %9 %32 
                                              OpStore %192 %191 
                        Private f32* %193 = OpAccessChain %9 %32 
                                 f32 %194 = OpLoad %193 
                                 f32 %195 = OpFDiv %65 %194 
                        Private f32* %196 = OpAccessChain %9 %32 
                                              OpStore %196 %195 
                        Private f32* %197 = OpAccessChain %9 %127 
                                 f32 %198 = OpLoad %197 
                        Private f32* %199 = OpAccessChain %9 %32 
                                 f32 %200 = OpLoad %199 
                                 f32 %201 = OpFMul %198 %200 
                        Private f32* %202 = OpAccessChain %109 %32 
                                 f32 %203 = OpLoad %202 
                                 f32 %204 = OpFAdd %201 %203 
                        Private f32* %205 = OpAccessChain %9 %32 
                                              OpStore %205 %204 
                        Uniform f32* %207 = OpAccessChain %12 %14 
                                 f32 %208 = OpLoad %207 
                               f32_4 %209 = OpCompositeConstruct %208 %208 %208 %208 
                               f32_4 %213 = OpFMul %209 %212 
                                              OpStore %206 %213 
                               f32_4 %214 = OpLoad %206 
                               f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                               f32_2 %216 = OpExtInst %1 13 %215 
                                              OpStore %89 %216 
                        Private f32* %218 = OpAccessChain %89 %127 
                                 f32 %219 = OpLoad %218 
                                 f32 %221 = OpFMul %219 %220 
                                              OpStore %217 %221 
                        Uniform f32* %222 = OpAccessChain %12 %14 
                                 f32 %223 = OpLoad %222 
                                 f32 %224 = OpExtInst %1 13 %223 
                        Private f32* %225 = OpAccessChain %206 %32 
                                              OpStore %225 %224 
                        Uniform f32* %227 = OpAccessChain %12 %14 
                                 f32 %228 = OpLoad %227 
                                 f32 %229 = OpExtInst %1 14 %228 
                                              OpStore %226 %229 
                                 f32 %230 = OpLoad %217 
                                 f32 %231 = OpLoad %226 
                                 f32 %232 = OpFMul %230 %231 
                                              OpStore %217 %232 
                        Private f32* %233 = OpAccessChain %206 %32 
                                 f32 %234 = OpLoad %233 
                        Private f32* %235 = OpAccessChain %89 %32 
                                 f32 %236 = OpLoad %235 
                                 f32 %237 = OpFMul %234 %236 
                                 f32 %238 = OpLoad %217 
                                 f32 %239 = OpFAdd %237 %238 
                                              OpStore %217 %239 
                                 f32 %240 = OpLoad %226 
                        Uniform f32* %241 = OpAccessChain %12 %14 
                                 f32 %242 = OpLoad %241 
                                 f32 %243 = OpFMul %240 %242 
                        Private f32* %244 = OpAccessChain %206 %127 
                                              OpStore %244 %243 
                                 f32 %245 = OpLoad %217 
                                 f32 %246 = OpFAdd %245 %115 
                                              OpStore %217 %246 
                                 f32 %247 = OpLoad %156 
                                 f32 %248 = OpLoad %217 
                                 f32 %249 = OpFMul %247 %248 
                        Private f32* %250 = OpAccessChain %109 %127 
                                 f32 %251 = OpLoad %250 
                                 f32 %252 = OpFAdd %249 %251 
                                              OpStore %217 %252 
                                 f32 %253 = OpLoad %217 
                                 f32 %254 = OpExtInst %1 8 %253 
                                              OpStore %156 %254 
                                 f32 %255 = OpLoad %156 
                                 f32 %256 = OpFNegate %255 
                                 f32 %257 = OpLoad %217 
                                 f32 %258 = OpFAdd %256 %257 
                        Private f32* %259 = OpAccessChain %9 %127 
                                              OpStore %259 %258 
                 read_only Texture2D %263 = OpLoad %262 
                             sampler %267 = OpLoad %266 
          read_only Texture2DSampled %269 = OpSampledImage %263 %267 
                               f32_4 %270 = OpLoad %9 
                               f32_2 %271 = OpVectorShuffle %270 %270 0 1 
                               f32_4 %272 = OpImageSampleImplicitLod %269 %271 
                               f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                               f32_4 %274 = OpLoad %9 
                               f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                              OpStore %9 %275 
                        Uniform f32* %276 = OpAccessChain %12 %14 
                                 f32 %277 = OpLoad %276 
                                 f32 %279 = OpFMul %277 %278 
                                              OpStore %156 %279 
                                 f32 %280 = OpLoad %156 
                                 f32 %281 = OpExtInst %1 13 %280 
                                              OpStore %156 %281 
                                 f32 %282 = OpLoad %156 
                        Uniform f32* %283 = OpAccessChain %12 %14 
                                 f32 %284 = OpLoad %283 
                                 f32 %285 = OpFAdd %282 %284 
                                              OpStore %156 %285 
                                 f32 %286 = OpLoad %156 
                                 f32 %287 = OpExtInst %1 13 %286 
                                              OpStore %156 %287 
                        Private f32* %288 = OpAccessChain %109 %127 
                                 f32 %289 = OpLoad %288 
                                 f32 %290 = OpFMul %289 %20 
                        Private f32* %292 = OpAccessChain %206 %291 
                                 f32 %293 = OpLoad %292 
                                 f32 %294 = OpFAdd %290 %293 
                        Private f32* %295 = OpAccessChain %89 %32 
                                              OpStore %295 %294 
                        Private f32* %297 = OpAccessChain %206 %154 
                                 f32 %298 = OpLoad %297 
                                 f32 %299 = OpExtInst %1 14 %298 
                                              OpStore %296 %299 
                                 f32 %300 = OpLoad %296 
                                 f32 %301 = OpFMul %300 %211 
                        Uniform f32* %302 = OpAccessChain %12 %14 
                                 f32 %303 = OpLoad %302 
                                 f32 %304 = OpFAdd %301 %303 
                                              OpStore %296 %304 
                                 f32 %305 = OpLoad %296 
                                 f32 %306 = OpExtInst %1 13 %305 
                                              OpStore %296 %306 
                                 f32 %307 = OpLoad %296 
                                 f32 %308 = OpFMul %307 %62 
                                 f32 %309 = OpFAdd %308 %22 
                                              OpStore %296 %309 
                               f32_2 %310 = OpLoad %71 
                               f32_2 %311 = OpFNegate %310 
                                 f32 %312 = OpLoad %296 
                               f32_2 %313 = OpCompositeConstruct %312 %312 
                               f32_2 %314 = OpFMul %311 %313 
                               f32_2 %316 = OpFAdd %314 %315 
                                              OpStore %71 %316 
                        Private f32* %317 = OpAccessChain %71 %127 
                                 f32 %318 = OpLoad %317 
                        Private f32* %319 = OpAccessChain %71 %32 
                                 f32 %320 = OpLoad %319 
                                 f32 %321 = OpFMul %318 %320 
                        Private f32* %322 = OpAccessChain %71 %32 
                                              OpStore %322 %321 
                                 f32 %323 = OpLoad %156 
                        Private f32* %324 = OpAccessChain %89 %32 
                                 f32 %325 = OpLoad %324 
                                 f32 %326 = OpFAdd %323 %325 
                                              OpStore %156 %326 
                                 f32 %328 = OpLoad %156 
                                 f32 %329 = OpExtInst %1 8 %328 
                        Private f32* %330 = OpAccessChain %327 %32 
                                              OpStore %330 %329 
                                 f32 %331 = OpLoad %156 
                        Private f32* %332 = OpAccessChain %327 %32 
                                 f32 %333 = OpLoad %332 
                                 f32 %334 = OpFNegate %333 
                                 f32 %335 = OpFAdd %331 %334 
                                              OpStore %156 %335 
                                 f32 %336 = OpLoad %156 
                                 f32 %337 = OpFAdd %336 %86 
                        Private f32* %338 = OpAccessChain %327 %32 
                                              OpStore %338 %337 
                                 f32 %342 = OpLoad %156 
                               f32_4 %343 = OpCompositeConstruct %342 %342 %342 %342 
                              bool_4 %347 = OpFOrdGreaterThanEqual %343 %345 
                              bool_2 %348 = OpVectorShuffle %347 %347 0 1 
                                              OpStore %341 %348 
                       Private bool* %349 = OpAccessChain %341 %32 
                                bool %350 = OpLoad %349 
                                 f32 %351 = OpSelect %350 %65 %66 
                                              OpStore %156 %351 
                       Private bool* %352 = OpAccessChain %341 %127 
                                bool %353 = OpLoad %352 
                                 f32 %356 = OpSelect %353 %354 %355 
                        Private f32* %357 = OpAccessChain %89 %32 
                                              OpStore %357 %356 
                                 f32 %358 = OpLoad %156 
                        Private f32* %359 = OpAccessChain %89 %32 
                                 f32 %360 = OpLoad %359 
                                 f32 %361 = OpFAdd %358 %360 
                                              OpStore %156 %361 
                                 f32 %362 = OpLoad %156 
                        Private f32* %363 = OpAccessChain %327 %32 
                                 f32 %364 = OpLoad %363 
                                 f32 %365 = OpFMul %362 %364 
                        Private f32* %366 = OpAccessChain %327 %32 
                                              OpStore %366 %365 
                        Private f32* %367 = OpAccessChain %327 %32 
                                 f32 %368 = OpLoad %367 
                                 f32 %369 = OpFNegate %368 
                                 f32 %371 = OpFMul %369 %370 
                                 f32 %372 = OpFAdd %371 %65 
                        Private f32* %373 = OpAccessChain %327 %32 
                                              OpStore %373 %372 
                                 f32 %374 = OpLoad %156 
                        Private f32* %375 = OpAccessChain %327 %32 
                                 f32 %376 = OpLoad %375 
                                 f32 %377 = OpFMul %374 %376 
                                              OpStore %156 %377 
                               f32_3 %378 = OpLoad %109 
                               f32_2 %379 = OpVectorShuffle %378 %378 0 1 
                               f32_2 %381 = OpFMul %379 %380 
                               f32_2 %383 = OpFAdd %381 %382 
                                              OpStore %327 %383 
                        Uniform f32* %384 = OpAccessChain %12 %14 
                                 f32 %385 = OpLoad %384 
                        Private f32* %386 = OpAccessChain %206 %32 
                                              OpStore %386 %385 
                               f32_4 %387 = OpLoad %206 
                               f32_2 %388 = OpVectorShuffle %387 %387 0 1 
                               f32_2 %392 = OpFMul %388 %391 
                               f32_2 %393 = OpLoad %327 
                               f32_2 %394 = OpFAdd %392 %393 
                                              OpStore %327 %394 
                               f32_4 %396 = OpLoad %206 
                               f32_2 %397 = OpVectorShuffle %396 %396 0 1 
                               f32_2 %398 = OpFMul %397 %391 
                                              OpStore %395 %398 
                               f32_3 %399 = OpLoad %109 
                               f32_2 %400 = OpVectorShuffle %399 %399 0 1 
                               f32_2 %402 = OpFMul %400 %401 
                               f32_2 %403 = OpLoad %395 
                               f32_2 %404 = OpFAdd %402 %403 
                               f32_3 %405 = OpLoad %109 
                               f32_3 %406 = OpVectorShuffle %405 %404 3 1 4 
                                              OpStore %109 %406 
                        Private f32* %407 = OpAccessChain %109 %127 
                                 f32 %408 = OpLoad %407 
                                 f32 %410 = OpFMul %408 %409 
                        Uniform f32* %411 = OpAccessChain %12 %14 
                                 f32 %412 = OpLoad %411 
                                 f32 %413 = OpFAdd %410 %412 
                                              OpStore %296 %413 
                 read_only Texture2D %414 = OpLoad %262 
                             sampler %415 = OpLoad %266 
          read_only Texture2DSampled %416 = OpSampledImage %414 %415 
                               f32_3 %417 = OpLoad %109 
                               f32_2 %418 = OpVectorShuffle %417 %417 0 2 
                               f32_4 %419 = OpImageSampleImplicitLod %416 %418 
                                 f32 %420 = OpCompositeExtract %419 0 
                        Private f32* %421 = OpAccessChain %109 %32 
                                              OpStore %421 %420 
                        Private f32* %422 = OpAccessChain %109 %32 
                                 f32 %423 = OpLoad %422 
                        Private f32* %424 = OpAccessChain %109 %32 
                                 f32 %425 = OpLoad %424 
                                 f32 %426 = OpFMul %423 %425 
                        Private f32* %427 = OpAccessChain %109 %32 
                                              OpStore %427 %426 
                 read_only Texture2D %428 = OpLoad %262 
                             sampler %429 = OpLoad %266 
          read_only Texture2DSampled %430 = OpSampledImage %428 %429 
                               f32_2 %431 = OpLoad %327 
                               f32_4 %432 = OpImageSampleImplicitLod %430 %431 
                                 f32 %433 = OpCompositeExtract %432 0 
                        Private f32* %434 = OpAccessChain %327 %32 
                                              OpStore %434 %433 
                        Private f32* %435 = OpAccessChain %327 %32 
                                 f32 %436 = OpLoad %435 
                        Private f32* %437 = OpAccessChain %327 %32 
                                 f32 %438 = OpLoad %437 
                                 f32 %439 = OpFMul %436 %438 
                        Private f32* %440 = OpAccessChain %327 %32 
                                              OpStore %440 %439 
                                 f32 %441 = OpLoad %156 
                               f32_3 %442 = OpCompositeConstruct %441 %441 %441 
                               f32_2 %443 = OpLoad %327 
                               f32_3 %444 = OpVectorShuffle %443 %443 0 0 0 
                               f32_3 %445 = OpFMul %442 %444 
                               f32_4 %446 = OpLoad %9 
                               f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                               f32_3 %448 = OpFAdd %445 %447 
                               f32_4 %449 = OpLoad %9 
                               f32_4 %450 = OpVectorShuffle %449 %448 4 5 6 3 
                                              OpStore %9 %450 
                               f32_3 %451 = OpLoad %109 
                               f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                               f32_3 %454 = OpFMul %452 %453 
                               f32_4 %455 = OpLoad %9 
                               f32_3 %456 = OpVectorShuffle %455 %455 0 1 2 
                               f32_3 %457 = OpFAdd %454 %456 
                               f32_4 %458 = OpLoad %9 
                               f32_4 %459 = OpVectorShuffle %458 %457 4 5 6 3 
                                              OpStore %9 %459 
                               f32_2 %460 = OpLoad %71 
                               f32_3 %461 = OpVectorShuffle %460 %460 0 0 0 
                               f32_4 %462 = OpLoad %9 
                               f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                               f32_3 %464 = OpFMul %461 %463 
                               f32_4 %465 = OpLoad %9 
                               f32_4 %466 = OpVectorShuffle %465 %464 4 5 6 3 
                                              OpStore %9 %466 
                                 f32 %467 = OpLoad %296 
                                 f32 %468 = OpExtInst %1 8 %467 
                                              OpStore %156 %468 
                                 f32 %469 = OpLoad %156 
                                 f32 %470 = OpFNegate %469 
                                 f32 %471 = OpLoad %296 
                                 f32 %472 = OpFAdd %470 %471 
                                              OpStore %156 %472 
                                 f32 %473 = OpLoad %156 
                                 f32 %475 = OpFAdd %473 %474 
                                              OpStore %156 %475 
                                 f32 %476 = OpLoad %156 
                                 f32 %478 = OpFMul %476 %477 
                                              OpStore %156 %478 
                                 f32 %481 = OpLoad %156 
                               f32_3 %482 = OpCompositeConstruct %481 %481 %481 
                               f32_4 %483 = OpLoad %9 
                               f32_3 %484 = OpVectorShuffle %483 %483 0 1 2 
                               f32_3 %485 = OpFMul %482 %484 
                               f32_4 %486 = OpLoad %480 
                               f32_4 %487 = OpVectorShuffle %486 %485 4 5 6 3 
                                              OpStore %480 %487 
                         Output f32* %489 = OpAccessChain %480 %291 
                                              OpStore %489 %65 
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