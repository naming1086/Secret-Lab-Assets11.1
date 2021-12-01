//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/CameraFilterPack_NewGlitch7" {
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
  GpuProgramID 49832
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
uniform 	float _Speed;
uniform 	float LightMin;
uniform 	float LightMax;
uniform 	vec4 _ScreenResolution;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat12;
bool u_xlatb12;
vec2 u_xlat20;
bool u_xlatb23;
vec2 u_xlat26;
float u_xlat30;
bool u_xlatb33;
void main()
{
    u_xlat0.x = _ScreenResolution.y / _ScreenResolution.x;
    u_xlat0.y = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat20.xy = u_xlat0.xy * vec2(1.0, 1.778);
    u_xlat1 = texture(_MainTex, u_xlat20.xy);
    u_xlat20.x = _TimeX * _Speed;
    u_xlat20.x = u_xlat20.x * 7.67999983;
    u_xlat30 = floor(u_xlat20.x);
    u_xlat20.x = fract(u_xlat20.x);
    u_xlat2.x = u_xlat30 * 60.0;
    u_xlat12.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = (-u_xlat20.x) * 2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat12.x;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 43812.1758;
    u_xlat12.xyz = vec3(u_xlat30) * vec3(60.0, 60.0, 60.0) + vec3(1.0, 59.0, 60.0);
    u_xlat12.xyz = sin(u_xlat12.xyz);
    u_xlat2.yzw = u_xlat12.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
    u_xlat2 = fract(u_xlat2);
    u_xlat30 = (-u_xlat2.x) + u_xlat2.y;
    u_xlat30 = u_xlat20.x * u_xlat30 + u_xlat2.x;
    u_xlat2.x = (-u_xlat2.z) + u_xlat2.w;
    u_xlat2.x = u_xlat20.x * u_xlat2.x + u_xlat2.z;
    u_xlat2.x = (-u_xlat30) + u_xlat2.x;
    u_xlat20.x = u_xlat20.x * u_xlat2.x + u_xlat30;
    u_xlat20.x = log2(abs(u_xlat20.x));
    u_xlat20.x = u_xlat20.x * 15.0;
    u_xlat20.x = exp2(u_xlat20.x);
    u_xlat20.x = min(u_xlat20.x, 1.0);
    u_xlat2.x = float(1.0) / _ScreenResolution.x;
    u_xlat3.y = 1.0;
    u_xlat4.y = 1.0;
    u_xlat5 = u_xlat1;
    u_xlat6.xy = u_xlat0.xy;
    u_xlat30 = 0.0;
    while(true){
        u_xlatb33 = u_xlat30>=6.0;
        if(u_xlatb33){break;}
        u_xlat26.xy = u_xlat6.xy * vec2(28.0, 28.0);
        u_xlat26.xy = fract(u_xlat26.xy);
        u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
        u_xlat26.xy = u_xlat20.xx * u_xlat26.xy + vec2(1.0, 1.0);
        u_xlat26.xy = log2(u_xlat26.xy);
        u_xlat26.xy = u_xlat26.xy * vec2(0.100000001, 0.100000001);
        u_xlat26.xy = exp2(u_xlat26.xy);
        u_xlat6.xy = u_xlat6.xy / u_xlat26.xy;
        u_xlat7 = max(u_xlat5, vec4(vec4(LightMin, LightMin, LightMin, LightMin)));
        u_xlat7 = min(u_xlat7, vec4(vec4(LightMax, LightMax, LightMax, LightMax)));
        u_xlat2.y = u_xlat30 / _ScreenResolution.y;
        u_xlat26.xy = u_xlat6.xy * vec2(1.0, 1.778) + u_xlat2.xy;
        u_xlat8 = texture(_MainTex, u_xlat26.xy);
        u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
        u_xlat8 = min(u_xlat8, vec4(2.0, 2.0, 2.0, 2.0));
        u_xlat8 = u_xlat8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
        u_xlat7 = u_xlat7 / u_xlat8;
        u_xlat2.zw = (-vec2(u_xlat30)) / _ScreenResolution.yx;
        u_xlat8 = u_xlat6.xyxy * vec4(1.0, 1.778, 1.0, 1.778) + u_xlat2.xzwy;
        u_xlat9 = texture(_MainTex, u_xlat8.xy);
        u_xlat9 = max(u_xlat9, vec4(0.0, 0.0, 0.0, 0.0));
        u_xlat9 = min(u_xlat9, vec4(2.0, 2.0, 2.0, 2.0));
        u_xlat9 = u_xlat9 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
        u_xlat7 = u_xlat7 * u_xlat9;
        u_xlat8 = texture(_MainTex, u_xlat8.zw);
        u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
        u_xlat8 = min(u_xlat8, vec4(2.0, 2.0, 2.0, 2.0));
        u_xlat8 = u_xlat8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
        u_xlat7 = u_xlat7 * u_xlat8;
        u_xlat12.xy = u_xlat6.xy * vec2(1.0, 1.778) + u_xlat2.wz;
        u_xlat8 = texture(_MainTex, u_xlat12.xy);
        u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
        u_xlat8 = min(u_xlat8, vec4(2.0, 2.0, 2.0, 2.0));
        u_xlat8 = u_xlat8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
        u_xlat5 = u_xlat7 / u_xlat8;
        u_xlat12.x = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat12.x = sqrt(u_xlat12.x);
        u_xlat12.xy = (-u_xlat12.xx) + vec2(1.0, 0.840000033);
        u_xlatb12 = 0.5>=u_xlat12.x;
        u_xlat3.x = u_xlatb12 ? 1.0 : float(0.0);
        u_xlat3.z = (u_xlatb12) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.y * 1.49253738;
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat7.y = -abs(u_xlat12.x) + 1.0;
        u_xlat7.xz = (-u_xlat7.yy) + vec2(1.0, 1.0);
        u_xlat12.xyz = u_xlat3.xyz * u_xlat7.xyz;
        u_xlat12.xyz = log2(u_xlat12.xyz);
        u_xlat12.xyz = u_xlat12.xyz * vec3(0.449999988, 0.449999988, 0.449999988);
        u_xlat12.xyz = exp2(u_xlat12.xyz);
        u_xlat12.xyz = (-u_xlat12.xyz) * vec3(0.0250000004, 0.0250000004, 0.0250000004) + vec3(1.00999999, 1.00999999, 1.00999999);
        u_xlat12.xyz = u_xlat5.xyz / u_xlat12.xyz;
        u_xlat3.x = dot(u_xlat12.xyz, u_xlat12.xyz);
        u_xlat3.x = sqrt(u_xlat3.x);
        u_xlatb23 = 0.5>=u_xlat3.x;
        u_xlat4.x = u_xlatb23 ? 1.0 : float(0.0);
        u_xlat4.z = (u_xlatb23) ? 0.0 : 1.0;
        u_xlat3.x = u_xlat3.x + -0.159999996;
        u_xlat3.x = u_xlat3.x * 1.49253738;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.x = u_xlat3.x * 2.0 + -1.0;
        u_xlat7.y = -abs(u_xlat3.x) + 1.0;
        u_xlat7.xz = (-u_xlat7.yy) + vec2(1.0, 1.0);
        u_xlat3.xzw = u_xlat4.xyz * u_xlat7.xyz;
        u_xlat3.xzw = log2(u_xlat3.xzw);
        u_xlat3.xzw = u_xlat3.xzw * vec3(0.449999988, 0.449999988, 0.449999988);
        u_xlat3.xzw = exp2(u_xlat3.xzw);
        u_xlat3.xzw = u_xlat3.xzw * vec3(0.00999999978, 0.00999999978, 0.00999999978) + vec3(1.0, 1.0, 1.0);
        u_xlat5.xyz = u_xlat12.xyz * u_xlat3.xzw;
        u_xlat30 = u_xlat30 + 1.0;
    }
    u_xlat0 = u_xlat5 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
    u_xlat1.x = dot(u_xlat0, u_xlat0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.200000003, -0.200000003, -0.200000003, -0.200000003);
    SV_Target0 = u_xlat0 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976);
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
; Bound: 586
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %30 %582 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpMemberDecorate %10 0 Offset 10 
                                                     OpMemberDecorate %10 1 Offset 10 
                                                     OpMemberDecorate %10 2 Offset 10 
                                                     OpMemberDecorate %10 3 Offset 10 
                                                     OpMemberDecorate %10 4 Offset 10 
                                                     OpDecorate %10 Block 
                                                     OpDecorate %12 DescriptorSet 12 
                                                     OpDecorate %12 Binding 12 
                                                     OpDecorate vs_TEXCOORD0 Location 30 
                                                     OpDecorate %50 DescriptorSet 50 
                                                     OpDecorate %50 Binding 50 
                                                     OpDecorate %54 DescriptorSet 54 
                                                     OpDecorate %54 Binding 54 
                                                     OpDecorate %582 Location 582 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeStruct %6 %6 %6 %6 %7 
                                             %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                             %13 = OpTypeInt 32 1 
                                         i32 %14 = OpConstant 4 
                                             %15 = OpTypeInt 32 0 
                                         u32 %16 = OpConstant 1 
                                             %17 = OpTypePointer Uniform %6 
                                         u32 %20 = OpConstant 0 
                                             %24 = OpTypePointer Private %6 
                                             %28 = OpTypeVector %6 2 
                                             %29 = OpTypePointer Input %28 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %31 = OpTypePointer Input %6 
                                             %39 = OpTypePointer Private %28 
                              Private f32_2* %40 = OpVariable Private 
                                         f32 %43 = OpConstant 3.674022E-40 
                                         f32 %44 = OpConstant 3.674022E-40 
                                       f32_2 %45 = OpConstantComposite %43 %44 
                              Private f32_4* %47 = OpVariable Private 
                                             %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %49 = OpTypePointer UniformConstant %48 
        UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
                                             %52 = OpTypeSampler 
                                             %53 = OpTypePointer UniformConstant %52 
                    UniformConstant sampler* %54 = OpVariable UniformConstant 
                                             %56 = OpTypeSampledImage %48 
                                         i32 %60 = OpConstant 0 
                                         i32 %63 = OpConstant 1 
                                         f32 %70 = OpConstant 3.674022E-40 
                                Private f32* %73 = OpVariable Private 
                              Private f32_4* %81 = OpVariable Private 
                                         f32 %83 = OpConstant 3.674022E-40 
                                             %86 = OpTypeVector %6 3 
                                             %87 = OpTypePointer Private %86 
                              Private f32_3* %88 = OpVariable Private 
                                         f32 %98 = OpConstant 3.674022E-40 
                                        f32 %100 = OpConstant 3.674022E-40 
                                        f32 %115 = OpConstant 3.674022E-40 
                                      f32_3 %120 = OpConstantComposite %83 %83 %83 
                                        f32 %122 = OpConstant 3.674022E-40 
                                      f32_3 %123 = OpConstantComposite %43 %122 %83 
                                      f32_3 %128 = OpConstantComposite %115 %115 %115 
                                        u32 %147 = OpConstant 2 
                                        u32 %151 = OpConstant 3 
                                        f32 %186 = OpConstant 3.674022E-40 
                             Private f32_4* %201 = OpVariable Private 
                             Private f32_3* %203 = OpVariable Private 
                             Private f32_4* %205 = OpVariable Private 
                             Private f32_2* %207 = OpVariable Private 
                                        f32 %210 = OpConstant 3.674022E-40 
                                            %216 = OpTypeBool 
                                       bool %217 = OpConstantTrue 
                                            %218 = OpTypePointer Private %216 
                              Private bool* %219 = OpVariable Private 
                                        f32 %221 = OpConstant 3.674022E-40 
                             Private f32_2* %227 = OpVariable Private 
                                        f32 %229 = OpConstant 3.674022E-40 
                                      f32_2 %230 = OpConstantComposite %229 %229 
                                        f32 %235 = OpConstant 3.674022E-40 
                                      f32_2 %236 = OpConstantComposite %235 %235 
                                      f32_2 %242 = OpConstantComposite %43 %43 
                                        f32 %247 = OpConstant 3.674022E-40 
                                      f32_2 %248 = OpConstantComposite %247 %247 
                             Private f32_4* %255 = OpVariable Private 
                                        i32 %257 = OpConstant 2 
                                        i32 %274 = OpConstant 3 
                             Private f32_4* %300 = OpVariable Private 
                                      f32_4 %307 = OpConstantComposite %210 %210 %210 %210 
                                      f32_4 %310 = OpConstantComposite %98 %98 %98 %98 
                                        f32 %313 = OpConstant 3.674022E-40 
                                      f32_4 %314 = OpConstantComposite %313 %313 %313 %313 
                                      f32_4 %316 = OpConstantComposite %247 %247 %247 %247 
                                            %324 = OpTypePointer Uniform %7 
                                      f32_4 %333 = OpConstantComposite %43 %44 %43 %44 
                             Private f32_4* %338 = OpVariable Private 
                                        f32 %407 = OpConstant 3.674022E-40 
                                      f32_2 %408 = OpConstantComposite %43 %407 
                              Private bool* %412 = OpVariable Private 
                                        f32 %413 = OpConstant 3.674022E-40 
                                        f32 %425 = OpConstant 3.674022E-40 
                                        f32 %435 = OpConstant 3.674022E-40 
                                        f32 %458 = OpConstant 3.674022E-40 
                                      f32_3 %459 = OpConstantComposite %458 %458 %458 
                                        f32 %465 = OpConstant 3.674022E-40 
                                      f32_3 %466 = OpConstantComposite %465 %465 %465 
                                        f32 %468 = OpConstant 3.674022E-40 
                                      f32_3 %469 = OpConstantComposite %468 %468 %468 
                              Private bool* %483 = OpVariable Private 
                                        f32 %495 = OpConstant 3.674022E-40 
                                        f32 %546 = OpConstant 3.674022E-40 
                                      f32_3 %547 = OpConstantComposite %546 %546 %546 
                                      f32_3 %549 = OpConstantComposite %43 %43 %43 
                                        f32 %578 = OpConstant 3.674022E-40 
                                      f32_4 %579 = OpConstantComposite %578 %578 %578 %578 
                                            %581 = OpTypePointer Output %7 
                              Output f32_4* %582 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                         f32 %19 = OpLoad %18 
                                Uniform f32* %21 = OpAccessChain %12 %14 %20 
                                         f32 %22 = OpLoad %21 
                                         f32 %23 = OpFDiv %19 %22 
                                Private f32* %25 = OpAccessChain %9 %20 
                                                     OpStore %25 %23 
                                Private f32* %26 = OpAccessChain %9 %20 
                                         f32 %27 = OpLoad %26 
                                  Input f32* %32 = OpAccessChain vs_TEXCOORD0 %16 
                                         f32 %33 = OpLoad %32 
                                         f32 %34 = OpFMul %27 %33 
                                Private f32* %35 = OpAccessChain %9 %16 
                                                     OpStore %35 %34 
                                  Input f32* %36 = OpAccessChain vs_TEXCOORD0 %20 
                                         f32 %37 = OpLoad %36 
                                Private f32* %38 = OpAccessChain %9 %20 
                                                     OpStore %38 %37 
                                       f32_4 %41 = OpLoad %9 
                                       f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                       f32_2 %46 = OpFMul %42 %45 
                                                     OpStore %40 %46 
                         read_only Texture2D %51 = OpLoad %50 
                                     sampler %55 = OpLoad %54 
                  read_only Texture2DSampled %57 = OpSampledImage %51 %55 
                                       f32_2 %58 = OpLoad %40 
                                       f32_4 %59 = OpImageSampleImplicitLod %57 %58 
                                                     OpStore %47 %59 
                                Uniform f32* %61 = OpAccessChain %12 %60 
                                         f32 %62 = OpLoad %61 
                                Uniform f32* %64 = OpAccessChain %12 %63 
                                         f32 %65 = OpLoad %64 
                                         f32 %66 = OpFMul %62 %65 
                                Private f32* %67 = OpAccessChain %40 %20 
                                                     OpStore %67 %66 
                                Private f32* %68 = OpAccessChain %40 %20 
                                         f32 %69 = OpLoad %68 
                                         f32 %71 = OpFMul %69 %70 
                                Private f32* %72 = OpAccessChain %40 %20 
                                                     OpStore %72 %71 
                                Private f32* %74 = OpAccessChain %40 %20 
                                         f32 %75 = OpLoad %74 
                                         f32 %76 = OpExtInst %1 8 %75 
                                                     OpStore %73 %76 
                                Private f32* %77 = OpAccessChain %40 %20 
                                         f32 %78 = OpLoad %77 
                                         f32 %79 = OpExtInst %1 10 %78 
                                Private f32* %80 = OpAccessChain %40 %20 
                                                     OpStore %80 %79 
                                         f32 %82 = OpLoad %73 
                                         f32 %84 = OpFMul %82 %83 
                                Private f32* %85 = OpAccessChain %81 %20 
                                                     OpStore %85 %84 
                                Private f32* %89 = OpAccessChain %40 %20 
                                         f32 %90 = OpLoad %89 
                                Private f32* %91 = OpAccessChain %40 %20 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFMul %90 %92 
                                Private f32* %94 = OpAccessChain %88 %20 
                                                     OpStore %94 %93 
                                Private f32* %95 = OpAccessChain %40 %20 
                                         f32 %96 = OpLoad %95 
                                         f32 %97 = OpFNegate %96 
                                         f32 %99 = OpFMul %97 %98 
                                        f32 %101 = OpFAdd %99 %100 
                               Private f32* %102 = OpAccessChain %40 %20 
                                                     OpStore %102 %101 
                               Private f32* %103 = OpAccessChain %40 %20 
                                        f32 %104 = OpLoad %103 
                               Private f32* %105 = OpAccessChain %88 %20 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFMul %104 %106 
                               Private f32* %108 = OpAccessChain %40 %20 
                                                     OpStore %108 %107 
                               Private f32* %109 = OpAccessChain %81 %20 
                                        f32 %110 = OpLoad %109 
                                        f32 %111 = OpExtInst %1 13 %110 
                               Private f32* %112 = OpAccessChain %81 %20 
                                                     OpStore %112 %111 
                               Private f32* %113 = OpAccessChain %81 %20 
                                        f32 %114 = OpLoad %113 
                                        f32 %116 = OpFMul %114 %115 
                               Private f32* %117 = OpAccessChain %81 %20 
                                                     OpStore %117 %116 
                                        f32 %118 = OpLoad %73 
                                      f32_3 %119 = OpCompositeConstruct %118 %118 %118 
                                      f32_3 %121 = OpFMul %119 %120 
                                      f32_3 %124 = OpFAdd %121 %123 
                                                     OpStore %88 %124 
                                      f32_3 %125 = OpLoad %88 
                                      f32_3 %126 = OpExtInst %1 13 %125 
                                                     OpStore %88 %126 
                                      f32_3 %127 = OpLoad %88 
                                      f32_3 %129 = OpFMul %127 %128 
                                      f32_4 %130 = OpLoad %81 
                                      f32_4 %131 = OpVectorShuffle %130 %129 0 4 5 6 
                                                     OpStore %81 %131 
                                      f32_4 %132 = OpLoad %81 
                                      f32_4 %133 = OpExtInst %1 10 %132 
                                                     OpStore %81 %133 
                               Private f32* %134 = OpAccessChain %81 %20 
                                        f32 %135 = OpLoad %134 
                                        f32 %136 = OpFNegate %135 
                               Private f32* %137 = OpAccessChain %81 %16 
                                        f32 %138 = OpLoad %137 
                                        f32 %139 = OpFAdd %136 %138 
                                                     OpStore %73 %139 
                               Private f32* %140 = OpAccessChain %40 %20 
                                        f32 %141 = OpLoad %140 
                                        f32 %142 = OpLoad %73 
                                        f32 %143 = OpFMul %141 %142 
                               Private f32* %144 = OpAccessChain %81 %20 
                                        f32 %145 = OpLoad %144 
                                        f32 %146 = OpFAdd %143 %145 
                                                     OpStore %73 %146 
                               Private f32* %148 = OpAccessChain %81 %147 
                                        f32 %149 = OpLoad %148 
                                        f32 %150 = OpFNegate %149 
                               Private f32* %152 = OpAccessChain %81 %151 
                                        f32 %153 = OpLoad %152 
                                        f32 %154 = OpFAdd %150 %153 
                               Private f32* %155 = OpAccessChain %81 %20 
                                                     OpStore %155 %154 
                               Private f32* %156 = OpAccessChain %40 %20 
                                        f32 %157 = OpLoad %156 
                               Private f32* %158 = OpAccessChain %81 %20 
                                        f32 %159 = OpLoad %158 
                                        f32 %160 = OpFMul %157 %159 
                               Private f32* %161 = OpAccessChain %81 %147 
                                        f32 %162 = OpLoad %161 
                                        f32 %163 = OpFAdd %160 %162 
                               Private f32* %164 = OpAccessChain %81 %20 
                                                     OpStore %164 %163 
                                        f32 %165 = OpLoad %73 
                                        f32 %166 = OpFNegate %165 
                               Private f32* %167 = OpAccessChain %81 %20 
                                        f32 %168 = OpLoad %167 
                                        f32 %169 = OpFAdd %166 %168 
                               Private f32* %170 = OpAccessChain %81 %20 
                                                     OpStore %170 %169 
                               Private f32* %171 = OpAccessChain %40 %20 
                                        f32 %172 = OpLoad %171 
                               Private f32* %173 = OpAccessChain %81 %20 
                                        f32 %174 = OpLoad %173 
                                        f32 %175 = OpFMul %172 %174 
                                        f32 %176 = OpLoad %73 
                                        f32 %177 = OpFAdd %175 %176 
                               Private f32* %178 = OpAccessChain %40 %20 
                                                     OpStore %178 %177 
                               Private f32* %179 = OpAccessChain %40 %20 
                                        f32 %180 = OpLoad %179 
                                        f32 %181 = OpExtInst %1 4 %180 
                                        f32 %182 = OpExtInst %1 30 %181 
                               Private f32* %183 = OpAccessChain %40 %20 
                                                     OpStore %183 %182 
                               Private f32* %184 = OpAccessChain %40 %20 
                                        f32 %185 = OpLoad %184 
                                        f32 %187 = OpFMul %185 %186 
                               Private f32* %188 = OpAccessChain %40 %20 
                                                     OpStore %188 %187 
                               Private f32* %189 = OpAccessChain %40 %20 
                                        f32 %190 = OpLoad %189 
                                        f32 %191 = OpExtInst %1 29 %190 
                               Private f32* %192 = OpAccessChain %40 %20 
                                                     OpStore %192 %191 
                               Private f32* %193 = OpAccessChain %40 %20 
                                        f32 %194 = OpLoad %193 
                                        f32 %195 = OpExtInst %1 37 %194 %43 
                               Private f32* %196 = OpAccessChain %40 %20 
                                                     OpStore %196 %195 
                               Uniform f32* %197 = OpAccessChain %12 %14 %20 
                                        f32 %198 = OpLoad %197 
                                        f32 %199 = OpFDiv %43 %198 
                               Private f32* %200 = OpAccessChain %81 %20 
                                                     OpStore %200 %199 
                               Private f32* %202 = OpAccessChain %201 %16 
                                                     OpStore %202 %43 
                               Private f32* %204 = OpAccessChain %203 %16 
                                                     OpStore %204 %43 
                                      f32_4 %206 = OpLoad %47 
                                                     OpStore %205 %206 
                                      f32_4 %208 = OpLoad %9 
                                      f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                                     OpStore %207 %209 
                                                     OpStore %73 %210 
                                                     OpBranch %211 
                                            %211 = OpLabel 
                                                     OpLoopMerge %213 %214 None 
                                                     OpBranch %215 
                                            %215 = OpLabel 
                                                     OpBranchConditional %217 %212 %213 
                                            %212 = OpLabel 
                                        f32 %220 = OpLoad %73 
                                       bool %222 = OpFOrdGreaterThanEqual %220 %221 
                                                     OpStore %219 %222 
                                       bool %223 = OpLoad %219 
                                                     OpSelectionMerge %225 None 
                                                     OpBranchConditional %223 %224 %225 
                                            %224 = OpLabel 
                                                     OpBranch %213 
                                            %225 = OpLabel 
                                      f32_2 %228 = OpLoad %207 
                                      f32_2 %231 = OpFMul %228 %230 
                                                     OpStore %227 %231 
                                      f32_2 %232 = OpLoad %227 
                                      f32_2 %233 = OpExtInst %1 10 %232 
                                                     OpStore %227 %233 
                                      f32_2 %234 = OpLoad %227 
                                      f32_2 %237 = OpFAdd %234 %236 
                                                     OpStore %227 %237 
                                      f32_2 %238 = OpLoad %40 
                                      f32_2 %239 = OpVectorShuffle %238 %238 0 0 
                                      f32_2 %240 = OpLoad %227 
                                      f32_2 %241 = OpFMul %239 %240 
                                      f32_2 %243 = OpFAdd %241 %242 
                                                     OpStore %227 %243 
                                      f32_2 %244 = OpLoad %227 
                                      f32_2 %245 = OpExtInst %1 30 %244 
                                                     OpStore %227 %245 
                                      f32_2 %246 = OpLoad %227 
                                      f32_2 %249 = OpFMul %246 %248 
                                                     OpStore %227 %249 
                                      f32_2 %250 = OpLoad %227 
                                      f32_2 %251 = OpExtInst %1 29 %250 
                                                     OpStore %227 %251 
                                      f32_2 %252 = OpLoad %207 
                                      f32_2 %253 = OpLoad %227 
                                      f32_2 %254 = OpFDiv %252 %253 
                                                     OpStore %207 %254 
                                      f32_4 %256 = OpLoad %205 
                               Uniform f32* %258 = OpAccessChain %12 %257 
                                        f32 %259 = OpLoad %258 
                               Uniform f32* %260 = OpAccessChain %12 %257 
                                        f32 %261 = OpLoad %260 
                               Uniform f32* %262 = OpAccessChain %12 %257 
                                        f32 %263 = OpLoad %262 
                               Uniform f32* %264 = OpAccessChain %12 %257 
                                        f32 %265 = OpLoad %264 
                                      f32_4 %266 = OpCompositeConstruct %259 %261 %263 %265 
                                        f32 %267 = OpCompositeExtract %266 0 
                                        f32 %268 = OpCompositeExtract %266 1 
                                        f32 %269 = OpCompositeExtract %266 2 
                                        f32 %270 = OpCompositeExtract %266 3 
                                      f32_4 %271 = OpCompositeConstruct %267 %268 %269 %270 
                                      f32_4 %272 = OpExtInst %1 40 %256 %271 
                                                     OpStore %255 %272 
                                      f32_4 %273 = OpLoad %255 
                               Uniform f32* %275 = OpAccessChain %12 %274 
                                        f32 %276 = OpLoad %275 
                               Uniform f32* %277 = OpAccessChain %12 %274 
                                        f32 %278 = OpLoad %277 
                               Uniform f32* %279 = OpAccessChain %12 %274 
                                        f32 %280 = OpLoad %279 
                               Uniform f32* %281 = OpAccessChain %12 %274 
                                        f32 %282 = OpLoad %281 
                                      f32_4 %283 = OpCompositeConstruct %276 %278 %280 %282 
                                        f32 %284 = OpCompositeExtract %283 0 
                                        f32 %285 = OpCompositeExtract %283 1 
                                        f32 %286 = OpCompositeExtract %283 2 
                                        f32 %287 = OpCompositeExtract %283 3 
                                      f32_4 %288 = OpCompositeConstruct %284 %285 %286 %287 
                                      f32_4 %289 = OpExtInst %1 37 %273 %288 
                                                     OpStore %255 %289 
                                        f32 %290 = OpLoad %73 
                               Uniform f32* %291 = OpAccessChain %12 %14 %16 
                                        f32 %292 = OpLoad %291 
                                        f32 %293 = OpFDiv %290 %292 
                               Private f32* %294 = OpAccessChain %81 %16 
                                                     OpStore %294 %293 
                                      f32_2 %295 = OpLoad %207 
                                      f32_2 %296 = OpFMul %295 %45 
                                      f32_4 %297 = OpLoad %81 
                                      f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                      f32_2 %299 = OpFAdd %296 %298 
                                                     OpStore %227 %299 
                        read_only Texture2D %301 = OpLoad %50 
                                    sampler %302 = OpLoad %54 
                 read_only Texture2DSampled %303 = OpSampledImage %301 %302 
                                      f32_2 %304 = OpLoad %227 
                                      f32_4 %305 = OpImageSampleImplicitLod %303 %304 
                                                     OpStore %300 %305 
                                      f32_4 %306 = OpLoad %300 
                                      f32_4 %308 = OpExtInst %1 40 %306 %307 
                                                     OpStore %300 %308 
                                      f32_4 %309 = OpLoad %300 
                                      f32_4 %311 = OpExtInst %1 37 %309 %310 
                                                     OpStore %300 %311 
                                      f32_4 %312 = OpLoad %300 
                                      f32_4 %315 = OpFMul %312 %314 
                                      f32_4 %317 = OpFAdd %315 %316 
                                                     OpStore %300 %317 
                                      f32_4 %318 = OpLoad %255 
                                      f32_4 %319 = OpLoad %300 
                                      f32_4 %320 = OpFDiv %318 %319 
                                                     OpStore %255 %320 
                                        f32 %321 = OpLoad %73 
                                      f32_2 %322 = OpCompositeConstruct %321 %321 
                                      f32_2 %323 = OpFNegate %322 
                             Uniform f32_4* %325 = OpAccessChain %12 %14 
                                      f32_4 %326 = OpLoad %325 
                                      f32_2 %327 = OpVectorShuffle %326 %326 1 0 
                                      f32_2 %328 = OpFDiv %323 %327 
                                      f32_4 %329 = OpLoad %81 
                                      f32_4 %330 = OpVectorShuffle %329 %328 0 1 4 5 
                                                     OpStore %81 %330 
                                      f32_2 %331 = OpLoad %207 
                                      f32_4 %332 = OpVectorShuffle %331 %331 0 1 0 1 
                                      f32_4 %334 = OpFMul %332 %333 
                                      f32_4 %335 = OpLoad %81 
                                      f32_4 %336 = OpVectorShuffle %335 %335 0 2 3 1 
                                      f32_4 %337 = OpFAdd %334 %336 
                                                     OpStore %300 %337 
                        read_only Texture2D %339 = OpLoad %50 
                                    sampler %340 = OpLoad %54 
                 read_only Texture2DSampled %341 = OpSampledImage %339 %340 
                                      f32_4 %342 = OpLoad %300 
                                      f32_2 %343 = OpVectorShuffle %342 %342 0 1 
                                      f32_4 %344 = OpImageSampleImplicitLod %341 %343 
                                                     OpStore %338 %344 
                                      f32_4 %345 = OpLoad %338 
                                      f32_4 %346 = OpExtInst %1 40 %345 %307 
                                                     OpStore %338 %346 
                                      f32_4 %347 = OpLoad %338 
                                      f32_4 %348 = OpExtInst %1 37 %347 %310 
                                                     OpStore %338 %348 
                                      f32_4 %349 = OpLoad %338 
                                      f32_4 %350 = OpFMul %349 %314 
                                      f32_4 %351 = OpFAdd %350 %316 
                                                     OpStore %338 %351 
                                      f32_4 %352 = OpLoad %255 
                                      f32_4 %353 = OpLoad %338 
                                      f32_4 %354 = OpFMul %352 %353 
                                                     OpStore %255 %354 
                        read_only Texture2D %355 = OpLoad %50 
                                    sampler %356 = OpLoad %54 
                 read_only Texture2DSampled %357 = OpSampledImage %355 %356 
                                      f32_4 %358 = OpLoad %300 
                                      f32_2 %359 = OpVectorShuffle %358 %358 2 3 
                                      f32_4 %360 = OpImageSampleImplicitLod %357 %359 
                                                     OpStore %300 %360 
                                      f32_4 %361 = OpLoad %300 
                                      f32_4 %362 = OpExtInst %1 40 %361 %307 
                                                     OpStore %300 %362 
                                      f32_4 %363 = OpLoad %300 
                                      f32_4 %364 = OpExtInst %1 37 %363 %310 
                                                     OpStore %300 %364 
                                      f32_4 %365 = OpLoad %300 
                                      f32_4 %366 = OpFMul %365 %314 
                                      f32_4 %367 = OpFAdd %366 %316 
                                                     OpStore %300 %367 
                                      f32_4 %368 = OpLoad %255 
                                      f32_4 %369 = OpLoad %300 
                                      f32_4 %370 = OpFMul %368 %369 
                                                     OpStore %255 %370 
                                      f32_2 %371 = OpLoad %207 
                                      f32_2 %372 = OpFMul %371 %45 
                                      f32_4 %373 = OpLoad %81 
                                      f32_2 %374 = OpVectorShuffle %373 %373 3 2 
                                      f32_2 %375 = OpFAdd %372 %374 
                                      f32_3 %376 = OpLoad %88 
                                      f32_3 %377 = OpVectorShuffle %376 %375 3 4 2 
                                                     OpStore %88 %377 
                        read_only Texture2D %378 = OpLoad %50 
                                    sampler %379 = OpLoad %54 
                 read_only Texture2DSampled %380 = OpSampledImage %378 %379 
                                      f32_3 %381 = OpLoad %88 
                                      f32_2 %382 = OpVectorShuffle %381 %381 0 1 
                                      f32_4 %383 = OpImageSampleImplicitLod %380 %382 
                                                     OpStore %300 %383 
                                      f32_4 %384 = OpLoad %300 
                                      f32_4 %385 = OpExtInst %1 40 %384 %307 
                                                     OpStore %300 %385 
                                      f32_4 %386 = OpLoad %300 
                                      f32_4 %387 = OpExtInst %1 37 %386 %310 
                                                     OpStore %300 %387 
                                      f32_4 %388 = OpLoad %300 
                                      f32_4 %389 = OpFMul %388 %314 
                                      f32_4 %390 = OpFAdd %389 %316 
                                                     OpStore %300 %390 
                                      f32_4 %391 = OpLoad %255 
                                      f32_4 %392 = OpLoad %300 
                                      f32_4 %393 = OpFDiv %391 %392 
                                                     OpStore %205 %393 
                                      f32_4 %394 = OpLoad %205 
                                      f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                                      f32_4 %396 = OpLoad %205 
                                      f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
                                        f32 %398 = OpDot %395 %397 
                               Private f32* %399 = OpAccessChain %88 %20 
                                                     OpStore %399 %398 
                               Private f32* %400 = OpAccessChain %88 %20 
                                        f32 %401 = OpLoad %400 
                                        f32 %402 = OpExtInst %1 31 %401 
                               Private f32* %403 = OpAccessChain %88 %20 
                                                     OpStore %403 %402 
                                      f32_3 %404 = OpLoad %88 
                                      f32_2 %405 = OpVectorShuffle %404 %404 0 0 
                                      f32_2 %406 = OpFNegate %405 
                                      f32_2 %409 = OpFAdd %406 %408 
                                      f32_3 %410 = OpLoad %88 
                                      f32_3 %411 = OpVectorShuffle %410 %409 3 4 2 
                                                     OpStore %88 %411 
                               Private f32* %414 = OpAccessChain %88 %20 
                                        f32 %415 = OpLoad %414 
                                       bool %416 = OpFOrdGreaterThanEqual %413 %415 
                                                     OpStore %412 %416 
                                       bool %417 = OpLoad %412 
                                        f32 %418 = OpSelect %417 %43 %210 
                               Private f32* %419 = OpAccessChain %201 %20 
                                                     OpStore %419 %418 
                                       bool %420 = OpLoad %412 
                                        f32 %421 = OpSelect %420 %210 %43 
                               Private f32* %422 = OpAccessChain %201 %147 
                                                     OpStore %422 %421 
                               Private f32* %423 = OpAccessChain %88 %16 
                                        f32 %424 = OpLoad %423 
                                        f32 %426 = OpFMul %424 %425 
                               Private f32* %427 = OpAccessChain %88 %20 
                                                     OpStore %427 %426 
                               Private f32* %428 = OpAccessChain %88 %20 
                                        f32 %429 = OpLoad %428 
                                        f32 %430 = OpExtInst %1 43 %429 %210 %43 
                               Private f32* %431 = OpAccessChain %88 %20 
                                                     OpStore %431 %430 
                               Private f32* %432 = OpAccessChain %88 %20 
                                        f32 %433 = OpLoad %432 
                                        f32 %434 = OpFMul %433 %98 
                                        f32 %436 = OpFAdd %434 %435 
                               Private f32* %437 = OpAccessChain %88 %20 
                                                     OpStore %437 %436 
                               Private f32* %438 = OpAccessChain %88 %20 
                                        f32 %439 = OpLoad %438 
                                        f32 %440 = OpExtInst %1 4 %439 
                                        f32 %441 = OpFNegate %440 
                                        f32 %442 = OpFAdd %441 %43 
                               Private f32* %443 = OpAccessChain %255 %16 
                                                     OpStore %443 %442 
                                      f32_4 %444 = OpLoad %255 
                                      f32_2 %445 = OpVectorShuffle %444 %444 1 1 
                                      f32_2 %446 = OpFNegate %445 
                                      f32_2 %447 = OpFAdd %446 %242 
                                      f32_4 %448 = OpLoad %255 
                                      f32_4 %449 = OpVectorShuffle %448 %447 4 1 5 3 
                                                     OpStore %255 %449 
                                      f32_4 %450 = OpLoad %201 
                                      f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                      f32_4 %452 = OpLoad %255 
                                      f32_3 %453 = OpVectorShuffle %452 %452 0 1 2 
                                      f32_3 %454 = OpFMul %451 %453 
                                                     OpStore %88 %454 
                                      f32_3 %455 = OpLoad %88 
                                      f32_3 %456 = OpExtInst %1 30 %455 
                                                     OpStore %88 %456 
                                      f32_3 %457 = OpLoad %88 
                                      f32_3 %460 = OpFMul %457 %459 
                                                     OpStore %88 %460 
                                      f32_3 %461 = OpLoad %88 
                                      f32_3 %462 = OpExtInst %1 29 %461 
                                                     OpStore %88 %462 
                                      f32_3 %463 = OpLoad %88 
                                      f32_3 %464 = OpFNegate %463 
                                      f32_3 %467 = OpFMul %464 %466 
                                      f32_3 %470 = OpFAdd %467 %469 
                                                     OpStore %88 %470 
                                      f32_4 %471 = OpLoad %205 
                                      f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                      f32_3 %473 = OpLoad %88 
                                      f32_3 %474 = OpFDiv %472 %473 
                                                     OpStore %88 %474 
                                      f32_3 %475 = OpLoad %88 
                                      f32_3 %476 = OpLoad %88 
                                        f32 %477 = OpDot %475 %476 
                               Private f32* %478 = OpAccessChain %201 %20 
                                                     OpStore %478 %477 
                               Private f32* %479 = OpAccessChain %201 %20 
                                        f32 %480 = OpLoad %479 
                                        f32 %481 = OpExtInst %1 31 %480 
                               Private f32* %482 = OpAccessChain %201 %20 
                                                     OpStore %482 %481 
                               Private f32* %484 = OpAccessChain %201 %20 
                                        f32 %485 = OpLoad %484 
                                       bool %486 = OpFOrdGreaterThanEqual %413 %485 
                                                     OpStore %483 %486 
                                       bool %487 = OpLoad %483 
                                        f32 %488 = OpSelect %487 %43 %210 
                               Private f32* %489 = OpAccessChain %203 %20 
                                                     OpStore %489 %488 
                                       bool %490 = OpLoad %483 
                                        f32 %491 = OpSelect %490 %210 %43 
                               Private f32* %492 = OpAccessChain %203 %147 
                                                     OpStore %492 %491 
                               Private f32* %493 = OpAccessChain %201 %20 
                                        f32 %494 = OpLoad %493 
                                        f32 %496 = OpFAdd %494 %495 
                               Private f32* %497 = OpAccessChain %201 %20 
                                                     OpStore %497 %496 
                               Private f32* %498 = OpAccessChain %201 %20 
                                        f32 %499 = OpLoad %498 
                                        f32 %500 = OpFMul %499 %425 
                               Private f32* %501 = OpAccessChain %201 %20 
                                                     OpStore %501 %500 
                               Private f32* %502 = OpAccessChain %201 %20 
                                        f32 %503 = OpLoad %502 
                                        f32 %504 = OpExtInst %1 43 %503 %210 %43 
                               Private f32* %505 = OpAccessChain %201 %20 
                                                     OpStore %505 %504 
                               Private f32* %506 = OpAccessChain %201 %20 
                                        f32 %507 = OpLoad %506 
                                        f32 %508 = OpFMul %507 %98 
                                        f32 %509 = OpFAdd %508 %435 
                               Private f32* %510 = OpAccessChain %201 %20 
                                                     OpStore %510 %509 
                               Private f32* %511 = OpAccessChain %201 %20 
                                        f32 %512 = OpLoad %511 
                                        f32 %513 = OpExtInst %1 4 %512 
                                        f32 %514 = OpFNegate %513 
                                        f32 %515 = OpFAdd %514 %43 
                               Private f32* %516 = OpAccessChain %255 %16 
                                                     OpStore %516 %515 
                                      f32_4 %517 = OpLoad %255 
                                      f32_2 %518 = OpVectorShuffle %517 %517 1 1 
                                      f32_2 %519 = OpFNegate %518 
                                      f32_2 %520 = OpFAdd %519 %242 
                                      f32_4 %521 = OpLoad %255 
                                      f32_4 %522 = OpVectorShuffle %521 %520 4 1 5 3 
                                                     OpStore %255 %522 
                                      f32_3 %523 = OpLoad %203 
                                      f32_4 %524 = OpLoad %255 
                                      f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
                                      f32_3 %526 = OpFMul %523 %525 
                                      f32_4 %527 = OpLoad %201 
                                      f32_4 %528 = OpVectorShuffle %527 %526 4 1 5 6 
                                                     OpStore %201 %528 
                                      f32_4 %529 = OpLoad %201 
                                      f32_3 %530 = OpVectorShuffle %529 %529 0 2 3 
                                      f32_3 %531 = OpExtInst %1 30 %530 
                                      f32_4 %532 = OpLoad %201 
                                      f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 6 
                                                     OpStore %201 %533 
                                      f32_4 %534 = OpLoad %201 
                                      f32_3 %535 = OpVectorShuffle %534 %534 0 2 3 
                                      f32_3 %536 = OpFMul %535 %459 
                                      f32_4 %537 = OpLoad %201 
                                      f32_4 %538 = OpVectorShuffle %537 %536 4 1 5 6 
                                                     OpStore %201 %538 
                                      f32_4 %539 = OpLoad %201 
                                      f32_3 %540 = OpVectorShuffle %539 %539 0 2 3 
                                      f32_3 %541 = OpExtInst %1 29 %540 
                                      f32_4 %542 = OpLoad %201 
                                      f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 6 
                                                     OpStore %201 %543 
                                      f32_4 %544 = OpLoad %201 
                                      f32_3 %545 = OpVectorShuffle %544 %544 0 2 3 
                                      f32_3 %548 = OpFMul %545 %547 
                                      f32_3 %550 = OpFAdd %548 %549 
                                      f32_4 %551 = OpLoad %201 
                                      f32_4 %552 = OpVectorShuffle %551 %550 4 1 5 6 
                                                     OpStore %201 %552 
                                      f32_3 %553 = OpLoad %88 
                                      f32_4 %554 = OpLoad %201 
                                      f32_3 %555 = OpVectorShuffle %554 %554 0 2 3 
                                      f32_3 %556 = OpFMul %553 %555 
                                      f32_4 %557 = OpLoad %205 
                                      f32_4 %558 = OpVectorShuffle %557 %556 4 5 6 3 
                                                     OpStore %205 %558 
                                        f32 %559 = OpLoad %73 
                                        f32 %560 = OpFAdd %559 %43 
                                                     OpStore %73 %560 
                                                     OpBranch %214 
                                            %214 = OpLabel 
                                                     OpBranch %211 
                                            %213 = OpLabel 
                                      f32_4 %561 = OpLoad %205 
                                      f32_4 %562 = OpFMul %561 %314 
                                      f32_4 %563 = OpFAdd %562 %316 
                                                     OpStore %9 %563 
                                      f32_4 %564 = OpLoad %9 
                                      f32_4 %565 = OpLoad %9 
                                        f32 %566 = OpDot %564 %565 
                               Private f32* %567 = OpAccessChain %47 %20 
                                                     OpStore %567 %566 
                               Private f32* %568 = OpAccessChain %47 %20 
                                        f32 %569 = OpLoad %568 
                                        f32 %570 = OpExtInst %1 31 %569 
                               Private f32* %571 = OpAccessChain %47 %20 
                                                     OpStore %571 %570 
                                      f32_4 %572 = OpLoad %9 
                                      f32_4 %573 = OpLoad %47 
                                      f32_4 %574 = OpVectorShuffle %573 %573 0 0 0 0 
                                      f32_4 %575 = OpFDiv %572 %574 
                                                     OpStore %9 %575 
                                      f32_4 %576 = OpLoad %9 
                                      f32_4 %577 = OpFMul %576 %310 
                                      f32_4 %580 = OpFAdd %577 %579 
                                                     OpStore %9 %580 
                                      f32_4 %583 = OpLoad %9 
                                      f32_4 %584 = OpFMul %583 %314 
                                                     OpStore %582 %584 
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