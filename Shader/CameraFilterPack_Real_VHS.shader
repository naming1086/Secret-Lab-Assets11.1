//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Real_VHS" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
VHS ("Base (RGB)", 2D) = "white" { }
VHS2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 46386
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
uniform 	vec4 _Time;
uniform 	float TRACKING;
uniform 	float CONTRAST;
uniform 	float JITTER;
uniform 	float GLITCH;
uniform 	float NOISE;
uniform 	float Brightness;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D VHS;
UNITY_LOCATION(2) uniform  sampler2D VHS2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
vec2 u_xlat8;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0 = _Time.xxxx * vec4(12.0, 64.0, 48.0, 20.0);
    u_xlat21 = dot(u_xlat0.ww, vec2(12.9898005, 78.2330017));
    u_xlat21 = u_xlat21 * 0.318471313;
    u_xlatb1.x = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(abs(u_xlat21));
    u_xlat21 = (u_xlatb1.x) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat21 * 3.1400001;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 * 43758.5469;
    u_xlat21 = fract(u_xlat21);
    u_xlat1.x = u_xlat21 * 15.0 + 0.0599999987;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = (-u_xlat1.x) + u_xlat8.y;
    u_xlat1.x = u_xlat1.x * 33.3333282;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat22 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat22;
    u_xlat21 = (-u_xlat21) * 15.0 + u_xlat8.y;
    u_xlat21 = u_xlat21 * 33.3333359;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat22 * u_xlat21 + (-u_xlat1.x);
    u_xlat2.xyz = u_xlat8.yyy * vec3(512.0, 512.0, 150.0) + u_xlat0.xyz;
    u_xlat2.xyz = sin(u_xlat2.xyz);
    u_xlat0.x = u_xlat8.y + -0.0500000007;
    u_xlat14.x = u_xlat0.x * u_xlat2.x + u_xlat8.x;
    u_xlatb1.xw = lessThan(u_xlat8.yyyy, vec4(0.0250000004, 0.0, 0.0, 0.0149999997)).xw;
    u_xlat14.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.y + u_xlat14.x;
    u_xlat0.x = (u_xlatb1.w) ? u_xlat0.x : u_xlat14.x;
    u_xlat14.x = u_xlat2.z * 0.015625;
    u_xlat0.x = u_xlat21 * u_xlat14.x + u_xlat0.x;
    u_xlat14.x = (-u_xlat0.x) + 1.0;
    u_xlat2.zw = _Time.xx * vec2(0.0130000003, 0.400000006);
    u_xlat21 = u_xlat8.y * 288.0;
    u_xlat21 = floor(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * vec2(0.00347222225, 0.00145833334);
    u_xlat21 = dot(u_xlat2.wx, vec2(12.9898005, 78.2330017));
    u_xlat1.x = dot(u_xlat2.zy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = u_xlat1.x * 0.318471313;
    u_xlat21 = u_xlat21 * 0.318471313;
    u_xlatb22 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(abs(u_xlat21));
    u_xlat21 = (u_xlatb22) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat21 * 3.1400001;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 * 43758.5469;
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 * 0.00499999989;
    u_xlatb22 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb22) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 3.1400001;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat21 = u_xlat1.x * 0.00400000019 + u_xlat21;
    u_xlat0.x = u_xlat21 * u_xlat14.x + u_xlat0.x;
    u_xlat2.xy = (-u_xlat8.xy);
    u_xlat3.x = u_xlat0.x + u_xlat2.x;
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    u_xlat3 = vec4(vec4(JITTER, JITTER, JITTER, JITTER)) * u_xlat3 + u_xlat8.xyyy;
    u_xlat4 = u_xlat3 * vec4(52.0, 288.0, 288.0, 288.0);
    u_xlat3 = texture(_MainTex, u_xlat3.xw);
    u_xlat0.xzw = max(u_xlat3.xyz, vec3(0.0799999982, 0.0799999982, 0.0799999982));
    u_xlat0.xzw = min(u_xlat0.xzw, vec3(0.949999988, 0.949999988, 0.949999988));
    u_xlat0.x = dot(u_xlat0.xzw, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat3 = floor(u_xlat4);
    u_xlat7.x = u_xlat3.z * 0.0833333358 + u_xlat0.y;
    u_xlat7.x = sin(u_xlat7.x);
    u_xlat4 = _Time.xxxx * vec4(128.0, 16.0, 30.0, 3.75);
    u_xlat14.x = u_xlat3.w * 0.0486111119 + u_xlat4.y;
    u_xlat1.xw = u_xlat3.xy * vec2(0.0192307699, 0.00347222225);
    u_xlat7.y = sin(u_xlat14.x);
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.y + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5 + 0.5;
    u_xlat3.y = 0.0078125;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat3.x = u_xlat4.x * 0.0078125;
    u_xlat5.y = u_xlat3.x * u_xlat5.x;
    u_xlat5.x = u_xlat4.x * 0.0078125 + -0.00999999978;
    u_xlat14.xy = u_xlat5.xy * u_xlat3.xy + u_xlat1.xw;
    u_xlat3 = texture(_MainTex, u_xlat14.xy);
    u_xlat14.x = u_xlat3.y * 0.289000005;
    u_xlat14.x = u_xlat3.x * -0.147 + (-u_xlat14.x);
    u_xlat5.yw = u_xlat3.zz * vec2(0.43599999, 0.43599999) + u_xlat14.xx;
    u_xlat14.x = u_xlat3.y * 0.514999986;
    u_xlat14.x = u_xlat3.x * 0.61500001 + (-u_xlat14.x);
    u_xlat5.xz = (-u_xlat3.zz) * vec2(0.100000001, 0.100000001) + u_xlat14.xx;
    u_xlat14.x = CONTRAST + 1.0;
    u_xlat3 = u_xlat5 / u_xlat14.xxxx;
    u_xlat3 = u_xlat7.xxxx * u_xlat3;
    u_xlat7.x = (-u_xlat3.y) * 0.395000011 + u_xlat0.x;
    u_xlat5.xz = u_xlat3.xw * vec2(1.13999999, 2.03200006) + u_xlat0.xx;
    u_xlat5.y = (-u_xlat3.z) * 0.58099997 + u_xlat7.x;
    u_xlat0.xyz = max(u_xlat5.xyz, vec3(0.0799999982, 0.0799999982, 0.0799999982));
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(0.949999988, 0.949999988, 0.949999988));
    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(1.04999995, 1.04999995, 1.04999995) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlatb1.xw = greaterThanEqual(u_xlat4.zzzw, (-u_xlat4.zzzw)).xw;
    u_xlat4.xy = fract(abs(u_xlat4.zw));
    u_xlat1.x = (u_xlatb1.x) ? u_xlat4.x : (-u_xlat4.x);
    u_xlat1.w = (u_xlatb1.w) ? u_xlat4.y : (-u_xlat4.y);
    u_xlat1.xw = u_xlat1.xw * vec2(8.0, 8.0);
    u_xlat1.xw = floor(u_xlat1.xw);
    u_xlat21 = u_xlat1.x * 0.125;
    u_xlat1.x = (-u_xlat1.w) * 0.125 + 1.0;
    u_xlat4.x = u_xlat8.x * 0.125 + u_xlat21;
    u_xlat4.y = u_xlat8.y * 0.125 + u_xlat1.x;
    u_xlat4.z = u_xlat8.y * -1.125 + u_xlat1.x;
    u_xlat5 = texture(VHS, u_xlat4.xy);
    u_xlat5.xyz = u_xlat5.xyz + vec3(vec3(Brightness, Brightness, Brightness));
    u_xlat5.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(NOISE) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlatb0.xyz = lessThan(u_xlat0.xyzx, vec4(0.476190507, 0.476190507, 0.476190507, 0.0)).xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0999999, 2.0999999, 2.0999999);
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat5.x : u_xlat3.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat5.y : u_xlat3.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat5.z : u_xlat3.z;
    u_xlat2.z = 1.0;
    u_xlat1.xw = u_xlat2.xz + u_xlat4.xz;
    u_xlat21 = u_xlat2.y + 1.0;
    u_xlat21 = u_xlat21 * TRACKING;
    u_xlat1.xy = vec2(vec2(GLITCH, GLITCH)) * u_xlat1.xw + u_xlat8.xy;
    u_xlat1 = texture(VHS2, u_xlat1.xy);
    SV_Target0.xyz = vec3(u_xlat21) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 928
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %83 %914 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 83 
                                                      OpDecorate %412 DescriptorSet 412 
                                                      OpDecorate %412 Binding 412 
                                                      OpDecorate %416 DescriptorSet 416 
                                                      OpDecorate %416 Binding 416 
                                                      OpDecorate %751 DescriptorSet 751 
                                                      OpDecorate %751 Binding 751 
                                                      OpDecorate %753 DescriptorSet 753 
                                                      OpDecorate %753 Binding 753 
                                                      OpDecorate %902 DescriptorSet 902 
                                                      OpDecorate %902 Binding 902 
                                                      OpDecorate %904 DescriptorSet 904 
                                                      OpDecorate %904 Binding 904 
                                                      OpDecorate %914 Location 914 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %6 %6 %6 %6 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Uniform %7 
                                          f32 %19 = OpConstant 3.674022E-40 
                                          f32 %20 = OpConstant 3.674022E-40 
                                          f32 %21 = OpConstant 3.674022E-40 
                                          f32 %22 = OpConstant 3.674022E-40 
                                        f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
                                              %25 = OpTypePointer Private %6 
                                 Private f32* %26 = OpVariable Private 
                                              %27 = OpTypeVector %6 2 
                                          f32 %30 = OpConstant 3.674022E-40 
                                          f32 %31 = OpConstant 3.674022E-40 
                                        f32_2 %32 = OpConstantComposite %30 %31 
                                          f32 %35 = OpConstant 3.674022E-40 
                                              %37 = OpTypeBool 
                                              %38 = OpTypeVector %37 4 
                                              %39 = OpTypePointer Private %38 
                              Private bool_4* %40 = OpVariable Private 
                                              %45 = OpTypeInt 32 0 
                                          u32 %46 = OpConstant 0 
                                              %47 = OpTypePointer Private %37 
                                              %54 = OpTypePointer Function %6 
                                          f32 %64 = OpConstant 3.674022E-40 
                                          f32 %69 = OpConstant 3.674022E-40 
                               Private f32_4* %73 = OpVariable Private 
                                          f32 %75 = OpConstant 3.674022E-40 
                                          f32 %77 = OpConstant 3.674022E-40 
                                              %80 = OpTypePointer Private %27 
                               Private f32_2* %81 = OpVariable Private 
                                              %82 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %85 = OpConstant 7 
                                          u32 %97 = OpConstant 1 
                                         f32 %104 = OpConstant 3.674022E-40 
                                         f32 %109 = OpConstant 3.674022E-40 
                                         f32 %110 = OpConstant 3.674022E-40 
                                Private f32* %113 = OpVariable Private 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %138 = OpConstant 3.674022E-40 
                              Private f32_4* %155 = OpVariable Private 
                                             %156 = OpTypeVector %6 3 
                                         f32 %159 = OpConstant 3.674022E-40 
                                         f32 %160 = OpConstant 3.674022E-40 
                                       f32_3 %161 = OpConstantComposite %159 %159 %160 
                                         f32 %175 = OpConstant 3.674022E-40 
                              Private f32_2* %178 = OpVariable Private 
                                         f32 %190 = OpConstant 3.674022E-40 
                                         f32 %191 = OpConstant 3.674022E-40 
                                       f32_4 %192 = OpConstantComposite %190 %109 %109 %191 
                                             %194 = OpTypeVector %37 2 
                                         u32 %219 = OpConstant 3 
                                         u32 %232 = OpConstant 2 
                                         f32 %235 = OpConstant 3.674022E-40 
                                         f32 %254 = OpConstant 3.674022E-40 
                                         f32 %255 = OpConstant 3.674022E-40 
                                       f32_2 %256 = OpConstantComposite %254 %255 
                                         f32 %262 = OpConstant 3.674022E-40 
                                         f32 %268 = OpConstant 3.674022E-40 
                                         f32 %269 = OpConstant 3.674022E-40 
                                       f32_2 %270 = OpConstantComposite %268 %269 
                               Private bool* %287 = OpVariable Private 
                                         f32 %315 = OpConstant 3.674022E-40 
                                         f32 %358 = OpConstant 3.674022E-40 
                              Private f32_4* %374 = OpVariable Private 
                                         i32 %384 = OpConstant 3 
                                             %385 = OpTypePointer Uniform %6 
                              Private f32_4* %405 = OpVariable Private 
                                         f32 %407 = OpConstant 3.674022E-40 
                                       f32_4 %408 = OpConstantComposite %407 %262 %262 %262 
                                             %410 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %411 = OpTypePointer UniformConstant %410 
        UniformConstant read_only Texture2D* %412 = OpVariable UniformConstant 
                                             %414 = OpTypeSampler 
                                             %415 = OpTypePointer UniformConstant %414 
                    UniformConstant sampler* %416 = OpVariable UniformConstant 
                                             %418 = OpTypeSampledImage %410 
                                         f32 %428 = OpConstant 3.674022E-40 
                                       f32_3 %429 = OpConstantComposite %428 %428 %428 
                                         f32 %435 = OpConstant 3.674022E-40 
                                       f32_3 %436 = OpConstantComposite %435 %435 %435 
                                         f32 %442 = OpConstant 3.674022E-40 
                                         f32 %443 = OpConstant 3.674022E-40 
                                         f32 %444 = OpConstant 3.674022E-40 
                                       f32_3 %445 = OpConstantComposite %442 %443 %444 
                              Private f32_2* %450 = OpVariable Private 
                                         f32 %453 = OpConstant 3.674022E-40 
                                         f32 %466 = OpConstant 3.674022E-40 
                                         f32 %467 = OpConstant 3.674022E-40 
                                         f32 %468 = OpConstant 3.674022E-40 
                                         f32 %469 = OpConstant 3.674022E-40 
                                       f32_4 %470 = OpConstantComposite %466 %467 %468 %469 
                                         f32 %474 = OpConstant 3.674022E-40 
                                         f32 %482 = OpConstant 3.674022E-40 
                                       f32_2 %483 = OpConstantComposite %482 %268 
                                       f32_2 %492 = OpConstantComposite %109 %109 
                                         f32 %502 = OpConstant 3.674022E-40 
                                         f32 %506 = OpConstant 3.674022E-40 
                              Private f32_4* %508 = OpVariable Private 
                                         f32 %530 = OpConstant 3.674022E-40 
                                         f32 %551 = OpConstant 3.674022E-40 
                                         f32 %556 = OpConstant 3.674022E-40 
                                         f32 %565 = OpConstant 3.674022E-40 
                                       f32_2 %566 = OpConstantComposite %565 %565 
                                         f32 %575 = OpConstant 3.674022E-40 
                                         f32 %580 = OpConstant 3.674022E-40 
                                         f32 %590 = OpConstant 3.674022E-40 
                                       f32_2 %591 = OpConstantComposite %590 %590 
                                         i32 %598 = OpConstant 2 
                                         f32 %614 = OpConstant 3.674022E-40 
                                         f32 %622 = OpConstant 3.674022E-40 
                                         f32 %623 = OpConstant 3.674022E-40 
                                       f32_2 %624 = OpConstantComposite %622 %623 
                                         f32 %634 = OpConstant 3.674022E-40 
                                         f32 %653 = OpConstant 3.674022E-40 
                                       f32_3 %654 = OpConstantComposite %653 %653 %653 
                                       f32_3 %656 = OpConstantComposite %110 %110 %110 
                                         f32 %710 = OpConstant 3.674022E-40 
                                       f32_2 %711 = OpConstantComposite %710 %710 
                                         f32 %722 = OpConstant 3.674022E-40 
                                         f32 %745 = OpConstant 3.674022E-40 
        UniformConstant read_only Texture2D* %751 = OpVariable UniformConstant 
                    UniformConstant sampler* %753 = OpVariable UniformConstant 
                                         i32 %764 = OpConstant 6 
                                         f32 %781 = OpConstant 3.674022E-40 
                                       f32_3 %782 = OpConstantComposite %781 %781 %781 
                                         i32 %786 = OpConstant 5 
                                       f32_3 %793 = OpConstantComposite %502 %502 %502 
                                             %797 = OpTypePointer Private %156 
                              Private f32_3* %798 = OpVariable Private 
                                             %810 = OpTypeVector %37 3 
                                             %811 = OpTypePointer Private %810 
                             Private bool_3* %812 = OpVariable Private 
                                         f32 %815 = OpConstant 3.674022E-40 
                                       f32_4 %816 = OpConstantComposite %815 %815 %815 %109 
                                         f32 %821 = OpConstant 3.674022E-40 
                                       f32_3 %822 = OpConstantComposite %821 %821 %821 
                                         i32 %882 = OpConstant 1 
                                         i32 %886 = OpConstant 4 
        UniformConstant read_only Texture2D* %902 = OpVariable UniformConstant 
                    UniformConstant sampler* %904 = OpVariable UniformConstant 
                                             %913 = OpTypePointer Output %7 
                               Output f32_4* %914 = OpVariable Output 
                                             %925 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %55 = OpVariable Function 
                               Function f32* %200 = OpVariable Function 
                               Function f32* %222 = OpVariable Function 
                               Function f32* %296 = OpVariable Function 
                               Function f32* %329 = OpVariable Function 
                               Function f32* %684 = OpVariable Function 
                               Function f32* %697 = OpVariable Function 
                               Function f32* %836 = OpVariable Function 
                               Function f32* %848 = OpVariable Function 
                               Function f32* %860 = OpVariable Function 
                               Uniform f32_4* %16 = OpAccessChain %12 %14 
                                        f32_4 %17 = OpLoad %16 
                                        f32_4 %18 = OpVectorShuffle %17 %17 0 0 0 0 
                                        f32_4 %24 = OpFMul %18 %23 
                                                      OpStore %9 %24 
                                        f32_4 %28 = OpLoad %9 
                                        f32_2 %29 = OpVectorShuffle %28 %28 3 3 
                                          f32 %33 = OpDot %29 %32 
                                                      OpStore %26 %33 
                                          f32 %34 = OpLoad %26 
                                          f32 %36 = OpFMul %34 %35 
                                                      OpStore %26 %36 
                                          f32 %41 = OpLoad %26 
                                          f32 %42 = OpLoad %26 
                                          f32 %43 = OpFNegate %42 
                                         bool %44 = OpFOrdGreaterThanEqual %41 %43 
                                Private bool* %48 = OpAccessChain %40 %46 
                                                      OpStore %48 %44 
                                          f32 %49 = OpLoad %26 
                                          f32 %50 = OpExtInst %1 4 %49 
                                          f32 %51 = OpExtInst %1 10 %50 
                                                      OpStore %26 %51 
                                Private bool* %52 = OpAccessChain %40 %46 
                                         bool %53 = OpLoad %52 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %53 %56 %59 
                                              %56 = OpLabel 
                                          f32 %58 = OpLoad %26 
                                                      OpStore %55 %58 
                                                      OpBranch %57 
                                              %59 = OpLabel 
                                          f32 %60 = OpLoad %26 
                                          f32 %61 = OpFNegate %60 
                                                      OpStore %55 %61 
                                                      OpBranch %57 
                                              %57 = OpLabel 
                                          f32 %62 = OpLoad %55 
                                                      OpStore %26 %62 
                                          f32 %63 = OpLoad %26 
                                          f32 %65 = OpFMul %63 %64 
                                                      OpStore %26 %65 
                                          f32 %66 = OpLoad %26 
                                          f32 %67 = OpExtInst %1 13 %66 
                                                      OpStore %26 %67 
                                          f32 %68 = OpLoad %26 
                                          f32 %70 = OpFMul %68 %69 
                                                      OpStore %26 %70 
                                          f32 %71 = OpLoad %26 
                                          f32 %72 = OpExtInst %1 10 %71 
                                                      OpStore %26 %72 
                                          f32 %74 = OpLoad %26 
                                          f32 %76 = OpFMul %74 %75 
                                          f32 %78 = OpFAdd %76 %77 
                                 Private f32* %79 = OpAccessChain %73 %46 
                                                      OpStore %79 %78 
                                        f32_2 %84 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %86 = OpAccessChain %12 %85 
                                        f32_4 %87 = OpLoad %86 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_2 %89 = OpFMul %84 %88 
                               Uniform f32_4* %90 = OpAccessChain %12 %85 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 2 3 
                                        f32_2 %93 = OpFAdd %89 %92 
                                                      OpStore %81 %93 
                                 Private f32* %94 = OpAccessChain %73 %46 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFNegate %95 
                                 Private f32* %98 = OpAccessChain %81 %97 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFAdd %96 %99 
                                Private f32* %101 = OpAccessChain %73 %46 
                                                      OpStore %101 %100 
                                Private f32* %102 = OpAccessChain %73 %46 
                                         f32 %103 = OpLoad %102 
                                         f32 %105 = OpFMul %103 %104 
                                Private f32* %106 = OpAccessChain %73 %46 
                                                      OpStore %106 %105 
                                Private f32* %107 = OpAccessChain %73 %46 
                                         f32 %108 = OpLoad %107 
                                         f32 %111 = OpExtInst %1 43 %108 %109 %110 
                                Private f32* %112 = OpAccessChain %73 %46 
                                                      OpStore %112 %111 
                                Private f32* %114 = OpAccessChain %73 %46 
                                         f32 %115 = OpLoad %114 
                                         f32 %117 = OpFMul %115 %116 
                                         f32 %119 = OpFAdd %117 %118 
                                                      OpStore %113 %119 
                                Private f32* %120 = OpAccessChain %73 %46 
                                         f32 %121 = OpLoad %120 
                                Private f32* %122 = OpAccessChain %73 %46 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %73 %46 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %73 %46 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpLoad %113 
                                         f32 %129 = OpFMul %127 %128 
                                Private f32* %130 = OpAccessChain %73 %46 
                                                      OpStore %130 %129 
                                         f32 %131 = OpLoad %26 
                                         f32 %132 = OpFNegate %131 
                                         f32 %133 = OpFMul %132 %75 
                                Private f32* %134 = OpAccessChain %81 %97 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFAdd %133 %135 
                                                      OpStore %26 %136 
                                         f32 %137 = OpLoad %26 
                                         f32 %139 = OpFMul %137 %138 
                                                      OpStore %26 %139 
                                         f32 %140 = OpLoad %26 
                                         f32 %141 = OpExtInst %1 43 %140 %109 %110 
                                                      OpStore %26 %141 
                                         f32 %142 = OpLoad %26 
                                         f32 %143 = OpFMul %142 %116 
                                         f32 %144 = OpFAdd %143 %118 
                                                      OpStore %113 %144 
                                         f32 %145 = OpLoad %26 
                                         f32 %146 = OpLoad %26 
                                         f32 %147 = OpFMul %145 %146 
                                                      OpStore %26 %147 
                                         f32 %148 = OpLoad %113 
                                         f32 %149 = OpLoad %26 
                                         f32 %150 = OpFMul %148 %149 
                                Private f32* %151 = OpAccessChain %73 %46 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                         f32 %154 = OpFAdd %150 %153 
                                                      OpStore %26 %154 
                                       f32_2 %157 = OpLoad %81 
                                       f32_3 %158 = OpVectorShuffle %157 %157 1 1 1 
                                       f32_3 %162 = OpFMul %158 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %155 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %155 %167 
                                       f32_4 %168 = OpLoad %155 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpExtInst %1 13 %169 
                                       f32_4 %171 = OpLoad %155 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %155 %172 
                                Private f32* %173 = OpAccessChain %81 %97 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFAdd %174 %175 
                                Private f32* %177 = OpAccessChain %9 %46 
                                                      OpStore %177 %176 
                                Private f32* %179 = OpAccessChain %9 %46 
                                         f32 %180 = OpLoad %179 
                                Private f32* %181 = OpAccessChain %155 %46 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFMul %180 %182 
                                Private f32* %184 = OpAccessChain %81 %46 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFAdd %183 %185 
                                Private f32* %187 = OpAccessChain %178 %46 
                                                      OpStore %187 %186 
                                       f32_2 %188 = OpLoad %81 
                                       f32_4 %189 = OpVectorShuffle %188 %188 1 1 1 1 
                                      bool_4 %193 = OpFOrdLessThan %189 %192 
                                      bool_2 %195 = OpVectorShuffle %193 %193 0 3 
                                      bool_4 %196 = OpLoad %40 
                                      bool_4 %197 = OpVectorShuffle %196 %195 4 1 2 5 
                                                      OpStore %40 %197 
                               Private bool* %198 = OpAccessChain %40 %46 
                                        bool %199 = OpLoad %198 
                                                      OpSelectionMerge %202 None 
                                                      OpBranchConditional %199 %201 %205 
                                             %201 = OpLabel 
                                Private f32* %203 = OpAccessChain %178 %46 
                                         f32 %204 = OpLoad %203 
                                                      OpStore %200 %204 
                                                      OpBranch %202 
                                             %205 = OpLabel 
                                Private f32* %206 = OpAccessChain %81 %46 
                                         f32 %207 = OpLoad %206 
                                                      OpStore %200 %207 
                                                      OpBranch %202 
                                             %202 = OpLabel 
                                         f32 %208 = OpLoad %200 
                                Private f32* %209 = OpAccessChain %178 %46 
                                                      OpStore %209 %208 
                                Private f32* %210 = OpAccessChain %9 %46 
                                         f32 %211 = OpLoad %210 
                                Private f32* %212 = OpAccessChain %155 %97 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                Private f32* %215 = OpAccessChain %178 %46 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFAdd %214 %216 
                                Private f32* %218 = OpAccessChain %9 %46 
                                                      OpStore %218 %217 
                               Private bool* %220 = OpAccessChain %40 %219 
                                        bool %221 = OpLoad %220 
                                                      OpSelectionMerge %224 None 
                                                      OpBranchConditional %221 %223 %227 
                                             %223 = OpLabel 
                                Private f32* %225 = OpAccessChain %9 %46 
                                         f32 %226 = OpLoad %225 
                                                      OpStore %222 %226 
                                                      OpBranch %224 
                                             %227 = OpLabel 
                                Private f32* %228 = OpAccessChain %178 %46 
                                         f32 %229 = OpLoad %228 
                                                      OpStore %222 %229 
                                                      OpBranch %224 
                                             %224 = OpLabel 
                                         f32 %230 = OpLoad %222 
                                Private f32* %231 = OpAccessChain %9 %46 
                                                      OpStore %231 %230 
                                Private f32* %233 = OpAccessChain %155 %232 
                                         f32 %234 = OpLoad %233 
                                         f32 %236 = OpFMul %234 %235 
                                Private f32* %237 = OpAccessChain %178 %46 
                                                      OpStore %237 %236 
                                         f32 %238 = OpLoad %26 
                                Private f32* %239 = OpAccessChain %178 %46 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFMul %238 %240 
                                Private f32* %242 = OpAccessChain %9 %46 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFAdd %241 %243 
                                Private f32* %245 = OpAccessChain %9 %46 
                                                      OpStore %245 %244 
                                Private f32* %246 = OpAccessChain %9 %46 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFNegate %247 
                                         f32 %249 = OpFAdd %248 %110 
                                Private f32* %250 = OpAccessChain %178 %46 
                                                      OpStore %250 %249 
                              Uniform f32_4* %251 = OpAccessChain %12 %14 
                                       f32_4 %252 = OpLoad %251 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 0 
                                       f32_2 %257 = OpFMul %253 %256 
                                       f32_4 %258 = OpLoad %155 
                                       f32_4 %259 = OpVectorShuffle %258 %257 0 1 4 5 
                                                      OpStore %155 %259 
                                Private f32* %260 = OpAccessChain %81 %97 
                                         f32 %261 = OpLoad %260 
                                         f32 %263 = OpFMul %261 %262 
                                                      OpStore %26 %263 
                                         f32 %264 = OpLoad %26 
                                         f32 %265 = OpExtInst %1 8 %264 
                                                      OpStore %26 %265 
                                         f32 %266 = OpLoad %26 
                                       f32_2 %267 = OpCompositeConstruct %266 %266 
                                       f32_2 %271 = OpFMul %267 %270 
                                       f32_4 %272 = OpLoad %155 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                      OpStore %155 %273 
                                       f32_4 %274 = OpLoad %155 
                                       f32_2 %275 = OpVectorShuffle %274 %274 3 0 
                                         f32 %276 = OpDot %275 %32 
                                                      OpStore %26 %276 
                                       f32_4 %277 = OpLoad %155 
                                       f32_2 %278 = OpVectorShuffle %277 %277 2 1 
                                         f32 %279 = OpDot %278 %32 
                                Private f32* %280 = OpAccessChain %73 %46 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %73 %46 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFMul %282 %35 
                                Private f32* %284 = OpAccessChain %73 %46 
                                                      OpStore %284 %283 
                                         f32 %285 = OpLoad %26 
                                         f32 %286 = OpFMul %285 %35 
                                                      OpStore %26 %286 
                                         f32 %288 = OpLoad %26 
                                         f32 %289 = OpLoad %26 
                                         f32 %290 = OpFNegate %289 
                                        bool %291 = OpFOrdGreaterThanEqual %288 %290 
                                                      OpStore %287 %291 
                                         f32 %292 = OpLoad %26 
                                         f32 %293 = OpExtInst %1 4 %292 
                                         f32 %294 = OpExtInst %1 10 %293 
                                                      OpStore %26 %294 
                                        bool %295 = OpLoad %287 
                                                      OpSelectionMerge %298 None 
                                                      OpBranchConditional %295 %297 %300 
                                             %297 = OpLabel 
                                         f32 %299 = OpLoad %26 
                                                      OpStore %296 %299 
                                                      OpBranch %298 
                                             %300 = OpLabel 
                                         f32 %301 = OpLoad %26 
                                         f32 %302 = OpFNegate %301 
                                                      OpStore %296 %302 
                                                      OpBranch %298 
                                             %298 = OpLabel 
                                         f32 %303 = OpLoad %296 
                                                      OpStore %26 %303 
                                         f32 %304 = OpLoad %26 
                                         f32 %305 = OpFMul %304 %64 
                                                      OpStore %26 %305 
                                         f32 %306 = OpLoad %26 
                                         f32 %307 = OpExtInst %1 13 %306 
                                                      OpStore %26 %307 
                                         f32 %308 = OpLoad %26 
                                         f32 %309 = OpFMul %308 %69 
                                                      OpStore %26 %309 
                                         f32 %310 = OpLoad %26 
                                         f32 %311 = OpExtInst %1 10 %310 
                                                      OpStore %26 %311 
                                         f32 %312 = OpLoad %26 
                                         f32 %313 = OpExtInst %1 13 %312 
                                                      OpStore %26 %313 
                                         f32 %314 = OpLoad %26 
                                         f32 %316 = OpFMul %314 %315 
                                                      OpStore %26 %316 
                                Private f32* %317 = OpAccessChain %73 %46 
                                         f32 %318 = OpLoad %317 
                                Private f32* %319 = OpAccessChain %73 %46 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFNegate %320 
                                        bool %322 = OpFOrdGreaterThanEqual %318 %321 
                                                      OpStore %287 %322 
                                Private f32* %323 = OpAccessChain %73 %46 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpExtInst %1 4 %324 
                                         f32 %326 = OpExtInst %1 10 %325 
                                Private f32* %327 = OpAccessChain %73 %46 
                                                      OpStore %327 %326 
                                        bool %328 = OpLoad %287 
                                                      OpSelectionMerge %331 None 
                                                      OpBranchConditional %328 %330 %334 
                                             %330 = OpLabel 
                                Private f32* %332 = OpAccessChain %73 %46 
                                         f32 %333 = OpLoad %332 
                                                      OpStore %329 %333 
                                                      OpBranch %331 
                                             %334 = OpLabel 
                                Private f32* %335 = OpAccessChain %73 %46 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFNegate %336 
                                                      OpStore %329 %337 
                                                      OpBranch %331 
                                             %331 = OpLabel 
                                         f32 %338 = OpLoad %329 
                                Private f32* %339 = OpAccessChain %73 %46 
                                                      OpStore %339 %338 
                                Private f32* %340 = OpAccessChain %73 %46 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpFMul %341 %64 
                                Private f32* %343 = OpAccessChain %73 %46 
                                                      OpStore %343 %342 
                                Private f32* %344 = OpAccessChain %73 %46 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpExtInst %1 13 %345 
                                Private f32* %347 = OpAccessChain %73 %46 
                                                      OpStore %347 %346 
                                Private f32* %348 = OpAccessChain %73 %46 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFMul %349 %69 
                                Private f32* %351 = OpAccessChain %73 %46 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %73 %46 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpExtInst %1 10 %353 
                                Private f32* %355 = OpAccessChain %73 %46 
                                                      OpStore %355 %354 
                                Private f32* %356 = OpAccessChain %73 %46 
                                         f32 %357 = OpLoad %356 
                                         f32 %359 = OpFMul %357 %358 
                                         f32 %360 = OpLoad %26 
                                         f32 %361 = OpFAdd %359 %360 
                                                      OpStore %26 %361 
                                         f32 %362 = OpLoad %26 
                                Private f32* %363 = OpAccessChain %178 %46 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFMul %362 %364 
                                Private f32* %366 = OpAccessChain %9 %46 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                Private f32* %369 = OpAccessChain %9 %46 
                                                      OpStore %369 %368 
                                       f32_2 %370 = OpLoad %81 
                                       f32_2 %371 = OpFNegate %370 
                                       f32_4 %372 = OpLoad %155 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 2 3 
                                                      OpStore %155 %373 
                                Private f32* %375 = OpAccessChain %9 %46 
                                         f32 %376 = OpLoad %375 
                                Private f32* %377 = OpAccessChain %155 %46 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpFAdd %376 %378 
                                Private f32* %380 = OpAccessChain %374 %46 
                                                      OpStore %380 %379 
                                Private f32* %381 = OpAccessChain %374 %97 
                                                      OpStore %381 %109 
                                Private f32* %382 = OpAccessChain %374 %232 
                                                      OpStore %382 %109 
                                Private f32* %383 = OpAccessChain %374 %219 
                                                      OpStore %383 %109 
                                Uniform f32* %386 = OpAccessChain %12 %384 
                                         f32 %387 = OpLoad %386 
                                Uniform f32* %388 = OpAccessChain %12 %384 
                                         f32 %389 = OpLoad %388 
                                Uniform f32* %390 = OpAccessChain %12 %384 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %12 %384 
                                         f32 %393 = OpLoad %392 
                                       f32_4 %394 = OpCompositeConstruct %387 %389 %391 %393 
                                         f32 %395 = OpCompositeExtract %394 0 
                                         f32 %396 = OpCompositeExtract %394 1 
                                         f32 %397 = OpCompositeExtract %394 2 
                                         f32 %398 = OpCompositeExtract %394 3 
                                       f32_4 %399 = OpCompositeConstruct %395 %396 %397 %398 
                                       f32_4 %400 = OpLoad %374 
                                       f32_4 %401 = OpFMul %399 %400 
                                       f32_2 %402 = OpLoad %81 
                                       f32_4 %403 = OpVectorShuffle %402 %402 0 1 1 1 
                                       f32_4 %404 = OpFAdd %401 %403 
                                                      OpStore %374 %404 
                                       f32_4 %406 = OpLoad %374 
                                       f32_4 %409 = OpFMul %406 %408 
                                                      OpStore %405 %409 
                         read_only Texture2D %413 = OpLoad %412 
                                     sampler %417 = OpLoad %416 
                  read_only Texture2DSampled %419 = OpSampledImage %413 %417 
                                       f32_4 %420 = OpLoad %374 
                                       f32_2 %421 = OpVectorShuffle %420 %420 0 3 
                                       f32_4 %422 = OpImageSampleImplicitLod %419 %421 
                                       f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
                                       f32_4 %424 = OpLoad %9 
                                       f32_4 %425 = OpVectorShuffle %424 %423 4 1 5 6 
                                                      OpStore %9 %425 
                                       f32_4 %426 = OpLoad %9 
                                       f32_3 %427 = OpVectorShuffle %426 %426 0 2 3 
                                       f32_3 %430 = OpExtInst %1 40 %427 %429 
                                       f32_4 %431 = OpLoad %9 
                                       f32_4 %432 = OpVectorShuffle %431 %430 4 1 5 6 
                                                      OpStore %9 %432 
                                       f32_4 %433 = OpLoad %9 
                                       f32_3 %434 = OpVectorShuffle %433 %433 0 2 3 
                                       f32_3 %437 = OpExtInst %1 37 %434 %436 
                                       f32_4 %438 = OpLoad %9 
                                       f32_4 %439 = OpVectorShuffle %438 %437 4 1 5 6 
                                                      OpStore %9 %439 
                                       f32_4 %440 = OpLoad %9 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 2 3 
                                         f32 %446 = OpDot %441 %445 
                                Private f32* %447 = OpAccessChain %9 %46 
                                                      OpStore %447 %446 
                                       f32_4 %448 = OpLoad %405 
                                       f32_4 %449 = OpExtInst %1 8 %448 
                                                      OpStore %374 %449 
                                Private f32* %451 = OpAccessChain %374 %232 
                                         f32 %452 = OpLoad %451 
                                         f32 %454 = OpFMul %452 %453 
                                Private f32* %455 = OpAccessChain %9 %97 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFAdd %454 %456 
                                Private f32* %458 = OpAccessChain %450 %46 
                                                      OpStore %458 %457 
                                Private f32* %459 = OpAccessChain %450 %46 
                                         f32 %460 = OpLoad %459 
                                         f32 %461 = OpExtInst %1 13 %460 
                                Private f32* %462 = OpAccessChain %450 %46 
                                                      OpStore %462 %461 
                              Uniform f32_4* %463 = OpAccessChain %12 %14 
                                       f32_4 %464 = OpLoad %463 
                                       f32_4 %465 = OpVectorShuffle %464 %464 0 0 0 0 
                                       f32_4 %471 = OpFMul %465 %470 
                                                      OpStore %405 %471 
                                Private f32* %472 = OpAccessChain %374 %219 
                                         f32 %473 = OpLoad %472 
                                         f32 %475 = OpFMul %473 %474 
                                Private f32* %476 = OpAccessChain %405 %97 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFAdd %475 %477 
                                Private f32* %479 = OpAccessChain %178 %46 
                                                      OpStore %479 %478 
                                       f32_4 %480 = OpLoad %374 
                                       f32_2 %481 = OpVectorShuffle %480 %480 0 1 
                                       f32_2 %484 = OpFMul %481 %483 
                                       f32_4 %485 = OpLoad %73 
                                       f32_4 %486 = OpVectorShuffle %485 %484 4 1 2 5 
                                                      OpStore %73 %486 
                                Private f32* %487 = OpAccessChain %178 %46 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpExtInst %1 13 %488 
                                Private f32* %490 = OpAccessChain %450 %97 
                                                      OpStore %490 %489 
                                       f32_2 %491 = OpLoad %450 
                                       f32_2 %493 = OpExtInst %1 40 %491 %492 
                                                      OpStore %450 %493 
                                Private f32* %494 = OpAccessChain %450 %97 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %450 %46 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFAdd %495 %497 
                                Private f32* %499 = OpAccessChain %450 %46 
                                                      OpStore %499 %498 
                                Private f32* %500 = OpAccessChain %450 %46 
                                         f32 %501 = OpLoad %500 
                                         f32 %503 = OpFMul %501 %502 
                                         f32 %504 = OpFAdd %503 %502 
                                Private f32* %505 = OpAccessChain %450 %46 
                                                      OpStore %505 %504 
                                Private f32* %507 = OpAccessChain %374 %97 
                                                      OpStore %507 %506 
                                Private f32* %509 = OpAccessChain %405 %46 
                                         f32 %510 = OpLoad %509 
                                         f32 %511 = OpExtInst %1 14 %510 
                                Private f32* %512 = OpAccessChain %508 %46 
                                                      OpStore %512 %511 
                                Private f32* %513 = OpAccessChain %405 %46 
                                         f32 %514 = OpLoad %513 
                                         f32 %515 = OpExtInst %1 13 %514 
                                Private f32* %516 = OpAccessChain %405 %46 
                                                      OpStore %516 %515 
                                Private f32* %517 = OpAccessChain %405 %46 
                                         f32 %518 = OpLoad %517 
                                         f32 %519 = OpFMul %518 %506 
                                Private f32* %520 = OpAccessChain %374 %46 
                                                      OpStore %520 %519 
                                Private f32* %521 = OpAccessChain %374 %46 
                                         f32 %522 = OpLoad %521 
                                Private f32* %523 = OpAccessChain %508 %46 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpFMul %522 %524 
                                Private f32* %526 = OpAccessChain %508 %97 
                                                      OpStore %526 %525 
                                Private f32* %527 = OpAccessChain %405 %46 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFMul %528 %506 
                                         f32 %531 = OpFAdd %529 %530 
                                Private f32* %532 = OpAccessChain %508 %46 
                                                      OpStore %532 %531 
                                       f32_4 %533 = OpLoad %508 
                                       f32_2 %534 = OpVectorShuffle %533 %533 0 1 
                                       f32_4 %535 = OpLoad %374 
                                       f32_2 %536 = OpVectorShuffle %535 %535 0 1 
                                       f32_2 %537 = OpFMul %534 %536 
                                       f32_4 %538 = OpLoad %73 
                                       f32_2 %539 = OpVectorShuffle %538 %538 0 3 
                                       f32_2 %540 = OpFAdd %537 %539 
                                                      OpStore %178 %540 
                         read_only Texture2D %541 = OpLoad %412 
                                     sampler %542 = OpLoad %416 
                  read_only Texture2DSampled %543 = OpSampledImage %541 %542 
                                       f32_2 %544 = OpLoad %178 
                                       f32_4 %545 = OpImageSampleImplicitLod %543 %544 
                                       f32_3 %546 = OpVectorShuffle %545 %545 0 1 2 
                                       f32_4 %547 = OpLoad %374 
                                       f32_4 %548 = OpVectorShuffle %547 %546 4 5 6 3 
                                                      OpStore %374 %548 
                                Private f32* %549 = OpAccessChain %374 %97 
                                         f32 %550 = OpLoad %549 
                                         f32 %552 = OpFMul %550 %551 
                                Private f32* %553 = OpAccessChain %178 %46 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %374 %46 
                                         f32 %555 = OpLoad %554 
                                         f32 %557 = OpFMul %555 %556 
                                Private f32* %558 = OpAccessChain %178 %46 
                                         f32 %559 = OpLoad %558 
                                         f32 %560 = OpFNegate %559 
                                         f32 %561 = OpFAdd %557 %560 
                                Private f32* %562 = OpAccessChain %178 %46 
                                                      OpStore %562 %561 
                                       f32_4 %563 = OpLoad %374 
                                       f32_2 %564 = OpVectorShuffle %563 %563 2 2 
                                       f32_2 %567 = OpFMul %564 %566 
                                       f32_2 %568 = OpLoad %178 
                                       f32_2 %569 = OpVectorShuffle %568 %568 0 0 
                                       f32_2 %570 = OpFAdd %567 %569 
                                       f32_4 %571 = OpLoad %508 
                                       f32_4 %572 = OpVectorShuffle %571 %570 0 4 2 5 
                                                      OpStore %508 %572 
                                Private f32* %573 = OpAccessChain %374 %97 
                                         f32 %574 = OpLoad %573 
                                         f32 %576 = OpFMul %574 %575 
                                Private f32* %577 = OpAccessChain %178 %46 
                                                      OpStore %577 %576 
                                Private f32* %578 = OpAccessChain %374 %46 
                                         f32 %579 = OpLoad %578 
                                         f32 %581 = OpFMul %579 %580 
                                Private f32* %582 = OpAccessChain %178 %46 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpFNegate %583 
                                         f32 %585 = OpFAdd %581 %584 
                                Private f32* %586 = OpAccessChain %178 %46 
                                                      OpStore %586 %585 
                                       f32_4 %587 = OpLoad %374 
                                       f32_2 %588 = OpVectorShuffle %587 %587 2 2 
                                       f32_2 %589 = OpFNegate %588 
                                       f32_2 %592 = OpFMul %589 %591 
                                       f32_2 %593 = OpLoad %178 
                                       f32_2 %594 = OpVectorShuffle %593 %593 0 0 
                                       f32_2 %595 = OpFAdd %592 %594 
                                       f32_4 %596 = OpLoad %508 
                                       f32_4 %597 = OpVectorShuffle %596 %595 4 1 5 3 
                                                      OpStore %508 %597 
                                Uniform f32* %599 = OpAccessChain %12 %598 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpFAdd %600 %110 
                                Private f32* %602 = OpAccessChain %178 %46 
                                                      OpStore %602 %601 
                                       f32_4 %603 = OpLoad %508 
                                       f32_2 %604 = OpLoad %178 
                                       f32_4 %605 = OpVectorShuffle %604 %604 0 0 0 0 
                                       f32_4 %606 = OpFDiv %603 %605 
                                                      OpStore %374 %606 
                                       f32_2 %607 = OpLoad %450 
                                       f32_4 %608 = OpVectorShuffle %607 %607 0 0 0 0 
                                       f32_4 %609 = OpLoad %374 
                                       f32_4 %610 = OpFMul %608 %609 
                                                      OpStore %374 %610 
                                Private f32* %611 = OpAccessChain %374 %97 
                                         f32 %612 = OpLoad %611 
                                         f32 %613 = OpFNegate %612 
                                         f32 %615 = OpFMul %613 %614 
                                Private f32* %616 = OpAccessChain %9 %46 
                                         f32 %617 = OpLoad %616 
                                         f32 %618 = OpFAdd %615 %617 
                                Private f32* %619 = OpAccessChain %450 %46 
                                                      OpStore %619 %618 
                                       f32_4 %620 = OpLoad %374 
                                       f32_2 %621 = OpVectorShuffle %620 %620 0 3 
                                       f32_2 %625 = OpFMul %621 %624 
                                       f32_4 %626 = OpLoad %9 
                                       f32_2 %627 = OpVectorShuffle %626 %626 0 0 
                                       f32_2 %628 = OpFAdd %625 %627 
                                       f32_4 %629 = OpLoad %508 
                                       f32_4 %630 = OpVectorShuffle %629 %628 4 1 5 3 
                                                      OpStore %508 %630 
                                Private f32* %631 = OpAccessChain %374 %232 
                                         f32 %632 = OpLoad %631 
                                         f32 %633 = OpFNegate %632 
                                         f32 %635 = OpFMul %633 %634 
                                Private f32* %636 = OpAccessChain %450 %46 
                                         f32 %637 = OpLoad %636 
                                         f32 %638 = OpFAdd %635 %637 
                                Private f32* %639 = OpAccessChain %508 %97 
                                                      OpStore %639 %638 
                                       f32_4 %640 = OpLoad %508 
                                       f32_3 %641 = OpVectorShuffle %640 %640 0 1 2 
                                       f32_3 %642 = OpExtInst %1 40 %641 %429 
                                       f32_4 %643 = OpLoad %9 
                                       f32_4 %644 = OpVectorShuffle %643 %642 4 5 6 3 
                                                      OpStore %9 %644 
                                       f32_4 %645 = OpLoad %9 
                                       f32_3 %646 = OpVectorShuffle %645 %645 0 1 2 
                                       f32_3 %647 = OpExtInst %1 37 %646 %436 
                                       f32_4 %648 = OpLoad %9 
                                       f32_4 %649 = OpVectorShuffle %648 %647 4 5 6 3 
                                                      OpStore %9 %649 
                                       f32_4 %650 = OpLoad %9 
                                       f32_3 %651 = OpVectorShuffle %650 %650 0 1 2 
                                       f32_3 %652 = OpFNegate %651 
                                       f32_3 %655 = OpFMul %652 %654 
                                       f32_3 %657 = OpFAdd %655 %656 
                                       f32_4 %658 = OpLoad %374 
                                       f32_4 %659 = OpVectorShuffle %658 %657 4 5 6 3 
                                                      OpStore %374 %659 
                                       f32_4 %660 = OpLoad %374 
                                       f32_3 %661 = OpVectorShuffle %660 %660 0 1 2 
                                       f32_4 %662 = OpLoad %374 
                                       f32_3 %663 = OpVectorShuffle %662 %662 0 1 2 
                                       f32_3 %664 = OpFAdd %661 %663 
                                       f32_4 %665 = OpLoad %374 
                                       f32_4 %666 = OpVectorShuffle %665 %664 4 5 6 3 
                                                      OpStore %374 %666 
                                       f32_4 %667 = OpLoad %405 
                                       f32_4 %668 = OpVectorShuffle %667 %667 2 2 2 3 
                                       f32_4 %669 = OpLoad %405 
                                       f32_4 %670 = OpVectorShuffle %669 %669 2 2 2 3 
                                       f32_4 %671 = OpFNegate %670 
                                      bool_4 %672 = OpFOrdGreaterThanEqual %668 %671 
                                      bool_2 %673 = OpVectorShuffle %672 %672 0 3 
                                      bool_4 %674 = OpLoad %40 
                                      bool_4 %675 = OpVectorShuffle %674 %673 4 1 2 5 
                                                      OpStore %40 %675 
                                       f32_4 %676 = OpLoad %405 
                                       f32_2 %677 = OpVectorShuffle %676 %676 2 3 
                                       f32_2 %678 = OpExtInst %1 4 %677 
                                       f32_2 %679 = OpExtInst %1 10 %678 
                                       f32_4 %680 = OpLoad %405 
                                       f32_4 %681 = OpVectorShuffle %680 %679 4 5 2 3 
                                                      OpStore %405 %681 
                               Private bool* %682 = OpAccessChain %40 %46 
                                        bool %683 = OpLoad %682 
                                                      OpSelectionMerge %686 None 
                                                      OpBranchConditional %683 %685 %689 
                                             %685 = OpLabel 
                                Private f32* %687 = OpAccessChain %405 %46 
                                         f32 %688 = OpLoad %687 
                                                      OpStore %684 %688 
                                                      OpBranch %686 
                                             %689 = OpLabel 
                                Private f32* %690 = OpAccessChain %405 %46 
                                         f32 %691 = OpLoad %690 
                                         f32 %692 = OpFNegate %691 
                                                      OpStore %684 %692 
                                                      OpBranch %686 
                                             %686 = OpLabel 
                                         f32 %693 = OpLoad %684 
                                Private f32* %694 = OpAccessChain %73 %46 
                                                      OpStore %694 %693 
                               Private bool* %695 = OpAccessChain %40 %219 
                                        bool %696 = OpLoad %695 
                                                      OpSelectionMerge %699 None 
                                                      OpBranchConditional %696 %698 %702 
                                             %698 = OpLabel 
                                Private f32* %700 = OpAccessChain %405 %97 
                                         f32 %701 = OpLoad %700 
                                                      OpStore %697 %701 
                                                      OpBranch %699 
                                             %702 = OpLabel 
                                Private f32* %703 = OpAccessChain %405 %97 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFNegate %704 
                                                      OpStore %697 %705 
                                                      OpBranch %699 
                                             %699 = OpLabel 
                                         f32 %706 = OpLoad %697 
                                Private f32* %707 = OpAccessChain %73 %219 
                                                      OpStore %707 %706 
                                       f32_4 %708 = OpLoad %73 
                                       f32_2 %709 = OpVectorShuffle %708 %708 0 3 
                                       f32_2 %712 = OpFMul %709 %711 
                                       f32_4 %713 = OpLoad %73 
                                       f32_4 %714 = OpVectorShuffle %713 %712 4 1 2 5 
                                                      OpStore %73 %714 
                                       f32_4 %715 = OpLoad %73 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 3 
                                       f32_2 %717 = OpExtInst %1 8 %716 
                                       f32_4 %718 = OpLoad %73 
                                       f32_4 %719 = OpVectorShuffle %718 %717 4 1 2 5 
                                                      OpStore %73 %719 
                                Private f32* %720 = OpAccessChain %73 %46 
                                         f32 %721 = OpLoad %720 
                                         f32 %723 = OpFMul %721 %722 
                                                      OpStore %26 %723 
                                Private f32* %724 = OpAccessChain %73 %219 
                                         f32 %725 = OpLoad %724 
                                         f32 %726 = OpFNegate %725 
                                         f32 %727 = OpFMul %726 %722 
                                         f32 %728 = OpFAdd %727 %110 
                                Private f32* %729 = OpAccessChain %73 %46 
                                                      OpStore %729 %728 
                                Private f32* %730 = OpAccessChain %81 %46 
                                         f32 %731 = OpLoad %730 
                                         f32 %732 = OpFMul %731 %722 
                                         f32 %733 = OpLoad %26 
                                         f32 %734 = OpFAdd %732 %733 
                                Private f32* %735 = OpAccessChain %405 %46 
                                                      OpStore %735 %734 
                                Private f32* %736 = OpAccessChain %81 %97 
                                         f32 %737 = OpLoad %736 
                                         f32 %738 = OpFMul %737 %722 
                                Private f32* %739 = OpAccessChain %73 %46 
                                         f32 %740 = OpLoad %739 
                                         f32 %741 = OpFAdd %738 %740 
                                Private f32* %742 = OpAccessChain %405 %97 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %81 %97 
                                         f32 %744 = OpLoad %743 
                                         f32 %746 = OpFMul %744 %745 
                                Private f32* %747 = OpAccessChain %73 %46 
                                         f32 %748 = OpLoad %747 
                                         f32 %749 = OpFAdd %746 %748 
                                Private f32* %750 = OpAccessChain %405 %232 
                                                      OpStore %750 %749 
                         read_only Texture2D %752 = OpLoad %751 
                                     sampler %754 = OpLoad %753 
                  read_only Texture2DSampled %755 = OpSampledImage %752 %754 
                                       f32_4 %756 = OpLoad %405 
                                       f32_2 %757 = OpVectorShuffle %756 %756 0 1 
                                       f32_4 %758 = OpImageSampleImplicitLod %755 %757 
                                       f32_3 %759 = OpVectorShuffle %758 %758 0 1 2 
                                       f32_4 %760 = OpLoad %508 
                                       f32_4 %761 = OpVectorShuffle %760 %759 4 5 6 3 
                                                      OpStore %508 %761 
                                       f32_4 %762 = OpLoad %508 
                                       f32_3 %763 = OpVectorShuffle %762 %762 0 1 2 
                                Uniform f32* %765 = OpAccessChain %12 %764 
                                         f32 %766 = OpLoad %765 
                                Uniform f32* %767 = OpAccessChain %12 %764 
                                         f32 %768 = OpLoad %767 
                                Uniform f32* %769 = OpAccessChain %12 %764 
                                         f32 %770 = OpLoad %769 
                                       f32_3 %771 = OpCompositeConstruct %766 %768 %770 
                                         f32 %772 = OpCompositeExtract %771 0 
                                         f32 %773 = OpCompositeExtract %771 1 
                                         f32 %774 = OpCompositeExtract %771 2 
                                       f32_3 %775 = OpCompositeConstruct %772 %773 %774 
                                       f32_3 %776 = OpFAdd %763 %775 
                                       f32_4 %777 = OpLoad %508 
                                       f32_4 %778 = OpVectorShuffle %777 %776 4 5 6 3 
                                                      OpStore %508 %778 
                                       f32_4 %779 = OpLoad %508 
                                       f32_3 %780 = OpVectorShuffle %779 %779 0 1 2 
                                       f32_3 %783 = OpFAdd %780 %782 
                                       f32_4 %784 = OpLoad %508 
                                       f32_4 %785 = OpVectorShuffle %784 %783 4 5 6 3 
                                                      OpStore %508 %785 
                                Uniform f32* %787 = OpAccessChain %12 %786 
                                         f32 %788 = OpLoad %787 
                                       f32_3 %789 = OpCompositeConstruct %788 %788 %788 
                                       f32_4 %790 = OpLoad %508 
                                       f32_3 %791 = OpVectorShuffle %790 %790 0 1 2 
                                       f32_3 %792 = OpFMul %789 %791 
                                       f32_3 %794 = OpFAdd %792 %793 
                                       f32_4 %795 = OpLoad %508 
                                       f32_4 %796 = OpVectorShuffle %795 %794 4 5 6 3 
                                                      OpStore %508 %796 
                                       f32_4 %799 = OpLoad %508 
                                       f32_3 %800 = OpVectorShuffle %799 %799 0 1 2 
                                       f32_3 %801 = OpFNegate %800 
                                       f32_3 %802 = OpFAdd %801 %656 
                                                      OpStore %798 %802 
                                       f32_4 %803 = OpLoad %9 
                                       f32_3 %804 = OpVectorShuffle %803 %803 0 1 2 
                                       f32_4 %805 = OpLoad %508 
                                       f32_3 %806 = OpVectorShuffle %805 %805 0 1 2 
                                       f32_3 %807 = OpFMul %804 %806 
                                       f32_4 %808 = OpLoad %508 
                                       f32_4 %809 = OpVectorShuffle %808 %807 4 5 6 3 
                                                      OpStore %508 %809 
                                       f32_4 %813 = OpLoad %9 
                                       f32_4 %814 = OpVectorShuffle %813 %813 0 1 2 0 
                                      bool_4 %817 = OpFOrdLessThan %814 %816 
                                      bool_3 %818 = OpVectorShuffle %817 %817 0 1 2 
                                                      OpStore %812 %818 
                                       f32_4 %819 = OpLoad %508 
                                       f32_3 %820 = OpVectorShuffle %819 %819 0 1 2 
                                       f32_3 %823 = OpFMul %820 %822 
                                       f32_4 %824 = OpLoad %508 
                                       f32_4 %825 = OpVectorShuffle %824 %823 4 5 6 3 
                                                      OpStore %508 %825 
                                       f32_4 %826 = OpLoad %374 
                                       f32_3 %827 = OpVectorShuffle %826 %826 0 1 2 
                                       f32_3 %828 = OpFNegate %827 
                                       f32_3 %829 = OpLoad %798 
                                       f32_3 %830 = OpFMul %828 %829 
                                       f32_3 %831 = OpFAdd %830 %656 
                                       f32_4 %832 = OpLoad %374 
                                       f32_4 %833 = OpVectorShuffle %832 %831 4 5 6 3 
                                                      OpStore %374 %833 
                               Private bool* %834 = OpAccessChain %812 %46 
                                        bool %835 = OpLoad %834 
                                                      OpSelectionMerge %838 None 
                                                      OpBranchConditional %835 %837 %841 
                                             %837 = OpLabel 
                                Private f32* %839 = OpAccessChain %508 %46 
                                         f32 %840 = OpLoad %839 
                                                      OpStore %836 %840 
                                                      OpBranch %838 
                                             %841 = OpLabel 
                                Private f32* %842 = OpAccessChain %374 %46 
                                         f32 %843 = OpLoad %842 
                                                      OpStore %836 %843 
                                                      OpBranch %838 
                                             %838 = OpLabel 
                                         f32 %844 = OpLoad %836 
                                Private f32* %845 = OpAccessChain %9 %46 
                                                      OpStore %845 %844 
                               Private bool* %846 = OpAccessChain %812 %97 
                                        bool %847 = OpLoad %846 
                                                      OpSelectionMerge %850 None 
                                                      OpBranchConditional %847 %849 %853 
                                             %849 = OpLabel 
                                Private f32* %851 = OpAccessChain %508 %97 
                                         f32 %852 = OpLoad %851 
                                                      OpStore %848 %852 
                                                      OpBranch %850 
                                             %853 = OpLabel 
                                Private f32* %854 = OpAccessChain %374 %97 
                                         f32 %855 = OpLoad %854 
                                                      OpStore %848 %855 
                                                      OpBranch %850 
                                             %850 = OpLabel 
                                         f32 %856 = OpLoad %848 
                                Private f32* %857 = OpAccessChain %9 %97 
                                                      OpStore %857 %856 
                               Private bool* %858 = OpAccessChain %812 %232 
                                        bool %859 = OpLoad %858 
                                                      OpSelectionMerge %862 None 
                                                      OpBranchConditional %859 %861 %865 
                                             %861 = OpLabel 
                                Private f32* %863 = OpAccessChain %508 %232 
                                         f32 %864 = OpLoad %863 
                                                      OpStore %860 %864 
                                                      OpBranch %862 
                                             %865 = OpLabel 
                                Private f32* %866 = OpAccessChain %374 %232 
                                         f32 %867 = OpLoad %866 
                                                      OpStore %860 %867 
                                                      OpBranch %862 
                                             %862 = OpLabel 
                                         f32 %868 = OpLoad %860 
                                Private f32* %869 = OpAccessChain %9 %232 
                                                      OpStore %869 %868 
                                Private f32* %870 = OpAccessChain %155 %232 
                                                      OpStore %870 %110 
                                       f32_4 %871 = OpLoad %155 
                                       f32_2 %872 = OpVectorShuffle %871 %871 0 2 
                                       f32_4 %873 = OpLoad %405 
                                       f32_2 %874 = OpVectorShuffle %873 %873 0 2 
                                       f32_2 %875 = OpFAdd %872 %874 
                                       f32_4 %876 = OpLoad %73 
                                       f32_4 %877 = OpVectorShuffle %876 %875 4 1 2 5 
                                                      OpStore %73 %877 
                                Private f32* %878 = OpAccessChain %155 %97 
                                         f32 %879 = OpLoad %878 
                                         f32 %880 = OpFAdd %879 %110 
                                                      OpStore %26 %880 
                                         f32 %881 = OpLoad %26 
                                Uniform f32* %883 = OpAccessChain %12 %882 
                                         f32 %884 = OpLoad %883 
                                         f32 %885 = OpFMul %881 %884 
                                                      OpStore %26 %885 
                                Uniform f32* %887 = OpAccessChain %12 %886 
                                         f32 %888 = OpLoad %887 
                                Uniform f32* %889 = OpAccessChain %12 %886 
                                         f32 %890 = OpLoad %889 
                                       f32_2 %891 = OpCompositeConstruct %888 %890 
                                         f32 %892 = OpCompositeExtract %891 0 
                                         f32 %893 = OpCompositeExtract %891 1 
                                       f32_2 %894 = OpCompositeConstruct %892 %893 
                                       f32_4 %895 = OpLoad %73 
                                       f32_2 %896 = OpVectorShuffle %895 %895 0 3 
                                       f32_2 %897 = OpFMul %894 %896 
                                       f32_2 %898 = OpLoad %81 
                                       f32_2 %899 = OpFAdd %897 %898 
                                       f32_4 %900 = OpLoad %73 
                                       f32_4 %901 = OpVectorShuffle %900 %899 4 5 2 3 
                                                      OpStore %73 %901 
                         read_only Texture2D %903 = OpLoad %902 
                                     sampler %905 = OpLoad %904 
                  read_only Texture2DSampled %906 = OpSampledImage %903 %905 
                                       f32_4 %907 = OpLoad %73 
                                       f32_2 %908 = OpVectorShuffle %907 %907 0 1 
                                       f32_4 %909 = OpImageSampleImplicitLod %906 %908 
                                       f32_3 %910 = OpVectorShuffle %909 %909 0 1 2 
                                       f32_4 %911 = OpLoad %73 
                                       f32_4 %912 = OpVectorShuffle %911 %910 4 5 6 3 
                                                      OpStore %73 %912 
                                         f32 %915 = OpLoad %26 
                                       f32_3 %916 = OpCompositeConstruct %915 %915 %915 
                                       f32_4 %917 = OpLoad %73 
                                       f32_3 %918 = OpVectorShuffle %917 %917 0 1 2 
                                       f32_3 %919 = OpFMul %916 %918 
                                       f32_4 %920 = OpLoad %9 
                                       f32_3 %921 = OpVectorShuffle %920 %920 0 1 2 
                                       f32_3 %922 = OpFAdd %919 %921 
                                       f32_4 %923 = OpLoad %914 
                                       f32_4 %924 = OpVectorShuffle %923 %922 4 5 6 3 
                                                      OpStore %914 %924 
                                 Output f32* %926 = OpAccessChain %914 %219 
                                                      OpStore %926 %110 
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