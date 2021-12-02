//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_Old_Movie_2" {
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
  GpuProgramID 30011
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Fade;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
vec2 u_xlat7;
vec2 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat12;
vec2 u_xlat13;
int u_xlati13;
bvec2 u_xlatb13;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.x = _Value * _TimeX;
    u_xlat1.x = trunc(u_xlat12.x);
    u_xlat1.y = 1.0;
    u_xlat12.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat12.x = sin(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 43758.5469;
    u_xlat2.x = fract(u_xlat12.x);
    u_xlat1.zw = u_xlat1.xx + vec2(23.0, 8.0);
    u_xlat12.x = dot(u_xlat1.zy, vec2(12.9898005, 78.2330017));
    u_xlat12.x = sin(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 43758.5469;
    u_xlat2.y = fract(u_xlat12.x);
    u_xlat12.xy = u_xlat2.xy * vec2(0.00200000009, 0.00200000009) + u_xlat0.xy;
    u_xlat2 = texture(_MainTex, u_xlat12.xy);
    u_xlat2.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat2.xyz);
    u_xlat2.y = _Value2;
    u_xlat3.xyz = vec3(_Value3, _Value3, _Value2) * vec3(1.0, 0.5, 1.0) + vec3(0.699999988, 0.699999988, 0.0);
    u_xlat3.xyz = u_xlat2.xxy * u_xlat3.xyz;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
    u_xlat2.zw = vec2(vec2(_Value3, _Value3)) * vec2(1.0, 0.125) + vec2(0.699999988, 0.699999988);
    u_xlat2.xyz = u_xlat2.zwx * u_xlat3.xyz;
    u_xlat3.x = _Value2;
    u_xlat3.z = 0.48999998;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxz;
    u_xlat12.x = dot(u_xlat1.wy, vec2(12.9898005, 78.2330017));
    u_xlat12.x = sin(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 43758.5469;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat13.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat18 = u_xlat0.x * u_xlat13.x;
    u_xlat18 = u_xlat0.y * u_xlat18;
    u_xlat18 = u_xlat13.y * u_xlat18;
    u_xlat18 = u_xlat18 * 16.0;
    u_xlat13.x = u_xlat12.x + 0.5;
    u_xlat13.x = u_xlat13.x * 0.300000012 + 0.699999988;
    u_xlat3.xy = u_xlat12.xx * vec2(0.400000006, 8.0);
    u_xlat13.x = u_xlat18 * u_xlat13.x + u_xlat3.x;
    u_xlat13.x = u_xlat13.x + 1.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * 0.400000006;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat13.x;
    u_xlati13 = int(u_xlat3.y);
    u_xlatb13.xy = lessThan(ivec4(0, 1, 0, 1), ivec4(u_xlati13)).xy;
    u_xlat3 = u_xlat1.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
    u_xlat20 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat3.y = fract(u_xlat20);
    u_xlat20 = u_xlat3.y + -0.5;
    u_xlatb4 = 0.200000003<u_xlat3.y;
    u_xlat10.xy = u_xlat0.yx * u_xlat3.yy;
    u_xlat10.x = u_xlat10.x * 0.00999999978 + u_xlat10.y;
    u_xlat20 = u_xlat20 + u_xlat10.x;
    u_xlat20 = log2(abs(u_xlat20));
    u_xlat20 = u_xlat20 * 0.125;
    u_xlat20 = exp2(u_xlat20);
    u_xlat10.x = (-u_xlat20) + 2.0;
    u_xlat20 = (u_xlatb4) ? u_xlat20 : u_xlat10.x;
    u_xlat4.xy = (-vec2(_Value4, _Fade)) + vec2(0.5, 1.0);
    u_xlat16 = (-u_xlat4.x) + 1.0;
    u_xlat20 = u_xlat20 * u_xlat16 + u_xlat4.x;
    u_xlat20 = u_xlat18 * u_xlat20;
    u_xlat18 = (u_xlatb13.x) ? u_xlat20 : u_xlat18;
    u_xlat13.x = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat13.x = u_xlat13.x * 43758.5469;
    u_xlat13.x = fract(u_xlat13.x);
    u_xlat20 = u_xlat13.x + -0.5;
    u_xlatb15 = 0.200000003<u_xlat13.x;
    u_xlat5.xy = u_xlat0.yx * u_xlat13.xx;
    u_xlat13.x = u_xlat5.x * 0.00999999978 + u_xlat5.y;
    u_xlat13.x = u_xlat20 + u_xlat13.x;
    u_xlat13.x = log2(abs(u_xlat13.x));
    u_xlat13.x = u_xlat13.x * 0.125;
    u_xlat13.x = exp2(u_xlat13.x);
    u_xlat20 = (-u_xlat13.x) + 2.0;
    u_xlat13.x = (u_xlatb15) ? u_xlat13.x : u_xlat20;
    u_xlat13.x = u_xlat13.x * u_xlat16 + u_xlat4.x;
    u_xlat13.x = u_xlat18 * u_xlat13.x;
    u_xlat18 = (u_xlatb13.y) ? u_xlat13.x : u_xlat18;
    u_xlat13.xy = u_xlat1.xy + vec2(18.0, 0.0);
    u_xlat13.x = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat13.x = u_xlat13.x * 43758.5469;
    u_xlat13.x = fract(u_xlat13.x);
    u_xlat13.x = u_xlat13.x * 8.0 + -2.0;
    u_xlat13.x = max(u_xlat13.x, 0.0);
    u_xlati13 = int(u_xlat13.x);
    u_xlatb13.xy = lessThan(ivec4(0, 1, 0, 1), ivec4(u_xlati13)).xy;
    if(u_xlatb13.x){
        u_xlat15.xy = u_xlat1.xy + vec2(6.0, 0.0);
        u_xlat13.x = dot(u_xlat15.xy, vec2(12.9898005, 78.2330017));
        u_xlat13.x = sin(u_xlat13.x);
        u_xlat13.x = u_xlat13.x * 43758.5469;
        u_xlat3.x = fract(u_xlat13.x);
        u_xlat13.x = u_xlat12.x * 0.00999999978;
        u_xlat9.xy = (-u_xlat0.xy) + u_xlat3.xy;
        u_xlat20 = u_xlat9.y / u_xlat9.x;
        u_xlat21 = min(abs(u_xlat20), 1.0);
        u_xlat4.x = max(abs(u_xlat20), 1.0);
        u_xlat4.x = float(1.0) / u_xlat4.x;
        u_xlat21 = u_xlat21 * u_xlat4.x;
        u_xlat4.x = u_xlat21 * u_xlat21;
        u_xlat16 = u_xlat4.x * 0.0208350997 + -0.0851330012;
        u_xlat16 = u_xlat4.x * u_xlat16 + 0.180141002;
        u_xlat16 = u_xlat4.x * u_xlat16 + -0.330299497;
        u_xlat4.x = u_xlat4.x * u_xlat16 + 0.999866009;
        u_xlat16 = u_xlat21 * u_xlat4.x;
        u_xlatb22 = 1.0<abs(u_xlat20);
        u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
        u_xlat16 = u_xlatb22 ? u_xlat16 : float(0.0);
        u_xlat21 = u_xlat21 * u_xlat4.x + u_xlat16;
        u_xlat20 = min(u_xlat20, 1.0);
        u_xlatb20 = u_xlat20<(-u_xlat20);
        u_xlat20 = (u_xlatb20) ? (-u_xlat21) : u_xlat21;
        u_xlat13.x = u_xlat13.x * u_xlat13.x;
        u_xlat20 = u_xlat20 * u_xlat3.x;
        u_xlat20 = u_xlat20 * 6.28310013;
        u_xlat20 = sin(u_xlat20);
        u_xlat20 = u_xlat20 * 0.100000001 + 1.0;
        u_xlat3.x = u_xlat13.x * u_xlat20;
        u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
        u_xlatb3 = u_xlat9.x<u_xlat3.x;
        u_xlat13.x = (-u_xlat13.x) * u_xlat20 + u_xlat9.x;
        u_xlat13.x = log2(u_xlat13.x);
        u_xlat13.x = u_xlat13.x * 0.0625;
        u_xlat13.x = exp2(u_xlat13.x);
        u_xlat13.x = (u_xlatb3) ? 0.200000003 : u_xlat13.x;
        u_xlat12.x = (-u_xlat12.x) * 0.5 + 1.0;
        u_xlat12.x = u_xlat12.x * 0.200000003 + (-_Value4);
        u_xlat12.x = u_xlat12.x + 0.300000012;
        u_xlat20 = (-u_xlat12.x) + 1.0;
        u_xlat12.x = u_xlat13.x * u_xlat20 + u_xlat12.x;
        u_xlat18 = u_xlat12.x * u_xlat18;
    }
    if(u_xlatb13.y){
        u_xlat3 = u_xlat1.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
        u_xlat12.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
        u_xlat12.x = sin(u_xlat12.x);
        u_xlat12.x = u_xlat12.x * 43758.5469;
        u_xlat3.x = fract(u_xlat12.x);
        u_xlat12.x = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
        u_xlat12.x = sin(u_xlat12.x);
        u_xlat12.x = u_xlat12.x * 43758.5469;
        u_xlat3.y = fract(u_xlat12.x);
        u_xlat1.xy = u_xlat1.xy + vec2(27.0, 0.0);
        u_xlat12.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
        u_xlat12.x = sin(u_xlat12.x);
        u_xlat12.x = u_xlat12.x * 43758.5469;
        u_xlat12.x = fract(u_xlat12.x);
        u_xlat1.x = u_xlat12.x * 0.00999999978;
        u_xlat7.xy = (-u_xlat0.xy) + u_xlat3.xy;
        u_xlat19 = u_xlat7.y / u_xlat7.x;
        u_xlat20 = min(abs(u_xlat19), 1.0);
        u_xlat9.x = max(abs(u_xlat19), 1.0);
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat20 = u_xlat20 * u_xlat9.x;
        u_xlat9.x = u_xlat20 * u_xlat20;
        u_xlat15.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
        u_xlat15.x = u_xlat9.x * u_xlat15.x + 0.180141002;
        u_xlat15.x = u_xlat9.x * u_xlat15.x + -0.330299497;
        u_xlat9.x = u_xlat9.x * u_xlat15.x + 0.999866009;
        u_xlat15.x = u_xlat20 * u_xlat9.x;
        u_xlatb21 = 1.0<abs(u_xlat19);
        u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
        u_xlat15.x = u_xlatb21 ? u_xlat15.x : float(0.0);
        u_xlat20 = u_xlat20 * u_xlat9.x + u_xlat15.x;
        u_xlat19 = min(u_xlat19, 1.0);
        u_xlatb19 = u_xlat19<(-u_xlat19);
        u_xlat19 = (u_xlatb19) ? (-u_xlat20) : u_xlat20;
        u_xlat1.x = u_xlat1.x * u_xlat1.x;
        u_xlat19 = u_xlat19 * u_xlat3.x;
        u_xlat19 = u_xlat19 * 6.28310013;
        u_xlat19 = sin(u_xlat19);
        u_xlat19 = u_xlat19 * 0.100000001 + 1.0;
        u_xlat20 = u_xlat19 * u_xlat1.x;
        u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
        u_xlatb13.x = u_xlat7.x<u_xlat20;
        u_xlat1.x = (-u_xlat1.x) * u_xlat19 + u_xlat7.x;
        u_xlat1.x = log2(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * 0.0625;
        u_xlat1.x = exp2(u_xlat1.x);
        u_xlat1.x = (u_xlatb13.x) ? 0.200000003 : u_xlat1.x;
        u_xlat12.x = (-u_xlat12.x) * 0.5 + 1.0;
        u_xlat12.x = u_xlat12.x * 0.200000003 + (-_Value4);
        u_xlat12.x = u_xlat12.x + 0.300000012;
        u_xlat7.x = (-u_xlat12.x) + 1.0;
        u_xlat12.x = u_xlat1.x * u_xlat7.x + u_xlat12.x;
        u_xlat18 = u_xlat12.x * u_xlat18;
    }
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.w = 1.0;
    u_xlat0 = u_xlat0 + (-u_xlat1);
    SV_Target0 = u_xlat4.yyyy * u_xlat0 + u_xlat1;
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
; Bound: 1045
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %1037 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %107 DescriptorSet 107 
                                                      OpDecorate %107 Binding 107 
                                                      OpDecorate %111 DescriptorSet 111 
                                                      OpDecorate %111 Binding 111 
                                                      OpDecorate %1037 Location 1037 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 6 
                                              %19 = OpTypePointer Uniform %7 
                                              %30 = OpTypePointer Private %10 
                               Private f32_2* %31 = OpVariable Private 
                                          i32 %32 = OpConstant 1 
                                              %33 = OpTypePointer Uniform %6 
                                          i32 %36 = OpConstant 0 
                                              %40 = OpTypeInt 32 0 
                                          u32 %41 = OpConstant 0 
                                              %42 = OpTypePointer Private %6 
                               Private f32_4* %44 = OpVariable Private 
                                          f32 %49 = OpConstant 3.674022E-40 
                                          u32 %50 = OpConstant 1 
                                          f32 %54 = OpConstant 3.674022E-40 
                                          f32 %55 = OpConstant 3.674022E-40 
                                        f32_2 %56 = OpConstantComposite %54 %55 
                                          f32 %65 = OpConstant 3.674022E-40 
                               Private f32_4* %68 = OpVariable Private 
                                          f32 %75 = OpConstant 3.674022E-40 
                                          f32 %76 = OpConstant 3.674022E-40 
                                        f32_2 %77 = OpConstantComposite %75 %76 
                                          f32 %99 = OpConstant 3.674022E-40 
                                       f32_2 %100 = OpConstantComposite %99 %99 
                                             %105 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %106 = OpTypePointer UniformConstant %105 
        UniformConstant read_only Texture2D* %107 = OpVariable UniformConstant 
                                             %109 = OpTypeSampler 
                                             %110 = OpTypePointer UniformConstant %109 
                    UniformConstant sampler* %111 = OpVariable UniformConstant 
                                             %113 = OpTypeSampledImage %105 
                                             %117 = OpTypeVector %6 3 
                                         f32 %121 = OpConstant 3.674022E-40 
                                         f32 %122 = OpConstant 3.674022E-40 
                                         f32 %123 = OpConstant 3.674022E-40 
                                       f32_3 %124 = OpConstantComposite %121 %122 %123 
                                         i32 %129 = OpConstant 2 
                              Private f32_4* %133 = OpVariable Private 
                                         i32 %134 = OpConstant 3 
                                         f32 %142 = OpConstant 3.674022E-40 
                                       f32_3 %143 = OpConstantComposite %49 %142 %49 
                                         f32 %145 = OpConstant 3.674022E-40 
                                         f32 %146 = OpConstant 3.674022E-40 
                                       f32_3 %147 = OpConstantComposite %145 %145 %146 
                                         f32 %179 = OpConstant 3.674022E-40 
                                       f32_2 %180 = OpConstantComposite %49 %179 
                                       f32_2 %182 = OpConstantComposite %145 %145 
                                         f32 %196 = OpConstant 3.674022E-40 
                                         u32 %197 = OpConstant 2 
                              Private f32_2* %222 = OpVariable Private 
                                       f32_2 %226 = OpConstantComposite %49 %49 
                                Private f32* %228 = OpVariable Private 
                                         f32 %243 = OpConstant 3.674022E-40 
                                         f32 %251 = OpConstant 3.674022E-40 
                                         f32 %257 = OpConstant 3.674022E-40 
                                       f32_2 %258 = OpConstantComposite %257 %76 
                                             %284 = OpTypePointer Private %17 
                                Private i32* %285 = OpVariable Private 
                                             %289 = OpTypeBool 
                                             %290 = OpTypeVector %289 2 
                                             %291 = OpTypePointer Private %290 
                             Private bool_2* %292 = OpVariable Private 
                                             %293 = OpTypeVector %17 4 
                                       i32_4 %294 = OpConstantComposite %36 %32 %36 %32 
                                             %297 = OpTypeVector %289 4 
                                         f32 %302 = OpConstant 3.674022E-40 
                                         f32 %303 = OpConstant 3.674022E-40 
                                       f32_4 %304 = OpConstantComposite %302 %146 %303 %146 
                                Private f32* %306 = OpVariable Private 
                                         f32 %319 = OpConstant 3.674022E-40 
                                             %321 = OpTypePointer Private %289 
                               Private bool* %322 = OpVariable Private 
                                         f32 %323 = OpConstant 3.674022E-40 
                              Private f32_2* %327 = OpVariable Private 
                                         f32 %335 = OpConstant 3.674022E-40 
                                         f32 %354 = OpConstant 3.674022E-40 
                                             %358 = OpTypePointer Function %6 
                              Private f32_2* %367 = OpVariable Private 
                                         i32 %368 = OpConstant 4 
                                         i32 %371 = OpConstant 5 
                                       f32_2 %376 = OpConstantComposite %142 %49 
                                Private f32* %378 = OpVariable Private 
                               Private bool* %416 = OpVariable Private 
                              Private f32_2* %420 = OpVariable Private 
                                         f32 %490 = OpConstant 3.674022E-40 
                                       f32_2 %491 = OpConstantComposite %490 %146 
                                         f32 %511 = OpConstant 3.674022E-40 
                              Private f32_2* %529 = OpVariable Private 
                                         f32 %532 = OpConstant 3.674022E-40 
                                       f32_2 %533 = OpConstantComposite %532 %146 
                              Private f32_2* %554 = OpVariable Private 
                                Private f32* %566 = OpVariable Private 
                                         f32 %588 = OpConstant 3.674022E-40 
                                         f32 %590 = OpConstant 3.674022E-40 
                                         f32 %596 = OpConstant 3.674022E-40 
                                         f32 %602 = OpConstant 3.674022E-40 
                                         f32 %608 = OpConstant 3.674022E-40 
                               Private bool* %615 = OpVariable Private 
                                         f32 %621 = OpConstant 3.674022E-40 
                               Private bool* %634 = OpVariable Private 
                                         f32 %659 = OpConstant 3.674022E-40 
                                         f32 %664 = OpConstant 3.674022E-40 
                               Private bool* %676 = OpVariable Private 
                                         f32 %697 = OpConstant 3.674022E-40 
                                         f32 %753 = OpConstant 3.674022E-40 
                                         f32 %754 = OpConstant 3.674022E-40 
                                       f32_4 %755 = OpConstantComposite %753 %146 %754 %146 
                                         f32 %791 = OpConstant 3.674022E-40 
                                       f32_2 %792 = OpConstantComposite %791 %146 
                              Private f32_2* %816 = OpVariable Private 
                                Private f32* %823 = OpVariable Private 
                               Private bool* %879 = OpVariable Private 
                               Private bool* %906 = OpVariable Private 
                                        u32 %1030 = OpConstant 3 
                                            %1036 = OpTypePointer Output %7 
                              Output f32_4* %1037 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %359 = OpVariable Function 
                               Function f32* %456 = OpVariable Function 
                               Function f32* %480 = OpVariable Function 
                               Function f32* %640 = OpVariable Function 
                               Function f32* %705 = OpVariable Function 
                               Function f32* %889 = OpVariable Function 
                               Function f32* %912 = OpVariable Function 
                               Function f32* %973 = OpVariable Function 
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
                                 Uniform f32* %37 = OpAccessChain %16 %36 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %35 %38 
                                 Private f32* %43 = OpAccessChain %31 %41 
                                                      OpStore %43 %39 
                                 Private f32* %45 = OpAccessChain %31 %41 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpExtInst %1 3 %46 
                                 Private f32* %48 = OpAccessChain %44 %41 
                                                      OpStore %48 %47 
                                 Private f32* %51 = OpAccessChain %44 %50 
                                                      OpStore %51 %49 
                                        f32_4 %52 = OpLoad %44 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                          f32 %57 = OpDot %53 %56 
                                 Private f32* %58 = OpAccessChain %31 %41 
                                                      OpStore %58 %57 
                                 Private f32* %59 = OpAccessChain %31 %41 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 13 %60 
                                 Private f32* %62 = OpAccessChain %31 %41 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %31 %41 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFMul %64 %65 
                                 Private f32* %67 = OpAccessChain %31 %41 
                                                      OpStore %67 %66 
                                 Private f32* %69 = OpAccessChain %31 %41 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpExtInst %1 10 %70 
                                 Private f32* %72 = OpAccessChain %68 %41 
                                                      OpStore %72 %71 
                                        f32_4 %73 = OpLoad %44 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 0 
                                        f32_2 %78 = OpFAdd %74 %77 
                                        f32_4 %79 = OpLoad %44 
                                        f32_4 %80 = OpVectorShuffle %79 %78 0 1 4 5 
                                                      OpStore %44 %80 
                                        f32_4 %81 = OpLoad %44 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 1 
                                          f32 %83 = OpDot %82 %56 
                                 Private f32* %84 = OpAccessChain %31 %41 
                                                      OpStore %84 %83 
                                 Private f32* %85 = OpAccessChain %31 %41 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpExtInst %1 13 %86 
                                 Private f32* %88 = OpAccessChain %31 %41 
                                                      OpStore %88 %87 
                                 Private f32* %89 = OpAccessChain %31 %41 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %90 %65 
                                 Private f32* %92 = OpAccessChain %31 %41 
                                                      OpStore %92 %91 
                                 Private f32* %93 = OpAccessChain %31 %41 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpExtInst %1 10 %94 
                                 Private f32* %96 = OpAccessChain %68 %50 
                                                      OpStore %96 %95 
                                        f32_4 %97 = OpLoad %68 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %9 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                                      OpStore %31 %104 
                         read_only Texture2D %108 = OpLoad %107 
                                     sampler %112 = OpLoad %111 
                  read_only Texture2DSampled %114 = OpSampledImage %108 %112 
                                       f32_2 %115 = OpLoad %31 
                                       f32_4 %116 = OpImageSampleImplicitLod %114 %115 
                                       f32_3 %118 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %119 = OpLoad %68 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %68 %120 
                                       f32_4 %125 = OpLoad %68 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %124 %126 
                                Private f32* %128 = OpAccessChain %68 %41 
                                                      OpStore %128 %127 
                                Uniform f32* %130 = OpAccessChain %16 %129 
                                         f32 %131 = OpLoad %130 
                                Private f32* %132 = OpAccessChain %68 %50 
                                                      OpStore %132 %131 
                                Uniform f32* %135 = OpAccessChain %16 %134 
                                         f32 %136 = OpLoad %135 
                                Uniform f32* %137 = OpAccessChain %16 %134 
                                         f32 %138 = OpLoad %137 
                                Uniform f32* %139 = OpAccessChain %16 %129 
                                         f32 %140 = OpLoad %139 
                                       f32_3 %141 = OpCompositeConstruct %136 %138 %140 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_3 %148 = OpFAdd %144 %147 
                                       f32_4 %149 = OpLoad %133 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %133 %150 
                                       f32_4 %151 = OpLoad %68 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 0 1 
                                       f32_4 %153 = OpLoad %133 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %133 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %133 %157 
                                       f32_4 %158 = OpLoad %133 
                                       f32_2 %159 = OpVectorShuffle %158 %158 0 1 
                                Uniform f32* %160 = OpAccessChain %16 %129 
                                         f32 %161 = OpLoad %160 
                                Uniform f32* %162 = OpAccessChain %16 %129 
                                         f32 %163 = OpLoad %162 
                                       f32_2 %164 = OpCompositeConstruct %161 %163 
                                         f32 %165 = OpCompositeExtract %164 0 
                                         f32 %166 = OpCompositeExtract %164 1 
                                       f32_2 %167 = OpCompositeConstruct %165 %166 
                                       f32_2 %168 = OpFMul %159 %167 
                                       f32_4 %169 = OpLoad %133 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %133 %170 
                                Uniform f32* %171 = OpAccessChain %16 %134 
                                         f32 %172 = OpLoad %171 
                                Uniform f32* %173 = OpAccessChain %16 %134 
                                         f32 %174 = OpLoad %173 
                                       f32_2 %175 = OpCompositeConstruct %172 %174 
                                         f32 %176 = OpCompositeExtract %175 0 
                                         f32 %177 = OpCompositeExtract %175 1 
                                       f32_2 %178 = OpCompositeConstruct %176 %177 
                                       f32_2 %181 = OpFMul %178 %180 
                                       f32_2 %183 = OpFAdd %181 %182 
                                       f32_4 %184 = OpLoad %68 
                                       f32_4 %185 = OpVectorShuffle %184 %183 0 1 4 5 
                                                      OpStore %68 %185 
                                       f32_4 %186 = OpLoad %68 
                                       f32_3 %187 = OpVectorShuffle %186 %186 2 3 0 
                                       f32_4 %188 = OpLoad %133 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %68 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %68 %192 
                                Uniform f32* %193 = OpAccessChain %16 %129 
                                         f32 %194 = OpLoad %193 
                                Private f32* %195 = OpAccessChain %133 %41 
                                                      OpStore %195 %194 
                                Private f32* %198 = OpAccessChain %133 %197 
                                                      OpStore %198 %196 
                                       f32_4 %199 = OpLoad %68 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_4 %201 = OpLoad %133 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 0 2 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %68 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
                                                      OpStore %68 %205 
                                       f32_4 %206 = OpLoad %44 
                                       f32_2 %207 = OpVectorShuffle %206 %206 3 1 
                                         f32 %208 = OpDot %207 %56 
                                Private f32* %209 = OpAccessChain %31 %41 
                                                      OpStore %209 %208 
                                Private f32* %210 = OpAccessChain %31 %41 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpExtInst %1 13 %211 
                                Private f32* %213 = OpAccessChain %31 %41 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %31 %41 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFMul %215 %65 
                                Private f32* %217 = OpAccessChain %31 %41 
                                                      OpStore %217 %216 
                                Private f32* %218 = OpAccessChain %31 %41 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpExtInst %1 10 %219 
                                Private f32* %221 = OpAccessChain %31 %41 
                                                      OpStore %221 %220 
                                       f32_4 %223 = OpLoad %9 
                                       f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                                       f32_2 %225 = OpFNegate %224 
                                       f32_2 %227 = OpFAdd %225 %226 
                                                      OpStore %222 %227 
                                Private f32* %229 = OpAccessChain %9 %41 
                                         f32 %230 = OpLoad %229 
                                Private f32* %231 = OpAccessChain %222 %41 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFMul %230 %232 
                                                      OpStore %228 %233 
                                Private f32* %234 = OpAccessChain %9 %50 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpLoad %228 
                                         f32 %237 = OpFMul %235 %236 
                                                      OpStore %228 %237 
                                Private f32* %238 = OpAccessChain %222 %50 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpLoad %228 
                                         f32 %241 = OpFMul %239 %240 
                                                      OpStore %228 %241 
                                         f32 %242 = OpLoad %228 
                                         f32 %244 = OpFMul %242 %243 
                                                      OpStore %228 %244 
                                Private f32* %245 = OpAccessChain %31 %41 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFAdd %246 %142 
                                Private f32* %248 = OpAccessChain %222 %41 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %222 %41 
                                         f32 %250 = OpLoad %249 
                                         f32 %252 = OpFMul %250 %251 
                                         f32 %253 = OpFAdd %252 %145 
                                Private f32* %254 = OpAccessChain %222 %41 
                                                      OpStore %254 %253 
                                       f32_2 %255 = OpLoad %31 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 0 
                                       f32_2 %259 = OpFMul %256 %258 
                                       f32_4 %260 = OpLoad %133 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 2 3 
                                                      OpStore %133 %261 
                                         f32 %262 = OpLoad %228 
                                Private f32* %263 = OpAccessChain %222 %41 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFMul %262 %264 
                                Private f32* %266 = OpAccessChain %133 %41 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFAdd %265 %267 
                                Private f32* %269 = OpAccessChain %222 %41 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %222 %41 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFAdd %271 %49 
                                Private f32* %273 = OpAccessChain %222 %41 
                                                      OpStore %273 %272 
                                         f32 %274 = OpLoad %228 
                                         f32 %275 = OpExtInst %1 30 %274 
                                                      OpStore %228 %275 
                                         f32 %276 = OpLoad %228 
                                         f32 %277 = OpFMul %276 %257 
                                                      OpStore %228 %277 
                                         f32 %278 = OpLoad %228 
                                         f32 %279 = OpExtInst %1 29 %278 
                                                      OpStore %228 %279 
                                         f32 %280 = OpLoad %228 
                                Private f32* %281 = OpAccessChain %222 %41 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFMul %280 %282 
                                                      OpStore %228 %283 
                                Private f32* %286 = OpAccessChain %133 %50 
                                         f32 %287 = OpLoad %286 
                                         i32 %288 = OpConvertFToS %287 
                                                      OpStore %285 %288 
                                         i32 %295 = OpLoad %285 
                                       i32_4 %296 = OpCompositeConstruct %295 %295 %295 %295 
                                      bool_4 %298 = OpSLessThan %294 %296 
                                      bool_2 %299 = OpVectorShuffle %298 %298 0 1 
                                                      OpStore %292 %299 
                                       f32_4 %300 = OpLoad %44 
                                       f32_4 %301 = OpVectorShuffle %300 %300 0 1 0 1 
                                       f32_4 %305 = OpFAdd %301 %304 
                                                      OpStore %133 %305 
                                       f32_4 %307 = OpLoad %133 
                                       f32_2 %308 = OpVectorShuffle %307 %307 0 1 
                                         f32 %309 = OpDot %308 %56 
                                                      OpStore %306 %309 
                                         f32 %310 = OpLoad %306 
                                         f32 %311 = OpExtInst %1 13 %310 
                                                      OpStore %306 %311 
                                         f32 %312 = OpLoad %306 
                                         f32 %313 = OpFMul %312 %65 
                                                      OpStore %306 %313 
                                         f32 %314 = OpLoad %306 
                                         f32 %315 = OpExtInst %1 10 %314 
                                Private f32* %316 = OpAccessChain %133 %50 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %133 %50 
                                         f32 %318 = OpLoad %317 
                                         f32 %320 = OpFAdd %318 %319 
                                                      OpStore %306 %320 
                                Private f32* %324 = OpAccessChain %133 %50 
                                         f32 %325 = OpLoad %324 
                                        bool %326 = OpFOrdLessThan %323 %325 
                                                      OpStore %322 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_2 %329 = OpVectorShuffle %328 %328 1 0 
                                       f32_4 %330 = OpLoad %133 
                                       f32_2 %331 = OpVectorShuffle %330 %330 1 1 
                                       f32_2 %332 = OpFMul %329 %331 
                                                      OpStore %327 %332 
                                Private f32* %333 = OpAccessChain %327 %41 
                                         f32 %334 = OpLoad %333 
                                         f32 %336 = OpFMul %334 %335 
                                Private f32* %337 = OpAccessChain %327 %50 
                                         f32 %338 = OpLoad %337 
                                         f32 %339 = OpFAdd %336 %338 
                                Private f32* %340 = OpAccessChain %327 %41 
                                                      OpStore %340 %339 
                                         f32 %341 = OpLoad %306 
                                Private f32* %342 = OpAccessChain %327 %41 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %341 %343 
                                                      OpStore %306 %344 
                                         f32 %345 = OpLoad %306 
                                         f32 %346 = OpExtInst %1 4 %345 
                                         f32 %347 = OpExtInst %1 30 %346 
                                                      OpStore %306 %347 
                                         f32 %348 = OpLoad %306 
                                         f32 %349 = OpFMul %348 %179 
                                                      OpStore %306 %349 
                                         f32 %350 = OpLoad %306 
                                         f32 %351 = OpExtInst %1 29 %350 
                                                      OpStore %306 %351 
                                         f32 %352 = OpLoad %306 
                                         f32 %353 = OpFNegate %352 
                                         f32 %355 = OpFAdd %353 %354 
                                Private f32* %356 = OpAccessChain %327 %41 
                                                      OpStore %356 %355 
                                        bool %357 = OpLoad %322 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %357 %360 %363 
                                             %360 = OpLabel 
                                         f32 %362 = OpLoad %306 
                                                      OpStore %359 %362 
                                                      OpBranch %361 
                                             %363 = OpLabel 
                                Private f32* %364 = OpAccessChain %327 %41 
                                         f32 %365 = OpLoad %364 
                                                      OpStore %359 %365 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                         f32 %366 = OpLoad %359 
                                                      OpStore %306 %366 
                                Uniform f32* %369 = OpAccessChain %16 %368 
                                         f32 %370 = OpLoad %369 
                                Uniform f32* %372 = OpAccessChain %16 %371 
                                         f32 %373 = OpLoad %372 
                                       f32_2 %374 = OpCompositeConstruct %370 %373 
                                       f32_2 %375 = OpFNegate %374 
                                       f32_2 %377 = OpFAdd %375 %376 
                                                      OpStore %367 %377 
                                Private f32* %379 = OpAccessChain %367 %41 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFNegate %380 
                                         f32 %382 = OpFAdd %381 %49 
                                                      OpStore %378 %382 
                                         f32 %383 = OpLoad %306 
                                         f32 %384 = OpLoad %378 
                                         f32 %385 = OpFMul %383 %384 
                                Private f32* %386 = OpAccessChain %367 %41 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                                      OpStore %306 %388 
                                         f32 %389 = OpLoad %228 
                                         f32 %390 = OpLoad %306 
                                         f32 %391 = OpFMul %389 %390 
                                                      OpStore %306 %391 
                               Private bool* %392 = OpAccessChain %292 %41 
                                        bool %393 = OpLoad %392 
                                         f32 %394 = OpLoad %306 
                                         f32 %395 = OpLoad %228 
                                         f32 %396 = OpSelect %393 %394 %395 
                                                      OpStore %228 %396 
                                       f32_4 %397 = OpLoad %133 
                                       f32_2 %398 = OpVectorShuffle %397 %397 2 3 
                                         f32 %399 = OpDot %398 %56 
                                Private f32* %400 = OpAccessChain %222 %41 
                                                      OpStore %400 %399 
                                Private f32* %401 = OpAccessChain %222 %41 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpExtInst %1 13 %402 
                                Private f32* %404 = OpAccessChain %222 %41 
                                                      OpStore %404 %403 
                                Private f32* %405 = OpAccessChain %222 %41 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpFMul %406 %65 
                                Private f32* %408 = OpAccessChain %222 %41 
                                                      OpStore %408 %407 
                                Private f32* %409 = OpAccessChain %222 %41 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpExtInst %1 10 %410 
                                Private f32* %412 = OpAccessChain %222 %41 
                                                      OpStore %412 %411 
                                Private f32* %413 = OpAccessChain %222 %41 
                                         f32 %414 = OpLoad %413 
                                         f32 %415 = OpFAdd %414 %319 
                                                      OpStore %306 %415 
                                Private f32* %417 = OpAccessChain %222 %41 
                                         f32 %418 = OpLoad %417 
                                        bool %419 = OpFOrdLessThan %323 %418 
                                                      OpStore %416 %419 
                                       f32_4 %421 = OpLoad %9 
                                       f32_2 %422 = OpVectorShuffle %421 %421 1 0 
                                       f32_2 %423 = OpLoad %222 
                                       f32_2 %424 = OpVectorShuffle %423 %423 0 0 
                                       f32_2 %425 = OpFMul %422 %424 
                                                      OpStore %420 %425 
                                Private f32* %426 = OpAccessChain %420 %41 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFMul %427 %335 
                                Private f32* %429 = OpAccessChain %420 %50 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpFAdd %428 %430 
                                Private f32* %432 = OpAccessChain %222 %41 
                                                      OpStore %432 %431 
                                         f32 %433 = OpLoad %306 
                                Private f32* %434 = OpAccessChain %222 %41 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpFAdd %433 %435 
                                Private f32* %437 = OpAccessChain %222 %41 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %222 %41 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpExtInst %1 4 %439 
                                         f32 %441 = OpExtInst %1 30 %440 
                                Private f32* %442 = OpAccessChain %222 %41 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %222 %41 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpFMul %444 %179 
                                Private f32* %446 = OpAccessChain %222 %41 
                                                      OpStore %446 %445 
                                Private f32* %447 = OpAccessChain %222 %41 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpExtInst %1 29 %448 
                                Private f32* %450 = OpAccessChain %222 %41 
                                                      OpStore %450 %449 
                                Private f32* %451 = OpAccessChain %222 %41 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpFNegate %452 
                                         f32 %454 = OpFAdd %453 %354 
                                                      OpStore %306 %454 
                                        bool %455 = OpLoad %416 
                                                      OpSelectionMerge %458 None 
                                                      OpBranchConditional %455 %457 %461 
                                             %457 = OpLabel 
                                Private f32* %459 = OpAccessChain %222 %41 
                                         f32 %460 = OpLoad %459 
                                                      OpStore %456 %460 
                                                      OpBranch %458 
                                             %461 = OpLabel 
                                         f32 %462 = OpLoad %306 
                                                      OpStore %456 %462 
                                                      OpBranch %458 
                                             %458 = OpLabel 
                                         f32 %463 = OpLoad %456 
                                Private f32* %464 = OpAccessChain %222 %41 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %222 %41 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpLoad %378 
                                         f32 %468 = OpFMul %466 %467 
                                Private f32* %469 = OpAccessChain %367 %41 
                                         f32 %470 = OpLoad %469 
                                         f32 %471 = OpFAdd %468 %470 
                                Private f32* %472 = OpAccessChain %222 %41 
                                                      OpStore %472 %471 
                                         f32 %473 = OpLoad %228 
                                Private f32* %474 = OpAccessChain %222 %41 
                                         f32 %475 = OpLoad %474 
                                         f32 %476 = OpFMul %473 %475 
                                Private f32* %477 = OpAccessChain %222 %41 
                                                      OpStore %477 %476 
                               Private bool* %478 = OpAccessChain %292 %50 
                                        bool %479 = OpLoad %478 
                                                      OpSelectionMerge %482 None 
                                                      OpBranchConditional %479 %481 %485 
                                             %481 = OpLabel 
                                Private f32* %483 = OpAccessChain %222 %41 
                                         f32 %484 = OpLoad %483 
                                                      OpStore %480 %484 
                                                      OpBranch %482 
                                             %485 = OpLabel 
                                         f32 %486 = OpLoad %228 
                                                      OpStore %480 %486 
                                                      OpBranch %482 
                                             %482 = OpLabel 
                                         f32 %487 = OpLoad %480 
                                                      OpStore %228 %487 
                                       f32_4 %488 = OpLoad %44 
                                       f32_2 %489 = OpVectorShuffle %488 %488 0 1 
                                       f32_2 %492 = OpFAdd %489 %491 
                                                      OpStore %222 %492 
                                       f32_2 %493 = OpLoad %222 
                                         f32 %494 = OpDot %493 %56 
                                Private f32* %495 = OpAccessChain %222 %41 
                                                      OpStore %495 %494 
                                Private f32* %496 = OpAccessChain %222 %41 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpExtInst %1 13 %497 
                                Private f32* %499 = OpAccessChain %222 %41 
                                                      OpStore %499 %498 
                                Private f32* %500 = OpAccessChain %222 %41 
                                         f32 %501 = OpLoad %500 
                                         f32 %502 = OpFMul %501 %65 
                                Private f32* %503 = OpAccessChain %222 %41 
                                                      OpStore %503 %502 
                                Private f32* %504 = OpAccessChain %222 %41 
                                         f32 %505 = OpLoad %504 
                                         f32 %506 = OpExtInst %1 10 %505 
                                Private f32* %507 = OpAccessChain %222 %41 
                                                      OpStore %507 %506 
                                Private f32* %508 = OpAccessChain %222 %41 
                                         f32 %509 = OpLoad %508 
                                         f32 %510 = OpFMul %509 %76 
                                         f32 %512 = OpFAdd %510 %511 
                                Private f32* %513 = OpAccessChain %222 %41 
                                                      OpStore %513 %512 
                                Private f32* %514 = OpAccessChain %222 %41 
                                         f32 %515 = OpLoad %514 
                                         f32 %516 = OpExtInst %1 40 %515 %146 
                                Private f32* %517 = OpAccessChain %222 %41 
                                                      OpStore %517 %516 
                                Private f32* %518 = OpAccessChain %222 %41 
                                         f32 %519 = OpLoad %518 
                                         i32 %520 = OpConvertFToS %519 
                                                      OpStore %285 %520 
                                         i32 %521 = OpLoad %285 
                                       i32_4 %522 = OpCompositeConstruct %521 %521 %521 %521 
                                      bool_4 %523 = OpSLessThan %294 %522 
                                      bool_2 %524 = OpVectorShuffle %523 %523 0 1 
                                                      OpStore %292 %524 
                               Private bool* %525 = OpAccessChain %292 %41 
                                        bool %526 = OpLoad %525 
                                                      OpSelectionMerge %528 None 
                                                      OpBranchConditional %526 %527 %528 
                                             %527 = OpLabel 
                                       f32_4 %530 = OpLoad %44 
                                       f32_2 %531 = OpVectorShuffle %530 %530 0 1 
                                       f32_2 %534 = OpFAdd %531 %533 
                                                      OpStore %529 %534 
                                       f32_2 %535 = OpLoad %529 
                                         f32 %536 = OpDot %535 %56 
                                Private f32* %537 = OpAccessChain %222 %41 
                                                      OpStore %537 %536 
                                Private f32* %538 = OpAccessChain %222 %41 
                                         f32 %539 = OpLoad %538 
                                         f32 %540 = OpExtInst %1 13 %539 
                                Private f32* %541 = OpAccessChain %222 %41 
                                                      OpStore %541 %540 
                                Private f32* %542 = OpAccessChain %222 %41 
                                         f32 %543 = OpLoad %542 
                                         f32 %544 = OpFMul %543 %65 
                                Private f32* %545 = OpAccessChain %222 %41 
                                                      OpStore %545 %544 
                                Private f32* %546 = OpAccessChain %222 %41 
                                         f32 %547 = OpLoad %546 
                                         f32 %548 = OpExtInst %1 10 %547 
                                Private f32* %549 = OpAccessChain %133 %41 
                                                      OpStore %549 %548 
                                Private f32* %550 = OpAccessChain %31 %41 
                                         f32 %551 = OpLoad %550 
                                         f32 %552 = OpFMul %551 %335 
                                Private f32* %553 = OpAccessChain %222 %41 
                                                      OpStore %553 %552 
                                       f32_4 %555 = OpLoad %9 
                                       f32_2 %556 = OpVectorShuffle %555 %555 0 1 
                                       f32_2 %557 = OpFNegate %556 
                                       f32_4 %558 = OpLoad %133 
                                       f32_2 %559 = OpVectorShuffle %558 %558 0 1 
                                       f32_2 %560 = OpFAdd %557 %559 
                                                      OpStore %554 %560 
                                Private f32* %561 = OpAccessChain %554 %50 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %554 %41 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFDiv %562 %564 
                                                      OpStore %306 %565 
                                         f32 %567 = OpLoad %306 
                                         f32 %568 = OpExtInst %1 4 %567 
                                         f32 %569 = OpExtInst %1 37 %568 %49 
                                                      OpStore %566 %569 
                                         f32 %570 = OpLoad %306 
                                         f32 %571 = OpExtInst %1 4 %570 
                                         f32 %572 = OpExtInst %1 40 %571 %49 
                                Private f32* %573 = OpAccessChain %367 %41 
                                                      OpStore %573 %572 
                                Private f32* %574 = OpAccessChain %367 %41 
                                         f32 %575 = OpLoad %574 
                                         f32 %576 = OpFDiv %49 %575 
                                Private f32* %577 = OpAccessChain %367 %41 
                                                      OpStore %577 %576 
                                         f32 %578 = OpLoad %566 
                                Private f32* %579 = OpAccessChain %367 %41 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                                      OpStore %566 %581 
                                         f32 %582 = OpLoad %566 
                                         f32 %583 = OpLoad %566 
                                         f32 %584 = OpFMul %582 %583 
                                Private f32* %585 = OpAccessChain %367 %41 
                                                      OpStore %585 %584 
                                Private f32* %586 = OpAccessChain %367 %41 
                                         f32 %587 = OpLoad %586 
                                         f32 %589 = OpFMul %587 %588 
                                         f32 %591 = OpFAdd %589 %590 
                                                      OpStore %378 %591 
                                Private f32* %592 = OpAccessChain %367 %41 
                                         f32 %593 = OpLoad %592 
                                         f32 %594 = OpLoad %378 
                                         f32 %595 = OpFMul %593 %594 
                                         f32 %597 = OpFAdd %595 %596 
                                                      OpStore %378 %597 
                                Private f32* %598 = OpAccessChain %367 %41 
                                         f32 %599 = OpLoad %598 
                                         f32 %600 = OpLoad %378 
                                         f32 %601 = OpFMul %599 %600 
                                         f32 %603 = OpFAdd %601 %602 
                                                      OpStore %378 %603 
                                Private f32* %604 = OpAccessChain %367 %41 
                                         f32 %605 = OpLoad %604 
                                         f32 %606 = OpLoad %378 
                                         f32 %607 = OpFMul %605 %606 
                                         f32 %609 = OpFAdd %607 %608 
                                Private f32* %610 = OpAccessChain %367 %41 
                                                      OpStore %610 %609 
                                         f32 %611 = OpLoad %566 
                                Private f32* %612 = OpAccessChain %367 %41 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFMul %611 %613 
                                                      OpStore %378 %614 
                                         f32 %616 = OpLoad %306 
                                         f32 %617 = OpExtInst %1 4 %616 
                                        bool %618 = OpFOrdLessThan %49 %617 
                                                      OpStore %615 %618 
                                         f32 %619 = OpLoad %378 
                                         f32 %620 = OpFMul %619 %511 
                                         f32 %622 = OpFAdd %620 %621 
                                                      OpStore %378 %622 
                                        bool %623 = OpLoad %615 
                                         f32 %624 = OpLoad %378 
                                         f32 %625 = OpSelect %623 %624 %146 
                                                      OpStore %378 %625 
                                         f32 %626 = OpLoad %566 
                                Private f32* %627 = OpAccessChain %367 %41 
                                         f32 %628 = OpLoad %627 
                                         f32 %629 = OpFMul %626 %628 
                                         f32 %630 = OpLoad %378 
                                         f32 %631 = OpFAdd %629 %630 
                                                      OpStore %566 %631 
                                         f32 %632 = OpLoad %306 
                                         f32 %633 = OpExtInst %1 37 %632 %49 
                                                      OpStore %306 %633 
                                         f32 %635 = OpLoad %306 
                                         f32 %636 = OpLoad %306 
                                         f32 %637 = OpFNegate %636 
                                        bool %638 = OpFOrdLessThan %635 %637 
                                                      OpStore %634 %638 
                                        bool %639 = OpLoad %634 
                                                      OpSelectionMerge %642 None 
                                                      OpBranchConditional %639 %641 %645 
                                             %641 = OpLabel 
                                         f32 %643 = OpLoad %566 
                                         f32 %644 = OpFNegate %643 
                                                      OpStore %640 %644 
                                                      OpBranch %642 
                                             %645 = OpLabel 
                                         f32 %646 = OpLoad %566 
                                                      OpStore %640 %646 
                                                      OpBranch %642 
                                             %642 = OpLabel 
                                         f32 %647 = OpLoad %640 
                                                      OpStore %306 %647 
                                Private f32* %648 = OpAccessChain %222 %41 
                                         f32 %649 = OpLoad %648 
                                Private f32* %650 = OpAccessChain %222 %41 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %649 %651 
                                Private f32* %653 = OpAccessChain %222 %41 
                                                      OpStore %653 %652 
                                         f32 %654 = OpLoad %306 
                                Private f32* %655 = OpAccessChain %133 %41 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFMul %654 %656 
                                                      OpStore %306 %657 
                                         f32 %658 = OpLoad %306 
                                         f32 %660 = OpFMul %658 %659 
                                                      OpStore %306 %660 
                                         f32 %661 = OpLoad %306 
                                         f32 %662 = OpExtInst %1 13 %661 
                                                      OpStore %306 %662 
                                         f32 %663 = OpLoad %306 
                                         f32 %665 = OpFMul %663 %664 
                                         f32 %666 = OpFAdd %665 %49 
                                                      OpStore %306 %666 
                                Private f32* %667 = OpAccessChain %222 %41 
                                         f32 %668 = OpLoad %667 
                                         f32 %669 = OpLoad %306 
                                         f32 %670 = OpFMul %668 %669 
                                Private f32* %671 = OpAccessChain %133 %41 
                                                      OpStore %671 %670 
                                       f32_2 %672 = OpLoad %554 
                                       f32_2 %673 = OpLoad %554 
                                         f32 %674 = OpDot %672 %673 
                                Private f32* %675 = OpAccessChain %554 %41 
                                                      OpStore %675 %674 
                                Private f32* %677 = OpAccessChain %554 %41 
                                         f32 %678 = OpLoad %677 
                                Private f32* %679 = OpAccessChain %133 %41 
                                         f32 %680 = OpLoad %679 
                                        bool %681 = OpFOrdLessThan %678 %680 
                                                      OpStore %676 %681 
                                Private f32* %682 = OpAccessChain %222 %41 
                                         f32 %683 = OpLoad %682 
                                         f32 %684 = OpFNegate %683 
                                         f32 %685 = OpLoad %306 
                                         f32 %686 = OpFMul %684 %685 
                                Private f32* %687 = OpAccessChain %554 %41 
                                         f32 %688 = OpLoad %687 
                                         f32 %689 = OpFAdd %686 %688 
                                Private f32* %690 = OpAccessChain %222 %41 
                                                      OpStore %690 %689 
                                Private f32* %691 = OpAccessChain %222 %41 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpExtInst %1 30 %692 
                                Private f32* %694 = OpAccessChain %222 %41 
                                                      OpStore %694 %693 
                                Private f32* %695 = OpAccessChain %222 %41 
                                         f32 %696 = OpLoad %695 
                                         f32 %698 = OpFMul %696 %697 
                                Private f32* %699 = OpAccessChain %222 %41 
                                                      OpStore %699 %698 
                                Private f32* %700 = OpAccessChain %222 %41 
                                         f32 %701 = OpLoad %700 
                                         f32 %702 = OpExtInst %1 29 %701 
                                Private f32* %703 = OpAccessChain %222 %41 
                                                      OpStore %703 %702 
                                        bool %704 = OpLoad %676 
                                                      OpSelectionMerge %707 None 
                                                      OpBranchConditional %704 %706 %708 
                                             %706 = OpLabel 
                                                      OpStore %705 %323 
                                                      OpBranch %707 
                                             %708 = OpLabel 
                                Private f32* %709 = OpAccessChain %222 %41 
                                         f32 %710 = OpLoad %709 
                                                      OpStore %705 %710 
                                                      OpBranch %707 
                                             %707 = OpLabel 
                                         f32 %711 = OpLoad %705 
                                Private f32* %712 = OpAccessChain %222 %41 
                                                      OpStore %712 %711 
                                Private f32* %713 = OpAccessChain %31 %41 
                                         f32 %714 = OpLoad %713 
                                         f32 %715 = OpFNegate %714 
                                         f32 %716 = OpFMul %715 %142 
                                         f32 %717 = OpFAdd %716 %49 
                                Private f32* %718 = OpAccessChain %31 %41 
                                                      OpStore %718 %717 
                                Private f32* %719 = OpAccessChain %31 %41 
                                         f32 %720 = OpLoad %719 
                                         f32 %721 = OpFMul %720 %323 
                                Uniform f32* %722 = OpAccessChain %16 %368 
                                         f32 %723 = OpLoad %722 
                                         f32 %724 = OpFNegate %723 
                                         f32 %725 = OpFAdd %721 %724 
                                Private f32* %726 = OpAccessChain %31 %41 
                                                      OpStore %726 %725 
                                Private f32* %727 = OpAccessChain %31 %41 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFAdd %728 %251 
                                Private f32* %730 = OpAccessChain %31 %41 
                                                      OpStore %730 %729 
                                Private f32* %731 = OpAccessChain %31 %41 
                                         f32 %732 = OpLoad %731 
                                         f32 %733 = OpFNegate %732 
                                         f32 %734 = OpFAdd %733 %49 
                                                      OpStore %306 %734 
                                Private f32* %735 = OpAccessChain %222 %41 
                                         f32 %736 = OpLoad %735 
                                         f32 %737 = OpLoad %306 
                                         f32 %738 = OpFMul %736 %737 
                                Private f32* %739 = OpAccessChain %31 %41 
                                         f32 %740 = OpLoad %739 
                                         f32 %741 = OpFAdd %738 %740 
                                Private f32* %742 = OpAccessChain %31 %41 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %31 %41 
                                         f32 %744 = OpLoad %743 
                                         f32 %745 = OpLoad %228 
                                         f32 %746 = OpFMul %744 %745 
                                                      OpStore %228 %746 
                                                      OpBranch %528 
                                             %528 = OpLabel 
                               Private bool* %747 = OpAccessChain %292 %50 
                                        bool %748 = OpLoad %747 
                                                      OpSelectionMerge %750 None 
                                                      OpBranchConditional %748 %749 %750 
                                             %749 = OpLabel 
                                       f32_4 %751 = OpLoad %44 
                                       f32_4 %752 = OpVectorShuffle %751 %751 0 1 0 1 
                                       f32_4 %756 = OpFAdd %752 %755 
                                                      OpStore %133 %756 
                                       f32_4 %757 = OpLoad %133 
                                       f32_2 %758 = OpVectorShuffle %757 %757 0 1 
                                         f32 %759 = OpDot %758 %56 
                                Private f32* %760 = OpAccessChain %31 %41 
                                                      OpStore %760 %759 
                                Private f32* %761 = OpAccessChain %31 %41 
                                         f32 %762 = OpLoad %761 
                                         f32 %763 = OpExtInst %1 13 %762 
                                Private f32* %764 = OpAccessChain %31 %41 
                                                      OpStore %764 %763 
                                Private f32* %765 = OpAccessChain %31 %41 
                                         f32 %766 = OpLoad %765 
                                         f32 %767 = OpFMul %766 %65 
                                Private f32* %768 = OpAccessChain %31 %41 
                                                      OpStore %768 %767 
                                Private f32* %769 = OpAccessChain %31 %41 
                                         f32 %770 = OpLoad %769 
                                         f32 %771 = OpExtInst %1 10 %770 
                                Private f32* %772 = OpAccessChain %133 %41 
                                                      OpStore %772 %771 
                                       f32_4 %773 = OpLoad %133 
                                       f32_2 %774 = OpVectorShuffle %773 %773 2 3 
                                         f32 %775 = OpDot %774 %56 
                                Private f32* %776 = OpAccessChain %31 %41 
                                                      OpStore %776 %775 
                                Private f32* %777 = OpAccessChain %31 %41 
                                         f32 %778 = OpLoad %777 
                                         f32 %779 = OpExtInst %1 13 %778 
                                Private f32* %780 = OpAccessChain %31 %41 
                                                      OpStore %780 %779 
                                Private f32* %781 = OpAccessChain %31 %41 
                                         f32 %782 = OpLoad %781 
                                         f32 %783 = OpFMul %782 %65 
                                Private f32* %784 = OpAccessChain %31 %41 
                                                      OpStore %784 %783 
                                Private f32* %785 = OpAccessChain %31 %41 
                                         f32 %786 = OpLoad %785 
                                         f32 %787 = OpExtInst %1 10 %786 
                                Private f32* %788 = OpAccessChain %133 %50 
                                                      OpStore %788 %787 
                                       f32_4 %789 = OpLoad %44 
                                       f32_2 %790 = OpVectorShuffle %789 %789 0 1 
                                       f32_2 %793 = OpFAdd %790 %792 
                                       f32_4 %794 = OpLoad %44 
                                       f32_4 %795 = OpVectorShuffle %794 %793 4 5 2 3 
                                                      OpStore %44 %795 
                                       f32_4 %796 = OpLoad %44 
                                       f32_2 %797 = OpVectorShuffle %796 %796 0 1 
                                         f32 %798 = OpDot %797 %56 
                                Private f32* %799 = OpAccessChain %31 %41 
                                                      OpStore %799 %798 
                                Private f32* %800 = OpAccessChain %31 %41 
                                         f32 %801 = OpLoad %800 
                                         f32 %802 = OpExtInst %1 13 %801 
                                Private f32* %803 = OpAccessChain %31 %41 
                                                      OpStore %803 %802 
                                Private f32* %804 = OpAccessChain %31 %41 
                                         f32 %805 = OpLoad %804 
                                         f32 %806 = OpFMul %805 %65 
                                Private f32* %807 = OpAccessChain %31 %41 
                                                      OpStore %807 %806 
                                Private f32* %808 = OpAccessChain %31 %41 
                                         f32 %809 = OpLoad %808 
                                         f32 %810 = OpExtInst %1 10 %809 
                                Private f32* %811 = OpAccessChain %31 %41 
                                                      OpStore %811 %810 
                                Private f32* %812 = OpAccessChain %31 %41 
                                         f32 %813 = OpLoad %812 
                                         f32 %814 = OpFMul %813 %335 
                                Private f32* %815 = OpAccessChain %44 %41 
                                                      OpStore %815 %814 
                                       f32_4 %817 = OpLoad %9 
                                       f32_2 %818 = OpVectorShuffle %817 %817 0 1 
                                       f32_2 %819 = OpFNegate %818 
                                       f32_4 %820 = OpLoad %133 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 1 
                                       f32_2 %822 = OpFAdd %819 %821 
                                                      OpStore %816 %822 
                                Private f32* %824 = OpAccessChain %816 %50 
                                         f32 %825 = OpLoad %824 
                                Private f32* %826 = OpAccessChain %816 %41 
                                         f32 %827 = OpLoad %826 
                                         f32 %828 = OpFDiv %825 %827 
                                                      OpStore %823 %828 
                                         f32 %829 = OpLoad %823 
                                         f32 %830 = OpExtInst %1 4 %829 
                                         f32 %831 = OpExtInst %1 37 %830 %49 
                                                      OpStore %306 %831 
                                         f32 %832 = OpLoad %823 
                                         f32 %833 = OpExtInst %1 4 %832 
                                         f32 %834 = OpExtInst %1 40 %833 %49 
                                Private f32* %835 = OpAccessChain %554 %41 
                                                      OpStore %835 %834 
                                Private f32* %836 = OpAccessChain %554 %41 
                                         f32 %837 = OpLoad %836 
                                         f32 %838 = OpFDiv %49 %837 
                                Private f32* %839 = OpAccessChain %554 %41 
                                                      OpStore %839 %838 
                                         f32 %840 = OpLoad %306 
                                Private f32* %841 = OpAccessChain %554 %41 
                                         f32 %842 = OpLoad %841 
                                         f32 %843 = OpFMul %840 %842 
                                                      OpStore %306 %843 
                                         f32 %844 = OpLoad %306 
                                         f32 %845 = OpLoad %306 
                                         f32 %846 = OpFMul %844 %845 
                                Private f32* %847 = OpAccessChain %554 %41 
                                                      OpStore %847 %846 
                                Private f32* %848 = OpAccessChain %554 %41 
                                         f32 %849 = OpLoad %848 
                                         f32 %850 = OpFMul %849 %588 
                                         f32 %851 = OpFAdd %850 %590 
                                Private f32* %852 = OpAccessChain %529 %41 
                                                      OpStore %852 %851 
                                Private f32* %853 = OpAccessChain %554 %41 
                                         f32 %854 = OpLoad %853 
                                Private f32* %855 = OpAccessChain %529 %41 
                                         f32 %856 = OpLoad %855 
                                         f32 %857 = OpFMul %854 %856 
                                         f32 %858 = OpFAdd %857 %596 
                                Private f32* %859 = OpAccessChain %529 %41 
                                                      OpStore %859 %858 
                                Private f32* %860 = OpAccessChain %554 %41 
                                         f32 %861 = OpLoad %860 
                                Private f32* %862 = OpAccessChain %529 %41 
                                         f32 %863 = OpLoad %862 
                                         f32 %864 = OpFMul %861 %863 
                                         f32 %865 = OpFAdd %864 %602 
                                Private f32* %866 = OpAccessChain %529 %41 
                                                      OpStore %866 %865 
                                Private f32* %867 = OpAccessChain %554 %41 
                                         f32 %868 = OpLoad %867 
                                Private f32* %869 = OpAccessChain %529 %41 
                                         f32 %870 = OpLoad %869 
                                         f32 %871 = OpFMul %868 %870 
                                         f32 %872 = OpFAdd %871 %608 
                                Private f32* %873 = OpAccessChain %554 %41 
                                                      OpStore %873 %872 
                                         f32 %874 = OpLoad %306 
                                Private f32* %875 = OpAccessChain %554 %41 
                                         f32 %876 = OpLoad %875 
                                         f32 %877 = OpFMul %874 %876 
                                Private f32* %878 = OpAccessChain %529 %41 
                                                      OpStore %878 %877 
                                         f32 %880 = OpLoad %823 
                                         f32 %881 = OpExtInst %1 4 %880 
                                        bool %882 = OpFOrdLessThan %49 %881 
                                                      OpStore %879 %882 
                                Private f32* %883 = OpAccessChain %529 %41 
                                         f32 %884 = OpLoad %883 
                                         f32 %885 = OpFMul %884 %511 
                                         f32 %886 = OpFAdd %885 %621 
                                Private f32* %887 = OpAccessChain %529 %41 
                                                      OpStore %887 %886 
                                        bool %888 = OpLoad %879 
                                                      OpSelectionMerge %891 None 
                                                      OpBranchConditional %888 %890 %894 
                                             %890 = OpLabel 
                                Private f32* %892 = OpAccessChain %529 %41 
                                         f32 %893 = OpLoad %892 
                                                      OpStore %889 %893 
                                                      OpBranch %891 
                                             %894 = OpLabel 
                                                      OpStore %889 %146 
                                                      OpBranch %891 
                                             %891 = OpLabel 
                                         f32 %895 = OpLoad %889 
                                Private f32* %896 = OpAccessChain %529 %41 
                                                      OpStore %896 %895 
                                         f32 %897 = OpLoad %306 
                                Private f32* %898 = OpAccessChain %554 %41 
                                         f32 %899 = OpLoad %898 
                                         f32 %900 = OpFMul %897 %899 
                                Private f32* %901 = OpAccessChain %529 %41 
                                         f32 %902 = OpLoad %901 
                                         f32 %903 = OpFAdd %900 %902 
                                                      OpStore %306 %903 
                                         f32 %904 = OpLoad %823 
                                         f32 %905 = OpExtInst %1 37 %904 %49 
                                                      OpStore %823 %905 
                                         f32 %907 = OpLoad %823 
                                         f32 %908 = OpLoad %823 
                                         f32 %909 = OpFNegate %908 
                                        bool %910 = OpFOrdLessThan %907 %909 
                                                      OpStore %906 %910 
                                        bool %911 = OpLoad %906 
                                                      OpSelectionMerge %914 None 
                                                      OpBranchConditional %911 %913 %917 
                                             %913 = OpLabel 
                                         f32 %915 = OpLoad %306 
                                         f32 %916 = OpFNegate %915 
                                                      OpStore %912 %916 
                                                      OpBranch %914 
                                             %917 = OpLabel 
                                         f32 %918 = OpLoad %306 
                                                      OpStore %912 %918 
                                                      OpBranch %914 
                                             %914 = OpLabel 
                                         f32 %919 = OpLoad %912 
                                                      OpStore %823 %919 
                                Private f32* %920 = OpAccessChain %44 %41 
                                         f32 %921 = OpLoad %920 
                                Private f32* %922 = OpAccessChain %44 %41 
                                         f32 %923 = OpLoad %922 
                                         f32 %924 = OpFMul %921 %923 
                                Private f32* %925 = OpAccessChain %44 %41 
                                                      OpStore %925 %924 
                                         f32 %926 = OpLoad %823 
                                Private f32* %927 = OpAccessChain %133 %41 
                                         f32 %928 = OpLoad %927 
                                         f32 %929 = OpFMul %926 %928 
                                                      OpStore %823 %929 
                                         f32 %930 = OpLoad %823 
                                         f32 %931 = OpFMul %930 %659 
                                                      OpStore %823 %931 
                                         f32 %932 = OpLoad %823 
                                         f32 %933 = OpExtInst %1 13 %932 
                                                      OpStore %823 %933 
                                         f32 %934 = OpLoad %823 
                                         f32 %935 = OpFMul %934 %664 
                                         f32 %936 = OpFAdd %935 %49 
                                                      OpStore %823 %936 
                                         f32 %937 = OpLoad %823 
                                Private f32* %938 = OpAccessChain %44 %41 
                                         f32 %939 = OpLoad %938 
                                         f32 %940 = OpFMul %937 %939 
                                                      OpStore %306 %940 
                                       f32_2 %941 = OpLoad %816 
                                       f32_2 %942 = OpLoad %816 
                                         f32 %943 = OpDot %941 %942 
                                Private f32* %944 = OpAccessChain %816 %41 
                                                      OpStore %944 %943 
                                Private f32* %945 = OpAccessChain %816 %41 
                                         f32 %946 = OpLoad %945 
                                         f32 %947 = OpLoad %306 
                                        bool %948 = OpFOrdLessThan %946 %947 
                               Private bool* %949 = OpAccessChain %292 %41 
                                                      OpStore %949 %948 
                                Private f32* %950 = OpAccessChain %44 %41 
                                         f32 %951 = OpLoad %950 
                                         f32 %952 = OpFNegate %951 
                                         f32 %953 = OpLoad %823 
                                         f32 %954 = OpFMul %952 %953 
                                Private f32* %955 = OpAccessChain %816 %41 
                                         f32 %956 = OpLoad %955 
                                         f32 %957 = OpFAdd %954 %956 
                                Private f32* %958 = OpAccessChain %44 %41 
                                                      OpStore %958 %957 
                                Private f32* %959 = OpAccessChain %44 %41 
                                         f32 %960 = OpLoad %959 
                                         f32 %961 = OpExtInst %1 30 %960 
                                Private f32* %962 = OpAccessChain %44 %41 
                                                      OpStore %962 %961 
                                Private f32* %963 = OpAccessChain %44 %41 
                                         f32 %964 = OpLoad %963 
                                         f32 %965 = OpFMul %964 %697 
                                Private f32* %966 = OpAccessChain %44 %41 
                                                      OpStore %966 %965 
                                Private f32* %967 = OpAccessChain %44 %41 
                                         f32 %968 = OpLoad %967 
                                         f32 %969 = OpExtInst %1 29 %968 
                                Private f32* %970 = OpAccessChain %44 %41 
                                                      OpStore %970 %969 
                               Private bool* %971 = OpAccessChain %292 %41 
                                        bool %972 = OpLoad %971 
                                                      OpSelectionMerge %975 None 
                                                      OpBranchConditional %972 %974 %976 
                                             %974 = OpLabel 
                                                      OpStore %973 %323 
                                                      OpBranch %975 
                                             %976 = OpLabel 
                                Private f32* %977 = OpAccessChain %44 %41 
                                         f32 %978 = OpLoad %977 
                                                      OpStore %973 %978 
                                                      OpBranch %975 
                                             %975 = OpLabel 
                                         f32 %979 = OpLoad %973 
                                Private f32* %980 = OpAccessChain %44 %41 
                                                      OpStore %980 %979 
                                Private f32* %981 = OpAccessChain %31 %41 
                                         f32 %982 = OpLoad %981 
                                         f32 %983 = OpFNegate %982 
                                         f32 %984 = OpFMul %983 %142 
                                         f32 %985 = OpFAdd %984 %49 
                                Private f32* %986 = OpAccessChain %31 %41 
                                                      OpStore %986 %985 
                                Private f32* %987 = OpAccessChain %31 %41 
                                         f32 %988 = OpLoad %987 
                                         f32 %989 = OpFMul %988 %323 
                                Uniform f32* %990 = OpAccessChain %16 %368 
                                         f32 %991 = OpLoad %990 
                                         f32 %992 = OpFNegate %991 
                                         f32 %993 = OpFAdd %989 %992 
                                Private f32* %994 = OpAccessChain %31 %41 
                                                      OpStore %994 %993 
                                Private f32* %995 = OpAccessChain %31 %41 
                                         f32 %996 = OpLoad %995 
                                         f32 %997 = OpFAdd %996 %251 
                                Private f32* %998 = OpAccessChain %31 %41 
                                                      OpStore %998 %997 
                                Private f32* %999 = OpAccessChain %31 %41 
                                        f32 %1000 = OpLoad %999 
                                        f32 %1001 = OpFNegate %1000 
                                        f32 %1002 = OpFAdd %1001 %49 
                               Private f32* %1003 = OpAccessChain %816 %41 
                                                      OpStore %1003 %1002 
                               Private f32* %1004 = OpAccessChain %44 %41 
                                        f32 %1005 = OpLoad %1004 
                               Private f32* %1006 = OpAccessChain %816 %41 
                                        f32 %1007 = OpLoad %1006 
                                        f32 %1008 = OpFMul %1005 %1007 
                               Private f32* %1009 = OpAccessChain %31 %41 
                                        f32 %1010 = OpLoad %1009 
                                        f32 %1011 = OpFAdd %1008 %1010 
                               Private f32* %1012 = OpAccessChain %31 %41 
                                                      OpStore %1012 %1011 
                               Private f32* %1013 = OpAccessChain %31 %41 
                                        f32 %1014 = OpLoad %1013 
                                        f32 %1015 = OpLoad %228 
                                        f32 %1016 = OpFMul %1014 %1015 
                                                      OpStore %228 %1016 
                                                      OpBranch %750 
                                             %750 = OpLabel 
                                        f32 %1017 = OpLoad %228 
                                      f32_3 %1018 = OpCompositeConstruct %1017 %1017 %1017 
                                      f32_4 %1019 = OpLoad %68 
                                      f32_3 %1020 = OpVectorShuffle %1019 %1019 0 1 2 
                                      f32_3 %1021 = OpFMul %1018 %1020 
                                      f32_4 %1022 = OpLoad %44 
                                      f32_4 %1023 = OpVectorShuffle %1022 %1021 4 5 6 3 
                                                      OpStore %44 %1023 
                        read_only Texture2D %1024 = OpLoad %107 
                                    sampler %1025 = OpLoad %111 
                 read_only Texture2DSampled %1026 = OpSampledImage %1024 %1025 
                                      f32_4 %1027 = OpLoad %9 
                                      f32_2 %1028 = OpVectorShuffle %1027 %1027 0 1 
                                      f32_4 %1029 = OpImageSampleImplicitLod %1026 %1028 
                                                      OpStore %9 %1029 
                               Private f32* %1031 = OpAccessChain %44 %1030 
                                                      OpStore %1031 %49 
                                      f32_4 %1032 = OpLoad %9 
                                      f32_4 %1033 = OpLoad %44 
                                      f32_4 %1034 = OpFNegate %1033 
                                      f32_4 %1035 = OpFAdd %1032 %1034 
                                                      OpStore %9 %1035 
                                      f32_2 %1038 = OpLoad %367 
                                      f32_4 %1039 = OpVectorShuffle %1038 %1038 1 1 1 1 
                                      f32_4 %1040 = OpLoad %9 
                                      f32_4 %1041 = OpFMul %1039 %1040 
                                      f32_4 %1042 = OpLoad %44 
                                      f32_4 %1043 = OpFAdd %1041 %1042 
                                                      OpStore %1037 %1043 
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